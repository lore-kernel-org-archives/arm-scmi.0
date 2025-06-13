Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACA128135D
	for <arm-scmi@vger.kernel.org>; Fri, 13 Jun 2025 22:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749854395; cv=none; b=qgR3Fp1qjtQqnzz+6Ez/h14gV5sNFefmEaQAOF3QXmp3y20GxBAnUMbUFCE4gQIbONeOPa7XuBHMBeTBpWVPzFiAFjv3jeYGLJMh6Ku+2Pvt4fpJLUYjOMngESWZJDBu17VBpSNxg7iTrER0rGzN4uGf2lKMO0PpmtrQLYxLIXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749854395; c=relaxed/simple;
	bh=ePkKGarZg1yxKpMRWvBxlYBrx6EdK6XqYYg37ZcpYok=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=T8LH6QlyHiwz1tuawxfo5UOt43lv02WRipWsi6NwABXy7ZJe3ZfpVlVEl/wMHOBqPjyxdCV7uGjfTVs84VeDFSZ31aCXPMaiWq8o59ylLxtQhNL+emyrAaf/WcSnLx2vl/NOyzr9NmKLUdG2/u+Kg3k3SwNUD6P47R1V/tLMFeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=k1T1J56E; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="k1T1J56E"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-23636167b30so25890895ad.1
        for <arm-scmi@vger.kernel.org>; Fri, 13 Jun 2025 15:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749854392; x=1750459192; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GfJ9tjW10c2n8OZdNWcGcJdHL86wIrVqT0sfkoG38mk=;
        b=k1T1J56Evx8HsCrtGG0nHQIbEaWt3SVZbFIQtdK/ZoE5rvvY5lKVwagOVqa2EAInze
         tffpNsw3DKvZ6FBsDRiqwGhi/bHTp/vxokid7/S8ygbwW74UdChLxMliLW6Ws+QCLVrp
         3MbuCFEjknqCKyH/Jya/Hm3m/Ls1NhdDPf7f4J56lUJmJWzKGCkADLfUoJLsQOL4ZAFC
         vEKGa5gpqpBp0z5pPXpaIGphQidh+2d5TU064G7o9nwRFnqEAIFwqdA6JbQOCmV2j/C8
         UCIL/pD3ykTg+lkMhjhT3n3WiFbQemBgEQ2u4jz4eIEs0YINVtzfp0/3p+nRA4GWN37U
         zM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749854392; x=1750459192;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GfJ9tjW10c2n8OZdNWcGcJdHL86wIrVqT0sfkoG38mk=;
        b=eic28SbIJ75HGW9TBBY3AlK3N+V/6aHS6u97GFlW2qh3ksDcSTJ0Vh+L+BGU90dZBg
         Z4il1+3miMkJSd1Am5bWmfkaA8mSOyqaGTxKZZmeNP6OStYNASpwviDi1j4telRnfooF
         rYLXjLK0uTpRueKgbitnuF6qg3tVF8TsjeGce0/aUU9S3F/ZJTqHnBFczFspo+3WstrL
         coVdIY5D0UW+8/5GlkBhfZnDJn1AQQHwhhRPa8dKSMpYEhVBkxyFBiC3VeBTJLBT05y0
         QgVg32MvR7HvduXpfKfUWF2i+Tlmke+xcVy9n5tmuoSD4ArgQNgO3//0LBH9EGDvbfUD
         IlFA==
X-Forwarded-Encrypted: i=1; AJvYcCU1iVG/vYdy0n/QUTEWkqIVqY60mPDrhOL+2tE9Gwh7zo++0UHKacriVF2itJZISczArfaWbeTupw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4n6IiXDiiyEzDEK87kviJ6q0exTzH95O8+DuzpMOscNvJomSh
	4mk2lZDMewaDTG/2shhHm05TuFJwOzDk1Ka/njl7tyu84Tfp3appYej1ODmozLTbzlE=
X-Gm-Gg: ASbGncuMdBA/N0T9GeWzVex5wLaGgVQp/GKzh5CHJZQrtoJGy7yq+V9noM0wgZJgNLw
	mmUZ7SuW/j0bx84coGh/nkbLks8cuII8iN+hqluRjG+VbbfTiUyk499MQ1afJqAJJ5OPaDaiV36
	TO6CF7ZNk8urx1o3yg7ECB4Qqcm9YeeCoysnULTznYwGAEa7u0IDmnveJm9OfGFTuu+pM4G09cM
	9bCS40j3kPJiVR4V4QRjE+Gu3SuT9AxDhY98pJnhIaHRNCmgGemM/hpGNnPiN18q2gv+502QIot
	+oq447SOdZuJ44EWnMWkdqeGPjuladT88S0rgQouYzeJDw9sib2vrsd1q4Iy
