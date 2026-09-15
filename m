Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E2A427FB0
	for <arm-scmi@vger.kernel.org>; Tue, 15 Sep 2026 17:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491911; cv=none; b=uwljy+3y0wiO3y60a6SeHMTEk/bRHsWSaRedWZ9lfGp01wcY0sPtrF62vkXn7KylDntSbIKS3f7RTDXA7KZ4UIMbsl50yC+ojz/j/4jTkjUUMvD6uvc+snXV6vEXaun+A3iVYfZLYugvcF3Imrtt5g4gV+GQ9kiFQhWZia9ZM8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491911; c=relaxed/simple;
	bh=2cFeuWWyykqQZHxIbmOpahk4Dov8o9DbGqwWaOgrsDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F+no+3WTAXBXO3JDuS6GHGKT68Tq3eb/6xKYT3zHnDGynn+/tqdBRQy/VsBL6sL5epXcJzJtSdcMZbmvSAaxfaZ3CcGf8dhU/pyzR9hnuztXOufgkE8QQlfamyVmM03r4ICHP1H4xsUit4Sw6q7dKp6o4O9s6l7z7ngBuJkfrTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lpwiEDNc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lpwiEDNc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B6A41F00893;
	Tue, 15 Sep 2026 17:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789491910;
	bh=SOvbMkTzydFknS4iiHuLQpioDhMp+4T6jEUvQZ9DkZ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lpwiEDNcQ78ZDzHyBYqJ2INbrd5xcs0gFmdWmhR8GOwa/Kvscr5t2k+7a3Fe6KPiJ
	 wq5ETqgedyYURupoAjqDVxYJ1lKZQIub8ON6C8ocCj8LX76SQ8Uh+0VndlEq9DPx19
	 FWZKPzILw4GImh2NJFhDHqWzWukmPKqjQ6obCwMRtMxqJQBa3UUkI9CT1eDLyaC88i
	 ZT/O0NY2t4XGfiH1EEY57Gr/+Sslyc3FEbVd82YJLf526hzUg1zf5eqIpc9qEk4p7A
	 DyTL1hT2cvvf9YRyC5NBu48EiG0HRwrp7gL5L5BjDJ6Qr0NiCfU3a0BoS8zai9vD8S
	 AWOT1kezYBxNw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 15 Sep 2026 18:03:43 +0100
Subject: [PATCH v5 9/9] firmware: arm_scmi: Validate PCC shared memory
 signature
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-acpi_scmi_pcc-v5-9-298579e9f359@kernel.org>
References: <20260915-acpi_scmi_pcc-v5-0-298579e9f359@kernel.org>
In-Reply-To: <20260915-acpi_scmi_pcc-v5-0-298579e9f359@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-team@meta.com
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Breno Leitao <leitao@debian.org>, 
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
X-Mailer: b4 0.16.0

Validate the PCC shared memory signature when setting up an SCMI PCC
channel.

Reject channels whose shared memory signature does not encode
PCC_SIGNATURE combined with the PCC subspace ID, so misconfigured
firmware is caught before the transport starts using the shared memory
region.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/transports/pcc.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/transports/pcc.c b/drivers/firmware/arm_scmi/transports/pcc.c
index b7501f980d0b..86d4a097d8ec 100644
--- a/drivers/firmware/arm_scmi/transports/pcc.c
+++ b/drivers/firmware/arm_scmi/transports/pcc.c
@@ -698,8 +698,11 @@ static void rx_callback(struct mbox_client *cl, void *m)
 }
 
 static int pcc_chan_validate_shmem(struct scmi_chan_info *cinfo,
-				   struct scmi_pcc *smbox)
+				   struct scmi_pcc *smbox, int ss_id)
 {
+	struct pcc_shared_mem __iomem *shmem = smbox->pchan->shmem;
+	u32 valid_signature = ss_id + PCC_SIGNATURE;
+
 	if (smbox->pchan->shmem_size < SCMI_PCC_SHMEM_OVERHEAD ||
 	    smbox->pchan->shmem_size - SCMI_PCC_SHMEM_OVERHEAD <
 	    cinfo->max_msg_size) {
@@ -707,6 +710,11 @@ static int pcc_chan_validate_shmem(struct scmi_chan_info *cinfo,
 		return -ENOSPC;
 	}
 
+	if (ioread32(&shmem->header.signature) != valid_signature) {
+		dev_err(cinfo->dev, "invalid PCC shared memory signature\n");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -742,7 +750,7 @@ static int pcc_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 		return ret;
 	}
 
-	ret = pcc_chan_validate_shmem(cinfo, smbox);
+	ret = pcc_chan_validate_shmem(cinfo, smbox, ss_id);
 	if (ret) {
 		pcc_mbox_free_channel(smbox->pchan);
 		return ret;

-- 
2.43.0

