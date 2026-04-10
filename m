Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00548389444
	for <arm-scmi@vger.kernel.org>; Fri, 10 Apr 2026 23:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775864694; cv=none; b=ZRQKeMHEfcHwByXCKUzxqmcjU5RDYa3KxQl+oWWKRxcmNZY+2Q2zntReRxD+RE0wm/CGwEqRbruegH4deEWtjgIUhWN5XuBEBYukxGfDArrP+rhl50YRmD/kWzgjDlJH06AKIWxFKZ/Rf4PNitVbRgKpZFIKF74MiRdHNGkSfTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775864694; c=relaxed/simple;
	bh=Q7DrslDoEzNPakyLJFXorxvjgyPUA3DGKqDVH51Yzcc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RzDI6Mt80cdEYmhp8Ybe0XtdV9Hun4H1P/TMMrwtJKwKh4LXgyxPDBeu4VUKcPqHwsZRqY5hurrk+NO4ePCFpBLOu+A7cyo5jTRnyie1PpSSv+IQo1Pg+ekMZV1GiZO8O3wRxydnwBcNET6teKRTSZo1MpmEZXbG5r47dhjtfBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=gnKdVaRk; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="gnKdVaRk"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-827270d50d4so2422942b3a.3
        for <arm-scmi@vger.kernel.org>; Fri, 10 Apr 2026 16:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775864692; x=1776469492; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8R1cxPctftOG89u1iC1smvABtKfPmxn/YCB26kmM4dc=;
        b=gnKdVaRkjAWGEHYXxs0clbo1wFG0G+VV+Whv3UemtpB6zL984GjYbwzA8/SyJPHNSp
         fLMvlluqsFn4cNTUoyTsVEv3fiZJorus+G9RDEU4nxulErwfNyc/RfCEpaaSN+ALcD/c
         ewP7R6fM8qyDr/zK0kuwd6asRLeDya/QgTCPt9dmZfHQIw0Z6+w00WehRR3qeFEulHOI
         U9YVyyVF0Cew06bqVbk15DOoItizOJEYag4/xL2MNw+vNuFcvyEhQn4eh7yBSujvfZuI
         keYkCa1YKrpJQtG8SSPyFKVh4hbwbQjPRsl2a+ViTBlNZJ2Qp/Rzmy3h+PLURr5L3qMN
         6HHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775864692; x=1776469492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8R1cxPctftOG89u1iC1smvABtKfPmxn/YCB26kmM4dc=;
        b=KMA0wEzpIO56PJvKgJu2fDM03CQm6z6cmkEUQdx9ZxqjXIahPqxHuRzhHQ8XRx6F48
         NQq9QXokcpqLWLSNKv/GTe76AMTkj1gSfFpzrCkt2mkJSI4wukN0NVEkZ3xyjcrWGFBT
         Ct58VyZ2yboDrY7j1YDjHhRWtALJRXww1vTt6C/V9i5vYj2Hk+22lFYbiqsNL3JcYwl5
         e61D/Mo5aUen/i1nVny/B/4L0TOmnIgDcYtSv6KsuLfPpPvlkAWCaSjAUdeW1ZGerpPT
         dHtBEHnqV5S0HopOUSiDNLYYWeBT3v8u1ZUw/Kv3Yi6bFO23+6Sb2lzYyoO7SndCyxCS
         p+fA==
X-Forwarded-Encrypted: i=1; AJvYcCUzo+HALfs+PMtlIw94YeC0fAGCPbYREu1v/zc9vgQ1CAMzpRvxrnc4ZFnY0VEEoQJ7bzlPWX4ROA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe9sjAZXIG3bPco5oH5+mGtJtK056P0K+H4EEtKaoEIxgvweOC
	XMHFoh6ZWVj/ZJ5CiKT5R4LEWdBWln3/8Fml165DygPkirUjmScfOBH4fjpouD7XKrU=
X-Gm-Gg: AeBDiev0KH2SJlsUf01IxnaNHO1cRc99EvfbSI3Y0vyeG21VQ479uBYVfDvWRWaWgQP
	x5pkUw84Q4816gFMCbotx++ZcmhpHk0lNIDect/qIzMbCkhan2F0Heiapl9ae7Qd1hVizUdNYRW
	pv5RBHjehHOr7pkMN/R5xiU4QLSVrhPM2jgxBq2wpfT/DAfv86pVp6GIihiLUBIOQO97m1bGHY4
	agZ2FDNZ54WLX61XpaADRKgASyleetpU52mxYbbRJpiXulMpLWWqXC8z0CUNusBdVOgarmdhmvG
	IMXe32BBvwvPkHpMJwg0/zWXjTl2FasJ14UwXpoQRu47forGlYd67J9f8X+K6/P1Jyw3jSmygii
	9oKRVNLFpEvvEVjPaVG6E9gJUSdPOLXq4CaDyGcLwlcHxhXvMH4qn06n4zrnj5bMeeBDmGL/8ix
	WWcVlV7td7ElKCb13g6Fk=
