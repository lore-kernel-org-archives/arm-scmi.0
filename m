Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CB31EE029
	for <arm-scmi@vger.kernel.org>; Mon, 20 Jan 2025 21:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737408275; cv=none; b=UYc36+Rn9Wv1UVm99boZbTuzkWKpdtuNPrHP4+TGrVzgvTgxUsv+w503b2s71TzjdzuYc7rOjnybp/9LfAHI6XlJ5jaw5U6QUlTALaI9ZJZBsU5qdQ27L4WXvAHjuS4T6HwpTBXcDJtC01t4wvZ+XQCkDE8yP6QElQUznL3NEKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737408275; c=relaxed/simple;
	bh=BMzrf+5PE/W19MQGerqO3U7+x75j4v7NJ9M/fPJxO6g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=FnN1La5N9IxWgjn7qzSxt5vtSFB+fC3ArgD7JwgBYykQHT8bOxX1GuscCb4SnTsiI2q3zLiODbSqRzREdww9I7bbqJzZXuFXM5b3Cjna1JyR60GujWZSyXg6A4hGcXz2wYZ/tmHqkmZSqACYU43Bi1jA4q6Puhwt8oFcV9t3/T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LOY1gey3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LOY1gey3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737408272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KxU3JdBAeVtqTxqK28+IsVvwnIdRSd24xGRcP1Fs0Lc=;
	b=LOY1gey3JstB13+D7jqoAIFfAPandP5iiEVBb9vW+tLgkHTb7zxCIVna16OMG3rkZgD4Xv
	F8RKapzo2OEZoJeDqiwVjP2oI4X4nYr0Ueq7vMiCWJHwdfpAGHQeeqmT7bPmLEfkOXoGbz
	4QfpU2CD5YsHiPyQzqoCpwinHT0TCps=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-454-cn2L1q3qNBKRwObT92B8Dg-1; Mon,
 20 Jan 2025 16:24:28 -0500
X-MC-Unique: cn2L1q3qNBKRwObT92B8Dg-1
X-Mimecast-MFC-AGG-ID: cn2L1q3qNBKRwObT92B8Dg
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 69B961955F2D;
	Mon, 20 Jan 2025 21:24:27 +0000 (UTC)
Received: from thinkpad-p1.kanata.rendec.net (unknown [10.22.65.113])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 38C5A19560B0;
	Mon, 20 Jan 2025 21:24:26 +0000 (UTC)
From: Radu Rendec <rrendec@redhat.com>
To: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [RFC PATCH] firmware: arm_scmi: Support mailbox transports with no completion IRQ
Date: Mon, 20 Jan 2025 16:24:18 -0500
Message-ID: <20250120212418.889385-1-rrendec@redhat.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: E9Hk9UHBMIZPyub-uWKQzUQ56mJskM_E4xBR8KvvsnA_1737408267
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

With the introduction of no_completion_irq in struct scmi_chan_info in
commit a690b7e6e774 ("firmware: arm_scmi: Add configurable polling mode
for transports") it became possible to enable polling mode by default
when the transport does not support completion interrupts.

Mailbox controllers on the other hand have a similar mechanism to
indicate if completion interrupts are available, using the txdone_irq
flag in struct mbox_controller. This is available since the introduction
of the mailbox framework in commit 2b6d83e2b8b7 ("mailbox: Introduce
framework for mailbox").

Since the mailbox framework is already aware of whether the underlying
transport supports completion interrupts or not, set the flag correctly
in mailbox_chan_setup() to propagate the information to the SCMI core
layer. Without this change, scmi_wait_for_reply() would end up taking
the second branch for a mailbox transport with no completion IRQ
support, and time out waiting for an interrupt that never comes.

Signed-off-by: Radu Rendec <rrendec@redhat.com>
---
 drivers/firmware/arm_scmi/transports/mailbox.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index b66df29814566..33722f2d82787 100644
--- a/drivers/firmware/arm_scmi/transports/mailbox.c
+++ b/drivers/firmware/arm_scmi/transports/mailbox.c
@@ -9,6 +9,7 @@
 #include <linux/err.h>
 #include <linux/device.h>
 #include <linux/mailbox_client.h>
+#include <linux/mailbox_controller.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
@@ -221,6 +222,9 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 		return ret;
 	}
 
+	if (!smbox->chan->mbox->txdone_irq)
+		cinfo->no_completion_irq = true;
+
 	/* Additional unidirectional channel for TX if needed */
 	if (tx && a2p_rx_chan) {
 		smbox->chan_receiver = mbox_request_channel(cl, a2p_rx_chan);
-- 
2.47.1

