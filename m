Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5820928E594
	for <arm-scmi@vger.kernel.org>; Fri, 13 Jun 2025 22:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749854395; cv=none; b=aNwSKOl+T/kidt/LfptD6uS61H5X/M7TRbQlvTt3sb5gWITiCA8RInGbenlmagNsNInsGxeATvY/xSixylwkrV0fqM4JrwosX+vMv5zdceWmF8+mZTfdBsa84Qv/jNY/Ezx7W+9rMuTGg04FmWYImOGpGmUb/2aDi8c1ajz1vQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749854395; c=relaxed/simple;
	bh=rOfEkuVXnVCi6qVtn+094x5dIM7Nv0xxNwE+TQyA8T8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TyxMuw7B8gV76eqUVU/4XYp2O5CUEuthc3/3yA765eFpTxNxNa4g2cL3f+LU2dMSz+0wufwS6RUsJa6pVBEBxpUts0FRYVG44+oLSxPqXD5CJzWHksWxXux16TPAP820our7m4/NpbudgIHahxsvPF34UB0snJlzsN3oIWQRMuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=rGnx12tt; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="rGnx12tt"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-74264d1832eso2869534b3a.0
        for <arm-scmi@vger.kernel.org>; Fri, 13 Jun 2025 15:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749854393; x=1750459193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LtUsYHqMkAgU1Tr2B+Zd1LaoMvlrf2GnVyOYzZROnVM=;
        b=rGnx12tt4gcyY7Ff+HM6loz8z6h30mv0oliFIrA+wxmpWAKQYEnaaNGnLo/IA0VeuM
         LocfNijEP9zCT5ZX8Xmnk9dJruBnOoP/gAUFoc7cd3d9uopH7z9TuBn525G5AdabTdox
         +5zkn8zwAWD0ySMW4BCDT02rnppAF9mti2o+BgSewjqL2dJWFQVg2CIZOLRXCj/yTYVr
         ZsicmibYOlB08d812voI8XJGBM4RSJpHgYL3JtgxN4aSjhk7i+G+Dv6zsc14au5tY29T
         KVkDhT6MX0xsuKmTSABw/9l5juXw9yOD/ym4U75Vy+2S8fINgUWd4Cl95bPFuY/7n8O0
         Aj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749854393; x=1750459193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LtUsYHqMkAgU1Tr2B+Zd1LaoMvlrf2GnVyOYzZROnVM=;
        b=Po2TcdTND2phOA2lphHnzFLUybP8x9Le+1JrM4kTmg7KkkDx9P6v+d8xRP9kJfRDCX
         sU/iOIqbC9POEbhyJT5R3AmSkO+otgbNQBWaNaU50EJLRukUujjpDyibGm+lQ10jwalR
         kt9rF7jz1EDQBKNHwQqiE6rxevYoPq3eYE9OUnn/WxOIOqf8kzALupC1G/c4X+ptrGLk
         l5pp7MfYd7sTz1ED841Q0zYSLu2A+iKum5GB/IeQIy/tM9NmPEVQ2R2CwzFEKTH5AHfK
         5myre0RAtlVdnrQOWRFNNwGU8lR6QWy5bbGukBhWbACIgSkQLCpJ7s1IvqtkfU3+fyyj
         8QIw==
X-Forwarded-Encrypted: i=1; AJvYcCV6BJsRAfC5hwBs6q119Rr/UjoyjOdyuyy8S9MP/JYa6enc5RwDteIJpuLnOJPuFj9OXdxx8JFa9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2hE4UTz6sdBmuQRDJXdxtRrMRihvNsovQl9jpZLdaDEmEJNHT
	fcdwIzZBRK409o4AV6F/xDY/hyCb78MVpJlpQb6QX6Me6KXVaXoyLzz9veBD4sKsTWmuGY8vupA
	GY+mdLAM=
X-Gm-Gg: ASbGncuv4sq5kv2kpoDdrPjpwtAO2uX6y9WWpLMS2OUZWMq8aDTBY8QNnvafXCuqlXd
	q/R2bfFtjSYm47N9ElrQoYOf3MlQNw3DaX5Xk4e6sVuFsBUBSKJZ0YNpgXYyRn2HUCKOiN56C0I
	s2uUwsbIjvoC1p2XdP2u7oBHOsxVVEeViJf/Bqd418MPaWTw4na4CGmvLiqbARNd/Hzi0xrF26s
	k1HLpC29dsq7h4DMXhcFu7/DMcTJmX0c5/km0Uh2giogGyXWA/TiXWA26LdS+xl46wTJKJ/QvFA
	gcmdcplbK+Ar7NQGfh4PJ0a22Ys1GPPHEJnnuuCkAkydHxaXrgck/H+uJH/X