X-Received: by 2002:a05:6a00:ab87:b0:82c:d861:3caf with SMTP id d2e1a72fcca58-82f0c330a64mr5568325b3a.36.1775864692381;
        Fri, 10 Apr 2026 16:44:52 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4df7f5sm5463230b3a.43.2026.04.10.16.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 16:44:51 -0700 (PDT)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
Date: Fri, 10 Apr 2026 16:44:36 -0700
Subject: [PATCH v2 1/3] dt-bindings: power: Add power-domains-child-ids
 property
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-topic-lpm-pmdomain-child-ids-v2-1-83396e4b5f8b@baylibre.com>
References: <20260410-topic-lpm-pmdomain-child-ids-v2-0-83396e4b5f8b@baylibre.com>
In-Reply-To: <20260410-topic-lpm-pmdomain-child-ids-v2-0-83396e4b5f8b@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2786; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=Q7DrslDoEzNPakyLJFXorxvjgyPUA3DGKqDVH51Yzcc=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBp2YtyOdtjOuG32HA1t4vZodKj+AtEzJXdLxdNK
 SBaLyQt9hWJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCadmLcgAKCRBZNxia0/vG
 ZVcMD/9z8v/EsqqHjDNjy14vtJNbHcyIHfgkcmj1hhwzj3D70G/XIhtqV07i5/gQ3fi3xIBTY3E
 ntok5PuQhWiF5bk7yByI///EuLdnvu8CQA/OUQd5Tv4PgvFs/4pA7N8O51dzMpcmwGUGt0ypEsa
 a09pNZud2wFIMRxcn5hsEWfd6bM7lkbrXlSKtM8ITugv+rlyHK5SjNpTbq1jiMPFMtKPHVM/J+/
 YLDhxDToUY/yaVUPyhGRSIPRLhoFdL9MILQ4epNlNf1dBsi6HZ3vi7mFfR3a2HM0CyUdFgf1+O+
 D5VEJGwJJuRgBDzq4B/5wDdiVcAS24uCR7q+z5SFhw3X11l4mK4lT3T6v15o6BvHBchxqCLXzmf
 peaV81WmrdSNnKRcpBySD97Nx3ciwLFN+o3bClhYFr0+LbtPHDF9diKwHxDLjgifWR4newliHnI
 tkJz1Cy6AeUUDV9tFWYOFVXADN2fPx3zg7lo0119TJJlbRH1xP9YwdEuSfuAsYeJrXWHtPXsvHm
 rO6AAdGOrE6qU4/vbZNpxhZs7cLy9mz3ytBzhIN9pO3VqP1LuPoHRYIRVhDRY7YdhialFyXLb/b
 YzIQNiLC8lAw0DjQ9sFz0b0Z5t2rUrMtqH4f9D4H+00CA0zuOwehTwi1uhoMuh/S00iifjD5c0o
 ao9SZfFhrVfcLOw==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665

Add binding documentation for the new power-domains-child-ids property,
which works in conjunction with the existing power-domains property to
establish parent-child relationships between a multi-domain power domain
provider and external parent domains.

Each element in the uint32 array identifies the child domain
ID (index) within the provider that should be made a child domain of
the corresponding phandle entry in power-domains. The two arrays must
have the same number of elements.

Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
---
 Documentation/devicetree/bindings/power/power-domain.yaml | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/power-domain.yaml b/Documentation/devicetree/bindings/power/power-domain.yaml
index b1147dbf2e73..163b0af158fd 100644
--- a/Documentation/devicetree/bindings/power/power-domain.yaml
+++ b/Documentation/devicetree/bindings/power/power-domain.yaml
@@ -68,6 +68,21 @@ properties:
       by the given provider should be subdomains of the domain specified
       by this binding.
 
+  power-domains-child-ids:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      An array of child domain IDs that correspond to the power-domains
+      property. This property is only applicable to power domain providers
+      with "#power-domain-cells" > 0 (i.e., providers that supply multiple
+      power domains). It specifies which of the provider's child domains
+      should be associated with each parent domain listed in the power-domains
+      property. The number of elements in this array must match the number of
+      phandles in the power-domains property. Each element specifies the child
+      domain ID (index) that should be made a child domain of the corresponding
+      parent domain. This enables hierarchical power domain structures where
+      different child domains from the same provider can have different
+      parent domains.
+
 required:
   - "#power-domain-cells"
 
@@ -133,3 +148,22 @@ examples:
             min-residency-us = <7000>;
         };
     };
+
+  - |
+    // Example: SCMI domain 15 -> MAIN_PD, SCMI domain 19 -> WKUP_PD
+    MAIN_PD: power-controller-main {
+        compatible = "foo,power-controller";
+        #power-domain-cells = <0>;
+    };
+
+    WKUP_PD: power-controller-wkup {
+        compatible = "foo,power-controller";
+        #power-domain-cells = <0>;
+    };
+
+    scmi_pds: power-controller-scmi {
+        compatible = "foo,power-controller";
+        #power-domain-cells = <1>;
+        power-domains = <&MAIN_PD>, <&WKUP_PD>;
+        power-domains-child-ids = <15>, <19>;
+    };

-- 
2.51.0

