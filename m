Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEAA408014
	for <arm-scmi@vger.kernel.org>; Thu,  9 Jul 2026 08:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587188; cv=none; b=ij9/JTau2rIyw6fL5MmL3drBl5w0Ax2DZXF/n6FlhLmVOrwI44G4SoZu9iMefkNGGqXfh22VH5p6EcbSmvzdZiBApoECg4DqcaSvy+wVHxpM/iM53N6zqAqh8x4h6/yGwfOqyQwCaFJhjfGz1a3B4mQlQyYPnZfGAPEsGFc8HD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587188; c=relaxed/simple;
	bh=a9mFbambzywhu9HzFZeQBSt5AFh7qQlUAzqRndKBqyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZGCfC/mJCf8mF7x8Svudo8uIGEXFcBoZzSgTqT+5eiTA/oVtB17LaflMJjklgdNYjTfp+mAEFpkoMuLbpsoufkhgh0k7D2MFKMHf0asJU97u6s17fXI2tQPCKsorrRRuk/prJ7yBpsKekQsc0HRQ8MwnJikugBa7/egoYTu+zj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqX9SMma; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lqX9SMma"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B31A1F00A3D;
	Thu,  9 Jul 2026 08:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587186;
	bh=BMcYgtRtfXBQNFN5/3iu571np71fY7h4XjMrs9Ne+MQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lqX9SMmaxNzxCfwktIGjZJnw7VVmd4wmbcLGdbt6Pqlo+599OKnS7TpPlJbgDV8Hj
	 r+Xl05ucZhwJohJp47HxTdmQYYfxAp6zsIN2vi2MZ3xzTSEe8cz3LLFbTolbxJeWV8
	 cWJ+f1UcDa1Xjg+m29A204iuasW+sScOSg4uND77MxOLM3EhLwj/2s3HAv00xKiNlW
	 7xXuaIRsFZdsB/RY3gVfWSj4GCe0ypf/ZFnXENI1qlaJnopqluVOZzD4Y2DhePeCSf
	 oD29AZ2H3RzElQ1gYef6CIH1NS6A2YCTOG6Ey1kKhirl+0wMQCidgMwP3T6kvK5lVu
	 asGk1S3lTFDuw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 09 Jul 2026 09:52:32 +0100
Subject: [PATCH v5 08/16] firmware: arm_scmi: Unregister device notifier
 before IDR teardown
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-scmi_core_fixes-v5-8-bea6a3024f05@kernel.org>
References: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
In-Reply-To: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

The requested-devices notifier looks up protocol fwnodes from the
active_protocols IDR. During remove, unregister the notifier before
releasing and destroying active_protocols so no notifier callback can race
with the IDR teardown.

Keep the bus notifier registered until after the protocol state is torn
down, matching the existing remove ordering for SCMI bus users.

Fixes: 53b8c25df708 ("firmware: arm_scmi: Add common notifier helpers")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 0d93ea3ef4d5..f607557c04ad 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3404,6 +3404,9 @@ static void scmi_remove(struct platform_device *pdev)
 	list_del(&info->node);
 	mutex_unlock(&scmi_list_mutex);
 
+	blocking_notifier_chain_unregister(&scmi_requested_devices_nh,
+					   &info->dev_req_nb);
+
 	/* Stop transport callbacks before tearing down notifications. */
 	scmi_notification_quiesce(&info->handle);
 	scmi_cleanup_txrx_channels(info);
@@ -3417,8 +3420,6 @@ static void scmi_remove(struct platform_device *pdev)
 		of_node_put(child);
 	idr_destroy(&info->active_protocols);
 
-	blocking_notifier_chain_unregister(&scmi_requested_devices_nh,
-					   &info->dev_req_nb);
 	bus_unregister_notifier(&scmi_bus_type, &info->bus_nb);
 
 	ida_free(&scmi_id, info->id);

-- 
2.43.0

