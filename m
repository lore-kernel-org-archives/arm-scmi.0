Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E799936F8F1
	for <arm-scmi@vger.kernel.org>; Tue, 14 Jul 2026 12:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784033927; cv=none; b=lgevFqODmnLyh5ep644U7jBoJaZtLW18Zzj9ZIGkRCmwIb+x/8LkKFeMPDKCs2ZZw2muigTZD1OAv4HhZDUDL5OgxM/lP8PMYr9DlCRG50ZF+eZDRboTIZ9j+dju9dKgAHZzL8UUxqMxUbyGvvtN0+Vz8bit61GTD319xDbFi10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784033927; c=relaxed/simple;
	bh=gD2Q9ewuklgYQfz6si8ulMqBzVM5BnAmk67HdniJV9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lNFvp/wWnr0d1g+q25IGxMbbPFawf55RX5pLftIAfiOT+wACQwYrrP2UkDXOogWE+H3+SyH7w6rWdfIt+QteX5Ph3Vj0jDcqkEDHfsfeKoBJNNkHmNYbHOoRe75zWWIXGhCWiwpIN3N+6/7w0AjLXfm7wITJPvVo7zNAWCgInjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i06zBUzq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i06zBUzq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE2491F00A3F;
	Tue, 14 Jul 2026 12:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784033926;
	bh=L9WYDR5trI7p9S+Iac5p6xn9rhzelgxyQenxL6PczGQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=i06zBUzqpTcRsmR/gY2bqgX80JQDQoCjKlyqIRQhssBhkc/llgdwUvininXheC0xl
	 JddpxC1r/5QaEKHNCMZh1UurUsPB8EMrD0Gqcc91EGtveliN+1EmjyDrEDeawegvQ+
	 JChazQmsRrpZI7xd+SVKBd3vbEQIL8hBbJkRQmPkmo+2SRIblK6yJjWDZCWmvFV88N
	 Mw9BliiJcTPsUfVmdtd1xTrM84Cmg+eT88vxVjW4cWQPrOWZFDaovrAABjdaeoTVMA
	 IKxfo1P+TIFOgKp7agXRWeKPaA2jmB3tgU2tQo4OWhDQhfyXY0dz9DNmLfG6zcAD6H
	 CkIjATSyeFD+A==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 14 Jul 2026 13:56:28 +0100
Subject: [PATCH v6 09/16] firmware: arm_scmi: Protect device request lookup
 with RCU
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-scmi_core_fixes-v6-9-3afe499d46e3@kernel.org>
References: <20260714-scmi_core_fixes-v6-0-3afe499d46e3@kernel.org>
In-Reply-To: <20260714-scmi_core_fixes-v6-0-3afe499d46e3@kernel.org>
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
index f607557c04ad..a2871dca24dc 100644
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

