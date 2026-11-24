Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795546297;
	b=T5UmcbZ9jOWABaRpQ88nMld3DPfJJuVgzSRtXLtpKCFTTyAshDcMU6vM396sDs6ALQIx
	 NXTSEJg16s3Bwm8Bn6VajTmBYIH+Gv/kcs1rb3KNSJs6VNNOKP7J+cOljcT5vbxcU4vC8
	 8wKAko7hvmoDE6mh36eAcAWrJBIIEARRZ+G67pLOTev8aVMswFgDuUW/tugh90G9MFlBy
	 Vf6MQJ7dxv8J2NUNs7Jm/XdRZDLKPd+4hr34PygQ+m/6DUpjqzNhWpOR8aKBpB90uh0BW
	 hbOEITMFqeivlBCgSYmEbpoDhrq1IQmtN+TYomu75uxAi3bhl0/27428fpn9nxsP8/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795546297;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3HrwYbYeRKwhWvtwePQmsJVNwLGkYk2BRyepq/uuTWk=;
	b=LT4a10RppWj3bhvcXyt5FomKL0or6vZik/jFvbH96mHqQuzfT8G6Ijw9fnTLTng2FWVc
	 CCAyM+hJTOHsIMeLQ7CdbpDIVHaQNEGflgDFf8x6ssKtLSm5I1ZeIwLr+2pmyyrKxGWYw
	 AM/A3g3GJ44LUns/ByNHAYyBWbkMwwxZHbRiTkuWBGI3CXhyI0ORAAkqNZgSCgQbMIBP7
	 YQul/JkSJN4wn5kD5lX6OhauI3WonyYK3wydobz5ftvdM4Tfq5C0tVO3Xe3duuQif3iaG
	 FGZ00WnVH71OkahP6KZDNnZ04fHAKFIut4t14rT6x4vw/lyqz8OfGgEyAk8kOXnPHag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hC7gz91+;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62A80606A33E;
	Tue, 24 Nov 2026 18:51:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62A80606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hC7gz91+
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D35B316F3;
	Tue, 24 Nov 2026 10:51:33 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FE9A3F86C;
	Tue, 24 Nov 2026 10:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795546296; bh=reLjI8ZY114XEuMwYzlvXp4Ql2o+omVz+I8QfgMTkOk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hC7gz91+aJPJmR+PIIVh/7/EHn9yRj6IekgR7gxbBmRgc3KNl8XdhdKb74+IXRyEw
	 SB+dLH6oNgpFiG/a/JFJ1R+y2dGkkjhDDyaNBfk91y61wFrR1hKN/KMmpaAsx18Jw0
	 4FfB6X4rso5gb/2lwQAOYIGxfx1LHuUizpRdSJeI=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	philip.radford@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 2/2] firmware: arm_scmi: Refactor protocol allocation
Date: Tue, 24 Nov 2026 18:51:11 +0000
Message-ID: <20261124185111.1022322-3-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124185111.1022322-1-cristian.marussi@arm.com>
References: <20261124185111.1022322-1-cristian.marussi@arm.com>
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

Simplify protocol initialization and finalization using cleanup handlers.
Relocate the protocol put operations out of the setup and cleanup code so
as to be executed strictly after the protocol devres groups have been
fully released.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/driver.c | 53 +++++++++++++-----------------
 1 file changed, 22 insertions(+), 31 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 2c4424aa0d37..199f0a189432 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2256,24 +2256,21 @@ static void scmi_protocol_version_initialize(struct device *dev,
  *
  * Context: Assumes to be called with @protocols_mtx already acquired.
  * Return: A reference to a freshly allocated and initialized protocol instance
- *	   or ERR_PTR on failure. On failure the @proto reference is at first
- *	   put using @scmi_protocol_put() before releasing all the devres group.
+ *	   or ERR_PTR on failure.
  */
 static struct scmi_protocol_instance *
 scmi_alloc_init_protocol_instance(struct scmi_info *info,
 				  const struct scmi_protocol *proto)
 {
+	const struct scmi_handle *handle = &info->handle;
+	struct scmi_protocol_instance *pi;
 	int ret = -ENOMEM;
 	void *gid;
-	struct scmi_protocol_instance *pi;
-	const struct scmi_handle *handle = &info->handle;
 
 	/* Protocol specific devres group */
 	gid = devres_open_group(handle->dev, NULL, GFP_KERNEL);
-	if (!gid) {
-		scmi_protocol_put(proto);
-		goto out;
-	}
+	if (!gid)
+		return ERR_PTR(ret);
 
 	pi = devm_kzalloc_obj(handle->dev, *pi);
 	if (!pi)
@@ -2328,10 +2325,7 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
 	if (pi->proto->instance_deinit)
 		pi->proto->instance_deinit(&pi->ph);
 clean:
-	/* Take care to put the protocol module's owner before releasing all */
-	scmi_protocol_put(proto);
 	devres_release_group(handle->dev, gid);
-out:
 	return ERR_PTR(ret);
 }
 
@@ -2351,25 +2345,25 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
 static struct scmi_protocol_instance * __must_check
 scmi_get_protocol_instance(const struct scmi_handle *handle, u8 protocol_id)
 {
-	struct scmi_protocol_instance *pi;
 	struct scmi_info *info = handle_to_scmi_info(handle);
+	struct scmi_protocol_instance *pi;
+	const struct scmi_protocol *proto;
 
-	mutex_lock(&info->protocols_mtx);
+	guard(mutex)(&info->protocols_mtx);
 	pi = idr_find(&info->protocols, protocol_id);
-
 	if (pi) {
 		refcount_inc(&pi->users);
-	} else {
-		const struct scmi_protocol *proto;
-
-		/* Fails if protocol not registered on bus */
-		proto = scmi_protocol_get(protocol_id, &info->version);
-		if (proto)
-			pi = scmi_alloc_init_protocol_instance(info, proto);
-		else
-			pi = ERR_PTR(-EPROBE_DEFER);
+		return pi;
 	}
-	mutex_unlock(&info->protocols_mtx);
+
+	/* Fails if protocol not registered on bus */
+	proto = scmi_protocol_get(protocol_id, &info->version);
+	if (!proto)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	pi = scmi_alloc_init_protocol_instance(info, proto);
+	if (IS_ERR(pi))
+		scmi_protocol_put(proto);
 
 	return pi;
 }
@@ -2402,12 +2396,13 @@ void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id)
 	struct scmi_info *info = handle_to_scmi_info(handle);
 	struct scmi_protocol_instance *pi;
 
-	mutex_lock(&info->protocols_mtx);
+	guard(mutex)(&info->protocols_mtx);
 	pi = idr_find(&info->protocols, protocol_id);
 	if (WARN_ON(!pi))
-		goto out;
+		return;
 
 	if (refcount_dec_and_test(&pi->users)) {
+		const struct scmi_protocol *proto = pi->proto;
 		void *gid = pi->gid;
 
 		if (pi->proto->events)
@@ -2418,15 +2413,11 @@ void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id)
 
 		idr_remove(&info->protocols, protocol_id);
 
-		scmi_protocol_put(pi->proto);
-
 		devres_release_group(handle->dev, gid);
+		scmi_protocol_put(proto);
 		dev_dbg(handle->dev, "De-Initialized protocol: 0x%X\n",
 			protocol_id);
 	}
-
-out:
-	mutex_unlock(&info->protocols_mtx);
 }
 
 void scmi_setup_protocol_implemented(const struct scmi_protocol_handle *ph,
-- 
2.54.0

