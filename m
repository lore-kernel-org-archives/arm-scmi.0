Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A672C326C
	for <arm-scmi@vger.kernel.org>; Mon, 16 Feb 2026 18:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771265490; cv=none; b=F5MSVklrMp3nlYjA2XPL5ecswpB/QbOduy3EBdI4ne6ENmZFbgUturDRK2iWHUCHM2+ZXBkcYKXrXPdvHEYED7eGELoDlXWlv/0kmwWwZB1ALhYNoIxV8WPdUhfJHz8nD+bK7elSfCQ74f+80acVWQRCLExUO8yNJJNt3nGm3No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771265490; c=relaxed/simple;
	bh=+607S4Sa52IGLHPOE6uFJa9rkx8P/LizPZWNWoD5Hvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c+xLfut9YOQfVkiQVTcG7OhLuRnRFvKYWydSGRa9dTQrk0H1TXDlyj/D3vNHaXQ8FvDxFoh9KXQ0NZ2vFujSen9B6TakGw1fDrtp8dHWLgT4CmixaMCiwAfh3gwuJxxJI+ODXPfngkvQsEpH91Tj/2mKknkcHGguiPTbSDSQGSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G8oAidob; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G8oAidob"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2ba94dbf739so3492694eec.1
        for <arm-scmi@vger.kernel.org>; Mon, 16 Feb 2026 10:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1771265488; x=1771870288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESsYEinmAI9cWzRkrWAAeFjrdNwaMwa0qK/fG3RugZk=;
        b=G8oAidob5kSaCLTJ8RAav7I3SVoElcIUQ1nK4IU4uB0QNVMK7Y3v3hr9r/E4tfnYDi
         O+VccY9eegOzqIhP+BWrS0J6cwLMkepqQ/+N8Ku0/JFbml85RDiwL9xHO4/jmaVCyPVU
         //SGlE0FnyBWZberGGN8jt3etPWt1BiuWBtM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771265488; x=1771870288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ESsYEinmAI9cWzRkrWAAeFjrdNwaMwa0qK/fG3RugZk=;
        b=ZG0hbkOus4XEwjQJQd8gE2n6iUGDh39CsglJ36mXi/3zVRhkaPVDl20MGzFi2Ou+Uy
         IJlY6XuAStOa/pQIyK3APYqQEEgfHnE011Li/Hr2MbIU7TsrmV/6E3zcNA4fIDq0FsGd
         dlhG5RnCwqGNVHxyKkkiPxOXqXblJpIuPwiN9n2/KZ1PdueK4vRMw8afnnKAlMUwpH0U
         W8CUS4exTxqdkbH0bMGAMxrud4o3uZTBmXm9rl2RmoQFe2IKYstcBCTSXAFpjl2kC8kj
         264+6bFnmtYt9vgsS7pB5R/NiJnEbeZ3ggzYJyAtIF/Xl8d/MNaWgQBtdHTg8RWO1meF
         9Hbg==
X-Forwarded-Encrypted: i=1; AJvYcCVeFMAIUv9ID/a2h9su/BPjwu7/T2wRoTNk2eMmFTCnH+xAPvqv0bl/9t+zHMRV08+njZM6YtxVyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKhnJSc5WZ7vLgv6F/pFOF21oTJdr5Jla7atMxQ6h8I7aDdPQa
	c4l16epkfYC1CVvsMhRphZubsUJ19Q+ll5iKgU0OGBFFrGTuTAFd1dxpXkv9srbNWQ==
