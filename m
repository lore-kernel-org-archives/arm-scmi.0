Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13718223706
	for <arm-scmi@vger.kernel.org>; Wed, 28 May 2025 21:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748469547; cv=none; b=JqK8gsAY412SEeBrvIVaKGFjcPA6N/zsAsn9Y7TgaeZ2NtG0i/AJvGVpNex+ikjBvFyaaH+BDApQLdFiYzvkPo+JX9yUREf69lha7ggiEC1o7w9BsER4ZcWJgoov6BoETUATViUfBdshkmMOWbUVc6UCQ5rejfqLq+9KPSzwQP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748469547; c=relaxed/simple;
	bh=XDIf/AkjIaNzr2Vzu/sOCATynhQjflkuXfJZtVEuZGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KRSdCCM8dpxdyFUamrIQHDtQlMV7AQFFp+liOE3s2NB1D+VOx8Lh6+DfBGW4kbp+/3Kq3BmSSN76D7IrB7UVBm4/R7H7LmxWdIpOCjTp6exLQ6kE9uTGfh38xQeXuovM7vetdP8Xjz4vzLHVgJi0j8sipbKhNN4t1kiRcD1fVwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1djfEifZ; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1djfEifZ"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2347d505445so2788245ad.2
        for <arm-scmi@vger.kernel.org>; Wed, 28 May 2025 14:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748469544; x=1749074344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z8ZdPuDuwTqq2jswNniT+lha6CadtSsiS4kQUuMdAOw=;
        b=1djfEifZePsMiBFJlsBNEUYWab+LH8veEinsiBKs0JJHb5xYxnye8MSa13O4iq85Tr
         DTzCKAGaI6332XbsbFjILClMHoSqooHldrmN21tHvszuYtGYEkmCaZqZS0pXCpH9q+7F
         rdmcMfGuZ6LlIq1FRj3Yhq36X6sjM222oAe0mT9HeffD+fp/Ey2fRpJgwAPuNaDIthKe
         cs++kegvj2hOcC/cJjdOXZJ90nhdZYuu+RhWs2V1ViktEqbJ6D3W+zF/MjeOZLBVaZJF
         wuneyZF9vpCwuBD1GjM/luG9JOhfjm8fp+ScrhNQXb6zicZHj6T6A7O0OqVOpbUng4iz
         VegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748469544; x=1749074344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z8ZdPuDuwTqq2jswNniT+lha6CadtSsiS4kQUuMdAOw=;
        b=QDRDFgTND91dQqQL5ua3smTPAyYmki68Ojet0U6qfEVYAelVTpDvzmsf2gP/FxV5s+
         OQOFsyiqTuWIjS7+sDdDZzOGABF0DC63bPIiqDmhmBu236vqm+y5ePJHKgdzvs2r6LYp
         amR5ySd3HM/fWx13VHE//x90KCpLXYGVPr1y8CRs/VSZMjQkKphp9lAJPNt6pOUYIzG8
         WAgl8Bs1/Bse3HAV0mFBj/0zIq+dT0bNkyRAbpGsYNkIXnbOd2iMsLnsJm9qNswpzFME
         4NwfKE4Wa8VRMtznNpgHbLdaP9wyDwuml00ZVFFSu0fwvJhAUQzw5M3gayDQ0eMQmSxu
         58nA==
X-Forwarded-Encrypted: i=1; AJvYcCX84i2+wad+9396MuqAlA6hAkhMuCoYZug8crWXFaCfDAaeVc0Z2YEFsO8n+hu1sqlLCdpNbDLmgg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk/A6T9qExHAI365ynwd8oJpaACN1RWGmY6R1+61UvFmLiOWj7
	a+ToT+dlAJ/FrtC4V31FGE8HUJihZwRGw+LdeEBfuAmKOUu+6eWedNcKp99NcgYxTdQ=
