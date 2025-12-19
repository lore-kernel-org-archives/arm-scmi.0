Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F75338F24
	for <arm-scmi@vger.kernel.org>; Fri, 19 Dec 2025 11:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766144784; cv=none; b=SEUuwWH11uobJGz7/ZM5YK2LfC83k9hwdZ1FMhOghtpkOFLNlvX5EIkavkedo+u/6445UcnTyJRFI1Wol5/1iu6QRtN+TrfJ/REVrEJofHnRH2VWVPBxPk8JiSdQWw1Ph+J7rq6azf5TjM13Kn1ync323h6HFl8GF1cRTeBBI3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766144784; c=relaxed/simple;
	bh=mBjL/yNWjeY79Dafwb0KAaJwI5kZoGV19sKfmRv2Cjs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S864qx/fcHZW4vJvQoJUGgL6B8SnwOw8tLtgQB0PudI+VIYL1FZb/84JYpuWze2dNOBp4OGIMQJtmMj4tscolIQUiywCCW5Q8f4juavN4bmNsWxT74a/n038Q9HiObScuayhUPKZeVfg4ofR2Av6NnZgAXjAQSA8TrH2WdabLwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PVgS2j1z; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PVgS2j1z"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-597de27b241so1772290e87.2
        for <arm-scmi@vger.kernel.org>; Fri, 19 Dec 2025 03:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766144781; x=1766749581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H3slMuAc0DlPsqmSXZpbwpx526MvEmle/4DotqrbAZE=;
        b=PVgS2j1zmqsFHP7gR9AtwX5QhJHemAER0PQSPUbXUyA4N+Wj4WtJ0FNtekCQQ5nwTb
         E5j3dknHmGrX3S5bJuPF9KFHdAgqySh5/rBEth5PIeFUTfzwhg4t+D8vTPDUCXgN8GPl
         qtYEWcqBXHU4YjDDvKn5JHuFcNtRnj51ba/RTeM+84mzbu48QXpmt8DG+IQxIGkUltuY
         Jm/rOUFTnySmE8JcgvLxINj6nEbKyBGmTjjlFB3+yE1xuqOkOdJFj/zpV/3ZFHmYhNEN
         YQqNeUuQWnzpQvPH/gFt5NlVz4619GGby2A9D2r3s9ws1QdWv0JppvfQ3qrB9oQO0j6i
         xnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766144781; x=1766749581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H3slMuAc0DlPsqmSXZpbwpx526MvEmle/4DotqrbAZE=;
        b=nwodxgdPx+Gngy+8lFyrgGfy2ISbkGSYQALyQIy2XP8qQgcvtx1tF2IEVzioDfASin
         r5Tupn9kkS4dTLTijn8vc1LZIPng1KoEkO3SBJdQpgAQS5jFZqxO6/+ztKHc25m3ms5E
         KJ5Zx8DEQ6uRWrgiZHFhQwxuQVkdHHYUKYdkgCTLSexGNOhdtEwRFNhJ5Yxed9L7P2B2
         3bpcHLidu1/7BRxPYJhEBmu1Rh0r28b3hWg5ljk2o+wn7rUATgZB+K9vB/cOpVSchb0g
         I80ZFBJerSfL7IdS0kHVZi7g+F/sosqpeptk1T27uAlLKnp+mdfbhTS7mnRvXjlJIH/f
         9DiA==
X-Forwarded-Encrypted: i=1; AJvYcCWykFQrGMT9vDvs0SCKF9+u1lezk5/Nl5n/cX2TrMRmrOMLlHKmBt6/PSBjw7xTHTy6mgYDB+Hm4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yya1jGPYo60ys/TRBya7JopjazbKLIADziH4a3AjGPq1FVZ/gsP
	qt2S8eavdYt4D2yAPIB6zgw8SruSAhQwwDXLEi9URpcEHCE2Buq1Uiyiys+nLuFIUAg=
X-Gm-Gg: AY/fxX4AR6unU5B/JxNgFB1nui9JYDz1TomG7/utClVFX1NuTK+dX0fGoVybAE3XQHp
	NM+3j6+fuwiXWzmJ4JhoyrFbOeSadgmR9qjbS9ZqQobD871fuiQAKRTuMRNepYYnpjkKqh1sePk
	pzrZhPtxZxQhusEIt/DF7xTChl7mVZEt+VbFa134/fVEJx/FdrvtUPnqSBughFbpiYerUM9p34M
	EiEcZBSEzQiH8V1e/MEf/a9MWPMdj4pGzKfM96hfPySISRHPbNRM88wACZEkEYEzcLBZ1nxKpNj
	9iqI+xKuQeEanQtmzQ5J6b6XepneUOxo3BT+LBR7rSIsFt0XSvENlXmsCaHCf0p5n3+MQ7FDzU4
	1EOtzofSo3jv2l+p81XcYkmCK4TtQwJiz2JBvNusaST8h+m0b8pORhe+vudD35JYFX2nV1sPqME
	xW2bhyHcb28o833OwmLSfTxzEylk0=
