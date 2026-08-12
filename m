Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136FC494A08
	for <arm-scmi@vger.kernel.org>; Wed, 12 Aug 2026 22:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786574598; cv=none; b=TzVhWIFwp9fvYxZT+ZRFwfTWznyrFG0+fkx3Q15oz3rPCA8B4FVr2HsPLQxL2qGDy0OHWO0JOYBv3uJ12RY4r+aPS2tKh+fvJSUVpMWuOYAIsVtxiQCPdvgcO/gUheuqIeVy+3kc1U9q2YsenjlBtvLVCPeOTbVLBLQffcmhF34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786574598; c=relaxed/simple;
	bh=nZur1dPKXTeT+OS2wl6C4MvZRNxHd1W5cwm8phkqB/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fVaDtM9wbmR9lPhPPgj6Gk8+peBvXJ2YhpcdWioYhjDMhwWVyK27os0+eLm71EqKLJ54dVw9f43Bj23fvK7+zz2/pTPOK33cCBCBRQ0+nAG814u+JmxGhVNcWFWd5/P+nCdH2YRBM6UbEbi3VKNVmiYJGHJMeSm3F1fIszCZ/5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rivian.com; spf=pass smtp.mailfrom=rivian.com; dkim=pass (2048-bit key) header.d=rivian.com header.i=@rivian.com header.b=Yn6nhgMx; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rivian.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivian.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivian.com header.i=@rivian.com header.b="Yn6nhgMx"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cbedf433a99so1417054a12.2
        for <arm-scmi@vger.kernel.org>; Wed, 12 Aug 2026 15:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivian.com; s=google; t=1786574596; x=1787179396; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rlblx6qt1rqemUxEZ6qZUYhzuNbcWAL6YV0Kj3/NsUE=;
        b=Yn6nhgMxhR+bV1AGQKwfq7sEHIUaHSm6YS4M1dXOJD8IiZx6SXTWv+Yz3OcVXMVC9r
         aN9A/jGJ5FAUtEZwf2EYxlAVFpdolwhpmuQlKGoXN6sGk5V97U8jxTFh4C40ksiXmtc2
         FGEHnGfLvPtK4AF2Tcy4nvO9HY0ruv1umNeKR4rABvF5HcLsQJdcgyc1HqVN85JaQaPZ
         +zmUraqz9nVcNOc8rQcAwOO/d430A+dbVZChY+Rk7t9I052vNMyp57wrXrFEXhWeyqXd
         G/Y+DpCaEyELZ2hxRaY17YaIsHSG6jbSW5LTmav+WG39/mp9RNOvnXDFftVn1YRbveHL
         wgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786574596; x=1787179396;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rlblx6qt1rqemUxEZ6qZUYhzuNbcWAL6YV0Kj3/NsUE=;
        b=o95J/Hte9XcxInK9vEGHqdYdC+IGMADekUaiuEFqHy2eDHPalzNfTMmmgTVjBR+ysD
         BJdJblZTm7x4ASyioLLpAyC9D/myErs2hkyE1eWk8pZJ+YBmdwcnioDqBl1DE803VvFU
         e4FMMwnP0sK99LshiMWx9eKuBVb8MW/qAg4hsFzkrP+kPGcK/HbbU6D4zmYBQSg2kQTV
         ScpEORgQxXbrxCjn7x1R5Pv1baem4PXbJIjQR0WLZUkStauQ55qbW6EBj7TL9MpP9FXy
         7uoqI/UN75qZDaUxUJlMV0YE5IRJepmBKTvaKyVA0vxnRaGrpAlU8X3nR9ix5E46Eogb
         S22Q==
X-Gm-Message-State: AOJu0YxZF2L+3b7aFLx8QHLGzujov341Nkg0mACsSq2FRYhSruauzjeQ
	6EAkD4QwW+Ypwqget8zVPiV8TYoBGWQEzJypjcQvXiNQrBLHMWxj0zBHu2nDJ71lr6cAc8Omw/A
	mWmzHjKtY+NCKu96v2yQwAQkl6H0peolZA2rvNJyz1ty3fuXelhTJCXTfMC89tMxm6SA=