X-Google-Smtp-Source: AGHT+IHwgXzvtcCfNs2PzbcdRX2JJJWU53h7s6+ODm5XPIRNW6YQXViE+5wj8dwzo9GkGd1M8snpTQ==
X-Received: by 2002:a05:6a00:3a19:b0:746:2ae9:fc3d with SMTP id d2e1a72fcca58-7489cffb6bbmr1286927b3a.23.1749854392677;
        Fri, 13 Jun 2025 15:39:52 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffed07csm2204285b3a.33.2025.06.13.15.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 15:39:52 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
Date: Fri, 13 Jun 2025 15:39:27 -0700
Subject: [PATCH RFC v3 1/2] dt-bindings: power: add nexus map for
 power-domains
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-pmdomain-hierarchy-onecell-v3-1-5c770676fce7@baylibre.com>
References: <20250613-pmdomain-hierarchy-onecell-v3-0-5c770676fce7@baylibre.com>
In-Reply-To: <20250613-pmdomain-hierarchy-onecell-v3-0-5c770676fce7@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3-dev-d7477
X-Developer-Signature: v=1; a=openpgp-sha256; l=2322; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=rOfEkuVXnVCi6qVtn+094x5dIM7Nv0xxNwE+TQyA8T8=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBoTKi2YFfPwzOne8TB+pfX6MflvESNcRmgasHDJ
 m/48L3gLmuJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCaEyotgAKCRBZNxia0/vG
 ZUuLD/9Omp9x1pOdoz1bKUFWXqHqVaUJImyfp1fesi1byvEyjNbxkjcmARgzQwozYcklnBBD9g7
 lar8FMiob6wHupciVPM+YRVXiBVJs7h+NgOf2FAxZbyrJ7WcgvOF4qQe14qYvna1XuGdZUbCE2o
 07FaJOADzekI/ueEq8+8JUenleeRM/LSyD+Qd1QM4WlnId3qAaQt1PnUI2ZQksnVEKnUMm5TajX
 h63yXL+olU1T/6wKKQkwu57FPheyL4gAQSJLREx17wX8DbKmOSpzfaN3w7Dmgxp8DQ94Evibf5i
 K0n01CyajMuSAoCdJmI3vIFiIl4rz/hTT8VeqvX8YFU6uJBdDNPF1q3nypSJg+k7zK3fpzDYEeE
 MN4VuN7RhCc8Q1XMR+O7Ir3DWHrrFsEYGhm0kl8HOHrX2ZskEd/HVkiqVE+fTzf0XvB9HNki697
 C5yftQfWfc1VZ989Q1zkDZqhnzxQ8qW7hY85igNf8+V7meerHPFcgSTBeuoe9d/CnF4q6aoACAr
 Ikfrg3pcCCMJ95oLu8IfoK0d/+bCwU2c0ClsytDHG8gLfAugJ3eKOhvbr69NTjaUcHtwlUu5/yK
 /uhGIkq38q7QZa5EyRiUhVq11i+3NnWZh0CU0N86Lg13h+77sBpuQkFfcgtyyVk2RgCyvI4PgaU
 tngkuKK6x9Wh44w==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665

Add support for nexus map `power-domain-map` to be able to support
hierarchical power domains for providers with #power-domain-cells > 0.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 Documentation/devicetree/bindings/power/power-domain.yaml | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/power-domain.yaml b/Documentation/devicetree/bindings/power/power-domain.yaml
index 8fdb529d560b..9f099d326aee 100644
--- a/Documentation/devicetree/bindings/power/power-domain.yaml
+++ b/Documentation/devicetree/bindings/power/power-domain.yaml
@@ -68,6 +68,15 @@ properties:
       by the given provider should be subdomains of the domain specified
       by this binding.
 
+  power-domains-map:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Nexus node mapping property that establishes parent-child relationships
+      for PM domains using the format defined in the Device Tree specification
+      section 2.5.1. Each map entry consists of child domain specifier,
+      parent phandle, and optional parent specifier arguments. This property
+      is only supported for onecell providers (#power-domain-cells = 1).
+
 required:
   - "#power-domain-cells"
 
@@ -133,3 +142,29 @@ examples:
             min-residency-us = <7000>;
         };
     };
+
+  - |
+    // Example using power-domains-map for Nexus mapping
+    main_pd: power-controller@12370000 {
+        compatible = "foo,power-controller";
+        reg = <0x12370000 0x1000>;
+        #power-domain-cells = <0>;
+    };
+
+    wkup_pd: power-controller@12380000 {
+        compatible = "foo,power-controller";
+        reg = <0x12380000 0x1000>;
+        #power-domain-cells = <0>;
+    };
+
+    scmi_pds protocol@11 {
+        compatible = "arm,scmi-power-domain";
+        reg = <0x11>;
+        #power-domain-cells = <1>;
+        power-domains-map = <15 &main_pd>,
+                            <19 &wkup_pd>;
+    };
+
+    // In this example using Nexus node mapping:
+    // - Child domain 15 (scmi_pds 15) becomes a subdomain of main_pd
+    // - Child domain 19 (scmi_pds 19) becomes a subdomain of wkup_pd

-- 
2.49.0

