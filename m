Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22CD4FDE58
	for <arm-scmi@vger.kernel.org>; Fri,  4 Sep 2026 15:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537585; cv=none; b=eXqktrCUH8ZQbsfo3XjP1GNb2UU/8ARxFkok3sK7cZyxL0RHbAQUcfhGuYGeKo5BoYV6fqRGqWMvOqhhWWoxIjV3U22O6MXksGQ9w2ULWsaEi2ZVfxM+OCM3dwLQ6LQngcmaxu7o5gTHNmKUvKSpOkKiACwpG5uTiMEFBoJqMcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537585; c=relaxed/simple;
	bh=3Y1T3XoJ7c5mWm3mmrY3+bpo1ICcUhGbe6i5pZj3c0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qbhx56sC/Qu2b4trsOqdLhzwMiciOhEA/5ebhEWwZJLBu7aWJdd63C6DbDpGmvDlBm3zRiq1CdrOXOLm/imZOr1m+8j31lG4+lHRdpB+yBjDIACOTmHUQSxE9SlemoY+WvT/NaAxgOrKAE0dXCquLBAxyyefOjK6VMznW942Hck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cHzqbtu2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cHzqbtu2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B5841F00ADE;
	Fri,  4 Sep 2026 15:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788537584;
	bh=YOuPtlCd89VDcYAZchLHFwi0Vkb7iBMZhE1KD8wjzZQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=cHzqbtu2oKa8xTV2illmQ1NwPdajzlpSOZWYJ7gb0ys0ewAN0+NyibgAYWvXIzr7+
	 ADVxK8KKXQlHhXJs0i7mL1TpJYCdwIyC+uDhygvIhVQXf/UxO/lYIK9+Fk+66ZhO8R
	 ffy7FhIJwl313SdfoBvoJGNrvfongszzGYUMXvpgSMnmmnLdXAxU9uLiz3X/KjeysE
	 Al5sKhPsoes065PBfdu/T1UKRc9Dc3RoftfFnFajSCrNEpdnFZaJXZCJ1hHG+GR8Lc
	 hcTEPKICjDFu1RCprlr9itkx/dZ/MiVMPg8TRf8KaoyOL7kNJZCHss4iv7aHRQVEga
	 iC8aa9pfxxKEw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 04 Sep 2026 16:58:00 +0100
Subject: [PATCH v4 5/9] firmware: arm_scmi: Pass protocol ID to transport
 chan_available()
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-acpi_scmi_pcc-v4-5-6ebe9755606e@kernel.org>
References: <20260904-acpi_scmi_pcc-v4-0-6ebe9755606e@kernel.org>
In-Reply-To: <20260904-acpi_scmi_pcc-v4-0-6ebe9755606e@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-team@meta.com
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Breno Leitao <leitao@debian.org>, 
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
X-Mailer: b4 0.16.0

Pass the protocol ID to the transport chan_available() callback so a
transport can distinguish channels associated with different protocols
when they share the same firmware node. This is required by the ACPI PCC
transport to resolve protocol-exclusive PCC subspaces.

Update all transport implementations for the new callback signature.
Existing transports ignore the protocol ID, so there is no functional
change.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
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
index fdc591880c68..7fc9560dc4ea 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -207,7 +207,8 @@ struct scmi_chan_info {
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
index 51829550636f..4fbedd9be852 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2768,7 +2768,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct fwnode_handle *fwnode,
 	if (idr_find(idr, prot_id))
 		return -EEXIST;
 
-	if (!info->desc->ops->chan_available(fwnode, idx)) {
+	if (!info->desc->ops->chan_available(fwnode, prot_id, idx)) {
 		cinfo = idr_find(idr, SCMI_PROTOCOL_BASE);
 		if (unlikely(!cinfo)) /* Possible only if platform has no Rx */
 			return -EINVAL;
diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index b692cae4ff25..56af2cb0f424 100644
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
index 07d3affa0964..6022f74d28f3 100644
--- a/drivers/firmware/arm_scmi/transports/optee.c
+++ b/drivers/firmware/arm_scmi/transports/optee.c
@@ -314,7 +314,8 @@ static int invoke_process_msg_channel(struct scmi_optee_channel *channel, size_t
 	return 0;
 }
 
-static bool scmi_optee_chan_available(struct fwnode_handle *fwnode, int idx)
+static bool
+scmi_optee_chan_available(struct fwnode_handle *fwnode, int prot_id, int idx)
 {
 	u32 channel_id;
 	struct device_node *of_node = to_of_node(fwnode);
diff --git a/drivers/firmware/arm_scmi/transports/smc.c b/drivers/firmware/arm_scmi/transports/smc.c
index 4a4caeb4be31..7fb2736247a3 100644
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
 
diff --git a/drivers/firmware/arm_scmi/transports/virtio.c b/drivers/firmware/arm_scmi/transports/virtio.c
index 6b060d61e0ca..3d608c8c4fe8 100644
--- a/drivers/firmware/arm_scmi/transports/virtio.c
+++ b/drivers/firmware/arm_scmi/transports/virtio.c
@@ -375,7 +375,8 @@ static unsigned int virtio_get_max_msg(struct scmi_chan_info *base_cinfo)
 	return vioch->max_msg;
 }
 
-static bool virtio_chan_available(struct fwnode_handle *fwnode, int idx)
+static bool
+virtio_chan_available(struct fwnode_handle *fwnode, int prot_id, int idx)
 {
 	struct scmi_vio_channel *channels, *vioch = NULL;
 

-- 
2.43.0

