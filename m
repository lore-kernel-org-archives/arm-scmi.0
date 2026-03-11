Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889CA317151
	for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 00:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773188390; cv=none; b=Xm4yfJknU5zBXOwegCzaHIg9b+uTYx4goW0myYlFXLcEd6/VZ6Sk7sGdssLZsgPvCBkY/eLy1AEkgfzizXzpSKqWnNASj5Ue+tLuOXCOWg2jG0WJ6bbAuGKwoECOdhrzRM0cjE9EzEncvEX4m+iS2uDhpK8FGkiuJzi9rntBhHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773188390; c=relaxed/simple;
	bh=W4xSkkVIycg+yElDAfB07bsC758UPlh9LzCrHeiEG6A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NupnX1YPy2mR2zWf1ruZs50S6DQPptnab0ez9mgnT263GZ11IO58u/Ir7IKRi/gCiyWlcAEKZ8ZK2cMeSnwHWwqdHGG8MEmlW2V8EcQD3sTOD8SPn47cJDrIZLBha8AH8mvzQqwllGoduA6Cwzc2TWtag/9mBhbRnghmSsUeJgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=HjETSn+l; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="HjETSn+l"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3598c008455so6012387a91.3
        for <arm-scmi@vger.kernel.org>; Tue, 10 Mar 2026 17:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773188389; x=1773793189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wRPHMWr3RYeq2LdlKWsQydyKI1DDcq+bxSSt+FcIkkg=;
        b=HjETSn+l9Y2pMksal9A4mPHKvr0YGzYlTh5OfX5qPjsJYuQU/h2WafvzK/b0oXVYlP
         xX8nizJD4v9r1uSLPVNePh7cquSGNLnf3Bu78+qoxPh49wS4emBSSxP+p9BTFrTq0/do
         gfqA0AXmm7hi2wqCn6JmIQ+ojy2MYCTO+7APpaDDQvwcnG2PDuXrXRbcrLph8XiFy9sa
         xcZZOeU4cJrE6wvVnxEKh9jaz1WdTMkT/k0svZspmGaqklsWvFcw3zOkzu2suA9Zai68
         PPg6+xcftZ2qz4KMLASVAuhETWIuj2WtcrS+lQqS9ZJem/vL2uhZ6V4tAIJjjNYac6t8
         IoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773188389; x=1773793189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wRPHMWr3RYeq2LdlKWsQydyKI1DDcq+bxSSt+FcIkkg=;
        b=n9m6sKywPU2nbTY62cu9GVXpifWwt4dWRJEa9EE+aGiVqBOuVvgpv/ed46WbsrXWiP
         LVWJrTHHTNkttoPnVf3SuESe5ykEgVWRe8kXQCuCo3lPXV4V8/sUIcK1WAg/vqs2bFo1
         Zwp0F0JROqiUnV7YtdtseKEbtXjeTIBAYSKRCag6FmPDsKxVpSWcNYOSO0ah8gdmTE88
         9aX0i1xNsB8qNnphrTbkErT7fLulCzPjQeukFiQFkDJAOFo6XIJPfVdMbkKOFtfBW9sf
         dRFON4lf13MMTKKdKpo+0PGTQlw1WgCz+Zrl+tfdNBJttraOpRarvu2yFU+ZD37giAWC
         6YQw==
X-Forwarded-Encrypted: i=1; AJvYcCV8VPCmMQjuszfCuSREdEZgMsAmCFSi5hoiHfGEuPqrH+NVtULfPEtsPz/kvtJ3x3MEM9j3zY6XsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YylKBvtv57FjKDgsXYQ9KgV95FxuJ6ZCEr3t+9IddSrCh+TWtxx
	qjYFDSSei5PKXxjyJyUCThq6ntXz38ttJB8f8AcrW+1eoqImZcXw00O4vnD1Lw84zcU=
