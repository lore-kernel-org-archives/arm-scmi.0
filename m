Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B072E2C2360
	for <arm-scmi@vger.kernel.org>; Sun,  8 Feb 2026 04:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770523452; cv=none; b=bLduVGyhYZDZB6ZnghsG1sQeJ5G4/u5DNChXSYcWdp6EKDHAkLDKIu/Md8YUehXfq3b9+YPROY3HcM4XIBICSr+8HEFQR0lAkxGh+1gihQJHfQUQIT0N9vqpH9U86473b+VPDkQjSaVOkytZgqPpn2tC8noVv/fMhQe5EQrT0wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770523452; c=relaxed/simple;
	bh=JpvsAwKddEADXQxk09Dwny3N8gtaPchBx889GIKR2NI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cUrMVSQ2uwOVzODux2CwlDdcVnuJ+M2BjKeu3YYIjf+BEtCEdwi4Wm1/pV3UG5jpGyL5eCy51mQzv20UmduNw9E6G7JWV6Pyw0eEPb+5TIpdmzzjIjNKnmCbJMyje5iXjDIpNOu1bHUhda6jA/oweK4kpk7uDINMpgP8p7138d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=O+29arQk; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="O+29arQk"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1248d27f293so8708714c88.0
        for <arm-scmi@vger.kernel.org>; Sat, 07 Feb 2026 20:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770523452; x=1771128252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+bhAXarAsiDSi4QI3h1a+wfZmeyXg3FMQowAFnpxGg=;
        b=O+29arQk+1P7++u+ZGydSNTyRVzibEtJv08Cn3LoRy3PjgGSzKi+HmP121viEZXO4z
         s/vXxY9WQwb0SxYP2Fo3edwdMGwGEi7+MDvn741aZHp4jkAVGLvu755RfBynMBjyKJLQ
         muLlR6Ke6R2U55ROx0fdFiJ+z0iva2okVmuMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770523452; x=1771128252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z+bhAXarAsiDSi4QI3h1a+wfZmeyXg3FMQowAFnpxGg=;
        b=oq+pwdTXDRR7mrXY7+sOfZPkwv5CjzjKNoTdtcBuOxaFtwi7/zavwL1g4Jw0ZxM9Dd
         iO2oDG4USDaOX1axPP17VRJ/xo5aD/4I7v/dpKTFh9lUPW6BEHIMqEEqFa9nUgTysu3f
         qTKoUCUjRzz0BvI624pMFm5dWe00OfiOgNj4uGQaJVNaDT48f0PDKZE+Ipq+19OIaLTc
         ce5PjhB8XlKD5yQFmP2BonX8X1x9pMzGRUHXuQ2dn9lajCimSF4RbzHwU/VMymZyjbp7
         Non4vlPbp6zk5oePh8DFD1dvG3foqOwOYR1KnIyDdomf4qFeC5EFTP7QxRCpCqfPVkG8
         ccaw==
X-Forwarded-Encrypted: i=1; AJvYcCUJRWzw0jMuQ6gv8mAd3zxex8uKKR7D9AwcoenKB8fGHbPV77ishNQHMh+Fnpb2+po6TFXCBqmIpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpGUQdCDoKXsktIoyVkj+b02tl58yqsXAcW6YtlkBIKB0bucJH
	gxJ01wXdy8ISFIQYWG/ISQ5xFk4YVJqEdQpbmGZwI25o+njhKUlRTSAGtPapsl183w==
X-Gm-Gg: AZuq6aKGYHXSR7gFn2AALjA8gtl8bihuQyP9aCUZXPj17sD+EGVvOXEEA2iFlYneZWQ
	B6pdok6+Gs8mgmd18nQMtn/DxnmR/XGnvGbcSGX9b1S9e3mzVESvo8enhDeoWnEczqnKgONgTGz
	HHjIWMkin1N1Ni8xiJoniBQ5FFNcIEf7zGXfKcJKuI8mKwKtFrcJc7m8OnAga3xrkc+cLIKmK6B
	FG+3LsDGzX8rmYt4EHeJiZrAcnGySEFqncVI9KrvEmyYuEaKMUMbqhCERd9jmt6hcvz++FFwAFK
	9ceEBSlDN0u3jEwMal59bATJcoc262C7kjlmd0SEqVroY4CGmNM48v+La3zmhJKdzL2oExLTgi/
	p0T0c6WcGkxGxQn5SYmiLPoRyMB8vuuKyxhdSJZncXw5Aom9lVm3sLntZz/X1zpiqBw35Y73kXH
	1GncTUuh951lqILIesap8KzII4Bv0eJC4JY5pfY9DeH0F3YRp89agq7J95QAaig2Nf1ja1P5M=
X-Received: by 2002:a05:7022:6ba3:b0:11b:8278:9f3a with SMTP id a92af1059eb24-12703fe4606mr3754776c88.8.1770523451893;
        Sat, 07 Feb 2026 20:04:11 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:6d43:22d7:40eb:81e6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041e61b9sm7085064c88.8.2026.02.07.20.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 20:04:10 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	arm-scmi@vger.kernel.org,
	cristian.marussi@arm.com,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sudeep.holla@kernel.org
Subject: [PATCH v2 03/15] firmware: arm_scmi: Use mbox_ring_doorbell() instead of NULL message
Date: Sat,  7 Feb 2026 20:01:25 -0800
Message-ID: <20260207200128.v2.3.I4a01e1fa771c0b1ea7e35882784e4b7f8f33f65b@changeid>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
In-Reply-To: <20260208040240.1971442-1-dianders@chromium.org>
References: <20260208040240.1971442-1-dianders@chromium.org>
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

NOTE: this mailbox client appears to send doorbells and regular
messages on the same mailbox channel (smbox->chan), so it needs some
extra attention. Specifically, the new API behaves differently if you
ring a doorbell while a non-doorbell message is in progress. I don't
believe that this is something we have to worry about with this
mailbox client, though, because the code was calling
mbox_client_txdone() after sending the NULL message. Had a non-mailbox
message been in progress, that would have marked the in-progress
message as done instead of marking the NULL message as done.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Given that this mailbox client appears to exercise the mixed
doorbell/normal message case and the behavior there changed a tiny
bit, I'd love any extra scrutiny on this patch. Thanks!

(no changes since v1)

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
2.53.0.rc2.204.g2597b5adb4-goog

