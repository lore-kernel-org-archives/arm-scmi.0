Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549899;
	b=JS47Ci3MxsWUu8kUh/niTD7aedoB9RLesrqmioMLnqDY8Pg3ir89ZvP3mQTKZlsa5xVs
	 kdrlTNwDWA+jwx5S7n+FKqbSA0GQaqzmi6jnTg+/03cWirQ3QaaIoRGYAhK0/3TMmYboh
	 z1TCUHMUExLty73UNZutvXbVgANZ1hGGwW70VH8EkOyefp/LtFrXYOqHEQP4rckPhR9re
	 GYCtEFc0hTaoI39rH+IuOiONVbFSyUZkyaHrZx16Ld8Z4tpz/PymxTfrukTTfox9RsEC0
	 LIAse8mNchlvQaxj0m+ISvPlIUedVqZ3wp+w3BgposkNYFFjgOuu/GrVGZLSytJ4rFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549899;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fZ1h0HkG7jwB0lWLgmteOif9NgtPED9Fuko8fv+xwgw=;
	b=QnzXcEh7tGn7ac551iNSFB+PeID6am7A6VOiOkbVGdUpGEru8rLG7/awU5Kh2NoYPL9d
	 n5G6ViU5ICBUgXZKCRgV1YlAn+dPucp1z+2sedDugnBi9TcA3SBc2cDyrj7pudur6Zjw/
	 D93Ga2av8kO7sShvABq6nHyG+oVqcTOGDCswuzQPMaSkN5tqFTlMjNdIhHtp35AvaQetU
	 aGVf25Yqv+2Tx9/n9+XNcO5IZ8AQcuKuQPFixarrpXeqSPUl4gQfpXQl0bDQdyfvi/CEB
	 gUU2cNtLqjmOnvMswQ1rEmteV5rGhA3F8DS4ASiLmWwCVvkP9DQ285zdtAJP2HFPdFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=PkabxTiQ;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66987606A333;
	Tue, 24 Nov 2026 19:51:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66987606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=PkabxTiQ
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E916339;
	Tue, 24 Nov 2026 11:51:36 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28A523F763;
	Tue, 24 Nov 2026 11:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795549899; bh=jSF2zeAAQQvSDbORs5UUpxEQKgHEtUUDKgytXKp4+1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PkabxTiQ6p4Qjbn7QqLDXMJOiI8gPPYZ7k5+c/s8OQ0WSvt+0KERAX96e1zRFFFvW
	 XFyjJ1jq0In0m4SOeEUamX0tLq1IfLmEZ3CFwiJrmGaqXmB1d7SLZSoJxjd2mouapZ
	 Rlt5vRQdEEC6W4ED2AWLYNGoiy4mP6AZ45OZcWPc=
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
Subject: [PATCH v17 24/34] firmware: arm_scmi: Add common per-protocol debugfs support
Date: Tue, 24 Nov 2026 19:48:30 +0000
Message-ID: <20261124194841.1147072-25-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124194841.1147072-1-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
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

Allow interested SCMI protocols to register their own specific debugfs
entries under a common per-instance and per-protocol subtree rooted
at /sys/kernel/debug/scmi/<N>/protocols/<PROTO_ID>/

Expose a helper to enable protocol initialization code to get access to
such per-protocol/per-instance dentries in order to be able to install
their own dedicated debugfs entries.

Per-protocol debugfs support is configurable and default off.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v16 --> v17
 - fix leak and NULL deref on exit path
v15 --> v16
 - cleanup protocol dbg root after devres group closure
v14 --> v15
 - fix debugfs_remove_recursive call-site...was too early
v8 --> v9
 - avoid NULL deref on DBG cleanup path
v5 --> v6
 - bail out of dentry_get helper when SCMI debug susbsytem failed to init
 - remove stale SCMI protocol operations
 - add a preoper clean up of debugfs when protocol init fails
---
 drivers/firmware/arm_scmi/Kconfig     | 14 +++++++++
 drivers/firmware/arm_scmi/common.h    |  2 ++
 drivers/firmware/arm_scmi/driver.c    | 41 ++++++++++++++++++++++++++-
 drivers/firmware/arm_scmi/protocols.h |  6 ++++
 4 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/arm_scmi/Kconfig