X-Gm-Gg: ASbGncvW6dIJsNuw6WHwqEjJmJxdJPWA2kbc4SP7g1uPndDvQZgQTTJ1GOOpSEAQrnC
	ZN0a+jXwCBm8dYWOPjPiHP4MZp0TOSSt/cvUdDvUhrr+/AKU5Qi2y1HLQG/iYtyPgYQuc5H9OEF
	AvWEDtejgutNOqnlaI93sgiLzBTr+81izNOWxeVxQhyHLklAPR2LiPAwNqFqp1FzPwjKId+Rc9U
	AtMRbXbYerdrXJruLHiKNUpHBke5Vndv+ACot5VYVqVlWzMwYiQGULpJIzpIPpOUi7oSfRnrPyM
	HioaTtJjLPwUqH6+Nkt/EvYPpgDlC10IMb1saw940rej7rtEuQ==
X-Google-Smtp-Source: AGHT+IG7Hqweaw4no5OG6XMsb2HanYcoObKOADbb4dmXgTHKcinnfoGGFAANuqEgfN3ovubCiCKI7Q==
X-Received: by 2002:a17:902:d483:b0:234:a139:11fb with SMTP id d9443c01a7336-234a13914a6mr110540395ad.27.1748469544301;
        Wed, 28 May 2025 14:59:04 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd3506sm597335ad.156.2025.05.28.14.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 14:59:03 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
Date: Wed, 28 May 2025 14:58:51 -0700
Subject: [PATCH RFC v2 1/2] dt-bindings: power: add nexus map for
 power-domains
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-pmdomain-hierarchy-onecell-v2-1-7885ae45e59c@baylibre.com>
References: <20250528-pmdomain-hierarchy-onecell-v2-0-7885ae45e59c@baylibre.com>
In-Reply-To: <20250528-pmdomain-hierarchy-onecell-v2-0-7885ae45e59c@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org
X-Mailer: b4 0.14.3-dev-d7477
X-Developer-Signature: v=1; a=openpgp-sha256; l=2303; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=XDIf/AkjIaNzr2Vzu/sOCATynhQjflkuXfJZtVEuZGs=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBoN4cmaxtI3Qjw0jDnCDgpzdtkUyuPqvTYz40Fh
 WakPGl06r2JAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCaDeHJgAKCRBZNxia0/vG
 ZbZiD/4koYug816H/rHw49LBAiEiYRm2/WSDsUu7rKl6wAOPJdmJdbdKyVjkrbUOnHLsEueeenS
 WC9yZBNFUr+M2aXnPfyZSrlHHp9i4R05UVdyXQqxmui6uoseDoMXOWOIeclRxFLqWcCcoht4f+V
 JowSMffimg4ylWqVJn8VnJh77xvm0W5RXlhzvakkZNu8YLJQOJZxeYkZeMEKrfFIp1uioF9TMz5
 aFgZ8Zrjdg3enN1uyjV8baP2q4kjMk+PPw+Cdp5e4WNoswOtNWV24IfiKRxoZxQ9bo3KbC5C9Xx
 Zc7gxBpZq1u1VKZgdM6Uu0CmE0Q6OO+61pHQm922vHKCgRB9FjjJ3fAlmVtqW+nHYLocxIHkLK2
 HdqvJHlxqC5ugkBmEC2tKfj/o/6PWPLf/djvCnrTmYD2TSTFOaWadYwLWx62n2iVvkyn6WBVJyr
 OuraVieK9m94TIII8xi2uK9rMO901Kk8B3Qx9hdg1MadOl38heFqUqqd4lMCt/j9Lk9+lLOfNhg
 xDNfFCjjZK4CSB21/b6RPYqYGT60kpU33R9uZEsRkQVeOrqUPq3UP8nSJiJPeLPR7E1njfnz9RW
 iRuv0Mw6qaWqzutUn3RVa2qVjx+Nj/EKUia3H4HULOCgJxF6wMo9UpQkmimdCbpepY5xq8mD7jx
 FiP9seGebm2b+EQ==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665

Add support for nexus map to be able to support hierarchical power
domains for providers with #power-domain-cells > 0.

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

