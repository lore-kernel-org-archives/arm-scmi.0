Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB9820371F
	for <arm-scmi@vger.kernel.org>; Mon,  5 May 2025 11:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746444991; cv=none; b=Uw37e6MylIs+BKZBTNHbUM6kFhyfb3SRvhPy+SzTjwucIaLdlQurAP+GdotlWiRleOEyvLpEDz8HbyEscFyouD+XwE3L1DjT00Y2gYMBEmRoQWAGJ49GCnXrOc7jmjIjP+PjasX+VP4XJRLG/K+l7DA1T7A+w+2Iy+5arQW/x9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746444991; c=relaxed/simple;
	bh=zuCdXEp8oxjwTwvlSnJyhAOkN3XymDG3iNn3ScHm9cI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=INCmixXI3i0GSlEGkPXsChryyJlNuM1krxX29VBSmNvAUIGiL0+f75CnZOUWckkm9emercIHnkfZpMiyxi2j47eTs1Iohxh+nNClQh5JjZHy6Z+ttSREvrAVD71l+2ivxsW9xM9WVDcA/Df89uX9sipRPlYrtLbo1Ov/sJywc5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BlDKzhRO; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BlDKzhRO"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39bf44be22fso2895578f8f.0
        for <arm-scmi@vger.kernel.org>; Mon, 05 May 2025 04:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746444988; x=1747049788; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4phepmZTHC5vAkftNyMA1bQszjxAUxrRFlBPTX3DOUc=;
        b=BlDKzhROPgj63Qi8osl3tM0CkRqn1+DgoANwUklUG/OCNhueE174WCG67rRJiNpCJm
         ldhMXcQRAY6UKIalE2tNWkgKmJrrgLDgyYt9yIXyCBSmp/Qm4o0eV4m+hWF/STjEUMTZ
         TkfXq8RoMNK55hrl6zKeRLjGo8j3f1/uMy0+UO9OfL1cOYWFb/qDN+YqUSZ1MU8d/Act
         wUFDjADKtQize+Rh7NoPNk1mPP63iXMot8AVCP9UW/+0AC8VO3rKogyuGcO2YZw+mVGJ
         +4POIP04uBAC864UlB/9WNAWOkxvqsjsveQiJHKRXLXRPUiSVJQJzfgPz10jrDHtuNeg
         KP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746444988; x=1747049788;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4phepmZTHC5vAkftNyMA1bQszjxAUxrRFlBPTX3DOUc=;
        b=Bii1U6fedQkdZyZcC7pMF33nSYfmMhyTLzIBbBH1e5F3ZGSRmfWGIJBKHPk0NmSytS
         WyGs97gKeWku9/Zvh23/7igiGodue4Cj0uo0bfyWXX1WYJBDm1wcTIzWXHDJlWVUe4VY
         r6JkWh6B5ImB3IJJsbx3/gz6avmhRfhM08pfsksQMACZVdJp4lOMde7FSyfOm7FfHkoA
         e+xcNKeIMPDbhtbrhHXa1PrJutXGqSdIJUvBZNj+kvmo0XOiVSGm+TxgOkgfOZVa53B3
         bvzm+iqsrP02dEDQ8JFYGC5DkfyKBOw8kbeEGFms6yOYoHP0BsEnir/gZmDrmGezvKgR
         xLGQ==
X-Gm-Message-State: AOJu0Ywi61JFAQfQceAwYwMKyVNGOiEGtCLjO4xigWYW5mIAoHZ/EXKu
	TAQZlCvvy3EtxAoNGFerLAna8E4ZN9zgJWqKdYCtrOgNzOX4R/v5uDDH3sBcAF4=
X-Gm-Gg: ASbGncvK6Kg78kVpcZb2/0H5N9ECxx8KFVFQIWrJm5jSg8XqvBkcpKX/5KmrKjzCo9b
	IlU76GDlc7j1O3l3rQsvok5KhQWIWr1Hq6UuNnoq4PouJi3PXlKF2d4Lr2dfkKBX0eJQ+r4Ho/C
	SleHYgn0rFte1vxreF31FQnTurHkDMHaDSTsgKxSEZiOlq9/quLrzbJPSJ0lP7cCWjPPIX+FjL2
	Y+eVYrA2RsgrB6Z/jGLO+ILV8iqLhndno1obBv/U4XPpCSKdflp54f7f5OWSYyddBS1Qeueh7El
	xKNofGEmVcQl/JPnN1c5QTEMF8GQmKEd4yN18z55AW4ZaA==
X-Google-Smtp-Source: AGHT+IHX3DPUoK2CBbvL9XMu5PuYfd3Tv12xdlZ7tadSos7vJLC5At+2jHITPcFn3QPH+KLU59woSg==
X-Received: by 2002:a5d:47a8:0:b0:399:7f44:5c74 with SMTP id ffacd0b85a97d-3a09cf3df66mr7016749f8f.55.1746444988093;
        Mon, 05 May 2025 04:36:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099ae3c1fsm10234470f8f.37.2025.05.05.04.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 04:36:27 -0700 (PDT)
Date: Mon, 5 May 2025 14:36:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: arm-scmi@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Girish Pathak <Girish.Pathak@arm.com>, Peng Fan <peng.fan@nxp.com>,
	Takahiro AKASHI <akashi.tkhro@gmail.com>
Subject: [RFC 0/7] pinctrl-scmi: Add GPIO support
Message-ID: <cover.1746443762.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patchset adds GPIO support to the SCMI pin control driver.
AKASHI Takahiro did some of that work earlier, but we decided to make
this a part of the pinctrl driver instead of a separate GPIO driver.

I'm not really sure how the device tree stuff wires it all in.  I've
been using a mock driver on SCP with virtio to test it.

Dan Carpenter (7):
  firmware: arm_scmi: move boiler plate code into the get info functions
  firmware: arm_scmi: add is_gpio() function
  pinctrl: introduce pinctrl_gpio_get_config()
  pinctrl-scmi: implement PIN_CONFIG_INPUT_VALUE
  pinctrl: Delete PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS support
  pinctrl-scmi: Add GPIO support
  pinctrl-scmi: remove unused struct member

 drivers/firmware/arm_scmi/pinctrl.c     | 146 +++++++++-------
 drivers/pinctrl/core.c                  |  35 ++++
 drivers/pinctrl/pinctrl-scmi.c          | 213 +++++++++++++++++++++++-
 include/linux/pinctrl/consumer.h        |   9 +
 include/linux/pinctrl/pinconf-generic.h |   3 +
 include/linux/scmi_protocol.h           |   2 +
 6 files changed, 339 insertions(+), 69 deletions(-)

-- 
2.47.2

