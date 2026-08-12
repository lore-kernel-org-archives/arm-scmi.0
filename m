Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15D43C2775
	for <arm-scmi@vger.kernel.org>; Wed, 12 Aug 2026 22:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786574596; cv=none; b=r45GB2NDvWs8X3cuVhcOBNnYdAIZ/DEY8YaLcCHdE3vXNfWImIZipsPj16kQu9Q2w4irefZmBaxAaSM0/xlW3WzOKTppyRO7a1k7J0STlURgzcrYR1iwh2O3KtOLSzrI3rP/eGxSGawlrzvQAZ4FSQNROOpCwsZeW0o/Leha9Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786574596; c=relaxed/simple;
	bh=ZjjddZ3ufCejsuOorLFN/h1ueV8Mks3Cj4jCvcK73Cs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HoI4hJU9HZ5O1aQSxAeGFWE9BPTK2QH+lqRRgHwRzI0K7h+g6h3XQ0pfNO2Qi1Zz8g8Kq66ZAiUYuy/+O2Zv6+7NemVu1kHO+0Ome/qkscphyxCOWSf16gqejnItjL6nrcAolzb1zHWnCZ6sB6bldxTAbjv5FvW8hHpG0p3QJKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rivian.com; spf=pass smtp.mailfrom=rivian.com; dkim=pass (2048-bit key) header.d=rivian.com header.i=@rivian.com header.b=D155KrIw; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rivian.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivian.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivian.com header.i=@rivian.com header.b="D155KrIw"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso2516989a91.1
        for <arm-scmi@vger.kernel.org>; Wed, 12 Aug 2026 15:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivian.com; s=google; t=1786574594; x=1787179394; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:subject:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=917WXUrvmTdfV1Ds9vTzrf1PvH2S3YGxTHPj94AsWWw=;
        b=D155KrIwHQvoZna1mJ8A9klts4Ky8XHrlFwtpfZOecqbpP8AAFX9dQTSqyRuAcpaX1
         WT34xDOYbjvGbjFSNLe1EhlympJkWxhXOi7hE/n7FvAC0bGV86vxrzeI3Wv18nOyRuX+
         4BYx1ztYqDVBkQmHAPcDakUwr2O8gQpQH3cQ/7C+XSlsnmqKk/QOPwHfIHNXXb2LYGFw
         5VvVaDgv6Hx8K1266VmXue0OF301bWZP0+BYfVoEumRW1j0CVWvYAu95T5yho3CWdJLI
         28ozdDbmNXESPjdLm0L6vOpk+0iMrFMqDyWA1R7jwqS+OCD3AEUE6vVaFuEQ/atNKOvx
         orBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786574594; x=1787179394;
        h=content-type:mime-version:message-id:date:subject:cc:to:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=917WXUrvmTdfV1Ds9vTzrf1PvH2S3YGxTHPj94AsWWw=;
        b=UG7s+ehc2phbK/qCi3rCHm+mlOzE3Q8OV8cWKd4vxLYDTww2fhFo/N3KBoN65q9Asp
         x9d9z8p7Iw6BuNrcx+5qwdCcmu2UGyJQKeIqqTQfepPLXGMExmveIbKFNnTqdWPLsc+S
         /mfshkxg8sOj+f3ULQcp9IWVxgOmkBIo5WcVB5YUHG0CsKNnIc1xNIBLwR2m4rKNf+DG
         FUzsPiPrboGdKlGCKIoSOysrHmCnXWOpJaD+Ga4v6ZFjCHxRaEuZzdYPrxXVSi0iQ0bK
         hGo+rFA+Vp0yaSDQj3hqkzfjhBLl+Oi3/xh9eHWBv44lQ9Kxcoo2w12EZrDp9fEdmWny
         kodw==
X-Forwarded-Encrypted: i=1; AHgh+Rqtb6mMyL62obZH0KPHAVahVR9TVxvF5nklKGmWJsjVyd+rF1OlWKIgJ/ddudx6Rvvjs7GFPkW0uA==@vger.kernel.org
X-Gm-Message-State: AOJu0YynmNgfvuIL/OU5eUFBd1BOkcQd0McgStv2L3aa2XUdqIKyXGhb
	h1h9Yzi9fxyKVZnw1H6yvAhlig33IraGrfj9IbQP0qH5aSFOr7HB3nmKf7vcv/eDaeorpLoO9bU
	XGtTYHteq6ffjqBRXrWLZSDvS96eINwA2YZR8qSFtRZzoatJKi152dypDDfyaBle+6xE=
