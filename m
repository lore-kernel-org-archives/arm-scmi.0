Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215713;
	b=UVuviYMY2Jw2YBgVvqQ1OjRnfUxw9zKa40rczanUOQrBIHUVLupk0Dy67bOmD+pWMSCX
	 TkzxQe3kEuW29oYphBAVGnVjQeSHmi5fNdjQAS4aRiJ8AcQ6wOUH5quLz/P1CYuexnX0E
	 hG2Hv4sB8LJigTRn7R7tQosK5EeKa8Xg09Ju4Mlis/MnWwkmvQUP7JGka0rhXy2kfryb8
	 mcOsucz8Hl8rjwO+H+zOqjoTPNtbey9hM7D8aFk0Q0B7DqA4bHaS1pS2bU2eio6eMzFD0
	 KiQ9Ns121P3a9hwNGhKrIkC+MVkExEo0DZ69reer8MMp7lxTluEB+l7ykt3o0agODhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215713;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tjLoocJtgZp3d7VE01qKIf/b0AUZVceK9RAY/Ki1zEE=;
	b=FzrxC/KOVX3+2+etGP9IMYwY1wgu6YUqt4nsjxGJ7E5IBMGf/rbolGT8D9Etg0fgl8Cy
	 rN3dWfLeVAOanOwnfraWtYY+iQBCnBi6jVw2+TBIUATpJyXFICMjp8T/AL9oHmw7FZYCw
	 FgFa6pG09ykPCTRqAFl+PyhN9Lzt5Fqh0+DUWANeav5XukhsBiQHLbTiBa75HV0uo5PYr
	 MKgxRlMe8AyGezTgH0vMElAO33uV/o39vmQKlBz7GTW8ohVJ/pZ8jXBudLARMwNpDVqur
	 Y0jo9pCisjmdAYJZBIPxPecwDTiIudTv+0oULgMzHo7svPVFTgt4I+L5z49MgL0oY/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Kxp2gYUG;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C21C606D80A;
	Mon,  9 Nov 2026 09:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C21C606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Kxp2gYUG
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12E6C1691;
	Mon,  9 Nov 2026 01:15:09 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2CCA63F85F;
	Mon,  9 Nov 2026 01:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794215712; bh=8kDoZMhfijALz2xCyOhL8rkJdGvulmKZNLN3A2dJI+o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kxp2gYUG/1Sxy7XyUzhXpoa6VLGpBtKp0tBACwsqSsB29AkHERNGY4c5nj1/jAryX
	 2Vkcm2lgKsgIIahcUHkXU4K/G02cofar8HiXU0MSf5PuRCzg2Ply3lF+n2FD5u170x
	 BZDQ7jQlhSp3gjFHa2h2m7r3ZylY4wucbprOMDUQ=
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
Subject: [PATCH v15 05/35] firmware: arm_scmi: Refactor __scmi_event_handler_get_ops helper
Date: Mon,  9 Nov 2026 09:11:51 +0000
Message-ID: <20261109091221.2532706-6-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109091221.2532706-1-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the __scmi_event_handler_get_ops notification helper to simplify
its logic and make use of guards for locking.

Event handler allocation is split out of registration in a dedicated helper
so as to allow for future reuse.

Mostly no functional change, in the sense that while the functionality
remained the same, a richer set of errors is returned where before was
always a -EINVAL.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v14 --> v15
 - reworked error path in scmi_allocate_pending_event_handler
 - improve commit message
---
 drivers/firmware/arm_scmi/notify.c | 74 +++++++++++++++++++-----------
 1 file changed, 47 insertions(+), 27 deletions(-)

diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
index a30589c9b377..fa2339209a69 100644
--- a/drivers/firmware/arm_scmi/notify.c
+++ b/drivers/firmware/arm_scmi/notify.c
@@ -891,7 +891,6 @@ void scmi_deregister_protocol_events(const struct scmi_handle *handle,
 
 /**
  * scmi_allocate_event_handler()  - Allocate Event handler
- * @ni: A reference to the notification instance to use
  * @evt_key: 32bit key uniquely bind to the event identified by the tuple
  *	     (proto_id, evt_id, src_id)
  *
@@ -901,21 +900,33 @@ void scmi_deregister_protocol_events(const struct scmi_handle *handle,
  * associated to this handler descriptor (hndl->r_evt == NULL), so the handler
  * is initialized as pending.
  *
- * Context: Assumes to be called with @pending_mtx already acquired.
  * Return: the freshly allocated structure on Success
  */
-static struct scmi_event_handler *
-scmi_allocate_event_handler(struct scmi_notify_instance *ni, u32 evt_key)
+static struct scmi_event_handler *scmi_allocate_event_handler(u32 evt_key)
 {
 	struct scmi_event_handler *hndl;
 
 	hndl = kzalloc_obj(*hndl);
 	if (!hndl)
 		return NULL;
+
 	hndl->key = evt_key;
 	BLOCKING_INIT_NOTIFIER_HEAD(&hndl->chain);
 	refcount_set(&hndl->users, 1);
-	/* New handlers are created pending */
+
+	return hndl;
+}
+
+static struct scmi_event_handler *
+scmi_allocate_pending_event_handler(struct scmi_notify_instance *ni, u32 evt_key)
+{
+	struct scmi_event_handler *hndl;
+
+	lockdep_assert_held(&ni->pending_mtx);
+	hndl =  scmi_allocate_event_handler(evt_key);
+	if (!hndl)
+		return NULL;
+
 	hash_add(ni->pending_events_handlers, &hndl->hash, hndl->key);
 
 	return hndl;
@@ -1085,7 +1096,8 @@ __scmi_event_handler_get_ops(struct scmi_notify_instance *ni,
 			     u32 evt_key, bool create)
 {
 	struct scmi_registered_event *r_evt;
-	struct scmi_event_handler *hndl = NULL;
+	struct scmi_event_handler *hndl;
+	int ret;
 
 	r_evt = SCMI_GET_REVT(ni, KEY_XTRACT_PROTO_ID(evt_key),
 			      KEY_XTRACT_EVT_ID(evt_key));
@@ -1093,39 +1105,47 @@ __scmi_event_handler_get_ops(struct scmi_notify_instance *ni,
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

