Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E8029AAF3
	for <arm-scmi@vger.kernel.org>; Mon, 23 Feb 2026 14:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771857207; cv=none; b=maFpIgv9+QRhtyASK+wfvWLyqFgVMjDcCyL8oklIP0CEjZ/hHkGPoTL2DUcp5mjVsTsDDvuvfI46oUFCyUEP4dlIVNtDjiTi73jhKr8xi2uMVSzQkYV56nC7k8rNquoLPXgXDe780Ohdbpay/RrdvY+CJC+sH9fkSsT1bL1uQRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771857207; c=relaxed/simple;
	bh=iQzJsYUMl5J9LLm/zeLnrLkZ2GJD9GYvaSZCQwRfmWU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ks4N4sS+RgeVmvPW/AeyNb6zaxiD0QXXQ/RXb56y5ae6fC2Y3h1Hr/7ek+qdx+dzP+j8q1evd4MXhO1mhcJ/amdTlCNDXtwkOxd/KVetVpcqdt4h5b8gK8HDaViIkkW0eiDrtWDwpJQZW8/wW+IoITpGI1drTkhgcwB2BY0QbUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pRYFMcjL; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pRYFMcjL"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-435f177a8f7so4385584f8f.1
        for <arm-scmi@vger.kernel.org>; Mon, 23 Feb 2026 06:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771857205; x=1772462005; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=moSc302gAjDRrtUrWXAJWDcoxOudjLfjJ4Bp0OW9LCs=;
        b=pRYFMcjLAG7bcgOqsivojlBI3zTAwA/hoTpNpy1oA7g1jJpliCFtjYyudHRW++EHUO
         WoJx00vl+e8FTFFg5uGOMCkQ/i1B2K93Xv6cDEqBlGl47jxfUjTShbkZmoAOhqRfiOgp
         OwlR/9B6AM0Ir1GwcLPLqeUXwfPUYvovaGZslmTHtDCSO2GC1DvgI0DY3lWnef0mPN+1
         PJ0+0IzZENqempMa+R3Cq9pNWaR3e8FS6ltJ8vS4seQK7vF/SjMqHdMEG3LU3CaViIzA
         rdWzi35vI+gp28oByq0ZD6jQcd5kQvezFzcV5rBwsrKFloBKfi7MhyIn/rnoo81Z763i
         LTNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771857205; x=1772462005;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=moSc302gAjDRrtUrWXAJWDcoxOudjLfjJ4Bp0OW9LCs=;
        b=mPTxr4Fyi7n2Xg5PdglLGUudq4s0H9+s104VvVYEOl661FVjrrg2jCk22pygbBd3J/
         2Gu3VFT05VLZMSycTM6nIxhV7mozP5H8Oqxi1Sq3r4O/XODUl7dxup+14X2hwNI3k5C0
         fc0KMxUA7XOwakxNeHyDFXG47miJRkUf7N1AeFno+C2xJzgDcbv2VYe+WOHGKlseWm7M
         uyE5L6m00NDZYUR0gRLocgagYOd3U54wSbPIRw4oh+yolR4db4wgUgaKIjNDfD+qW6u3
         GCISxaXzEORZtDSlIpR7xNW+hL0g1DaTnl/GWcF795QGJ43A5xOpHJ9v+D8KbavaVhzZ
         Ey8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXkbxNgHImT1sS9+LbM9RvlIesqbgjoJBbg+ipS74PE8E6+MD+oKj5AjbBANH5EL7sWGtgWcder+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwB/CsFy+8bn1ogOysqpZf467FlgjsyIy7BkFuUzr4vJVXaFXwn
	ukWcNEj7AF9u353fWk0K283aqTaOBZoaS+uUwNcvpIcW9qKfm2t53VJaEzN61nVXh94=
