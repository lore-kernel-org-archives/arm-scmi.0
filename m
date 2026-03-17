Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD0B3F8E04;
	Tue, 17 Mar 2026 16:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773766714; cv=none; b=RsEJhuSvQHlToekBiIFZP7ABs7M9zpBjzve9meB0dP23zaAmSucp/B21/yvNMEZveH+FU+Je3vCYBzNh9a4lbzxAS7D8tRQ9aGgSVLL0ZWb+BUY8N67tsUMZ9Utgsvrpc0YFbPo7U9i1H9SUHoNG816MScU3GEe6FWvUPtZ7Frw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773766714; c=relaxed/simple;
	bh=1d8Msfkb3jXOoz8wXs1x/7DySkB/hmwZ+7h+9lIz2O0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ByH3AS4xyZ+JMYQ+7sgsIsHY5HZjk0pv7zTZx3KOTshqvpXCTui00s2JupBku81ZEpeOEC54uoX2Vfw8eqxps3HfFK92hHiczbdUC9gfnFIFeF5fQWLWUBDX3n6utnGPJeNfrY+UX0y7zZx5zCn4F3Vw0nznfEDb/W+0OP0+Dwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B79D219F6;
	Tue, 17 Mar 2026 09:58:25 -0700 (PDT)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D3403F7BD;
	Tue, 17 Mar 2026 09:58:29 -0700 (PDT)
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
Subject: [RFC PATCH 2/4] firmware: arm_scmi: Propagate transport instance handle
Date: Tue, 17 Mar 2026 16:58:09 +0000
Message-ID: <20260317165811.3352752-3-cristian.marussi@arm.com>
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

