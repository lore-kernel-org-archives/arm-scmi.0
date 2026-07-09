Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EE33FBB77
	for <arm-scmi@vger.kernel.org>; Thu,  9 Jul 2026 08:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587188; cv=none; b=m66KHHvux3ypfD/5XtEhUGBmqzJaqEp2ZWwdK9nXvnA9UL++qEN5rt8bCYBgGwImV5zCmNYvROQOzzXSF1l/Dw+yWqDYvXRB2fzlD/6WpT1pCxDe6LKPnop7NsWvu7UB/5uvhe9T+dWE+C0zDCS++ktNiiMVi/1JmryRt/kVBd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587188; c=relaxed/simple;
	bh=gD2Q9ewuklgYQfz6si8ulMqBzVM5BnAmk67HdniJV9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TzmtdXfICgrPUZokKteojHoo0IHpgQ77eefrLZp4HkYav5x/v+XikKxX5RUw0n1DAVlFnitd30+ol+cSflIDfIcBmv8U3ALPxjZIxRLl4Wg/mL8l2Wn3gdEZqJ9FC9iAxhsGxGW+Q1aF80yKmSwjR8SSF/ScBCeOmtZYLQZF1jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bar/EztN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bar/EztN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B2731F000E9;
	Thu,  9 Jul 2026 08:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587187;
	bh=L9WYDR5trI7p9S+Iac5p6xn9rhzelgxyQenxL6PczGQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bar/EztNxGT1+fhCeoRg+hYkaUehvMQY2T829gmYYVbt1FCzP8LDyuoLNct5mAGM5
	 k03WU5swcgsK4Px8gfz6Vkinlji9Xp+qzIZA0p2NGDv4ujn87TLTUWFAo1CFCP54kl
	 TbswaEkLeSO3AcrSMsVSf8VbmpdVEwwaspD+kto7e7/53lzI/S2rmP3eMSiIKuveAj
	 eFUBzW0+CpIjP2xUW0N4pVwMO00sSpGCOAYt9EGS2GscXY3XS/UFwpfJRAknC+UyP8
	 wcPhkceqsgmJF0psUUJAwdQhpeqtT8WxT6cAbHo7k0tO+O2IEMz525CLhCkwCPe05o
	 hNbmEnchc5yMg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 09 Jul 2026 09:52:33 +0100
Subject: [PATCH v5 09/16] firmware: arm_scmi: Protect device request lookup
 with RCU
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-scmi_core_fixes-v5-9-bea6a3024f05@kernel.org>
References: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
In-Reply-To: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
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

