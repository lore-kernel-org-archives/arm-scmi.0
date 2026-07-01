Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FEB36C9D5
	for <arm-scmi@vger.kernel.org>; Wed,  1 Jul 2026 16:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924806; cv=none; b=Z7b0segQssTfX8xBFRirquxakxXF8P0L4dmEAjv4a5AKt/UV6OcVhpgCWZMBpHb/FTcIEIz8UshvEzCzOG3iL0a7MWwsgt5XEMfkchn8X8LCMJKAUIE78nM3Y9/7LXoOoOnTwmoVAev6KxTHpZxMIOkFhXneD4oVLehuM+uxpE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924806; c=relaxed/simple;
	bh=T6hXNun0IpckugLN2xZVygv478OirCHKxtIY28iYQk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JUU/nCr8rW/0gVPz7l7UkOioOV3lEcvxw3EXJPB8agwAK//nxtTA/MPjQ1DZaEtuu6O3Dw0zSLUnpUM1MgbPSR+VJ1AoHz/S3V73QowYWdJs5Jt0o7tgLzYeJrNQayFPacvqxnoNIYTAFQvVNU/gwS2IlC6hkap8qUyjS4smmwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PYAoMrRD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PYAoMrRD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC2D11F000E9;
	Wed,  1 Jul 2026 16:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782924805;
	bh=2R7MMcV3mmk0nBdIgoUyC/wqlhfh+hr+iLk2fd0g8uI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PYAoMrRD+yH4FMWd2ivhD4Y7E2zYn6WM6Ce45FQx+xLDPLSgTcpbrApZqxaQzQhzY
	 tgOiDoBfV8D9gSHsBy8/ZQj904Q8Evj973YftNzOCYtJ/LOzWJYPq4MtihUzvArQkE
	 4CsEmVCJKomT1ACaLrP83QBeElWpr/G1ck8OJA4b4IXYVZ9+e7dOegAZ1kt73abLAF
	 gW+023bpm95o1R4Hsr/O/mM4o9N+qPpjTtbjDUWm0wze3si8spqvN/MiIJW40xgfq6
	 EaG+DNx4W+0D/OT6NiqERcsREj7jZXeHhxHLMQL8lFIZ44NPORNH7E/r6G3zGYFXSj
	 IOYizHojWlaEA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 01 Jul 2026 17:52:30 +0100
Subject: [PATCH v2 09/14] firmware: arm_scmi: Protect device request lookup
 with RCU
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-scmi_core_fixes-v2-9-1f5e85553f73@kernel.org>
References: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
In-Reply-To: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
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

