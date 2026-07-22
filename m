Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1013BADB2
	for <arm-scmi@vger.kernel.org>; Wed, 22 Jul 2026 09:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784713974; cv=none; b=L1re0ZmCqXmhCLLIVKF+6XZi544HVVU7R1s3ANMRr1CAB29WEqZRa/8vDwL3URsOC5rF35GLogqA0wbotT+J0S+qmdKDaonx6tMYPLXHId9wK6/w6RZ41Wk/YIB8N+r1qSShTU+PSa04kl0AqZqhGDFw5Drvi+T1SInfMITuQN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784713974; c=relaxed/simple;
	bh=0kGdteZvCzIwpL6d6/sCdFU/STO2HeNKpBMARI4fdBU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fru54JuetgJWE1VBEmYzNxR5SfTvCHQmKNa9bfUF/O6clBV1k+v+UgZg+xelXpYL2YInfLYXp2ePLhB9vRIocdEBmiTPmBAm6lsEk3sZB4BxyJcBVP2j3fgnwnIrhDeTXBSIjXt51JfctxZWJzcaFDyNoGAELELUkOZs6X+yoJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hs/qCTBc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hs/qCTBc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B091F000E9;
	Wed, 22 Jul 2026 09:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784713972;
	bh=fdytK0eVBE/MmvQJtNFcG+GJxcn7WfoMOfY69zZWId8=;
	h=From:To:Cc:Subject:Date;
	b=hs/qCTBct6ZK2iyaLjJC1/ILSbH+N7YP5ftHer+qzXO7T5RoolXARn1aMNNapIIDp
	 JtrowoXf2wtT6jyzY/xdqA+8nEmVkkNLuM1H7/xSoE+xdiR57TwLisQfmbfJwlqCG9
	 0+MYlmt1kahXADThsn0Zl6pwFK/fwbOAc4PLNLfW6dwzwr0QOMVIhP3BYQfdO7KPDJ
	 6P8dMwClA0v5grO90v96A7VxaFL3GUrHT8ciK6LfhitChxVAg1pXrV+vpvEiKzw8EN
	 RWWncoSK6LK1nJaDE5QhYRT5/W0+aEfh5Fqpmc3Xeit7Ll6gY8MXSsuFFvn0+gOhcY
	 aErltjkOQxsvQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH] firmware: arm_scmi: Fix requested device removal race
Date: Wed, 22 Jul 2026 10:52:50 +0100
Message-ID: <20260722095250.2011630-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

scmi_protocol_device_unrequest() drops scmi_requested_devices_mtx while
notifying listeners but continues to retain the per-protocol list head.
When two SCMI drivers for the same protocol unregister concurrently, one
thread can remove the final request and free the list head while the other
is running its notifier. The latter then dereferences the freed list head
after reacquiring the mutex and can free it a second time.

Complete the list and IDR updates, including freeing an empty list head,
before dropping the mutex. Keep the blocking notifier outside the critical
section and retain only the detached request across the callback.

Fixes: d3cd7c525fd2 ("firmware: arm_scmi: Refactor protocol device creation")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/bus.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

Hi,

I had ignored this issue after Sashiko had reported it but after thinking
a bit, since we allow registering more that one driver for the same protocol,
unregister can also be called concurrently and hence this is a valid possible
race condition IMO.

Regards,
Sudeep

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 793be9eabaed..d4d3f8c69014 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -159,6 +159,7 @@ static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
  */
 static void scmi_protocol_device_unrequest(const struct scmi_device_id *id_table)
 {
+	struct scmi_requested_dev *rdev, *victim = NULL;
 	struct list_head *phead;
 
 	pr_debug("Unrequesting SCMI device (%s) for protocol %x\n",
@@ -167,29 +168,28 @@ static void scmi_protocol_device_unrequest(const struct scmi_device_id *id_table
 	mutex_lock(&scmi_requested_devices_mtx);
 	phead = idr_find(&scmi_requested_devices, id_table->protocol_id);
 	if (phead) {
-		struct scmi_requested_dev *victim, *tmp;
-
-		list_for_each_entry_safe(victim, tmp, phead, node) {
-			if (!strcmp(victim->id_table->name, id_table->name)) {
-				list_del(&victim->node);
-
-				mutex_unlock(&scmi_requested_devices_mtx);
-				blocking_notifier_call_chain(&scmi_requested_devices_nh,
-							     SCMI_BUS_NOTIFY_DEVICE_UNREQUEST,
-							     (void *)victim->id_table);
-				kfree(victim);
-				mutex_lock(&scmi_requested_devices_mtx);
+		list_for_each_entry(rdev, phead, node) {
+			if (!strcmp(rdev->id_table->name, id_table->name)) {
+				victim = rdev;
+				list_del(&rdev->node);
 				break;
 			}
 		}
 
-		if (list_empty(phead)) {
+		if (victim && list_empty(phead)) {
 			idr_remove(&scmi_requested_devices,
 				   id_table->protocol_id);
 			kfree(phead);
 		}
 	}
 	mutex_unlock(&scmi_requested_devices_mtx);
+
+	if (victim) {
+		blocking_notifier_call_chain(&scmi_requested_devices_nh,
+					     SCMI_BUS_NOTIFY_DEVICE_UNREQUEST,
+					     (void *)victim->id_table);
+		kfree(victim);
+	}
 }
 
 static void
-- 
2.43.0

