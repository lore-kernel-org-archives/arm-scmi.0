Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D135013AF
	for <arm-scmi@vger.kernel.org>; Fri,  4 Sep 2026 15:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537590; cv=none; b=SEUvugNwgrvGt/B4pOQZ3BpTe1lkVPzA6lsVGI6OffoX6BGygmyiKonQMOXAWROHX8bcAl7cVi+5lkeDEP95cy/1kkzX/bF0/M+tZ2yuuPlLj1W/rxIijzHwGdIJxCEjJ7ydMD9MuzAFq7BdkyhegmWmWKC7z5tbixWzZcAgi4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537590; c=relaxed/simple;
	bh=2cFeuWWyykqQZHxIbmOpahk4Dov8o9DbGqwWaOgrsDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O6UarUunjYKzquXYv2h1UbStL18mv3pLOStKJ7b+NVrlTl9WY0oIeS5voJYv9fCTFpdiqO92VK3DcJ/5ezsspXtvw9tXvVz8zGpqd4WiTRhE7pyc+Nx9KMHSKkVS/YfsoKDcycK6GHRu4r8X8ozNeSppe4EEZehNkIK0PaLOIG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jkm5HAkq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jkm5HAkq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA0691F00AC4;
	Fri,  4 Sep 2026 15:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788537589;
	bh=SOvbMkTzydFknS4iiHuLQpioDhMp+4T6jEUvQZ9DkZ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Jkm5HAkqM4BaGePoxSsfteNzLegcHEA9zs7nKEAWjTfTph/p8LlRvDGNqReDoU0TE
	 zyXxaK6GDzNO8vpvwee9Nj0qoPTZ9nMY8oNCQBXC2+SLnBG3Y4id2VbfN+vEro677+
	 ySeqyAIWty8BQDoH5BRrqR1LQmq2FeWcNA3balnLE+PBM2SBwIgj0I8oCmtJVnQK21
	 zOBq1yeJx8fsCRfXISw80LmWGN1icw+oM0f5NYsx9ULCrQf7oCmumEOKmqktiTySSq
	 524iK2lMkubnPXodg9lWn8ZBKRfONkVkbfo/MzVVqOdXucEvzTmbqlnRVo0XlRti/Q
	 aHRNKTfdYfp5g==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 04 Sep 2026 16:58:04 +0100
Subject: [PATCH v4 9/9] firmware: arm_scmi: Validate PCC shared memory
 signature
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-acpi_scmi_pcc-v4-9-6ebe9755606e@kernel.org>
References: <20260904-acpi_scmi_pcc-v4-0-6ebe9755606e@kernel.org>
In-Reply-To: <20260904-acpi_scmi_pcc-v4-0-6ebe9755606e@kernel.org>
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