Propagate down from the SCMI core to the transport channel operations
the per-instance handle received by the transport drivers upon the end of
their probe.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/common.h             | 4 ++--
 drivers/firmware/arm_scmi/driver.c             | 4 ++--
 drivers/firmware/arm_scmi/transports/mailbox.c | 5 +++--
 drivers/firmware/arm_scmi/transports/optee.c   | 6 ++++--
 drivers/firmware/arm_scmi/transports/smc.c     | 4 ++--
 drivers/firmware/arm_scmi/transports/virtio.c  | 6 +++---
 6 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index 0a971cf28a44..2e0116ff8522 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -205,9 +205,9 @@ struct scmi_chan_info {
  * @poll_done: Callback to poll transfer status
  */
 struct scmi_transport_ops {
-	bool (*chan_available)(struct device_node *of_node, int idx);
+	bool (*chan_available)(struct device_node *of_node, int idx, void *hndl);
 	int (*chan_setup)(struct scmi_chan_info *cinfo, struct device *dev,
-			  bool tx);
+			  bool tx, void *hndl);
 	int (*chan_free)(int id, void *p, void *data);
 	unsigned int (*get_max_msg)(struct scmi_chan_info *base_cinfo);
 	int (*send_message)(struct scmi_chan_info *cinfo,
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 69361385be61..b6d46fc08795 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2723,7 +2723,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 	idx = tx ? 0 : 1;
 	idr = tx ? &info->tx_idr : &info->rx_idr;
 
-	if (!info->desc->ops->chan_available(of_node, idx)) {
+	if (!info->desc->ops->chan_available(of_node, idx, info->thndl)) {
 		cinfo = idr_find(idr, SCMI_PROTOCOL_BASE);
 		if (unlikely(!cinfo)) /* Possible only if platform has no Rx */
 			return -EINVAL;
@@ -2753,7 +2753,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 
 	cinfo->id = prot_id;
 	cinfo->dev = &tdev->dev;
-	ret = info->desc->ops->chan_setup(cinfo, info->dev, tx);
+	ret = info->desc->ops->chan_setup(cinfo, info->dev, tx, info->thndl);
 	if (ret) {
 		of_node_put(of_node);
 		scmi_device_destroy(info->dev, prot_id, name);
diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index ae0f67e6cc45..cf996724971d 100644
--- a/drivers/firmware/arm_scmi/transports/mailbox.c
+++ b/drivers/firmware/arm_scmi/transports/mailbox.c
@@ -77,7 +77,8 @@ static void rx_callback(struct mbox_client *cl, void *m)
 		      core->shmem->read_header(smbox->shmem), NULL);
 }
 
-static bool mailbox_chan_available(struct device_node *of_node, int idx)
+static bool
+mailbox_chan_available(struct device_node *of_node, int idx, void *hndl)
 {
 	int num_mb;
 
@@ -180,7 +181,7 @@ static int mailbox_chan_validate(struct device *cdev, int *a2p_rx_chan,
 }
 
 static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
-			      bool tx)
+			      bool tx, void *hndl)
 {
 	const char *desc = tx ? "Tx" : "Rx";
 	struct device *cdev = cinfo->dev;
diff --git a/drivers/firmware/arm_scmi/transports/optee.c b/drivers/firmware/arm_scmi/transports/optee.c
index 07ae18d5279d..ab578152e046 100644
--- a/drivers/firmware/arm_scmi/transports/optee.c
+++ b/drivers/firmware/arm_scmi/transports/optee.c
@@ -312,7 +312,8 @@ static int invoke_process_msg_channel(struct scmi_optee_channel *channel, size_t
 	return 0;
 }
 
-static bool scmi_optee_chan_available(struct device_node *of_node, int idx)
+static bool
+scmi_optee_chan_available(struct device_node *of_node, int idx, void *hndl)
 {
 	u32 channel_id;
 
@@ -367,7 +368,8 @@ static int setup_shmem(struct device *dev, struct scmi_chan_info *cinfo,
 		return setup_dynamic_shmem(dev, channel);
 }
 
-static int scmi_optee_chan_setup(struct scmi_chan_info *cinfo, struct device *dev, bool tx)
+static int scmi_optee_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
+				 bool tx, void *hndl)
 {
 	struct scmi_optee_channel *channel;
 	uint32_t channel_id;
diff --git a/drivers/firmware/arm_scmi/transports/smc.c b/drivers/firmware/arm_scmi/transports/smc.c
index 21abb571e4f2..cb0d9a8f93ca 100644
--- a/drivers/firmware/arm_scmi/transports/smc.c
+++ b/drivers/firmware/arm_scmi/transports/smc.c
@@ -84,7 +84,7 @@ static irqreturn_t smc_msg_done_isr(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static bool smc_chan_available(struct device_node *of_node, int idx)
+static bool smc_chan_available(struct device_node *of_node, int idx, void *hndl)
 {
 	struct device_node *np __free(device_node) =
 					of_parse_phandle(of_node, "shmem", 0);
@@ -130,7 +130,7 @@ static inline void smc_channel_lock_release(struct scmi_smc *scmi_info)
 }
 
 static int smc_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
-			  bool tx)
+			  bool tx, void *hndl)
 {
 	struct device *cdev = cinfo->dev;
 	unsigned long cap_id = ULONG_MAX;
diff --git a/drivers/firmware/arm_scmi/transports/virtio.c b/drivers/firmware/arm_scmi/transports/virtio.c
index 326c4a93e44b..6e1ce01507a6 100644
--- a/drivers/firmware/arm_scmi/transports/virtio.c
+++ b/drivers/firmware/arm_scmi/transports/virtio.c
@@ -373,7 +373,7 @@ static unsigned int virtio_get_max_msg(struct scmi_chan_info *base_cinfo)
 	return vioch->max_msg;
 }
 
-static bool virtio_chan_available(struct device_node *of_node, int idx)
+static bool virtio_chan_available(struct device_node *of_node, int idx, void *hndl)
 {
 	struct scmi_vio_channel *channels, *vioch = NULL;
 
@@ -402,8 +402,8 @@ static void scmi_destroy_tx_workqueue(void *deferred_tx_wq)
 	destroy_workqueue(deferred_tx_wq);
 }
 
-static int virtio_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
-			     bool tx)
+static int
+virtio_chan_setup(struct scmi_chan_info *cinfo, struct device *dev, bool tx, void *hndl)
 {
 	struct scmi_vio_channel *vioch;
 	int index = tx ? VIRTIO_SCMI_VQ_TX : VIRTIO_SCMI_VQ_RX;
-- 
2.53.0

