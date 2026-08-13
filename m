Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780CC3E5A29
	for <arm-scmi@vger.kernel.org>; Thu, 13 Aug 2026 11:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786620821; cv=none; b=TS7OWMBN9jz0LYuC2nxZ+HC2fnA/gbKlMkeJX5xBcKnzSfKdfjxrBisvFbfrU8/4NNsc6m5/yhRL3Nd4VCGobnHduHhV5ZZQ+n1Oo6c1eQIPd9r5ATBlD+9k3EeMckXk9iCSnX5QHAvzmbRBNW5dMZZIPDRKJQIScjrNI0QXrgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786620821; c=relaxed/simple;
	bh=vDyq+6ZwHS3rvDARWKKqpyBXj7+HZy+N/0oEilJIuQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=erjQpqfxPonNMZwBf8cB1XN1SE1YOX8p4Mon1REW5V4qqClZ1CHSDVrgXaXFixxVVzJj98HoHrCfOvd0C6b/LkxCR+ke8niBMFuRza47QBwIFFX5Jje0rY3C0Upk5ELgmVi48GVYQftvE7AqAOvjvoaUVVy3B0eIkPtlEzb7z1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kFAQcCJw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kFAQcCJw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 859EF1F00A3D;
	Thu, 13 Aug 2026 11:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786620820;
	bh=lNopylHfZ9Mz3H0DNxb5zaJTipOuzTwGoRrYcebA7dI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kFAQcCJwWBJOuXAqbLvZjTw+2RVn/3/EefaRhjd78D3La6Ux5rxF4s3D4vX60O6vj
	 fCxsOx3XKBCdqD7UHjm4Zlf3LesfQfbdrW5GvEBJDeOurl5JJzYpM4C9dOUwUHrjt5
	 Ggiq7FbstYzPOpFyp0LP/q6VxZaq17e5+f0jjPGYBsQVuMaf621EykdwNPQuPQR2Mb
	 uOKLe2NG4bka1P4Xy3QGGG9FViUPi9d2gEDnqh+svWXfHTpJkY2inVwsjhUTLGstMD
	 DONCL3FfYR2f/OWCY5qTqbkWOipl9Tfnke5VfrqnlHSwlJBMD3meNbhnLULABdyCHy
	 NM3+9fqThSLTA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 13 Aug 2026 12:33:03 +0100
Subject: [PATCH v3 8/9] firmware: arm_scmi: Initialise known ACPI protocol
 devices and channels
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-acpi_scmi_pcc-v3-8-cb6b88b4ebb3@kernel.org>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
In-Reply-To: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-team@meta.com
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15.2

Unlike Device Tree, the ACPI SCMI namespace device does not provide
child fwnodes to represent each protocol. Iterate over the non-BASE
entries in scmi_dsd_info_list to initialize their protocol devices and
transport channels. The BASE channel and device are handled by the
common setup path.

Let the transport channel-availability and SCMI protocol implementation
checks decide which of the known protocols are usable on the platform.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 37 +++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 951ba3df6ba6..45591c971c56 100644
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
@@ -2898,6 +2898,20 @@ static int scmi_channels_setup(struct scmi_info *info)
 			return ret;
 	}
 
+	if (!is_acpi_node(fwnode))
+		return 0;
+
+	for (idx = 0; idx < ARRAY_SIZE(scmi_dsd_info_list); idx++) {
+		int prot_id = scmi_dsd_info_list[idx].protocol_id;
+
+		if (prot_id == SCMI_PROTOCOL_BASE)
+			continue;
+
+		ret = scmi_txrx_setup(info, fwnode, prot_id);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
@@ -3245,7 +3259,7 @@ static void scmi_enable_matching_quirks(struct scmi_info *info)
 }
 
 static void scmi_device_check_create(struct fwnode_handle *fwnode, int prot_id,
-				     struct scmi_info *info)
+				     struct scmi_info *info, bool report_missing)
 {
 	int ret;
 	struct device *dev = info->dev;
@@ -3257,6 +3271,9 @@ static void scmi_device_check_create(struct fwnode_handle *fwnode, int prot_id,
 	}
 
 	if (!scmi_is_protocol_implemented(handle, prot_id)) {
+		if (!report_missing)
+			return;
+
 		dev_err(dev, "SCMI protocol %d not implemented\n",
 			prot_id);
 		return;
@@ -3280,7 +3297,7 @@ static void scmi_device_check_create(struct fwnode_handle *fwnode, int prot_id,
 
 static int scmi_probe(struct platform_device *pdev)
 {
-	int ret;
+	int ret, idx;
 	char *err_str = "probe failure\n";
 	struct scmi_handle *handle;
 	const struct scmi_desc *desc;
@@ -3406,7 +3423,19 @@ static int scmi_probe(struct platform_device *pdev)
 		if (fwnode_property_read_u32(child, "reg", &prot_id))
 			continue;
 
-		scmi_device_check_create(child, prot_id, info);
+		scmi_device_check_create(child, prot_id, info, true);
+	}
+
+	if (!is_acpi_node(dev_fwnode(dev)))
+		return 0;
+
+	for (idx = 0; idx < ARRAY_SIZE(scmi_dsd_info_list); idx++) {
+		int prot_id = scmi_dsd_info_list[idx].protocol_id;
+
+		if (prot_id == SCMI_PROTOCOL_BASE)
+			continue;
+
+		scmi_device_check_create(dev_fwnode(dev), prot_id, info, false);
 	}
 
 	return 0;

-- 
2.43.0

