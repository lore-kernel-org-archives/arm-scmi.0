Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34DCF3EC81C;
	Sun, 20 Sep 2026 09:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789896062; cv=none; b=qFNRCf14hbbFeFR5xopQwCnBlou/pDJwj1/H9JpmgFqnX4yH/I6m7S+XVAwZ0DJLIhRzFRcW1NqFBcVBzCFiRPTI9WTWSMs+upiFWBjlHcs8lh/Bv3mnvHeudcDU6N9Zn4r4yZlAUD6iACs3QUARqeJ1mYlp48HzluEwovGFP8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789896062; c=relaxed/simple;
	bh=N5kKCJ9jGjZppJ40wiinVsxp9Zskb71HOdqUMG+h/9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q10EDD3a8wVYFCjYTvUUjLSKuzLER28aW5ob1sfJ9EaKISP2V4/VgsHhCq8kBm1XsNR3sFgDJ+PgDG5wmt6aXBEUKzaE62mdD6xOrGQjUP1HVvYHzNmzTIIj0PIvVmHH4wykMtaF+BTuv5GdP2ZMsygjslT+t5Bp8jpjQVa0S20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=V5+2EIIF; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="V5+2EIIF"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7EF21D34;
	Sun, 20 Sep 2026 02:20:53 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CE683F59E;
	Sun, 20 Sep 2026 02:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789896057; bh=N5kKCJ9jGjZppJ40wiinVsxp9Zskb71HOdqUMG+h/9k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V5+2EIIFQagrB2KL9sjDM2EnkaibNzhfFzLJLmqYPvjzJhIwoFeXLDguqRpKFzDPQ
	 VyQZrt/7Z5LIXDd+F2+kE/KFtBpaZGq9PIaEKZmLE7mCMLWlJ43LxzcJl8FnDDSrb5
	 FwV/UkrPTXE9UWX3HMtM2ly/Um8OUd8VvLb8izIc=
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
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v12 11/25] firmware: arm_scmi: Add Telemetry notification support
Date: Sun, 20 Sep 2026 10:19:14 +0100
Message-ID: <20260920091928.2014972-12-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260920091928.2014972-1-cristian.marussi@arm.com>
References: <20260920091928.2014972-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for notifications to Telemetry protocol and register an
internal notifier during protocol initialization: any DE value received
inside a notification payload will be cached for future user consumption.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v11 --> v12
 - marking notifs TDE as cacheable
 - updating cache within TDE lock when processing msg_payld
v10 --> v11
 - link DE received by notif to the primary UUID when first seen
v8 --> v9
 - fix notif boundary and wraparound checks
 - rollback notif report payload in __le32 format before parsing
   to align with single read payload parsing
v6 --> v7
 - fix sparse warn on notof payload handling
v5 -> v6
 - use protocol instance notifier interface
 - use new RAW macros to access payload
 - add proper boundary checks on notification payload
 - fix mutex scope in msg payld parsing
 - add notification payload consistency check (Sahiko)
v3 -> v4
 - use TDE cache to save DEs received via msg payload
v2 --> v3
 - changed a few dev_err into traces
 - split from monolithic telemetry protocol patch
 - use memcpy_from_le32
---
 drivers/firmware/arm_scmi/telemetry.c | 192 +++++++++++++++++++++++---
 include/linux/scmi_protocol.h         |   9 ++
 2 files changed, 183 insertions(+), 18 deletions(-)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 3e0c3c42e5a7..dde643f5de4d 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -511,6 +511,7 @@ struct telemetry_info {
 	/* Protect global and per-group configuration data */
 	struct mutex config_mtx;
 	struct scmi_telemetry_info info;
+	struct notifier_block telemetry_nb;
 	atomic_t rinfo_initializing;
 	struct completion rinfo_initdone;
 	#define PAYLD_HASH_BITS  4
@@ -519,6 +520,9 @@ struct telemetry_info {
 	struct scmi_telemetry_res_info *(*res_get)(struct telemetry_info *ti);
 };
 
+#define telemetry_nb_to_info(x)	\
+	container_of(x, struct telemetry_info, telemetry_nb)
+
 static struct scmi_telemetry_res_info *
 __scmi_telemetry_resources_get(struct telemetry_info *ti);
 
@@ -651,12 +655,10 @@ scmi_telemetry_tde_cache_unchanged(struct telemetry_de *tde, u32 magic)
 }
 
 static void
