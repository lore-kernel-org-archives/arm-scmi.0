Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE374071ED
	for <arm-scmi@vger.kernel.org>; Mon,  8 Jun 2026 05:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780895266; cv=none; b=Gon3Rleorti3zUoJbwg6IOfYYV/meI3jH0WBhMvCeBxt2FjsNloaLvQg4u//dw/UFhglI0Pen5pPzXyUuN/cg+J8NxcWPgbQSYAQ1PhpV8EHDpLXXizymnEpZdT5vjfZa31+ocQSckjWNAliHF5DpYWQgiMLGP4PLWYI6OBwwvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780895266; c=relaxed/simple;
	bh=lF68z8SNLZcBGhYrMebJCDeUa4Ic3V094gG6WdMXo4M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BHdYRa+xvBImgq4+Mvhr2eue2rJvdFF8YECLDzYq6ysOVwEbU6dD7J6bRamax82k2x+RaYe+gCNWbKUADYqAqKwpw8QqFEcpJa+RAv2UGMvEw+eW72DjeXQnDjeVwVnWdrJvkbtUvNYT6Y1XlOOXw7I+uTGOyU/rGaOwZmEX4WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZNgRQ7QZ; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNgRQ7QZ"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7dfceeaf168so34870147b3.0
        for <arm-scmi@vger.kernel.org>; Sun, 07 Jun 2026 22:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780895264; x=1781500064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2/Cp0a9gP5wzO7K0gKJb8DvCw3TdIDmmKCsdwU1/y3w=;
        b=ZNgRQ7QZAfWGbpcI9RK4HvnqQgz3sSNN2npUwUJfr5spl/OGGuaT40bCmfqSYgetBj
         ApvZTyaciElvFb049qq14wG3h2RSMNAfYhtn1WePgYShTw1rFzJBlxJXczARrb1n5T73
         5bn/cqlMyIPBMsgYj+lTOoUErRVsIK9xG4WW5DR3PTSyW3KcaPBIa7zwHKGpCCas5VhK
         vOgo4sQ7PqQG/8SetDjrajB6mLe9bXe0GiM+O6BVjov8zxaxcfIZ6nhy6wTCqtw6hBlV
         rz2h4XFCb90qQ4vgQxbR3xLkRCctjAzbTeFZBjAI3m8+kaTNdABvOyyjHNx7AIL8qrjr
         ghDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780895264; x=1781500064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/Cp0a9gP5wzO7K0gKJb8DvCw3TdIDmmKCsdwU1/y3w=;
        b=M2r55RpKh4d+19vJfpAnv/pq2C7aBYM47V4Y2txnl87iDRJ5ufVXTcNEVlbnN5V7Sp
         FWhJyY1/TDh0vI3DZu9xtLFjCD2+cVOBeZF1qNS65KN/zHZ/i5SCaiYDJnPUc17AU+Ur
         Ps2gPhUhVPz4UJ2LCGIJO/YPPxzIcm2Seh8mlaLgZDSCfueFV4idI0N6zoZGqKRjtA51
         xrDk7v/60/X7xym7GRTywddw7VxyuLg6peJet2FrFyIaGZcQYKCIwfGKJ8Tx86JYS9gf
         wsr8h8YmBINaQW5DHjCo9hhLdm7pEd/wZKfKnoZ73OiSfXRSp8ak2C8ES1Uzpk9FIkzS
         sY6g==
X-Gm-Message-State: AOJu0YyIbdQN0c348IAx6Lmbsw5+9kUBknwwyqDku7pbM8ii7pyNCw+k
	7Pq7iHqz5QcdZh6LrxmaJcwgyNfC3wYBoz22y5RviwAccJFBzbq9OZWFcOuLRN5b
