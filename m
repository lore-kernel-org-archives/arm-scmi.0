Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52DA339B2D
	for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 19:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773257979; cv=none; b=O1rQyP8rJHTSdy88C2y/K0ItIehF7mz4mH2Xzy2Wc7CpXG8GsO7ZIbZBOhRQfjlYsMrueij7dL3B7YYPpbfWfX8xsXxc1L5zGrdMZsLpApI3+qYTl84N8MoUrEGnnJPn7bHnr/kQFsCXYJTn5aDaifNNNJBUV5gAKeVlXrbphBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773257979; c=relaxed/simple;
	bh=M5WfybRaNkVzKxgUIKGSz06vz2jfEwpqjGJn8yTFsck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QtAbCe0FBqgIERGFz7fj3D/cq21mxyXvLl84G+qERb4pFY8OOrj5xvDl/z7dofMEOCqBGWhnb92VtZEFtbY88AiYs//Xf9+LsR2JTt848qgzIePU5Dywbycr9sYJBXKJMnwuJzcvZE8FWAbN8DXRtR8rvZpOTVAHXhQIbqejb54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TavCIgQW; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TavCIgQW"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439b9b1900bso159836f8f.1
        for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 12:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773257974; x=1773862774; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lZkxqUuUbJ4Vbj2riO1raVFqanxfpUss3tcQOFPsGhg=;
        b=TavCIgQW4uVIwC/3wEAeWNi/yZy7ADvG1FRn93hvwPTSWODfg3IRk7GjUbZq3LT+yr
         Nfl81XQIojowbC+0K8YLV030JeTHHxqhw3EAhWfkeTsoXxiTevXrqN93cJ/F6E5Gs0XH
         fVHleyYV4aEjM6xOKnWqvHidjBgPWyYeKOuk2d3NviP/I/5Ept+MKK2kvoEc7ltVzMhy
         ViUlhRSYhydfGlg+K3rEKTyai4hZb5Q16mofqgDVnb1K20c/eWnm1EUXX2NmCN9m7FM6
         CzppDcpJ1Ec2Uegf/S5iHd4I46psQcHxLWrdIERw/2/V1DNte/yWvp6CBh3LRryEsMTi
         cVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257974; x=1773862774;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lZkxqUuUbJ4Vbj2riO1raVFqanxfpUss3tcQOFPsGhg=;
        b=pwfSeGk+9tkLe0ciuYPDYY6AQMu2DHvVOiIsoWUyoJsqxxPRYpcoZZZlFctIvT1/cA
         rCcsId0jriG2UwDodpfvpi/YKSNCc2Xdpj9b3s2y/MQBO6m7biG7nZyOMwblHFh2Fukq
         D/lCHWzhvJwVO2YMGWAnhvKiDDAgax4mbdpezHOarTmdUMsvsWk/VjPkBOWlMd+JRpzx
         afID8im08vsUefenyqT9jruKvCDJtISotWSs/kLMEBQ7FlinFLqGoeOXAij2/ZkEAPaO
         iuHPlriO4HpUjL5wmekALtPpR7sFEZVx2+W8XD2+K6t4SZI1N+/YWzdRSQMryV019xbu
         rFSw==
X-Forwarded-Encrypted: i=1; AJvYcCVHB+MrRqoPuOQpL0IFx00SKIT1qBbWdc/bb30BXsfC7KIkCSCDlyEHQ07RjM7bs8N8zE8JOvRvNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxedUu/3xcoe5+NWwlSdBIqrkrEfHe9Uwz19cxptigOU4Ohiq0C
	AYKOwZM5AcBxQ6YCvWJPGgjhXqIPuvM0n5kgq5kSShRjDG/yDOGY8z/pkxKsKmMXc/U=
X-Gm-Gg: ATEYQzwjJy4zn+NfVjKdHCSmDszCDWFWHrd+q1wejvVDA+t35n+CUd0W2iALv0nyHIZ
	PSzi1HEyZkLO83G6xahOmWqFrRzuq00mXy/HVDpexWU2EK7mc8fxFMqD3PPTXF96hdvfW7lYCph
	6fRGhxW6gOAzLymG0OkAK/ywOMlkaU2UbvH06VVomOgTDzxYOFJQ72rUonBgyXgSUwZ6zSpJTng
	onh8Se5fR/zYRXC+vHpN+UHSXzkOjBS61uREtHWAs6NZJf5+L6HVN0mBIAdt9f3chqbipU5OTv8
	tbPrxUpD9CzKlPESo0zc3BWFxc5s+ogH5yzbNqjfixgpoydI1Wnuht9YbdjZWK/i0mJdQLZHn47
	2DVfs8ObSBQ95sGxWJLOsK/CgFebKDdSxZHch53uNt4ZdvQmNC9lqrpzd1rbWOTPDlhS8/532L4
	GJJQnUzsAgBDwyMVaDjuCXmo3JJnmf
