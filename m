Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239621;
	b=4u6kIhmFizLIl+Q7/JRYoGsiaPKY++DQhFdZoDOv1ydc9HLsR/WjlUECQmEXY4sD8RnB
	 Qrbi3+IOUsGCSYaLSrnli0juSyxZBbqNPyNHeiTfGVOitFpR3+v6LJXolIZsHs4eRtKOD
	 SanQqbmksE+vJJewZtKZz+HI/5wkZ1+1tnhhhcIzZFTfml1sNO8PIp/qwePgQsAFSRDfT
	 77204i1ow3h7weuLSRehuQos9+nLU56pn2/+XI4tAjGvygrTNEkQRX2h6dl2u+A3jycwC
	 SkK+YBZ2vnpvE45+02Zn5ARb053n4nHlXZOudcQwz4uPrVg2jZT+SVSQzwOKgwG7okQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239621;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=wsjaeM57Ntxk78dpU682yS1x8SI1hDiUKBvNjgTutVo=;
	b=I1xaYRkphlfmljxFrcFXYWrWU/uVpDLvZpbVL+ZsC3eW6Zh34ldwtjFif2kB+cZrdL5t
	 pOieyYoUnK4T3u85iqqAKwBsXoiJR7t13dmwG2t8C5zd9skE17RMh4yqmSbJHOupIJZMy
	 CQUbYIWBiBMh7309vuRX6pBh5NG8xH/bNbjgN0fx5eALhXH6I1xldkem2EwUkOjibMhhW
	 bQFHTDxTpP+ZvM1M50yhjT+G0dsuIbH8sBF6wQZFlw83VzCcn+eq3X//eIlCYKHSjWh8E
	 x381bhqF7KI1oQiZD8GVNarMwNrp4myL8agNxnjPbwU/IWqHPMPjXKD8clHylPNMLlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="NDiI/qzD";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AB5606A32A
	for <arm-scmi@vger.kernel.org>; Mon,  9 Nov 2026 15:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NDiI/qzD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88BDE1F008A1;
	Mon,  9 Nov 2026 15:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794239620;
	bh=wsjaeM57Ntxk78dpU682yS1x8SI1hDiUKBvNjgTutVo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NDiI/qzDlLVjCdvIMoVKxF82J12AbX/CSv0TzrRyu2Mu/SLpzXq4/ErnpV4iMk4Km
	 rOmO6+kKqbEuo2mkj59A79jp/rd5bfonVcJZhPlUkTwUZSY31myeBoqNWYttuU5iXQ
	 7ojma7AjIZpGbQqh6I9M3h4YEatXmQOGWSpYY1plWsoLTf1vgBoW+Ql1Q1X2nnOZjH
	 X5O8Yv+VnaGjCSvMq2QDcy7Fj6E8NwYgpY72VQcYwusOwKBxog7fM1Je0YNKXBWaQV
	 CUZBoZVWfHpiLoEPQiaGL76wxJxuL+XmC3xIOThnuI59c+rlPy6FVx+FaGqbNNQpG6
	 ITW2mGc27L9ow==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Subject: [PATCH RESEND 2/2] pmdomain: arm_scmi: Propagate domain hierarchy setup failures
Date: Mon,  9 Nov 2026 15:53:32 +0000
Message-ID: <20261109155332.1686594-2-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109155332.1686594-1-sudeep.holla@kernel.org>
References: <20261109155332.1686594-1-sudeep.holla@kernel.org>
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
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
index b95b24470ba5..95857bebc444 100644
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

