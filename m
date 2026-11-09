Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215757;
	b=vSVAwt8Svk1rQF9eW60CmOmKkG9h+TIf5Syz4xQPTXGJLKMlRW5t1gv6AeC7kL3CY+vX
	 lj/+7yKdEdQVr9sDlzxY63+1+BfIk4+Ohe6QJPqNS7oZ0PafxjtIdaX7+6ioVMXavEqOR
	 dX+353jqajNAAXqOukkriLLeOKbgmbbjXyt9vKQp2Xqms6Bxdf7vQzxdrFWfXUo9hdVfN
	 CCHg6JJiziahUguPKluojQZhwEBbixR7ezTTl+wR+8xqHEogCq4TT+ySl8PxoBYYkhulz
	 7uDKaqEv9M+h9LxFM1mDfG5E9rv+me+5CpVVYGmBiVM+riU2q51jPE9qgpSjBoAshhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215757;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5OSbYsjVbk7sBZRSq4oF4KiblhSWQYBItw33ZmHO1fY=;
	b=q8YXnLRjGqMCGOXUvJ86qmCXJ4+S3RxM5EAJy5gz3tPgikH/MtNTgDahA3rRuiT6d040
	 85TQqQPqN1m2dn5+lRDhfzyrJ7H4VTaRVs9MZZcUkuxa8H0M0ovQ7qukRvvZnnFljKLc1
	 H6SUeF0yhTItxha2CY5CULMD/AfRuU9473Hz9aN5O7hl1nYOMqDTaQ9k+2Yt6xHxS9NdT
	 XiKiUCq+B9mHyqNAO8bfax5IKSbQ2T4Ht78ObpPgyQR+nZkYHBtVp0o8FRH3kqXTTPxS8
	 2zE1vJBaTruo5cKouz0jA3bBfPTPPs2DHSn+/vj4ssKbBrTOFbt9tMOK20NnG9sMthg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FRFd7GoG;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69B7E606EE95;
	Mon,  9 Nov 2026 09:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69B7E606EE95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FRFd7GoG
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CAF9214BF;
	Mon,  9 Nov 2026 01:15:53 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E839F3F85F;
	Mon,  9 Nov 2026 01:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794215756; bh=kVCnoQAcllZc+P+esXe8zD+18P94SjyZYSjiqZWO6S0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FRFd7GoGiOl1puAlkGYoRoW0BulZLcOt5zdaEh9Fae7nkObuu72suhNoU5a+ljTss
	 16lPnt6ZGJnPyoRwZT8jWV4lf9Ix8KYFr5yoc1Pf/gKrbYFA1Fr+WugHoAb/lF6jno
	 Ch48j0mTKW8p+S2Z9bFlC9dHN66YH7UmxbN+AyWk=
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
Subject: [PATCH v15 19/35] firmware: arm_scmi: Add Telemetry reset logic
Date: Mon,  9 Nov 2026 09:12:05 +0000
Message-ID: <20261109091221.2532706-20-cristian.marussi@arm.com>
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

Add support for Telemetry operations needed to request platform to
reset telemetry current configuration and data events values.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v14 --> v15
 - clear cached_msg on RESET
 - clearstreaming_mode instead of notif_enabled
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
 drivers/firmware/arm_scmi/telemetry.c | 81 +++++++++++++++++++++++++++
 include/linux/scmi_protocol.h         |  2 +
 2 files changed, 83 insertions(+)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index bf37faf99865..ebad4ec2afda 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -3969,6 +3969,86 @@ static int scmi_telemetry_des_sample_get(const struct scmi_protocol_handle *ph,
 	return ret;
 }
 
+static void scmi_telemetry_local_resources_reset(struct telemetry_info *ti)
+{
+	struct scmi_telemetry_res_info *rinfo;
+	unsigned int num_des;
+
+	ti->info.enabled = false;
+	ti->info.current_mode = SCMI_TLM_ONDEMAND;
+	ti->streaming_mode = false;
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
+			tde->cached_msg = false;
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
@@ -3979,6 +4059,7 @@ static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
 	.de_data_read = scmi_telemetry_de_data_read,
 	.des_bulk_read = scmi_telemetry_des_bulk_read,
 	.des_sample_get = scmi_telemetry_des_sample_get,
+	.reset = scmi_telemetry_reset,
 };
 
 /**
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 7177f739f062..012894e1d9be 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -1024,6 +1024,7 @@ struct scmi_telemetry_de_sample {
  *		    the ones belonging to a specific group when provided.
  *		    This causes an immediate update platform-side of all the
  *		    enabled DEs.
+ * @reset: reset configuration and telemetry data.
  */
 struct scmi_telemetry_proto_ops {
 	const struct scmi_telemetry_info *(*info_get)
@@ -1051,6 +1052,7 @@ struct scmi_telemetry_proto_ops {
 	int __must_check (*des_sample_get)(const struct scmi_protocol_handle *ph,
 					   int grp_id, unsigned int *num_samples,
 					   struct scmi_telemetry_de_sample *samples);
+	int (*reset)(const struct scmi_protocol_handle *ph);
 };
 
 /**
-- 
2.54.0