X-Gm-Gg: AR+sD11SPSUrd7P02p3V5hQwpUg5PGKxiWwpGPNgAR3uUrmG4b87e9TiIZd4sxt7iuH
	3RdVPTawYjmnHksj76Wfb4m+ApwWVs9s7mBXWJMxcX88sSt9jqI2acSxJvbfPlHseIyN592DjmV
	LXb9/mIbIcAwABid+bI8b+gX0kMwMJyPfmWyAKMx+dgAbge3IIv52M2KmfXv6FbaTYcSIX2WOs2
	E/Tvs1aQrtm9JKU0jUQrbE1p+8zuGAJu7G95jldLUI/NTfBgSv7ySUQ5jS7ZnWKGGPyqGL8tsmG
	D+Zicpwq9+cqwec/kYaixES7dA7CKeIru4P39QKI67NE/1iAnOL2GBf5mSDHXOig3HGCkIzkcG/
	WUx7Uk+aZaS8UERtW4Q1peYdjQ5F6CFumoaa2kcGiCmU5ZaDPvVw1BvHHZv0+MkcKOsy990MVlr
	9PZVMpAva9ZsvWZBhNEi8sGbfSaD9r2rsRRIbmYtc6BNBwycVQEM1zTJ+3nMf3NSC1d/vOGszYc
	b/HzGDo9nskBZ0TuSa0EzMyrEkcdLc8gtowM/P+fwe/kBXenf6jAut7PG7uxQk19YzL5MfvWa9z
	5ymNeMRDrcC80LUs
X-Received: by 2002:a05:6a20:cd96:b0:3b7:aefe:4367 with SMTP id adf61e73a8af0-3cc5540b487mr1915887637.33.1786574596145;
        Wed, 12 Aug 2026 15:43:16 -0700 (PDT)
Received: from ip-10-198-159-19.us-west-2.compute.internal (ec2-44-232-128-107.us-west-2.compute.amazonaws.com. [44.232.128.107])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbef710cc24sm204967a12.20.2026.08.12.15.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 15:43:15 -0700 (PDT)
From: Roland Dreier <rolanddreier@rivian.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] firmware: arm_scmi: Don't reuse raw xfers with async_done still armed
Date: Wed, 12 Aug 2026 22:43:06 +0000
Message-ID: <20260812224311.904964-2-rolanddreier@rivian.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260812224311.904964-1-rolanddreier@rivian.com>
References: <20260812224311.904964-1-rolanddreier@rivian.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"

In SCMI raw mode, scmi_xfer_raw_worker() releases the xfer before
releasing the waiter that disarms xfer->async_done, and scmi_xfer_get()
does not clear async_done when it hands out a recycled xfer. A concurrent
transaction can therefore pick up the xfer while it still points at the
old waiter's completion, so:

 - a delayed response arriving for the new transaction can be signalled
   on the old waiter's completion, which may already be re-armed for yet
   another unrelated transaction, making that transaction's wait return
   early; and

 - the old waiter's disarm, which still runs after the xfer has been
   released, clobbers the arming just installed by the new transaction,
   so the new waiter times out even if its delayed response arrives.

Release the waiter first, while the worker still holds a reference on
the xfer, so that an xfer can never reach the free list still
armed. Track whether a delayed response is expected in the waiter
itself instead of peeking at xfer->async_done outside xfer->lock, and
wait on the waiter's own embedded completion. (The new async flag is
not strictly needed but it makes the logic easier to reason about)

Finally, harden scmi_xfer_get() to clear async_done when handing out
an xfer, so that no future release-ordering change can leak a stale
arming into a new transaction.

