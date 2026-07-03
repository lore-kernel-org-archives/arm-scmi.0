Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9359C30AD0C
	for <arm-scmi@vger.kernel.org>; Fri,  3 Jul 2026 20:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783110339; cv=none; b=rSMNcpPXpx6DbqcrDjgXEZw98w9klp/CR6hW20OWYTGM1JsUgF/cUgqRXO11MSiY2/+Roty1QikqGAhSQvJ68x54zarEb35ENIwVPaSijnDa5UceagHQGrTxUyK0KaY3k7ef1703gp1DwEW47jmeKTjDmKFN1nXdVtr4Cogc3bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783110339; c=relaxed/simple;
	bh=eIHIMwpzUqvWGzyaeoDyGimLPtPEou7vf9EqFl6X7Dc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PGuoM1AiA7kM4rd7566gvBljguS0k814lHi1z/q00q5WCo2/AtWqEMPQhzntUIGXctn63fb41V8ROJ6qbPxM0DRoeCqoVX0jNoDEXAeaOHsGYDIKcD/ksWsRyYzqcAg3Ggd8F3ops3wBqTlEGQaF1pHSzS59NvMFigRzX254NaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=movkKE5e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="movkKE5e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB1F71F00A3A;
	Fri,  3 Jul 2026 20:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783110338;
	bh=9hLl4g+Pdk8ni8rRRoBOyjEJFKaFInoMeYuqg8H35RQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=movkKE5eazgnTxW/gDAZmhfVvp5CiCyuZuXjXh9e41vXhTbrp+PUvuRwGCM6hrS+l
	 vNf+l0kfgp4VWAGM6irjPdAlxw9iPw9yxiY1U2Kzw8g6AbUwInSoDz/WKEc9OnDbW1
	 wJQkeH4y6ifYBdDVEXmeXMy/zLcqcqda6pLdKcD0dkr9K8pGiAPIx79s5+Q5ZmLG+N
	 /CpZukikH1g/1NQvOLySi3SnP/p0uumzCO5QJrGRLgQ9rTL2nr0I+gKMsnPALBUJTz
	 5QylhBFXT4NFNVlE2s16mBgwe/Nj5GJF3PdXkwGhemH+A29emX1gyY9Od2H4RkqN6U
	 JA3ZkSBS9gr+w==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 03 Jul 2026 21:22:47 +0100
Subject: [PATCH v3 11/17] firmware: arm_scmi: Clear SystemPower flag on
 create failure
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-scmi_core_fixes-v3-11-5bae9766abfc@kernel.org>
References: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
In-Reply-To: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

__scmi_device_create() reserves the singleton SystemPower protocol
device by setting scmi_syspower_registered before allocating and
registering the SCMI device.

If any later step fails, the function returns NULL but leaves the flag
set. A subsequent retry, for example after probe deferral, then observes
the stale reservation and rejects creation of the SystemPower protocol
device permanently.

Route all failures after the successful reservation through a common
unwind path which clears scmi_syspower_registered again. Keep the
duplicate-device rejection path unchanged because that path did not
acquire the reservation.

The same singleton reservation can also be dropped from the final release
callback if SCMI child devices are deleted directly by the driver core
rather than through __scmi_device_destroy(). Keep the SystemPower flag
clear in the common resource helper used by destroy, register-failure and
final-release paths so all SystemPower cleanup follows the same rule.

Fixes: 2c3e674465e7 ("firmware: arm_scmi: Refactor device create/destroy helpers")
Fixes: 46edb8d1322c ("firmware: arm_scmi: provide the mandatory device release callback")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/bus.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index cbd2e6058210..11ff0b8d2c05 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -403,6 +403,9 @@ EXPORT_SYMBOL_GPL(scmi_driver_unregister);
 
 static void scmi_device_release_resources(struct scmi_device *scmi_dev)
 {
+	if (scmi_dev->protocol_id == SCMI_PROTOCOL_SYSTEM)
+		atomic_set(&scmi_syspower_registered, 0);
+
 	if (scmi_dev->id) {
 		ida_free(&scmi_bus_id, scmi_dev->id);
 		scmi_dev->id = 0;
@@ -426,9 +429,6 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
 		 dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
 		 scmi_dev->name);
 
-	if (scmi_dev->protocol_id == SCMI_PROTOCOL_SYSTEM)
-		atomic_set(&scmi_syspower_registered, 0);
-
 	device_del(&scmi_dev->dev);
 	scmi_device_release_resources(scmi_dev);
 	put_device(&scmi_dev->dev);
@@ -440,6 +440,7 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 {
 	int id, retval;
 	struct scmi_device *scmi_dev;
+	bool syspower = (protocol == SCMI_PROTOCOL_SYSTEM);
 
 	/*
 	 * If the same protocol/name device already exist under the same parent
@@ -455,14 +456,12 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 	}
 
 	/*
-	 * Ignore any possible subsequent failures while creating the device
-	 * since we are doomed anyway at that point; not using a mutex which
-	 * spans across this whole function to keep things simple and to avoid
-	 * to serialize all the __scmi_device_create calls across possibly
-	 * different SCMI server instances (parent)
+	 * Reserve the singleton SystemPower protocol device before
+	 * allocation and registration. This keeps creation simple without
+	 * a mutex spanning the whole function; error paths after the
+	 * reservation must drop it again.
 	 */
-	if (protocol == SCMI_PROTOCOL_SYSTEM &&
-	    atomic_cmpxchg(&scmi_syspower_registered, 0, 1)) {
+	if (syspower && atomic_cmpxchg(&scmi_syspower_registered, 0, 1)) {
 		dev_warn(parent,
 			 "SCMI SystemPower protocol device must be unique !\n");
 		return NULL;
@@ -470,19 +469,19 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 
 	scmi_dev = kzalloc_obj(*scmi_dev);
 	if (!scmi_dev)
-		return NULL;
+		goto clear_syspower;
 
 	scmi_dev->name = kstrdup_const(name ?: "unknown", GFP_KERNEL);
 	if (!scmi_dev->name) {
 		kfree(scmi_dev);
-		return NULL;
+		goto clear_syspower;
 	}
 
 	id = ida_alloc_min(&scmi_bus_id, 1, GFP_KERNEL);
 	if (id < 0) {
 		kfree_const(scmi_dev->name);
 		kfree(scmi_dev);
-		return NULL;
+		goto clear_syspower;
 	}
 
 	scmi_dev->id = id;
@@ -504,6 +503,9 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 put_dev:
 	scmi_device_release_resources(scmi_dev);
 	put_device(&scmi_dev->dev);
+clear_syspower:
+	if (syspower)
+		atomic_set(&scmi_syspower_registered, 0);
 	return NULL;
 }
 

-- 
2.43.0