X-Received: by 2002:a05:600c:4e56:b0:485:4136:99a8 with SMTP id 5b1f17b1804b1-4854b0fafb9mr59007345e9.22.1773257973713;
        Wed, 11 Mar 2026 12:39:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0d4a37sm24019345e9.20.2026.03.11.12.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:39:33 -0700 (PDT)
Date: Wed, 11 Mar 2026 22:39:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@nxp.com>, AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Alice Guo <alice.guo@nxp.com>, Anis Chali <chalianis1@gmail.com>,
	Arturs Artamonovs <arturs.artamonovs@analog.com>,
	Eoin Dickson <eoin.dickson@microchip.com>,
	Greg Malysa <malysagreg@gmail.com>,
	Ian Roberts <ian.roberts@timesys.com>, Jacky Bai <ping.bai@nxp.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Marek Vasut <marex@denx.de>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Oliver Gaskell <Oliver.Gaskell@analog.com>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Philip Molloy <philip.molloy@analog.com>,
	Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>,
	Tanmay Kathpalia <tanmay.kathpalia@altera.com>,
	Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de,
	Utsav Agarwal <utsav.agarwal@analog.com>,
	Valentin Caron <valentin.caron@foss.st.com>,
	Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
	Vinh Nguyen <vinh.nguyen.xz@renesas.com>, Yao Zi <me@ziyao.cc>,
	Yegor Yefremov <yegorslists@googlemail.com>, Ye Li <ye.li@nxp.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	arm-scmi@vger.kernel.org, linux-gpio@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v2 0/4] u-boot: add SCMI GPIO/Pinctrl support
Message-ID: <cover.1773256350.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

There is an existing SCMI pinctrl driver in drivers/pinctrl/nxp/ which
lets you configure the initial state of the pins via device tree.  This
patchset is a more generic version which provides GPIO as well.

I wrote two small cleanup patches to the NXP driver, one which renamed
an enum and another which made some white space changes.

The next patch adds an pinctrl driver which lets you configure the
initial state for the pins.  But the main thing is that we need one
driver to handle the SCMI pinctrl protocol so the pinctrl driver does
this.

The last patch adds GPIO support over SCMI.

I tested this code using the SCP SCMI server on OP-TEE over Qemu.  I
created a custom mock pinctrl device in SCP.

Changes since v1:
Address Peng Fang's review comments.
Use the standard gpio-ranges to describe the pins instead of
inventing a custom format.

Dan Carpenter (4):
  scmi: pinctrl: add pinctrl message IDs
  scmi: update comments for scmi_pinctrl_config_set_in()
  scmi: pinctrl: add pinctrl driver for SCMI
  gpio: scmi: Add gpio_scmi driver

 drivers/firmware/scmi/Makefile            |   1 +
 drivers/firmware/scmi/pinctrl.c           | 365 +++++++++++++++++++++
 drivers/firmware/scmi/scmi_agent-uclass.c |   4 +-
 drivers/gpio/Kconfig                      |   6 +
 drivers/gpio/Makefile                     |   1 +
 drivers/gpio/gpio_scmi.c                  | 248 ++++++++++++++
 drivers/pinctrl/Kconfig                   |   9 +
 drivers/pinctrl/Makefile                  |   1 +
 drivers/pinctrl/nxp/pinctrl-imx-scmi.c    |   2 +-
 drivers/pinctrl/pinctrl-scmi.c            | 365 +++++++++++++++++++++
 include/scmi_agent-uclass.h               |   2 +-
 include/scmi_protocols.h                  | 379 +++++++++++++++++++++-
 12 files changed, 1371 insertions(+), 12 deletions(-)
 create mode 100644 drivers/firmware/scmi/pinctrl.c
 create mode 100644 drivers/gpio/gpio_scmi.c
 create mode 100644 drivers/pinctrl/pinctrl-scmi.c

-- 
2.51.0

