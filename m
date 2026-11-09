Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215742;
	b=sL5i38lBxcNmRV3S91wLy5jtQhdqviC4/Ox8ldsJfqHxE8RaLudDSBQMQDvmiAqAifWA
	 AhhWwC0RB+xDzSWfn6GvVwbypBwnI+24vUjpMGcMg6l7zqOr4KThFuslGa7yytHlHQW0d
	 /lq9mVMm9wCXfJoiOFikRc1tr9nrHY7Nm/1pJqysmZp1oYJDFXOgowTMRdWeXqtBBn4b+
	 KegUbMvKRL4L6vtMZtfC2IEYxBQ5cvY55sBc7XJbUNqzGVqOFNp0fDkEWNd8rIEADxyf2
	 oFj0e9XNjBTpKTeTq3qAEmJqXi8vPpnUKoOoppqxS8tlLAmdqJ0fIkwP6IA8ydmjYHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215742;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HMledBXpJxWk+tTO+hHrTaLgrwvltsRN1bs2w4rM2WM=;
	b=AmOgsU4hG/2bY1GXPzkvVMJD5CYMvUfK4dT22RK1qRw5FXbwhfNbBKQ9dU1LnpVcz3El
	 0py2X7tocM+vCyO3MuGKyD/LfOPyGV4cTBa3SpHyBAjNUTW/g9p5R80A8Jk60FY5y+GBz
	 W2pMrgltfvPnP4bcGaZBCnAcqCUbzpejKtoFH0I7ZN5F2OcFVlHUyDjpyK3FZhsO587di
	 1OA7LZiVYqNl2LDoM189GmCGQVfSmbnsDsl9tu+87b9MF5DblHCJcU6t2lolV0iZpPjEA
	 XOTIzVgRaV22kbjwU5TCUowZhQBsuHLby0D0ovgBBRSIYxpRcDIavTS4UwyI9NNR9+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Xe10A2Np;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81580606D803;
	Mon,  9 Nov 2026 09:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81580606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Xe10A2Np
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D0E914BF;
	Mon,  9 Nov 2026 01:15:38 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 239F93F85F;
	Mon,  9 Nov 2026 01:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794215741; bh=xfdxhkPMM+FuK9kFgx8l4s/RH6eN1IMqZPBmM2iKUj0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xe10A2NptZ2JG6Df/kQ/gKhY1KqEZAF+vtoRgleM3ujvYbr6dWCkPzfqQ9E5tZQQ6
	 RAZckAoC5PWgKO9UWNL9/JSTCRFaTJJDlaaehWVMrXF/A0xWAx3m0QOosvsezjs9vD
	 JcxJssdTh1y9mnjMisVVHMoKmCaeA6KC+tgez9gs=
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
Subject: [PATCH v15 14/35] firmware: arm_scmi: Add Telemetry TDCF areas parsing support
Date: Mon,  9 Nov 2026 09:12:00 +0000
Message-ID: <20261109091221.2532706-15-cristian.marussi@arm.com>
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

Add logic to scan the SHMTI areas, parsing the TDCF descriptors and collect
DataEvent contained in TDCF DATA lines. Ignore TDCF BLK_TS and UUID lines.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v14 --> v15
 - account for tstamped TDE during discovery
 - correct SHMTI overflow off-by-one
 - rework TDE cache hit/miss logic
 - introduce snapshots on full scan reads
 - validate DE location on SCAN_UPDATE
 - add custom SNAP eplg and overflow helpers
 - moved here definition of scmi_telemetry_payld_offset_safe_calc
v13 --> v14
 - fixed AB-BA dealock on blkts_link
 - relocate xa_destroy for xa_lines after uuids cleanup
 - report errors on scmi_telemetry_line_data_parse()
 - moved some common protocol definitions here from previous
   patches
 - split out of this patch all of the BLK_TS and UUID lines
   management, keeping only DATA line processing and delegating
   the other line types to following smaller patches
 - using a less regular time interval for TDCF scan retries
v12 --> v13
 - refactored cleanup resources
 - relocate tde->mtx guards higher up and add lockdep assertions
 - drop refcount on previous active lines when scanning
 - harden freeing path of UUIDs RCU items
 - better DATA LINE size-validation while parsing
 - reset active lines trackers on scan retries
 - validate used_qwords
 - redefine startm/endm bad sentinels and error path
 - add more BLKTS_INVALID checks on parsing
 - unlink stale BTS line when finding a new actibe for the TDE
 - retry scans on TDCF sanity failures..could be a torn read
 - use *alloc_objs
 - remove TO_CPU64
v11 --> v12
 - reject zero as MATCHSEQ
 - reworked locking around line_get/put
 - reworked locking around blkts_read
 - a few comments on locking acquisition order
 - cleanup active line refs even when bailing out of a scan in error
 - added hashed locks for fine grain locking around blkts/uuid line creation
 - added RCU protection on UUIDs access
v10 --> v11
 - relocated some line handlers from another patch
 - reworked TDE and lines locking logic
 - fix UUID/BLKTS line refcounting to properly drop unused lines
 - add a mutex to protect des cache accesses
v7 --> v9
 - avoid referencing a NULL in trace_scmi_tlm_access O_o
 - refactor scmi_telemetry_line_put to free its container on release
 - convert SHMTI_OVERFLOW macro to an inline function
v7 --> v8
 - Fixes for some Sashiko issues on v7
  - reword a few dev_errs
  - removed a few unused function (moved to next patch)
  - add more safeguards and checks to SHMTI_OVERFLOWS
  - fix UUIDs copy and allocation
  - fix UUID reference store and cleanup
  - cleanup all UNBOUND lines and their containers in resources_free
  - remove mutex on primary init
