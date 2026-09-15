Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BE1439350
	for <arm-scmi@vger.kernel.org>; Tue, 15 Sep 2026 17:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491903; cv=none; b=FRkRlK0Z6DkW/bW2f9kHeW3bsqnHghxkT9493hDBH+Qtns6BdRsckHvx1EhStO/rqPXs+Xgu0ihxJ9TvUasT1esPqY+h8pnZC8huiUL4dX61Qv72fegNHdIG8KWPvZbTUhmJh7adLDFqwIMbdbRotXU4bmHSuU4XbOM38IObtj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491903; c=relaxed/simple;
	bh=iZOiX66i1fmkS1wbstpVn+r5eJwJn45lKCwRW6bqMRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gb81ev8ZU3VwlL/kGTsPWWQ0b99/6qEacsTJXPPPYB6KwXOmOtQ/dyWDtyhO8gV7xoSrltvawoBd22Y7Y/qRsiq1SKYNoN4DM9inljeYPYrnWUXqqmNb++mmAdAY+Tgo0kXiSqz2Ay4yegODlkPmGVqh5W5a0jMm21WG8aR6VU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZN+5d4e0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZN+5d4e0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F6D41F00898;
	Tue, 15 Sep 2026 17:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789491900;
	bh=fPlUF+jlmhxiJd29b0DUNFcdEsvoJFl2QvVHlxO9hLA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZN+5d4e0e+R2X8b0v1CKWc+PrTYEeMIrjYc7eU6yernE4KWS50SHeUbISxE5JYplH
	 wPhj2Kc08NpJXmwHOLG7L22R6Akq9BQBP+WBm4z5mN/bC1TALtzd8WolcYKKcmwxWP
	 vuLH3uWYJFsDoWFEfxOqLymGNLQUiPzhOj3Wwb/cIMSn2QeAPemfgnegDhnxAFGV/B
	 IDEOxgWq8V3e0MngxKPiIn+8OvGBAFdVQVIqFnqDTMCPZDFJgtfTe15VAXcee1ly90
	 SJ7Do0ScwQPTZiwtKJe+gTTggejfWAelB7DVNTNXzg+E1nqlIFb6hyzQt9/zRgIqo5
	 JmIiuOgm5j/7w==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 15 Sep 2026 18:03:36 +0100
Subject: [PATCH v5 2/9] firmware: arm_scmi: Extend transport driver macro
 to support ACPI
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-acpi_scmi_pcc-v5-2-298579e9f359@kernel.org>
References: <20260915-acpi_scmi_pcc-v5-0-298579e9f359@kernel.org>
In-Reply-To: <20260915-acpi_scmi_pcc-v5-0-298579e9f359@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-team@meta.com
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Breno Leitao <leitao@debian.org>, 
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
X-Mailer: b4 0.16.0

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

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/common.h | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index 244f4ee5b655..f172ec9a054b 100644
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
@@ -681,11 +683,18 @@ err_mem:								       \
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

