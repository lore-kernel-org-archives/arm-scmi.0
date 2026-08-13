Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C883B5847
	for <arm-scmi@vger.kernel.org>; Thu, 13 Aug 2026 11:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786620822; cv=none; b=PF0Df6SIz/CWIqcubu8NgzK840kIwhdtpsdWdsA10GQtdBalQoBG+RQxI+c6s8ZRiF0czVFhZhHzvlmJucqkc/5uyCgMxAp9qkU8PgYTFMNztRTvaPo61YJGjC5juZJhfmhgrKapgfXrkGz4n9cxcSREEqL7yqEwTuHQ+7/b0Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786620822; c=relaxed/simple;
	bh=aWLumprBGsoy72lRv8x68zkWu6mKc6gVWpLkhsfLpmM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r8+dymwjzWH2GXhoKXmV4RFmQ+rDPAQSH5hVhSWNO0W53v4Y5kL9bmsFYqWSi8oDxxllR5ggkR8kR+RZNLsrvCMURh46VD07LNXdPddtO8dnniU/dpvePn9c0vITdh9tYoZaHcgT0XYWvY0vg/4jnnu7Nfl/RKBIjbAXAgev2MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SRCSlI7P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SRCSlI7P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C09BF1F00A3A;
	Thu, 13 Aug 2026 11:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786620821;
	bh=y+zdQDNzy9XwsWlPqks3FdQJfc35rE02ceOkdYN/X4E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SRCSlI7P53oA4cwNrU5q0zW+NinY5tBKh8OsuWfm1M9+LWos/Yvr2AY1X4VA7QPEa
	 LqX4BSwLKfTXaqf49rlQXDN/E+Pbf5+hVvDTbqy4kgy3TfHe0MN0eUbp807bRmPbRB
	 AJuFeOdC6uhedFYYZf2xFdqsNgyAibiTc6pzqKMmzd3er3PJSfQjVLWG8eme5iHW33
	 Ay/AQJhV9USx2DHAsqZTepw2AFGqFXaDwgP6ifMGNYdbMe9V7VDYPFCpSRFTGZusfA
	 As60PyduvXobDk4R6yg20vo2RgxUTZZHQMSVIRScobzdzSuZbDMRJcFePpljfYw5Ux
	 wZBQ6LbgmsFhg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 13 Aug 2026 12:33:04 +0100
Subject: [PATCH v3 9/9] firmware: arm_scmi: Validate PCC shared memory
 signature
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-acpi_scmi_pcc-v3-9-cb6b88b4ebb3@kernel.org>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
In-Reply-To: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-team@meta.com
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15.2

Validate the PCC shared memory signature when setting up an SCMI PCC
channel.

Reject channels whose shared memory signature does not encode
PCC_SIGNATURE combined with the PCC subspace ID, so misconfigured
firmware is caught before the transport starts using the shared memory
region.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/transports/pcc.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/transports/pcc.c b/drivers/firmware/arm_scmi/transports/pcc.c
index 337d551e3ad8..0ead0ec77162 100644
--- a/drivers/firmware/arm_scmi/transports/pcc.c
+++ b/drivers/firmware/arm_scmi/transports/pcc.c
@@ -623,8 +623,11 @@ static void rx_callback(struct mbox_client *cl, void *m)
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
@@ -632,6 +635,11 @@ static int pcc_chan_validate_shmem(struct scmi_chan_info *cinfo,
 		return -ENOSPC;
 	}
 
+	if (ioread32(&shmem->header.signature) != valid_signature) {
+		dev_err(cinfo->dev, "invalid PCC shared memory signature\n");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -667,7 +675,7 @@ static int pcc_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 		return ret;
 	}
 
-	ret = pcc_chan_validate_shmem(cinfo, smbox);
+	ret = pcc_chan_validate_shmem(cinfo, smbox, ss_id);
 	if (ret) {
 		pcc_mbox_free_channel(smbox->pchan);
 		return ret;

-- 
2.43.0

