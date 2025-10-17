Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCBA0332EA3
	for <arm-scmi@vger.kernel.org>; Fri, 17 Oct 2025 13:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760707456; cv=none; b=rYfDi+q/Qjs1AMNXd4CCkkarc7bTmfxkU+IvV3PlBnvCdBmvfoBeWcIh6AoPRzN20h3qQcVQClzCBPIfXFK5UMPaAc3uAqyTzd4N6SAgwY+uF5Tt+p0kdu15SEQcT2GLWPxnuYADVEGbc6w0Y0TgoMD0HXsFYa5zlJ6/o7VFadM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760707456; c=relaxed/simple;
	bh=2Oo+wiOd1PNWvWX5wX7knEreOxV20GarqGVIDhMRUvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=bUUCoRyHQVRi+FugSDsCLLvy8VQIVbKS5m/YSVuP2/JbU46foT6hqZtisd1Dvk0TfhSPujPgkgB5jLCodhnL/vVgfzc7Jq0ztt6AdU4XpL3eTUe5y+fw9Nrc93tFb/UEtmy+GQQFq51fmQ/+ExPR9b9wWL0OoVFzQal2W1IKp0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4995C1C2B;
	Fri, 17 Oct 2025 06:24:06 -0700 (PDT)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7928E3F66E;
	Fri, 17 Oct 2025 06:24:13 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 17 Oct 2025 14:23:47 +0100
Subject: [PATCH 4/8] firmware: arm_scmi: Fall back to ACPI HID when
 "compatible" is absent
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-acpi_scmi_pcc-v1-4-0adbab7709d9@arm.com>
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
In-Reply-To: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Sudeep Holla <sudeep.holla@arm.com>
X-Mailer: b4 0.14.3

scmi_debugfs_common_setup() previously called fwnode_property_read_string()
without checking its return value, which could leave c_ptr uninitialized
and lead to kstrdup() on garbage.

Handle the failure case and use the ACPI HID via acpi_device_hid()
using ACPI_COMPANION(dev) as a fallback for ACPI-described systems.
This ensures dbg->type is either a valid string or we hit the existing
error path cleanly.

This improves robustness on non-DT platforms where "compatible" is not
present.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_scmi/driver.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index bc5fea11b5db..148b9a13d43f 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2988,8 +2988,9 @@ static struct scmi_debug_info *scmi_debugfs_common_setup(struct scmi_info *info)
 		return NULL;
 	}
 
-	fwnode_property_read_string(dev_fwnode(info->dev), "compatible",
-				    &c_ptr);
+	if (fwnode_property_read_string(dev_fwnode(info->dev), "compatible",
+					&c_ptr))
+		c_ptr = acpi_device_hid(ACPI_COMPANION(info->dev)) ?: "unknown";
 	dbg->type = kstrdup(c_ptr, GFP_KERNEL);
 	if (!dbg->type) {
 		kfree(dbg->name);

-- 
2.34.1

