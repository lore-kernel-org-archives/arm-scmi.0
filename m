Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C2925771
	for <arm-scmi@vger.kernel.org>; Mon, 25 May 2026 20:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779741864; cv=none; b=UvlO2umTxpJVv046EjsQ5S4f6aSvE6dMYHdfrZZsTa+8L5EK3HFdqZZ8MlXmvWIj3pmgXJj+ShJY3t9CdkRPlDrrOGHGHTtw1pjUNLPpr0xMtkS0VOnsgmNLRl8454/8ZwQMxg3MoY/+N9sXsUy1hwkXl4lw/Nk1S1RvQkjgryA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779741864; c=relaxed/simple;
	bh=ADxDFaWHrpskBUqZm5QXtSPvokyKDe9hSiWCl97d6Yo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cGjbrnHd3TQ0XhxEwgTXvvts93MKnx/P/dkutBaqu9LbdvluIJA4r42PC30h7tIraasx3FgIA5yWmpX8GIth+UuZqfER8ljc7jXYsLDjdz7WMIf/vtxLKJ/6M99xImjM27s7genFcZYOOrgETvncAI3OnGuUrba8ASFFXJweAQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XLr/3Ih/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XLr/3Ih/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F041F00A3A;
	Mon, 25 May 2026 20:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779741863;
	bh=TtkVPG4of8mRnfj2/nA6E8m6WE6AcVbVcoO1Cac3Ypg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XLr/3Ih/OXVBShrWWSTFB9XlwNwzO5ewHyBpxcKE8KAZpdv7zQJyhD1n01VTByJLF
	 3hZJUkVUZrSZ/cZ/nhWtdXf+Fhdorq4LCxpggx+pYk1Q/ngu1pV+hGIHxgW716kNRU
	 hu0zvv0iK7RqNPCeJ0oz996B/fU2GYxszqD82/puNWttBrgbDyq3a8I+e6Z/Hl4xh0
	 Q3UYgmgV9y3e79JAtsIRZ8PYsIxAevRPRrKX7qOgJEhDCtWERvh1vMrRU0M9wD1VPF
	 OZmGxHnbFrr/5Y01hSt+Z65qcufZSz5i6YL4e7neQscOo0oG/EMtdfYCL0r4DKgr94
	 t3s5sICBFmcNg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Mon, 25 May 2026 21:42:45 +0100
Subject: [PATCH v2 7/9] firmware: arm_scmi: Refactor protocol device
 creation logic
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-acpi_scmi_pcc-v2-7-4f38938d08d8@arm.com>
References: <20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com>
In-Reply-To: <20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

Refactor the protocol validation and device creation logic in
scmi_probe() into a new helper function, scmi_device_check_create(),
to improve readability and reduce code duplication.

The new helper consolidates checks for protocol ID range, implementation
availability, and duplicate activation, before invoking
scmi_create_protocol_devices(). This refactor simplifies the SCMI probe
path while preserving existing behavior.

No functional changes intended. This refactoring is required to enable
ACPI PCC transport.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 56 ++++++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 23 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 02f14167c918..47f13409dfeb 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3181,6 +3181,38 @@ static void scmi_enable_matching_quirks(struct scmi_info *info)
 			   rev->sub_vendor_id, rev->impl_ver);
 }
 
+static void scmi_device_check_create(struct fwnode_handle *fwnode, int prot_id,
+				     struct scmi_info *info)
+{
+	int ret;
+	struct device *dev = info->dev;
+	struct scmi_handle *handle = &info->handle;
+
+	if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id))
+		dev_err(dev, "Out of range protocol %d\n", prot_id);
+
+	if (!scmi_is_protocol_implemented(handle, prot_id)) {
+		dev_err(dev, "SCMI protocol %d not implemented\n",
+			prot_id);
+		return;
+	}
+
+	/*
+	 * Save this valid fwnode protocol descriptor amongst
+	 * @active_protocols for this SCMI instance.
+	 */
+	ret = idr_alloc(&info->active_protocols, fwnode,
+			prot_id, prot_id + 1, GFP_KERNEL);
+	if (ret != prot_id) {
+		dev_err(dev, "SCMI protocol %d already activated. Skip\n",
+			prot_id);
+		return;
+	}
+
+	fwnode_handle_get(fwnode);
+	scmi_create_protocol_devices(fwnode, info, prot_id, NULL);
+}
+
 static int scmi_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -3309,29 +3341,7 @@ static int scmi_probe(struct platform_device *pdev)
 		if (fwnode_property_read_u32(child, "reg", &prot_id))
 			continue;
 
-		if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id))
-			dev_err(dev, "Out of range protocol %d\n", prot_id);
-
-		if (!scmi_is_protocol_implemented(handle, prot_id)) {
-			dev_err(dev, "SCMI protocol %d not implemented\n",
-				prot_id);
-			continue;
-		}
-
-		/*
-		 * Save this valid fwnode protocol descriptor amongst
-		 * @active_protocols for this SCMI instance.
-		 */
-		ret = idr_alloc(&info->active_protocols, child,
-				prot_id, prot_id + 1, GFP_KERNEL);
-		if (ret != prot_id) {
-			dev_err(dev, "SCMI protocol %d already activated. Skip\n",
-				prot_id);
-			continue;
-		}
-
-		fwnode_handle_get(child);
-		scmi_create_protocol_devices(child, info, prot_id, NULL);
+		scmi_device_check_create(child, prot_id, info);
 	}
 
 	return 0;

-- 
2.43.0

