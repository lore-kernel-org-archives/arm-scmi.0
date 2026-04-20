Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD953B4EB5
	for <arm-scmi@vger.kernel.org>; Mon, 20 Apr 2026 23:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776729088; cv=none; b=nk9YT+X4mbjUmK94fx9cQvCGrsul0/IEgjgPuNSsAOYXnYbsbGjX8GFQ6ilbajZLEaLUGwxITKChRDaT3NC95MHxJBo2cDX1T/E2qQZ7mH7SWu+Cc7h1/nF9lX3qaIYw2/ow85904sOpPDLG/fUoUn6Fdw9KSaq/j/KJPSs+7AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776729088; c=relaxed/simple;
	bh=fQmK2/l/owONuV/KAsTohuLBlI/zxOSPwI6yoI7yexU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HctYKGymMi+3yBN3ex4PhU1L7jw0dktjP0dUFZN/+Af01HEfhab7wZAdrC6ZWAYd1vFMWtjQi50PE2agv/R5fqy/YfZE1IJrxPLffDVaKp9gUPmwq5rBU9TqO4vE1w1CVarIpAXh9tSz5U9VnkcJePn//AHaZSN5DKShYL/8I8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=oIw5RRyu; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="oIw5RRyu"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35fc0d7c310so2512759a91.1
        for <arm-scmi@vger.kernel.org>; Mon, 20 Apr 2026 16:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776729086; x=1777333886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLT3tpSwkvQ2Tt/V/NMhLxE2z8Vhzn3uRFvBt+UOKAM=;
        b=oIw5RRyuQCGzQNvGXnbBTnSR4HL5DoHvlTEVVDqWJBOJPRr6hAEbzeqkF96o5rEkmj
         g2x99e7pVYTnNDMuU7xd6hoM4+qujmxg45AXPHGX3TpwG7QoOoqrs7/bbZZ7BPDIOgvE
         7b1up6Ab2izgt5ZEVxQXLoVEaTcCdK170kT/drfopfqUlmwBwSw8Fv89n7p+ZGy4ZggP
         ViT1RS9XgKgPTnhKkr6eQTJFO7lwkMGQzNaKevNwraaVxIOs06H5mPbz6+HVEtNBnXw2
         hoKs2qHm0BRrKEhasNlBDmTkNYX32EPOanRIpByz9IRWE6yPlmyFKmwOjoLVTB8aggWs
         60mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776729086; x=1777333886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qLT3tpSwkvQ2Tt/V/NMhLxE2z8Vhzn3uRFvBt+UOKAM=;
        b=DwHo9raJa6LwMv2FA28ysY6kcgIUuSQGvHtIAlHs80aN+y+GpBOb2K9N9pBEavP+3x
         TKd4ZA09VzX/X7ejZ+SVD9XKobeQUlvc7L2nTKeW70GnLKSkGqPCC0B4FYQFXnzHy5s9
         Ci4geQMBMLMHV7D6blw/f9ww0k5wAXmaqlEHmuRhtgx6Moy0j9UVuVjvZWkZqtHadLs8
         5VXhJYnS/b8aaRS9vaaZ48WCMTY2xiOfXKRMgB1h1yWIk8Ls2Hwa6aP4pZ3qRrV+0i9t
         4IW5aPPVNDzulLEpr2FoXBoZho5ZtA8FpYaRkzu622HvLABVgxx29z88SZIvwrBkPjLR
         hWCA==
X-Forwarded-Encrypted: i=1; AFNElJ81yVCmT86U9t+w0UZMK2xh5M23d7O0qHOVHvRcl9cfQ7wS6n+RcAOJMveKh4L5G7r6BBYAOW0x4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnTOrpu8yEPRcXJzi1wzSS390hTTa6P9sjut1jj5x0e4dT+avE
	Mtul0+GQD3iPTbcV3RvqvH2IC8odY8tcxrggVg3NG6Dntu51tDI+XpXZ6NfoxJp32eE=