index 783c24a20e29..f506c4d1d96a 100644
--- a/drivers/firmware/arm_scmi/Kconfig
+++ b/drivers/firmware/arm_scmi/Kconfig
@@ -69,6 +69,20 @@ config ARM_SCMI_DEBUG_COUNTERS
 	  such useful debug counters. This can be helpful for debugging and
 	  SCMI monitoring.
 
+config ARM_SCMI_DEBUG_PROTOCOLS
+	bool "Enable SCMI protocols debug"
+	select ARM_SCMI_NEED_DEBUGFS
+	depends on DEBUG_FS
+	default n
+	help
+	  Enables per-protocol specific debug features, where available.
+	  When provided, such per-protocol debugfs entries are grouped
+	  inside a common a subtree named by the protocol number and rooted
+	  under a per-instance 'protocols' directory.
+
+	  Such per-protocol entries subtree structure is freely defined
+	  within the related protocol code.
+
 config ARM_SCMI_QUIRKS
 	bool "Enable SCMI Quirks framework"
 	depends on JUMP_LABEL || COMPILE_TEST
diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index cdd6f887fae7..ed1623da6563 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -307,6 +307,7 @@ enum debug_counters {
 /**
  * struct scmi_debug_info  - Debug common info
  * @top_dentry: A reference to the top debugfs dentry
+ * @protos: A reference to the top debugfs protocols subdirectory
  * @name: Name of this SCMI instance
  * @type: Type of this SCMI instance
  * @is_atomic: Flag to state if the transport of this instance is atomic
@@ -314,6 +315,7 @@ enum debug_counters {
  */
 struct scmi_debug_info {
 	struct dentry *top_dentry;
+	struct dentry *protos;
 	const char *name;
 	const char *type;
 	bool is_atomic;
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 54d9780b7e87..9dd7becb9b1b 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -19,6 +19,7 @@
 #include <linux/acpi.h>
 #include <linux/bitmap.h>
 #include <linux/cleanup.h>
+#include <linux/dcache.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/export.h>
@@ -101,6 +102,8 @@ struct scmi_xfers_info {
  *			has completed.
  * @ph: An embedded protocol handle that will be passed down to protocol
  *	initialization code to identify this instance.
+ * @dbg: An optional reference to this protocol top debugfs directory; it will
+ *	 be automatically recursively removed on protocol de-initialization.
  *
  * Each protocol is initialized independently once for each SCMI platform in
  * which is defined by fwnode and implemented by the SCMI server fw.
@@ -114,6 +117,7 @@ struct scmi_protocol_instance {
 	unsigned int			version;
 	unsigned int			negotiated_version;
 	struct scmi_protocol_handle	ph;
+	struct dentry			*dbg;
 };
 
 #define ph_to_pi(h)	container_of(h, struct scmi_protocol_instance, ph)
@@ -2154,6 +2158,25 @@ static void scmi_common_fastchannel_db_ring(struct scmi_fc_db_info *db)
 		SCMI_PROTO_FC_RING_DB(64);
 }
 
+static struct dentry *
+scmi_debugfs_proto_dentry_get(const struct scmi_protocol_handle *ph)
+{
+	struct scmi_protocol_instance *pi = ph_to_pi(ph);
+	struct scmi_info *info = handle_to_scmi_info(pi->handle);
+
+	if (!IS_ENABLED(CONFIG_ARM_SCMI_DEBUG_PROTOCOLS) || !info->dbg)
+		return ERR_PTR(-ENODEV);
+
+	if (!pi->dbg) {
+		char proto_dir[8];
+
+		snprintf(proto_dir, 8, "0x%02X", pi->proto->id);
+		pi->dbg = debugfs_create_dir(proto_dir, info->dbg->protos);
+	}
+
+	return pi->dbg;
+}
+
 static const struct scmi_proto_helpers_ops helpers_ops = {
 	.extended_name_get = scmi_common_extended_name_get,
 	.get_max_msg_size = scmi_common_get_max_msg_size,
@@ -2164,6 +2187,7 @@ static const struct scmi_proto_helpers_ops helpers_ops = {
 	.protocol_msg_check = scmi_protocol_msg_check,
 	.fastchannel_init = scmi_common_fastchannel_init,
 	.fastchannel_db_ring = scmi_common_fastchannel_db_ring,
+	.debugfs_proto_dentry_get = scmi_debugfs_proto_dentry_get,
 };
 
 /**
@@ -2314,6 +2338,7 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
 {
 	const struct scmi_handle *handle = &info->handle;
 	struct scmi_protocol_instance *pi;
+	struct dentry *dbg = NULL;
 	int ret = -ENOMEM;
 	void *gid;
 
@@ -2345,7 +2370,7 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
 	/* proto->init is assured NON NULL by scmi_protocol_register */
 	ret = pi->proto->instance_init(&pi->ph);
 	if (ret)
-		goto clean;
+		goto clean_dbg;
 
 	ret = idr_alloc(&info->protocols, pi, proto->id, proto->id + 1,
 			GFP_KERNEL);
@@ -2374,8 +2399,12 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
 deinit:
 	if (pi->proto->instance_deinit)
 		pi->proto->instance_deinit(&pi->ph);
+clean_dbg:
+	dbg = pi->dbg;
 clean:
 	devres_release_group(handle->dev, gid);
+	/* Protocol debugfs de-allocation MUST run after devres group release */
+	debugfs_remove_recursive(dbg);
 	return ERR_PTR(ret);
 }
 
@@ -2453,6 +2482,7 @@ void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id)
 
 	if (refcount_dec_and_test(&pi->users)) {
 		const struct scmi_protocol *proto = pi->proto;
+		struct dentry *dbg = pi->dbg;
 		void *gid = pi->gid;
 
 		if (pi->proto->events)
@@ -2464,6 +2494,12 @@ void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id)
 		idr_remove(&info->protocols, protocol_id);
 
 		devres_release_group(handle->dev, gid);
+		/*
+		 * Remove per-protocol top dir only after protocol release in
+		 * order to allow any protocol specific cleanup on the pi->dbg
+		 * subtree.
+		 */
+		debugfs_remove_recursive(dbg);
 		scmi_protocol_put(proto);
 		dev_dbg(handle->dev, "De-Initialized protocol: 0x%X\n",
 			protocol_id);
@@ -3218,6 +3254,9 @@ static struct scmi_debug_info *scmi_debugfs_common_setup(struct scmi_info *info)
 	if (IS_ENABLED(CONFIG_ARM_SCMI_DEBUG_COUNTERS))
 		scmi_debugfs_counters_setup(dbg, trans);
 
+	if (IS_ENABLED(CONFIG_ARM_SCMI_DEBUG_PROTOCOLS))
+		dbg->protos = debugfs_create_dir("protocols", top_dentry);
+
 	dbg->top_dentry = top_dentry;
 
 	if (devm_add_action_or_reset(info->dev,
diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
index 1aa3ee1fb2b0..c39ef77770d1 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -11,6 +11,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/completion.h>
+#include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/kernel.h>
@@ -292,6 +293,9 @@ struct scmi_fc_info {
  *		      gathering FC descriptions from the SCMI platform server.
  * @fastchannel_db_ring: A common helper to ring a FC doorbell.
  * @get_max_msg_size: A common helper to get the maximum message size.
+ * @debugfs_proto_dentry_get: A common helper to get a per-protocol debugfs top
+ *			      directory to use as a root. It will be
+ *			      recursively removed on protocol de-initialization.
  */
 struct scmi_proto_helpers_ops {
 	int (*extended_name_get)(const struct scmi_protocol_handle *ph,
@@ -315,6 +319,8 @@ struct scmi_proto_helpers_ops {
 				 u32 *rate_limit);
 	void (*fastchannel_db_ring)(struct scmi_fc_db_info *db);
 	int (*get_max_msg_size)(const struct scmi_protocol_handle *ph);
+	struct dentry *(*debugfs_proto_dentry_get)
+		(const struct scmi_protocol_handle *ph);
 };
 
 /**
-- 
2.54.0

