Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215761;
	b=sAYGWX47Uh0VFpyPzRPTQtLjuymcUK9ohIIrqY9IlQPyhDlrhMB2cHpN86ebu1f3/FfD
	 iQd7gi2T3E6dST92DSx7WUIMhobVDA3N/zi06lqyg1mMikd1oOUv4sPpEYpY4BUMlDcw2
	 XjHrnzKiOrt9obZFwChjQ5PhtCTWbE7ZeEnfFzv/e5s2Yil0PBfRRPtNp9cHbDyB2mkxX
	 O44aDaYIMXjYKRBpKb4R2cEl7Xs6um0zfLjcpz2CQbndP1ZatS6b0PM81sgkWYtcZDqrR
	 vyU0cGA28XpFjktncA9JiUpcMFUvYWuC2KsFjJ2fdMGLg/M6WsCROKHh6ZCTZNTeLrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215761;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KEhCq5kYC7NGx/xsketGgV95QrijBYzxrIwgn1vcyPo=;
	b=E8f2/18/q8pnpegQiWi1qczaAp/UmEa+FJJ0Yq9Q75aRdHTk/BH+IHkTwUWvq8sQ69IV
	 mXjG9VigJSRiLrWGvT7elKDKveyKOLpRdTlofr1EMIE3hRRWP5c1RSUADmPfMvwj2CZ7v
	 703gyDewEeW+xCm7Xa83CUSM0J4uHg0FLcAb6HqkgWsgFEBwok6KDNPchaZlvP1pZiV3z
	 vcEnrxXShxyo4Ycu5+5eZglj4UA62GCcwbSNOkZE4jpKyxK9J2/KWL8l4VgJSffTsvwOO
	 0jppShjVvBJPVHRJa5zc6NP+LxZnf4OccSID6J2rSaoRWe6G5zSn97o4qwrBDj0jP3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=WF+v1BBB;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63BCB606EE9F;
	Mon,  9 Nov 2026 09:16:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63BCB606EE9F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=WF+v1BBB
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EAAE91691;
	Mon,  9 Nov 2026 01:15:56 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 19EB03F85F;
	Mon,  9 Nov 2026 01:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794215759; bh=uOwvOCyf3UE0MFDYCcZ1jRyae3BQMje+ZYYO2UA8SPY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WF+v1BBBZPgNCw0Tvndgf6hosMtgBPvjty3OZi/Czma6KLpCm9Ac98Zfi/Sz0OCif
	 0N51SF8YzuMN7HQ521afA5+OEfYDgf4fvfMNBuvjvs+u5dO9CyPZYWQ9DBfcaLBrAq
	 W/W+FCwvftsmxDsaygAwOR/+9pgyxgGbW7j1kBZo=
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
	jonathan.cameron@oss.qualcomm.com,
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
Subject: [PATCH v15 20/35] firmware: arm_scmi: Add Telemetry notification support
Date: Mon,  9 Nov 2026 09:12:06 +0000
Message-ID: <20261109091221.2532706-21-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109091221.2532706-1-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for notifications to Telemetry protocol and register an
internal notifier during protocol initialization: any DE value received
inside a notification payload will be cached for future user consumption.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v14 --> v15
 - add an overflow check on payload lines parsing
 - convert to Linux errno before building notification report
 - add traces and comments
v13 --> v14
 - moved some definitions from earlier split patch
v12 --> v13
 - handle PARTIAL_ERROR: log and ignore
 - unlink UUID under mutex
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
 drivers/firmware/arm_scmi/telemetry.c | 184 +++++++++++++++++++++++++-
 include/linux/scmi_protocol.h         |   9 ++
 2 files changed, 190 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index ebad4ec2afda..918067e225d5 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -30,6 +30,7 @@
 #include <linux/uuid.h>
 #include <linux/xarray.h>
 
+#include "errors.h"
 #include "protocols.h"
 #include "notify.h"
 
@@ -69,6 +70,13 @@ struct scmi_msg_resp_telemetry_protocol_attributes {
 	__le32 default_blk_ts_rate;
 };
 
