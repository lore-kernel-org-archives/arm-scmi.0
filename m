Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D28734F49C
	for <arm-scmi@vger.kernel.org>; Fri, 17 Oct 2025 13:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760707454; cv=none; b=RNcGH/6mHdnRasnpkSjzqzxEniGBpiE6L20TB72avUo4jnzYtuUnWtTCEK0PAEvOqoYfLihpEGvGvP0TeIxHxNmZe4lBn9P/u+fGWOgqUKg9HKIIE9pQo8NGEbVGocM2+jP66mSDp7XhAUemhep09Nd3SgAEl+nRdOSelGtGmYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760707454; c=relaxed/simple;
	bh=w5WatDbyciTPjfJMlfGaBWXBHDFROAgC15f5nYBWzhQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=Mb6cbNICi8yKHwAXeNcNIkZImwptm9t9PB5RLzUI1tlIPg6RoWEvbqdqYKRviJVV/DsLqpJ/pKp8KfJdMGfxJIEQUP/HI8eNEYoLDTPE44g+kL21/JinJtSBNzC5ijnvDFSQrrztG2ZlFL2ttLq0GDvdzCV75tqQPhD2jqpBiNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1985119F6;
	Fri, 17 Oct 2025 06:24:04 -0700 (PDT)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 463983F66E;
	Fri, 17 Oct 2025 06:24:11 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 17 Oct 2025 14:23:45 +0100
Subject: [PATCH 2/8] firmware: arm_scmi: Extend transport driver macro to
 support ACPI
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251017-acpi_scmi_pcc-v1-2-0adbab7709d9@arm.com>
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
In-Reply-To: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Sudeep Holla <sudeep.holla@arm.com>
X-Mailer: b4 0.14.3

Extend the SCMI transport driver helper to also support ACPI-based
systems. Introduce an internal helper macro that accepts both OF and
ACPI match tables, and expose two wrappers:

  - DEFINE_SCMI_TRANSPORT_DRIVER(...)      -> DT/OF wrapper (unchanged ABI)
  - DEFINE_SCMI_ACPI_TRANSPORT_DRIVER(...) -> ACPI wrapper

For ACPI, the generated platform_driver now sets .acpi_match_table via
ACPI_PTR() so that builds without CONFIG_ACPI remain safe (becomes NULL).
The spawned platform_device inherits the parent device’s ACPI companion
to ensure proper firmware-node association (i.e.subsequent lookups or
fwnode use see the correct firmware node).

This keeps existing DT users unchanged and continues to function as
expected while allowing transports to be probed using the structure
`acpi_device_id` tables on ACPI platforms.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_scmi/common.h | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index 911941e6885d..d038fec72360 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -9,6 +9,7 @@
 #ifndef _SCMI_COMMON_H
 #define _SCMI_COMMON_H
 
+#include <linux/acpi.h>
 #include <linux/bitfield.h>
 #include <linux/completion.h>
 #include <linux/device.h>
@@ -453,7 +454,8 @@ struct scmi_transport {
 	struct scmi_transport_core_operations **core_ops;
 };
 
-#define DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, __match, __core_ops)\
+#define __DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, __of_match,       \
+					__acpi_match, __core_ops)	       \
 static void __tag##_dev_free(void *data)				       \
 {									       \
 	struct platform_device *spdev = data;				       \
@@ -474,6 +476,7 @@ static int __tag##_probe(struct platform_device *pdev)			       \
 									       \
 	device_set_of_node_from_dev(&spdev->dev, dev);			       \
 	device_set_node(&spdev->dev, dev_fwnode(dev));			       \
+	ACPI_COMPANION_SET(&spdev->dev, ACPI_COMPANION(dev));		       \
 									       \
 	strans.supplier = dev;						       \
 	memcpy(&strans.desc, &(__desc), sizeof(strans.desc));		       \
@@ -498,11 +501,18 @@ err:									       \
 static struct platform_driver __drv = {					       \
 	.driver = {							       \
 		   .name = #__tag "_transport",				       \
-		   .of_match_table = __match,				       \
+		   .of_match_table = __of_match,			       \
+		   .acpi_match_table = ACPI_PTR(__acpi_match),		       \
 		   },							       \
 	.probe = __tag##_probe,						       \
 }
 
+#define DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, __match, __core_ops)\
+	__DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, __match, NULL, __core_ops)
+
+#define DEFINE_SCMI_ACPI_TRANSPORT_DRIVER(__tag, __drv, __desc, __match, __core_ops)\
+	__DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, NULL, __match, __core_ops)
+
 void scmi_notification_instance_data_set(const struct scmi_handle *handle,
 					 void *priv);
 void *scmi_notification_instance_data_get(const struct scmi_handle *handle);

-- 
2.34.1