Fixes: 3c3d818a9317 ("firmware: arm_scmi: Add core raw transmission support")
Signed-off-by: Roland Dreier <rolanddreier@rivian.com>
---
 drivers/firmware/arm_scmi/driver.c   |  1 +
 drivers/firmware/arm_scmi/raw_mode.c | 25 +++++++++++++++++++++----
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 5c295bdc15ca..2d8884f0036b 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -717,6 +717,7 @@ static struct scmi_xfer *scmi_xfer_get(const struct scmi_handle *handle,
 
 	refcount_set(&xfer->users, 1);
 	atomic_set(&xfer->busy, SCMI_XFER_FREE);
+	xfer->async_done = NULL;
 	spin_unlock_irqrestore(&minfo->xfer_lock, flags);
 
 	return xfer;
diff --git a/drivers/firmware/arm_scmi/raw_mode.c b/drivers/firmware/arm_scmi/raw_mode.c
index 8751cff5fa4e..5ee21f6b7001 100644
--- a/drivers/firmware/arm_scmi/raw_mode.c
+++ b/drivers/firmware/arm_scmi/raw_mode.c
@@ -198,6 +198,8 @@ struct scmi_raw_mode_info {
  * @async_response: A completion to be, optionally, used for async waits: it
  *		    will be setup by @scmi_do_xfer_raw_start, if needed, to be
  *		    pointed at by xfer->async_done.
+ * @async: True if @async_response was armed on @xfer, i.e. if a delayed
+ *	   response has to be waited for.
  * @node: A list node.
  */
 struct scmi_xfer_raw_waiter {
@@ -205,6 +207,7 @@ struct scmi_xfer_raw_waiter {
 	struct scmi_chan_info *cinfo;
 	struct scmi_xfer *xfer;
 	struct completion async_response;
+	bool async;
 	struct list_head node;
 };
 
@@ -349,6 +352,7 @@ scmi_xfer_raw_waiter_get(struct scmi_raw_mode_info *raw, struct scmi_xfer *xfer,
 			scmi_xfer_async_response_arm(xfer, &rw->async_response);
 		}
 
+		rw->async = async;
 		rw->cinfo = cinfo;
 		rw->xfer = xfer;
 	}
@@ -361,8 +365,16 @@ static void scmi_xfer_raw_waiter_put(struct scmi_raw_mode_info *raw,
 				     struct scmi_xfer_raw_waiter *rw)
 {
 	if (rw->xfer) {
+		/*
+		 * Disarm the delayed response before this waiter, and its
+		 * embedded completion, can be picked up again for a new
+		 * transaction: a delayed response received late, after the
+		 * related wait timed out, must not signal a completion which
+		 * has been in the meantime re-armed on a different xfer.
+		 */
 		scmi_xfer_async_response_disarm(rw->xfer);
 		rw->xfer = NULL;
+		rw->async = false;
 	}
 
 	mutex_lock(&raw->free_mtx);
@@ -479,18 +491,23 @@ static void scmi_xfer_raw_worker(struct work_struct *work)
 				    ret, scmi_inflight_count(raw->handle));
 
 		/* Wait also for an async delayed response if needed */
-		if (!ret && xfer->async_done) {
+		if (!ret && rw->async) {
 			unsigned long tmo = msecs_to_jiffies(SCMI_MAX_RESPONSE_TIMEOUT);
 
-			if (!wait_for_completion_timeout(xfer->async_done, tmo))
+			if (!wait_for_completion_timeout(&rw->async_response, tmo))
 				dev_err(dev,
 					"timed out in RAW delayed resp - HDR:%08X\n",
 					pack_scmi_header(&xfer->hdr));
 		}
 
-		/* Release waiter and xfer */
-		scmi_xfer_raw_put(raw->handle, xfer);
+		/*
+		 * Release the waiter first: this disarms the delayed response
+		 * while we still hold a reference on the xfer, so that the xfer
+		 * cannot be recycled by a new transaction while it still points
+		 * at this waiter's completion.
+		 */
 		scmi_xfer_raw_waiter_put(raw, rw);
+		scmi_xfer_raw_put(raw->handle, xfer);
 	} while (1);
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
