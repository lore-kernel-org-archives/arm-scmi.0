Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AE4249E5
	for <arm-scmi@vger.kernel.org>; Mon, 25 May 2026 20:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779741863; cv=none; b=OltaH6PNAk67AQw9mImA/JCgxuYGp3QF9Y8GJRTUIOmNpJOdm+zPZK20BrCjMiB7IcWipalX6yxerUxDuf+mGLq4zjBXg9R5EvZ2F1+lIado4Qu5WBXm6RK/4iMeYq8YnWQUsYE7vORgdwvTYGs2kKVRXJiPTvXEWEXT4gqQAfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779741863; c=relaxed/simple;
	bh=ONKqIga9UMTvrdUGcCvxQtlF41Pa+VLz7tpuZMQQHGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sDNX6AyL+jsBKe9dnkppVSryktXw85p5Z0czrH0JvUUbiZyhVFVjRpAmKudw0xsq67+Pt1kmhYT8liYUlt/W+uGpmzcffeleUtbFGu1WNQ6rfXF/Ufuw2ruz1rEa4y7Rs+YHMAQCI059OtvgcDZoY3gxd1VnYUx9fSgrW8Metvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJiIXfrP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJiIXfrP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAFFC1F00A3C;
	Mon, 25 May 2026 20:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779741862;
	bh=Ebh+qC76+pwPDMUafdDOqBQUy6KD27u6bV+kYnteobc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gJiIXfrPfqk7vh2noKNi7TCOreqF6daDoVRwJV1ucwIQ3J7MDImljadMlAfwHU5OA
	 WZydXswPlBL5+gPHMIMNTsX5nacwlJRk6R/ClHqUDnsf8umO+ZFS1gwdqxlUGUD5yg
	 AFBZmgIkH8GPRoiwgnFgZpvpTqa3kfFmEL/igAA61yhgGRZhpBilXk/SXG+0pPiCIB
	 m/P747BIxsfYDPE2EzzGMAp5dLcrJXp9rIbbO0ByPpOmCEngBK4DqL+4P0kzmZ3f8J
	 UYhBT9vdLyvcavMpXXTVuFnqBwzpAVX/SEhz/yjwRD8BRX2+Qp+CTqVEeULNuXa/Dm
	 zhd8qaPpG0t5A==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Mon, 25 May 2026 21:42:44 +0100
Subject: [PATCH v2 6/9] firmware: arm_scmi: Pass protocol ID to
 chan_available() transport callback
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-acpi_scmi_pcc-v2-6-4f38938d08d8@arm.com>
References: <20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com>
In-Reply-To: <20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

Extend the SCMI transport_ops chan_available() callback to include the
protocol ID (prot_id) as an argument. This allows transports to determine
channel availability based on the specific protocol being used, improving
flexibility in platforms that share transport channels across multiple
protocols. This will be useful when ACPI PCC transport gets added.

Updated all existing users and definitions of chan_available() in
SCMI core and transport drivers (mailbox, optee, etc.) accordingly.

No functional change.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/common.h             | 3 ++-
 drivers/firmware/arm_scmi/driver.c             | 2 +-
 drivers/firmware/arm_scmi/transports/mailbox.c | 3 ++-
 drivers/firmware/arm_scmi/transports/optee.c   | 3 ++-
 drivers/firmware/arm_scmi/transports/smc.c     | 3 ++-
 drivers/firmware/arm_scmi/transports/virtio.c  | 3 ++-
 6 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index 192c7d697f2e..347e0da0d9cc 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -204,7 +204,8 @@ struct scmi_chan_info {
  * @poll_done: Callback to poll transfer status
  */
 struct scmi_transport_ops {
-	bool (*chan_available)(struct fwnode_handle *fwnode, int idx);
+	bool (*chan_available)(struct fwnode_handle *fwnode, int prot_id,
+			       int idx);
 	int (*chan_setup)(struct scmi_chan_info *cinfo, struct device *dev,
 			  bool tx);
 	int (*chan_free)(int id, void *p, void *data);
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 04a0d8202504..02f14167c918 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2723,7 +2723,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct fwnode_handle *fwnode,
 	idx = tx ? 0 : 1;
 	idr = tx ? &info->tx_idr : &info->rx_idr;
 
-	if (!info->desc->ops->chan_available(fwnode, idx)) {
+	if (!info->desc->ops->chan_available(fwnode, prot_id, idx)) {
 		cinfo = idr_find(idr, SCMI_PROTOCOL_BASE);
 		if (unlikely(!cinfo)) /* Possible only if platform has no Rx */
 			return -EINVAL;
diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index 280623e576f8..86b35a1e7b0e 100644
--- a/drivers/firmware/arm_scmi/transports/mailbox.c
+++ b/drivers/firmware/arm_scmi/transports/mailbox.c
@@ -77,7 +77,8 @@ static void rx_callback(struct mbox_client *cl, void *m)
 		      core->shmem->read_header(smbox->shmem), NULL);
 }
 
-static bool mailbox_chan_available(struct fwnode_handle *fwnode, int idx)
+static bool
+mailbox_chan_available(struct fwnode_handle *fwnode, int prot_id, int idx)
 {
 	int num_mb;
 	struct device_node *of_node = to_of_node(fwnode);
diff --git a/drivers/firmware/arm_scmi/transports/optee.c b/drivers/firmware/arm_scmi/transports/optee.c
index be2630982c72..e89bd281fe72 100644
--- a/drivers/firmware/arm_scmi/transports/optee.c
+++ b/drivers/firmware/arm_scmi/transports/optee.c
@@ -312,7 +312,8 @@ static int invoke_process_msg_channel(struct scmi_optee_channel *channel, size_t
 	return 0;
 }
 
-static bool scmi_optee_chan_available(struct fwnode_handle *fwnode, int idx)
+static bool
+scmi_optee_chan_available(struct fwnode_handle *fwnode, int prot_id, int idx)
 {
 	u32 channel_id;
 	struct device_node *of_node = to_of_node(fwnode);
diff --git a/drivers/firmware/arm_scmi/transports/smc.c b/drivers/firmware/arm_scmi/transports/smc.c
index 5ea32f8c562c..9fd9830f69ba 100644
--- a/drivers/firmware/arm_scmi/transports/smc.c
+++ b/drivers/firmware/arm_scmi/transports/smc.c
@@ -84,7 +84,8 @@ static irqreturn_t smc_msg_done_isr(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static bool smc_chan_available(struct fwnode_handle *fwnode, int idx)
+static bool
+smc_chan_available(struct fwnode_handle *fwnode, int prot_id, int idx)
 {
 	struct device_node *of_node = to_of_node(fwnode);
 	struct device_node *np __free(device_node) = NULL;
diff --git a/drivers/firmware/arm_scmi/transports/virtio.c b/drivers/firmware/arm_scmi/transports/virtio.c
index cb749ac7ab46..7137165dc204 100644
--- a/drivers/firmware/arm_scmi/transports/virtio.c
+++ b/drivers/firmware/arm_scmi/transports/virtio.c
@@ -373,7 +373,8 @@ static unsigned int virtio_get_max_msg(struct scmi_chan_info *base_cinfo)
 	return vioch->max_msg;
 }
 
-static bool virtio_chan_available(struct fwnode_handle *fwnode, int idx)
+static bool
+virtio_chan_available(struct fwnode_handle *fwnode, int prot_id, int idx)
 {
 	struct scmi_vio_channel *channels, *vioch = NULL;
 

-- 
2.43.0

