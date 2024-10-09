Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152F01A2547
	for <arm-scmi@vger.kernel.org>; Wed,  9 Oct 2024 19:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728502015; cv=none; b=nIibJFDRWMdCvCKNmEYWheBNEoSjuxlnMM1AA2Vov4PdbuQuCr/ttF/xSQ3QhoWjaw8+k7b6IefJS9bASkwFaqFARJpYWCQmr+aLbvMYKeZlyoqOrvXsJ+HyGFoKMPz3j27O9kYEWUVeAeZSNUJs7eugNrG2Qx6+R8y6thLRGrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728502015; c=relaxed/simple;
	bh=Qto6o0vKotooPWp0SLGfoeOT+2ctOt78Rzo/wCIheDk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K5fYQRlsp3G9R5yr7QAkBGN9sZ5d+3F65yhRz2q1lWO7BxF5OKU3zfm0ACN6wD3grltLEaUCmx0hcpVBJKdWxV9Qm6bnMqTPDE5VonCUAqb/2yX/ucKYDBbD5PWPbRhcDxBljMU3h0Sd6MQSo3hScbrAicLHT0zsAPWEEUOYQ1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Id3vkmgW; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Id3vkmgW"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6cbe3ea8e3fso1320836d6.0
        for <arm-scmi@vger.kernel.org>; Wed, 09 Oct 2024 12:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1728502012; x=1729106812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aFnRjeTVGGQvd1QanxRfvZGU3hZHGwK30eJuLrfs1Ro=;
        b=Id3vkmgWcrdolH7tpsw3yyJ64zZHctSqHjA2YfxIR8sK2f2r0HqVlgnYDMBknu+1yp
         SxL6kEEQiVJsVFX8R58AhDgJLPah8FCEsM6iHzJ5MRaU8caOVNvp5MLUn+RrhAZUj9bB
         SR2BLqJr4aO1i2Ng6lplWVPKSL+T/JLRKtvHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728502012; x=1729106812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aFnRjeTVGGQvd1QanxRfvZGU3hZHGwK30eJuLrfs1Ro=;
        b=YhnCRCnV11Q80/imbcZQdG05rtyGbbvBVgM8u6ZSGwaC1OY2soIY1ic/IeXSMm+/rG
         nXmknMuQiKKLNm3GtVCbPkDluojdqMPYukyJM+wI8b2dPkFPGIDerd5pxTRIxnBtSD4r
         jPInMqjnsYpQAHW/9cyDo4TXTrjI4Ce8Q1S9DTuoXHkGYNC/oKdN5Y3S/4QPnTyOU+wG
         bt8Jq/SaBYGrg35YU21T/JtVoUEvvBWnm/OQKZybrvIUGsmO07nroPT5Q0lAW9o/Vm02
         KpODa76fr2S73Ct1W8wv2zEAS2IXD4fFFt5nhY35euPHwLW/9VlMS2/fRgE743/uIyJx
         LqFA==
X-Gm-Message-State: AOJu0Yw+3xAS6KsfIVt4hmPH5rxCioyxtLRVJ76zxzJuKr1qJVamO2u+
	BBtMYCICdHERHRgLocdhnNleIP2tTMSt+LKvJ8/eJCFIiis5RpMKnV1PbXGG1bBt7M2mHK7mokY
	8LWOxP6Bsh2jAY6Vx7/4z+tkkOiBQx7Jn1uF5YoaJUo03bzR8FQfqKF7eGNXKzF0oNkHNCxwudf
	J+N9idzmsJj0I5xhcBjbgEnESA8LM8Yr9EKUN2qgfrxh5sUwQ=
X-Google-Smtp-Source: AGHT+IHV0WAEt5thVKS88Lh79SPoGz5dND4w2rxvfSsWAa37Kvxr15vakcbkP62eBOqPs4ChkOCKiA==
X-Received: by 2002:a05:6214:4517:b0:6cb:e517:d1ca with SMTP id 6a1803df08f44-6cbe517d790mr8090676d6.9.1728502012446;
        Wed, 09 Oct 2024 12:26:52 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cba46dfd5fsm48504036d6.52.2024.10.09.12.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 12:26:51 -0700 (PDT)
From: Justin Chen <justin.chen@broadcom.com>
To: arm-scmi@vger.kernel.org,
	cristian.marussi@arm.com,
	sudeep.holla@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	peng.fan@nxp.com,
	bcm-kernel-feedback-list@broadcom.com,
	florian.fainelli@broadcom.com,
	Justin Chen <justin.chen@broadcom.com>
Subject: [PATCH v2] firmware: arm_scmi: Queue in scmi layer for mailbox implementation
Date: Wed,  9 Oct 2024 12:26:37 -0700
Message-Id: <20241009192637.1090238-1-justin.chen@broadcom.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

send_message() does not block in the MBOX implementation. This is
because the mailbox layer has its own queue. However, this confuses
the per xfer timeouts as they all start their timeout ticks in
parallel.

Consider a case where the xfer timeout is 30ms and a SCMI transaction
takes 25ms.

0ms: Message #0 is queued in mailbox layer and sent out, then sits
at scmi_wait_for_message_response() with a timeout of 30ms
1ms: Message #1 is queued in mailbox layer but not sent out yet.
Since send_message() doesn't block, it also sits at
scmi_wait_for_message_response() with a timeout of 30ms
...
25ms: Message #0 is completed, txdone is called and Message #1 is
sent out
31ms: Message #1 times out since the count started at 1ms. Even
though it has only been inflight for 6ms.

Fixes: b53515fa177c ("firmware: arm_scmi: Make MBOX transport a standalone driver")
Signed-off-by: Justin Chen <justin.chen@broadcom.com>
---

Changes in v2:

- Added Fixes tag
- Improved commit message to better capture the issue

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

