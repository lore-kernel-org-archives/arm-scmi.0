Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215778;
	b=Z7+Izfg88durJvROyrQ7TfE7i+hiDLYOqQybK+E238MA9gQdz7VHIU5FhbvvnA5KHuDa
	 KCOT+lh4HD9y1rwxBfAuFXrtLyYf/lT724sAi3isBj6cMDkNqOcfEd/bQB4ejqYAk2tU8
	 f2tX2QEygsIyGWlSWnjPYF/YJsZYr4p99+70Cjdm6vk5J3CmMYjXd1BGbL1sfV7eHgOQ8
	 CJy2tOS4oWr9kf9VBf1x11FYc9k5tUOlukKZV1HZTKRlr+toYtkSZUkQuPPrA/AFi0ueS
	 eBUPLQvNdTUjY9New6v4Q/ga1GDoTT10l0F/s/32XvFcxD81ZZ6+2GqsGib1k9xGqCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215778;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZliLoTOyQMZxDeBt88NC1Lduh8AAHkgsG8U0rRDLJlg=;
	b=fb5AZzOLBliSn6to8EOQgcSaxH68bAOmog96/HzMLzKUoFH8la2+T0jM1bNHdypJxCSm
	 lV9LRsOwH6z6t2a2MEzeY5S5tSlJ+zyXS8BIf4XOtpk5EBCoxlaZVPGD+wn4KvNMnY/Mb
	 OyneBUgQeZLGVeh3+AywxhR2NOqbB64bfM0cH8aErJ73PbpsizXKR6m76V+7ljv/Fsc4A
	 WDd/2gzRT5Y+zViykYVHeG7p2D/ih2YipqyghQpvHVC993TShaW3VD4x+7SNpunIuQYg7
	 zu1L+BfKABFhdvz6dSsLPeueanRGMkQ70WRATIBIYTRANtesFPneyDXDfbh+I8xjxIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="PKc/+PjB";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7299160A3819;
	Mon,  9 Nov 2026 09:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7299160A3819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=PKc/+PjB
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01B1C15A1;
	Mon,  9 Nov 2026 01:16:14 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 214153F85F;
	Mon,  9 Nov 2026 01:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794215777; bh=EyFuXjh0NpCGpHb+y4On/CW4yO1lMeHSoYYXTpPOeXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PKc/+PjBjTtp1dc5dXBkvKwc/UAocxRUJpa9M4eKl99SG2r680BWKg4eu9EOfSwae
	 yDOiWcayUFhJrXVfrlU5eS2zabz9c0P+WanjeA782EDOcc8NPeHy03EW55Qa46wEd5
	 tUiogjzQzngXMVcR/OrOQReWHcMG9aK4D1+9oGuQ=
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
Subject: [PATCH v15 25/35] firmware: arm_scmi: Add Telemetry debugfs SHMTI dump support
Date: Mon,  9 Nov 2026 09:12:11 +0000
Message-ID: <20261109091221.2532706-26-cristian.marussi@arm.com>
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

Expose one debugfs entry for each discovered SHMTI that can be used to
dump the related SHMTI in binary form from TBGN up to TEND markers.

No processing is done kernel side, beside using proper accessors for
device memory.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v14 --> v15
 - cleanup local debugfs subtree with debugfs_remove_recursive on remove
v12 --> v13
 - get inode lock on time update
v11 --> v12
 - fix debugfs shmti dump file to use the SID as name
v8 --> v9
 - use kvzalloc/kfree
 - use file_update_time to update debugfs file ts
v5 --> v6
 - added mutex to protect binary dump buffer during reads (Sashiko)
 - using debugfs_create_file_size() (Sashiko)
---
 drivers/firmware/arm_scmi/telemetry.c | 103 ++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index c21700bd1b43..7582fe295a23 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -9,10 +9,12 @@
 #include <linux/bitfield.h>
 #include <linux/compiler_types.h>
 #include <linux/completion.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/eventfd.h>
+#include <linux/fs.h>
 #include <linux/hash.h>
 #include <linux/hashtable.h>
 #include <linux/jhash.h>