X-Google-Smtp-Source: AGHT+IE2dzwhnzenN7c5SQt80XIPrIwa3arfO8FHTkl1HzzGSCjhijUW2HFHsyB+YFJIWZnI0YzRVg==
X-Received: by 2002:a05:6512:3b86:b0:598:f283:e12f with SMTP id 2adb3069b0e04-59a17d08b96mr1129675e87.11.1766144780522;
        Fri, 19 Dec 2025 03:46:20 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.84])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5ff5sm633651e87.6.2025.12.19.03.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 03:46:20 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: arm_scmi: Fix raw mode async completion race
Date: Fri, 19 Dec 2025 14:46:16 +0300
Message-ID: <20251219114617.2057576-1-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A race condition exists in scmi_xfer_raw_worker() where async_done
completion can be accessed after being nullified by
scmi_xfer_raw_waiter_put() in scmi_handle_response(). This happens
because the worker skips wait_for_completion_timeout() when ret has
an error value and goes directly to nullify the async_done.

Fix by waiting for async_done unconditionally when it exists, without
checking the result of the ret variable. This ensures the worker
always synchronizes properly with the scmi_handle_response()'s complete
for async_done.

Fixes: 3c3d818a9317a ("firmware: arm_scmi: Add core raw transmission support")
Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
Hello maintainers and reviewers,

This patch fixes a race condition in the SCMI raw mode implementation
that can lead to kernel crashes when handling asynchronous delayed
responses.

I temporarily added the trace_printk("%s\n", __func__) to track the problem.

# mount -t tracefs nodev /sys/kernel/tracing
# mount -t debugfs debugfs /sys/kernel/debug
# cd /sys/kernel/debug/tracing
# echo 1 > options/trace_printk
# echo 1 > tracing_on

Doing that until Oops
# echo -e -n 'sorry, but NDA raw msg' > /sys/kernel/debug/scmi/0/raw/message_async 

