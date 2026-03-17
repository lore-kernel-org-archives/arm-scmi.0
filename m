Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E1E83F7862;
	Tue, 17 Mar 2026 16:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773766710; cv=none; b=hjk2mEkiZGEsf0XZ+91LBUzdaN0UzqDpfuamIHLZJF+4ANvjC4S6k2MiDLkj7kk0HvoebPHpdD1JtrSKyW9JwXQ7znsIlMHIXCWCBGpepIRtTkzTudsOghxC5mZtH0oECAXpE6UpBbANpF9my9abunN35mSCAgXA8msdDbOkJEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773766710; c=relaxed/simple;
	bh=FZjJT8CJ9qsobj/YpSGWK5dtL22WQRznH4sEjarDS7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TT7KQwZKDyZ3pAxlBdgZS+Oo/Ms2FqOx1HE0VBa6z3o+I0eFZTWpgfBZKWz/LRqdIMyC5bJXroxB/Gj1itGvhfZku1YfRgIJWKq4v5g9GGiqdhFpqII7Hy5ONCh7fmfAZ3feZmpyPob1f5U/r1vBJwHvDNX7sdkxRJVW1OjPhmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB00F16F2;
	Tue, 17 Mar 2026 09:58:22 -0700 (PDT)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F39633F7BD;
	Tue, 17 Mar 2026 09:58:25 -0700 (PDT)
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
	dan.carpenter@linaro.org,
	gatien.chevallier@foss.st.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [RFC PATCH 1/4] firmware: arm_scmi: Add transport instance handle
Date: Tue, 17 Mar 2026 16:58:08 +0000
Message-ID: <20260317165811.3352752-2-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317165811.3352752-1-cristian.marussi@arm.com>
References: <20260317165811.3352752-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SCMI transport drivers are initialized first and then the control is
passed to the SCMI core stack: such driver can be instantiated and
probed multiple times and some of them are part also of some external
subsytem which must be initialized upfront before the transport driver
can be deemed to be ready for operation.

Transport drivers like virtio or optee need a way to defer the core SCMI
probing till they are operational and also a way to pass back and forth
some sort of transport handle that can be used to identify the transport
instance.

Add an optional mutexed list shared between the transports and the core
to use as such mechanism.

Note that this change also allows the removal of the frown-upon trick of
registering a platform driver at the end of the probe of the transport
driver as an alternative way of probe deferral.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/common.h | 42 +++++++++++++++++++++++++++++-
 drivers/firmware/arm_scmi/driver.c | 11 ++++++--
 2 files changed, 50 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index 7c35c95fddba..0a971cf28a44 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -17,6 +17,8 @@
 #include <linux/hashtable.h>
 #include <linux/list.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/property.h>
 #include <linux/refcount.h>
 #include <linux/scmi_protocol.h>
 #include <linux/spinlock.h>
@@ -458,6 +460,31 @@ struct scmi_transport_core_operations {
 	const struct scmi_message_operations *msg;
 };
 
+/**
+ * struct scmi_transport_instance_queue  - Transport instance queue descriptor
+ * @mtx: A mutex to protect the list
+ * @head: A list head to propagate per-instance and transport specific item
+ *	  descriptors to the SCMI core in an common way
+ */
+struct scmi_transport_instance_queue {
+	/* Protect the list */
+	struct mutex mtx;
+	struct list_head head;
+};
+
+#define DEFINE_SCMI_TRANSPORT_INSTANCE_QUEUE(_instaq)			\
+struct scmi_transport_instance_queue _instaq = {			\
+	__MUTEX_INITIALIZER(_instaq.mtx),				\
+	LIST_HEAD_INIT(_instaq.head),					\
+}
+
+#define SCMI_TRANSPORT_INSTANCE_REGISTER(_item, _instaq)	\
+do {								\
+	mutex_lock(&_instaq.mtx);				\
+	list_add_tail(&(_item), &_instaq.head);			\
+	mutex_unlock(&_instaq.mtx);				\
+} while (0)
+
 /**
  * struct scmi_transport  - A structure representing a configured transport
  *
@@ -466,11 +493,13 @@ struct scmi_transport_core_operations {
  * @desc: Transport descriptor
  * @core_ops: A pointer to a pointer used by the core SCMI stack to make the
  *	      core transport operations accessible to the transports.
+ * @hndl: An optional handle to the initialized transport instance.
  */
 struct scmi_transport {
 	struct device *supplier;
 	struct scmi_desc desc;
 	struct scmi_transport_core_operations **core_ops;
+	void *hndl;
 };
 
 #define DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, __match, __core_ops)\