v6 --> v7
 - add _RAW helpers to manage non MMIO accesses
 - sparse fixes
 - use uuid_t for UUID lines
 - fix proper UUID line parsing and binding
 - adding a few traces for TDCF line handling
 - add new dynamically sized UUID DB to ease discovered UUIDs lookup
 - fix endianity handling in UUID TDCF lines
 - handle Primary UUID lines with regular uuid_line
v5 --> v6
 - consider UUID line in TDCF as BE when scanning
 - use const booleans in scmi_telemetry_de_state_update()
 - fix Sashiko review https://sashiko.dev/#/patchset/20260703123601.381275-1-cristian.marussi%40arm.com?part=8
  - check SHMTI overflow while parsing
  - use proper bytes increment while parsing line_by_type
  - use mutex guard when link BLK_TS lines
v4 --> v5
 - converted TDE_HAS_TSTAMP to inline scmi_tde_has_tstamp
 - fixes sparse warnings
v3 --> v4
 - use kzalloc_obj
 - track SHMTI-discovered Telemetry DE states
 - refactor TDE cache with dedicated helpers
 - force tstamp to zero when timestamp is NOT supported or disabled
v2 --> v3
 - split from monolithic Telemetry patch
 - avoid devres allocation for resources that are added to the xa_lines XArray
 - simplify prototype of line parsing helpers to drop unneeded dev
 - flip tstmap logic in scmi_telemetry_line_data_parse() to properly emit
   a TLM ftrace event
 - use ternary ops to simplify quite a few expressions
---
 drivers/firmware/arm_scmi/telemetry.c | 799 +++++++++++++++++++++++++-
 1 file changed, 798 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index d9f1a3e3468e..810195889484 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -14,21 +14,29 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/limits.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/refcount.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
 #include <linux/sprintf.h>
 #include <linux/string.h>
+#include <linux/time.h>
 #include <linux/uuid.h>
 #include <linux/xarray.h>
 
 #include "protocols.h"
 #include "notify.h"
 
+#include <trace/events/scmi.h>
+
 /* Updated only after ALL the mandatory features for that version are merged */
 #define SCMI_PROTOCOL_SUPPORTED_VERSION		0x10000
 
+#define SCMI_TLM_TDCF_MAX_RETRIES	15
+#define SCMI_TLM_TDCF_RETRY_GAP_US	1234
+
 #define SCMI_TLM_DE_IMPL_NUM_DWORDS	4
 
 /* An enum listing the protocol specific commands definitions */