+struct scmi_telemetry_update_notify_payld {
+	__le32 agent_id;
+	__le32 status;
+	__le32 num_dwords;
+	__le32 array[] __counted_by_le(num_dwords);
+};
+
 struct scmi_shmti_desc {
 	__le32 id;
 	__le32 addr_low;
@@ -552,12 +560,16 @@ struct telemetry_info {
 	/* Protect global and per-group configuration data */
 	struct mutex config_mtx;
 	struct scmi_telemetry_info info;
+	struct notifier_block telemetry_nb;
 	atomic_t rinfo_initializing;
 	struct completion rinfo_initdone;
 	struct scmi_telemetry_res_info *rinfo;
 	struct scmi_telemetry_res_info *(*res_get)(struct telemetry_info *ti);
 };
 
+#define telemetry_nb_to_info(x)	\
+	container_of(x, struct telemetry_info, telemetry_nb)
+
 static struct scmi_telemetry_res_info *
 __scmi_telemetry_resources_get(struct telemetry_info *ti);
 
@@ -3831,9 +3843,9 @@ scmi_telemetry_msg_payld_process(struct telemetry_info *ti,
 	while (next < num_dwords) {
 		struct payload *payld = (struct payload *)&dwords[next];
 		struct scmi_telemetry_de_sample sample = {};
+		u32 de_id, meta = le32_to_cpu(payld->meta);
 		struct scmi_telemetry_de *de;
 		struct telemetry_de *tde;
-		u32 de_id, meta = le32_to_cpu(payld->meta);
 		unsigned int wlen;
 
 		wlen = LINE_LENGTH_WORDS_RAW(meta);
@@ -3874,7 +3886,6 @@ scmi_telemetry_msg_payld_process(struct telemetry_info *ti,
 		}
 
 		tde->cached_msg = cacheable;
-
 		sample.val = LINE_DATA_GET_RAW(&payld->tsl);
 		sample.tstamp = HAS_LINE_EXT_RAW(meta) &&
 			LINE_TS_VALID_RAW(meta) ? LINE_TSTAMP_GET_RAW(&payld->tsl) : 0;
@@ -3882,6 +3893,10 @@ scmi_telemetry_msg_payld_process(struct telemetry_info *ti,
 		/* Update the cache holding the TDE mutex */
 		scmi_telemetry_tde_cache_update(tde, &sample, NULL);
 
+		/* Link notifications to Primary UUID */
+		if (cacheable)
+			scmi_telemetry_uuid_link(tde, ti->primary_uuid);
+
 		trace_scmi_tlm_collect(sample.tstamp, de->info->id, sample.val,
 				       "MESSAGE");
 	}
@@ -4062,6 +4077,148 @@ static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
 	.reset = scmi_telemetry_reset,
 };
 
+static bool
+scmi_telemetry_notify_supported(const struct scmi_protocol_handle *ph,
+				u8 evt_id, u32 src_id)
+{
+	struct telemetry_info *ti = ph->get_priv(ph);
+
+	return ti->info.continuous_update_support;
+}
+
+static int
+scmi_telemetry_set_notify_enabled(const struct scmi_protocol_handle *ph,
+				  u8 evt_id, u32 src_id, bool enable)
+{
+	/*
+	 * As defined by the specification, SCMI Telemetry notifications are a
+	 * kind of their own: the enable process deviates slightly from usual
+	 * notifications behaviour and a notifier has to be registered anyway
+	 * right after protocol initialization if such notifications are
+	 * supported at all by the platform.
+	 * IOW, SCMI Telemetry notifications are in fact always enabled when
+	 * supported, so this helper needs to do nothing but succeed.
+	 */
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
+	r->status = scmi_to_linux_errno(le32_to_cpu(p->status));
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
+	/*
+	 * PARTIAL_ERRORs are reported as -EBADMSG and related lines,
+	 * marked as DATA_INVALID, will be properly skipped by
+	 * scmi_telemetry_msg_payld_process.
+	 */
+	if (er->status && er->status != -EBADMSG) {
+		trace_scmi_tlm_access(0, "BAD_NOTIF_MSG", 0, 0);
+		return NOTIFY_DONE;
+	} else if (er->status == -EBADMSG) {
+		trace_scmi_tlm_access(0, "BAD_NOTIF_PARTIAL_ERROR", 0, 0);
+	}
+
+	trace_scmi_tlm_access(0, "TLM_UPDATE_MSG", 0, 0);
+	/* Lookup the embedded DEs in the notification payload ... */
+	if (er->num_dwords) {
+		size_t payld_bytes = sizeof(er->dwords[0]) * er->num_dwords;
+
+		__le32 *dwords __free(kvfree) =
+			kvzalloc_objs(*dwords, er->num_dwords);
+		if (!dwords) {
+			trace_scmi_tlm_access(0, "TLM_UPDATE_MSG_FAILED", 0, 0);
+			return NOTIFY_DONE;
+		}
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
+	/*
+	 * ...scan the SHMTI/FCs for any other DE updates if streaming mode
+	 * is enabled since it is an indication that someone explcitly requested
+	 * collection by notification.
+	 */
+	if (ti->streaming_mode)
+		scmi_telemetry_scan_update(ti);
+
+	return NOTIFY_OK;
+}
+
 /**
  * scmi_telemetry_resources_alloc  - Resources allocation
  * @ti: A reference to the telemetry info descriptor for this instance
@@ -4488,7 +4645,27 @@ static int scmi_telemetry_protocol_init(const struct scmi_protocol_handle *ph)
 
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
+	if (ti->info.continuous_update_support) {
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
@@ -4496,6 +4673,7 @@ static const struct scmi_protocol scmi_telemetry = {
 	.owner = THIS_MODULE,
 	.instance_init = &scmi_telemetry_protocol_init,
 	.ops = &tlm_proto_ops,
+	.events = &tlm_protocol_events,
 	.supported_version = SCMI_PROTOCOL_SUPPORTED_VERSION,
 };
 
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 012894e1d9be..0b21c89d18f4 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -1255,6 +1255,7 @@ enum scmi_notification_events {
 	SCMI_EVENT_SYSTEM_POWER_STATE_NOTIFIER = 0x0,
 	SCMI_EVENT_POWERCAP_CAP_CHANGED = 0x0,
 	SCMI_EVENT_POWERCAP_MEASUREMENTS_CHANGED = 0x1,
+	SCMI_EVENT_TELEMETRY_UPDATE = 0x0,
 };
 
 struct scmi_power_state_changed_report {
@@ -1342,4 +1343,12 @@ struct scmi_powercap_meas_changed_report {
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