Without the changes:
[   19.513750] Unable to handle kernel NULL pointer dereference at virtual address NDA
[   19.524756] Oops [#1]
[   19.527034] Modules linked in:
[   19.530097] CPU: 0 UID: 0 PID: 124 Comm: irq/12-1e200000 Not tainted 6.12.0-NDA
...
[   19.638262] [<ffffffff8007af3c>] do_raw_spin_lock+0xa/0x10a
[   19.643843] [<ffffffff80b4e42e>] _raw_spin_lock_irqsave+0x20/0x2c
[   19.649941] [<ffffffff80072dc4>] complete+0x1e/0x76
[   19.654826] [<ffffffff808056bc>] scmi_rx_callback+0x66e/0x7cc
[   19.660589] [<ffffffff80800204>] transport_rx_callback+0x4e/0x56
[   19.666534] [<ffffffff8082f664>] mbox_chan_received_data+0x10/0x1a
[   19.672730] [<ffffffff80830624>] transport_chan_do_rx+0xea/0x136
[   19.678311] [<ffffffff808306c6>] transport_mbox_threaded_isr+0x42/0x9c
[   19.684408] [<ffffffff8008e8ee>] irq_thread_fn+0x1a/0x5a
[   19.689733] [<ffffffff8008e724>] irq_thread+0x16c/0x20a
[   19.694962] [<ffffffff80044032>] kthread+0xda/0xf6
[   19.699761] [<ffffffff80b4f8d6>] ret_from_fork+0xe/0x18
[   19.712403] ---[ end trace 0000000000000000 ]---

With the changes: we dont have the Oops

# echo 0 > tracing_on
# cat trace

Without the changes:
 irq/12-1e200000-120     [000] .....    23.368262: scmi_rx_callback: scmi_handle_response 
   kworker/u45:0-95      [003] .....    23.394836: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put 
 irq/12-1e200000-120     [000] .....    25.625926: scmi_rx_callback: scmi_handle_response 
   kworker/u44:0-94      [002] .....    25.653884: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put 
 irq/12-1e200000-120     [000] .....    27.202031: scmi_rx_callback: scmi_handle_response 
   kworker/u45:0-95      [001] .....    27.228216: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put 
 irq/12-1e200000-120     [000] .....    28.504546: scmi_rx_callback: scmi_handle_response 
   kworker/u45:0-95      [002] .....    28.531534: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put 
 irq/12-1e200000-120     [000] .....    30.102729: scmi_rx_callback: scmi_handle_response 
   kworker/u44:0-94      [003] .....    30.129688: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put 
 irq/12-1e200000-120     [000] .....    31.108407: scmi_rx_callback: scmi_handle_response 
   kworker/u44:0-94      [003] .....    31.136012: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put 
 irq/12-1e200000-120     [000] .....    32.388953: scmi_rx_callback: scmi_handle_response 
   kworker/u44:0-94      [003] .....    32.415700: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put 
 irq/12-1e200000-120     [000] .....    33.737014: scmi_rx_callback: scmi_handle_response 
   kworker/u44:0-94      [002] .....    33.764977: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put 
 irq/12-1e200000-120     [000] .....    34.979096: scmi_rx_callback: scmi_handle_response 
   kworker/u45:0-95      [002] .....    35.005377: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put 
   kworker/u45:0-95      [003] .....    36.758043: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put <- RC
 irq/12-1e200000-119     [000] .....    37.561734: scmi_rx_callback: scmi_handle_response 

Withthe changes:
irq/12-1e200000-120     [000] .....    23.368262: scmi_rx_callback: scmi_handle_response
   kworker/u45:0-95      [003] .....    23.394836: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put
 irq/12-1e200000-120     [000] .....    25.625926: scmi_rx_callback: scmi_handle_response
   kworker/u44:0-94      [002] .....    25.653884: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put
 irq/12-1e200000-120     [000] .....    27.202031: scmi_rx_callback: scmi_handle_response
   kworker/u45:0-95      [001] .....    27.228216: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put
 irq/12-1e200000-120     [000] .....    28.504546: scmi_rx_callback: scmi_handle_response
   kworker/u45:0-95      [002] .....    28.531534: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put
 irq/12-1e200000-120     [000] .....    30.102729: scmi_rx_callback: scmi_handle_response
   kworker/u44:0-94      [003] .....    30.129688: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put
 irq/12-1e200000-120     [000] .....    31.108407: scmi_rx_callback: scmi_handle_response
   kworker/u44:0-94      [003] .....    31.136012: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put
 irq/12-1e200000-120     [000] .....    32.388953: scmi_rx_callback: scmi_handle_response
   kworker/u44:0-94      [003] .....    32.415700: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put
 irq/12-1e200000-120     [000] .....    33.737014: scmi_rx_callback: scmi_handle_response
   kworker/u44:0-94      [002] .....    33.764977: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put
 irq/12-1e200000-120     [000] .....    34.979096: scmi_rx_callback: scmi_handle_response
   kworker/u45:0-95      [002] .....    35.005377: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put
 irq/12-1e200000-120     [000] .....    36.028136: scmi_rx_callback: scmi_handle_response
   kworker/u45:0-95      [003] .....    36.055553: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put
 irq/12-1e200000-120     [000] .....    36.906953: scmi_rx_callback: scmi_handle_response
   kworker/u45:0-95      [002] .....    36.933304: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put
 irq/12-1e200000-120     [000] .....    37.548706: scmi_rx_callback: scmi_handle_response
   kworker/u44:0-94      [003] .....    37.577260: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put
 irq/12-1e200000-120     [000] .....    38.079993: scmi_rx_callback: scmi_handle_response
   kworker/u44:0-94      [002] .....    38.108648: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put
 irq/12-1e200000-120     [000] .....    38.512822: scmi_rx_callback: scmi_handle_response
   kworker/u44:0-94      [002] .....    38.540403: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put
   ...

--
Regards,
Artem

 drivers/firmware/arm_scmi/raw_mode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/raw_mode.c b/drivers/firmware/arm_scmi/raw_mode.c
index 73db5492ab44..362773f3114d 100644
--- a/drivers/firmware/arm_scmi/raw_mode.c
+++ b/drivers/firmware/arm_scmi/raw_mode.c
@@ -479,7 +479,7 @@ static void scmi_xfer_raw_worker(struct work_struct *work)
 				    ret, scmi_inflight_count(raw->handle));
 
 		/* Wait also for an async delayed response if needed */
-		if (!ret && xfer->async_done) {
+		if (xfer->async_done) {
 			unsigned long tmo = msecs_to_jiffies(SCMI_MAX_RESPONSE_TIMEOUT);
 
 			if (!wait_for_completion_timeout(xfer->async_done, tmo))
-- 
2.43.0