@@ -483,11 +512,22 @@ static void __tag##_dev_free(void *data)				       \
 									       \
 static int __tag##_probe(struct platform_device *pdev)			       \
 {									       \
+	struct scmi_transport_instance_queue *tq;			       \
+	struct scmi_transport strans = {};				       \
 	struct device *dev = &pdev->dev;				       \
 	struct platform_device *spdev;					       \
-	struct scmi_transport strans;					       \
 	int ret;							       \
 									       \
+	tq = (void *)device_get_match_data(dev);			       \
+	if (tq) {							       \
+		scoped_guard(mutex, &tq->mtx) {				       \
+			if (list_empty(&tq->head))			       \
+				return -EPROBE_DEFER;			       \
+			strans.hndl = tq->head.next;			       \
+			list_del_init(tq->head.next);			       \
+		}							       \
+	}								       \
+									       \
 	spdev = platform_device_alloc("arm-scmi", PLATFORM_DEVID_AUTO);	       \
 	if (!spdev)							       \
 		return -ENOMEM;						       \
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 3e76a3204ba4..69361385be61 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -121,6 +121,7 @@ struct scmi_protocol_instance {
  * @id: A sequence number starting from zero identifying this instance
  * @dev: Device pointer
  * @desc: SoC description for this instance
+ * @thndl: Optional transport instance handle
  * @version: SCMI revision information containing protocol version,
  *	implementation version and (sub-)vendor identification.
  * @handle: Instance of SCMI handle to send to clients
@@ -151,6 +152,7 @@ struct scmi_info {
 	int id;
 	struct device *dev;
 	const struct scmi_desc *desc;
+	void *thndl;
 	struct scmi_revision_info version;
 	struct scmi_handle handle;
 	struct scmi_xfers_info tx_minfo;
@@ -3115,7 +3117,8 @@ static int scmi_debugfs_raw_mode_setup(struct scmi_info *info)
 	return ret;
 }
 
-static const struct scmi_desc *scmi_transport_setup(struct device *dev)
+static const struct scmi_desc *
+scmi_transport_setup(struct device *dev, void **thndl)
 {
 	struct scmi_transport *trans;
 	int ret;
@@ -3162,6 +3165,8 @@ static const struct scmi_desc *scmi_transport_setup(struct device *dev)
 			 "SCMI System wide atomic threshold set to %u us\n",
 			 trans->desc.atomic_threshold);
 
+	*thndl = trans->hndl;
+
 	return &trans->desc;
 }
 
@@ -3180,6 +3185,7 @@ static void scmi_enable_matching_quirks(struct scmi_info *info)
 static int scmi_probe(struct platform_device *pdev)
 {
 	int ret;
+	void *thndl;
 	char *err_str = "probe failure\n";
 	struct scmi_handle *handle;
 	const struct scmi_desc *desc;
@@ -3188,7 +3194,7 @@ static int scmi_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *child, *np = dev->of_node;
 
-	desc = scmi_transport_setup(dev);
+	desc = scmi_transport_setup(dev, &thndl);
 	if (!desc) {
 		err_str = "transport invalid\n";
 		ret = -EINVAL;
@@ -3205,6 +3211,7 @@ static int scmi_probe(struct platform_device *pdev)
 
 	info->dev = dev;
 	info->desc = desc;
+	info->thndl = thndl;
 	info->bus_nb.notifier_call = scmi_bus_notifier;
 	info->dev_req_nb.notifier_call = scmi_device_request_notifier;
 	INIT_LIST_HEAD(&info->node);
-- 
2.53.0

