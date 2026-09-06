Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8E941F5F5;
	Sun,  6 Sep 2026 10:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788689243; cv=none; b=SSJo+/W6UYhXSrW2ArzinbbfW4IBUylzSVGkHWdjiwn/7W4Enzggbjpfs0hUeDbs3bPJ9d5jZME+nxWmjs1b20yi0y/ohxaxo8jns2w8kQ4CKZHuEp/odR+OHIBNkHBYOoRXqqrNeYVcvubDZWdFlv+GNHehYHenCjxmN87h/jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788689243; c=relaxed/simple;
	bh=Z1zT/+qmdnYlo6v6PyvGTRruroGKs4FxS/7jYNNL1h8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P8JI+Ql4vVunlX8dwVK94d8ndibamEf07xZJzHSbk+r5dvg631hgA9dhyK+XbgcAi9l2fKdLS0OZmVB/+Md5skyPIdKJqJcXWofnCY5s4oqT5d2QhYBdnNhug59hnJsuplVnL+rVX9B7jMbOG0xfMw9Y5E0P58HXaykNutGkPOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KyN0M5Vy; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KyN0M5Vy"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E1EE1713;
	Sun,  6 Sep 2026 03:07:14 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DD1A3FA21;
	Sun,  6 Sep 2026 03:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788689237; bh=Z1zT/+qmdnYlo6v6PyvGTRruroGKs4FxS/7jYNNL1h8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KyN0M5VywQJ+IsrLTyzz7ETU5ITGGJqzNK/ijn+6wBYVFeA6UT1UL4JY1Emd0HN7c
	 3NYPs9O2k8bIujhmaCBm1PjeZR52tFUJaczNPv6AjyHHTINB3BOtqdZqOkXmI6kM+L
	 0GV9hpu94GHhQmvDlGaKug30DNZNg3i5YYKSOIIo=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	d-gole@ti.com,
	jic23@kernel.org,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	david@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [PATCH v11 02/25] firmware: arm_scmi: Allow registration of unknown-size events/reports
Date: Sun,  6 Sep 2026 11:06:00 +0100
Message-ID: <20260906100623.3488327-3-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260906100623.3488327-1-cristian.marussi@arm.com>
References: <20260906100623.3488327-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow protocols to register events with build-time unknown sizes: such
events can be declared zero-sized and let the core SCMI stack perform the
needed safe-net boundary checks based on the configured transport size.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v10 --> v11
 - account for ktime_t field when checking boundary
v2 --> v3
 - split out of previous patch on protocol notifier
 - use max() instead of max_t()
---
 drivers/firmware/arm_scmi/notify.c | 25 ++++++++++++++++++++-----
 drivers/firmware/arm_scmi/notify.h |  8 ++++++--
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
index fb60fb07c0ed..3264e1062700 100644
--- a/drivers/firmware/arm_scmi/notify.c
+++ b/drivers/firmware/arm_scmi/notify.c
@@ -595,7 +595,13 @@ int scmi_notify(const struct scmi_handle *handle, u8 proto_id, u8 evt_id,
 	if (!r_evt)
 		return -EINVAL;
 
-	if (len > r_evt->evt->max_payld_sz) {
+	/*
+	 * Events with a zero max_payld_sz are sized to be of the maximum
+	 * size allowed by the transport: no need to be size-checked here
+	 * since the transport layer would have already dropped such
+	 * over-sized messages.
+	 */
+	if (r_evt->evt->max_payld_sz && len > r_evt->evt->max_payld_sz) {
 		dev_err(handle->dev, "discard badly sized message\n");
 		return -EINVAL;
 	}
@@ -752,7 +758,7 @@ int scmi_register_protocol_events(const struct scmi_handle *handle, u8 proto_id,
 				  const struct scmi_protocol_handle *ph,
 				  const struct scmi_protocol_events *ee)
 {
-	int i;
+	int i, max_msg_sz, max_report_sz;
 	unsigned int num_sources;
 	size_t payld_sz = 0;
 	struct scmi_registered_events_desc *pd;
@@ -767,6 +773,9 @@ int scmi_register_protocol_events(const struct scmi_handle *handle, u8 proto_id,
 	if (!ni)
 		return -ENOMEM;
 
+	max_msg_sz = ph->hops->get_max_msg_size(ph);
+	max_report_sz = max_msg_sz + sizeof(ktime_t);
+
 	/* num_sources cannot be <= 0 */
 	if (ee->num_sources) {
 		num_sources = ee->num_sources;
@@ -779,8 +788,13 @@ int scmi_register_protocol_events(const struct scmi_handle *handle, u8 proto_id,
 	}
 
 	evt = ee->evts;
-	for (i = 0; i < ee->num_events; i++)
-		payld_sz = max_t(size_t, payld_sz, evt[i].max_payld_sz);
+	for (i = 0; i < ee->num_events; i++) {
+		if (evt[i].max_payld_sz == 0) {
+			payld_sz = max_msg_sz;
+			break;
+		}
+		payld_sz = max(payld_sz, evt[i].max_payld_sz);
+	}
 	payld_sz += sizeof(struct scmi_event_header);
 
 	pd = scmi_allocate_registered_events_desc(ni, proto_id, ee->queue_sz,
@@ -807,7 +821,8 @@ int scmi_register_protocol_events(const struct scmi_handle *handle, u8 proto_id,
 		mutex_init(&r_evt->sources_mtx);
 
 		r_evt->report = devm_kzalloc(ni->handle->dev,
-					     evt->max_report_sz, GFP_KERNEL);
+					     evt->max_report_sz ?: max_report_sz,
+					     GFP_KERNEL);
 		if (!r_evt->report)
 			return -ENOMEM;
 
diff --git a/drivers/firmware/arm_scmi/notify.h b/drivers/firmware/arm_scmi/notify.h
index f18f98c5ab3b..c2eb4844c7db 100644
--- a/drivers/firmware/arm_scmi/notify.h
+++ b/drivers/firmware/arm_scmi/notify.h
@@ -18,8 +18,12 @@
 /**
  * struct scmi_event  - Describes an event to be supported
  * @id: Event ID
- * @max_payld_sz: Max possible size for the payload of a notification message
- * @max_report_sz: Max possible size for the report of a notification message
+ * @max_payld_sz: Max possible size for the payload of a notification message.
+ *		  Set to zero to use the maximum payload size allowed by the
+ *		  transport.
+ * @max_report_sz: Max possible size for the report of a notification message.
+ *		   Set to zero to use the maximum payload size allowed by the
+ *		   transport plus the additional ktime_t timestamp.
  *
  * Each SCMI protocol, during its initialization phase, can describe the events
  * it wishes to support in a few struct scmi_event and pass them to the core
-- 
2.54.0