X-Google-Smtp-Source: AGHT+IEUbUa0L8a+Y7yqrzl4ZeW/SJ4xyJAVMdlKUrKNOtCmmtvE/AuX9mNwhOf5Awjt0gPehoT5/g==
X-Received: by 2002:a17:903:1d0:b0:234:a734:4ac7 with SMTP id d9443c01a7336-2366b3fe6f9mr16050505ad.49.1749854391714;
        Fri, 13 Jun 2025 15:39:51 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de783a8sm19787785ad.99.2025.06.13.15.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 15:39:51 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH RFC v3 0/2] pmdomain: core: add support for domain
 hierarchies in DT
Date: Fri, 13 Jun 2025 15:39:26 -0700
Message-Id: <20250613-pmdomain-hierarchy-onecell-v3-0-5c770676fce7@baylibre.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ6oTGgC/43NQQqDMBQE0KtI1v0lSY1JuyoUeoBuSxcxfpsPa
 iSWUBHv3uCyK5czA28WNmEknNilWFjERBOFIYfToWDO2+GNQE3OTHKpuJIGxr4JvaUBPGG00fk
 ZwoAOuw5sWbW2KXVjlGIZGCO29N3wJ3vcb+yVS0/TJ8R5O0xim/bYSYAAo4Q2XHPuKnOt7dxRH
 fHoQr/JSe7XJHDQxiiLpUJ1dn/auq4/9Zq6WxoBAAA=
X-Change-ID: 20250528-pmdomain-hierarchy-onecell-a46fad47d855
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3-dev-d7477
X-Developer-Signature: v=1; a=openpgp-sha256; l=1307; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=ePkKGarZg1yxKpMRWvBxlYBrx6EdK6XqYYg37ZcpYok=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBoTKi2npPlv8omUUI0eMPcksp7QB/oTG72KYhw4
 L2v7lGQBLOJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCaEyotgAKCRBZNxia0/vG
 ZQGAD/9X8VPwakHZ4knvT+SJkf9bf6x/fwl5+utW+gfsQOrUSB/7FAfOCeLcykP9snNa4uevhye
 UhdaUEKIp8UJG5ehdsXAYFydwzn6JC3MIcOMtjrSDW6qiG7dSzTXEPBgjhu5dnXQnHgmlxwR6Tz
 H6hk+VUWNX3A3tOUQqg33Qhz0Jc4MJGkyWzjVIJlBMefsWz99LcanYPVKRCQBiE+SA8c3GdKosX
 UHAERZueU/xWNql/AfQcWL2suTN1LkulzHFcMq5OYx1RGQnEZzUcRZUxRhixavkEbZ10H6C6VFi
 G3sw4j+W3vMnHfbU3MoimUUpgUhBO2dT4eUofXJGC12AMmsV6XMWbU8yXDUgCgBHm6EiCTk0zFW
 syuAOPSehRX9V9zZ02mdrlhs0yVubJZN0xymZLmCHXh8Mk0BG2oaY4XDyZK4f6DIC53iOqSAKjL
 HS9G9wnnal+WFfRmf3a0b/155V0anDB/2Rq6et0T3NfPximnYw2+uDK0FfJ9yhbwawCK2AuBhWV
 1a0lf2kLBrW6yZJ1zFiE83Ckm9K5PfLCyUJ8Fb7bZfxTPN4aIj1QMwm67k1Sj/+pA4SD+SU6Yk1
 Xt1t0CbwaTEftxn+s8r23yCvPjHt1nqHNFgv4Qq3vXeQqGhBwHs38Seti0qnBcaCrJscPQVWNf4
 bXCvkZXz98e5alA==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665

Currently, PM domains can only support hierarchy for simple
providers (e.g. ones with #power-domain-cells = 0).

Add more generic support by adding support for a nexus node map, as
described in section 2.5.1 of the DT spec.

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
Changes in v3:
- use of_parse_phandle_with_args_map() instead of custom parsing
- probe when device is attatched to PM domain
- Link to v2: https://lore.kernel.org/r/20250528-pmdomain-hierarchy-onecell-v2-0-7885ae45e59c@baylibre.com

Changes in v2:
- Use nexus map instead of creating new property as suggested by Rob H.
- Link to v1: https://lore.kernel.org/r/20250528-pmdomain-hierarchy-onecell-v1-1-851780700c68@baylibre.com

---
Kevin Hilman (2):
      dt-bindings: power: add nexus map for power-domains
      pmdomain: core: add support for subdomains using power-domain-map

 Documentation/devicetree/bindings/power/power-domain.yaml | 35 +++++++++++++++++++++++++++++++++++
 drivers/pmdomain/core.c                                   | 24 ++++++++++++++++++++++--
 2 files changed, 57 insertions(+), 2 deletions(-)
---
base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
change-id: 20250528-pmdomain-hierarchy-onecell-a46fad47d855

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

