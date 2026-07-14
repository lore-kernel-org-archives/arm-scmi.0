Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C039736F8F1
	for <arm-scmi@vger.kernel.org>; Tue, 14 Jul 2026 12:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784033924; cv=none; b=gzPZZ7h7V6hEhNGZfo85+utPh3Vn56QyMSedbckTcc2ZrBS9y1ifgixPn9leOk1p5FXvkZ3efsJXFqtfr9AKZDqjPolTyGpBdjnMaPU9Vk5tI3A8Ms0DEvd42WXB5Ssgaqozb6TJYI0jiUHSCaT3skg+tSFwbX4xFhq3BHmzvVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784033924; c=relaxed/simple;
	bh=n8O4iwR+jMn69dNCuheFsBeTm9gkjb0YWT6dU4uu1M0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fMIpJWz4C+OxMHMyzAxDh8dMsS75wGFfUkf2ESyriq8AzdYO59TeVZkh8s3X01Re5iXNMupM5ReRzcxrF803kfUkRF7Ezkb1mZnCkKvh2TXuEJBS65nyPpHWmNg/lv/FcUZ13MkhylAAeh2X3GX24ryaS0vuYgnoN4RsfLx3X4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Te6t8uf7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Te6t8uf7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22FFB1F00A3D;
	Tue, 14 Jul 2026 12:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784033923;
	bh=a2IwAg1Ivs0tNJenOGMkx5wL8OPqHxhsdFS8bHuFaN0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Te6t8uf7PC6T6N+S9KNECueljtlE72BKh9gfSOaWXZZdqTBUZq5hS4h8Iwb0aDYEV
	 j1A/Jd/cU1BB0LcBg4B7hs54MwxSjpXWVjc+qWgvOryKtZovvOzNFFUOwnxvUjLc+B
	 vIvZoXefLMOmMWsyMFhCE6rHgUZ/zFxqNQT0guhNnY2DCTVyP2znmPVbPHRPFpuL9m
	 Jf24KW9Gc4xjyzVkqhojyFmz6kX7ESmHzIoaaD206AKdBvU4fIylSZCTBd3rXtQhsR
	 N74aJrbB/QkfB+kA5UBEFzv1Swrr8HBwsFG06UzCaeUxHWZG8Jg+NryFnjQPAN3guR
	 mk9B97jD7zOuQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 14 Jul 2026 13:56:25 +0100
Subject: [PATCH v6 06/16] firmware: arm_scmi: Avoid IDR updates while
 cleaning channels
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-scmi_core_fixes-v6-6-3afe499d46e3@kernel.org>
References: <20260714-scmi_core_fixes-v6-0-3afe499d46e3@kernel.org>
In-Reply-To: <20260714-scmi_core_fixes-v6-0-3afe499d46e3@kernel.org>
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
index 6ee2152f6b01..d17559c897a9 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2885,7 +2885,7 @@ static int scmi_channels_setup(struct scmi_info *info)
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

