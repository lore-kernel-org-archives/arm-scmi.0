Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89C0481AB0
	for <arm-scmi@vger.kernel.org>; Wed, 23 Sep 2026 10:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158591; cv=none; b=kPdUdqq2F6tL67sDb3AFXzzS1gsaX3+mbW2QYsoT6mQ1EbylAKTLStY/hzYcwz+YUqzTR1aFPpE83NQ8LBPHqEM9VAoGeufNvc32QLw25y4U2f191UglmneQkuJd3mgmOzCc8mxe2PNybbo7czT4RdD4qLCcsRAXWutKTiaRFlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158591; c=relaxed/simple;
	bh=fyMWUODiBcciUoCdZf9LFxav5Wuofx1FF6LiKXsa5ic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o36+LVF2daZKLWIOxmqEzTQy938yqEDAXNfUkf9NQcr/9TQf+BUAsITykV1HlD4COfqojqbAt5qw0sy/3wYedsQHe+Lumlx3xWo4xECI6gzvayY+vF7Lq1tgp3+Jq5UemiKY+i39VrwY/zW1hu2zc+VYBcuqCuaED2AuvEd61jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NttLNaS2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NttLNaS2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B6461F00893;
	Wed, 23 Sep 2026 10:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790158577;
	bh=DKPvG4j9g8m9GZDieE5Fj9xDXaarMa/hUNDshw8h6f0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NttLNaS2Bb3oxUtafbYJ7ovFw1ULru9z+u2u19KgfjDIWVjjncAO1ab3Yzz3VXXiT
	 8klWFmjaZU0NGmQGtN4TqTxyWnRq0s+jbMF5obnOLNqrDj3pAZkszLvgPF3z/E+vS4
	 8IBPcEeYN9HsH1bqYGmdwUzOJagjtI02h3u7w78ppI3Q5vH807IBrB79S4biWZkcrP
	 YcZNUeyoxtjPXEcOeHq5MgkSUSrIRHqrI+tksnOKQCNXisVJ1BQ07bd8dg1Z0d4uJs
	 ZB4pRsuO65x4ISbIri6zXBjWnh1pkfrnHA/FMO3p1XQxDXotKhPtcKlOzVKYtynOA3
	 9b6OoMlxh5adw==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 2/2] pmdomain: arm_scmi: Propagate domain hierarchy setup failures
Date: Wed, 23 Sep 2026 11:16:08 +0100
Message-ID: <20260923101608.4180057-2-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923101608.4180057-1-sudeep.holla@kernel.org>
References: <20260923101608.4180057-1-sudeep.holla@kernel.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_genpd_add_child_ids() uses all-or-nothing semantics and reports an
error if any relationship cannot be established. The SCMI driver
currently only logs that error and completes probe, leaving domains
registered without their DT-described parent relationships.

Treat hierarchy setup failures as probe failures. Translate -ENOENT to
-EPROBE_DEFER so external parent providers can register first, remove the
onecell provider before unwinding domains, and publish driver data only
after hierarchy setup succeeds.

Fixes: fba9c703c184 ("pmdomain: arm_scmi: add support for domain hierarchies")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/pmdomain/arm/scmi_pm_domain.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
index 00192472f325..874ddb899f99 100644
--- a/drivers/pmdomain/arm/scmi_pm_domain.c
+++ b/drivers/pmdomain/arm/scmi_pm_domain.c
@@ -117,19 +117,24 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 	if (ret)
 		goto err_rm_genpds;
 
-	dev_set_drvdata(dev, scmi_pd_data);
-
 	/*
 	 * Parse (optional) power-domains-child-ids property to establish
 	 * parent-child relationships.
 	*/
 	ret = of_genpd_add_child_ids(np, scmi_pd_data);
-	if (ret < 0)
-		dev_err(dev, "Failed to add child domain hierarchy: %d\n", ret);
+	if (ret < 0) {
+		ret = dev_err_probe(dev, ret == -ENOENT ? -EPROBE_DEFER : ret,
+				    "failed to add child domain hierarchy\n");
+		goto err_del_provider;
+	}
+
+	dev_set_drvdata(dev, scmi_pd_data);
 
 	dev_info(dev, "Initialized %d power domains", num_domains);
 
 	return 0;
+err_del_provider:
+	of_genpd_del_provider(np);
 err_rm_genpds:
 	for (i = num_domains - 1; i >= 0; i--) {
 		if (!domains[i])
-- 
2.43.0

