Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9B2370AFC
	for <arm-scmi@vger.kernel.org>; Thu, 20 Aug 2026 02:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787192274; cv=none; b=GIY2beSM4Vl6ERh+HnC2T+nbdZ6+pLxZDIsQ9zHMUVnD1UXE9BeLzQaWjDBC2NWhDwpQuFFuhCVPqdCUQBsF3T8ZKxrNFmeG4WIH/ph9BYvwtYxeod9olEVeVWY4KfQAjB5a02FjVcL2V3ANjK+d6p4Q/cSetJkzLSoB1mnl67A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787192274; c=relaxed/simple;
	bh=cWPBQW+LAnI82mTf5t4h1gA+J9764gls1uMlhx2MZzE=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=m3rjqG3K+CNZwc22Xpg8wm09C9+pWdeT3zAj85UuOV0celktytASyDmZ3qrgfZMTQPpa0YYK4Su0lqd54r7LHDNO6hyM5OF9nXJ5nHw8LUjHIALu4nV4j8cS0TxpDuYELAPo7WmVckcg9gLZtWcs+gtfhi9m7PJhK1sdZyyFd4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 5514da589c3d11f19a56ed5b684f684d-20260820
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:137abac5-6e03-44b8-8f40-7346ad6be806,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:7db8b62,CLOUDID:1dc6f0cb647b155389abae454a9ca50d,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50,EDM:5,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5514da589c3d11f19a56ed5b684f684d-20260820
X-User: lijun01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 531664091; Thu, 20 Aug 2026 10:17:45 +0800
From: Li Jun <lijun01@kylinos.cn>
To: lijun01@kylinos.cn,
	sudeep.holla@kernel.org,
	cristian.marussi@arm.com,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] firmware: arm_scmi: pm: use DEFINE_SIMPLE_DEV_PM_OPS for pm struct
Date: Thu, 20 Aug 2026 10:17:18 +0800
Message-Id: <20260820021718.2454014-1-lijun01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

use DEFINE_SIMPLE_DEV_PM_OPS for scmi_dev_pm_ops,and add the value of
.freeze .thaw .poweroff .restore.if these address are null, may cause
error in s4.

Change:
-Replace SIMPLE_DEV_PM_OPS() in v1 with DEFINE_SIMPLE_DEV_PM_OPS() for pm.

Signed-off-by: Li Jun <lijun01@kylinos.cn>
---
 drivers/firmware/arm_scmi/bus.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index e060edbe7e83..c3af5eb549e1 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -13,6 +13,7 @@
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/device.h>
+#include <linux/pm.h>
 
 #include "common.h"
 
@@ -361,10 +362,7 @@ static int scmi_pm_resume(struct device *dev)
 	return 0;
 }
 
-static const struct dev_pm_ops scmi_dev_pm_ops = {
-	.suspend = pm_sleep_ptr(scmi_pm_suspend),
-	.resume = pm_sleep_ptr(scmi_pm_resume),
-};
+static DEFINE_SIMPLE_DEV_PM_OPS(scmi_dev_pm_ops, scmi_pm_suspend, scmi_pm_resume);
 
 const struct bus_type scmi_bus_type = {
 	.name =	"scmi_protocol",
-- 
2.25.1