@@ -125,6 +133,158 @@ struct scmi_msg_resp_telemetry_update_intervals {
 
 #define _I(__a)		(ioread32((void __iomem *)(__a)))
 
+/*
+ * Define the behaviour of a SHMTI scan defining what information will
+ * be gathered and which Telemetry items can be updated.
+ */
+enum scan_mode {
+	SCAN_LOOKUP,	/* Update only value/tstamp */
+	SCAN_UPDATE,	/* Update also location offset */
+	SCAN_DISCOVERY  /* Update xa_des: allows for new DEs to be discovered */
+};
+
+struct fc_line {
+	__le32 data_low;
+	__le32 data_high;
+};
+
+struct fc_tsline {
+	__le32 data_low;
+	__le32 data_high;
+	__le32 ts_low;
+	__le32 ts_high;
+};
+
+struct line {
+	__le32 data_low;
+	__le32 data_high;
+};
+
+struct tsline {
+	__le32 data_low;
+	__le32 data_high;
+	__le32 ts_low;
+	__le32 ts_high;
+};
+
+#define LINE_DATA_GET_RAW(f)				\
+({							\
+	typeof(f) _f = (f);				\
+	u32 _high = le32_to_cpu(_f->data_high);		\
+	u32 _low = le32_to_cpu(_f->data_low);		\
+	u64 _res;					\
+							\
+	_res = (((u64)(_high)) << 32) | (_low);		\
+	_res;						\
+})
+
+#define LINE_DATA_GET(f)				\
+({							\
+	typeof(f) _f = (f);				\
+	u32 _high = _I(&_f->data_high);			\
+	u32 _low = _I(&_f->data_low);			\
+	u64 _res;					\
+							\
+	_res = (((u64)(_high)) << 32) | (_low);		\
+	_res;						\
+})
+
+#define LINE_TSTAMP_GET_RAW(f)				\
+({							\
+	typeof(f) _f = (f);				\
+	u32 _high = le32_to_cpu(_f->ts_high);		\
+	u32 _low = le32_to_cpu(_f->ts_low);		\
+	u64 _res;					\
+							\
+	_res = (((u64)(_high)) << 32) | (_low);		\
+	_res;						\
+})
+
+#define LINE_TSTAMP_GET(f)				\
+({							\
+	typeof(f) _f = (f);				\
+	u32 _high = _I(&_f->ts_high);			\
+	u32 _low = _I(&_f->ts_low);			\
+	u64 _res;					\
+							\
+	_res = (((u64)(_high)) << 32) | (_low);		\
+	_res;						\
+})
+
+#define BLK_TS_STAMP(f)		LINE_TSTAMP_GET(f)
+#define BLK_TS_STAMP_RAW(f)	LINE_TSTAMP_GET_RAW(f)
+#define BLK_TS_RATE(p)		PAYLD_ID(p)
+#define BLK_TS_RATE_RAW(p)	PAYLD_ID_RAW(p)
+
+enum tdcf_line_types {
+	TDCF_DATA_LINE = 0,
+	TDCF_BLK_TS_LINE = 1,
+	TDCF_UUID_LINE = 2,
+};
+
+struct payload {
+	__le32 meta;
+#define PAYLD_META(x)		(_I(&((x)->meta)))
+#define PAYLD_META_RAW(x)	(le32_to_cpu((x)->meta))
+#define LINE_TYPE_RAW(m)	(FIELD_GET(GENMASK(7, 4), (m)))
+#define LINE_TYPE(x)		(LINE_TYPE_RAW(PAYLD_META(x)))
+#define IS_DATA_LINE(x)		(LINE_TYPE(x) == TDCF_DATA_LINE)
+#define IS_DATA_LINE_RAW(x)	(LINE_TYPE_RAW(x) == TDCF_DATA_LINE)
+#define IS_BLK_TS_LINE(x)	(LINE_TYPE(x) == TDCF_BLK_TS_LINE)
+#define IS_BLK_TS_LINE_RAW(x)	(LINE_TYPE_RAW(x) == TDCF_BLK_TS_LINE)
+#define IS_UUID_LINE(x)		(LINE_TYPE(x) == TDCF_UUID_LINE)
+#define USE_BLK_TS_RAW(m)	((m) & BIT(3))
+#define USE_BLK_TS(x)		(USE_BLK_TS_RAW(PAYLD_META(x)))
+#define HAS_LINE_EXT_RAW(m)	((m) & BIT(2))
+#define HAS_LINE_EXT(x)		(HAS_LINE_EXT_RAW(PAYLD_META(x)))
+#define LINE_TS_VALID_RAW(m)	((m) & BIT(1))
+#define LINE_TS_VALID(x)	(LINE_TS_VALID_RAW(PAYLD_META(x)))
+#define	DATA_INVALID_RAW(m)	((m) & BIT(0))
+#define	DATA_INVALID(x)		(DATA_INVALID_RAW(PAYLD_META(x)))
+#define	BLK_TS_INVALID_RAW(m)						\
+({									\
+	bool invalid;							\
+									\
+	invalid  = LINE_TS_VALID_RAW(m) || HAS_LINE_EXT_RAW(m) ||	\
+			USE_BLK_TS_RAW(m) || DATA_INVALID_RAW(m);	\
+	invalid;							\
+})
+#define	BLK_TS_INVALID(p)	BLK_TS_INVALID_RAW(PAYLD_META(p))
+
+#define	UUID_INVALID_RAW(m)						\
+({									\
+	bool invalid;							\
+									\
+	invalid = LINE_TS_VALID_RAW(m) || USE_BLK_TS_RAW(m) ||	\
+			DATA_INVALID_RAW(m) || !HAS_LINE_EXT_RAW(m);	\
+	invalid;							\
+})
+#define	UUID_INVALID(p)		UUID_INVALID_RAW(PAYLD_META(p))
+	__le32 id;
+	union {
+		struct line l;
+		struct tsline tsl;
+	};
+};
+
+#define PAYLD_ID(x)	(_I(&(((struct payload __iomem *)(x))->id)))
+#define PAYLD_ID_RAW(x)	(le32_to_cpu((((struct payload *)(x))->id)))
+
+#define LINE_DATA_PAYLD_WORDS						       \
+	((sizeof(u32) + sizeof(u32) + sizeof(struct line)) / sizeof(u32))
+#define EXT_LINE_DATA_PAYLD_WORDS					       \
+	((sizeof(u32) + sizeof(u32) + sizeof(struct tsline)) / sizeof(u32))
+
+#define LINE_LENGTH_WORDS_RAW(m)		\
+	(HAS_LINE_EXT_RAW((m)) ? EXT_LINE_DATA_PAYLD_WORDS : LINE_DATA_PAYLD_WORDS)
+
+#define LINE_LENGTH_WORDS(x)		LINE_LENGTH_WORDS_RAW(PAYLD_META(x))
+#define LINE_LENGTH_QWORDS(x)		((LINE_LENGTH_WORDS(x)) / 2)
+#define LINE_LENGTH_QWORDS_RAW(x)	((LINE_LENGTH_WORDS_RAW(x)) / 2)
+
+#define LINE_LENGTH_BYTES_RAW(m)	((LINE_LENGTH_WORDS_RAW(m)) * sizeof(u32))
+#define LINE_LENGTH_BYTES(x)		(LINE_LENGTH_BYTES_RAW(PAYLD_META(x)))
+
 struct prlg {
 	__le32 sign_start;
 #define SIGNATURE_START	0x5442474E	/* TBGN */
@@ -147,12 +307,24 @@ struct tdcf {
 	unsigned char payld[];
 };
 
+#define QWORDS(_t)	(_I(&(_t)->prlg.num_qwords))
+#define QWORDS_RAW(_t)	(le32_to_cpu((_t)->prlg.num_qwords))
+
 #define SHMTI_MIN_SIZE	(sizeof(struct tdcf) + TDCF_EPLG_SZ)
 /* An arbitrary upper bound to avoid crazy allocations driven by buggy FW */
 #define SHMTI_MAX_SIZE	SZ_64K
 
-#define TDCF_START_SIGNATURE(x)	(_I(&((x)->prlg.sign_start)))
+#define TDCF_START_SIGNATURE(x)		(_I(&((x)->prlg.sign_start)))
+#define TDCF_START_SEQ_GET(x)		(_I(&((x)->prlg.match_start)))
+#define TDCF_START_SEQ_GET_RAW(x)	(le32_to_cpu((x)->prlg.match_start))
+/* TDCF MatchSequence cannot be zero by the SCMI v4.0 Specification */
+#define TDCF_INVALID_MATCH_SEQ	0
+#define IS_BAD_START_SEQ(s)	((s) & 0x1 || (s) == TDCF_INVALID_MATCH_SEQ)
+
+#define TDCF_END_SEQ_GET(e)	(_I(&((e)->match_end)))
+#define TDCF_END_SEQ_GET_RAW(e)	(le32_to_cpu((e)->match_end))
 #define TDCF_END_SIGNATURE(e)	(_I(&((e)->sign_end)))
+#define	TDCF_BAD_END_SEQ	GENMASK(31, 0)
 
 struct telemetry_shmti;
 
@@ -178,6 +350,9 @@ struct telemetry_shmti {
 	struct mutex payld_locks[1 << PAYLD_HASH_BITS];
 };
 
+#define TDCF_OFFS(_b, _p)				\
+	((unsigned long)((__force void *)(_p) - (__force void *)(_b)))
+
 #define SHMTI_EPLG(s)						\
 	({							\
 		struct telemetry_shmti *_s = (s);		\
@@ -187,6 +362,44 @@ struct telemetry_shmti {
 		(_eplg);					\
 	})
 
+#define SNAP_EPLG(s)								\
+	({									\
+		struct shmti_snap *_s = (s);					\
+		struct eplg *_eplg;						\
+										\
+		_eplg = (void *)_s->base + _s->shmti->info.len - TDCF_EPLG_SZ;	\
+		(_eplg);							\
+	})
+
+struct telemetry_info;
+
+struct telemetry_line {
+	enum tdcf_line_types type;
+	u32 last_magic;
+	unsigned long offset;
+	refcount_t users;
+	struct telemetry_shmti *shmti;
+	/* Protect line accesses  */
+	struct mutex mtx;
+};
+
+struct telemetry_block_ts {
+	u64 last_ts;
+	u32 last_rate;
+	struct telemetry_line line;
+};
+
+#define to_blkts(l)	container_of(l, struct telemetry_block_ts, line)
+
+struct telemetry_uuid {
+	u32 key;
+	struct hlist_node node_ht;
+	struct hlist_node node_lst;
+	uuid_t uuid;
+};
+
+#define to_uuid_from_uuid_t(u)	container_of(u, struct telemetry_uuid, uuid)
+
 #define IS_TDE_TSTAMP_TYPE(__t, __ttype)	((__t)->ts_type == (__ttype))
 #define IS_TDE_TS_NONE(_t)	(IS_TDE_TSTAMP_TYPE((_t), TSTAMP_NONE))
 #define IS_TDE_TS_LINE(_t)	(IS_TDE_TSTAMP_TYPE((_t), TSTAMP_LINE))
@@ -220,7 +433,14 @@ struct telemetry_de {
 	u32 offset;
 	/* NOTE THAT DE data_sz is registered in scmi_telemetry_de */
 	u32 fc_size;
+	u64 last_val;
+	u64 last_ts;
+	u32 last_magic;
 	struct list_head item;
+	struct telemetry_block_ts *bts;
+#define BLK_TS_CHANGED(t, s, o)			\
+	(!((t)->bts) || (t)->bts->line.shmti != (s) || (t)->bts->line.offset != (o))
+	struct telemetry_uuid *uuid;
 	struct scmi_telemetry_de de;
 	/* Protect last_val/ts/magic accesses - MUST BE KEPT LAST */
 	struct mutex mtx;
@@ -228,10 +448,24 @@ struct telemetry_de {
 
 #define to_tde(d)	container_of(d, struct telemetry_de, de)
 
+static inline bool scmi_tde_has_tstamp(struct telemetry_de *t)
+{
+	return t->de.tstamp_support && t->de.tstamp_enabled;
+}
+
+enum de_state {
+	ENA_STATE,
+	ENA_TSTAMP,
+	ENA_MAX
+};
+
 struct telemetry_info {
 	bool streaming_mode;
 	unsigned int num_shmti;
 	unsigned int num_des_tstamp;
+	/* Mutex to protect des_enabled_mtx */
+	struct mutex des_enabled_mtx;
+	atomic_t des_enabled[ENA_MAX];
 	unsigned int default_blk_ts_rate;
 	const struct scmi_protocol_handle *ph;
 	struct telemetry_shmti *shmti;
@@ -251,6 +485,27 @@ struct telemetry_info {
 static struct scmi_telemetry_res_info *
 __scmi_telemetry_resources_get(struct telemetry_info *ti);
 
+static inline struct tdcf *snap_tdcf(struct shmti_snap *s);
+
+static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
+				     unsigned int shmti_id, enum scan_mode mode);
+
+static inline void
+scmi_telemetry_de_state_update(struct telemetry_info *ti, enum de_state state,
+			       bool *current_state, const bool next_state)
+{
+	guard(mutex)(&ti->des_enabled_mtx);
+	if (!current_state || *current_state != next_state)
+		atomic_add(next_state ? 1 : -1, &ti->des_enabled[state]);
+
+	if (current_state)
+		*current_state = next_state;
+
+	dev_dbg(ti->ph->dev, "Telemetry des_enabled[%s]:%u\n",
+		state == ENA_STATE ? "STATE" : "TSTAMP",
+		atomic_read(&ti->des_enabled[state]));
+}
+
 static struct telemetry_de *
 scmi_telemetry_free_tde_get(struct telemetry_info *ti)
 {
@@ -357,6 +612,35 @@ static int scmi_telemetry_tde_register(struct telemetry_info *ti,
 	return ret;
 }
 
+static inline bool
+scmi_telemetry_tde_cache_stale(struct telemetry_de *tde, u32 magic)
+{
+	lockdep_assert_held(&tde->mtx);
+
+	/* last_magic < magic */
+	return time_before32(tde->last_magic, magic);
+}
+
+static void
+scmi_telemetry_tde_cache_update(struct telemetry_de *tde, u64 val,
+				u64 *tstamp, u32 *magic)
+{
+	lockdep_assert_held(&tde->mtx);
+
+	/*
+	 * Update the cache only if stale compared to the current
+	 * sample, so bail-out when last_magic >= *magic
+	 */
+	if (magic && !scmi_telemetry_tde_cache_stale(tde, *magic))
+		return;
+
+	tde->last_magic = magic ? *magic : TDCF_BAD_END_SEQ;
+	tde->last_val = val;
+	tde->last_ts = tstamp && scmi_tde_has_tstamp(tde) ? *tstamp : 0;
+	if (tstamp)
+		*tstamp = tde->last_ts;
+}
+
 struct scmi_tlm_de_priv {
 	struct telemetry_info *ti;
 	void *next;
@@ -1196,6 +1480,510 @@ scmi_telemetry_de_lookup(const struct scmi_protocol_handle *ph, u32 id)
 	return xa_load(&ti->xa_des, id);
 }
 
+static inline struct payload __iomem *
+scmi_telemetry_payld_offset_safe_calc(struct telemetry_shmti *shmti, u32 offs)
+{
+	struct payload __iomem *payld;
+	unsigned long p;
+	u32 end;
+
+	/* Check if accessing payld->meta is safe. */
+	if (check_add_overflow(offs, sizeof(u32), &end) ||
+	    end > shmti->info.len)
+		return IOMEM_ERR_PTR(-EPROTO);
+
+	if (check_add_overflow((__force unsigned long)shmti->base, offs, &p))
+		return IOMEM_ERR_PTR(-EPROTO);
+
+	payld = shmti->base + offs;
+	/* Check line boundary */
+	if (check_add_overflow(offs, LINE_LENGTH_BYTES(payld), &end) ||
+	    end > shmti->info.len)
+		return IOMEM_ERR_PTR(-EPROTO);
+
+	return payld;
+}
+
+static u64
+scmi_telemetry_blkts_read(u32 magic, struct telemetry_de *tde)
+{
+	lockdep_assert_held(&tde->mtx);
+
+	return 0;
+}
+
+static inline struct telemetry_de *
+scmi_telemetry_tde_allocate(struct telemetry_info *ti, u32 de_id,
+			    struct payload *payld)
+{
+	u32 meta = PAYLD_META_RAW(payld);
+	struct telemetry_de *tde;
+
+	tde = scmi_telemetry_tde_get(ti, de_id);
+	if (IS_ERR(tde))
+		return NULL;
+
+	guard(mutex)(&tde->mtx);
+	tde->de.info->id = de_id;
+	tde->de.enabled = true;
+	tde->de.tstamp_enabled = LINE_TS_VALID_RAW(meta) || USE_BLK_TS_RAW(meta);
+	/* An approximation till the real DE discovery is performed */
+	tde->de.tstamp_support = tde->de.tstamp_enabled;
+
+	if (scmi_telemetry_tde_register(ti, tde)) {
+		scmi_telemetry_free_tde_put(ti, tde);
+		return NULL;
+	}
+
+	scmi_telemetry_de_state_update(ti, ENA_STATE, NULL, true);
+	if (tde->de.tstamp_enabled)
+		scmi_telemetry_de_state_update(ti, ENA_TSTAMP, NULL, true);
+
+	/* Count timestamped DEs */
+	ti->num_des_tstamp += !!tde->de.tstamp_support;
+
+	return tde;
+}
+
+static inline int
+scmi_telemetry_line_data_parse(struct telemetry_de *tde, struct shmti_snap *snap,
+			       u64 *val, u64 *tstamp, struct payload *payld,
+			       struct payload *bts_payld, u32 magic)
+{
+	u32 meta = PAYLD_META_RAW(payld);
+
+	lockdep_assert_held(&tde->mtx);
+
+	/* Clear returned values in case of errors */
+	*val = 0;
+
+	if (tstamp) {
+		*tstamp = 0;
+		if (USE_BLK_TS_RAW(meta)) {
+			/* Read out the actual BLK_TS */
+			*tstamp = scmi_telemetry_blkts_read(magic, tde);
+		} else if (LINE_TS_VALID_RAW(meta)) {
+			/*
+			 * Note that LINE_TS_VALID implies HAS_LINE_EXT and that
+			 * the per DE line_ts_rate is advertised in the DE
+			 * descriptor, BUT we check anyway against buggy FW.
+			 */
+			if (!HAS_LINE_EXT_RAW(meta)) {
+				trace_scmi_tlm_access(tde->de.info->id,
+						      "SHMTI_BAD_TS_LINE", 0, 0);
+				return -EPROTO;
+			}
+
+			*tstamp = LINE_TSTAMP_GET_RAW(&payld->tsl);
+		}
+	}
+
+	/* Data is always valid since we are NOT handling BLK TS lines here */
+	*val = LINE_DATA_GET_RAW(&payld->l);
+
+	trace_scmi_tlm_collect(tstamp ? *tstamp : 0, tde->de.info->id,
+			       *val, "SHMTI_DE_READ");
+
+	scmi_telemetry_tde_cache_update(tde, *val, tstamp, &magic);
+
+	return 0;
+}
+
+/**
+ * scmi_telemetry_tdcf_data_parse  - TDCF DataLine parsing
+ * @ti: A reference to the telemetry info descriptor
+ * @payld: Line payload to parse
+ * @snap: A reference to the working SHMTI snapshot that will be processed
+ * @mode: A flag to determine the behaviour of the scan
+ * @active_bts: A pointer to keep track and report any found BLK timestamp line
+ * @active_uuid: A pointer to keep track and report any found UUID line
+ *
+ * This routine takes care to:
+ *  - verify line consistency in relation to the used flags and the current
+ *    context: e.g. is there an active preceding BLK_TS line if the DataLine
+ *    sports a USE_BLKTS flag ?
+ *  - verify the related Data Event ID exists OR create a brand new DE
+ *    (depending on the @mode of operation)
+ *  - links any active BLK_TS or UUID line to the current DE
+ *  - read and save value/tstamp for the DE ONLY if anything has changed (by
+ *    tracking the last TDCF magic) and update related magic: this allows to
+ *    minimize future needs of single-DE reads
+ *
+ *    Modes of operation.
+ *
+ *    The scan behaviour depends on the chosen @mode:
+ *    - SCAN_LOOKUP: the basic scan which aims to update value associated to
+ *		     existing DEs. Any discovered DataLine that could NOT be
+ *		     matched to an existing, previously discovered, DE is
+ *		     discarded. This is the normal scan behaviour.
+ *    - SCAN_UPDATE: a more advanced scan which provides all the SCAN_LOOKUP
+ *		     features plus takes care to update the DEs location
+ *		     coordinates inside the SHMTI: note that the related DEs are
+ *		     still supposed to have been previously discovered when
+ *		     this scan runs. This is used to update location
+ *		     coordinates for DEs contained in a Group when such group
+ *		     is enabled.
+ *    - SCAN_DISCOVERY: the most advanced scan available which provides all
+ *			the SCAN_LOOKUP features plus discovery capabilities:
+ *			any DataLine referring to a previously unknown DE leads
+ *			to the allocation of a new DE descriptor.
+ *			This mode is used on the first scan at init time, ONLY
+ *			if Telemetry was found to be already enabled at boot on
+ *			the platform side: this helps to maximize gathered
+ *			information when dealing with out of spec firmwares.
+ *			Any usage of this discovery mode other than in a boot-on
+ *			enabled scenario is discouraged since it can easily
+ *			lead to spurious DE discoveries.
+ */
+static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
+					   struct payload *payld,
+					   struct shmti_snap *snap,
+					   enum scan_mode mode,
+					   struct telemetry_block_ts *active_bts,
+					   struct telemetry_uuid *active_uuid)
+{
+	struct telemetry_shmti *shmti = snap->shmti;
+	struct telemetry_de *tde;
+	u64 val, tstamp = 0;
+	u32 de_id;
+
+	de_id = PAYLD_ID_RAW(payld);
+	/* Is this DE ID known ? */
+	tde = scmi_telemetry_tde_lookup(ti, de_id);
+	if (!tde) {
+		if (mode != SCAN_DISCOVERY) {
+			trace_scmi_tlm_access(de_id, "DE_INVALID", 0, 0);
+			return;
+		}
+
+		/* In SCAN_DISCOVERY mode we allocate new DEs for unknown IDs */
+		tde = scmi_telemetry_tde_allocate(ti, de_id, payld);
+		if (!tde) {
+			dev_err(ti->ph->dev,
+				"Cannot allocate TDE for ID:0x%08X\n", de_id);
+			return;
+		}
+	}
+
+	guard(mutex)(&tde->mtx);
+	/*
+	 * Update DE location refs if requested: normally done only on group
+	 * enable.
+	 * Note that all the DE location information is relative to the
+	 * original SHMTI device-memory area, NOT to the snapshot we are parsing.
+	 */
+	if (mode >= SCAN_UPDATE) {
+		u32 de_offs;
+		void __iomem *p;
+
+		/* Offest is the same in the SHMTI and in the snapshot indeed */
+		de_offs = (void __iomem *)payld - (void __iomem *)snap->base;
+		/* Validate location before update */
+		p = scmi_telemetry_payld_offset_safe_calc(shmti, de_offs);
+		if (IS_ERR(p)) {
+			dev_err(ti->ph->dev,
+				"TDE 0x%08X updated location invalid - shmti:%u offs:%u\n",
+				de_id, shmti->info.sid, de_offs);
+			trace_scmi_tlm_access(de_id, "DE_LOCATION_INVALID", 0, 0);
+			return;
+		}
+
+		tde->sid = shmti->info.sid;
+		tde->base = shmti->base;
+		tde->eplg = SHMTI_EPLG(shmti);
+		tde->offset = de_offs;
+
+		trace_scmi_tlm_access(de_id, "DE_LOCATION_UPDATED", 0, 0);
+
+		dev_dbg(ti->ph->dev,
+			"TDCF-updated DE_ID:0x%08X - shmti:%pK  offset:%u\n",
+			tde->de.info->id, tde->base, tde->offset);
+	}
+
+	/*
+	 * Has any value/tstamp really changed ?
+	 * Note that, if the magic currently associated with this TDE has
+	 * NOT changed compared to the current SHMTI magic, nothing could have
+	 * been changed across the whole TDCF, including any relation to
+	 * BLK_TS or UUID lines.
+	 */
+	if (!scmi_telemetry_tde_cache_stale(tde, snap->magic))
+		return;
+
+	/*
+	 * Parse data words ... only for the sake of updating TDE cache,
+	 * any error is logged by ignored.
+	 */
+	scmi_telemetry_line_data_parse(tde, snap, &val, &tstamp, payld, NULL,
+				       snap->magic);
+}
+
+/**
+ * scmi_telemetry_tdcf_line_parse  - Line parser
+ * @ti: A reference to the Telemetry instance
+ * @payld: A reference to the payload representing the line to parse
+ * @snap: A reference to the working SHMTI snapshot that will be processed
+ * @mode: Specification of the scanning mode
+ * @active_bts: A reference used to track the last BLK_TS line found
+ * @active_uuid: A reference used to track the last UUID line found
+ *
+ * Note that @active_bts and @active_uuid references are propagated back and
+ * forth from the line parsers to keep track of the nearest active BLK_TS or
+ * UUID line found in the SHMTI areas and, while doing that, such descriptors
+ * are refcounted and tracked in the xa_lines XArray indexed by @payld.
+ * BLK_TS and UUID descriptors are dropped when no more linked to any DATA line,
+ * during the normal system operation OR later on when the protocol is
+ * de-initialized following a driver removal.
+ *
+ * Return: Number of QWORDS consumed from @payld by this line parsing; note
+ *	   that buggy firmware could return bad, out of range values, so this
+ *	   value MUST be carefully checked for SHMTI boundary overflows by the
+ *	   caller.
+ */
+static int scmi_telemetry_tdcf_line_parse(struct telemetry_info *ti,
+					  struct payload *payld,
+					  struct shmti_snap *snap,
+					  enum scan_mode mode,
+					  struct telemetry_block_ts **active_bts,
+					  struct telemetry_uuid **active_uuid)
+{
+	u32 meta = le32_to_cpu(payld->meta);
+	int used_qwords;
+
+	used_qwords = LINE_LENGTH_QWORDS_RAW(meta);
+	/* Invalid lines are not an error, could simply be disabled DEs */
+	if (DATA_INVALID_RAW(meta)) {
+		trace_scmi_tlm_access(le32_to_cpu(payld->id), "TDCF_INVALID", 0, 0);
+		return used_qwords;
+	}
+
+	/*
+	 * Problematic lines are ignored, their information discarded, and such
+	 * issues are logged, but the scan process continues.
+	 */
+	switch (LINE_TYPE_RAW(meta)) {
+	case TDCF_DATA_LINE:
+		scmi_telemetry_tdcf_data_parse(ti, payld, snap, mode,
+					       *active_bts, *active_uuid);
+		break;
+	default:
+		trace_scmi_tlm_access(PAYLD_ID_RAW(payld), "TDCF_LINE_UNKNOWN", 0, 0);
+		break;
+	}
+
+	return used_qwords;
+}
+
+static inline bool
+scmi_telemetry_shmti_overflow(struct telemetry_shmti *shmti, void __iomem *next)
+{
+	void __iomem *limit = SHMTI_EPLG(shmti);
+
+	/* Is payld->meta accessible ? */
+	if (next >= limit - sizeof(u32))
+		return true;
+
+	next += LINE_LENGTH_BYTES((struct payload __iomem *)next);
+
+	return next > limit;
+}
+
+static inline struct tdcf *snap_tdcf(struct shmti_snap *s)
+{
+	return (struct tdcf *)s->base;
+}
+
+static inline bool
+scmi_telemetry_snap_overflow(struct shmti_snap *snap, const void *next)
+{
+	void *limit = SNAP_EPLG(snap);
+
+	/* Is payld->meta accessible ? */
+	if (next >= limit - sizeof(u32))
+		return true;
+
+	next += LINE_LENGTH_BYTES_RAW(PAYLD_META_RAW((struct payload *)next));
+
+	return next > limit;
+}
+
+static int scmi_telemetry_shmti_snapshot(struct telemetry_shmti *shmti,
+					 struct shmti_snap *work)
+{
+	struct tdcf __iomem *tdcf = shmti->base;
+	int retries = SCMI_TLM_TDCF_MAX_RETRIES;
+	struct tdcf *snap = snap_tdcf(work);
+	u32 startm = 0, endm = 0, live;
+
+	lockdep_assert_held(&shmti->lock);
+
+	do {
+		/* A bit of exponential backoff between retries */
+		fsleep((SCMI_TLM_TDCF_MAX_RETRIES - retries) * SCMI_TLM_TDCF_RETRY_GAP_US);
+
+		memcpy_fromio(snap, tdcf, shmti->info.len);
+		/* Assure the TDCF snapshot has been fully taken before checking seqnum */
+		rmb();
+		/* Used to detect changes while copying */
+		live = TDCF_START_SEQ_GET(tdcf);
+
+		startm = TDCF_START_SEQ_GET_RAW(snap);
+		if (IS_BAD_START_SEQ(startm)) {
+			trace_scmi_tlm_access(0, "MSEQ_BADSTART", startm, 0);
+			continue;
+		}
+
+		endm = TDCF_END_SEQ_GET_RAW(SNAP_EPLG(work));
+		if (startm != endm || startm != live) {
+			trace_scmi_tlm_access(0, "MSEQ_MISMATCH", startm,
+					      startm != endm ? endm : live);
+			continue;
+		}
+
+		trace_scmi_tlm_access(0, "TDCF_SNAPSHOT_OK", startm, endm);
+
+		/* Ensure any snapshot is visible before updating magic */
+		smp_store_release(&work->magic, startm);
+
+		return 0;
+	} while (--retries);
+
+	trace_scmi_tlm_access(0, "TDCF_SNAPSHOT_FAIL", startm, endm);
+
+	return -EPROTO;
+}
+
+/*
+ * True if neither TDCF marker has moved since the cached snapshot was taken.
+ * Any platform update must write one marker before touching data (start first
+ * or end first, depending on the spec's order), so checking both is
+ * independent of that order.
+ */
+static bool scmi_telemetry_shmti_unchanged(struct telemetry_shmti *shmti, u32 magic)
+{
+	struct tdcf __iomem *tdcf = shmti->base;
+
+	return TDCF_START_SEQ_GET(tdcf) == magic &&
+	       TDCF_END_SEQ_GET(SHMTI_EPLG(shmti)) == magic;
+}
+
+/* Returns with the SRCU read lock held (index in *idx) on a snapshot that matched at check time */
+static struct shmti_snap *
+scmi_telemetry_shmti_refresh(struct telemetry_shmti *shmti, int *idx)
+{
+	struct shmti_snap *cur, *work;
+	int ret;
+
+	guard(mutex)(&shmti->lock);
+
+	cur = rcu_dereference_protected(shmti->cur, lockdep_is_held(&shmti->lock));
+	/* Someone else may have refreshed while we waited for the mutex */
+	if (cur && scmi_telemetry_shmti_unchanged(shmti, cur->magic)) {
+		/* Safe: recycling cur requires shmti->lock, which we hold */
+		*idx = srcu_read_lock(&shmti->srcu);
+		return cur;
+	}
+
+	/* Pick the spare buffer */
+	work = (cur == shmti->snaps[0]) ? shmti->snaps[1] : shmti->snaps[0];
+	/*
+	 * Wait for readers that may still be parsing 'work' from its time
+	 * as current
+	 */
+	synchronize_srcu(&shmti->srcu);
+
+	ret = scmi_telemetry_shmti_snapshot(shmti, work);
+	if (ret)
+		return ERR_PTR(ret);
+
+	/*
+	 * Take our read lock BEFORE publishing so 'work' cannot be
+	 * recycled under us
+	 */
+	*idx = srcu_read_lock(&shmti->srcu);
+	rcu_assign_pointer(shmti->cur, work);
+
+	return work;
+}
+
+/**
+ * scmi_telemetry_shmti_scan  - Full SHMTI scan
+ * @ti: A reference to the telemetry info descriptor
+ * @shmti_id: ID of the SHMTI area that has to be scanned
+ * @mode: A flag to determine the behaviour of the scan
+ *
+ * Return: 0 on Success
+ */
+static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
+				     unsigned int shmti_id, enum scan_mode mode)
+{
+	struct telemetry_shmti *shmti = &ti->shmti[shmti_id];
+	struct telemetry_block_ts *active_bts = NULL;
+	struct telemetry_uuid *active_uuid = NULL;
+	unsigned int qwords;
+	struct shmti_snap *snap;
+	struct tdcf *tdcf;
+	int idx, ret = 0;
+	void *next;
+
+	if (!shmti->base)
+		return -ENODEV;
+
+	idx = srcu_read_lock(&shmti->srcu);
+	snap = srcu_dereference(shmti->cur, &shmti->srcu);
+	if (!snap || !scmi_telemetry_shmti_unchanged(shmti, snap->magic)) {
+		/* MUST drop the read lock: refresh calls synchronize_srcu() */
+		srcu_read_unlock(&shmti->srcu, idx);
+		snap = scmi_telemetry_shmti_refresh(shmti, &idx);
+		if (IS_ERR(snap))
+			return PTR_ERR(snap);
+	}
+
+	tdcf = snap_tdcf(snap);
+	next = tdcf->payld;
+	qwords = QWORDS_RAW(tdcf);
+	while (qwords) {
+		int used_qwords;
+
+		/*
+		 * Bailout on any error since we are processing a supposedly
+		 * stable snapshot at this point, so any further error is on
+		 * firmware-side and NOT recoverable: this would mean having to
+		 * drop the remaining part of the scan results after having
+		 * cached the initial good snapshot: log this down below.
+		 */
+		if (scmi_telemetry_snap_overflow(snap, next)) {
+			trace_scmi_tlm_access(0, "SHMTI_OVERFLOW", snap->magic, 0);
+			ret = -EPROTO;
+			break;
+		}
+
+		used_qwords = scmi_telemetry_tdcf_line_parse(ti, next, snap, mode,
+							     &active_bts, &active_uuid);
+		if (used_qwords <= 0 || qwords < used_qwords) {
+			/*
+			 * Stop scanning when qwords inconsistent; if the last
+			 * line processed was sane in itself, though, keep it
+			 * since we anyway previously checked for overflow.
+			 */
+			trace_scmi_tlm_access(PAYLD_ID_RAW(next), "BAD_QWORDS",
+					      snap->magic, 0);
+			ret = -EPROTO;
+			break;
+		}
+
+		next += used_qwords * 8;
+		qwords -= used_qwords;
+	}
+
+	srcu_read_unlock(&shmti->srcu, idx);
+
+	if (ret)
+		dev_err(ti->ph->dev, FW_BUG "Inconsistent TDCF. Scan aborted.\n");
+
+	return ret;
+}
+
 static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
 	.info_get = scmi_telemetry_info_get,
 	.de_lookup = scmi_telemetry_de_lookup,
@@ -1337,6 +2125,12 @@ static void scmi_telemetry_tdes_cleanup(struct telemetry_info *ti)
 	struct scmi_telemetry_de *de;
 	unsigned long idx;
 
+	/*
+	 * Unlinking all the BLK_TS/UUID lines related to a DE triggers also
+	 * the deallocation of such lines when the embedded refcount hits zero.
+	 * Note that the UUID lines are also referenced and refcounted by the
+	 * global UUID RCU array, so they won't be deallocated here.
+	 */
 	xa_for_each(&ti->xa_des, idx, de) {
 		struct telemetry_de *tde = to_tde(de);
 
@@ -1468,6 +2262,9 @@ static int scmi_telemetry_instance_init(struct telemetry_info *ti)
 
 	xa_init(&ti->xa_des);
 
+	atomic_set(&ti->des_enabled[ENA_STATE], 0);
+	atomic_set(&ti->des_enabled[ENA_TSTAMP], 0);
+	mutex_init(&ti->des_enabled_mtx);
 	/* Setup resources lazy initialization */
 	atomic_set(&ti->rinfo_initializing, 0);
 	init_completion(&ti->rinfo_initdone);
-- 
2.54.0

