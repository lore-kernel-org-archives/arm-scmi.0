Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2883B49BB7E;
	Fri, 16 Oct 2026 18:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792177012; cv=none; b=KcLFgkHi76zC1LizyXuysmTHL4ZzgGI8tcVBcA+vjBX2eNn4Z/ORc6ctyj5v+zvAXZR6QNAVNC4sOxKNskhGKxplEiWC1qH1Yj1+BXcezaE5ScheJel/lKkG1T4BCxa6kLCWkh+mEx1m7ya6nRRSP7ybgGjU0l3tj/Qf50OZZbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792177012; c=relaxed/simple;
	bh=IlGSJk5bIy8V0uacBe05v0mPqWBW8z2GyMYodjKKvqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FpTzmhOzlDsERa2SWjXI+nmFRx+MAiQfIOHMTMxC1J3Rq71sKQwoLypIoRkKc3QiWTJQWpSRQTPhOyfe0NbpJGPLrCNy86Mh9TU3hnBMgsoKtt/L+Q2+af5ZBkDDsrDoJPPZXMVymu+VxFWte1IWzGVoohIe1VNp5cpIxbMcC1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Jdq9tcHm; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Jdq9tcHm"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 050DD1516;
	Fri, 16 Oct 2026 11:56:43 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F42023F7B4;
	Fri, 16 Oct 2026 11:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792177006; bh=IlGSJk5bIy8V0uacBe05v0mPqWBW8z2GyMYodjKKvqM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jdq9tcHmUSfXJCIfC8YAdrpK9jpaGj8i+C7/61vezjayBFBYtVlgLEJp0zjzrJnH8
	 pV0W/j731uLwlkRM7jRvwuMk5pjid0gsueCLM3uKLmZJR4z6tL3BDxeK7vbJLRL8zE
	 BWL7o6Fj+s6GLWQk8lchmGBU5Uf4pdZnctxD1ebk=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	d-gole@ti.com,
	jonathan.cameron@oss.qualcomm.com,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	david@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v14 03/32] firmware: arm_scmi: Refactor __scmi_event_handler_get_ops helper
Date: Fri, 16 Oct 2026 19:55:24 +0100
Message-ID: <20261016185553.2794459-4-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261016185553.2794459-1-cristian.marussi@arm.com>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the __scmi_event_handler_get_ops notification helper to simplify
its logic and make use of guards for locking.

Mostly no functional change, in the sense that while the functionality
remained the same, a richer set of errors is returned where before was
always a -EINVAL.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/notify.c | 73 +++++++++++++++++++-----------
 1 file changed, 46 insertions(+), 27 deletions(-)

diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
index 7d1bb424a723..2bc2e03df639 100644
--- a/drivers/firmware/arm_scmi/notify.c
+++ b/drivers/firmware/arm_scmi/notify.c
@@ -890,7 +890,6 @@ void scmi_deregister_protocol_events(const struct scmi_handle *handle,
 
 /**
  * scmi_allocate_event_handler()  - Allocate Event handler
- * @ni: A reference to the notification instance to use
  * @evt_key: 32bit key uniquely bind to the event identified by the tuple
  *	     (proto_id, evt_id, src_id)
  *
@@ -903,8 +902,7 @@ void scmi_deregister_protocol_events(const struct scmi_handle *handle,
  * Context: Assumes to be called with @pending_mtx already acquired.
  * Return: the freshly allocated structure on Success
  */
-static struct scmi_event_handler *
-scmi_allocate_event_handler(struct scmi_notify_instance *ni, u32 evt_key)
+static struct scmi_event_handler *scmi_allocate_event_handler(u32 evt_key)
 {
 	struct scmi_event_handler *hndl;
 
@@ -914,8 +912,20 @@ scmi_allocate_event_handler(struct scmi_notify_instance *ni, u32 evt_key)
 	hndl->key = evt_key;
 	BLOCKING_INIT_NOTIFIER_HEAD(&hndl->chain);
 	refcount_set(&hndl->users, 1);
-	/* New handlers are created pending */
-	hash_add(ni->pending_events_handlers, &hndl->hash, hndl->key);
+
+	return hndl;
+}
+
+static struct scmi_event_handler *
+scmi_allocate_pending_event_handler(struct scmi_notify_instance *ni,
+				    u32 evt_key)
+{
+	struct scmi_event_handler *hndl;
+
+	lockdep_assert_held(&ni->pending_mtx);
+	hndl =  scmi_allocate_event_handler(evt_key);
+	if (hndl)
+		hash_add(ni->pending_events_handlers, &hndl->hash, hndl->key);
 
 	return hndl;
 }
@@ -1084,7 +1094,8 @@ __scmi_event_handler_get_ops(struct scmi_notify_instance *ni,
 			     u32 evt_key, bool create)
 {
 	struct scmi_registered_event *r_evt;
-	struct scmi_event_handler *hndl = NULL;
+	struct scmi_event_handler *hndl;
+	int ret;
 
 	r_evt = SCMI_GET_REVT(ni, KEY_XTRACT_PROTO_ID(evt_key),
 			      KEY_XTRACT_EVT_ID(evt_key));
@@ -1092,39 +1103,47 @@ __scmi_event_handler_get_ops(struct scmi_notify_instance *ni,
 	if (r_evt && r_evt->not_supported_by_platform)
 		return ERR_PTR(-EOPNOTSUPP);
 
-	mutex_lock(&ni->pending_mtx);
+	guard(mutex)(&ni->pending_mtx);
 	/* Search registered events at first ... if possible at all */
 	if (r_evt) {
-		mutex_lock(&r_evt->proto->registered_mtx);
+		guard(mutex)(&r_evt->proto->registered_mtx);
 		hndl = KEY_FIND(r_evt->proto->registered_events_handlers,
 				hndl, evt_key);
-		if (hndl)
+		if (hndl) {
 			refcount_inc(&hndl->users);
-		mutex_unlock(&r_evt->proto->registered_mtx);
+			return hndl;
+		}
 	}
 
 	/* ...then amongst pending. */
-	if (!hndl) {
-		hndl = KEY_FIND(ni->pending_events_handlers, hndl, evt_key);
-		if (hndl)
-			refcount_inc(&hndl->users);
+	hndl = KEY_FIND(ni->pending_events_handlers, hndl, evt_key);
+	if (hndl) {
+		refcount_inc(&hndl->users);
+		return hndl;
 	}
 
-	/* Create if still not found and required */
-	if (!hndl && create) {
-		hndl = scmi_allocate_event_handler(ni, evt_key);
-		if (hndl && scmi_register_event_handler(ni, hndl)) {
-			dev_dbg(ni->handle->dev,
-				"purging UNKNOWN handler - key:%X\n",
-				hndl->key);
-			/* this hndl can be only a pending one */
-			scmi_put_handler_unlocked(ni, hndl);
-			hndl = ERR_PTR(-EINVAL);
-		}
+	if (!create)
+		return ERR_PTR(-ENODEV);
+
+	/*
+	 * Create if still not found and required, new handlers are
+	 * created pending and transitioned to registered when bound to
+	 * an event.
+	 */
+	hndl = scmi_allocate_pending_event_handler(ni, evt_key);
+	if (!hndl)
+		return ERR_PTR(-ENOMEM);
+
+	ret = scmi_register_event_handler(ni, hndl);
+	if (ret) {
+		dev_dbg(ni->handle->dev,
+			"purging UNKNOWN handler - key:%X\n", hndl->key);
+		/* this hndl can be only a pending one */
+		scmi_put_handler_unlocked(ni, hndl);
+		return ERR_PTR(ret);
 	}
-	mutex_unlock(&ni->pending_mtx);
 
-	return hndl ?: ERR_PTR(-ENODEV);
+	return hndl;
 }
 
 static struct scmi_event_handler *
-- 
2.54.0

