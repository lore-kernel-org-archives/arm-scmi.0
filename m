Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C8743A1E72;
	Sun, 10 May 2026 16:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778429162; cv=none; b=ZdZ8h5JqJSHYT78FBt8jJwPAjmx6Q+OMpXK0QNgkPF7YwwvWsQdZ3uouJzPSkMSL0ceYX8k6tYZ5MYRazt6SDUqUUwlQPINZa5jMhgRwmVRFlKeDLeopEXtR3m6/8kEqCsyIHkzkk6RpKwKq6NC3XR11BT2y09QDHnasrCKUuK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778429162; c=relaxed/simple;
	bh=w9BUYaJkPdlrqRsI2rYzDAZGFyxczOTFgyyyubfwW9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qAADyOVAX7scyz09rzsWwAp+wNArMc6UpiNFAVoyOxqpDoxCramre+cjfooYOwTDPu+z4+2113dvMPzMKoB6Wd/8cDagPGnvOfi04PS28iNWFFwuzHLudwGApjA7xDHRxEByht7ql0K4eI8sPdzGjg0OF366OzWLMyGBq+P8v5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=cTOicdDi; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="cTOicdDi"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B05592972;
	Sun, 10 May 2026 09:05:54 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 756863F836;
	Sun, 10 May 2026 09:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778429160; bh=w9BUYaJkPdlrqRsI2rYzDAZGFyxczOTFgyyyubfwW9I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cTOicdDiG7K6UW6wTuwcB3Wf0LetuVK7dyjZw4US4XCbsD4wa4q8AaCOTqj/XnXCt
	 GXjTYPEEYwMzT9c2+VfKlHPLCD6woWGpmlSTUTs06QZTFCSTWbEbGpo4ZkgOZh9m0t
	 4KQhujdiQlJAxgGSi0Nc0vpZhT8LJ+F9xnTql1mg=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	philip.radford@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	gatien.chevallier@foss.st.com,
	u.kleine-koenig@baylibre.com,
	dakr@kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v2 1/4] firmware: arm_scmi: Add transport instance handles
Date: Sun, 10 May 2026 17:05:24 +0100
Message-ID: <20260510160527.3537474-2-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260510160527.3537474-1-cristian.marussi@arm.com>
References: <20260510160527.3537474-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SCMI transport drivers are initialized first and then the control is passed
to the SCMI core stack: some of these transports are dependent also on some
external subsytem which will have to be initialized upfront, before the
transport driver itself can be deemed operational.

Transport drivers like virtio or optee need a way to defer the core SCMI
probing till they are fully initialized and operational and also a way to
pass back the device reference to be used as a supplier while building the
devlink relations.

SCMI transport drivers can be probed multiple times when used in a multiple
instance configuration but the capability to carry-on with multiple probes
depends on the support provided by the underlying transport driver.

This change will also allow for the removal of the frowned-upon trick of
registering a platform driver only after the end of the transport drivers
porbe to avoid explicit probe deferrals.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v1 -> v2
 - saving *th handle into scmi_transport to simplify freeing path
 - add a return value to supplier_put
---
 drivers/firmware/arm_scmi/common.h | 52 +++++++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index 7c9617d080a0..af6f9f498e14 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -17,6 +17,7 @@
 #include <linux/hashtable.h>
 #include <linux/list.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <linux/refcount.h>
 #include <linux/scmi_protocol.h>
 #include <linux/spinlock.h>
@@ -462,6 +463,28 @@ struct scmi_transport_core_operations {
 	const struct scmi_message_operations *msg;
 };
 
+/**
+ * struct scmi_transport_handle  - Transport instance handle
+ * @supplier_get: A helper to retrieve the device descriptor, identifying the
+ *		  transport driver serving this SCMI instance, which will be
+ *		  used as a supplier for the core SCMI driver: returning an
+ *		  error here causes the probe sequence to be interrupted and
+ *		  return that same error code, so that each transport can decide
+ *		  which policy to implement by choosing an appropriate error.
+ * @supplier_put: A helper to signal that the specified transport supplier is
+ *		  no more being used and it is made available again.
+ *
+ * Note that these helpers are needed and provided only by those transports
+ * whose initialization relies on some other subsystem and whose relations to
+ * the core SCMI driver is not tracked by firmware descriptions.
+ */
+struct scmi_transport_handle {
+	struct device __must_check *(*supplier_get)
+		(const struct scmi_transport_handle *th);
+	int (*supplier_put)(const struct scmi_transport_handle *th,
+			    struct device *dev);
+};
+
 /**
  * struct scmi_transport  - A structure representing a configured transport
  *
@@ -470,35 +493,52 @@ struct scmi_transport_core_operations {
  * @desc: Transport descriptor
  * @core_ops: A pointer to a pointer used by the core SCMI stack to make the
  *	      core transport operations accessible to the transports.
+ * @th: An optional pointer to the transport handle
  */
 struct scmi_transport {
 	struct device *supplier;
 	struct scmi_desc desc;
 	struct scmi_transport_core_operations **core_ops;
+	const struct scmi_transport_handle *th;
 };
 
 #define DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, __match, __core_ops)\
 static void __tag##_dev_free(void *data)				       \
 {									       \
 	struct platform_device *spdev = data;				       \
+	struct scmi_transport *strans;					       \
+									       \
+	strans = dev_get_platdata(&spdev->dev);				       \
+	if (strans && strans->th)					       \
+		strans->th->supplier_put(strans->th, strans->supplier);	       \
 									       \
 	platform_device_unregister(spdev);				       \
 }									       \
 									       \
 static int __tag##_probe(struct platform_device *pdev)			       \
 {									       \
-	struct device *dev = &pdev->dev;				       \
+	struct device *dev = &pdev->dev, *supplier;			       \
 	struct platform_device *spdev;					       \
 	struct scmi_transport strans;					       \
 	int ret;							       \
 									       \
+	supplier = dev;							       \
+	strans.th = device_get_match_data(dev);				       \
+	if (strans.th) {						       \
+		supplier = strans.th->supplier_get(strans.th);		       \
+		if (IS_ERR(supplier))					       \
+			return PTR_ERR(supplier);			       \
+	}								       \
+									       \
 	spdev = platform_device_alloc("arm-scmi", PLATFORM_DEVID_AUTO);	       \
-	if (!spdev)							       \
-		return -ENOMEM;						       \
+	if (!spdev) {							       \
+		ret = -ENOMEM;						       \
+		goto err_mem;						       \
+	}								       \
 									       \
 	device_set_of_node_from_dev(&spdev->dev, dev);			       \
 									       \
-	strans.supplier = dev;						       \
+	strans.supplier = supplier;					       \
 	memcpy(&strans.desc, &(__desc), sizeof(strans.desc));		       \
 	strans.core_ops = &(__core_ops);				       \
 									       \
@@ -515,6 +555,10 @@ static int __tag##_probe(struct platform_device *pdev)			       \
 									       \
 err:									       \
 	platform_device_put(spdev);					       \
+err_mem:								       \
+	if (strans.th)							       \
+		strans.th->supplier_put(strans.th, supplier);			       \
+									       \
 	return ret;							       \
 }									       \
 									       \
-- 
2.53.0

