Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FF64854E7
	for <arm-scmi@vger.kernel.org>; Wed, 23 Sep 2026 10:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158591; cv=none; b=KuCPGJzwCMwHGic0Nx6M+OyD/2qrOpJwRnAfDivlH3mCscYcrUOXzo98f5o9FXrwNWKMyaPMhaWY0eoH+iDHzg7PoHgXGLhxwMCkfcr/FK9vngZc9yHctX4ooWe18g74Vz6VhSae9RHslgua4dBBwxY/A27u2gR+oQu92LTHvJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158591; c=relaxed/simple;
	bh=shys0CFFyp2K3lanIpVVvyv+Th40FAIdkiAkDtx+TWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VRdPU9JyafiExbjUgKbQE8f2ndgXVmaNwXSd5PqQCy7+RYA8GkLAa3/bH3ronAlx9LMEMiwbFBBBMsq1bdwqL33W78TOJZdQWcRKaN+Ny3vjzJg3qf3NuXlDaZj+yTIvD4ja794lCdCA3rssewh7gUA+8BKN+EE2ybaEF0LDxR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OY6fg15W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OY6fg15W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B68221F000FF;
	Wed, 23 Sep 2026 10:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790158575;
	bh=PAEuUmyEz04MVxzmf/WiadKVMc5DZFmvN02XDvvpgEQ=;
	h=From:To:Cc:Subject:Date;
	b=OY6fg15WKZvabGADy6BLAjc4dWtTpXkC6NPxm49EJwOL92z8IwQnVrGaKUtpj/shZ
	 M6b8W3RPV+ZAplVh17q1zJ/hCvztRnyGog+ek5rxq+OwY+5QNCO1H56D59PPxG4E5o
	 29odcAlOSpAv2Qcgtn650tY8rOpySiPcc0hVtvH788X8sPtQBmehKUzjAGPjZI9nh7
	 ep0256BS45ir2jokbGBTaopF4XQwhuZrmjXnYuy5CiUv6z7qm1GChjUzmBv7iXcyzi
	 tPPJeqVH25UyMm6ZLzaCyAtWBh80e1bT4nCxakXb0kz+T/E8yfvSlceBKjP7qTmnQT
	 A0GJrOQpYuWOA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/2] pmdomain: arm_scmi: Skip domains that fail initialization
Date: Wed, 23 Sep 2026 11:16:07 +0100
Message-ID: <20260923101608.4180057-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_genpd_init() can fail while allocating generic power-domain state.
The SCMI driver ignores that error and stores the partially initialized
domain in the onecell array. Provider registration then fails because that
domain was never added to the global genpd list.

Preserve support for partially available SCMI power domains. Log the
failure and leave the corresponding onecell entry NULL so the other
initialized domains remain available. Explicitly skip empty slots when
unwinding provider registration failures.

Fixes: 898216c97ed2 ("firmware: arm_scmi: add device power domain support using genpd")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/pmdomain/arm/scmi_pm_domain.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
index 3d73aef21d2f..00192472f325 100644
--- a/drivers/pmdomain/arm/scmi_pm_domain.c
+++ b/drivers/pmdomain/arm/scmi_pm_domain.c
@@ -99,8 +99,13 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 		scmi_pd->genpd.power_on = scmi_pd_power_on;
 		scmi_pd->genpd.flags = GENPD_FLAG_ACTIVE_WAKEUP;
 
-		pm_genpd_init(&scmi_pd->genpd, NULL,
-			      state == SCMI_POWER_STATE_GENERIC_OFF);
+		ret = pm_genpd_init(&scmi_pd->genpd, NULL,
+				    state == SCMI_POWER_STATE_GENERIC_OFF);
+		if (ret) {
+			dev_warn(dev, "failed to initialize domain %d: %d\n",
+				 i, ret);
+			continue;
+		}
 
 		domains[i] = &scmi_pd->genpd;
 	}
@@ -126,8 +131,11 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 
 	return 0;
 err_rm_genpds:
-	for (i = num_domains - 1; i >= 0; i--)
+	for (i = num_domains - 1; i >= 0; i--) {
+		if (!domains[i])
+			continue;
 		pm_genpd_remove(domains[i]);
+	}
 
 	return ret;
 }
-- 
2.43.0