-scmi_telemetry_tde_cache_update(struct telemetry_de *tde,
-				struct scmi_telemetry_de_sample *sample,
-				u32 *magic)
+__scmi_telemetry_tde_cache_update(struct telemetry_de *tde,
+				  struct scmi_telemetry_de_sample *sample,
+				  u32 *magic)
 {
-	guard(mutex)(&tde->mtx);
-
 	tde->last_magic = magic ? *magic : TDCF_BAD_END_SEQ;
 	tde->last_val = sample->val;
 	tde->last_ts = scmi_tde_has_tstamp(tde) ? sample->tstamp : 0;
@@ -664,6 +666,15 @@ scmi_telemetry_tde_cache_update(struct telemetry_de *tde,
 	sample->tstamp = tde->last_ts;
 }
 
+static void
+scmi_telemetry_tde_cache_update(struct telemetry_de *tde,
+				struct scmi_telemetry_de_sample *sample,
+				u32 *magic)
+{
+	guard(mutex)(&tde->mtx);
+	__scmi_telemetry_tde_cache_update(tde, sample, magic);
+}
+
 static int
 scmi_telemetry_tde_cache_lookup(struct telemetry_de *tde,
 				struct scmi_telemetry_de_sample *sample,
@@ -3020,6 +3031,7 @@ scmi_telemetry_msg_payld_process(struct telemetry_info *ti,
 
 	while (next < num_dwords) {
 		struct payload *payld = (struct payload *)&dwords[next];
+		struct scmi_telemetry_de_sample sample = {};
 		struct scmi_telemetry_de *de;
 		struct telemetry_de *tde;
 		u32 de_id, meta = le32_to_cpu(payld->meta);
@@ -3049,23 +3061,26 @@ scmi_telemetry_msg_payld_process(struct telemetry_info *ti,
 
 		de = xa_load(&ti->xa_des, de_id);
 		if (!de || !de->enabled) {
-			dev_err(ti->ph->dev,
-				"MSG - Received INVALID DE - ID:%u  enabled:%c\n",
-				de_id, de ? (de->enabled ? 'Y' : 'N') : 'X');
+			trace_scmi_tlm_access(de_id, de ? "MSG_DE_DISABLED" :
+					      "MSG_DE_UNKNOWN", 0, 0);
 			continue;
 		}
 
 		tde = to_tde(de);
-		guard(mutex)(&tde->mtx);
-		tde->cached_msg = true;
-		tde->last_val = LINE_DATA_GET_RAW(&payld->tsl);
-		/* TODO BLK_TS in notification payloads */
-		tde->last_ts = HAS_LINE_EXT_RAW(meta) &&
-			LINE_TS_VALID_RAW(meta) ?
-			LINE_TSTAMP_GET_RAW(&payld->tsl) : 0;
+		scoped_guard(mutex, &tde->mtx) {
+			tde->cached_msg = cacheable;
+			sample.val = LINE_DATA_GET_RAW(&payld->tsl);
+			sample.tstamp = HAS_LINE_EXT_RAW(meta) &&
+				LINE_TS_VALID_RAW(meta) ?
+				LINE_TSTAMP_GET_RAW(&payld->tsl) : 0;
+
+			/* Update the cache holding the TDE mutex */
+			__scmi_telemetry_tde_cache_update(tde, &sample, NULL);
+		}
+		scmi_telemetry_uuid_link(tde, ti->primary_uuid);
 
-		trace_scmi_tlm_collect(tde->last_ts, tde->de.info->id,
-				       tde->last_val, "MESSAGE");
+		trace_scmi_tlm_collect(sample.tstamp, de->info->id, sample.val,
+				       "MESSAGE");
 	}
 }
 
@@ -3230,6 +3245,126 @@ static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
 	.reset = scmi_telemetry_reset,
 };
 
+static bool
+scmi_telemetry_notify_supported(const struct scmi_protocol_handle *ph,
+				u8 evt_id, u32 src_id)
+{
+	struct telemetry_info *ti = ph->get_priv(ph);
+
+	return ti->info.continuos_update_support;
+}
+
+static int
+scmi_telemetry_set_notify_enabled(const struct scmi_protocol_handle *ph,
+				  u8 evt_id, u32 src_id, bool enable)
+{
+	return 0;
+}
+
+static void *
+scmi_telemetry_fill_custom_report(const struct scmi_protocol_handle *ph,
+				  u8 evt_id, ktime_t timestamp,
+				  const void *payld, size_t payld_sz,
+				  void *report, u32 *src_id)
+{
+	const struct scmi_telemetry_update_notify_payld *p = payld;
+	struct scmi_telemetry_update_report *r = report;
+	size_t dwords_sz, msg_payld_sz;
+
+	/* At least sized as an empty notification */
+	if (payld_sz < sizeof(*p))
+		return NULL;
+
+	r->timestamp = timestamp;
+	r->agent_id = le32_to_cpu(p->agent_id);
+	r->status = le32_to_cpu(p->status);
+	r->num_dwords = le32_to_cpu(p->num_dwords);
+
+	/*Check boundaries and wraparounds */
+	if (check_mul_overflow(r->num_dwords, sizeof(r->dwords[0]), &dwords_sz))
+		return NULL;
+
+	if (check_add_overflow(sizeof(*p), dwords_sz, &msg_payld_sz))
+		return NULL;
+
+	if (msg_payld_sz > payld_sz)
+		return NULL;
+
+	/*
+	 * Allocated dwords and report are sized as max_msg_size, so as
+	 * to allow for the maximum payload permitted by the configured
+	 * transport. Overflow is not possible since out-of-size messages
+	 * are dropped at the transport layer.
+	 */
+	if (r->num_dwords)
+		memcpy_from_le32(r->dwords, p->array, r->num_dwords);
+
+	*src_id = 0;
+
+	return r;
+}
+
+static const struct scmi_event tlm_events[] = {
+	{
+		.id = SCMI_EVENT_TELEMETRY_UPDATE,
+		.max_payld_sz = 0,
+		.max_report_sz = 0,
+	},
+};
+
+static const struct scmi_event_ops tlm_event_ops = {
+	.is_notify_supported = scmi_telemetry_notify_supported,
+	.set_notify_enabled = scmi_telemetry_set_notify_enabled,
+	.fill_custom_report = scmi_telemetry_fill_custom_report,
+};
+
+static const struct scmi_protocol_events tlm_protocol_events = {
+	.queue_sz = SCMI_PROTO_QUEUE_SZ,
+	.ops = &tlm_event_ops,
+	.evts = tlm_events,
+	.num_events = ARRAY_SIZE(tlm_events),
+	.num_sources = 1,
+};
+
+static int scmi_telemetry_notifier(struct notifier_block *nb,
+				   unsigned long event, void *data)
+{
+	struct scmi_telemetry_update_report *er = data;
+	struct telemetry_info *ti = telemetry_nb_to_info(nb);
+
+	if (er->status) {
+		trace_scmi_tlm_access(0, "BAD_NOTIF_MSG", 0, 0);
+		return NOTIFY_DONE;
+	}
+
+	trace_scmi_tlm_access(0, "TLM_UPDATE_MSG", 0, 0);
+	/* Lookup the embedded DEs in the notification payload ... */
+	if (er->num_dwords) {
+		size_t payld_bytes = sizeof(er->dwords[0]) * er->num_dwords;
+
+		__le32 *dwords __free(kvfree) =
+			kvcalloc(er->num_dwords, sizeof(*dwords), GFP_KERNEL);
+		if (!dwords)
+			return NOTIFY_DONE;
+
+		/* The report payload size was bound checked on rx */
+		memcpy_to_le32(dwords, er->dwords, er->num_dwords);
+		/*
+		 * Note that the DEs received via Notifications can only be
+		 * updated that way, and as such are cached at each reception
+		 * and never read on-demand.
+		 */
+		scmi_telemetry_msg_payld_process(ti, er->num_dwords, dwords,
+						 payld_bytes, true);
+	}
+
+	/* ...scan the SHMTI/FCs for any other DE updates. */
+	if (ti->streaming_mode)
+		scmi_telemetry_scan_update(ti);
+
+	return NOTIFY_OK;
+}
+
 /**
  * scmi_telemetry_resources_alloc  - Resources allocation
  * @ti: A reference to the telemetry info descriptor for this instance
@@ -3591,7 +3726,27 @@ static int scmi_telemetry_protocol_init(const struct scmi_protocol_handle *ph)
 
 	ti->info.base.version = ph->version;
 
-	return ph->set_priv(ph, ti);
+	ret = ph->set_priv(ph, ti);
+	if (ret)
+		return ret;
+
+	/*
+	 * Register a notifier anyway straight upon protocol initialization
+	 * since there could be some DEs that are ONLY reported by notifications
+	 * even though the chosen collection method was SHMTI/FCs.
+	 */
+	if (ti->info.continuos_update_support) {
+		ti->telemetry_nb.notifier_call = &scmi_telemetry_notifier;
+		ret = ph->instance_notifier_register(ph, SCMI_EVENT_TELEMETRY_UPDATE,
+						     NULL, &ti->telemetry_nb);
+		if (ret) {
+			dev_err(ph->dev,
+				"Could NOT register Telemetry notifier\n");
+			return ret;
+		}
+	}
+
+	return 0;
 }
 
 static const struct scmi_protocol scmi_telemetry = {
@@ -3599,6 +3754,7 @@ static const struct scmi_protocol scmi_telemetry = {
 	.owner = THIS_MODULE,
 	.instance_init = &scmi_telemetry_protocol_init,
 	.ops = &tlm_proto_ops,
+	.events = &tlm_protocol_events,
 	.supported_version = SCMI_PROTOCOL_SUPPORTED_VERSION,
 };
 
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 5a2787b30120..3d7b7dde6b64 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -1252,6 +1252,7 @@ enum scmi_notification_events {
 	SCMI_EVENT_SYSTEM_POWER_STATE_NOTIFIER = 0x0,
 	SCMI_EVENT_POWERCAP_CAP_CHANGED = 0x0,
 	SCMI_EVENT_POWERCAP_MEASUREMENTS_CHANGED = 0x1,
+	SCMI_EVENT_TELEMETRY_UPDATE = 0x0,
 };
 
 struct scmi_power_state_changed_report {
@@ -1339,4 +1340,12 @@ struct scmi_powercap_meas_changed_report {
 	unsigned int	domain_id;
 	unsigned int	power;
 };
+
+struct scmi_telemetry_update_report {
+	ktime_t		timestamp;
+	unsigned int	agent_id;
+	int		status;
+	unsigned int	num_dwords;
+	unsigned int	dwords[];
+};
 #endif /* _LINUX_SCMI_PROTOCOL_H */
-- 
2.54.0

