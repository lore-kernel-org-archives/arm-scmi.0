Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835853195F5
	for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 00:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773188393; cv=none; b=e7/1z3pHe6mEXPALWbf8FzPCrhrufthqBCRWKi5lL67/RWTZnBBrzgH+foIH4Fh6rMXgUL6QObKpqFVEMeiMd4SCJXPRs1+HU5kG2Lpm0uHysD8TJf1mgq8BYRMRVoV4i/5T6ll/pf+YQFM2+Vwszr4gvE2bk19LmWZ6bf4cA9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773188393; c=relaxed/simple;
	bh=SpNaRu6uMd8HuXBGwkIHZTjCWaD47krsvCZKz8R9UDw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k9fBR3r524KxVs0By01ILCqRW/9i/KJ6PCwZlhCql8w2iaxXwInRXWeY2HATnCheGKIFZoeBrx0GlBctw6L2C7pXIaXeliguC1lhoEuRMG67fIXYmm5l34sfCSlStSCWgWaYfE2Y7U7RGGqrsDNDrIl1ZZy/Ah699rXWvEXFgbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nUMjab5q; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nUMjab5q"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c737d3a51bdso2777860a12.3
        for <arm-scmi@vger.kernel.org>; Tue, 10 Mar 2026 17:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773188391; x=1773793191; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G4UkaIVkjTxZ19xGJc/X7b8NyYsvb0FdSydtov7Zv/8=;
        b=nUMjab5qVm2UpxcrlYiA6CoXy6V2OUkR9Ktb0a6gCUH+mnF+pEaKo8prno5x4vm2ot
         vXL85vbxG7lhtRPQgWFFreLDhdugyCkqXHRnst35im5t0fTFjdrWVQH19/wUZ3FIYoTw
         nxx1CZ4cI3V4Ci8UPawPVGcrF/Qj4yYvkQWR0vmHIxTjzBYqlvfM2eHjEtcvF1Y70SAz
         mAKyXpNUwZJEsqR6Sbxf76zwe6WFKkA8novm5Hkz8Pb8rduETLa4A73ZhV2thRihFnQO
         J8c74+SiF2dGv6//JJ3XGIYTi82JGU5jHTeqjjFqrYtr4GR8OI4iLM497COWkTmUtuU3
         Q/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773188391; x=1773793191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G4UkaIVkjTxZ19xGJc/X7b8NyYsvb0FdSydtov7Zv/8=;
        b=LS1qWY8tA4EDjFhK2FTsyIcXSh09aP1QPxkNt7mzSORIuaQPaylQSNNF/3z1QLpct0
         91aMyroHILrQi18CPW1c36f1lXc29zgBtI5kDXOxy+XBBT7rRTMWE0lHNtjxGXBR3fJJ
         lpTZoIm4ESdQZrvWhbKsHZaCwqp3KrDX9IGdhtPXN4VUjYLJn/+Llc2YGhGl7XvQvb+c
         680beG4ykmQaODzR6uhSzvIXsbr7JjwqSPShxRIh1q0qcGZjI6kum/hIbwQ5vhrDMC+u
         JUabiQBLPaCed8/425dTldSrpi1WmdwkWmyYauy3bgYNJI9xVYEDexHcuvL347DO/916
         0oEQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+3jgXW85ZukrfeXWa509jVo01y85qVoXTu9swtFkW/hbZ3M8r6pprd+j6Iu/A3enuXTCSIDDi1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJylu8sgQk1Z/rv65q4UM7yfEeyqXkWd3MgrhtpjEh39HP0q4x
	sAnPMaoUuZRIUVN1/J0TIEvwW/33OB/L51JP0iIjAFYJzbAGobNwXguxMxtx1SRPr3w=
X-Gm-Gg: ATEYQzxQGGiiGuoGuqxPDFHa/aw0B/eOlKhfJgzl+gl3/Lbc09+NJKTNlPsEUkKfy18
	FfzwSzG3DF8w/dEfBJcnCYrKGG3L/73tqPuq0qFNTxKMUhOKWOxfy8ftMQ+xtIHtMTIPX2xqu0B
	DN4MWu+svnhHolF7FCT1ft214kxgqyiSnpJumhtkUfIttTiMig5A41xRxYZsJiOw/Zm82FUqdZe
	/Er89/E5GQrBoTp8Xy6G+bB4Vwnydfry0u/BvS5l6G/ssRLggVFiwB4OuNSDaYsn+AhlE04oEXP
	WAMPXJ98zAO/ZBmY535EkclX6tTEgONLY3uQ/JMkEcgLI8o5ICElQP5Q2cbKfWoMcZ1ABaUSxLb
	lp2febi03RPnD1M0tdSf2s9JqKvbHVniZp3oLC1ZGo5HPPyrADm7pk1X43S8MHvxpf252hVx5+v
	NWZr54faT3dvAzROnlfbBqSsxICH672jQ=
