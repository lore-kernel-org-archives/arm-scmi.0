Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF9036F8F1
	for <arm-scmi@vger.kernel.org>; Tue, 14 Jul 2026 12:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784033922; cv=none; b=KGj1NSy2IE+BwGKWgL3zggBgpAWwbeCHQBkb4kfuIRl6eFZX9ogiEFJ3Y7HRh9Vg6/IQwF7f/b6NgyvaSJCXHsCZZm+MIG/mQs0rd2OgyRcnKXoBgCmKlO1DXSN3Ao0AMfMCwVRRf9LJR0Q+e/w6hkD4X7iJjLsctSZvqeWYP/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784033922; c=relaxed/simple;
	bh=A5qlZKgYziIIHQNv8UcXHi+FTCPF60ILpGWjL+Y26+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DDlc/7CdTPHzMLrSAWFG47PrO4qIc3jRadUVLwJIlfm41tIMEEugp1EwmaNWgp6Q8oDxXTWP16aY62AO7kXnGtGgDLZjR1q/o0nlfqeS7HreW30TVgtDWK58MfnDdfWGxq8ItHCmtXm6SVltxW8m3rJi1Ib5ugb90jp4t4TCa8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VxAv4nIp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VxAv4nIp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F8FC1F00AC4;
	Tue, 14 Jul 2026 12:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784033921;
	bh=0zSo7PrGzCLiYALC1GlMvG5hbJzwSVQTtnSDa8KFyso=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VxAv4nIpn96xEEHzoakXffjhsmli/jRG92duGKyY4EGR52wTWmme2TVcY7djlhTHk
	 mR01WFSWYb16OT8Jxe68pR0c78+xwILiEbIUrJ4EXOt6MSs9klq+/wAGYE/8rhNWl8
	 iaqoZFQ72ePFeoyuY2FfR18u++LtUiClry/B6XFZ/LWcJxE2MAnzCgkGESNpp2L8GI
	 vXx/bm9Wqp7T0tqaMw+LY21VluQ6q/9qhWg9Vozad3HjvSrm+AT6WJRYyactukjYsP
	 o8smqc+sihnXNXPqIsYyduodf+8J1+55h64ip88+c8YKVP77CrULoUt/HGR5Aeyoce
	 I+2IUbi0W7F6w==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 14 Jul 2026 13:56:23 +0100
Subject: [PATCH v6 04/16] firmware: arm_scmi: Clean up channels on setup
 failure
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-scmi_core_fixes-v6-4-3afe499d46e3@kernel.org>
References: <20260714-scmi_core_fixes-v6-0-3afe499d46e3@kernel.org>
In-Reply-To: <20260714-scmi_core_fixes-v6-0-3afe499d46e3@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

scmi_channels_setup() can fail after the common BASE channel or earlier
protocol channels have already been registered in the TX/RX IDRs.

Route this failure through the existing channel cleanup label so the
transport channels, transport devices and IDR state created before the
failure are released before the probe error path frees the SCMI instance
ID.

Fixes: 05a2801d8b90 ("firmware: arm_scmi: Use dedicated devices to initialize channels")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index ec373595f955..d2af47d03b4b 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3263,7 +3263,7 @@ static int scmi_probe(struct platform_device *pdev)
 	ret = scmi_channels_setup(info);
 	if (ret) {
 		err_str = "failed to setup channels\n";
-		goto clear_ida;
+		goto clear_txrx_setup;
 	}
 
 	ret = bus_register_notifier(&scmi_bus_type, &info->bus_nb);
@@ -3379,7 +3379,6 @@ static int scmi_probe(struct platform_device *pdev)
 	scmi_notification_quiesce(&info->handle);
 	scmi_cleanup_txrx_channels(info);
 	scmi_notification_exit(&info->handle);
-clear_ida:
 	ida_free(&scmi_id, info->id);
 
 out_err:

-- 
2.43.0

