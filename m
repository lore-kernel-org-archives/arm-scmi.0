Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FED7407CC7
	for <arm-scmi@vger.kernel.org>; Wed,  8 Jul 2026 09:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783501229; cv=none; b=ZZL6uJZWtFF3GG1mvag3xAianRYZ0qvoOb3hx7vN/o+BzUvsQy2zG4TNv2wmuBLL3py5Lnhw0d/lMyLQ1WG/Gdgcymip/H9Kn7epU3cfs+MSB5JVPrPkDEiqNf+viCftT5o6Ds3/wGlHKWH8oHz+z21dm4dS/t7/IwxvfoYLTMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783501229; c=relaxed/simple;
	bh=a3VaugnvhVHSK1ZQOrNZUM9rpF3QwKH61Dj7d8+dGrU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yr7Av8ZQmMSDNShieua37C6cS3B22R34b2Yor03BOVlK4f7uLansT9LodAUagd5rR/9DiDSpKfxqlqJUNVipTa+TLvgrMU7mfKBqiDXnx8qdZZVul+qwBHsSNlxAZlUnRfIKh8pYzTKM4y428Ch0oNxTIXkr4LZCoAc24/XzSMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Utkvgm4S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Utkvgm4S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660831F000E9;
	Wed,  8 Jul 2026 09:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783501228;
	bh=v3I1DWLH7zeKVOM/hYjiYR73bFir5/f89XictzBGoEY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Utkvgm4Sgc8y0FGkI3Koyu6NHDyzxage+Yy3Jhxd1U87YOtYBVv6R1azbym/4rSNg
	 XraHlxq1cXFXtMFvCSvjHs2MLlj/ejAuW7yJ/UKGIUUR+ZAexhx+gy9Fn1lttVtvvs
	 SyA12nG+wTbTLsJwdpwRxs6ewwKyzZ/6EJGrm5vHYHhkxEmkh+llB2ydGyEcW/Xpsd
	 Yezvnz+jWwX3AaD4ooDQBX/9SynPuyewv0Jjai0gF442D/EtJyKz0eNv9ABprZMo73
	 yBw06P1lAELqXFciH0qceT4H73jXn6U9b17TQwcQbGCBTr9ZJ4yBOK6OxoUcnNFrn1
	 CQ5YeYcyWjzTQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 08 Jul 2026 09:59:59 +0100
Subject: [PATCH v4 03/16] firmware: arm_scmi: Clean up channels on setup
 failure
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-scmi_core_fixes-v4-3-53142cd60b63@kernel.org>
References: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
In-Reply-To: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
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
 drivers/firmware/arm_scmi/driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 6f588840bf11..0a8a1d9de008 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3263,7 +3263,7 @@ static int scmi_probe(struct platform_device *pdev)
 	ret = scmi_channels_setup(info);
 	if (ret) {
 		err_str = "failed to setup channels\n";
-		goto clear_ida;
+		goto clear_txrx_setup;
 	}
 
 	ret = bus_register_notifier(&scmi_bus_type, &info->bus_nb);

-- 
2.43.0

