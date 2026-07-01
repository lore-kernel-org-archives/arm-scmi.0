Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E50B74C14
	for <arm-scmi@vger.kernel.org>; Wed,  1 Jul 2026 16:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924803; cv=none; b=md1ZeIOEJQcE46X7pXbE94LzFZ1odVOn7QOVcOJDk2daKV0vmyTEMvCnlh9on5/0pSU3/YJHyS089VnXXHqt02IldjhuwQ4Exa27gQ5rUCpYcOIHVi3zLe9yL2TLvZ4qALGqw24eWl0JMtUJg+qkuc5W198M591QavfhEgAuwdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924803; c=relaxed/simple;
	bh=f0Vyb65y29VRt1RTOdK0e5peiM8JQdRz+hB1qDWnWs0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=abcLO0Lve4QtQom7clr9UK5SprvSzg2UWI0FZL41KfHZ7VNIu92lsYC7TSPR+mP7c4wy1GQTOVPo1v6wCLmR3U5E+6gu1IuRJChxFnIbYLJL5H5i9/nu9vqhMrDfXynwsgy3bgr+ccXDxJba3Y5a6r7Ynp53ax+N3+DrFuSMKMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kr25S/n9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kr25S/n9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4A911F00A3A;
	Wed,  1 Jul 2026 16:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782924802;
	bh=HX1nHvlk3c1+dgVJ4v3uKemvU735Z6kr6zZ67avlLqY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Kr25S/n9VzlPmL0BklcZN0wpZjCPFzt3OwVfBRBCTzzRoHosyLB1SX4S6VatXiX0z
	 I9G2iqnkBpHLQFQXyBWnjqChfcAxCH3UI4A6+dIrK4Y+13hbsrGXKq6aIQBfpdcies
	 cI0ex8VFTDANHE+g1CBPni7bQ+avyZjfKj0E/+pDROAz+kLRsy+uGimIYiuuSZTMgB
	 YE1yvCzXWiXyYnnC3+SOK1naDQwC/Mcq4D+ID+OYP5ySM9iEgExdcWw9H8nVsWqcY1
	 p6n1+yKANbVhTPBKjVL7VxtmQ4iQvk6eR9Jv4PibnddncHpD04qbqCHetGDASi7iFh
	 7eE/aJkU6FL9Q==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 01 Jul 2026 17:52:27 +0100
Subject: [PATCH v2 06/14] firmware: arm_scmi: Unregister device notifier
 before IDR teardown
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-scmi_core_fixes-v2-6-1f5e85553f73@kernel.org>
References: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
In-Reply-To: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

The requested-devices notifier looks up protocol fwnodes from the
active_protocols IDR. During remove, unregister the notifier before
releasing and destroying active_protocols so no notifier callback can race
with the IDR teardown.

Keep the bus notifier registered until after the protocol state is torn
down, matching the existing remove ordering for SCMI bus users.

Fixes: 53b8c25df708 ("firmware: arm_scmi: Add common notifier helpers")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 4b369b003003..6df0fe055d64 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3402,6 +3402,9 @@ static void scmi_remove(struct platform_device *pdev)
 
 	scmi_notification_exit(&info->handle);
 
+	blocking_notifier_chain_unregister(&scmi_requested_devices_nh,
+					   &info->dev_req_nb);
+
 	mutex_lock(&info->protocols_mtx);
 	idr_destroy(&info->protocols);
 	mutex_unlock(&info->protocols_mtx);
@@ -3410,8 +3413,6 @@ static void scmi_remove(struct platform_device *pdev)
 		of_node_put(child);
 	idr_destroy(&info->active_protocols);
 
-	blocking_notifier_chain_unregister(&scmi_requested_devices_nh,
-					   &info->dev_req_nb);
 	bus_unregister_notifier(&scmi_bus_type, &info->bus_nb);
 
 	/* Safe to free channels since no more users */

-- 
2.43.0

