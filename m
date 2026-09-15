Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95499434E21
	for <arm-scmi@vger.kernel.org>; Tue, 15 Sep 2026 17:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491905; cv=none; b=X67ABAFw4/VCb/60C8JNFvCsbiUrjgXIQV3ZXvrtVhcygZlVgqj2+j4N1LmzNzmwFhc5SLpSkb20GDiKvUxr6Y7MNCLnz3EYDY1j8GJerrqQA/AZdf5l8bMJGo4yUxaVTSn7N+MEhYuJycYZu8xGk6pXD9bBEl3UkeLa/xW0k84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491905; c=relaxed/simple;
	bh=GoDqCjKR/CmgY3d9+9RbMmcEpqBCfAl2ToIGTqfyZrA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EmeTXwPsdQ7kmdRsEjT3k5scMmPEdydXDL5MPTYGeDh6w/8vlnQY6hmerzUpSq7cxDBH1gRoO2VNXzPLe87sRrIg9iZfplo05KvvJN8YULXFQrDT3iP54dQIkC7J61bm6cCBOI+B0BNexzHFFq0mX7FfvCtW7g888aBOs79ez1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mjZ8lDOc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mjZ8lDOc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A1E31F0089B;
	Tue, 15 Sep 2026 17:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789491903;
	bh=6n0faIBhMoLEpSRsv9bn04UWwhQ2MrwjbyLIxI2jfHA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mjZ8lDOccuCvWA4XdHD7squMqFwZ3pxR+2sStcfNHCFq+UW8Tv2WU2X4gfeHYcRmp
	 1zOuU1Dx+COpMZoU2WwAD9wc8I9riNSwRrxeAWRUlDrLZOt5QGiERnVrAAlSXSxiVq
	 OQ1ciXmuqIqwWI6pXx9oOYrZZL2ZynEeMhZp8JV9q14kfUfRDqxm+UUn91PT13eiCD
	 58htoqUminJEEfmn/IeksZeY7+t0oVn9cZZTY9jiTKb14qngH43M2fBO8wZydKkjCM
	 6NruoykN9011umvW/5ITm5SinMAD1k4x/z2zJO5u/eThzGkcimi+h3l0oE0ScUf1N2
	 quCDB9h2gPFhA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 15 Sep 2026 18:03:38 +0100
Subject: [PATCH v5 4/9] firmware: arm_scmi: Fall back to ACPI HID when
 "compatible" is absent
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-acpi_scmi_pcc-v5-4-298579e9f359@kernel.org>
References: <20260915-acpi_scmi_pcc-v5-0-298579e9f359@kernel.org>
In-Reply-To: <20260915-acpi_scmi_pcc-v5-0-298579e9f359@kernel.org>
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
index 4ca52cfb0a45..878d27bc315a 100644
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

