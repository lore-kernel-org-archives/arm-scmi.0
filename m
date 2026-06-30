Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743613403F7
	for <arm-scmi@vger.kernel.org>; Tue, 30 Jun 2026 09:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782810405; cv=none; b=SQhWcnz9C4S/Nou/cTQgrLBjCCcJesQYPx0n7mISZU4PD6Tnuw/r7g4cZZ6Tck5PdKHkEFO4LINL4tvN5ASFKnPCE8EHGyt57T19ibiwgOByf8AKmdAzv958ZOT/ihu+M9zWKjYZxal/iXnAuzPCTpCLmgsYHJQ8BG0EBIv2Q0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782810405; c=relaxed/simple;
	bh=f0Vyb65y29VRt1RTOdK0e5peiM8JQdRz+hB1qDWnWs0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oWbUG48Scz5MCakhbA+lw88fk5TFnzsELjniyl4iJuAyVrDaSaRvPFHySXvXp9Oy7PC0aeoxXGl4GFSk9p1fiOfRkbqX8udCuhaISMFHygDA/yxWWLSHkPki06HC03WpPPoN/HktQWOEn4MXYyqvG+pTlUE5aKOnl52N42Vx5tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I6ENtvzL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I6ENtvzL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC1D1F00A3A;
	Tue, 30 Jun 2026 09:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782810404;
	bh=HX1nHvlk3c1+dgVJ4v3uKemvU735Z6kr6zZ67avlLqY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=I6ENtvzL6mKerxs3s0GmPXar3Dvn5z6Y/6x8tizjniMcko7B3RTaSTqMzebpGDsEQ
	 IhiK+7z6/cIwWBd+aztR19TwneFo6n/TR8dNft2IT8wVu0U+cGHup/jKbFd50244mV
	 Pvj+Sd85unMObaL0QcnGgZ2aJWFjwrpljdKdQZsapmXbwaJ+kDYddyIi6chYZAmMUV
	 1Vv466DCGjMlFq29E6ZqD/ZHLi5yPelNJcy3AeUm6UAzGw5DX9LcCRzB6XpUVrd6Cu
	 DKXK7f/a/XB+i46CAVKbWuwutzVa6hfOBQ1AYYFmYEksmoyrgnFikCg/rOTxQElcLw
	 btsikdOiMpu6Q==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 30 Jun 2026 10:06:02 +0100
Subject: [PATCH 6/9] firmware: arm_scmi: Unregister device notifier before
 IDR teardown
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-scmi_core_fixes-v1-6-f932c1e51992@kernel.org>
References: <20260630-scmi_core_fixes-v1-0-f932c1e51992@kernel.org>
In-Reply-To: <20260630-scmi_core_fixes-v1-0-f932c1e51992@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, Sashiko <sashiko-bot@kernel.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>
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

