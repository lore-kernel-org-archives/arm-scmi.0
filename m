Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A75366DA5
	for <arm-scmi@vger.kernel.org>; Thu, 13 Aug 2026 11:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786620814; cv=none; b=Ll7mcHmrh661NuggyhZ/6cqLOJfZErLuoxEf/2W7cJhj/D/TPbUIelgTkeCRzGtPUk2JbU28fszZqOL0YpgUBy6bYsRfx6ylH6mANltHSqBGUHSg/Dw35SCpSM3FiGAdur+8+30+BST9IGmAZScBy4ATed745KZmhAVHbrLJL8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786620814; c=relaxed/simple;
	bh=DY5JeQAx65iwZ6NABghEzACOTA27FXOQthvMVgUZFLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n9mLUoSR9goBpkN8JwXzmQfF/mEEoS0tlhfzpgU1zja5lfHG3JkBsy3KtQNgDpFyysaBVf3b0OmbZD0mHjNu0WyCD4Dv3qm35LYyLwxspLMqCGLkdTHEI4BfVJkZ6zNSkinZhYaXxWPwalDHGum8lMQiocpD+uiP6mH81A3CvJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A4JBBHLB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A4JBBHLB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E666E1F00A3E;
	Thu, 13 Aug 2026 11:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786620812;
	bh=lph++7GkXhNCe09CPgw1E6pMsOs4MY7kRuOO+yDHD+A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=A4JBBHLBUjGNgT7LQl9H/aIz5zZtT0UMGxYsfwHm+m7TtFWFGpSkQ8S00lhGMpMHl
	 IRTDgtnIW85LKSWKrAwdfOtToI7JPGFr+fDwRNrzLbOBJimFsmGUYgnD3DNGQgebwZ
	 +lNngtnQ7qpN8PdZrZTGoqp9sp2jW4iujfIcFRfSrFNqnmDCJ1xYHC6b50Hz0g1jRn
	 gn9PajCF7G4DcvzF/00RmpRMS1P87rFzAq4n18dm67MwJrEbKr8TOkFNh7fBjkkoCa
	 gJD6p5AJFCAftypmIHD37g4BINiPpaPvVLt0kDsE2jKEhlmWwIrawY71+ICSzgDUGN
	 gVx4A+nvghUBw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 13 Aug 2026 12:32:57 +0100
Subject: [PATCH v3 2/9] firmware: arm_scmi: Extend transport driver macro
 to support ACPI
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-acpi_scmi_pcc-v3-2-cb6b88b4ebb3@kernel.org>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
In-Reply-To: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-team@meta.com
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15.2

Extend the SCMI transport driver helper to support ACPI-based systems.
Introduce an internal helper macro that accepts both OF and ACPI match
tables, and expose two wrappers:

  - DEFINE_SCMI_TRANSPORT_DRIVER(...) for DT/OF transports
  - DEFINE_SCMI_ACPI_TRANSPORT_DRIVER(...) for ACPI transports

For ACPI, set the generated platform_driver .acpi_match_table via
ACPI_PTR(). The ACPI wrapper relies on the firmware-node propagation
provided by the preceding change so fwnode lookups on the spawned
platform device see the correct firmware description.

Keep existing DT users unchanged while allowing transports to be probed
using struct acpi_device_id tables on ACPI platforms.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/common.h | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index cc7d11c3c1f3..0b896171faa2 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -9,6 +9,7 @@
 #ifndef _SCMI_COMMON_H
 #define _SCMI_COMMON_H
 
+#include <linux/acpi.h>
 #include <linux/bitfield.h>
 #include <linux/completion.h>
 #include <linux/device.h>
@@ -615,7 +616,8 @@ struct scmi_transport_supplier __supplier = {			\
 	.th.supplier_put = scmi_transport_supplier_put,		\
 }
 
-#define DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, __match, __core_ops)\
+#define __DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, __of_match,       \
+					__acpi_match, __core_ops)	       \
 static void __tag##_dev_free(void *data)				       \
 {									       \
 	struct platform_device *spdev = data;				       \
@@ -679,11 +681,18 @@ err_mem:								       \
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
2.43.0

