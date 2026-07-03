Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A3230AD0C
	for <arm-scmi@vger.kernel.org>; Fri,  3 Jul 2026 20:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783110345; cv=none; b=AxcYxehsBiGonmlje8OmJrM8ByV2qey8vl4BOj3V5gPW23a4wZ4vbkcmMdI5+ddvllBpH4CK9jJrfsNpjxsixsT5Q/wB0/EJngzRbk73I2Li37i4FSTJb99v0V4kfuYAfeCoHW2qjVkR55dbAFXZs6MiXR5PFo6jNUo3oEvBEuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783110345; c=relaxed/simple;
	bh=J2Ngt8FIcD4Vlwd/VLNFQ0sHxPRNlt+ulOQAOLyazWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A0+HpEI08Y0nL2Pjo/Rvt+JmGIXHtA7pjV5Uvng14tEn8MoQiLYRCsAywZB4yQHq6VOPh++brUsynxAGQf9NZRIBG22zGdhKlhbu1nV2AWHT2nCLcO8RI//iLl7AIjpG3VgtzdveXCbX3+A8uxXeCpQ9dPI8lYItzZq0LXOlM40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LcCRUK40; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LcCRUK40"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E8A71F000E9;
	Fri,  3 Jul 2026 20:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783110344;
	bh=/DBjfiTkQjWpInLO+GuoBUdnqw07CczsiP3GK9pBlKE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LcCRUK40OencMpEG3MrcMqvWnjn7pHyqRYE34CUXUUxamK/NXIcfDH1/SwaqYLQ+L
	 TbmPc4vdCSYtfTpbVpDujOL15Y5pe6VPvVf+6OkI4tV+bHTTUnBCpYe0p9MgEw204e
	 o2/xI4XJqsVsxCqY1i8Syl7PHtYHs2lnA7KZJr6qR1zD/YpJLu0onASoeiWKM/M3qe
	 ePlbSJVBOZvfoBY/dY4XF+z6t0KkP7nDYVrT0Xx007J5pJqHUyajK9kN3mkCKSz1vq
	 0ATiVJNWVuxJS5Hf6bBhmwrTVrDUjvKbgwLPCpKMKramFSArXe9auncRBK2o1LOV9f
	 zrZz57T2Kglzg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 03 Jul 2026 21:22:53 +0100
Subject: [PATCH v3 17/17] firmware: arm_scmi: Clear virtio channel lists on
 free
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-scmi_core_fixes-v3-17-5bae9766abfc@kernel.org>
References: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
In-Reply-To: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

SCMI virtio messages are allocated with devres against the SCMI
platform device, while the virtio channel structures are owned by the
virtio device and can survive SCMI driver unbind and rebind.

virtio_chan_free() only synchronizes channel shutdown. It leaves message
pointers on the channel free list, and possibly on the deferred pending
list or virtqueue, until SCMI devres later frees the messages. A
subsequent SCMI bind can then reuse stale list entries and dereference
freed memory.

After synchronized shutdown, detach any unused virtqueue buffers and
reinitialize both local message lists so no SCMI-devres message pointers
remain in virtio channel state.

Fixes: 5ffc1c4cb896 ("firmware: arm_scmi: Fix devres allocation device in virtio transport")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/transports/virtio.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/firmware/arm_scmi/transports/virtio.c b/drivers/firmware/arm_scmi/transports/virtio.c
index 3282d8271839..c4738b866d62 100644
--- a/drivers/firmware/arm_scmi/transports/virtio.c
+++ b/drivers/firmware/arm_scmi/transports/virtio.c
@@ -178,6 +178,22 @@ static void scmi_vio_channel_cleanup_sync(struct scmi_vio_channel *vioch)
 	wait_for_completion(vioch->shutdown_done);
 }
 
+static void scmi_vio_channel_cleanup(struct scmi_vio_channel *vioch)
+{
+	unsigned long flags;
+
+	while (virtqueue_detach_unused_buf(vioch->vqueue))
+		;
+
+	spin_lock_irqsave(&vioch->free_lock, flags);
+	INIT_LIST_HEAD(&vioch->free_list);
+	spin_unlock_irqrestore(&vioch->free_lock, flags);
+
+	spin_lock_irqsave(&vioch->pending_lock, flags);
+	INIT_LIST_HEAD(&vioch->pending_cmds_list);
+	spin_unlock_irqrestore(&vioch->pending_lock, flags);
+}
+
 /* Assumes to be called with vio channel acquired already */
 static struct scmi_vio_msg *
 scmi_virtio_get_free_msg(struct scmi_vio_channel *vioch)
@@ -484,6 +500,7 @@ static int virtio_chan_free(int id, void *p, void *data)
 	 */
 	virtio_break_device(vioch->vqueue->vdev);
 	scmi_vio_channel_cleanup_sync(vioch);
+	scmi_vio_channel_cleanup(vioch);
 
 	return 0;
 }

-- 
2.43.0

