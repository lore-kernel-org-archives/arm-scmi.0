Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577D43E6DE6
	for <arm-scmi@vger.kernel.org>; Tue, 17 Mar 2026 14:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758421; cv=none; b=a/Q8mYbzQpmPcfUEKkuhi2MJNWgEM5b57+T0/HprEDigzSYc9clboJaGwz/GAyQwbtefyrXt9h87FiH+m8R/qEGuQVzor2gcV0UQm3TAStaGFmpRQBDwp6iqg61wqEJaZuyUJSIxzW19d0Q3PuVoCK6nhww8IRdEb7g2hnH8b8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758421; c=relaxed/simple;
	bh=/4E+MNf4AmhTXqW1IGhVu7c4HIHNcRISLyU5YN+k+nU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hcFZoH42GpPFTKyTlZ3s6zuEqs1y3Tcd53rQC2WSLOMjufkNAmp4zWextTAN62imzihiLkFlD9dTxLwuJvcBbWYcJaP70pABNz3N8tIULucwyXxOVsrH+MokxVOsiUn6pyw9MUNLfyMBhSRQ4zfltVyE1CsElUmNzsr3C1Ht21A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d7WaUk0R; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d7WaUk0R"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b9773abf811so669200966b.0
        for <arm-scmi@vger.kernel.org>; Tue, 17 Mar 2026 07:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773758419; x=1774363219; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5F9q2Ra06tznmx/F5pEf3aEAtRQ3mACpkv9NtbBna50=;
        b=d7WaUk0R+iZzAyFwfuFWUwviPv+mFR4c8mKFsxBQsoEiCXaKCVfMGke0skFU/MDXKE
         zDWqvIdrdHh+TTF0bh4LeB+JPu3zm74xTrGcCuTmnw0BbFFZ/tSQBykZgvefaL06irHz
         jEVDFCdjDhtJPRIZQvNodWz5mbybN5zButKAYNBAOxLfL/aWsMq/OCI3NHZhUcbaJC7z
         k2O1rCm5NVtOl85iRhg/PaB1axBtfGNceAZ6qcy3mjTuOcKTREGeGD/0+CicZ8tAoblj
         GfEKVh2I+NTjuTqqUnlLtQDwP1LT3h+JTCVtsXM0obNjZp9A7Hb8DgEYAp3N7fU0Z6hS
         W1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773758419; x=1774363219;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5F9q2Ra06tznmx/F5pEf3aEAtRQ3mACpkv9NtbBna50=;
        b=pllxqmawvEy9TeeJn/i0S+8uJcbaQqd3llS7S2Tk9SKsmbWwOtk+Lu7iB6TNftmufH
         Bc88OJh2wz2Z839GC+pwt1xzijOifP4p6E/yweT9xfOBER2DBR7rTSHXTGnTnXf81QPx
         gZBTYdiaVLbBXwy4c4n/f1WDwUgl8ei7BIL4xmi912Vzn97oKmoitFJloLJLsxIkAKFQ
         3ksjjtLRbKHl06DmKAm7OvRG8OkQ49HWRZZiOqsiT/OIFupP3KmXxjO+ZLhZH8wGj6/q
         d1tyNYVWpGxTMdHfjM9WAIDXDQWJ+LMP/Yw3gQ3x7vzPf70gh/Epi/88sKB4ZiEddjg0
         LErA==
X-Gm-Message-State: AOJu0YzzsvlEiqq63+w+7c2QMcYbWMVGQlt7P4btIMCAD0zSftNUJHAC
	iahsOz/LpIQw4YIBYf4e6lxZfUeNLR9uf3J0KTxu8SQkyCF0MOc56XCiGNZUXEPFRTs=
X-Gm-Gg: ATEYQzxjisdJ7pPwe7DccpRxfxKO0fQvDMvqN0N+y//JjlCnoSqtQ94ZJ4/8MO2LRb4
	GfXMBd4NIfe6ykhyJS2VK7NVqfdIigK9r8XTRZW73IRpDQ0v0nNQxUBZBsZszXj9iX6DDgt4LUX
	YMcNDEgW8EUtyitFU29cFOSxERufWmfuX7hK3pQ1Uh2qDSHGpkv/wuOkBdlwD4/Yt4N3raBTb/6
	xzCeRv/5hy2uWusJ0SuV4hksZZSlr4wpsMePO18VLBZTRHgavoU4VD9s1AtwcEpmeKARiZIx7Ur
	FWPw4PxEIgG5wfdBFMCJXDdzydFyyrnTs4QkG0px0glC0tbFw9vvXCrfTjodv2mdsFtAAip93bZ
	ZVVxbrokXi2YfjYlzwUcYYWKp4hlbVSV678oEyj+xPGgAES3pDyyyrxFKi4vy4mo7OZXMFlWA8U
	Z5iS2uMHnOTFmopkzy4ILgOcYwj+T2
X-Received: by 2002:a17:907:1b16:b0:b97:a1ca:e100 with SMTP id a640c23a62f3a-b97a1cb2212mr737298266b.32.1773758418455;
        Tue, 17 Mar 2026 07:40:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cf380f2sm755059366b.53.2026.03.17.07.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:40:17 -0700 (PDT)
Date: Tue, 17 Mar 2026 17:40:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linusw@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: arm-scmi@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Dan Carpenter <dan.carpenter@linaro.og>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v4 0/7] gpio: add pinctrl based generic gpio driver
Message-ID: <cover.1773757772.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This basically abandons my earlier attempts and goes back to Takahiro
Akashi's driver.  Here is the link to Takahiro's patchset:

https://lore.kernel.org/all/20231005025843.508689-1-takahiro.akashi@linaro.org/

v4: Addressed Andy's comments about kernel-doc
    Addressed Rob's comments on the spec file
v3: Forward ported Takahiro's patches and added some fixes ups to make
    it work on current kernels.

AKASHI Takahiro (3):
  pinctrl: introduce pinctrl_gpio_get_config()
  dt-bindings: gpio: Add bindings for pinctrl based generic gpio driver
  gpio: add pinctrl based generic gpio driver

Dan Carpenter (4):
  pinctrl: scmi: Add SCMI_PIN_INPUT_VALUE
  pinctrl: Delete PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS support
  pinctrl-scmi: ignore PIN_CONFIG_PERSIST_STATE
  arm_scmi: pinctrl: allow PINCTRL_REQUEST to return EOPNOTSUPP

 .../bindings/gpio/pin-control-gpio.yaml       |  59 +++++++++
 drivers/firmware/arm_scmi/pinctrl.c           |   2 +
 drivers/gpio/Kconfig                          |   7 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-by-pinctrl.c                | 124 ++++++++++++++++++
 drivers/pinctrl/core.c                        |  31 +++++
 drivers/pinctrl/pinctrl-scmi.c                |  46 +++++--
 include/linux/pinctrl/consumer.h              |   9 ++
 8 files changed, 266 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml
 create mode 100644 drivers/gpio/gpio-by-pinctrl.c

-- 
2.51.0

