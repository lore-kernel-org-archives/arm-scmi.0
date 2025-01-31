Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD6CE1C242C
	for <arm-scmi@vger.kernel.org>; Fri, 31 Jan 2025 14:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738333120; cv=none; b=HiI/UZhRkSTW3UTPLiOoBdkqg+pKJG/PJqcfR3ewiwaGIfF7lCm3ST8s+ExhridnKSAauYnjy5NsvQnnK2jKQzzDrFEJvLzeTo/QE/1duaUx0J6ZX188DCg8+Knzu/uMFSvVJxg/bBXVZ5HYNx2TJ0C66hENfBJM93B+6kEvE+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738333120; c=relaxed/simple;
	bh=D4NyocUmz4nPtIrmHf+4vP6pf6IlaV3fVFxjIo+jT14=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Kxi24++cvbalzydgXRRjXOtcoEa2Te0kTl0QazzhJgRqo9+35chrVLetvdlfsut1t4EuDX/7cH1Fn1UniQB3ZIjR6kAcppPYUB5Eac/IeSGnPGJZxoRXNyl8/C+Kqbeelkyv00YT8yVvde5LMyfPRLkbieEs8F8MaO7XNAl2Arc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D2E5FEC;
	Fri, 31 Jan 2025 06:18:57 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E7A8B3F63F;
	Fri, 31 Jan 2025 06:18:30 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Xinqi Zhang <quic_xinqzhan@quicinc.com>,
	Peng Fan <peng.fan@nxp.com>,
	Guomin Chen <guomin_chen@sina.com>
Subject: [PATCH 2/3] firmware: arm_scmi: Add name and protocol id attributes
Date: Fri, 31 Jan 2025 14:18:21 +0000
Message-Id: <20250131141822.514342-2-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131141822.514342-1-sudeep.holla@arm.com>
References: <20250131141822.514342-1-sudeep.holla@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the name and the protocol id attributes to the SCMI devices on the
bus so that they are exposed to the user-space via the sysfs.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_scmi/bus.c | 38 +++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 8acf33ccfd21..862dd34eca62 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -17,6 +17,8 @@
 
 #include "common.h"
 
+#define SCMI_UEVENT_MODALIAS_FMT	"%s:%02x:%s"
+
 BLOCKING_NOTIFIER_HEAD(scmi_requested_devices_nh);
 EXPORT_SYMBOL_GPL(scmi_requested_devices_nh);
 
@@ -276,11 +278,47 @@ static void scmi_dev_remove(struct device *dev)
 		scmi_drv->remove(scmi_dev);
 }
 
+static int scmi_device_uevent(const struct device *dev, struct kobj_uevent_env *env)
+{
+	const struct scmi_device *scmi_dev = to_scmi_dev(dev);
+
+	return add_uevent_var(env, "MODALIAS=" SCMI_UEVENT_MODALIAS_FMT,
+			      dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
+			      scmi_dev->name);
+}
+
+static ssize_t protocol_id_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	struct scmi_device *scmi_dev = to_scmi_dev(dev);
+
+	return sprintf(buf, "0x%02x\n", scmi_dev->protocol_id);
+}
+static DEVICE_ATTR_RO(protocol_id);
+
+static ssize_t name_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
+{
+	struct scmi_device *scmi_dev = to_scmi_dev(dev);
+
+	return sprintf(buf, "%s\n", scmi_dev->name);
+}
+static DEVICE_ATTR_RO(name);
+
+static struct attribute *scmi_device_attributes_attrs[] = {
+	&dev_attr_protocol_id.attr,
+	&dev_attr_name.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(scmi_device_attributes);
+
 const struct bus_type scmi_bus_type = {
 	.name =	"scmi_protocol",
 	.match = scmi_dev_match,
 	.probe = scmi_dev_probe,
 	.remove = scmi_dev_remove,
+	.uevent	= scmi_device_uevent,
+	.dev_groups = scmi_device_attributes_groups,
 };
 EXPORT_SYMBOL_GPL(scmi_bus_type);
 
-- 
2.34.1