X-Received: by 2002:a17:902:e5cf:b0:2ae:512b:eea9 with SMTP id d9443c01a7336-2aeae8932a2mr6152945ad.36.1773188390908;
        Tue, 10 Mar 2026 17:19:50 -0700 (PDT)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae222ec3sm4843865ad.1.2026.03.10.17.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 17:19:50 -0700 (PDT)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
Date: Tue, 10 Mar 2026 17:19:25 -0700
Subject: [PATCH 3/3] pmdomain: arm_scmi: add support for domain hierarchies
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-topic-lpm-pmdomain-child-ids-v1-3-5361687a18ff@baylibre.com>
References: <20260310-topic-lpm-pmdomain-child-ids-v1-0-5361687a18ff@baylibre.com>
In-Reply-To: <20260310-topic-lpm-pmdomain-child-ids-v1-0-5361687a18ff@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev-53144
X-Developer-Signature: v=1; a=openpgp-sha256; l=1610; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=SpNaRu6uMd8HuXBGwkIHZTjCWaD47krsvCZKz8R9UDw=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBpsLUiDjI6WNZvQ23csmjtCDm2sG6My9oxiWgsj
 jofXq40XHKJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCabC1IgAKCRBZNxia0/vG
 ZQFQEACPB90DS6xyqHEHKzUMOrtuYJlGewKdEEMh/l5LQXY41rYLvJsbqdV5LCx66GdglEiD4NP
 6jeDqaJIiZpGIJbxgDgw8y8w6vwseR+NoC8YtF/UTEhOrwYCzp0xxdI9oo/WwIr+Z2zd0EBnVr+
 y8grEV9ktvw4lR6g1KIMnvqIw3kgbMkn4FwM4Oi5xfzdEvH6SB2E6A0ayo8TA4pNym6k8XEgNgD
 uJr8d1plI43iOLDyHoQXaRjzp2Hf+zqNtMDKQL2H6McB1m08HIeuxUU21z3xIci4gF4y0XXROJX
 fHsBHaeAECe8YOGRatDhLklxJqTGyerbGv8F6nNqa1fCsyBy3lX9GjMhcUsrKln1ODUbvCTQKR0
 aahV1rNojPIrZvK4RyS0Uxb79RJ9vDjDnggMs0e1EyE2oFG6moVl1tzla968Q5o28bk6jP1hrDH
 kKq64Jd+N7nZzEgls8sh9PnSajocfYaDG0ae1zxUTRND2nx4aWfRgACm8mC/PiWfdmz4RbQRAK6
 jmRP69B4LbXGNZ9uhBO3Lvcta53D1eCazu6HrlkDwYozWWJyLZmchRhLHkpHu1Q8VSOL8MS91Jo
 x9K50uoHLg8IkriC+0sLR6QTRfqAlIknTnzIVpYRj40VFQvP69cRTE3zxdR9UZPVLIvsGs3QVT8
 93oWglDypvxbtHg==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665

After primary SCMI pmdomain is created, use new of_genpd helper which
checks for child domain mappings defined in power-domains-child-ids.

Also remove any child domain mappings when SCMI domain is removed.

Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
---
 drivers/pmdomain/arm/scmi_pm_domain.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
index b5e2ffd5ea64..9d8faef44aa9 100644
--- a/drivers/pmdomain/arm/scmi_pm_domain.c
+++ b/drivers/pmdomain/arm/scmi_pm_domain.c
@@ -114,6 +114,14 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 
 	dev_set_drvdata(dev, scmi_pd_data);
 
+	/*
+	 * Parse (optional) power-domains-child-ids property to
+	 * establish parent-child relationships
+	 */
+	ret = of_genpd_add_child_ids(np, scmi_pd_data);
+	if (ret < 0 && ret != -ENOENT)
+		pr_err("Failed to parse power-domains-child-ids for %pOF: %d\n", np, ret);
+
 	return 0;
 err_rm_genpds:
 	for (i = num_domains - 1; i >= 0; i--)
@@ -129,9 +137,13 @@ static void scmi_pm_domain_remove(struct scmi_device *sdev)
 	struct device *dev = &sdev->dev;
 	struct device_node *np = dev->of_node;
 
+	scmi_pd_data = dev_get_drvdata(dev);
+
+	/* Remove any parent-child relationships established at probe time */
+	of_genpd_remove_child_ids(np, scmi_pd_data);
+
 	of_genpd_del_provider(np);
 
-	scmi_pd_data = dev_get_drvdata(dev);
 	for (i = 0; i < scmi_pd_data->num_domains; i++) {
 		if (!scmi_pd_data->domains[i])
 			continue;

-- 
2.51.0

