Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4975F3655CB
	for <arm-scmi@vger.kernel.org>; Tue, 30 Jun 2026 09:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782810404; cv=none; b=CqL9xwFu2oNdQgL3Zywdnsclv+qmMomVnN395AF6fGKdwjeFVX8/dhDXNq/8JJDpT37+AgqiTn8y9WUjrPHL8zl5lwMeFImOLLpbaWLv4BExNU49KVlHxT+qbUSuHREDjWu1L7lzGuEttl43mzt46ciOEj3nG0EWYYnLZsbCHNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782810404; c=relaxed/simple;
	bh=HBtfQ/U7iBOwsRbYqoYllme3eAUoqjVJ3OIbBCfti6g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EtKn0/stUD4Dpc8zTKlFHy2Fi/1IUwyuwbYmtipFH+g5CVE/0waGGUSiAR9UHCAgmj+7pAo3bsYUhmchuD/Adkdxq5dnJN7ZIxTnSTKvnxwSl3Glb91jo0/yeB7Xzq3Qbc2Eqh4ao69de6VRdaqdg8JHUsmFIN+d9GQhcEsnGu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WGCIw609; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WGCIw609"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12E401F00A3D;
	Tue, 30 Jun 2026 09:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782810402;
	bh=qJ0jOkL1ltEZQTlEuZlzOaSUuaAoYiJSzKQRTPeitxg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WGCIw609F1yhPJybhUKjkF98qFrccLPSi3TKVivPgJ8Bg3bUgLEEoFrBrmUBjDY4x
	 Q68cCxV+CaV9DjUPVYM+1E+q16uecAr6ajFLjm5YnjI733qiCNNaXJuY/fsdVNdx9B
	 nAGypQLFBJr5iZ9Pg7EdGhceFeX0e5Pz5kQ0S2b1ZdYscvscb6EXKQIlz5cQ46lojo
	 AuHwgzkuZyjoZmsJhIhs+aWrSNUQnY+iQaWr/9q0XZ8nBlrsCQT4tCXV0VzDdtgn+o
	 SqNvD+QAQX9XkzEy2LMU0sCv6pOB5VNXa4Chn7qql2X584nq42VUBjvgjhtxRY20p/
	 ybBsMpo3z+jHw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 30 Jun 2026 10:06:01 +0100
Subject: [PATCH 5/9] firmware: arm_scmi: Free transport channel on IDR
 failure
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-scmi_core_fixes-v1-5-f932c1e51992@kernel.org>
References: <20260630-scmi_core_fixes-v1-0-f932c1e51992@kernel.org>
In-Reply-To: <20260630-scmi_core_fixes-v1-0-f932c1e51992@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, Sashiko <sashiko-bot@kernel.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.15.2

If transport channel setup succeeds but the following IDR insertion fails,
the error path destroys the transport device and frees the channel info
without invoking the transport cleanup callback.

Call chan_free() before destroying the device so transport specific
resources such as IRQs, mailbox channels and mapped shared memory are
released consistently with the normal teardown path.

Fixes: 05a2801d8b90 ("firmware: arm_scmi: Use dedicated devices to initialize channels")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 861087b2920e..4b369b003003 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2808,6 +2808,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 			"unable to allocate SCMI idr slot err %d\n", ret);
 		/* Destroy channel and device only if created by this call. */
 		if (tdev) {
+			info->desc->ops->chan_free(prot_id, cinfo, idr);
 			scmi_device_destroy(info->dev, prot_id, name);
 			devm_kfree(info->dev, cinfo);
 		}

-- 
2.43.0

