Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 996345A0AC5;
	Fri, 16 Oct 2026 18:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792177093; cv=none; b=NyexruNdXlAS3+Rm2CHmUZlwXRT8watcYuiXX9CW+YBTdunwqA5tWxdjlEaDEU7v14IZYkOJkckAXn7ZxO03yYjGKRdYEjNT5X3qFLs5JYG8E5xcEnYyAQqCVsgSzJexflFS4fZaqWTE77IYQ7QlCVrQdiL192kc1eCjXsWYMHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792177093; c=relaxed/simple;
	bh=D1egR04TzY+K21UapbR2oQWnp8Xtg0GzhfYC2Dgq8m8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bRvnA5comjQPzSec35mGR3TQFvqDYblw2PPFR5p6fyms23XKbYZ/e33YjRIj4dgp+C56zPykWZfOMcOcYcE0rzQ6X0bF70gkrKv/D51rMmQq/w3gfNodvhvn8ob91VLRC5uJ5Nna6q8yjwRlQcFovFSRgQ8faDuu9cnu7uH1zMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=u4vMowNN; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="u4vMowNN"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBF8514BF;
	Fri, 16 Oct 2026 11:57:58 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7950D3F7B4;
	Fri, 16 Oct 2026 11:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792177082; bh=D1egR04TzY+K21UapbR2oQWnp8Xtg0GzhfYC2Dgq8m8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u4vMowNNir9YSoB1L9gjW9seND0ltW1wQunuBaRaWle9TrYPOZjlpw/s1ayUGkfDH
	 O/pFmZ7xjPQpdSLFscMupiW5HPoQf1KpM8a5o66k1jSCxdCC+vezPDU/aVwB0D+7Cg
	 cyYfdqm78hWzSbwiz1D4eqpmH9pz91BvusnAXDhU=
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
Subject: [PATCH v14 23/32] firmware: arm_scmi: Add Telemetry debugfs SHMTI dump support
Date: Fri, 16 Oct 2026 19:55:44 +0100
Message-ID: <20261016185553.2794459-24-cristian.marussi@arm.com>
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

Expose one debugfs entry for each discovered SHMTI that can be used to
dump the related SHMTI in binary form from TBGN up to TEND markers.

No processing is done kernel side, beside using proper accessors for
device memory.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
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
 drivers/firmware/arm_scmi/telemetry.c | 98 +++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index a28d13048b54..6e76cfebdf1b 100644
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
 #include <linux/io.h>
 #include <linux/limits.h>
@@ -419,6 +421,14 @@ struct telemetry_shmti {
 	struct scmi_telemetry_shmti_info info;
 };
 
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
@@ -1523,6 +1533,91 @@ scmi_telemetry_enumerate_common_intervals(struct telemetry_info *ti)
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
+	struct dentry *top, *shmti_top;
+
+	top = ph->hops->debugfs_proto_dentry_get(ph);
+	shmti_top = debugfs_create_dir("shmtis", top);
+
+	for (unsigned int i = 0; i < ti->num_shmti; i++) {
+		char id[16];
+
+		snprintf(id, 16, "%u", ti->shmti[i].info.sid);
+		debugfs_create_file_size(id, 0444, shmti_top, &ti->shmti[i],
+					 &scmi_telemetry_dbg_shmti_fops,
+					 ti->shmti[i].info.len);
+	}
+}
+
 static int iter_shmti_update_state(struct scmi_iterator_state *st,
 				   const void *response, void *priv)
 {
@@ -4410,6 +4505,9 @@ static int scmi_telemetry_protocol_init(const struct scmi_protocol_handle *ph)
 		}
 	}
 
+	if (IS_ENABLED(CONFIG_ARM_SCMI_DEBUG_PROTOCOLS))
+		scmi_telemetry_debugfs_initialize(ti);
+
 	return 0;
 }
 
-- 
2.54.0

