Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C5030AD0C
	for <arm-scmi@vger.kernel.org>; Fri,  3 Jul 2026 20:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783110337; cv=none; b=Y6FmP+Fipr5NofWNp+HSkO3fLNqkrnxki2sZmnXN06TZIk9hrDBg9oWO8VKFRKCRBJHc4b6SvfxqXIBLKmHQwVbY3XwgTv2BkYeAJFP+jKRiF9zHM8yyIDVbT9Myu7NbshuTStIcN9Dvc4Cqt1sgnMPDFOG/z8EyU+UgFmyusbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783110337; c=relaxed/simple;
	bh=T6hXNun0IpckugLN2xZVygv478OirCHKxtIY28iYQk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c1UokZT9IuTCF1Yolyl0CS+kur9a7agXxk3+dsgoGo3ddv6MbKwBqWuxOTpKkO4pmwDtVSBXaFT+qV2J1GHrHXveN76sMVwuHM14/netz/Ecvkdjlh5Ve4jBbgNtCTks4oARuYRVXEJ6xv9gKrmBeUWkmXfPEa4o1oyjCb8bMQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FCSqJqU7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FCSqJqU7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15F491F00A3D;
	Fri,  3 Jul 2026 20:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783110336;
	bh=2R7MMcV3mmk0nBdIgoUyC/wqlhfh+hr+iLk2fd0g8uI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FCSqJqU73UjXjYb6DI+l6uc+KNg5n8z7CUg9w4kjjvfBm8s/+b8kjJJq8wd2QANTH
	 M46URcr2svxX3XUaturRGw8drvbBZRJpCWzGyHdDfPr7HszHdN49rPR3vMRu38LILl
	 pxSyzY17ZcuTCeLJiFsfaZnX1Kmny4Z0SgrAeWQJyFl4fe1pzFIELJZttcRvS+t/HB
	 DboEBovm/ZWOL/+zLb8ge9wmoX+erMLaGVVlVivtMjFJcr233Dcjo4y7QOBYjx2OcJ
	 jzEOt78v+APX7lE10vCkxtMizu1H/p1AfC9v/JVfhJGMUA8coV53GogNVXRQs6ym2L
	 LPJwWaAQFF7WA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 03 Jul 2026 21:22:45 +0100
Subject: [PATCH v3 09/17] firmware: arm_scmi: Protect device request lookup
 with RCU
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-scmi_core_fixes-v3-9-5bae9766abfc@kernel.org>
References: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
In-Reply-To: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

The SCMI device request notifier looks up protocol OF nodes from the
active_protocols IDR. The IDR lookup can run concurrently with protocol
activation while probe is still registering protocols and creating their
SCMI devices.

Wrap the lookup in an RCU read-side critical section as required by the
IDR API for lockless readers.

Fixes: 53b8c25df708 ("firmware: arm_scmi: Add common notifier helpers")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 6df0fe055d64..a575e661f1e2 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -33,6 +33,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/processor.h>
+#include <linux/rcupdate.h>
 #include <linux/refcount.h>
 #include <linux/slab.h>
 #include <linux/xarray.h>
@@ -2957,7 +2958,9 @@ static int scmi_device_request_notifier(struct notifier_block *nb,
 	struct scmi_device_id *id_table = data;
 	struct scmi_info *info = req_nb_to_scmi_info(nb);
 
+	rcu_read_lock();
 	np = idr_find(&info->active_protocols, id_table->protocol_id);
+	rcu_read_unlock();
 	if (!np)
 		return NOTIFY_DONE;
 

-- 
2.43.0

