Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9893937F314
	for <arm-scmi@vger.kernel.org>; Thu, 13 Aug 2026 11:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786620816; cv=none; b=HlzTpJ9AEXKzy4wSca1r3ZsMCWxV8jfMXapg2+BMqqS+HQFV/sOU8/Cx6gWYZU0lT7tnLEMD0h55lJ2pe3G+bflKTa0X/E6aRbG/ePc6VvgS+tKVq5tPvzWNX5JSjRaKZbBOoGNok1nK0ANPwqS5A9+znX0ecebjBkH106Vp2aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786620816; c=relaxed/simple;
	bh=07NhIOYIwiFY0J+boPMEfY80yLWroSkwnM7uJHTk5WU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fEIs9aqaNpFKDAhnhHUEDqYcrGjZL5PD2kt3kCfPpZn0M5JznDfsIm4kweyGoFXnyeB7pEgRt1+veQOHEinWtbvjU7bPOCbf6p/3T0Zts7rIA97VaA1laDwZC/9vY6soxbpza7yP9Sqr8xw3R3rr0P7f/3bevvVU0ybKXjo1fwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c4hKVxUu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c4hKVxUu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D3301F00A3D;
	Thu, 13 Aug 2026 11:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786620815;
	bh=MFU827lDWVGro8n3gmbWB6iOksvX3kBnB8CWUXkl5bw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=c4hKVxUuBK2CsqbnZuhjcrO82vYBB9cD3x7QvD0PzVfYAYm8zVbg4sW/NnAOjlZax
	 Pj5k3omEoIDEQD0JIqPW6BBd5xGI2tbg0SA+EOhNveWgUxnz/dlcRdqVYG3tz90uOt
	 wXf0SoXSKWkjwW+Mtb4tslD+oAvesJqQhXHocEHDgH+O1FeDRQqJGmj21tKZmOAonF
	 dl3fhArdI2pXoWkE0vAShcnz35H2dKmbuljbwZ9k1/fWB9yLFCNJ42W82aG88Q9Fmc
	 LnVbW9SEaEP20wqLIkEh42nilcHoh2eQ9ChKSjXABAp8CGaASMKMaqyj1/KJoKytwZ
	 9RiorPpQl8aSA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 13 Aug 2026 12:32:59 +0100
Subject: [PATCH v3 4/9] firmware: arm_scmi: Fall back to ACPI HID when
 "compatible" is absent
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-acpi_scmi_pcc-v3-4-cb6b88b4ebb3@kernel.org>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
In-Reply-To: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-team@meta.com
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15.2

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
index 9014723e0f7f..9ad827c6a9ab 100644
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