X-Gm-Gg: ATEYQzy7f8IZm8IytnisXCIwkbRuyfPtj9VJa/aWJ8BwRczrIbz6AUqtypOZq8xSQ6s
	8J3EZCprPGCUasR+MYVC9Kx7pXAJaWDzgFEXDceAg0NyWTbIaqpWBvTA9rHp+n7rzKg7MKtgzux
	0E8T2Skbik2+7+7XlBVSMJgURQMXWIWwv4fTC9dKH5QEZEQfsQaH079lPkzfw0YxrXhHGvISj4W
	qkRCX+S4LKK8iU07gqMuxo+A+XK7pxAI/2Wcp2TO+S0ESj2sAxyRUfbyPKxttgNvnN+fDI7Oiza
	qBm0wXJ8d+liDPHJ+a4bYoTnZaGjGFqB1Ni2hz4ON2iRa1+7KGsRtHUikUMGdMahQ+/woP51IRX
	2ucTAbZMbrXmoqn9w14tfT2IZ7izebc3ENHuraJ+HH31/91lhoMZicqzmf77CjMbx0OTXS11YPS
	goWm6PK00j9ytI9FFtR2bl
X-Received: by 2002:a17:90a:ec85:b0:359:f8c3:dada with SMTP id 98e67ed59e1d1-35a012cabc9mr688568a91.13.1773188388912;
        Tue, 10 Mar 2026 17:19:48 -0700 (PDT)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a01b174ebsm174134a91.1.2026.03.10.17.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 17:19:48 -0700 (PDT)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
Date: Tue, 10 Mar 2026 17:19:23 -0700
Subject: [PATCH 1/3] dt-bindings: power: Add power-domains-child-ids
 property
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-topic-lpm-pmdomain-child-ids-v1-1-5361687a18ff@baylibre.com>
References: <20260310-topic-lpm-pmdomain-child-ids-v1-0-5361687a18ff@baylibre.com>
In-Reply-To: <20260310-topic-lpm-pmdomain-child-ids-v1-0-5361687a18ff@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev-53144
X-Developer-Signature: v=1; a=openpgp-sha256; l=2801; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=W4xSkkVIycg+yElDAfB07bsC758UPlh9LzCrHeiEG6A=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBpsLUi4DwekAQDifoz6ARcFx1D9uf8ysPKH/4U6
 vky1ASsKDaJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCabC1IgAKCRBZNxia0/vG
 ZYGFEACckVcCs/uQxZ/ASYWG2Okj24RX8PZGa/Q2bO9XBt+1kSdS0YnC1imfvCon3WKPZ+5/lX8
 K/h0jB3AX23jBP0sbB9ihDlFHl8NSt79A4R/Fj+RHLkHwqr6I3wJCBApPbhRbm51OWvPVocCUk7
 BdUpZaFVX/YZ2mlmedt6g1t6uOA9GRgwMbn9vSXYCjrEa7fdf+/eojIBzgJGYstukKyehLvPvUR
 t1ULjrmjCBPrVdZqEb9NyKnX7vMjRqyZZ3qEJt/JqxrMHH89v49u9MVH1WoRvU7Yl2lrzpnAHhQ
 wwfvo1Avopvsy4jgjxfCUEEuo+SAwauxQ0PCM/TWNKZ7/xBYcoKgA25cy76nWua/oHzbpoBHJpV
 zbj6gF0AstTdZNcdiNXkLtZtHIJjBf9hA5Oz7C/9qpec+1lobL0fQLzrWfUYBFkqPXzdHLkpXBb
 xn4SyFKvv76YymCTBlQgHN+9+aa6SJs6XM37pa7Cl60LcddnLIyp57NwJlP3d78zjGDfYfTLSyF
 3zxi0VrF4XO58kCZG6D+GxBSNfpeZPP8OLlugM2ftq1gzpDx3tSjHHcCUqpFSc8/IOsbVKACQgY
 /g7/SLGeKw1gZYKaSU4ZWi1Rxnn2ya8xY1KO5ioZ79wlrkBRuE7hx3GJ6w4HdXaG/4EakIz4O1S
 Em9fX2MDKctxdag==
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
 Documentation/devicetree/bindings/power/power-domain.yaml | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/power-domain.yaml b/Documentation/devicetree/bindings/power/power-domain.yaml
index b1147dbf2e73..a3d2af124d37 100644
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
 
@@ -133,3 +148,23 @@ examples:
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
+    scmi_pds: protocol@11 {
+        compatible = "foo,power-controller";
+        reg = <0x11>;
+        #power-domain-cells = <1>;
+        power-domains = <&MAIN_PD>, <&WKUP_PD>;
+        power-domains-child-ids = <15>, <19>;
+    };

-- 
2.51.0

