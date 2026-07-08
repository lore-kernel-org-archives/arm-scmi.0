Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA64F407571
	for <arm-scmi@vger.kernel.org>; Wed,  8 Jul 2026 09:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783501234; cv=none; b=kdW/b1azKt/YoSeXakpE73TKLM+UaXarKjBsI1SJxql586tvQD5EFs2el9fm50EQUlosoGgPqwY0jxS+ABmKMEnn0J1DxJNN/jAnQ11acwzbPbCEeYTOid44QLTTwlkPQ/aT+BEkV6mmVekCV0TiybcMEHGAtGagrc5lawqgNtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783501234; c=relaxed/simple;
	bh=ktmAO3rwZ3UKsNzUnBEDgV9dV07gZBRT7ucK9Mk9ufE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gnZbNuxBgU5B8Gb05HdBzT/5LAXN68KLjX02RfKNpdqXzIYuWoeS9tzOB5xdEuumqD5HMIXruvUUmDAQPveHWj1eAeDef9E9OO2/0gbL+AM90/O115lMbqaO5B19IzCHLpoHK0RSfmmW78iGhRk855vdK9frfFk7Ocjwob7MO+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K+SeFUTe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K+SeFUTe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E3F01F000E9;
	Wed,  8 Jul 2026 09:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783501233;
	bh=7+3DDIC4PQymPZk8Lzuoy1hNZXPh/rY0lef4PRU+Vgo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=K+SeFUTetjIL+PihBvnhdPSutJGC4EU+7KrYuzh8y1FSwWAVd0B1yDl/kBXFi5dLD
	 ppHbVF4IXNk6XZOjujrTs4Q6lFMh5WpcnIX6SX3+rA09reitJyhCz5aPdD8sSusNbj
	 gIRe8ymIwmzOPA+yYyEhy/paLbMiAncMLWrMNbKw2DvO/wPN1pUHks1YzYhyuxJlbT
	 jDXAKttK/EF8pEUc5xSj6U2MMZ5jXMa5SeVOVwqQgkGD9Uv6uluXDtGiNW/ghtddXU
	 bwclpVQ2slrfaHtIPvgYo4+30rPaxQEChVMDLSyrP1pAx8aLbTOsc2jldt0cc23NkQ
	 8SPlqD7+qzFwA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 08 Jul 2026 10:00:05 +0100
Subject: [PATCH v4 09/16] firmware: arm_scmi: Protect device request lookup
 with RCU
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-scmi_core_fixes-v4-9-53142cd60b63@kernel.org>
References: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
In-Reply-To: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
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
index 67267507ea1d..73cfe2eaacea 100644
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
@@ -2958,7 +2959,9 @@ static int scmi_device_request_notifier(struct notifier_block *nb,
 	struct scmi_device_id *id_table = data;
 	struct scmi_info *info = req_nb_to_scmi_info(nb);
 
+	rcu_read_lock();
 	np = idr_find(&info->active_protocols, id_table->protocol_id);
+	rcu_read_unlock();
 	if (!np)
 		return NOTIFY_DONE;
 

-- 
2.43.0

