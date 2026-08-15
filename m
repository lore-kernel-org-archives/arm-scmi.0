Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A468142CAE6;
	Sat, 15 Aug 2026 18:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786819056; cv=none; b=QsZ0cMH7g4tjAhlDIaSQeBjqHRqVqMoVAlAIgITRYsNTCT8ZKPwmDvpAcTpFpqmM0NsDQLGcZ0ap9zxDqQ2UySR8obkEzb3vxFqIMYtCINFv9mFhEPgkxAkw8Jm4ejFZscuhsPwu7gZiws8v4BdD7HTGmYav+KH4PagyHurUgGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786819056; c=relaxed/simple;
	bh=QOF5jPH04amNi0Qrq2cY14Ny+2P2aKIv1QrXk+T4Sqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BRZWZOYD0epZE3WTSJefjlPpmUn6mPHE+FOVvNtt53KbzePP/iXwwLoHrXBXhaivnqfykGi0vb+ieFmiLh5ru6CLywxpjQvOi2rDweZPxmu8QjpJbgSbpNkh7c/G3grNhSadvFMVNsD6sGC0gRJPQfXTVax5RytBhv1wp0UYKIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=usczsn+K; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="usczsn+K"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1739315A1;
	Sat, 15 Aug 2026 11:37:30 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 237703F632;
	Sat, 15 Aug 2026 11:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786819054; bh=QOF5jPH04amNi0Qrq2cY14Ny+2P2aKIv1QrXk+T4Sqs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=usczsn+KdyN+yUD8BQ8ZfzBuJdvUppKMC6VekFRSl5qsx1sC8UMNAYF6OxUHBQoj1
	 75ZmorE86TOn4u2yusdmbv5Mjxpwobmf90TNpereKmxJGOWWN79yOKYIDehcRqEuDi
	 ++tNOUJmZK3bwcE7V4WHIjVl+t9UIyBCG5OA4P64=
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
Subject: [PATCH v9 16/24] firmware: arm_scmi: Add Telemetry debugfs SHMTI dump support
Date: Sat, 15 Aug 2026 19:35:44 +0100
Message-ID: <20260815183552.3250194-17-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260815183552.3250194-1-cristian.marussi@arm.com>
References: <20260815183552.3250194-1-cristian.marussi@arm.com>
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
v8 --> v9
 - use kvzalloc/kfree
 - use file_update_time to update debugfs file ts
v5 --> v6
 - added mutex to protect binary dump buffer during reads (Sashiko)
 - using debugfs_create_file_size() (Sashiko)
---
 drivers/firmware/arm_scmi/telemetry.c | 95 +++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 8a0cd7f08231..83f4139995d7 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -11,8 +11,11 @@
 #include <linux/compiler_types.h>
 #include <linux/completion.h>
 #include <linux/err.h>
+#include <linux/fs.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/eventfd.h>
+#include <linux/fs.h>
 #include <linux/io.h>
 #include <linux/limits.h>
 #include <linux/minmax.h>
@@ -402,6 +405,14 @@ struct telemetry_shmti {
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
@@ -1449,6 +1460,87 @@ scmi_telemetry_enumerate_common_intervals(struct telemetry_info *ti)
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
+		memcpy_fromio(sblob->buf, sblob->shmti->base,
+			      sblob->shmti->info.len);
+		sblob->buf_sz = sblob->shmti->info.len;
+		/* update inode timestamps */
+		file_update_time(filp);
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
+		snprintf(id, 16, "%u", i);
+		debugfs_create_file_size(id, 0444, shmti_top, &ti->shmti[i],
+					 &scmi_telemetry_dbg_shmti_fops,
+					 ti->shmti[i].info.len);
+	}
+}
+
 static int iter_shmti_update_state(struct scmi_iterator_state *st,
 				   const void *response, void *priv)
 {
@@ -3771,6 +3863,9 @@ static int scmi_telemetry_protocol_init(const struct scmi_protocol_handle *ph)
 		}
 	}
 
+	if (IS_ENABLED(CONFIG_ARM_SCMI_DEBUG_PROTOCOLS))
+		scmi_telemetry_debugfs_initialize(ti);
+
 	return 0;
 }
 
-- 
2.54.0

