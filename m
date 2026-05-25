Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D427725771
	for <arm-scmi@vger.kernel.org>; Mon, 25 May 2026 20:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779741866; cv=none; b=dG0sCXkZSD/MVzkeCaRTFn35aDmvwq+pIEixPhVffoVn2ZOkqcBo7km8VYKE+hxPtCWV3KxwhbBAIltsGKOUINPE326QWqmwCelho9GRJWKgaJ332lqDdYDJ/RZ1RrPOyDnucYSL2pjEH1T5Qu/atPt+Wje4dne2Y2ugpFfIN4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779741866; c=relaxed/simple;
	bh=xf/XF0o3dwPV3Q79fM61WTrfryA92sxPgn21i1E7NIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xo+BtuvdJNpLIV0y6XvM4ltBPgkPC+7OoplHcPfQoEf9Psq+Tentgk+k+FGM4r9nEp+pwVtYAqZVV7uwlXCtonE4fUg6SAnkKgIF5yYJgzv6H+z3aOPcye7cfL7jXe1Fi1mW9v5M/5PtkmZhb2mfWuXOCpYYk9xLV7j4oYXtMJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UWWGAEiu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UWWGAEiu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 151421F00A3E;
	Mon, 25 May 2026 20:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779741865;
	bh=TlO3dB26ssu7jKkXqb9zPQxgT0qu1CiQ7R2WjUBOrto=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UWWGAEiuodS30BYeqOkUJPwMrIpWEoTEXmGZ2CTqR5HiFiiiy4LIr/XA9QwbI45jd
	 C6AFo/H+QrqiBaklUHCeEFlVOY4mjCS74+zf04Qfmu3idtqs2MORvBjNitmMimw5IF
	 Ri96Mk1wOhRbShDoD76anq9WFb+iWRXRJsoUYkrkiPWyfgpjMQGgdAGxLKQyQvmACA
	 CxtFSwv++/QY4qAFoDyvEPuhY0BNgU1MvE1y8oH1Q2D4IIf3EXi+JfrXBp8Nk9Id+O
	 pVP1JAlY0sVhNqG15m7pRBmKKFiejyijqScLGbXdd1EEgorDHg9E/5J1fuuXuyPkgu
	 kmJlkjEy2+38A==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Mon, 25 May 2026 21:42:47 +0100
Subject: [PATCH v2 9/9] firmware: arm_scmi: Initialise all protocol devices
 and transport channels
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-acpi_scmi_pcc-v2-9-4f38938d08d8@arm.com>
References: <20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com>
In-Reply-To: <20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

Unlike Device Tree, the ACPI SCMI namespace device does not provide
child fwnodes to represent each protocol. Initialise protocol
channels and devices for the ACPI SCMI protocol entries known to
the core, and let the transport channel-availability checks and
SCMI protocol implementation checks decide which ones are usable
on the platform.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 47f13409dfeb..9e25346a7eae 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2827,7 +2827,7 @@ scmi_txrx_setup(struct scmi_info *info, struct fwnode_handle *fwnode,
  */
 static int scmi_channels_setup(struct scmi_info *info)
 {
-	int ret;
+	int ret, idx;
 	struct fwnode_handle *fwnode = dev_fwnode(info->dev);
 
 	/* Initialize a common generic channel at first */
@@ -2850,6 +2850,17 @@ static int scmi_channels_setup(struct scmi_info *info)
 			return ret;
 	}
 
+	if (acpi_disabled)
+		return 0;
+
+	for (idx = 1; idx < ARRAY_SIZE(scmi_dsd_info_list); idx++) {
+		int prot_id = scmi_dsd_info_list[idx].protocol_id;
+
+		ret = scmi_txrx_setup(info, fwnode, prot_id);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
@@ -3215,7 +3226,7 @@ static void scmi_device_check_create(struct fwnode_handle *fwnode, int prot_id,
 
 static int scmi_probe(struct platform_device *pdev)
 {
-	int ret;
+	int ret, idx;
 	char *err_str = "probe failure\n";
 	struct scmi_handle *handle;
 	const struct scmi_desc *desc;
@@ -3344,6 +3355,15 @@ static int scmi_probe(struct platform_device *pdev)
 		scmi_device_check_create(child, prot_id, info);
 	}
 
+	if (acpi_disabled)
+		return 0;
+
+	for (idx = 1; idx < ARRAY_SIZE(scmi_dsd_info_list); idx++) {
+		int prot_id = scmi_dsd_info_list[idx].protocol_id;
+
+		scmi_device_check_create(dev_fwnode(dev), prot_id, info);
+	}
+
 	return 0;
 
 notification_exit:

-- 
2.43.0

