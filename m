Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B2313777E;
	Sat, 15 Aug 2026 23:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786836407; cv=none; b=Vg93yKsDjm0noccxfnpNQjpA+zumC+NolqP40rJkzt22bN7b5EHUUtUPQt64juhkuvI1kxAFvTOlidafiRS8gxHDFCjjZGAsgpeqoStk2LPLQ9dOp7T3mBTaUAbzKVBobyAlabV0Ctlp7dAWDpxfqOKhSF0S1WhUt6+soUAtvVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786836407; c=relaxed/simple;
	bh=kc3I60Mwx0FL03HtD9owXVOlrlWJxSMB1oRXmHRFUqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NmbU410+iWniZFv+WHct1uvxwY8Q6b4ZDfHbDj9mnse0llHjMWmLFlnI3O2Uu31DLyJ+v8ipNfg0QnYSCw8BLEAMHetFxQRdXCg8MyoZJy3o8V9wKSaN1jzhtaAgy8YdC3MMksDpSmnaw3pqSe8c9/LPOpDsnxGMwcxju1HkLG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qjINt3RQ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qjINt3RQ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB9B51596;
	Sat, 15 Aug 2026 16:26:40 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C48D3F673;
	Sat, 15 Aug 2026 16:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786836404; bh=kc3I60Mwx0FL03HtD9owXVOlrlWJxSMB1oRXmHRFUqo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qjINt3RQxYbCd8kVUiWEMd1oDewHlqrOD92bJbn5Y5Egh9hGLkMHiun+5gvBUQlpY
	 6Qnng1tUcx3RfbBZ7UT6iDOwt0PbQytIMkH0pKpf8uwnj85UvGSoF+aHb2m5f1zsS+
	 u7mtTIdU4vrfpGOw27dT6kFbkZvzBcP5KAz5Qx9w=
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
Subject: [PATCH v10 02/24] firmware: arm_scmi: Allow registration of unknown-size events/reports
Date: Sun, 16 Aug 2026 00:25:42 +0100
Message-ID: <20260815232604.3730754-3-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260815232604.3730754-1-cristian.marussi@arm.com>
References: <20260815232604.3730754-1-cristian.marussi@arm.com>
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
v2 --> v3
 - split out of previous patch on protocol notifier
 - use max() instead of max_t()
---
 drivers/firmware/arm_scmi/notify.c | 24 +++++++++++++++++++-----
 drivers/firmware/arm_scmi/notify.h |  8 ++++++--
 2 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
index 0a192cf2deab..8995dd1b12aa 100644
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
@@ -754,7 +760,7 @@ int scmi_register_protocol_events(const struct scmi_handle *handle, u8 proto_id,
 				  const struct scmi_protocol_handle *ph,
 				  const struct scmi_protocol_events *ee)
 {
-	int i;
+	int i, max_msg_sz;
 	unsigned int num_sources;
 	size_t payld_sz = 0;
 	struct scmi_registered_events_desc *pd;
@@ -769,6 +775,8 @@ int scmi_register_protocol_events(const struct scmi_handle *handle, u8 proto_id,
 	if (!ni)
 		return -ENOMEM;
 
+	max_msg_sz = ph->hops->get_max_msg_size(ph);
+
 	/* num_sources cannot be <= 0 */
 	if (ee->num_sources) {
 		num_sources = ee->num_sources;
@@ -781,8 +789,13 @@ int scmi_register_protocol_events(const struct scmi_handle *handle, u8 proto_id,
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
@@ -811,7 +824,8 @@ int scmi_register_protocol_events(const struct scmi_handle *handle, u8 proto_id,
 		mutex_init(&r_evt->sources_mtx);
 
 		r_evt->report = devm_kzalloc(ni->handle->dev,
-					     evt->max_report_sz, GFP_KERNEL);
+					     evt->max_report_sz ?: max_msg_sz,
+					     GFP_KERNEL);
 		if (!r_evt->report)
 			return -ENOMEM;
 
diff --git a/drivers/firmware/arm_scmi/notify.h b/drivers/firmware/arm_scmi/notify.h
index 76758a736cf4..ecfa4b746487 100644
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
+ *		  Set to zero to use the maximum payload size allowed by the
+ *		  transport.
  *
  * Each SCMI protocol, during its initialization phase, can describe the events
  * it wishes to support in a few struct scmi_event and pass them to the core
-- 
2.54.0