X-Gm-Gg: AR+sD13cyoBZ0dt4biHXJut+lwstLb8d3KJ+TEKtPE8k6SVzIB8/Ojoyq93LUHKZ4GN
	+VClPJxDAJbTDMMFeniPrhmaB598kDHy/Pr2WcIsvenjW9YzIu0PTkVxvtUBRc/hX8xcv2gZkS3
	NnwnF3P+NIq0F/n5Dzq5OiKKpw3hfmhvlT2992CyX0xxURNweRWPkwyW9IEmZ4vpj/yOyPnrRcK
	XiDJUp6sLUPTH2zsErydFYb3cWwrghc+JOT8tgtEs/+bYwc8CAS9i1PMLiu7N+kbZDEtcmZyHmv
	JaGV/Ao/wwFiwJ5dYgyYeHbCQiSSih755vfPYxV1LRR5TaofR3i8iavVk15wwaoDZAstXgbGijW
	5cI+eLSvXsoCM+3orc3vtxSRxysSZ/FA3ENrB0MUMOkB6H0zcEe38jaLLCXbqgNYAQe8NhtUSvo
	pUSmfAsB0Hfh4nBpTkMtWN5i53hkodtXQ3NG0alRlZpGXjBepO+RserYeyHbxC3KS+lf8S6g/jr
	nZq8o1wr5wRaXw51IzYdQX6g9u03O/Jr6giZ7XuSJzDHE0sf33S90A2fugvjqqTIiCXZn1tFQZg
	16B2zqKRhd9/mh1i
X-Received: by 2002:a17:90b:2552:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-3931e068c9amr1840134a91.8.1786574593746;
        Wed, 12 Aug 2026 15:43:13 -0700 (PDT)
Received: from ip-10-198-159-19.us-west-2.compute.internal (ec2-44-232-128-107.us-west-2.compute.amazonaws.com. [44.232.128.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931f2a7b8bsm502634a91.7.2026.08.12.15.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 15:43:13 -0700 (PDT)
From: Roland Dreier <rolanddreier@rivian.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] firmware: arm_scmi: Protect xfer->async_done with xfer->lock
Date: Wed, 12 Aug 2026 22:43:05 +0000
Message-ID: <20260812224311.904964-1-rolanddreier@rivian.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"

Asynchronous SCMI commands are completed by a delayed response. The RX
path signals the response with complete(xfer->async_done). Unlike
xfer->done, xfer->async_done is a pointer to a completion owned by
whoever is waiting for the delayed response, and it stays valid only for
as long as that waiter is still waiting.  In do_xfer_with_response() it
is a DECLARE_COMPLETION_ONSTACK() in the caller's stack frame.

Nothing serialises the RX path against a waiter that gives up on a
timeout. scmi_msg_response_validate() does read xfer->async_done
under xfer->lock, and documents that as a requirement, but the lock is
dropped again before scmi_handle_response() dereferences the pointer,
and neither the arming nor the disarming side takes it at all. So a
delayed response arriving just as the wait times out can be signalled
on a completion that is already gone:

  waiter                                RX path (IRQ context)
  ------                                ---------------------
  do_xfer_with_response():
    xfer->async_done = &async_response
    do_xfer(xfer)
    wait_for_completion_timeout(xfer->async_done, tmo)
    /* returns 0, gives up */
                                        /* response receive interrupt */
                                        scmi_handle_response():
                                          scmi_xfer_command_acquire()
                                            lock xfer->lock
                                            validate: async_done != NULL
                                            unlock xfer->lock
    xfer->async_done = NULL
    return -ETIMEDOUT
    /* async_response goes out of scope */
                                          complete(xfer->async_done)

That last complete() has two possible bad outcomes: it either dereferences
the NULL just stored by the waiter or - if that store is not yet visible
on the RX CPU - it takes a lock and writes to a stack frame that the
waiter maybe has already returned from.

Fix this by making xfer->lock cover xfer->async_done end-to-end. Add
helpers to arm and disarm it under the lock, use them on both the regular
and the raw paths, and have the RX path read and signal the completion
under that same lock. A waiter that is timing out then either completes
its disarm before the RX path looks, in which case the delayed response is
dropped, or blocks in the disarm until the RX path is done with the
completion, in which case the completion is still alive.

Account for the dropped case with a new "delayed_response_dropped"
debugfs counter to make it visible if this ever happens.

Fixes: 58ecdf03dbb9 ("firmware: arm_scmi: Add support for asynchronous commands and delayed response")
Signed-off-by: Roland Dreier <rolanddreier@rivian.com>
---
 drivers/firmware/arm_scmi/common.h    | 23 ++++++++++++++++++
 drivers/firmware/arm_scmi/driver.c    | 35 +++++++++++++++++++++++----
 drivers/firmware/arm_scmi/protocols.h |  9 ++++---
 drivers/firmware/arm_scmi/raw_mode.c  |  4 +--
 4 files changed, 61 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index b9723c105fc1..fc2f69bcebff 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -282,6 +282,28 @@ static inline bool is_polling_enabled(struct scmi_chan_info *cinfo,
 		is_transport_polling_capable(desc);
 }
 
+/**
+ * scmi_xfer_async_response_arm  - Arm the delayed response completion
+ *
+ * @xfer: A reference to the xfer to arm
+ * @async_done: The completion to signal upon reception of a delayed response,
+ *		or NULL to disarm @xfer.
+ */
+static inline void scmi_xfer_async_response_arm(struct scmi_xfer *xfer,
+						struct completion *async_done)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&xfer->lock, flags);
+	xfer->async_done = async_done;
+	spin_unlock_irqrestore(&xfer->lock, flags);
+}
+
+static inline void scmi_xfer_async_response_disarm(struct scmi_xfer *xfer)
+{
+	scmi_xfer_async_response_arm(xfer, NULL);
+}
+
 void scmi_xfer_raw_put(const struct scmi_handle *handle,
 		       struct scmi_xfer *xfer);
 struct scmi_xfer *scmi_xfer_raw_get(const struct scmi_handle *handle);
