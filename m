Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0F743744A
	for <arm-scmi@vger.kernel.org>; Tue, 15 Sep 2026 17:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491907; cv=none; b=eXSVaWsYvpJZyVzxG7sPd+uIH0aMHXBYENeVGc+jgSLVmjl448KH2gFC46cBnPb0o6vSsypUDZ7tSHxIlkYW+8WLcmFHIK0C8VadP+LeE9eQ+H65lfYF98TN9TKnBgWmXgdbtz1rKL2AzkrC1LFV1D0Y5S1Ck+vlPY1JVR9LS4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491907; c=relaxed/simple;
	bh=4SU3Pb9RdGy3thnkAEbuaexsMsa9DX646UDzD9N7inA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I47G3zngXXrfUTXWMV8t8ScaUH0STcb5QCjPL8YYovTILIGmGLQTDpuUGzSCqVOuQELA+r3/7scPLQTFWnynsOFurQkFmCgoibfq8j2Ju4U3+heoRbjo8kst0HsliW7FWPcGQ0EyE0QoVyBCj/k9575KKp77WfdCHHFksDW203k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JMm8E6Bl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JMm8E6Bl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5035E1F000FF;
	Tue, 15 Sep 2026 17:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789491906;
	bh=mlvay9MyCAq1Z71HXdRB7V7aEDl4JiejQYutu9VDznU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JMm8E6BlgS0QVOE+jqkmBLxklnv/a43URZ52g6m71eP1FPs5Wbowz+mY6YiacThao
	 LLogLLxk3bElFtNHolkjJW0k8XifeLHVF6rmCxg25Ak+KfzzN0IUHdip3v8znV6NOf
	 WsWL6JKZ8Lqm/fWR89M+UQtrTwe0T06pkj66S6et8Um9FO3EuJ976sIdb1lcRjaBQv
	 CHVKCIKSJXoBTi682u8u3PQNgpp/+SgT4YPGRq5tqEofE6mJjcsFjBYMjN0H+Fdn1E
	 OPKSnpiVsP4TUuP+Katx7R++56uJyEFtS2gbWzANRKyfiKtyhrekOzJg7bh00cIXZi
	 7RJTnthoMUJtQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 15 Sep 2026 18:03:40 +0100
Subject: [PATCH v5 6/9] firmware: arm_scmi: Refactor protocol device
 creation logic
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-acpi_scmi_pcc-v5-6-298579e9f359@kernel.org>
References: <20260915-acpi_scmi_pcc-v5-0-298579e9f359@kernel.org>
In-Reply-To: <20260915-acpi_scmi_pcc-v5-0-298579e9f359@kernel.org>
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
index 19cdb59d6600..616b57237559 100644
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

