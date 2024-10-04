Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FCF14A4C6
	for <arm-scmi@vger.kernel.org>; Fri,  4 Oct 2024 22:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728079983; cv=none; b=Zl7KouoMX52/Oiqo/L0t9dJ7iHzyOjLwVvcA5N7Xm0FsAO7c7krjXySdBhwRFh6q+VfYQf4saEOlPwaAtiWIGZOBrF0hNMh8t7Rq+NQcNPULoeBc3ix5ApOgOIgmOkmhXAiOw/i+4Bw1WqjIboiAqZ8Vm6HMtRcL6WzJ2Qj+wu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728079983; c=relaxed/simple;
	bh=bWW3mRZDjQTvHJyP7ldRvoHCrgEbmxBvlHnCe2bcXsE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dle3iP+uNTXRtd4k8P//To7BBfoaBtJiL59oa2UNLzHsEDfvKPzgz9nw9lv/8H/ya/dEY7YEl3Bei/I7XKjEm/BI4oeUI+jPz9yRD5DiRuiDURHrlcXjoqfj8KGAQmhMaGVIQD9dYtRZR8TCrVB8SjCtX6L65tPwknOH2MtxtSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=KB259b8/; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="KB259b8/"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2e07d91f78aso2006035a91.1
        for <arm-scmi@vger.kernel.org>; Fri, 04 Oct 2024 15:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1728079980; x=1728684780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5i2tvARMEKs1BcO4Ftg1r7i2RWQdz+ikPGPGd5oFEA=;
        b=KB259b8/+3rEAXzPIm5N+Evfnj0z0g2VXasFkstSdk4D55GafTUW+i25QHyQSC305f
         NjjbSL8FXyc6bevkH4DBDFpq4QPNs7QUXzll397VTqH+XHDC5IQomRRdq5JNT/DatsDf
         Aj2NJI73HoLuSbttQe6QGTDuXtyFwGLjgbDFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728079980; x=1728684780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z5i2tvARMEKs1BcO4Ftg1r7i2RWQdz+ikPGPGd5oFEA=;
        b=lqgVWo3pIAb24rXlLj3hnrNJhYJhBH7dSsXi11wZoYJhjS7h2vRmQKpVEnuWf+/8Ib
         IHwwZz8h0dEWEcjihj3T50MiW1EB4B6hrI7MQzCwHenxolzGJ3qzwf9Q1FRzePW85DJa
         6I3OPIxt56vF0b2bjXivnExcOxFX92yowt6Ut8uA26r3iYCNE7/+bZVG2qTWibEk4KTP
         GbB7ts0VR4GWbWHBA5nTs7aZDw9qbqagqU3EIEEbfPQXv5BVU7voNy3+4Rcqw1eIm/1j
         vTFyQQMgsCXtBcjt2jc0W807M1b7Oz0niiVZIXtVLlDdai8chFIsTvyRSDu2K5pjDfIz
         8S9g==
X-Gm-Message-State: AOJu0Yz2KRcd54cUl3lqeD2UaflvleXqPjk7TKDtFoQ3n5e9qqiQmoub
	McNiPSOFOJ6sa4MURnKRQlac2CspqDuBU/HwzVb53vgS18jrj4+AZLnc2QrzYC5J4Wm83Jo7+2j
	hwQuskwXYmfFoBcecN5t6d11kTHnhGXMwT4CjCWrZ1MaQ8Yo00f0P3yl5bTb+K2t/oID6VUIM0F
	2b2q093ODcrziSJJBNfe3KIL/hZNOWWNkQli44hegud1P4DBY=
X-Google-Smtp-Source: AGHT+IEKg9l8YjuKcXZKUA+ZP6ePVAkCGioCnkA0fIpSBEqrQXBWAbJ1u+ngE0FbeYvWh5Ra6p0JIA==
X-Received: by 2002:a17:90a:de83:b0:2d8:c17b:5018 with SMTP id 98e67ed59e1d1-2e1e62275d9mr4960982a91.11.1728079980476;
        Fri, 04 Oct 2024 15:13:00 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e9f6c37515sm404734a12.75.2024.10.04.15.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 15:13:00 -0700 (PDT)
From: Justin Chen <justin.chen@broadcom.com>
To: arm-scmi@vger.kernel.org,
	cristian.marussi@arm.com,
	sudeep.holla@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	peng.fan@nxp.com,
	bcm-kernel-feedback-list@broadcom.com,
	florian.fainelli@broadcom.com,
	Justin Chen <justin.chen@broadcom.com>
Subject: [PATCH] firmware: arm_scmi: Queue in scmi layer for mailbox implementation
Date: Fri,  4 Oct 2024 15:12:57 -0700
Message-Id: <20241004221257.2888603-1-justin.chen@broadcom.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mailbox layer has its own queue. However this confuses the per
message timeouts since the clock starts ticking the moment the messages
get queued up. So all messages in the queue have there timeout clocks
ticking instead of only the message inflight. To fix this, lets move the
queue back into the SCMI layer.

Signed-off-by: Justin Chen <justin.chen@broadcom.com>
---
 .../firmware/arm_scmi/transports/mailbox.c    | 21 +++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index 1a754dee24f7..30bc2865582f 100644
--- a/drivers/firmware/arm_scmi/transports/mailbox.c
+++ b/drivers/firmware/arm_scmi/transports/mailbox.c
@@ -33,6 +33,7 @@ struct scmi_mailbox {
 	struct mbox_chan *chan_platform_receiver;
 	struct scmi_chan_info *cinfo;
 	struct scmi_shared_mem __iomem *shmem;
+	struct mutex chan_lock;
 };
 
 #define client_to_scmi_mailbox(c) container_of(c, struct scmi_mailbox, cl)
@@ -205,6 +206,7 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 	cl->rx_callback = rx_callback;
 	cl->tx_block = false;
 	cl->knows_txdone = tx;
+	mutex_init(&smbox->chan_lock);
 
 	smbox->chan = mbox_request_channel(cl, tx ? 0 : p2a_chan);
 	if (IS_ERR(smbox->chan)) {
@@ -267,11 +269,21 @@ static int mailbox_send_message(struct scmi_chan_info *cinfo,
 	struct scmi_mailbox *smbox = cinfo->transport_info;
 	int ret;
 
+	/*
+	 * The mailbox layer has it's own queue. However the mailbox queue confuses
+	 * the per message SCMI timeouts since the clock starts when the message is
+	 * submitted into the mailbox queue. So when multiple messages are queued up
+	 * the clock starts on all messages instead of only the one inflight.
+	 */
+	mutex_lock(&smbox->chan_lock);
+
 	ret = mbox_send_message(smbox->chan, xfer);
 
 	/* mbox_send_message returns non-negative value on success, so reset */
 	if (ret > 0)
 		ret = 0;
+	else
+		mutex_unlock(&smbox->chan_lock);
 
 	return ret;
 }
@@ -281,13 +293,10 @@ static void mailbox_mark_txdone(struct scmi_chan_info *cinfo, int ret,
 {
 	struct scmi_mailbox *smbox = cinfo->transport_info;
 
-	/*
-	 * NOTE: we might prefer not to need the mailbox ticker to manage the
-	 * transfer queueing since the protocol layer queues things by itself.
-	 * Unfortunately, we have to kick the mailbox framework after we have
-	 * received our message.
-	 */
 	mbox_client_txdone(smbox->chan, ret);
+
+	/* Release channel */
+	mutex_unlock(&smbox->chan_lock);
 }
 
 static void mailbox_fetch_response(struct scmi_chan_info *cinfo,
-- 
2.34.1