@@ -303,6 +325,7 @@ enum debug_counters {
 	RESPONSE_OK,
 	NOTIFICATION_OK,
 	DELAYED_RESPONSE_OK,
+	DELAYED_RESPONSE_DROPPED,
 	XFERS_RESPONSE_TIMEOUT,
 	XFERS_RESPONSE_POLLED_TIMEOUT,
 	RESPONSE_POLLED_OK,
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 3e0d975ec94c..5c295bdc15ca 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1063,6 +1063,28 @@ static inline void scmi_xfer_command_release(struct scmi_info *info,
 	__scmi_xfer_put(&info->tx_minfo, xfer);
 }
 
+/**
+ * scmi_xfer_async_response_complete  - Signal a received delayed response
+ *
+ * @xfer: A reference to the xfer whose delayed response was received
+ *
+ * Return: True if a completion was still armed on @xfer and has been
+ *	   signalled, false if a timed-out waiter had already disarmed it.
+ */
+static bool scmi_xfer_async_response_complete(struct scmi_xfer *xfer)
+{
+	unsigned long flags;
+	struct completion *async_done;
+
+	spin_lock_irqsave(&xfer->lock, flags);
+	async_done = xfer->async_done;
+	if (async_done)
+		complete(async_done);
+	spin_unlock_irqrestore(&xfer->lock, flags);
+
+	return !!async_done;
+}
+
 static inline void scmi_clear_channel(struct scmi_info *info,
 				      struct scmi_chan_info *cinfo)
 {
@@ -1166,8 +1188,10 @@ static void scmi_handle_response(struct scmi_chan_info *cinfo,
 
 	if (xfer->hdr.type == MSG_TYPE_DELAYED_RESP) {
 		scmi_clear_channel(info, cinfo);
-		complete(xfer->async_done);
-		scmi_inc_count(info->dbg, DELAYED_RESPONSE_OK);
+		if (scmi_xfer_async_response_complete(xfer))
+			scmi_inc_count(info->dbg, DELAYED_RESPONSE_OK);
+		else
+			scmi_inc_count(info->dbg, DELAYED_RESPONSE_DROPPED);
 	} else {
 		complete(&xfer->done);
 		scmi_inc_count(info->dbg, RESPONSE_OK);
@@ -1509,7 +1533,7 @@ static int do_xfer_with_response(const struct scmi_protocol_handle *ph,
 	int ret, timeout = msecs_to_jiffies(SCMI_MAX_RESPONSE_TIMEOUT);
 	DECLARE_COMPLETION_ONSTACK(async_response);
 
-	xfer->async_done = &async_response;
+	scmi_xfer_async_response_arm(xfer, &async_response);
 
 	/*
 	 * Delayed responses should not be polled, so an async command should
@@ -1521,7 +1545,7 @@ static int do_xfer_with_response(const struct scmi_protocol_handle *ph,
 
 	ret = do_xfer(ph, xfer);
 	if (!ret) {
-		if (!wait_for_completion_timeout(xfer->async_done, timeout)) {
+		if (!wait_for_completion_timeout(&async_response, timeout)) {
 			dev_err(ph->dev,
 				"timed out in delayed resp(caller: %pS)\n",
 				(void *)_RET_IP_);
@@ -1531,7 +1555,7 @@ static int do_xfer_with_response(const struct scmi_protocol_handle *ph,
 		}
 	}
 
-	xfer->async_done = NULL;
+	scmi_xfer_async_response_disarm(xfer);
 	return ret;
 }
 
@@ -2989,6 +3013,7 @@ static const char * const dbg_counter_strs[] = {
 	"response_ok",
 	"notification_ok",
 	"delayed_response_ok",
+	"delayed_response_dropped",
 	"xfers_response_timeout",
 	"xfers_response_polled_timeout",
 	"response_polled_ok",
diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
index 15ad5162e37a..8583159059e6 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -100,7 +100,10 @@ struct scmi_msg_hdr {
  *	message. If request-ACK protocol is used, we can reuse the same
  *	buffer for the rx path as we use for the tx path.
  * @done: command message transmit completion event
- * @async_done: pointer to delayed response message received event completion
+ * @async_done: pointer to delayed response message received event completion,
+ *		or NULL when no delayed response is expected. Protected by
+ *		@lock, since the completion is owned by the waiter and can
+ *		vanish once the wait times out.
  * @pending: True for xfers added to @pending_xfers hashtable
  * @node: An hlist_node reference used to store this xfer, alternatively, on
  *	  the free list @free_xfers or in the @pending_xfers hashtable
@@ -121,7 +124,7 @@ struct scmi_msg_hdr {
  *	    - SCMI_XFER_SENT_OK -> SCMI_XFER_DRESP_OK
  *	      (Missing synchronous response is assumed OK and ignored)
  * @flags: Optional flags associated to this xfer.
- * @lock: A spinlock to protect state and busy fields.
+ * @lock: A spinlock to protect state, busy and async_done fields.
  * @priv: A pointer for transport private usage.
  */
 struct scmi_xfer {
@@ -147,7 +150,7 @@ struct scmi_xfer {
 #define SCMI_XFER_IS_CHAN_SET(x)	\
 	((x)->flags & SCMI_XFER_FLAG_CHAN_SET)
 	int flags;
-	/* A lock to protect state and busy fields */
+	/* A lock to protect state, busy and async_done fields */
 	spinlock_t lock;
 	void *priv;
 };
diff --git a/drivers/firmware/arm_scmi/raw_mode.c b/drivers/firmware/arm_scmi/raw_mode.c
index 1f6e51670208..8751cff5fa4e 100644
--- a/drivers/firmware/arm_scmi/raw_mode.c
+++ b/drivers/firmware/arm_scmi/raw_mode.c
@@ -346,7 +346,7 @@ scmi_xfer_raw_waiter_get(struct scmi_raw_mode_info *raw, struct scmi_xfer *xfer,
 
 		if (async) {
 			reinit_completion(&rw->async_response);
-			xfer->async_done = &rw->async_response;
+			scmi_xfer_async_response_arm(xfer, &rw->async_response);
 		}
 
 		rw->cinfo = cinfo;
@@ -361,7 +361,7 @@ static void scmi_xfer_raw_waiter_put(struct scmi_raw_mode_info *raw,
 				     struct scmi_xfer_raw_waiter *rw)
 {
 	if (rw->xfer) {
-		rw->xfer->async_done = NULL;
+		scmi_xfer_async_response_disarm(rw->xfer);
 		rw->xfer = NULL;
 	}
 
-- 
2.54.0


-- 
*CONFIDENTIALITY NOTE:* This electronic message (including any attachments) 
may contain information that is privileged, confidential, and proprietary. 
If you are not the intended recipient, you are hereby notified that any 
disclosure, copying, distribution, or use of the information contained 
herein (including any reliance thereon) is strictly prohibited. If you 
received this electronic message in error, please immediately reply to the 
sender that you have received this communication and destroy the material 
in its entirety, whether in electronic or hard copy format. Although Rivian 
has taken reasonable precautions to ensure no viruses are present in this 
email, Rivian accepts no responsibility for any loss or damage arising from 
the use of this email or attachments.
