Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E15434E21
	for <arm-scmi@vger.kernel.org>; Tue, 15 Sep 2026 17:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491906; cv=none; b=VGCe0NR1493BGXorTj/v1b2ldqV6i3ucpxQknpiCpRTiel/E7/Jxh/V1VzGfOXkZP65kDcjXZ62neiInNhFj1pfVhYWjK+tGSEzQsj7/TnzNt862fXDNrwHWlO/W4XeRvyEyiBhPAYa8h1SilG2UUGdVgMfEeT87qFYG2zwpBbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491906; c=relaxed/simple;
	bh=1v/j/D32hBenoZoqXj48roK54C3//D27PHzGH+ctS8o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UT8mN632ORqowlUInzuE8nj0iDM3DCubn2VImhIZKKRt/YNs/C0AvrVyuPoCs5rzckUD1sRj8xosj8fcPzDP1xr31R/xu1+89t8TzJN0JMgUy6L2zsP26J4XPFgoT3/qVzHEQ8AbEBCaCLQnXe8boonpBwAnoU7AHHl/7NFVvnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kwtijee/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kwtijee/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB771F00893;
	Tue, 15 Sep 2026 17:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789491904;
	bh=HqypsUUdO23Qj47zb+gB0M4sE9kBbHmeS7wRMu3awrU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kwtijee/i8sBdNvil2ye+cYgy0C438Ik+R2cZZqipnfRy42gkrmjm1hH8ujGsP4qj
	 Ix0T7amHg2VSf8bGwVGOsd7UPBSsK8IBkhy3H3+1ClSlLpqlSVq7Jn0aJtAUKoiafB
	 aBt8PaKtVrFwYc0eh0w0nit28+/fmtr+FnfKj8EIfdW1bR4euVkpbVlMo7EUwOTjt7
	 boFVWsTTn7McI0fl58PMqli86ZdUHp6JEIsA0gDPFQOcw1YIRn2B2xNd/i0clAY1Bo
	 noat+nnh/ZCQ/7z/bQk3cx+1UthxE+5F4cBcVDrCKYcjl7QirGELRxyHUOCPi/VrHt
	 x+DtAmP9VAH2w==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 15 Sep 2026 18:03:39 +0100
Subject: [PATCH v5 5/9] firmware: arm_scmi: Pass protocol ID to transport
 chan_available()
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-acpi_scmi_pcc-v5-5-298579e9f359@kernel.org>
References: <20260915-acpi_scmi_pcc-v5-0-298579e9f359@kernel.org>
In-Reply-To: <20260915-acpi_scmi_pcc-v5-0-298579e9f359@kernel.org>
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
index 878d27bc315a..19cdb59d6600 100644
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

