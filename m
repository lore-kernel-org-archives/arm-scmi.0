Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70421758B
	for <arm-scmi@vger.kernel.org>; Sun, 20 Jul 2025 19:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753040320; cv=none; b=LbCxxEbALyboP40IRF0IDI7BmQytMMYmxOoQBlbj2PFPHwUuJ41sIb4buT2K+dQk4qvDfuB1wejJRBY3o9ujA3AmE80TXJiC7EfAI7BNNwZW6tg05Eul63XUiU504jRoZPw16qPsVtzfcUc0urDyyWaFP65kfk9/XtKF1aSRgYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753040320; c=relaxed/simple;
	bh=cPk3QUDJyicVsrvKeLaXhnNw3hfUKvYreFrFy6p94ao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c7o7Kx20lpKlCmCzIkRecKg+QZLgHjgrbH4ZtT31SLV6WyBqovkWlvk91r4g7qLTxvLMEZFo3rQTB9S4A82/mKqTaazbpUFZqbw0pE0UyiHTvfkaT0ztI1suie8lgJ5atz2mcVSvlp4Plr/Zf6zUkzffJ96QFevOBPcF3MXfk14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mMu/NQuR; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mMu/NQuR"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-73e88bc3891so1241532a34.0
        for <arm-scmi@vger.kernel.org>; Sun, 20 Jul 2025 12:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753040318; x=1753645118; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=STF4EnqDyXKLMLeHRmPBDx0M84uZz7Y9ipuUY9uInvk=;
        b=mMu/NQuR0B6rRCqOBvW0hhQAicVcTUTSi2MHh7PVP6x5Tfbj4lTjx0O8KU6vXuW9NL
         P558OLDpFxDj7Lqsypv1AeOBL6LLx5idg2C+RSZKCxAllx0iXzsw/wKdl/N5R1tGBhaI
         7SX55Xid74pMpn6IqnRhqxeQXqdaxPYiTCdbrRG8pN3JacNGDMw+qxKS/EDwI0pHxynY
         OQIXfrbV54iLzaqtLeAgUELgfjYXd10kgmH1MmalvA56PRonLmMO85M8yVda0ZIFGqHr
         GIr6/9hBic3NbeYWNU3iqOhpkQPYG7lVYL4UhcSt5Q0LbtvQI/MSqCKaxnm00IFEL6/l
         +Axw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753040318; x=1753645118;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=STF4EnqDyXKLMLeHRmPBDx0M84uZz7Y9ipuUY9uInvk=;
        b=xCmgc8K1N3sQv0Yvm9vzKNTinRRxUrHKv0Wc9zVMdisLPIzoEJ0dfre9RRi9ICkS8U
         o3/clx8DWLb4+fTqaysqujaZWOVevs+seX5C4dWRD7UKh1MCpEytskm/onZzCQyoU9h3
         7SMea5puTSYwImSNLvmBDv8HNhOCbjW5KKNKOjOhI3MIv3I5TSFTXAJ8a+WKJy4rBAij
         bxRFxeYTTq5Kf3Dm8ePojBEPRcBqkUPKew5udRNPdJ+nyp8lFFRmE/3E4qUna6nQH5qB
         dxj3Tv+jKY/lh4VsPwVl1p7+lizqeRt8jpOiydeYUh5RKK4u5LNj3x1CbY5smjRy6l3Y
         0bQw==
X-Gm-Message-State: AOJu0YxkqOSf2ItwZOT2MlN8+ga5qbHnslXloq9sun59OHKnXj30chOw
	9Lms7Qf6LSg+heNb6hGQHefFyTCogY3IX+laOWu3zrdIKRtwl01G40R+nGORG87L8aQ=
X-Gm-Gg: ASbGncuGeSd4M/gvRVRV/fYx51GEvKtmjgeai/D++SOx4/OAH+lSA2PzaGH2eeIoim9
	prLfY+Qh2/bhc0FhPFjy0LHfP4SzZYyXG6F7FkNfiMYTfhudlbzon/ok8QnSLNse1U0ObiPVCMa
	3cbV8NF788f79pYcLVYdfDVQXI42dV93u2FAuLrXL3CLe/IOfNEHoNYQVccqCY+/hJ1JAEXI+oe
	CU2LxRZgHhyAjuO+I+yZdBkTNZeFLETuDUZSLneTOXg3EjKenVS7IRYbvQzS+opGCKV5TnW6FVa
	HZCorYMTfGmwPl3JN6mLFOtDbPMpOXpw970PuW3ajcd92kgrlOro3u6gJi8m1yWDyOg+V2iC4IF
	FS40hic+LA9sx5q8o7Ddq8A==
X-Google-Smtp-Source: AGHT+IFkKgtB3ObGVLZWp4E0IcFIPQvja+e9izOMOGhmXfiPr6edCos/deJ042mUxYWb2yIkng7kUw==
X-Received: by 2002:a05:6830:8313:b0:72b:9316:d596 with SMTP id 46e09a7af769-73e751b5161mr8602757a34.3.1753040317899;
        Sun, 20 Jul 2025 12:38:37 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::1fec])
        by smtp.gmail.com with UTF8SMTPSA id 006d021491bc7-615bcc8c2dbsm1341831eaf.20.2025.07.20.12.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 12:38:36 -0700 (PDT)
Date: Sun, 20 Jul 2025 14:38:28 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Michal Simek <michal.simek@amd.com>
Cc: arm-scmi@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH RFC v2 0/7] pinctrl-scmi: Add GPIO support
Message-ID: <cover.1753039612.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This is version 2 of the RFC.  The main reason I'm sending this is because
there was a bug in the first version where it didn't calculate the offset
correctly so pins and groups weren't linked correctly.

I've also fixed a few style issues that people pointed out.

These patches are basically as ready as they can be.  The remaining thing
is to figure out the format to describe it in the device tree.  Actually
that's probably already done, somewhat because people are already using
SCMI pinctrl?

AKASHI Takahiro (1):
  pinctrl: introduce pinctrl_gpio_get_config()

Dan Carpenter (6):
  firmware: arm_scmi: move boiler plate code into the get info functions
  firmware: arm_scmi: add is_gpio() function
  pinctrl-scmi: add PIN_CONFIG_INPUT_VALUE
  pinctrl: Delete PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS support
  pinctrl-scmi: Add GPIO support
  pinctrl-scmi: remove unused struct member

 drivers/firmware/arm_scmi/pinctrl.c     | 142 +++++++++-------
 drivers/pinctrl/core.c                  |  31 ++++
 drivers/pinctrl/pinctrl-scmi.c          | 213 +++++++++++++++++++++++-
 include/linux/pinctrl/consumer.h        |   9 +
 include/linux/pinctrl/pinconf-generic.h |   3 +
 include/linux/scmi_protocol.h           |   2 +
 6 files changed, 331 insertions(+), 69 deletions(-)

-- 
2.47.2