X-Gm-Gg: Acq92OFKxZILbsmD/EoWB2e/RLmEuk05Tnm34EO3f72IO3FJ38kuwroofGlvRh/9/49
	Q8DBe7T/6pllwY1nBVmTcyc2PYtRT5NHF7Pn1At/E4HnarcD4m8Zj3zw5FNPKbyzEYS1zj8diOS
	LkydDIkZ15zW25GxMzSMqQFisPjFNtgYYNhvOnwJ1DRQHPM6ksCVFOB2lf+tkNvxJkvS40mJ53X
	3GaIQM3jvo6T+dg+WqPByTDD3RPGILP5aTT75oDSkN936E/SdzXGWwbPg4YLkHiQBYLPu7y3Xfi
	HIiC8zHaQ+ubt589rK/vExCug2anyoDz33iGmqdwHR7wZVMN9Z1bxmTKB+OY/5BtEGT7jZIiTmc
	oKt6+HS5gBGQgx+6avTM0PqlcttT3/brhmrwDbJJ1PZp5ku7YM6q5VsrQSwa8SzArP2Byh6gBRB
	OohTzdLuayLRMv4xAtFzjbPSqoIt0QzL2XqaJUr79EsLROFZfP3dEz3S/8mAPgd4yfdPFWaEp0L
	e/fRHpAwwQcpJz9LolUqUiZBLt4npIn2NPX5DA2empykw==
X-Received: by 2002:a05:690c:6181:b0:7bd:73f3:7a70 with SMTP id 00721157ae682-7ed109c657bmr130266297b3.32.1780895264088;
        Sun, 07 Jun 2026 22:07:44 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7ea20ea8179sm80663187b3.2.2026.06.07.22.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 22:07:42 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: arm-scmi@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:SYSTEM CONTROL & POWER/MANAGEMENT INTERFACE (SC...),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCH] firmware: arm_scmi: simplify some allocations
Date: Sun,  7 Jun 2026 22:07:24 -0700
Message-ID: <20260608050724.6358-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use flexible array members to combine allocations and remove kcalloc
usage.

Add __counted_by where appropriate for extra runtime analysis. Move
counting variable assignment after allocation before any potential array
access.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/firmware/arm_scmi/notify.c | 42 ++++++++++++------------------
 1 file changed, 16 insertions(+), 26 deletions(-)

diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
index 40ec184eedae..45cbb3d2d684 100644
--- a/drivers/firmware/arm_scmi/notify.c
+++ b/drivers/firmware/arm_scmi/notify.c
@@ -209,11 +209,11 @@ struct scmi_registered_events_desc;
  * @init_work: A work item to perform final initializations of pending handlers
  * @notify_wq: A reference to the allocated Kernel cmwq
  * @pending_mtx: A mutex to protect @pending_events_handlers
+ * @pending_events_handlers: An hashtable containing all pending events'
+ *			     handlers descriptors
  * @registered_protocols: A statically allocated array containing pointers to
  *			  all the registered protocol-level specific information
  *			  related to events' handling
- * @pending_events_handlers: An hashtable containing all pending events'
- *			     handlers descriptors
  *
  * Each platform instance, represented by a handle, has its own instance of
  * the notification subsystem represented by this structure.
@@ -225,8 +225,8 @@ struct scmi_notify_instance {
 	struct workqueue_struct	*notify_wq;
 	/* lock to protect pending_events_handlers */
 	struct mutex		pending_mtx;
-	struct scmi_registered_events_desc	**registered_protocols;
 	DECLARE_HASHTABLE(pending_events_handlers, SCMI_PENDING_HASH_SZ);
+	struct scmi_registered_events_desc	*registered_protocols[];
 };

 /**
@@ -276,13 +276,13 @@ struct scmi_registered_event;
  * @eh_sz: Size of the pre-allocated buffer @eh
  * @in_flight: A reference to an in flight &struct scmi_registered_event
  * @num_events: Number of events in @registered_events
- * @registered_events: A dynamically allocated array holding all the registered
- *		       events' descriptors, whose fixed-size is determined at
- *		       compile time.
  * @registered_mtx: A mutex to protect @registered_events_handlers
  * @ph: SCMI protocol handle reference
  * @registered_events_handlers: An hashtable containing all events' handlers
  *				descriptors registered for this protocol
+ * @registered_events: A dynamically allocated array holding all the registered
+ *		       events' descriptors, whose fixed-size is determined at
+ *		       compile time.
  *
  * All protocols that register at least one event have their protocol-specific
  * information stored here, together with the embedded allocated events_queue.
@@ -302,11 +302,11 @@ struct scmi_registered_events_desc {
 	size_t				eh_sz;
 	void				*in_flight;
 	int				num_events;
-	struct scmi_registered_event	**registered_events;
 	/* mutex to protect registered_events_handlers */
 	struct mutex			registered_mtx;
 	const struct scmi_protocol_handle	*ph;
 	DECLARE_HASHTABLE(registered_events_handlers, SCMI_REGISTERED_HASH_SZ);
