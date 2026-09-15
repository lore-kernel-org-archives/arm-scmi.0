Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E51407563
	for <arm-scmi@vger.kernel.org>; Tue, 15 Sep 2026 17:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491911; cv=none; b=BW23x9bF+26dSebCxEvR78p0C/CpWn+dGfnN774J2Wqr22fCVrtCPFw+NJpMPuGTFSib+2yr/x3RpQPi9Lo5CWDXIDemtDdA/SwAfXyyYVKlHWxA7Az2Ht+rqgMQF5XQaW4WETkIH9+ua9k9eGt5gkxS4SKThg1cFdFELu7oRHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491911; c=relaxed/simple;
	bh=UhC0mGZk78hpg4U520V7NNllFD/o5fnLTmGa0HGzyPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m6vB87j5DeAAxlTbt2JXYNNZRGVwI3CVLiMvUru/eSD6j1CoohhFWbldLiZdq0BxQXXjhRN67oNaiRthBi/mYBHZj3sU0Sg7hwKklE9t4mHUryHeAxgjE0HSjP6qLAubPHhEWuvRxVSUL6FA5iCzgagkx4aBpoFBtVqxamqVxvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LevVmzWO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LevVmzWO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2696E1F000FF;
	Tue, 15 Sep 2026 17:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789491909;
	bh=YMJHxXVN3QKas0i+L0qW39aozjauSLnpKQ4QWP5z6ww=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LevVmzWO605Fjp0PqG2Am7SEgnN58CgxoxXTVGPNG4FHM9K0OQ+XVEam3v8LOI3Vp
	 pPU7WirAZ0hP0XCTU8lujAok9Eb3e9jOFZOzuyjhepWpCwuN6Cc/JZd9OF29PgT/0w
	 3XZPASvb1kglDX2j6c7gaahvO6noozxcb////+KCGRlwrr9tipey4hu6LCvELs1K1G
	 rTPavSNiBJwWfJJwWm/rzRHGJwZsBQqQVQuK+FRDt+bOGCUr4i0CxpMW7kpev0Iu3U
	 C9Twi993qOhQOIaCf0vt4pMn1dAfPeCCm4W8ZSLKZQHCxvFwWfkqbPcTQRn4EKpRkp
	 uEgFGs5Gqv3JQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 15 Sep 2026 18:03:42 +0100
Subject: [PATCH v5 8/9] firmware: arm_scmi: Initialise known ACPI protocol
 devices and channels
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-acpi_scmi_pcc-v5-8-298579e9f359@kernel.org>
References: <20260915-acpi_scmi_pcc-v5-0-298579e9f359@kernel.org>
In-Reply-To: <20260915-acpi_scmi_pcc-v5-0-298579e9f359@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-team@meta.com
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Breno Leitao <leitao@debian.org>, 
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
X-Mailer: b4 0.16.0

Unlike Device Tree, the ACPI SCMI namespace device does not provide
child fwnodes to represent each protocol. Iterate over the non-BASE
entries in scmi_dsd_info_list to initialize their protocol devices and
transport channels. The BASE channel and device are handled by the
common setup path.

Let the transport channel-availability and SCMI protocol implementation
checks decide which of the known protocols are usable on the platform.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 66 +++++++++++++++++++++++++++-----------
 1 file changed, 47 insertions(+), 19 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 616b57237559..c77f9534cda5 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2873,7 +2873,7 @@ scmi_txrx_setup(struct scmi_info *info, struct fwnode_handle *fwnode,
  */
 static int scmi_channels_setup(struct scmi_info *info)
 {
-	int ret;
+	int ret, idx;
 	struct fwnode_handle *fwnode = dev_fwnode(info->dev);
 
 	/* Initialize a common generic channel at first */
@@ -2881,21 +2881,34 @@ static int scmi_channels_setup(struct scmi_info *info)
 	if (ret)
 		return ret;
 
-	fwnode_for_each_available_child_node_scoped(fwnode, child) {
-		u32 prot_id;
+	if (!is_acpi_node(fwnode)) {
+		fwnode_for_each_available_child_node_scoped(fwnode, child) {
+			u32 prot_id;
+
+			if (fwnode_property_read_u32(child, "reg", &prot_id))
+				continue;
 
-		if (fwnode_property_read_u32(child, "reg", &prot_id))
-			continue;
+			if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id)) {
+				dev_err(info->dev,
+					"Out of range protocol %d\n", prot_id);
+				continue;
+			}
 
-		if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id)) {
-			dev_err(info->dev,
-				"Out of range protocol %d\n", prot_id);
-			continue;
+			ret = scmi_txrx_setup(info, child, prot_id);
+			if (ret)
+				return ret;
 		}
+	} else {
+		for (idx = 0; idx < ARRAY_SIZE(scmi_dsd_info_list); idx++) {
+			int prot_id = scmi_dsd_info_list[idx].protocol_id;
 
-		ret = scmi_txrx_setup(info, child, prot_id);
-		if (ret)
-			return ret;
+			if (prot_id == SCMI_PROTOCOL_BASE)
+				continue;
+
+			ret = scmi_txrx_setup(info, fwnode, prot_id);
+			if (ret)
+				return ret;
+		}
 	}
 
 	return 0;
@@ -3245,7 +3258,7 @@ static void scmi_enable_matching_quirks(struct scmi_info *info)
 }
 
 static void scmi_device_check_create(struct fwnode_handle *fwnode, int prot_id,
-				     struct scmi_info *info)
+				     struct scmi_info *info, bool report_missing)
 {
 	int ret;
 	struct device *dev = info->dev;
@@ -3257,6 +3270,9 @@ static void scmi_device_check_create(struct fwnode_handle *fwnode, int prot_id,
 	}
 
 	if (!scmi_is_protocol_implemented(handle, prot_id)) {
+		if (!report_missing)
+			return;
+
 		dev_err(dev, "SCMI protocol %d not implemented\n", prot_id);
 		return;
 	}
@@ -3279,7 +3295,7 @@ static void scmi_device_check_create(struct fwnode_handle *fwnode, int prot_id,
 
 static int scmi_probe(struct platform_device *pdev)
 {
-	int ret;
+	int ret, idx;
 	char *err_str = "probe failure\n";
 	struct scmi_handle *handle;
 	const struct scmi_desc *desc;
@@ -3400,13 +3416,25 @@ static int scmi_probe(struct platform_device *pdev)
 
 	scmi_enable_matching_quirks(info);
 
-	fwnode_for_each_available_child_node(dev_fwnode(dev), child) {
-		u32 prot_id;
+	if (!is_acpi_node(dev_fwnode(dev))) {
+		fwnode_for_each_available_child_node(dev_fwnode(dev), child) {
+			u32 prot_id;
 
-		if (fwnode_property_read_u32(child, "reg", &prot_id))
-			continue;
+			if (fwnode_property_read_u32(child, "reg", &prot_id))
+				continue;
 
-		scmi_device_check_create(child, prot_id, info);
+			scmi_device_check_create(child, prot_id, info, true);
+		}
+	} else {
+		for (idx = 0; idx < ARRAY_SIZE(scmi_dsd_info_list); idx++) {
+			int prot_id = scmi_dsd_info_list[idx].protocol_id;
+
+			if (prot_id == SCMI_PROTOCOL_BASE)
+				continue;
+
+			scmi_device_check_create(dev_fwnode(dev), prot_id,
+						 info, false);
+		}
 	}
 
 	return 0;

-- 
2.43.0

