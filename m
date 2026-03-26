Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E356C33BBCB
	for <arm-scmi@vger.kernel.org>; Thu, 26 Mar 2026 12:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774526902; cv=none; b=HWkBUz/FcjprYFsMMqplogdyv0q9m8nITGYM6glFe4fqSRBvqL5Kd63L+69DLLiwQnt8Io0JXJjMPPxS1/dFecfw6fKoC2Wa3cT31klwf5dM89aWipzRT2KDymQ4+iWvMx0AAqYjwEQ34BGsM1sYJLwsl/rvZIbdwgNYVLdMmzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774526902; c=relaxed/simple;
	bh=+hskezWyq4749gH3wU3ympQ1xBp5dm1nVqea7P/Qj1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aeAV697ENNsOrOuFzPy/Ri+e5oOVU3+bxV98H3xWAY4zCBQLluMVQ7VtfUcXW7tXsMEhGjckmszSFmw+5t5D1+zAK4rWWn0+VIE577V9OY8tbVqytXAD66D93s1W0WaNnvkyfo/IwEErUYfZlUmelxILswvirUn2Sa25X8fQV6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dMPan4+N; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dMPan4+N"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48541edecf9so10868955e9.1
        for <arm-scmi@vger.kernel.org>; Thu, 26 Mar 2026 05:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774526899; x=1775131699; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t4cjfZg4F2PiXHof9rE5/dVu2fe6fRlZdwfljw54iWY=;
        b=dMPan4+NIW4V7ZUzADlL5+9CdrUQ5DozlAd+es4ithTopFJCTDkBRuCRDM4IWsLXSi
         Al1f1GLCZ1axGxXRN3j8Inwx4eVU90iVvVaA8hvMW7XFpbU2xu+irOKWfrWr7CEhW5cF
         NF/Ma6MX1X1UtD3OmNXzPbhvhbZunklzoutCqwWOfBrockPGiMYBWcn/PXQ4qEb+Zfdo
         rammahS+VHDggI3alO3cxiGryKLFKNFvqCFVCIQKeiyPiTnw7zBvsxtoN4zWFvF9/irP
         ays0Tq4xvoRIo1S8SnWNhfKY+cbIIAbSFo+uoxyEFPIQKEKyFX3cobVT4GwPThhvngrv
         Ycaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774526899; x=1775131699;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t4cjfZg4F2PiXHof9rE5/dVu2fe6fRlZdwfljw54iWY=;
        b=dIrL2bbJpNwMhDCTYYDRn1g754CThmxAmrZ1htvUDl9wb+uDEEejD/VVVcxhHehb6C
         nXCtJE5TcNEUT2Ffjis5TAipEDFXaAJLYr19McAWk9BnTApVvtTtqWYbr7NJ/ZvDCnCY
         CypyI+qkmiDWD0lqnZJID4ZMjambrExqS7VI2XDcLKBIqqsU/V4wuX4e2XpstoKUgcU1
         Mrdeum0QKoI/mVuOLVEEJ1hihAwAIkFnsJrzNIa5P3nUhKs13uzp5zHCMmTc3YUUT2aV
         FMk1oOAI/4iHz6Ymk5DAIhMGqEDrOOU/cwbNNAGsY8gICn1QYPa7cujcb93UUunFcnAF
         4a3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUdlDfKnTWShGaRyu/6iqbGCPI6eGe6VvU4ZzmClZhPfgbGCQEThVZvGVKEBgdrfF86OrRxma5HIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyA4KftNCf1s+8XX+lhyDPrqn7e6mRTJ+m67KCQduh3TV2OzFxT
	Jn3preQRPTyVXvAoZcgXQAXUPelGw3OHfOImjg8ZXhoP8FrOeEXWe/pdTZTkjQldpfs=
X-Gm-Gg: ATEYQzxcsYAz8e/Ejtt8txKv4xMpxrclbfdi7q+/5EQdrHBK4a4KiFC/0xrRt3amLYm
	xGan6JULE19Xq3Hy59ROnjhpcwDz3EWgcTvaSZ9+H/0xXDRqsCROn5MKIOBEQL6g0RtrjC35lrQ
	FwZDBoj1O31AVx5ZAAQdYADYELDuwIilCZ9sd/c7xGoPfb89J0f1nfBBYD9eSRZ9IK71cJN6eud
	0RK/O8iqoyIeOjANhNpCaZ95ShvFoiUJabpiKJ9YAjPhbdyDSsosVMe5LkUAtsCHx9ehzRy15/A
	9Q5qSCsUp0Lm9XoLt7ec5o+lGh+ZHiL/rk16qhMAP5Y5ZEVups1dQEQHCD6ktnzD5Jc5M/vMeEH
	Tw1DjZTSsPgyfgOV7OPnE9q7I0Wpldd6D4gw4GlvDj0VxvBR7EdMQuCLqTN8NBRhaKwAhz/QcXJ
	pvTSGRyr9OLwkbBEGOciGmWL30uK4u
X-Received: by 2002:a05:600c:3592:b0:485:3bb5:92cf with SMTP id 5b1f17b1804b1-48715fea715mr118494995e9.12.1774526899232;
        Thu, 26 Mar 2026 05:08:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d236a9sm61097315e9.11.2026.03.26.05.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 05:08:18 -0700 (PDT)
Date: Thu, 26 Mar 2026 15:08:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>, Tom Rini <trini@konsulko.com>,
	u-boot@lists.denx.de, Vincent Guittot <vincent.guittot@linaro.org>,
	Michal Simek <michal.simek@amd.com>, arm-scmi@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH 0/2] u-boot: pinctrl: scmi: Use standard pin muxing format
Message-ID: <cover.1774526652.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In my original code I created a custom format for pin muxing but it's
better to use the standard format.  I also found a bug trying to use
set the function.  (That code wasn't used previously).

My GPIO driver is not affected by this change:
https://lore.kernel.org/all/ff0756d9a26c95540fb65a35765e9a43949a5814.1774350851.git.dan.carpenter@linaro.org/

Dan Carpenter (2):
  firmware: scmi: Fix setting the function
  pinctrl: scmi: Use standard device tree pin muxing format

 drivers/firmware/scmi/pinctrl.c |   2 +
 drivers/pinctrl/pinctrl-scmi.c  | 151 ++++++++++++--------------------
 2 files changed, 56 insertions(+), 97 deletions(-)

-- 
2.53.0

