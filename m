Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3288D4FECE3
	for <arm-scmi@vger.kernel.org>; Fri,  4 Sep 2026 15:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537587; cv=none; b=EcphtZ82IHyKjn3hp0oZFYBmIYHY3Bn15kvsa+G6IMD96+VmyIyUMpHtZK4aacAfV2gc4xvvvZ6rQJfxx7G3/SwPl4wjhzVRJgtjbgpqbs2scqnQDKdT7fRE/rOBFZx16CYGd+XBNxFmzcWHBhBK5fUykm+hgWmlWm5ZQ/QGeRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537587; c=relaxed/simple;
	bh=iM6pHCB6tX/kmw1Hdf/CG+y3TMnpgzJgOEH0ZbH6iNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LicWuafanl0Msvi5oxDiMnjseHP9urYyfdccNdxns91H7nDwnxRUEId08WYzerjVUlurGEduP2Vp7rGMMQnBlc0jH1lVRaOyNpi24vvv8IjECLvAT/FI5w9ciGIQ86soZyOzciM7XIvWEAZiQJ7c50ruT2k3+knFZmYRrdy7U98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dVh7N8af; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dVh7N8af"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5B2E1F00A3E;
	Fri,  4 Sep 2026 15:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788537585;
	bh=hTCUafdtosdR37NQvtP9EiPMhJXK/zMhX4xZ8wUPQZc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dVh7N8afznP9HQNmTUuAkrqpvHRTJatZUtz1M+2EakkOSmRO+jjCQAUPa3TndD+e1
	 IKObpXGBZw4iGQ5Cn5h7FTp4TBvcvQKJjf59I8Im6npbuth5bpxRuieVXXbLxRHWfe
	 FrycMAT4uXG5+O2m/c2lPV3X35mwNzZQjsnJlg/cZJOq7PbIumQlssWPczghyBgbco
	 I4RQizdaUrG6ojz8m9zVakf1YKKeL7ehKd19wj6KQ21vMIpsJVTjBzq5jS+DKjzgdi
	 WtrPOvwfj98cbiusWYVu2ItVYPZac3IVVFE+uILsL1vO1oZZ6dlwITMgLsHV+hSy40
	 /XeFZ5LuXyq1A==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 04 Sep 2026 16:58:01 +0100
Subject: [PATCH v4 6/9] firmware: arm_scmi: Refactor protocol device
 creation logic
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-acpi_scmi_pcc-v4-6-6ebe9755606e@kernel.org>
References: <20260904-acpi_scmi_pcc-v4-0-6ebe9755606e@kernel.org>
In-Reply-To: <20260904-acpi_scmi_pcc-v4-0-6ebe9755606e@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-team@meta.com
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Breno Leitao <leitao@debian.org>, 
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
X-Mailer: b4 0.16.0

Move the protocol validation and device creation logic in scmi_probe()
into a reusable scmi_device_check_create() helper.

The helper centralizes checks for the protocol ID range, implementation
availability and duplicate activation before invoking
scmi_create_protocol_devices(). This preserves the existing behavior
while allowing the logic to be reused by the ACPI path, where protocol
child fwnodes are absent.

No functional change intended.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 59 ++++++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 25 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 4fbedd9be852..10e660da440c 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3244,6 +3244,39 @@ static void scmi_enable_matching_quirks(struct scmi_info *info)
 			   rev->sub_vendor_id, rev->impl_ver);
 }
 
+static void scmi_device_check_create(struct fwnode_handle *fwnode, int prot_id,
+				     struct scmi_info *info)
+{
+	int ret;
+	struct device *dev = info->dev;
+	struct scmi_handle *handle = &info->handle;
+
+	if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id)) {
+		dev_err(dev, "Out of range protocol %d\n", prot_id);
+		return;
+	}
+
+	if (!scmi_is_protocol_implemented(handle, prot_id)) {
+		dev_err(dev, "SCMI protocol %d not implemented\n", prot_id);
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
+	scmi_create_protocol_devices(fwnode_handle_get(fwnode), info, prot_id,
+				     NULL);
+}
+
 static int scmi_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -3373,31 +3406,7 @@ static int scmi_probe(struct platform_device *pdev)
 		if (fwnode_property_read_u32(child, "reg", &prot_id))
 			continue;
 
-		if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id)) {
-			dev_err(dev, "Out of range protocol %d\n", prot_id);
-			continue;
-		}
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
-		scmi_create_protocol_devices(fwnode_handle_get(child), info,
-					     prot_id, NULL);
+		scmi_device_check_create(child, prot_id, info);
 	}
 
 	return 0;

-- 
2.43.0

