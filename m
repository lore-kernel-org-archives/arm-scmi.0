Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CBBB34F49A
	for <arm-scmi@vger.kernel.org>; Fri, 17 Oct 2025 13:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760707459; cv=none; b=DXazqBrs+ikc8NR6qBLaNjYmJUYms7nVX5F+jy8Zp77UPGyyobHQZYAXVhrqM+khxy50x3fZkFzhaQOTjUJk0o7Dj5e/pQfJYpgv5Nd5+C/3ZXNcr0rOro0xj3saEOT0NRYKlHNYEXoC2Lgl1cpLbgawZF4dV69j1dXxWrsGFv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760707459; c=relaxed/simple;
	bh=S/RC8iLlPq1Ev6316+ICgWmm9kH3crykiXhDdxLcVu8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=r4lRvMqBWEg0NjJfMy+7fTF2jm89ZHdy2MJcg/FjpBbPQdYwyCgszWw82qipsXbkRBddm6RNMflRlMTTagSyYie1bX8d7hcbvFQr0mhSm+uvX8lnVkFYhyUo7MX9drkUh6HgtLp7CDbnVvZX1EEAdVK0ALlle1YSnDpdcfiowmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 698EA1C2B;
	Fri, 17 Oct 2025 06:24:10 -0700 (PDT)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 96C963F66E;
	Fri, 17 Oct 2025 06:24:17 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 17 Oct 2025 14:23:51 +0100
Subject: [PATCH 8/8] firmware: arm_scmi: Initialise all protocol devices
 and transport channels
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-acpi_scmi_pcc-v1-8-0adbab7709d9@arm.com>
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
In-Reply-To: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Sudeep Holla <sudeep.holla@arm.com>
X-Mailer: b4 0.14.3

Unlike Device Tree, the ACPI SCMI namespace device does not provide child
fwnodes to represent each protocol. To initialise all protocol devices and
their associated transport channels, we must iterate over the supported DSD
entries defined in the device.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_scmi/driver.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index f679a769fc87..9470be5de692 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2786,7 +2786,7 @@ scmi_txrx_setup(struct scmi_info *info, struct fwnode_handle *fwnode,
  */
 static int scmi_channels_setup(struct scmi_info *info)
 {
-	int ret;
+	int ret, idx;
 	struct fwnode_handle *fwnode = dev_fwnode(info->dev);
 
 	/* Initialize a common generic channel at first */
@@ -2809,6 +2809,17 @@ static int scmi_channels_setup(struct scmi_info *info)
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
 
@@ -3175,7 +3186,7 @@ static void scmi_device_check_create(struct fwnode_handle *fwnode, int prot_id,
 
 static int scmi_probe(struct platform_device *pdev)
 {
-	int ret;
+	int ret, idx;
 	char *err_str = "probe failure\n";
 	struct scmi_handle *handle;
 	const struct scmi_desc *desc;
@@ -3304,6 +3315,15 @@ static int scmi_probe(struct platform_device *pdev)
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
2.34.1

