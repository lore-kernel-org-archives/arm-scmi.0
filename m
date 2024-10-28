Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0000F185B68
	for <arm-scmi@vger.kernel.org>; Mon, 28 Oct 2024 15:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730128198; cv=none; b=eUOdmQMYam/kLOcNDAgBj8IIdG21Y8Y1tmM5biBRaB0NpJOCJIIkLm1l9HtI4QWvrGavr0lbtCpUy2vVHHS2U6F5dCaDfMzRy6khrc9vamXkIkZlF1Xj+JM6jh2fibDuANLG4O4ATm5GrWRe2SXEwLSLVkRGPVm1R7H8xHIHckU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730128198; c=relaxed/simple;
	bh=0qH9lqhiwqV3UMCSsD0WPSfXP85FtRF0mPavDqCY7IQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dx0KnQS650HnjJdCR8L1+eWkzufR+b1QLbVZmMmSXNlJp810w0vZ5AMwI4qcC/6TbVsSxq70EmCR73NlZe5PCfZgLMpDzAfGL9c8zWpZHupDd3VKJQ7j+vqNW2WiNDruvB7247z5DnvPT1ouRl2coMi1VeA3zG7GWUY3dpxLQO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v/WVyjwA; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v/WVyjwA"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a9a2209bd7fso658901066b.2
        for <arm-scmi@vger.kernel.org>; Mon, 28 Oct 2024 08:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730128194; x=1730732994; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x+wn2nJgwSlfNiLZteka2BzkKVDY10u14mPT+wRXZR8=;
        b=v/WVyjwAjybxF1LfEVzxK628/7l6mn2/lH4ytxpyuUBNrj3PWSfTwjXlcj+ilpjhQs
         VElFdrYatCr3KBRquQOFYVm9aHwckasQ3vAN07obSzRZY8g2cdP6e8gWS6AdFNT4hkEt
         kpDpI3guBlDhFptq+VGxQq59ZXxDxLBX4aoBglCoZYUoI4IHu+4v6OC7tR8g2NiM4mzJ
         EPwQMbLa5oBr04hGOfOeAi5tG14ljpp+RHwmuUbDJ2k3JLgFU2R+R/F/XoevnRF82H43
         L+ktoehrvCZLOuFrUtjA31mE1Dn9wZGfCLt5UfiI3hvneXYaX/nJ/ud3PJYzI6A8yB2+
         /vbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730128194; x=1730732994;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x+wn2nJgwSlfNiLZteka2BzkKVDY10u14mPT+wRXZR8=;
        b=Ooq3i9jfxKIlzsW7Zke5AmrPUYT/CDcEIYw0rcoWV0E3h+TJ0F/uXXQ8iAJkHyGJ34
         QnGB2AGJ1vWhPVDisn0D4biHDTo2Qapk4YIhgMrZXpIvmobK4x7ktxl1IuvqyDZRxDvb
         L901LzFDOjbMyaSU1EiOywk8Uo0PioPZBhz/VavnEyPEoCxxGLXuWAVqeGmgORSJKI/8
         jz7eVHxp74LnidOUIAE0wPjrlqyNYWfQH0zkmbk0ECRb15D5LOHGilgnvoUck6HwakNS
         M8z5uzW0hdlVgTCFlvoenszao9ZwXKZZtdV7LEyNoBDVabc1JE8QwsALzQZSKPXpLloE
         qhAQ==
X-Gm-Message-State: AOJu0Ywth/zwysO31GKpObu0ZMfHcMkfcYY3Wry28G8Tvy07FATl14si
	PbsCBNaMNr6yUogl3iD8J6LWi2GnpGcF9nsWf9FFogrJH5PHt2OgJkl7ujwTm5Q=
X-Google-Smtp-Source: AGHT+IFD6C3UUeH62lb6eKEXGfb0Rfooh2HRT17wzqDIuj1+KOmaE677JXOZspLO8l97+7n11Mjd+w==
X-Received: by 2002:a17:907:3d90:b0:a9a:26dd:16bc with SMTP id a640c23a62f3a-a9de5c91003mr921220266b.5.1730128194243;
        Mon, 28 Oct 2024 08:09:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1dec8100sm384765166b.6.2024.10.28.08.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 08:09:53 -0700 (PDT)
Date: Mon, 28 Oct 2024 18:09:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: girish.pathak@arm.com, Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, vincent.guittot@linaro.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Question about identifiers
Message-ID: <c5fdc171-0dc7-4c38-88e7-fcf9de7cbec2@stanley.mountain>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Two questions:

1) In SCMI pinctrl protocol each pin, group or function has an identifier.
   uint32 identifier
	Identifiers are limited to 16 bits, and the upper 16 bits of this
	field are ignored by the platform.
The linux-kernel assumes that the identifiers are basically, 0 to nr_pins,
0 to nr_groups and 0 to nr_funcs.  Is that a fair assumption to make?

2)  In the spec 4.11.2.7 PINCTRL_SETTINGS_GET and 4.11.2.8
PINCTRL_SETTINGS_CONFIGURE it only allows for pins and groups, not functions.
Meanwhile gpio functions are functions.  That's just a mistake, right?  I've
been working under the assumtion that it is.

regards,
dan carpenter

