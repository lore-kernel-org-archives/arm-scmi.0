Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD5A74C14
	for <arm-scmi@vger.kernel.org>; Wed,  1 Jul 2026 16:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924807; cv=none; b=Y0n8PpM7xyBw/T8mnFjviimrGBug4wBu81WZoUB0nSK+GCM4VJc0wa3SWYQ9vqF+MOPJJMpRU5PnEBYsQ1uPzP7y4+kYVr/HLkS1OHa9RKvkJQ/aWOYDBrQqiCqKN/f4+n2KqVF9iDEXXxfjsq+hN34W+VKVwjVd+3PL3eEnErw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924807; c=relaxed/simple;
	bh=kupdiVCsZbbAycUmPkQWQSv2pt8xi7PVir+G2G8YQiU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ReBflXpIeeH9xvGdFRtv3yp46PDf6YNVWCWPAZ6SPjklDyN41DfvabQD5JE9R07O45CsjYb7aTp0++r8PeaCk4wkj9yY3cP88rauchB0XBSsJ/1IuVvYddYAdKMp3p9M8aRS8JCxjSfFAi2KDnHbmRunLt/izB/rJqVK81u3RLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SPxNs37g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SPxNs37g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9881F00A3A;
	Wed,  1 Jul 2026 16:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782924806;
	bh=zXSeNRPQkVlVy8DAuJOJGO898fvDtnoZKP7XJxfcRpg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SPxNs37geuQfOmLcG8lQy+6RBS8REBeuafnTqE/8fDYHDQX8vBMfEkvkYn0UNS5qy
	 djpigZPt3QCY+HS9LXthxztQC6eqxRe1HRKMNXRUgEocz60lCublX5LJpWZSwIGgMU
	 rREF7ZX4JKNOKSZ0JXGxiUXhCP3yKh83luWbU0Prf4FS8192Yj5BOvI6+g8jy/Nwd/
	 ZX58KN3UKVt1V42hYYIwXtUkRRPsVJhdmBndJxckvH8XnH5GgJRvyLgr2GihCibJ00
	 8L4mc1nvkU6SsrOpYUOhvK1FJ71NdJkqzVgXy5SByHPGV0OBQqBSrgUZsgkPdIAEff
	 SpTPdOQEPfubg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 01 Jul 2026 17:52:31 +0100
Subject: [PATCH v2 10/14] firmware: arm_scmi: Avoid IDR updates while
 cleaning channels
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-scmi_core_fixes-v2-10-1f5e85553f73@kernel.org>
References: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
In-Reply-To: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
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

