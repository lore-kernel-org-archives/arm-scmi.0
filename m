Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A043624B2
	for <arm-scmi@vger.kernel.org>; Fri, 23 Jan 2026 01:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769130859; cv=none; b=C+ufnZU1/e+iKBxS/P0GJtWsiweVaVheLdEHyXx938G6lM/2CQTronN8ZLlexSIGi3CAD9kOauyh+Pnu3SVatJO5uZsWl6YcYEaJXRGTCev+LTG4OUvJ9qXC950cmMa5L+VNMqBtFb+JJAw7+CWVZZO3OrEDEWx/mNXNSr+tvR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769130859; c=relaxed/simple;
	bh=He+aEhwIQiKMM6RZOhPxZk8LJB9l4Qy9dfY/jCduGYY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XouhCQNF68UB9nkLuxU2JrR/7pfhV4c5nUadXjUynK6h8rtxKtPlDPSKGG0nW5NZoGjTC8lCXQ8+/dsT6JtT1u3cWX/1xcDgrIGxDCtcyAJ6NiZTJ65mqj8W7dbZCMo8IT56j1rJkIJIfXui6w7LP+drnauU+NPF0/141oToRBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=DoEGKZFv; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="DoEGKZFv"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3530e7b3dc2so1606539a91.3
        for <arm-scmi@vger.kernel.org>; Thu, 22 Jan 2026 17:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769130849; x=1769735649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8jIXagkMxzEowZbGtgfSPfOl3cdbEam+H5UuhcUy8Cw=;
        b=DoEGKZFvU1sCuSVeI1f1e651/D0ocFTgNTL2Dilm3MHgUzCUfORahQVeKnfWxgjdFQ
         n9Wb4F67rIbUSZkyvJj2NkNMdlvaN25uPe5aVqxqNAqr1hgQHWxERpx+LLiXs0+E+E33
         Rl9N2S1srNOokfQhCL+Dufy/7WxokvumGa8BZaJjT/bEfjxee2XpJzEw1hM19RcM2b0+
         JAO35qQG0Z1cpH9nmuTlBLv6+j91GUMRq1xv5sn24wHxJLu+uf7Dz37SiYnhGmEDNDYV
         kYrAU8GxXfVlB6fZlOonMKFX+zyU14SbnRgqXrq8tuyaRKugAPO6eaQCtZPAgsTS7ehS
         HStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769130849; x=1769735649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8jIXagkMxzEowZbGtgfSPfOl3cdbEam+H5UuhcUy8Cw=;
        b=GNYe5f/160P2sRfrsqeq3VVNaJtAv79tZTp6zJmWDJxglfjOV1NnTDpvXuGr6Utv6w
         zj4mb9ywHlFEmZEiRx+c2tRmMQPfMDBujN1U/+ldVX+WgHTx1Nl4gtDicqMAQDe26kDL
         oopIUw7BqUjGiw99K+yjZveKj7kJLWMa8e7FORLdN5a8mlRl5ehmdO4LAiEy8zSwk+XU
         L9YCAcbwlnCFKUFfMiQ9ukuoZgYQwjkxF+pihmo5hCi7Y3SzQUQBBirrtOtdeE6D5hPM
         uSo/oDUA8sK0YSWRdFMuM+318FVfZR20Hq3JB119v09LNW6oY0J1PEMbkTEh/bck/3Xv
         ZmbQ==
X-Forwarded-Encrypted: i=1; AJvYcCV57TyBXUmwNgU5ZhwYRxvSJ1giXNFAiKJLkS6IGMHV0uGoPaobSPzQG56Dfo+cYf+nq56wLFvAZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5/SLUXj3wbuHSfL0zf0pnfzyY/VepMclV1p7LVmnuas0dYqr9
	/aXgRxKV9TUTbGHZT7E3CvOCN2Ze23JMsM4Npk8EOEworTpYoxy3dALC7G5hbu9t1bw=
X-Gm-Gg: AZuq6aJSVRmCGZTDRrRUP4OMw8e0yfZvlaBvXmQy9RZfVLB1CjPSXLPmMEMvUmPdh6I
	ptfzlspbi1B6awk8MCRL5ffIcH6tQI47Hkidy3kASGF83wLore2gw13dNz5SypAbamut9uEENHj
	hIXERHNDG7N5PYm1ExS3IkCH2GD4BOOkSaNOOuSK1aktRrEmfyUFNCjjkA0UODJXK1mhgHqze/K
	euaHHNLLFBDAVSjgo8cLvR3doGKbud15AqtiGYfwK93b1s/UMuJjE2/Qy3sDUMeXEEj7QaQUxtx
	N4WDSlt93hdLY8DTiLD9bOICy/zBY/4sbWpVmaggqjV3D4685mvK7M8Mbx1cTga9vYBF/nDUHAs
	0rRO3hpveP7ds7MmGBZerb+mPLGUoeOAaNuvyksRrdcIgGbW7mkVT4c8C0dIqMCixgDrUkRaI0q
	hlCfc3wrkl
