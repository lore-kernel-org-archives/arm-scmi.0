Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281DE2C0269;
	Wed,  9 Sep 2026 04:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788928355; cv=none; b=mRt92zZ9+mrtj9n8zxUJa7NhDb9zLcVQtdlK8bi1dmY0vEtaT/LQVMOkZVjzMgYscNja010A6FX7KgbiSDhNeaAWHc0BFifATPZ2Na62scXvLodSvEwEg17OKiO6E1ugyVo2aev+hG4lZPDIOH+ZKcm2V7/MD2ick5K1pT4j9rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788928355; c=relaxed/simple;
	bh=B3L0BxRXSJdbIVrJvndy+sUzGNoNqWWCgttF0Fi4fX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WPfrjQeuBFxCcp/WDFHKKQgzZJUM/S87DsG9CVkkOCEjEZbEe5Fp/dReo4r184gH1inhl5VwDaXc29SqQ83hnBTc50i9CwF635zJH5AFiXIpF6hrmsApM6FC7aYPT4tCSZ/h3qwDaf+e5u8r2hdh/7nE9EDi3H8yXkBXOMUTRuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jaVnAgd9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jaVnAgd9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC604C2BCFA;
	Wed,  9 Sep 2026 04:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788928354;
	bh=B3L0BxRXSJdbIVrJvndy+sUzGNoNqWWCgttF0Fi4fX0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jaVnAgd9CifsmZt+3bQhMf+yvhsHoGJd3nw2wGwqSUzGiZdcJBjCaBivnV4RTi7U4
	 gza9nTaZC96dIVrT/uzmQ8hTlMDwOf4qEMkZjThRJwIz9QOmwHM54fDUOuexIgbNeW
	 quF1uNRypWizhdso8ATQ7fXA8dTDu3PBjNXQVyxpS4BGAbN6YnPnq1Kg/pI+oye98c
	 cWfXRma4xQ8zoYoMJzzyXyOUuTreHCKxMecrrhv53F8f1kUaZ67u8eyCi2Q/r2Uq9x
	 4ZRuQq6dtL/oK2JPQ4ZAW5T3+N3EH5t7vBhnfeFmT4LxrMyrIOyKp+7OFu4VazfeU8
	 T5NuHQErD4jyg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F83C79FAD;
	Wed,  9 Sep 2026 04:32:34 +0000 (UTC)
From: Roland Dreier via B4 Relay <devnull+rolanddreier.rivian.com@kernel.org>
Date: Wed, 09 Sep 2026 04:32:28 +0000
Subject: [PATCH v2 2/2] firmware: arm_scmi: Don't reuse raw xfers with
 async_done still armed
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-scmi-async-done-race-v2-2-cc5dec25c6be@rivian.com>
References: <20260909-scmi-async-done-race-v2-0-cc5dec25c6be@rivian.com>
In-Reply-To: <20260909-scmi-async-done-race-v2-0-cc5dec25c6be@rivian.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Roland Dreier <rolanddreier@rivian.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788928354; l=4879;
 i=rolanddreier@rivian.com; s=20260814; h=from:subject:message-id;
 bh=lSQlG8l7yS93nl1ymFQxqscEtFohEzwB1dp70n6pFeI=;
 b=HZOSFuWSuNxEEKPqd7+alIQGq5wamsT0h73sBDg0Rd0dnAhkpZXx/4vVoa1l512hrdZ0qfxHi
 9im1wJRv31OCyspwCOv5eUB8J88TR3v0iWXPGcd1H6+FYYtuDuhtekt
X-Developer-Key: i=rolanddreier@rivian.com; a=ed25519;
 pk=C7SBXsDIlarq7BpINqyDL67XV/AGNqNt09NCCpFcExk=
X-Endpoint-Received: by B4 Relay for rolanddreier@rivian.com/20260814 with
 auth_id=952
X-Original-From: Roland Dreier <rolanddreier@rivian.com>
Reply-To: rolanddreier@rivian.com

From: Roland Dreier <rolanddreier@rivian.com>

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
index 847c09da310e..eb20488d39d3 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -718,6 +718,7 @@ static struct scmi_xfer *scmi_xfer_get(const struct scmi_handle *handle,
 
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


