Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C361B4F09
	for <arm-scmi@vger.kernel.org>; Fri,  3 Jul 2026 20:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783110338; cv=none; b=KPwKPeIHA20WpzHZupXRudbhG49MRD9ztcsX9FYJz8A6Q+G2hmUt/3M1kNwh6ph9gfIgWKmbABSQqxMfrImqhM259ezrXIByvuuDFIbJK+E6oQu0LpdbLGDz/3e3bsqO0JuJOysepp4KiHAJFGri6Hv5ZFZc+F064H+qzYEMA1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783110338; c=relaxed/simple;
	bh=kupdiVCsZbbAycUmPkQWQSv2pt8xi7PVir+G2G8YQiU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hi20nYgum+Jb6QIy+dmNDjDRB7w5vdArQxB39TAwCl7CQsOSHAtm9ls8++Ur0SLz/vm0zHGmxJR1emUROI3uNZaGbfqyviNNPjqtk1e2y3dqFgeLsKL0n9XbIT8C7kofyzqtRLX3YpDfg+7d4zTQIuHTQu9e/xsUzgnckENxzus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TJRTCMAW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TJRTCMAW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 062DA1F000E9;
	Fri,  3 Jul 2026 20:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783110337;
	bh=zXSeNRPQkVlVy8DAuJOJGO898fvDtnoZKP7XJxfcRpg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TJRTCMAWLhIR1wrTquysX7nfDb4cXXlQp/0sj67KDjgDnU4sTeOB2XRa2wzoYw6mI
	 Z7H1gw/cCSk+55vfkoEaQafIshw6avgaYl/8xHIeL/CVtaadhhVk5dw40NcNTdFYBz
	 fA0ghqDt3zO0GBjXMBeDc6z8AyxzBvIs+MzGMTUUIu+3UQdBxHJH7ClErNTjtze6C/
	 Dd7mChDUnmKczlKEm2/t3QynSSKJ2GMnXW80+LWIbto+mPIXqeNKGr3YV3KXy3ZYUJ
	 FSjLZf59dOtv7v70MjXv0SlM19mA+Y2q0tTAOyTjKDb/jDeLMpVi4jJ4KhwgzuI3/1
	 ieIeu/TLd+ElA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 03 Jul 2026 21:22:46 +0100
Subject: [PATCH v3 10/17] firmware: arm_scmi: Avoid IDR updates while
 cleaning channels
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-scmi_core_fixes-v3-10-5bae9766abfc@kernel.org>
References: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
In-Reply-To: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

scmi_cleanup_channels() walks the TX/RX channel IDRs with
idr_for_each() to free transport resources and destroy the dedicated
transport devices before calling idr_destroy().

The destroy callback removed each entry from the same IDR being walked.
That is not needed for this cleanup path, and it is unsafe because
idr_for_each() has not advanced its radix-tree iterator while the
callback is running. Removing the current entry from the callback can
invalidate the iterator state. The callback also cannot be protected by
rcu_read_lock(), because scmi_device_destroy() may sleep.

Leave IDR teardown to the following idr_destroy() call and keep the
callback limited to device destruction.

Fixes: 05a2801d8b90 ("firmware: arm_scmi: Use dedicated devices to initialize channels")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index a575e661f1e2..ae4b7128276b 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2886,7 +2886,7 @@ static int scmi_channels_setup(struct scmi_info *info)
 	return 0;
 }
 
-static int scmi_chan_destroy(int id, void *p, void *idr)
+static int scmi_chan_destroy(int id, void *p, void *data)
 {
 	struct scmi_chan_info *cinfo = p;
 
@@ -2898,8 +2898,6 @@ static int scmi_chan_destroy(int id, void *p, void *idr)
 		cinfo->dev = NULL;
 	}
 
-	idr_remove(idr, id);
-
 	return 0;
 }
 

-- 
2.43.0

