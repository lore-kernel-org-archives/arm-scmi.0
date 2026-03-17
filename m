Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71CD33F99C6;
	Tue, 17 Mar 2026 16:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773766720; cv=none; b=FPkP/hlLYV8K+NlKrWjUfAXLEQaR3+JACLVEJ93lkrznLp9bwZ5ObaPra8FvAc1LL3exi2D167cjnC6rLcLywUQme2FpaS7oxxLTmTg4HqnXahHu2YCJ2IfrcztBV/aTny1EUX+2/FPVq9HbsL/NlbBOyE6Y/HveIJI4JLqUNr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773766720; c=relaxed/simple;
	bh=ywdl1D3jcs+t+Z6oKbOQIQ/t6256N7Fbicu3G8Pzsg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CNoziEsz/UBJOZHmYMELjoaW4G6fYqLVhrFloEWoGnEoYwTVpaExTje00Oxttwb9Cv+znp/aSzDj2riNKW1vwkPH5EniX9vvHBRLFvYuT1qA1qbar79YSJuysmPEa0u9nD1EeFIIYqVej1Hk7rDheyymYpPNmsnVoyyxEpq1KJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C34D21477;
	Tue, 17 Mar 2026 09:58:31 -0700 (PDT)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 17A803F7BD;
	Tue, 17 Mar 2026 09:58:34 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	philip.radford@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	dan.carpenter@linaro.org,
	gatien.chevallier@foss.st.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [RFC PATCH 4/4] firmware: arm_scmi: optee: Rework transport probe sequence
Date: Tue, 17 Mar 2026 16:58:11 +0000
Message-ID: <20260317165811.3352752-5-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317165811.3352752-1-cristian.marussi@arm.com>
References: <20260317165811.3352752-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the new per-instance transport handles list to synchronize and
optionally defer the core SCMI probe up until the transport driver has
completely been initialized and is fully operational.

Add also a local xarray to keep track of the association between the
tee_client_device and the per-instance agent for the purpose of resource
cleanup.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/transports/optee.c | 137 +++++++++++--------
 1 file changed, 79 insertions(+), 58 deletions(-)

diff --git a/drivers/firmware/arm_scmi/transports/optee.c b/drivers/firmware/arm_scmi/transports/optee.c
index ab578152e046..08f7b2b9b9d6 100644
--- a/drivers/firmware/arm_scmi/transports/optee.c
+++ b/drivers/firmware/arm_scmi/transports/optee.c
@@ -13,6 +13,7 @@
 #include <linux/slab.h>
 #include <linux/tee_drv.h>
 #include <linux/uuid.h>
+#include <linux/xarray.h>
 #include <uapi/linux/tee.h>
 
 #include "../common.h"
@@ -99,6 +100,26 @@ enum scmi_optee_pta_cmd {
 #define PTA_SCMI_CAPS_MASK		(PTA_SCMI_CAPS_SMT_HEADER | \
 					 PTA_SCMI_CAPS_MSG_HEADER)
 
