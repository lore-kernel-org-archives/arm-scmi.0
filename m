Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864194F7983
	for <arm-scmi@vger.kernel.org>; Fri,  4 Sep 2026 15:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537589; cv=none; b=AI/62viQZT3+8v6es4vYcqipAJ5bC9IH6xxSjFr0DTyXiReBnis+An0PJRl92B4VCOcEov4BXNw6N2+LgxDl5P2SD27MMcQYoZswE+SgDZ9UI5zuS6ZoNRvKUm6O0Bjzwau7Ui+ETGTs6muwsdb5QHB9pyBLjTnSFX1nSeRhu3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537589; c=relaxed/simple;
	bh=g4egQecrLOBaNu2MYb0DKN6KrfTBL4oHDL9/nh+mBHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kiKGHitKPxIG/cfi03kM6TNWDN3aOpemHPVN/oU9vjNCTXPOQ4w8Ut1++irnWjAMig1Qm5Ge4t8wOIxTb/0EfrUETqAB7J5xCcA34L9eD2On/rr9ArJQ9kldYOWIkx1h8G7x356ZHGO37xPiN5nKgPFi9ipporA5ro1TiAAiGLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oVcuQX+l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oVcuQX+l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821091F00A3E;
	Fri,  4 Sep 2026 15:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788537588;
	bh=2bYUbaRO9Ahl1mhwaZ0sPLIbJfMrA4K43hbFBF+CdxM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=oVcuQX+lyTVCS19xSWICAMUfu7vcycCdwm4ACmOAo2WOP36pyEVsMk5aL/iUYWWyP
	 qJ1It4GQF/dWOU51tjZfx5YO0o1uuNJozwXz9ur2SaeUusgOIh/6DuvwqXPm1fdK9g
	 rMiBo6Ndi5WKOPZoeOZ2O9XZLRKFRRMT/HEbM0zWJeEWGqlz4j4PpLI1SxU+SXeKul
	 kcHZnnzm375434Ft4m8lG2aWc1OL7PKOJF4B0lUStZt3f5Lwni2dPMxHUN091IJ3YK
	 l1vA9nGTsNYD0Q/4w5BXE6decK/xmW8t1jqXuc8dDdQXUejie+N5+zjXwXWRPAzGzO
	 sm/+2V04VzORQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 04 Sep 2026 16:58:03 +0100
Subject: [PATCH v4 8/9] firmware: arm_scmi: Initialise known ACPI protocol
 devices and channels
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-acpi_scmi_pcc-v4-8-6ebe9755606e@kernel.org>
References: <20260904-acpi_scmi_pcc-v4-0-6ebe9755606e@kernel.org>
In-Reply-To: <20260904-acpi_scmi_pcc-v4-0-6ebe9755606e@kernel.org>
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
 drivers/firmware/arm_scmi/driver.c | 37 +++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 10e660da440c..01117c21805d 100644
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
 		dev_err(dev, "SCMI protocol %d not implemented\n", prot_id);
 		return;
 	}
@@ -3279,7 +3296,7 @@ static void scmi_device_check_create(struct fwnode_handle *fwnode, int prot_id,
 
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

