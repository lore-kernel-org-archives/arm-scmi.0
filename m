Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7AE221568
	for <arm-scmi@vger.kernel.org>; Thu, 17 Apr 2025 07:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876011; cv=none; b=h3qcPfnKOzX7HtcbIjM7Ao77jQNdZgAULAdtkEp7pagfHyomyCrl6aZFijaA7mEKlf7cTLiZ49NmvFRY02Uw5Otvf9y0bY6E4XaRuXHpaip9gAL4WWZmY4gJPpOREGUjH/xyNhV/IlxeJXDQTQBC3MVk2BtRjVzJsxyT2Jvk6Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876011; c=relaxed/simple;
	bh=d6IlT9ShC4wilEO6tmmh9Fe1IzuZTHCQ29TmJiiTPPA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Grr7hW5JrhcIlQbME2cOOQHPbPB+BoGWLNgpAWL85Vv/ZZSNkBpIVUvXHcjFEBqFFlGlPlflBiXTCc37G44PCg8gFW/2DRt+H/zeZGXFrXIHond1aTtFsK0SV/QTRu2Mp0/eZZtmCtzWMb7Gd8ATQToFLffGAVSPYSFIbaFPePA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Drj80sNg; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Drj80sNg"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39127effa72so76161f8f.2
        for <arm-scmi@vger.kernel.org>; Thu, 17 Apr 2025 00:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744876007; x=1745480807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iufXt7XGPWVnixx75DmjBxxr/EKI8vcJNq5OOoFoztM=;
        b=Drj80sNgO3vuNmkKhmiy5OI9x859ZXIcJ2Ge/A2acKPPZ3xTtbK8t5qYONqZPKPjmZ
         fNRduuDF+rRDwNfogxXCCBerq5Kacm8WqmjNhdTQBi6BSq/CKgcF1t5cMYArVRTrFP7T
         k23GacsS7GAprw6AZDiT8tXMTls+FncI3qqxJA3DBu4jnU7sVyQkcTqjzigmLuh+vlNE
         kcvbT67HKL8ADGh3m2Vg1HGEyopUSg2VSjYd0feG4aZLe9GSiMiB/MMQEMHfRTWcxfag
         CoIqGH22ZwxSXrXKeyYCGqVoJ4wEqBVqeHyGHYve+f9attdXhdWyvQsrjtsjYi0DStL5
         N0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876007; x=1745480807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iufXt7XGPWVnixx75DmjBxxr/EKI8vcJNq5OOoFoztM=;
        b=uyCzHbUYm97Y1UcbowbkWcIU/lBKFY3sU4GH3VsOojfV0Exx762Gi/qHJSfcS86dga
         jJYNFjW+1hRN1fZ7u8xpyS7UoGPXT4A4MkSFBOC915ACOVDi6WAnw31tHrnK8v9mpZKh
         cVZ9Q1DcJM/VoHgk0XVYkuf1iTDfdAmkFIbYRn9SuxpyMucGz0T4/Nc+YqHwxQJrztQa
         rLPQ5BcHjrDltmSLO/hwDgS4abBdunudRDaKewK6k/TKoeRUzB4tUHjzYqtmieZfa9PL
         0ypx9mqWV/yHVimadqnsLlfAp9eLPFswg1sq6mAS388yOrouuyvpo7rlxWmBAEj+NfAk
         Qcfw==
X-Forwarded-Encrypted: i=1; AJvYcCXomU0pWowmWch17hZhEmgSr9GShJyP2SEKez5uqVlG7q4cLuTyYMJXagrMGORk2D3NhSlT2BU7MQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz+btJH5USzmVhHPjdEJYnpi4QPIcgIv4E5SyQhE7ykVNjSqdq
	jof7UcvKKzsoa5Ecjc40ZxagcXw569b4YKgFDsDVc9k8AKGlaFXm6geH/3c8fe9s6SBE/vs93Jm
	z
X-Gm-Gg: ASbGncuk+A5Uhi9C8R6aESkLIXsv2IZmqJoVGOEWhmRGl9pInRjydjzQbTQkSf0ZMrQ
	h9cOVLGog+K5MI2flROtr9wY9BnyF1/UqXQdktoH8uD9WlrcLh0vrY80ynEEHNlx+Z2Ci/AzPZA
	h+/ODK3QKv0BvRQDOzBHNhiACTTqtRHRSLNEOVcRDamTOtWGZhyfhAkChIuUIq/md5YQv0o//ap
	hzI5b2chO9JZwO+XBFsH3e/40OmbdblvVyFlN92pzAwf8Qe/Xvwqg5VYSByDlXngv/5zWeK5xPJ
	ofgi0g3wnu8MTElOy5zu3Xw4k9L/N6r6NANXj4kIGxi03CXJuZmV8/SIotBeIBrpZ/GkDiQ4Hfb
	RhiwReg==
X-Google-Smtp-Source: AGHT+IHN0gCWGlfh6M10BCj9GpPYoIMHd3DPtjGO5OnRlWIDylaeB61eTs5nJuHYx+5YI8rHxxIREA==
X-Received: by 2002:a5d:584a:0:b0:39a:be16:9f1e with SMTP id ffacd0b85a97d-39ee8fd638cmr684683f8f.12.1744876007476;
        Thu, 17 Apr 2025 00:46:47 -0700 (PDT)
Received: from kuoka.. (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4d2ddfsm43130005e9.10.2025.04.17.00.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 00:46:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] pmdomain: arm: Do not enable by default during compile testing
Date: Thu, 17 Apr 2025 09:46:45 +0200
Message-ID: <20250417074645.81480-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling the compile test should not cause automatic enabling of all
drivers, but only allow to choose to compile them.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

For longer rationale:
https://lore.kernel.org/all/191543a8-2e2e-4ac4-9b2b-d253820a0c9f@app.fastmail.com/
---
 drivers/pmdomain/arm/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pmdomain/arm/Kconfig b/drivers/pmdomain/arm/Kconfig
index efa139c34e08..afed10d382ad 100644
--- a/drivers/pmdomain/arm/Kconfig
+++ b/drivers/pmdomain/arm/Kconfig
@@ -2,7 +2,7 @@
 config ARM_SCMI_PERF_DOMAIN
 	tristate "SCMI performance domain driver"
 	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
-	default y
+	default ARM_SCMI_PROTOCOL
 	select PM_GENERIC_DOMAINS if PM
 	help
 	  This enables support for the SCMI performance domains which can be
@@ -14,7 +14,7 @@ config ARM_SCMI_PERF_DOMAIN
 config ARM_SCMI_POWER_DOMAIN
 	tristate "SCMI power domain driver"
 	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
-	default y
+	default ARM_SCMI_PROTOCOL
 	select PM_GENERIC_DOMAINS if PM
 	help
 	  This enables support for the SCMI power domains which can be
@@ -27,7 +27,7 @@ config ARM_SCMI_POWER_DOMAIN
 config ARM_SCPI_POWER_DOMAIN
 	tristate "SCPI power domain driver"
 	depends on ARM_SCPI_PROTOCOL || (COMPILE_TEST && OF)
-	default y
+	default ARM_SCPI_PROTOCOL
 	select PM_GENERIC_DOMAINS if PM
 	help
 	  This enables support for the SCPI power domains which can be
-- 
2.45.2

