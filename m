Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED0FC2F509
	for <arm-scmi@vger.kernel.org>; Mon,  3 Feb 2025 10:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738576941; cv=none; b=Chvc2n2VulGp8BIXG7FCKfLdJAt2XRH3Tm7FWQWkDhMyQDYpqYOP3mFpRCF9gdbgob9Goo/z8pOu8cETPC/7iXVlX6U3hipqSsEzMqyOBuomN6QsgLuKgCMN91l5p/fmAfuTCYbwetX90o2itHT8PW4OyezPstnmMcEC9gmW2X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738576941; c=relaxed/simple;
	bh=BwZhRREfKiO2TASwIDahNCRowfr9wotqw5tpzPEV3vE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XQvQ0Kh9/3rw6LLWNbWuuKNKZJKLFwb7dMGLlETmUoUAg3XQ1xoHhO1iO6K9TsuNsQ5Zvca8VTpk8C4OZmcgVt6QP6h96BxcO/yuhWKDabjsg35K/PbemLmlLgIqCl9PV78z86o4dRBUdI4OK8crMp1B2uHGUkZRbyNmXh1xu78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79CBD1476;
	Mon,  3 Feb 2025 02:02:43 -0800 (PST)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D6AF3F63F;
	Mon,  3 Feb 2025 02:02:17 -0800 (PST)
From: Cristian Marussi <cristian.marussi@arm.com>
To: cristian.marussi@arm.com
Cc: arm-scmi@vger.kernel.org,
	guomin_chen@sina.com,
	linux-arm-kernel@lists.infradead.org,
	peng.fan@nxp.com,
	quic_xinqzhan@quicinc.com,
	sudeep.holla@arm.com
Subject: [RFC PATCH 2/2] firmware: arm_scmi: Add bus support for autoloading
Date: Mon,  3 Feb 2025 10:01:54 +0000
Message-ID: <20250203100154.140877-2-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250203100154.140877-1-cristian.marussi@arm.com>
References: <Z6CNWOp8B_ghIrJt@pluto>
 <20250203100154.140877-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Emit proper MODALIAS uevents when SCMI devices are created and make sure
all the standard protocol devices are requested when the bus is
initialized.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/bus.c | 52 +++++++++++++++++++++++++++++----
 1 file changed, 47 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index def41fe3b161..dfa4fde2a81c 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -92,12 +92,17 @@ static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
 				phead = head;
 		}
 		list_for_each_entry(rdev, head, node) {
+			/*
+			 * HACK
+			 * We ignore requested duplicates since they could have
+			 * been pre-requested...
+			 */
 			if (!strcmp(rdev->id_table->name, id_table->name)) {
-				pr_err("Ignoring duplicate request [%d] %s\n",
-				       rdev->id_table->protocol_id,
-				       rdev->id_table->name);
-				ret = -EINVAL;
-				goto out;
+				pr_debug("Device already requested [%d] %s\n",
+				        rdev->id_table->protocol_id,
+				        rdev->id_table->name);
+				mutex_unlock(&scmi_requested_devices_mtx);
+				return 0;
 			}
 		}
 	}
@@ -274,6 +279,16 @@ static struct scmi_device *scmi_child_dev_find(struct device *parent,
 	return to_scmi_dev(dev);
 }
 
+static int scmi_dev_uevent(const struct device *dev,
+			   struct kobj_uevent_env *env)
+{
+	const struct scmi_device *sdev = to_scmi_dev(dev);
+
+	add_uevent_var(env, "MODALIAS=scmi:pr%02X", sdev->protocol_id);
+
+	return 0;
+}
+
 static int scmi_dev_probe(struct device *dev)
 {
 	struct scmi_driver *scmi_drv = to_scmi_driver(dev->driver);
@@ -297,6 +312,7 @@ static void scmi_dev_remove(struct device *dev)
 const struct bus_type scmi_bus_type = {
 	.name =	"scmi_protocol",
 	.match = scmi_dev_match,
+	.uevent	= scmi_dev_uevent,
 	.probe = scmi_dev_probe,
 	.remove = scmi_dev_remove,
 };
@@ -516,6 +532,23 @@ static void scmi_devices_unregister(void)
 	bus_for_each_dev(&scmi_bus_type, NULL, NULL, __scmi_devices_unregister);
 }
 
+/* Standard protocols table */
+static const struct scmi_device_id scmi_std_id_table[] = {
+	{ SCMI_PROTOCOL_POWER, "genpd" },
+	{ SCMI_PROTOCOL_SYSTEM, "syspower" },
+	{ SCMI_PROTOCOL_PERF, "perf" },
+	{ SCMI_PROTOCOL_PERF, "cpufreq" },
+	{ SCMI_PROTOCOL_CLOCK, "clocks" },
+	{ SCMI_PROTOCOL_SENSOR, "hwmon" },
+	{ SCMI_PROTOCOL_SENSOR, "iiodev" },
+	{ SCMI_PROTOCOL_RESET, "reset" },
+	{ SCMI_PROTOCOL_VOLTAGE,  "regulator" },
+	{ SCMI_PROTOCOL_POWERCAP, "powercap" },
+	{ SCMI_PROTOCOL_PINCTRL, "pinctrl" },
+	{ SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },
+	{ },
+};
+
 static int __init scmi_bus_init(void)
 {
 	int retval;
@@ -526,6 +559,15 @@ static int __init scmi_bus_init(void)
 
 	pr_info("SCMI protocol bus registered\n");
 
+	/* HACK pre-request ALL standard protocol devices */
+	retval = scmi_protocol_table_register(scmi_std_id_table);
+	if (retval) {
+		bus_unregister(&scmi_bus_type);
+		return retval;
+	}
+
+	pr_info("SCMI standard protocols devices requested\n");
+
 	return retval;
 }
 subsys_initcall(scmi_bus_init);
-- 
2.47.0