+	struct scmi_registered_event	*registered_events[] __counted_by(num_events);
 };

 /**
@@ -338,9 +338,9 @@ struct scmi_registered_event {
 	void		*report;
 	u32		num_sources;
 	bool		not_supported_by_platform;
-	refcount_t	*sources;
 	/* locking to serialize the access to sources */
 	struct mutex	sources_mtx;
+	refcount_t	sources[] __counted_by(num_sources);
 };

 /**
@@ -706,9 +706,12 @@ scmi_allocate_registered_events_desc(struct scmi_notify_instance *ni,
 	if (WARN_ON(ni->registered_protocols[proto_id]))
 		return ERR_PTR(-EINVAL);

-	pd = devm_kzalloc(ni->handle->dev, sizeof(*pd), GFP_KERNEL);
+	pd = devm_kzalloc(ni->handle->dev, struct_size(pd, registered_events, num_events),
+			GFP_KERNEL);
 	if (!pd)
 		return ERR_PTR(-ENOMEM);
+
+	pd->num_events = num_events;
 	pd->id = proto_id;
 	pd->ops = ops;
 	pd->ni = ni;
@@ -722,12 +725,6 @@ scmi_allocate_registered_events_desc(struct scmi_notify_instance *ni,
 		return ERR_PTR(-ENOMEM);
 	pd->eh_sz = eh_sz;

-	pd->registered_events = devm_kcalloc(ni->handle->dev, num_events,
-					     sizeof(char *), GFP_KERNEL);
-	if (!pd->registered_events)
-		return ERR_PTR(-ENOMEM);
-	pd->num_events = num_events;
-
 	/* Initialize per protocol handlers table */
 	mutex_init(&pd->registered_mtx);
 	hash_init(pd->registered_events_handlers);
@@ -800,14 +797,11 @@ int scmi_register_protocol_events(const struct scmi_handle *handle, u8 proto_id,
 				     GFP_KERNEL);
 		if (!r_evt)
 			return -ENOMEM;
+
+		r_evt->num_sources = num_sources;
 		r_evt->proto = pd;
 		r_evt->evt = evt;

-		r_evt->sources = devm_kcalloc(ni->handle->dev, num_sources,
-					      sizeof(refcount_t), GFP_KERNEL);
-		if (!r_evt->sources)
-			return -ENOMEM;
-		r_evt->num_sources = num_sources;
 		mutex_init(&r_evt->sources_mtx);

 		r_evt->report = devm_kzalloc(ni->handle->dev,
@@ -1666,18 +1660,14 @@ int scmi_notification_init(struct scmi_handle *handle)
 	if (!gid)
 		return -ENOMEM;

-	ni = devm_kzalloc(handle->dev, sizeof(*ni), GFP_KERNEL);
+	ni = devm_kzalloc(handle->dev, struct_size(ni, registered_protocols, SCMI_MAX_PROTO),
+			GFP_KERNEL);
 	if (!ni)
 		goto err;

 	ni->gid = gid;
 	ni->handle = handle;

-	ni->registered_protocols = devm_kcalloc(handle->dev, SCMI_MAX_PROTO,
-						sizeof(char *), GFP_KERNEL);
-	if (!ni->registered_protocols)
-		goto err;
-
 	ni->notify_wq = alloc_workqueue(dev_name(handle->dev),
 					WQ_UNBOUND | WQ_FREEZABLE | WQ_SYSFS,
 					0);
--
2.54.0

