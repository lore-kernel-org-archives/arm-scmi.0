Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A359418651
	for <arm-scmi@vger.kernel.org>; Mon,  3 Feb 2025 10:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738576940; cv=none; b=PoZtNZ13iX3wMt/buXDl6wCmpkZNUjLa4qT9d/V7wi47L1hqG6yoNrp39UDRwt6ENM4t+SXr/45X13vvSpLrysaZ/KvUXyQuXgX9G3dDyOdqVju/bg4gX+nvf1cCdp3RPTp/GxZ/MZJmNI36YqKFeaVGysxw6u2XTyMRUW83fvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738576940; c=relaxed/simple;
	bh=N+xPfTjZyMCBKMhrv5VN6jd91IlcqHhn4toM2uP+Kd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BHptZT5U1/0EHkAHAtwK/juvE0LO5JuylzMyPGfp6sRhbbuzBuKi4EloVY3z3qfJllhHfnhBHIFdIpE3KpNHt5BGx6UDkmuDYJm37DKnZ+4GyOVfB5ZVWyO5vzySqaQKxIbPMlsxgDmYtXG66wOe+iUcul5BWcvZRIBLNknYo+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3488F11FB;
	Mon,  3 Feb 2025 02:02:42 -0800 (PST)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCB933F63F;
	Mon,  3 Feb 2025 02:02:16 -0800 (PST)
From: Cristian Marussi <cristian.marussi@arm.com>
To: cristian.marussi@arm.com
Cc: arm-scmi@vger.kernel.org,
	guomin_chen@sina.com,
	linux-arm-kernel@lists.infradead.org,
	peng.fan@nxp.com,
	quic_xinqzhan@quicinc.com,
	sudeep.holla@arm.com
Subject: [RFC PATCH 1/2] firmware: arm_scmi: Generate aliases for SCMI modules
Date: Mon,  3 Feb 2025 10:01:53 +0000
Message-ID: <20250203100154.140877-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <Z6CNWOp8B_ghIrJt@pluto>
References: <Z6CNWOp8B_ghIrJt@pluto>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Generate aliases for SCMI modules to allow automatic module probing.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 include/linux/mod_devicetable.h   | 6 ++++++
 include/linux/scmi_protocol.h     | 6 +-----
 scripts/mod/devicetable-offsets.c | 3 +++
 scripts/mod/file2alias.c          | 9 +++++++++
 4 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 4338b1b4ac44..90c1f7bd4d1e 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -972,4 +972,10 @@ struct coreboot_device_id {
 	kernel_ulong_t driver_data;
 };
 
+/* SCMI Devices */
+struct scmi_device_id {
+	__u8 protocol_id;
+	const char *name;
+};
+
 #endif /* LINUX_MOD_DEVICETABLE_H */
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 5437275d3ac7..3d5c4b5a7dd8 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -12,6 +12,7 @@
 #include <linux/device.h>
 #include <linux/hashtable.h>
 #include <linux/log2.h>
+#include <linux/mod_devicetable.h>
 #include <linux/notifier.h>
 #include <linux/types.h>
 #include <linux/xarray.h>
@@ -1196,11 +1197,6 @@ struct scmi_device {
 
 #define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
 
-struct scmi_device_id {
-	u8 protocol_id;
-	const char *name;
-};
-
 struct scmi_driver {
 	const char *name;
 	int (*probe)(struct scmi_device *sdev);
diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
index 9c7b404defbd..58d614109fae 100644
--- a/scripts/mod/devicetable-offsets.c
+++ b/scripts/mod/devicetable-offsets.c
@@ -281,5 +281,8 @@ int main(void)
 	DEVID(coreboot_device_id);
 	DEVID_FIELD(coreboot_device_id, tag);
 
+	DEVID(scmi_device_id);
+	DEVID_FIELD(scmi_device_id, protocol_id);
+
 	return 0;
 }
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 19ec72a69e90..f86f194a1711 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -510,6 +510,14 @@ static void do_css_entry(struct module *mod, void *symval)
 	module_alias_printf(mod, false, "css:t%01X", type);
 }
 
+/* looks like: "scmi:prN" */
+static void do_scmi_entry(struct module *mod, void *symval)
+{
+	DEF_FIELD(symval, scmi_device_id, protocol_id);
+
+	module_alias_printf(mod, true, "scmi:pr%02X", protocol_id);
+}
+
 /* Looks like: "serio:tyNprNidNexN" */
 static void do_serio_entry(struct module *mod, void *symval)
 {
@@ -1471,6 +1479,7 @@ static const struct devtable devtable[] = {
 	{"usb", SIZE_usb_device_id, do_usb_entry_multi},
 	{"pnp", SIZE_pnp_device_id, do_pnp_device_entry},
 	{"pnp_card", SIZE_pnp_card_device_id, do_pnp_card_entry},
+	{"scmi", SIZE_scmi_device_id, do_scmi_entry},
 };
 
 /* Create MODULE_ALIAS() statements.
-- 
2.47.0

