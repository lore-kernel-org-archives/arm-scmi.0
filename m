Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6683E3DBF;
	Mon,  4 May 2026 16:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777913544; cv=none; b=iQQ3aamhCbJTUwR7g/5UTgUfvZbiRDIwiZt9b52FLfz9ZHuA1wFt7/KOf9NezOgHg6bL7j326rLqxHsN3Nm0TbkjWO1UaMKF7kaH6NnqYVb4vWdoITF0eHBqqOy8HhieoIb98PTp8MZVww5i0rJAS5GyErHLsHFtp8v+qhS5E/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777913544; c=relaxed/simple;
	bh=OsQUNk3wxQb0nDBmW8OLr73j5WEYyxdcA19bMyj2+dA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UpaJ2SGUR8h7Nt+1mL0Qlyq7zWj19W6DVc61cbxDbf8ZBEm00rJwD21REYCj1xrf4V7sU6DYt6C+fQYaY4DZkNUB/MznQmDZzMJdR389pTTHIxZY94XBcE8MDboZVcu+UoBu1vbsLNxQCtlxNy9qa4RemQAXlJw0kNLvERruQH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KeZsY3t0; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KeZsY3t0"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3BB02573;
	Mon,  4 May 2026 09:52:14 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B357A3F763;
	Mon,  4 May 2026 09:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777913540; bh=OsQUNk3wxQb0nDBmW8OLr73j5WEYyxdcA19bMyj2+dA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KeZsY3t0Fek5vretZaMIXranQuza6O7axZROOA1K02YHwalK0o9xZ43eUfxuVLTUl
	 +mU74Un3kbq9w+OnJ84o73IKnVFzXUMnMXHrnSPAeG2gfO9sH73zSGPn01IeMTvQQk
	 +bbe7td6Smg5NbUvL7ri/heoiU8DWWVGyRxfERLw=
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
Subject: [PATCH v1 1/3] firmware: arm_scmi: Add transport instance handles
Date: Mon,  4 May 2026 17:52:02 +0100
Message-ID: <20260504165204.639499-2-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260504165204.639499-1-cristian.marussi@arm.com>
References: <20260504165204.639499-1-cristian.marussi@arm.com>
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
 drivers/firmware/arm_scmi/common.h | 59 +++++++++++++++++++++++++++---
 1 file changed, 54 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index 7c9617d080a0..8bb0dd1fe702 100644
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
+	void (*supplier_put)(const struct scmi_transport_handle *th,
+			     struct device *dev);
+};
+
 /**
  * struct scmi_transport  - A structure representing a configured transport
  *
@@ -480,25 +503,47 @@ struct scmi_transport {
 #define DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, __match, __core_ops)\
 static void __tag##_dev_free(void *data)				       \
 {									       \
+	const struct scmi_transport_handle *th;				       \
 	struct platform_device *spdev = data;				       \
+	struct device *dev = &spdev->dev;				       \
+									       \
+	th = device_get_match_data(dev);				       \
+	if (th)	{							       \
+		struct scmi_transport *strans;				       \
+									       \
+		strans = dev_get_platdata(dev);				       \
+		if (strans)						       \
+			th->supplier_put(th, strans->supplier);		       \
+	}								       \
 									       \
 	platform_device_unregister(spdev);				       \
 }									       \
 									       \
 static int __tag##_probe(struct platform_device *pdev)			       \
 {									       \
-	struct device *dev = &pdev->dev;				       \
-	struct platform_device *spdev;					       \
+	struct device *dev = &pdev->dev, *supplier;			       \
+	const struct scmi_transport_handle *th;				       \
 	struct scmi_transport strans;					       \
+	struct platform_device *spdev;					       \
 	int ret;							       \
 									       \
+	supplier = dev;							       \
+	th = device_get_match_data(dev);				       \
+	if (th) {							       \
+		supplier = th->supplier_get(th);			       \
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
@@ -515,6 +560,10 @@ static int __tag##_probe(struct platform_device *pdev)			       \
 									       \
 err:									       \
 	platform_device_put(spdev);					       \
+err_mem:								       \
+	if (th)								       \
+		th->supplier_put(th, supplier);				       \
+									       \
 	return ret;							       \
 }									       \
 									       \
-- 
2.53.0