+/**
+ * struct scmi_optee_agent - OP-TEE transport private data
+ *
+ * @dev: Device used for communication with TEE
+ * @tee_ctx: TEE context used for communication
+ * @caps: Supported channel capabilities
+ * @mu: Mutex for protection of @channel_list
+ * @channel_list: List of all created channels for the agent
+ * @node: Used to enqueue this agent
+ */
+struct scmi_optee_agent {
+	struct device *dev;
+	struct tee_context *tee_ctx;
+	u32 caps;
+	/* Protect channel_list*/
+	struct mutex mu;
+	struct list_head channel_list;
+	struct list_head node;
+};
+
 /**
  * struct scmi_optee_channel - Description of an OP-TEE SCMI channel
  *
@@ -115,6 +136,7 @@ enum scmi_optee_pta_cmd {
  * @io_ops: Transport specific I/O operations
  * @tee_shm: TEE shared memory handle @req or NULL if using IOMEM shmem
  * @link: Reference in agent's channel list
+ * @agent: Reference to the agent owning this channel
  */
 struct scmi_optee_channel {
 	u32 channel_id;
@@ -130,29 +152,13 @@ struct scmi_optee_channel {
 	struct scmi_shmem_io_ops *io_ops;
 	struct tee_shm *tee_shm;
 	struct list_head link;
-};
-
-/**
- * struct scmi_optee_agent - OP-TEE transport private data
- *
- * @dev: Device used for communication with TEE
- * @tee_ctx: TEE context used for communication
- * @caps: Supported channel capabilities
- * @mu: Mutex for protection of @channel_list
- * @channel_list: List of all created channels for the agent
- */
-struct scmi_optee_agent {
-	struct device *dev;
-	struct tee_context *tee_ctx;
-	u32 caps;
-	struct mutex mu;
-	struct list_head channel_list;
+	struct scmi_optee_agent *agent;
 };
 
 static struct scmi_transport_core_operations *core;
 
-/* There can be only 1 SCMI service in OP-TEE we connect to */
-static struct scmi_optee_agent *scmi_optee_private;
+static DEFINE_XARRAY(scmi_active_agents);
+static DEFINE_SCMI_TRANSPORT_INSTANCE_QUEUE(scmi_available_agents);
 
 /* Open a session toward SCMI OP-TEE service with REE_KERNEL identity */
 static int open_session(struct scmi_optee_agent *agent, u32 *tee_session)
@@ -222,7 +228,7 @@ static int get_capabilities(struct scmi_optee_agent *agent)
 
 static int get_channel(struct scmi_optee_channel *channel)
 {
-	struct device *dev = scmi_optee_private->dev;
+	struct device *dev = channel->agent->dev;
 	struct tee_ioctl_invoke_arg arg = { };
 	struct tee_param param[1] = { };
 	unsigned int caps = 0;
@@ -241,7 +247,7 @@ static int get_channel(struct scmi_optee_channel *channel)
 	param[0].u.value.a = channel->channel_id;
 	param[0].u.value.b = caps;
 
-	ret = tee_client_invoke_func(scmi_optee_private->tee_ctx, &arg, param);
+	ret = tee_client_invoke_func(channel->agent->tee_ctx, &arg, param);
 
 	if (ret || arg.ret) {
 		dev_err(dev, "Can't get channel with caps %#x: %d / %#x\n", caps, ret, arg.ret);
@@ -268,9 +274,9 @@ static int invoke_process_smt_channel(struct scmi_optee_channel *channel)
 	param[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
 	param[0].u.value.a = channel->channel_id;
 
-	ret = tee_client_invoke_func(scmi_optee_private->tee_ctx, &arg, param);
+	ret = tee_client_invoke_func(channel->agent->tee_ctx, &arg, param);
 	if (ret < 0 || arg.ret) {
-		dev_err(scmi_optee_private->dev, "Can't invoke channel %u: %d / %#x\n",
+		dev_err(channel->agent->dev, "Can't invoke channel %u: %d / %#x\n",
 			channel->channel_id, ret, arg.ret);
 		return -EIO;
 	}
@@ -299,9 +305,9 @@ static int invoke_process_msg_channel(struct scmi_optee_channel *channel, size_t
 	param[2].u.memref.shm = channel->tee_shm;
 	param[2].u.memref.size = SCMI_SHMEM_MAX_PAYLOAD_SIZE;
 
-	ret = tee_client_invoke_func(scmi_optee_private->tee_ctx, &arg, param);
+	ret = tee_client_invoke_func(channel->agent->tee_ctx, &arg, param);
 	if (ret < 0 || arg.ret) {
-		dev_err(scmi_optee_private->dev, "Can't invoke channel %u: %d / %#x\n",
+		dev_err(channel->agent->dev, "Can't invoke channel %u: %d / %#x\n",
 			channel->channel_id, ret, arg.ret);
 		return -EIO;
 	}
@@ -334,7 +340,8 @@ static int setup_dynamic_shmem(struct device *dev, struct scmi_optee_channel *ch
 	const size_t msg_size = SCMI_SHMEM_MAX_PAYLOAD_SIZE;
 	void *shbuf;
 
-	channel->tee_shm = tee_shm_alloc_kernel_buf(scmi_optee_private->tee_ctx, msg_size);
+	channel->tee_shm = tee_shm_alloc_kernel_buf(channel->agent->tee_ctx,
+						    msg_size);
 	if (IS_ERR(channel->tee_shm)) {
 		dev_err(channel->cinfo->dev, "shmem allocation failed\n");
 		return -ENOMEM;
@@ -390,17 +397,19 @@ static int scmi_optee_chan_setup(struct scmi_chan_info *cinfo, struct device *de
 	cinfo->transport_info = channel;
 	channel->cinfo = cinfo;
 	channel->channel_id = channel_id;
+	channel->agent = list_entry(hndl, struct scmi_optee_agent, node);
 	mutex_init(&channel->mu);
 
 	ret = setup_shmem(dev, cinfo, channel);
 	if (ret)
 		return ret;
 
-	ret = open_session(scmi_optee_private, &channel->tee_session);
+	ret = open_session(channel->agent, &channel->tee_session);
 	if (ret)
 		goto err_free_shm;
 
-	ret = tee_client_system_session(scmi_optee_private->tee_ctx, channel->tee_session);
+	ret = tee_client_system_session(channel->agent->tee_ctx,
+					channel->tee_session);
 	if (ret)
 		dev_warn(dev, "Could not switch to system session, do best effort\n");
 
@@ -411,14 +420,14 @@ static int scmi_optee_chan_setup(struct scmi_chan_info *cinfo, struct device *de
 	/* Enable polling */
 	cinfo->no_completion_irq = true;
 
-	mutex_lock(&scmi_optee_private->mu);
-	list_add(&channel->link, &scmi_optee_private->channel_list);
-	mutex_unlock(&scmi_optee_private->mu);
+	mutex_lock(&channel->agent->mu);
+	list_add(&channel->link, &channel->agent->channel_list);
+	mutex_unlock(&channel->agent->mu);
 
 	return 0;
 
 err_close_sess:
-	close_session(scmi_optee_private, channel->tee_session);
+	close_session(channel->agent, channel->tee_session);
 err_free_shm:
 	if (channel->tee_shm)
 		tee_shm_free(channel->tee_shm);
@@ -438,11 +447,11 @@ static int scmi_optee_chan_free(int id, void *p, void *data)
 	if (!channel)
 		return 0;
 
-	mutex_lock(&scmi_optee_private->mu);
+	mutex_lock(&channel->agent->mu);
 	list_del(&channel->link);
-	mutex_unlock(&scmi_optee_private->mu);
+	mutex_unlock(&channel->agent->mu);
 
-	close_session(scmi_optee_private, channel->tee_session);
+	close_session(channel->agent, channel->tee_session);
 
 	if (channel->tee_shm) {
 		tee_shm_free(channel->tee_shm);
@@ -524,7 +533,7 @@ static struct scmi_desc scmi_optee_desc = {
 };
 
 static const struct of_device_id scmi_of_match[] = {
-	{ .compatible = "linaro,scmi-optee" },
+	{ .compatible = "linaro,scmi-optee", .data = &scmi_available_agents},
 	{ /* Sentinel */ },
 };
 
@@ -538,12 +547,6 @@ static int scmi_optee_service_probe(struct tee_client_device *scmi_pta)
 	struct tee_context *tee_ctx;
 	int ret;
 
-	/* Only one SCMI OP-TEE device allowed */
-	if (scmi_optee_private) {
-		dev_err(dev, "An SCMI OP-TEE device was already initialized: only one allowed\n");
-		return -EBUSY;
-	}
-
 	tee_ctx = tee_client_open_context(NULL, scmi_optee_ctx_match, NULL, NULL);
 	if (IS_ERR(tee_ctx))
 		return -ENODEV;
@@ -563,15 +566,14 @@ static int scmi_optee_service_probe(struct tee_client_device *scmi_pta)
 	if (ret)
 		goto err;
 
-	/* Ensure agent resources are all visible before scmi_optee_private is */
+	/* Ensure agent resources are visible */
 	smp_mb();
-	scmi_optee_private = agent;
-
-	ret = platform_driver_register(&scmi_optee_driver);
-	if (ret) {
-		scmi_optee_private = NULL;
+	ret = xa_insert(&scmi_active_agents, (unsigned long)scmi_pta, agent,
+			GFP_KERNEL);
+	if (ret)
 		goto err;
-	}
+
+	SCMI_TRANSPORT_INSTANCE_REGISTER(agent->node, scmi_available_agents);
 
 	return 0;
 
@@ -583,19 +585,15 @@ static int scmi_optee_service_probe(struct tee_client_device *scmi_pta)
 
 static void scmi_optee_service_remove(struct tee_client_device *scmi_pta)
 {
-	struct scmi_optee_agent *agent = scmi_optee_private;
+	struct scmi_optee_agent *agent;
 
-	if (!scmi_optee_private)
+	agent = xa_erase(&scmi_active_agents, (unsigned long)scmi_pta);
+	if (!agent)
 		return;
 
-	platform_driver_unregister(&scmi_optee_driver);
-
-	if (!list_empty(&scmi_optee_private->channel_list))
+	if (!list_empty(&agent->channel_list))
 		return;
 
-	/* Ensure cleared reference is visible before resources are released */
-	smp_store_mb(scmi_optee_private, NULL);
-
 	tee_client_close_context(agent->tee_ctx);
 }
 
@@ -618,7 +616,30 @@ static struct tee_client_driver scmi_optee_service_driver = {
 	},
 };
 
-module_tee_client_driver(scmi_optee_service_driver);
+static int __init scmi_transport_optee_init(void)
+{
+	int ret;
+
+	ret = tee_client_driver_register(&scmi_optee_service_driver);
+	if (ret)
+		return ret;
+
+	ret = platform_driver_register(&scmi_optee_driver);
+	if (ret) {
+		tee_client_driver_unregister(&scmi_optee_service_driver);
+		return ret;
+	}
+
+	return ret;
+}
+module_init(scmi_transport_optee_init);
+
+static void __exit scmi_transport_optee_exit(void)
+{
+	platform_driver_unregister(&scmi_optee_driver);
+	tee_client_driver_unregister(&scmi_optee_service_driver);
+}
+module_exit(scmi_transport_optee_exit);
 
 MODULE_AUTHOR("Etienne Carriere <etienne.carriere@foss.st.com>");
 MODULE_DESCRIPTION("SCMI OPTEE Transport driver");
-- 
2.53.0

