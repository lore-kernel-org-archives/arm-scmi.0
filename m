Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A4936C9C1
	for <arm-scmi@vger.kernel.org>; Wed,  1 Jul 2026 16:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924800; cv=none; b=nZLPLRKS6ye7CwzUYwOvNMbhwPQF+ZFQHERKXaOx8dOJlySd3WATJ3HkAXmbQeeNQr7bhesdD9jQjCiAUNWnm1+wsHQGkgM8p/DhJeTdhCIEmrdYWTsxenRO7rE46JOWTRvlTXK5YFRgFzviZi2o7fgDmQxrPElMNrYzpPWQdMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924800; c=relaxed/simple;
	bh=nKzC39pd0ReRtRrZgLa29tO35AO/j3ult14EKdAp+hI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZWmLbeuULUHNhjnz+X59ySQ5GNQY0KOoxqKYhNu/uh+IodEpjJSsWiV/YIyYiU9MVGqiFxviNVGoFR/GPrOXkvA9BEOFx2bJ7UOuWvPN6aJlb9oFVNuGR3EzXgfp3UMuD0M+2RW+sEAgSiYI/mC9S/7F9W+40GaXNeytLBlQvAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nUivfTGU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nUivfTGU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06FB71F000E9;
	Wed,  1 Jul 2026 16:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782924799;
	bh=/cSGQxcB2p2Gyuq3R/odzpGEXeoQPr+VuqI6gIHS/2M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=nUivfTGUboF6NUpuDFIuYdEaTJUOVukxZ757IaDOfO27N9G1WQlVtWlLKsLkM+U0I
	 j+spLyakyos4VT6bGUCGDR+wMeRA6t7lVTKdoEQmTd4pqSTgK1Xi8/VcXwxAKUvRer
	 ovhjFdWWcn7XtUXtIW0gviAF4a0PAF0RdC34gQ271Tk7ffK8HkMIizQ6XuyB27GM77
	 jXQWSr4LpEPRTQemBg2673rJSpqcNJXjrYIN1lBL9Zy8SH0KwopFeiRpumyI3gWs67
	 hHPzEkKxaGHOa1V7+jwtXKP++rh2QY0o58/9kslprWGpJNBs6rjc/LJuH2Czhb2j71
	 NK911/hXG4DuQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 01 Jul 2026 17:52:24 +0100
Subject: [PATCH v2 03/14] firmware: arm_scmi: Clean up channels on setup
 failure
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-scmi_core_fixes-v2-3-1f5e85553f73@kernel.org>
References: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
In-Reply-To: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

scmi_channels_setup() can fail after the common BASE channel or earlier
protocol channels have already been registered in the TX/RX IDRs.

Route this failure through the existing channel cleanup label so the
transport channels, transport devices and IDR state created before the
failure are released before the probe error path frees the SCMI instance
ID.

Fixes: 05a2801d8b90 ("firmware: arm_scmi: Use dedicated devices to initialize channels")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index b9ba566fc759..861087b2920e 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3262,7 +3262,7 @@ static int scmi_probe(struct platform_device *pdev)
 	ret = scmi_channels_setup(info);
 	if (ret) {
 		err_str = "failed to setup channels\n";
-		goto clear_ida;
+		goto clear_txrx_setup;
 	}
 
 	ret = bus_register_notifier(&scmi_bus_type, &info->bus_nb);
@@ -3377,7 +3377,6 @@ static int scmi_probe(struct platform_device *pdev)
 	bus_unregister_notifier(&scmi_bus_type, &info->bus_nb);
 clear_txrx_setup:
 	scmi_cleanup_txrx_channels(info);
-clear_ida:
 	ida_free(&scmi_id, info->id);
 
 out_err:

-- 
2.43.0

