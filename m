Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E0A4EE876
	for <arm-scmi@vger.kernel.org>; Fri,  4 Sep 2026 15:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537584; cv=none; b=BcMaXLJtIb11hB1paaGftnpgXe0B1cr2+3I3KLANNeLotRnDyZQFG2cDJ2DU/K9jJ712WphGiyxClENAxQK2AQS6nBFNnw8plTBgssw69uyWRgRcUalqAstivKfvn6h3WGvxlwReHifec2yI+NPbUiLgWjnT/2CSQnFrCo+oMxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537584; c=relaxed/simple;
	bh=v/K8qQxz6qP2TTQbzWPYK8IwOtJgI2Nx1/rteBYBhDM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KXKsWBuSEzHFIpdPeP9a69crdZ2cYS9mcDrtviRrP2ZYkJ0b6zStwzMNMSXoswDvlzZ0g/fT0HrRciAvfBfOpHr3q+DXd6r+X5QuzZy7pDnYFmDO3PfpyFgR6RtDpfLsViuj3N7jbXCkMbzcVm29To1kuJ25Mz1k7tusuVilmok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LvU3p0RZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LvU3p0RZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D471F00A3F;
	Fri,  4 Sep 2026 15:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788537583;
	bh=i/HOE/EOJ4rOihR4fqi0QR/fwPq01YyK6O5FLkn4htw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LvU3p0RZvuvrmU2wuKVGN/kWiTTxZ1CQKreFmDkaQEppdB8ZpWQOzv/TEKSQ5Ep7e
	 /V54R03yp486hjCAYNbnqOm/Nga0QZOdfhqNMvvMfoacH6HNpsopHBzIm8bFOO79F1
	 yGfXlTY/BGXAFVGJK+LLn3g26pEaHAjxC8g3OEQHRk3OBP3Th8L3hzjiYuBV/dAzFk
	 jlW1w/sl8Q1umqNPRQ7bH9Rso98jxggAKI9SjtUOedGlfqhdCY5G5THxHowvMs35Vy
	 01ee0RjKx3J1PYU6vYvgqdB4Us/pOP0gDCaH9O4/Ombk1UMztPi8VufEQUOM0Kb1Ge
	 m+lzX/3CRBjjQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 04 Sep 2026 16:57:59 +0100
Subject: [PATCH v4 4/9] firmware: arm_scmi: Fall back to ACPI HID when
 "compatible" is absent
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-acpi_scmi_pcc-v4-4-6ebe9755606e@kernel.org>
References: <20260904-acpi_scmi_pcc-v4-0-6ebe9755606e@kernel.org>
In-Reply-To: <20260904-acpi_scmi_pcc-v4-0-6ebe9755606e@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-team@meta.com
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Breno Leitao <leitao@debian.org>, 
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
X-Mailer: b4 0.16.0

scmi_debugfs_common_setup() uses the "compatible" property to
populate the debugfs transport type string. ACPI-described SCMI
devices do not provide that DT property, so the string remains
NULL and debugfs setup falls through the allocation failure path.

Check the property lookup result and use the ACPI HID as the
fallback transport type when an ACPI companion is present.

All supported DT SCMI platforms are expected to provide "compatible",
so the non-ACPI fallback is not needed for normal DT operation. Keep
the explicit "unknown" fallback anyway to avoid passing NULL to
kstrdup() if that assumption is ever violated.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 7e239f52c888..51829550636f 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -16,6 +16,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/acpi.h>
 #include <linux/bitmap.h>
 #include <linux/cleanup.h>
 #include <linux/debugfs.h>
@@ -3063,6 +3064,15 @@ static void scmi_debugfs_common_cleanup(void *d)
 	kfree(dbg->type);
 }
 
+static const char *scmi_acpi_device_hid(struct acpi_device *adev)
+{
+#ifdef CONFIG_ACPI
+	return adev ? acpi_device_hid(adev) : "unknown";
+#else
+	return "unknown";
+#endif
+}
+
 static struct scmi_debug_info *scmi_debugfs_common_setup(struct scmi_info *info)
 {
 	char top_dir[16];
@@ -3080,8 +3090,10 @@ static struct scmi_debug_info *scmi_debugfs_common_setup(struct scmi_info *info)
 		return NULL;
 	}
 
-	fwnode_property_read_string(dev_fwnode(info->dev), "compatible",
-				    &c_ptr);
+	if (fwnode_property_read_string(dev_fwnode(info->dev), "compatible",
+					&c_ptr))
+		c_ptr = scmi_acpi_device_hid(ACPI_COMPANION(info->dev));
+
 	dbg->type = kstrdup(c_ptr, GFP_KERNEL);
 	if (!dbg->type) {
 		kfree(dbg->name);

-- 
2.43.0

