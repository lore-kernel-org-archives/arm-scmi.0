Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70ED44B99C0;
	Fri, 16 Oct 2026 18:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792177061; cv=none; b=XNg6rE0n4PEYXbYRBktmWv1x46fuzSCRZxRjeL3H+snizXDQZwucGbUFD2ndEFWV3Hxe4c/M+yUhgXZsLGzMnU0mRVCPD9z7Xhp2LBmVA0yssHbRLo9e8jbqxEuDUmstYrU76Je7UHJaFT3Seduk/ex1R60E2GzK+q20B6ACNdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792177061; c=relaxed/simple;
	bh=i4iwi8vXN/zCSC/Hr5lg193BlICgS/pJueKSLf7oWv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mNxpe8e60q//H1qdyZb+4jI6ljOEPZYQRMo68ausUurqfRUEX2UNw/VJn5dIXvVW2nZoiBuQV5/KaJ5VwLuC/7i2DiQBsRGSOrf4+g0elHagCTm3k/mNjBcFHEgsrvnLlBp50k3p6bNBV1GqBBpzdd6wwrSly03AVCd8k0w7eXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Q//aOHc6; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Q//aOHc6"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7CDFD1516;
	Fri, 16 Oct 2026 11:57:36 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 34A2B3F7B4;
	Fri, 16 Oct 2026 11:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792177059; bh=i4iwi8vXN/zCSC/Hr5lg193BlICgS/pJueKSLf7oWv0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q//aOHc6zuhZRmvzooNgqY4b00BOEyQZEa+oojwfG0NX/ZLa0oyeVlBTxGkKfROVb
	 +fg/4mEygvzWSh287PINsmaXv6zY9MBiKeueMyBkYTj++4CVUYayV/T5oAo3TDVewy
	 ebWvipcQP38gKFQD0vhbx79OBcqtvaLWcxz+P3II=
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
Subject: [PATCH v14 17/32] firmware: arm_scmi: Add Telemetry reset logic
Date: Fri, 16 Oct 2026 19:55:38 +0100
Message-ID: <20261016185553.2794459-18-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261016185553.2794459-1-cristian.marussi@arm.com>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for Telemetry operations needed to request platform to
reset telemetry current configuration and data events values.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v13 --> v14
 - add a barrier to acquire rinfo->num_des on reset
 - avoid lock inversion on config_mtx
v12 --> v13
 - relocate tde->mtx guards higher up and add lockdep assertions
 - unlink BLKTS under tde->mtx on local free
v11 --> v12
 - using config_mtx to sync with ongoing configurations
 - use proper helpers to update cache state
v10 --> v11
 - protect TDE updates on reset
 - use des_enable mutex when clearing des cache
 - zero also active_update_interval
v8 --> v9
 - add a commment on why NOT unlinking UUID
v6 --> v7
 - add proper cleanup of sid/offs/uuids and caches on RESET
v5 --> v6
 - added missing reset of global state
v3 --> v4
 - reset tracked Telemetry DE state
v2 --> v3
 - split from monolithic Telemetry patch
 - use scmi_telemetry_de_unlink
---
 drivers/firmware/arm_scmi/telemetry.c | 80 +++++++++++++++++++++++++++
 include/linux/scmi_protocol.h         |  2 +
 2 files changed, 82 insertions(+)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 0825a0d38296..a5ba21fbfed7 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -3340,6 +3340,85 @@ static int scmi_telemetry_des_sample_get(const struct scmi_protocol_handle *ph,
 	return ret;
 }
 
+static void scmi_telemetry_local_resources_reset(struct telemetry_info *ti)
+{
+	struct scmi_telemetry_res_info *rinfo;
+	unsigned int num_des;
+
+	ti->info.enabled = false;
+	ti->info.notif_enabled = false;
+	ti->info.current_mode = SCMI_TLM_ONDEMAND;
+	ti->info.active_update_interval = 0;
+
+	/* Get rinfo without triggering an enumeration, cannot be NULL anyway */
+	rinfo = __scmi_telemetry_resources_get(ti);
+	/* Make sure to see the latest num_des */
+	num_des = smp_load_acquire(&rinfo->num_des);
+	/* Clear all local state...*/
+	for (int i = 0; i < num_des; i++) {
+		struct telemetry_de *tde = to_tde(rinfo->des[i]);
+
+		scoped_guard(mutex, &tde->mtx) {
+			tde->last_ts = 0;
+			tde->last_val = 0;
+			tde->last_magic = 0;
+			if (!tde->de.fc_support) {
+				tde->sid = SHMTI_ID_INVALID;
+				tde->base = NULL;
+				tde->offset = 0;
+				tde->eplg = NULL;
+			}
+
+			scmi_telemetry_de_state_update(ti, ENA_STATE,
+						       &tde->de.enabled, false);
+
+			if (tde->de.tstamp_support)
+				scmi_telemetry_de_state_update(ti, ENA_TSTAMP,
+							       &tde->de.tstamp_enabled,
+							       false);
+
+			/*
+			 * Unlinking ONLY BLK_TS lines since, per the SCMI spec,
+			 * the UUID/DE associations are permanent within the same
+			 * session boot: after a reset has cleared the server-side
+			 * configuration the next time SHMTIs will be re-populated,
+			 * these same UUID/DE associations will be re-instated.
+			 */
+			scmi_telemetry_blkts_unlink(tde);
+		}
+	}
+
+	for (int i = 0; i < rinfo->num_groups; i++) {
+		rinfo->grps[i].enabled = false;
+		rinfo->grps[i].tstamp_enabled = false;
+		rinfo->grps[i].current_mode = SCMI_TLM_ONDEMAND;
+		rinfo->grps[i].active_update_interval = 0;
+	}
+}
+
+static int scmi_telemetry_reset(const struct scmi_protocol_handle *ph)
+{
+	struct telemetry_info *ti = ph->get_priv(ph);
+	struct scmi_xfer *t;
+	int ret;
+
+	/* Stall concurrent configuration request */
+	guard(mutex)(&ti->config_mtx);
+
+	ret = ph->xops->xfer_get_init(ph, TELEMETRY_RESET, sizeof(u32), 0, &t);
+	if (ret)
+		return ret;
+
+	put_unaligned_le32(0, t->tx.buf);
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret)
+		scmi_telemetry_local_resources_reset(ti);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
 static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
 	.info_get = scmi_telemetry_info_get,
 	.de_lookup = scmi_telemetry_de_lookup,
@@ -3350,6 +3429,7 @@ static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
 	.de_data_read = scmi_telemetry_de_data_read,
 	.des_bulk_read = scmi_telemetry_des_bulk_read,
 	.des_sample_get = scmi_telemetry_des_sample_get,
+	.reset = scmi_telemetry_reset,
 };
 
 /**
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 52c9031c266b..7656db822f30 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -1016,6 +1016,7 @@ struct scmi_telemetry_de_sample {
  *		    the ones belonging to a specific group when provided.
  *		    This causes an immediate update platform-side of all the
  *		    enabled DEs.
+ * @reset: reset configuration and telemetry data.
  */
 struct scmi_telemetry_proto_ops {
 	const struct scmi_telemetry_info __must_check *(*info_get)
@@ -1043,6 +1044,7 @@ struct scmi_telemetry_proto_ops {
 	int __must_check (*des_sample_get)(const struct scmi_protocol_handle *ph,
 					   int grp_id, int *num_samples,
 					   struct scmi_telemetry_de_sample *samples);
+	int (*reset)(const struct scmi_protocol_handle *ph);
 };
 
 /**
-- 
2.54.0