X-Gm-Gg: AZuq6aKd0qyFcMW1OJPtjsLxm1lXSkYNx9Xi2h0mf34o1DNiS7JfU4FwxpzBlDjY2aq
	aOJ8FQgJiILdd8u+OPvlGARaUizQEVvWNCcWr02B+jDUj9lyvSNeKgtL6ys9TePtXOjzS1YsG2L
	fOG4fV7J+rBJPxVd+XU26AlyJx2+Ii2LMgaRhDC0C7J5cRHqkHUAO+N4+kZ7hPSI/ohuKJiXCCq
	Y8kkVLRcpwYSrUxkP7aAu51ySqKNK4nkfw3Uwz4WTeAcvaFi8/elJeh0LQSSbBGs1CdVkoT3o0+
	OshiP6Vr2L+KufXmYTmzAVgETFbneoNj6K6fY8NPpAtjrJ9P4BKtKTjKgMXhRAdrd41z4btVn1Q
	qS/6e8Rl195ai9juME1/HmreHbB8cwgCmQR5AG6plqMdWvHLiroSgdWpT0kcoHWHJqWpzQXfxWQ
	cbn9Anw/qYJQJLv6DHp9qJtgxP+E9oeeWl6AHJywMv9b0tRybyUPdlS9z8rz8mQI7p6NXtOljW2
	31DKasdsb8=
X-Received: by 2002:a05:7301:1f12:b0:2ba:8d14:631d with SMTP id 5a478bee46e88-2babc3baca4mr2777562eec.11.1771265488333;
        Mon, 16 Feb 2026 10:11:28 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:2953:dae1:1e39:73b3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742c64282sm13724326c88.5.2026.02.16.10.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 10:11:26 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sudeep.holla@kernel.org
Subject: [PATCH v3 03/15] firmware: arm_scmi: Use mbox_ring_doorbell() instead of NULL message
Date: Mon, 16 Feb 2026 10:09:40 -0800
Message-ID: <20260216100943.v3.3.I4a01e1fa771c0b1ea7e35882784e4b7f8f33f65b@changeid>
X-Mailer: git-send-email 2.53.0.273.g2a3d683680-goog
In-Reply-To: <20260216181002.3475421-1-dianders@chromium.org>
References: <20260216181002.3475421-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per the patch ("mailbox: Deprecate NULL mbox messages; Introduce
mbox_ring_doorbell()"), we want to switch all users of NULL mailbox
messages to use mbox_ring_doorbell().

The mbox_ring_doorbell() explicitly documents not to call
mbox_client_txdone() for doorbells, so remove the call.

NOTE: upon first glance, this mailbox client appears to send doorbells
and regular messages on the same mailbox channel (smbox->chan), so it
needs some extra attention. Specifically, the new API behaves
differently if you ring a doorbell while a non-doorbell message is in
progress. I don't believe that this is something we have to worry
about with this mailbox client, though, because the code was calling
mbox_client_txdone() after sending the NULL message. Had a non-mailbox
message been in progress, that would have marked the in-progress
message as done instead of marking the NULL message as done.

In discussion [1], it was further clarified that the driver shouldn't
ever be sending doorbell and non-doorbell messages on the same
channel.

Link: http://lore.kernel.org/r/aYoPLzOjPvJbu0Kb@pluto [1]
Tested-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Updated patch description based on Cristian's response.

 drivers/firmware/arm_scmi/transports/mailbox.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index ae0f67e6cc45..c4561441ac2e 100644
--- a/drivers/firmware/arm_scmi/transports/mailbox.c
+++ b/drivers/firmware/arm_scmi/transports/mailbox.c
@@ -324,7 +324,6 @@ static void mailbox_clear_channel(struct scmi_chan_info *cinfo)
 {
 	struct scmi_mailbox *smbox = cinfo->transport_info;
 	struct mbox_chan *intr_chan;
-	int ret;
 
 	core->shmem->clear_channel(smbox->shmem);
 
@@ -338,12 +337,7 @@ static void mailbox_clear_channel(struct scmi_chan_info *cinfo)
 	else
 		return;
 
-	ret = mbox_send_message(intr_chan, NULL);
-	/* mbox_send_message returns non-negative value on success, so reset */
-	if (ret > 0)
-		ret = 0;
-
-	mbox_client_txdone(intr_chan, ret);
+	mbox_ring_doorbell(intr_chan);
 }
 
 static bool
-- 
2.53.0.273.g2a3d683680-goog