@@ -463,6 +465,14 @@ struct telemetry_shmti {
 #define TDCF_OFFS(_b, _p)				\
 	((unsigned long)((__force void *)(_p) - (__force void *)(_b)))
 
+struct scmi_telemetry_dbg_shmti {
+	struct telemetry_shmti *shmti;
+	size_t buf_sz;
+	void *buf;
+	/* Protect this descriptor from concurrent readers using it */
+	struct mutex mtx;
+};
+
 #define SHMTI_EPLG(s)						\
 	({							\
 		struct telemetry_shmti *_s = (s);		\
@@ -590,6 +600,7 @@ struct telemetry_info {
 	unsigned int default_blk_ts_rate;
 	const struct scmi_protocol_handle *ph;
 	struct telemetry_shmti *shmti;
+	struct dentry *shmti_top;
 	struct telemetry_de *tdes;
 	struct xarray xa_des;
 	struct telemetry_uuid *primary_uuid;
@@ -1683,6 +1694,91 @@ scmi_telemetry_enumerate_common_intervals(struct telemetry_info *ti)
 					ti->info.intervals);
 }
 
+static int scmi_telemetry_dbg_shmti_open(struct inode *inode, struct file *filp)
+{
+	struct scmi_telemetry_dbg_shmti *sblob;
+	struct telemetry_shmti *shmti;
+
+	if (!inode->i_private)
+		return -ENODEV;
+
+	shmti = inode->i_private;
+	sblob = kzalloc_obj(*sblob);
+	if (!sblob)
+		return -ENOMEM;
+
+	sblob->shmti = shmti;
+	sblob->buf = kvzalloc(shmti->info.len, GFP_KERNEL);
+	if (!sblob->buf) {
+		kfree(sblob);
+		return -ENOMEM;
+	}
+
+	mutex_init(&sblob->mtx);
+
+	filp->private_data = sblob;
+
+	return 0;
+}
+
+static ssize_t scmi_telemetry_dbg_shmti_read(struct file *filp, char __user *buf,
+					     size_t count, loff_t *ppos)
+{
+	struct scmi_telemetry_dbg_shmti *sblob = filp->private_data;
+
+	/* Dump on first read and again after each rewind to start pos */
+	guard(mutex)(&sblob->mtx);
+	if (!sblob->buf_sz || *ppos == 0) {
+		struct inode *ino = file_inode(filp);
+
+		memcpy_fromio(sblob->buf, sblob->shmti->base,
+			      sblob->shmti->info.len);
+		sblob->buf_sz = sblob->shmti->info.len;
+		/* update inode timestamps */
+		inode_lock(ino);
+		file_update_time(filp);
+		inode_unlock(ino);
+	}
+
+	return simple_read_from_buffer(buf, count, ppos, sblob->buf, sblob->buf_sz);
+}
+
+static int scmi_telemetry_dbg_shmti_release(struct inode *inode, struct file *filp)
+{
+	struct scmi_telemetry_dbg_shmti *sblob = filp->private_data;
+
+	kvfree(sblob->buf);
+	kfree(sblob);
+
+	return 0;
+}
+
+static const struct file_operations scmi_telemetry_dbg_shmti_fops = {
+	.open = scmi_telemetry_dbg_shmti_open,
+	.release = scmi_telemetry_dbg_shmti_release,
+	.read = scmi_telemetry_dbg_shmti_read,
+	.llseek = generic_file_llseek,
+	.owner = THIS_MODULE,
+};
+
+static void scmi_telemetry_debugfs_initialize(struct telemetry_info *ti)
+{
+	const struct scmi_protocol_handle *ph = ti->ph;
+	struct dentry *top;
+
+	top = ph->hops->debugfs_proto_dentry_get(ph);
+	ti->shmti_top = debugfs_create_dir("shmtis", top);
+
+	for (unsigned int i = 0; i < ti->num_shmti; i++) {
+		char id[16];
+
+		snprintf(id, 16, "%u", ti->shmti[i].info.sid);
+		debugfs_create_file_size(id, 0444, ti->shmti_top, &ti->shmti[i],
+					 &scmi_telemetry_dbg_shmti_fops,
+					 ti->shmti[i].info.len);
+	}
+}
+
 static int iter_shmti_update_state(struct scmi_iterator_state *st,
 				   const void *response, void *priv)
 {
@@ -4717,6 +4813,10 @@ static void scmi_telemetry_resources_free(struct telemetry_info *ti)
 	/* Ensure rinfo is no more accessible upfront */
 	smp_store_release(&ti->rinfo, NULL);
 
+	/* Safe removal of SHMTI debugfs tree before freeing underlying data */
+	if (IS_ENABLED(CONFIG_ARM_SCMI_DEBUG_PROTOCOLS))
+		debugfs_remove_recursive(ti->shmti_top);
+
 	kfree(ti->info.shmtis);
 	kfree(ti->shmti);
 
@@ -5078,6 +5178,9 @@ static int scmi_telemetry_protocol_init(const struct scmi_protocol_handle *ph)
 		}
 	}
 
+	if (IS_ENABLED(CONFIG_ARM_SCMI_DEBUG_PROTOCOLS))
+		scmi_telemetry_debugfs_initialize(ti);
+
 	return 0;
 }
 
-- 
2.54.0

