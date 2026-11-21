Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795304676;
	b=E5gKXBceYeAiEIJB1ojo3tr9jFOZZIs9l4tLcSAU/7UuJabD5LXbXVRLKfMfkia9whDc
	 Bvv9nn92nZRjuheMKP6etUB+QYzge8TgUeu373n2QYg1mNhWfDzq0vytEECtZBjFlJ+W4
	 6jUn575zuEDEpuPAIhClkliuFfVzWxq9d49HM5vA4ef0e7qvknBLwK0HjkRUksmeRnz1G
	 7Ld4t4rgbCRx7QZ2L5k5EfTkx7K0MzOOUjrMzU8/qzUC7cmitNc1qobR4uZwpik6ABq1G
	 nLLHEjRZ8SRzrCxQr2ykgGXJuEhh33WLnNN0vPEOjpqnIT4+wvdjCYXEQ/aeVi54G2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795304676;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QGW1IxiDX5VdKnuif5DjoMpJwzIpz+5fMstOX4KKTaE=;
	b=XrVdfI7ar42bQuE2XS/+WHz4HZZlkzgFYXf9mSKJTk4Cv+B3neRzE2VeJL2DWrnsmUmz
	 hXmeRdfdMUIrcLaHf3abALmqWzLDhpz0mDXY4+kek1nu040MgqejAAaGL5Ul98GgetooR
	 ygnwhCiWj0Gn6LGdh/qJPWA+TLelUCP6jvSiC6vH/tx0eZPi74ieeJnNQOKO51dPTGVag
	 vgkWKTgCad2pNnJY9kR4BsUbogR/uI6WeWxmcd8R90nX3a/N6aLph4eUo/ZQagbPZJlzW
	 mnNNP8l0AV3M3n2dK9As0DeDkWBY7C/H1uDeQ4sbfIJm0BNSxYusTMASilt+ZK9+69w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=cHJc+Qwj;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A67B606A693;
	Sat, 21 Nov 2026 23:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A67B606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=cHJc+Qwj
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DABA1758;
	Sat, 21 Nov 2026 15:44:32 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FDB33F632;
	Sat, 21 Nov 2026 15:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795304674; bh=VHK/Zaew+zy2/DLFlWWTABBhoHjNkucYnAaXxyLYZ54=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cHJc+QwjfIHxmc/OjB8WljmHU8lwTapMQ2yy7rGQf81wnFSDHzH4VVXkheXw1FofA
	 Lf+wwvk3LVM4iAdKmLxsF0x637WzARJhKlFmt5HbbCuMDqBm81QO8ONJRMi89ndCiQ
	 OfVaKuJCFNJ8cPEqGxS13IR/ifQrvYPUpe60QzYI=
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
Subject: [PATCH v16 22/31] firmware: arm_scmi: Add Telemetry debugfs SHMTI dump support
Date: Sat, 21 Nov 2026 23:39:56 +0000
Message-ID: <20261121234005.1525419-23-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261121234005.1525419-1-cristian.marussi@arm.com>
References: <20261121234005.1525419-1-cristian.marussi@arm.com>
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
v15 --> v16
 - initialize/destroy debugFS around SHMTIs init
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
index b74371bc41d5..cd0bd0015c82 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -9,9 +9,11 @@
 #include <linux/bitfield.h>
 #include <linux/compiler_types.h>
 #include <linux/completion.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
+#include <linux/fs.h>
 #include <linux/hash.h>
 #include <linux/hashtable.h>
 #include <linux/jhash.h>
@@ -450,6 +452,14 @@ struct telemetry_shmti {
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
@@ -562,6 +572,7 @@ struct telemetry_info {
 	unsigned int default_blk_ts_rate;
 	const struct scmi_protocol_handle *ph;
 	struct telemetry_shmti *shmti;
+	struct dentry *shmti_top;
 	struct telemetry_de *tdes;
 	struct xarray xa_des;
 	struct telemetry_uuid *primary_uuid;
@@ -1356,6 +1367,10 @@ static void scmi_telemetry_tdes_cleanup(void *arg)
 		scmi_telemetry_de_unlink(&tde->de);
 		scmi_telemetry_free_tde_put(ti, tde);
 	}
+
+	/* Safe removal of SHMTI debugfs tree before freeing underlying data */
+	if (IS_ENABLED(CONFIG_ARM_SCMI_DEBUG_PROTOCOLS))
+		debugfs_remove_recursive(ti->shmti_top);
 }
 
 static int scmi_telemetry_de_descriptors_get(struct telemetry_info *ti)
@@ -1533,6 +1548,91 @@ scmi_telemetry_enumerate_common_intervals(struct telemetry_info *ti)
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
@@ -1748,6 +1848,9 @@ static int scmi_telemetry_enumerate_shmti(struct telemetry_info *ti)
 	/* Expose the fully initialized SHMTI infos */
 	smp_store_release(&ti->info.base.num_shmtis, ti->num_shmti);
 
+	if (IS_ENABLED(CONFIG_ARM_SCMI_DEBUG_PROTOCOLS))
+		scmi_telemetry_debugfs_initialize(ti);
+
 	return devm_add_action_or_reset(ph->dev, scmi_telemetry_tdes_cleanup, ti);
 }
 
-- 
2.54.0