X-Gm-Gg: AeBDieslcn5hw6HXurRGA8ni115l3UjVZcNyAeUU8UOoHtTTy7CKzyIG6ts1xl9Y+m4
	MjwNAn+vAySOOxqrHXYyTKtVrJ8uEgH+KvVPoG5xRbfuSrZI3G+BkQg7/3qOglobxyMtlUry0Bu
	U4mc5JWaW15EYI2MZs7tI+mtj19WQccipiSw6KDS9BXPnEpCLHAGxPu9Ahn8Uem1MAFhVn+TROw
	xETCLXCZA+BtFJXF+bsWSuvsuE/EwZ1xJOChSZyc3OfwRVXJNKolNoBzUd1E4jQyckrga5SioWW
	y6ntLCNjVnbfF6UlDt+OBUouz4JDJ5RmXiG7JNZX2f4BHxv/Ypm16/TsVuI+q+5VeIqQwB8Zi2A
	4PUu3A+Aav9LZoC6B6mSo6xO9Zz3Ys7TGqeZQMG7A8tG18TJACDx6Fh8RpCUlWoVRF6OsaG2zh3
	YM/Kub32F0Z4KhyqHP9Gb8Z4MJUtD1wQ==
X-Received: by 2002:a17:90b:1804:b0:359:83d3:27d3 with SMTP id 98e67ed59e1d1-361403c326fmr16049310a91.2.1776729086216;
        Mon, 20 Apr 2026 16:51:26 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36141898ebasm11819562a91.7.2026.04.20.16.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 16:51:25 -0700 (PDT)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
Date: Mon, 20 Apr 2026 16:51:19 -0700
Subject: [PATCH v3 3/3] pmdomain: arm_scmi: add support for domain
 hierarchies
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-topic-lpm-pmdomain-child-ids-v3-3-c2c40bef238c@baylibre.com>
References: <20260420-topic-lpm-pmdomain-child-ids-v3-0-c2c40bef238c@baylibre.com>
In-Reply-To: <20260420-topic-lpm-pmdomain-child-ids-v3-0-c2c40bef238c@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1582; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=fQmK2/l/owONuV/KAsTohuLBlI/zxOSPwI6yoI7yexU=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBp5rv6y2OemQ05EvI6I9Eb7ji7vCtT8ygEexN59
 biCxvg2gTSJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCaea7+gAKCRBZNxia0/vG
 ZWyAD/0d0/YBQizqrbUviBkwWp3DBYDrtv2ykMygkKlK5l5L3sb28ibT5WnM8ZKqh+t0KUia/iZ
 z1ZHFEHYVTHi9u+NXT0H10ur1LRQnWGt5fziPeyxaezbBY4YrI/MerMp3WyJ9xuVPRWOA1hbbii
 HvTXoszaQQsEngTIMXMz4v/+a9W8NcOWYD3awqyH1Dbr8aSno7skX2VyScGvFIBeCHo4PMfqx3f
 rYbFgy28uknIGuOkg/CWTwjojLRtghphUiE9bfW2083x15l6bhlcvg4eTAFL/IkzQmd/pUPLzKD
 Ww8WkE+0rrAvtEh0o/UMFr89T19zGcyPaCKJXBSa+7AhimyFta28Iz7x1mInWwrkSSv7rwQDxi5
 K70tevOBPa/T5RgkyteJfwHSKMTpUsi3qz5YYV41r0+VFVzBuklBnQmgVAgDpA3sAhBiVM8zPgo
 dDLB094XaZa/Zr8ZtRa5EauOf+LM04uLX648SRJMw1HgO0E4qYU5qiW1axHnL+aQb9j63RHEoZP
 zgzU71AQBfc+RsWUukD2frkeinl9TgSa7UgMVrb4fjd9t6AH1K0NDThwQUdogfzqM5wHV+uUbya
 ImAuPuowMRCnwI57qIk42BJJJk7hBurgdH9Q9kP0yP0yj+37ivwb/NruZSiW/vU0XrsFBVln7C6
 HLUBmgLhKNszwiw==
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
index b5e2ffd5ea64..66dcf2e687a8 100644
--- a/drivers/pmdomain/arm/scmi_pm_domain.c
+++ b/drivers/pmdomain/arm/scmi_pm_domain.c
@@ -114,6 +114,14 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 
 	dev_set_drvdata(dev, scmi_pd_data);
 
+	/*
+	 * Parse (optional) power-domains-child-ids property to
+	 * establish parent-child relationships
+	 */
+	ret = of_genpd_add_child_ids(np, scmi_pd_data);
+	if (ret < 0)
+		dev_err(dev, "Failed to add child domain hierarchy: %d\n", ret);
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