X-Gm-Gg: ATEYQzxpA3+CNRmcD635LUwzRGlz20E2t3cqW7DiNnt265vPg2HQvxYegkGLdNYHCYh
	LlADjQCRj/dYwJzRlDCfWXEv2xMGDMV0nOcutOE4IP4nVB8n85RtUb3I2/dPCfu25lo+b4DD8LH
	dfiOa2f16RCW+e+HmNI84sNT+YCcjmgs1DG5Z/KNvq8c5xN2fn9eTXdIG6JRn1sUEFqycnond+C
	yGjsjR1++qGDjJkycjFFUTxVqvhGnpzFRlt+cVbWslZOlcNxhtTW1/Kkp6XZn1AEuEMPOCStJlu
	qgnHsn/bOrva8XD3lOuyVvaDdwnFdJMsiTzcZeaaEzeJOo88afozMQwwBL8prd38n3HhDp0ZJq7
	EE/3R5cC2noI0oKOV4yjIjKtAQn7bz4/u8bNSSF7CfIUC3u6TLPJOe9a63J5ONAxzWkTBazJWPy
	UyRQTIgNYNl7vXF7cZRypAz/2ddJuzRbiXOUQOvCQ=
X-Received: by 2002:a05:6000:2203:b0:435:add0:3d68 with SMTP id ffacd0b85a97d-4396f1856f2mr15972730f8f.58.1771857204217;
        Mon, 23 Feb 2026 06:33:24 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970b703f4sm21374023f8f.0.2026.02.23.06.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 06:33:23 -0800 (PST)
Date: Mon, 23 Feb 2026 17:33:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Alice Guo <alice.guo@nxp.com>, Anis Chali <chalianis1@gmail.com>,
	Arturs Artamonovs <arturs.artamonovs@analog.com>,
	Eoin Dickson <eoin.dickson@microchip.com>,
	Greg Malysa <malysagreg@gmail.com>,
	Ian Roberts <ian.roberts@timesys.com>, Jacky Bai <ping.bai@nxp.com>,
	Leo Yu-Chi Liang <ycliang@andestech.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Marek Vasut <marex@denx.de>,
	Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Oliver Gaskell <Oliver.Gaskell@analog.com>,
	Philip Molloy <philip.molloy@analog.com>,
	Rasmus Villemoes <ravi@prevas.dk>,
	Tanmay Kathpalia <tanmay.kathpalia@altera.com>,
	Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de,
	Utsav Agarwal <utsav.agarwal@analog.com>,
	Valentin Caron <valentin.caron@foss.st.com>,
	Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
	Vinh Nguyen <vinh.nguyen.xz@renesas.com>, Yao Zi <me@ziyao.cc>,
	Ye Li <ye.li@nxp.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>, arm-scmi@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH 0/4] u-boot: add SCMI GPIO/Pinctrl support
Message-ID: <cover.1771856828.git.dan.carpenter@linaro.org>
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

Dan Carpenter (4):
  scmi: pinctrl: add pinctrl message IDs
  scmi: update comments for scmi_pinctrl_config_set_in()
  scmi: pinctrl: add pinctrl driver for SCMI
  gpio: scmi: Add gpio_scmi driver

 drivers/firmware/scmi/Makefile            |   1 +
 drivers/firmware/scmi/pinctrl.c           | 363 +++++++++++++++++++++
 drivers/firmware/scmi/scmi_agent-uclass.c |   4 +-
 drivers/gpio/Kconfig                      |   6 +
 drivers/gpio/Makefile                     |   1 +
 drivers/gpio/gpio_scmi.c                  | 221 +++++++++++++
 drivers/pinctrl/Kconfig                   |   9 +
 drivers/pinctrl/Makefile                  |   1 +
 drivers/pinctrl/nxp/pinctrl-imx-scmi.c    |   2 +-
 drivers/pinctrl/pinctrl-scmi.c            | 357 ++++++++++++++++++++
 include/scmi_agent-uclass.h               |   2 +-
 include/scmi_protocols.h                  | 379 +++++++++++++++++++++-
 12 files changed, 1334 insertions(+), 12 deletions(-)
 create mode 100644 drivers/firmware/scmi/pinctrl.c
 create mode 100644 drivers/gpio/gpio_scmi.c
 create mode 100644 drivers/pinctrl/pinctrl-scmi.c

-- 
2.51.0

