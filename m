Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F38274C14
	for <arm-scmi@vger.kernel.org>; Wed,  1 Jul 2026 16:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924809; cv=none; b=sY2AfZohLpfgpdzQAOh/jLJsn+qg3638Z55l9Fzyp1qM5KRWVgcpScoF031f9pP1uyK3kd5sZnPfzXiATrTZFmcWgE+8KDzPs8692puqkJQ8yvlcoJmTlBD3aVakxkUF7d6tf9Ny5Cu/dq8yY9q9haxfB2MgmDcIRj1bv2TMOmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924809; c=relaxed/simple;
	bh=UdGHv+eP+WGk3Gfm8djkY0UlIr1eYCKI0JjQfXvajdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ausvQp2G85Dv77JyTGVwJFdYxWLW5GGdENpjdVVyqQ6CVoNrwb5u1Nqk3O+Nc+IVwL2exGtUYTViTyjIpRpP2wSvsOEuGA4wFFJ7adHEKy7uUKfr/1LWLkCZBtCwActqYmtsp3zjw4Y8/DM/Hq5XE4foyn/sL2XF2qhIsyBDkMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gewQFgd9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gewQFgd9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 843CF1F00A3A;
	Wed,  1 Jul 2026 16:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782924808;
	bh=FD/NU7GMm4Zv7S8veQFrmWmOgLAG1xEI2EsNyDH4suY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gewQFgd9EqTjsnKYmsow7dg2LZO13Qt3pj+0WPDLrHsyBRgWoo/eFp76FZ2Gi+9Aa
	 sQSHKV+IS6ICHSDSuKQUJSczrVSD3eWaXfUwuA1+NxSA2gj9PE0tGbMbUiSLMZqUwN
	 QyVUSbKjD+Hl9ZxP/q1hYS9b9xfTr2yuoamjfsrn+Ru1d2sCUvlhaI4OMiZOleZSqT
	 8GidHQIIXttjvpS6d6nouGeMgLQLFWKrThtg1UWSZ9is8v/zZnsLGYV2E5vRE8dXWg
	 0fTUvH17/8PdFGtzal0yu8xR+qdrQF/zhgxlJkT4G44wtyD081jmy8ZdrNQAJMSvk7
	 21lj8LxkpHwhw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 01 Jul 2026 17:52:33 +0100
Subject: [PATCH v2 12/14] firmware: arm_scmi: Reject out of range DT
 protocol IDs
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-scmi_core_fixes-v2-12-1f5e85553f73@kernel.org>
References: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
In-Reply-To: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

SCMI protocol IDs carried in message headers are limited by
MSG_PROTOCOL_ID_MASK. The DT parsing paths noticed protocol IDs
outside that range, but only logged an error and then kept processing
the invalid value.

That lets a malformed 32-bit DT reg value reach helpers which take a u8
protocol ID, where it can be truncated and/or treated as a different
protocol.

For channel setup, two different out-of-range values can also be used as
distinct IDR keys while aliasing the generated SCMI protocol identity.

Skip DT protocol nodes whose reg value does not fit the SCMI protocol ID
field before setting up channels or creating protocol devices.

Fixes: 05a2801d8b90 ("firmware: arm_scmi: Use dedicated devices to initialize channels")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index ae4b7128276b..f515b192c1bd 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2874,9 +2874,11 @@ static int scmi_channels_setup(struct scmi_info *info)
 		if (of_property_read_u32(child, "reg", &prot_id))
 			continue;
 
-		if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id))
+		if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id)) {
 			dev_err(info->dev,
 				"Out of range protocol %d\n", prot_id);
+			continue;
+		}
 
 		ret = scmi_txrx_setup(info, child, prot_id);
 		if (ret)
@@ -3341,8 +3343,10 @@ static int scmi_probe(struct platform_device *pdev)
 		if (of_property_read_u32(child, "reg", &prot_id))
 			continue;
 
-		if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id))
+		if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id)) {
 			dev_err(dev, "Out of range protocol %d\n", prot_id);
+			continue;
+		}
 
 		if (!scmi_is_protocol_implemented(handle, prot_id)) {
 			dev_err(dev, "SCMI protocol %d not implemented\n",

-- 
2.43.0