X-Received: by 2002:a17:90b:3a90:b0:32d:a0f7:fa19 with SMTP id 98e67ed59e1d1-3536894c5e5mr1159857a91.17.1769130849520;
        Thu, 22 Jan 2026 17:14:09 -0800 (PST)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35335205a2fsm3478280a91.2.2026.01.22.17.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 17:14:08 -0800 (PST)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
Date: Thu, 22 Jan 2026 17:14:01 -0800
Subject: [PATCH RFC v5 2/2] pmdomain: arm_scmi: add support for domain
 hierarchies
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-pmdomain-hierarchy-onecell-v5-2-76855ec856bd@baylibre.com>
References: <20260122-pmdomain-hierarchy-onecell-v5-0-76855ec856bd@baylibre.com>
In-Reply-To: <20260122-pmdomain-hierarchy-onecell-v5-0-76855ec856bd@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1346; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=He+aEhwIQiKMM6RZOhPxZk8LJB9l4Qy9dfY/jCduGYY=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBpcstetXh6fJOBD4eHHjr+saQFKxgmd6v0zRhkf
 ug0omaqIIqJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCaXLLXgAKCRBZNxia0/vG
 ZQIgD/4i6Uc4w60OsIRYYqeP8oLa2eb6CzQU8aLVsNoiDPuv5uZnYUTHquh3eLM04pOyjyL938g
 jEvUGJVhqeiMw8clJVY3pP85aE6pIqEHRh4MtNLdHFbzeMVmk7jLxOO37wW3lO6HjPj/fOKkVlj
 0hZ+eWyeo0DaLjAv20+LezZ47MUqkgRenx1FTRbkul4dY7+EvEunrgq0CW4xeSz1erh3GKCMjp3
 xhUoU0zK7IaVczg3aPfyJcNVWM2CYMxpogkEQrN9GY8tVpRRQ8k4GdjZ3y1FDHnIUCQ/XH1c4Hn
 Ep2a0POgfv0x+p444bxRdhFrasXjYcab98iS7YT90j4ONuBxfpBeQwoJRKmmpCAZodwhQMjTfsb
 NKLq/J6fZDebRb0SJvJFqq80Sa7lb6XMZpOa/jgC3vL49YUrfcv9HEUyyxyb1s+d+usdDq/F6oy
 4TeuublXmf/HOY/u/Rc9CgQoBGjNuE4vNZJrf7i+JN0snIoHtb3es1oe4QsQF0MwYQra7G4dbAA
 0pyJeB/CjLJ41MmMcQ/FlF7CYfFxLOCKv+4AUnzrBBdQj3A+xjQbMEkxeAMsOmFGA/S1AMLN1hQ
 w3BjZGZkqJ/HIcunTq8hG0EZiT2dbl6rSz9o0Hn6GIpNKMvsRCHHaNDewPA7Lwu3+Q0MDXbzeMq
 yGl7x/R9Wppf8Pg==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665

After primary SCMI pmdomain is created, use new of_genpd helper to
check if there are any child domain mappings defined by
power-domain-map, and create domain hierarchy.  Also remove any child
domain mappings when SCMI domain is removed.

Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
---
 drivers/pmdomain/arm/scmi_pm_domain.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
index b5e2ffd5ea64..a52387c45d88 100644
--- a/drivers/pmdomain/arm/scmi_pm_domain.c
+++ b/drivers/pmdomain/arm/scmi_pm_domain.c
@@ -114,8 +114,12 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 
 	dev_set_drvdata(dev, scmi_pd_data);
 
+	/* check for (optional) subdomain mapping with power-domain-map */
+	of_genpd_add_subdomain_map(np, scmi_pd_data);
+
 	return 0;
 err_rm_genpds:
+	of_genpd_remove_subdomain_map(np, scmi_pd_data);
 	for (i = num_domains - 1; i >= 0; i--)
 		pm_genpd_remove(domains[i]);
 
@@ -132,6 +136,7 @@ static void scmi_pm_domain_remove(struct scmi_device *sdev)
 	of_genpd_del_provider(np);
 
 	scmi_pd_data = dev_get_drvdata(dev);
+	of_genpd_remove_subdomain_map(np, scmi_pd_data);
 	for (i = 0; i < scmi_pd_data->num_domains; i++) {
 		if (!scmi_pd_data->domains[i])
 			continue;

-- 
2.51.0

