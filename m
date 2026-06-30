Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F397A37F8BD
	for <arm-scmi@vger.kernel.org>; Tue, 30 Jun 2026 09:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782810408; cv=none; b=OjtaLVjN53ME222da4zQ/jG/SkZq6/HZONxSZNuogFYDNo9tFhChI1X7rxW5Bo9+vGS7kGF5HQZ9iRk1jxC/iejAlXGfKWBGOjuVd+chrqCi/5nCoQ9SIiq3bE/Ef9LKDPj6SZQ3jYIYNUVtZVFAQO60cG5Dt0jYt8v4dp3Qkyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782810408; c=relaxed/simple;
	bh=T6hXNun0IpckugLN2xZVygv478OirCHKxtIY28iYQk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jI34QdLlmkP5KpiGcxGCq7VBmZ6znC5UrgF8AaKxMVBtROB+fZmyRUOylLxZylS84NwjYds69sMfeV7tzaskN39Icu9o9+baUn+iqOCGUuDBuleeJA9aT9hUSSqns/Hyn4z8o4tvtIg+TXxmy53FTBWyxsfxLCGJgEvXAGav66A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KehSzWwz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KehSzWwz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A23C1F00A3D;
	Tue, 30 Jun 2026 09:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782810407;
	bh=2R7MMcV3mmk0nBdIgoUyC/wqlhfh+hr+iLk2fd0g8uI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KehSzWwztNFdYmmy7LLAAsUJ66s11dvMePZ21Ttdq1F0e/liwU7zxhVZgFVmadluW
	 25K+qEvTZEl2+9DyxIif5F3wDqZdH6wMwsle9EDZeboF/z81Yhwy9qnDr17/YYVUTN
	 qM9FyzoFXNYttGvJoNIceRphQ7Uaxed+uysPzOMmBK5pmsq9oy3M+Hzw7rqQ1Gxv1r
	 S8JJpZxUq2CC7JqriOpFJ3//wUqYE4wT/IDycX9YAN1yFzR18HDcHyfjM8WDkOYmfv
	 T/5t57DOxk0vQ7szrrAjfoa5kIxw0npp5KqPEvtJFhHo/Oc3XNvSNoWI3SU+xRb/p8
	 oUs1FgW3PefLw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 30 Jun 2026 10:06:05 +0100
Subject: [PATCH 9/9] firmware: arm_scmi: Protect device request lookup with
 RCU
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-scmi_core_fixes-v1-9-f932c1e51992@kernel.org>
References: <20260630-scmi_core_fixes-v1-0-f932c1e51992@kernel.org>
In-Reply-To: <20260630-scmi_core_fixes-v1-0-f932c1e51992@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, Sashiko <sashiko-bot@kernel.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>
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

