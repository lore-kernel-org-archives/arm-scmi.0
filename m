Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC27A14BF8F
	for <arm-scmi@vger.kernel.org>; Fri,  6 Sep 2024 07:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725608343; cv=none; b=Y27Lvfc4EdYZaqmWx2eiFUFHZqgEaWdpnMoOV6ccEuqQpdeWRvX4KmxjBWzOvK6CkgeMNfnqA3pyWr6oKA3VudrVPBfixJsCOc/eulbto9GOQf393ovRZar70i4X0UC27mpmzTXuLP9pLBX+cFBdg6/HSQjmCSTJDIUt7vHebmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725608343; c=relaxed/simple;
	bh=/VfN5TZBKFESX0ktdJnLpkP+3s1XJrbvW7+e2JjstSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JMghxj7WmLQtA8pb2S+INt3F1Zm52tNx32j1kIropDG1Obe/y9f+CQ3alpnLBOlHtQXgd1ls9Bf0i0PxToiWvytTWY6vFngXyHg5U/WeIgpM1TuSqUmN2Yqqil8o2dsvuhKhaBbCL+/QvmWnYZ4TYtui9zImLt8jm9R+jos7Eio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cB0wo8oG; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cB0wo8oG"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-374c180d123so901018f8f.3
        for <arm-scmi@vger.kernel.org>; Fri, 06 Sep 2024 00:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725608339; x=1726213139; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xz9IdLmzy/T20GbDRPSYjXR1GKGx3xeoUvnivTDuQzM=;
        b=cB0wo8oGQ4gkqzsJUvwKF2bKsP3JPyJcvK8bOlIjlrk+jEwF2DTaekiQ5x9nIxU/UZ
         HaCsFa7RX/okxuGsDJAAUa9wIbIqORlQfJwHEEqjhATDZFBZXnh4K0gjB8TM9nBNytTH
         Lpx4ZaujIBV1Y4PChxe/m+H3cnhkvFDulli0meNFfyNDTGKB6IYEnbfb+WZVDITwgwyf
         Mtg9oW5A2dL3K3TxhVhVOTy8lY0hnWAOlVabsmGFF1FagxFC2iQ5AdRCVdjFdzQ4DQI1
         aRafG/lG6ZWwZAaCW2b0/DfSRhZ0jDCKGlajtSZAp+/RjNDaPd4p0xjNgqps9c0zsTCp
         8UzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725608339; x=1726213139;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xz9IdLmzy/T20GbDRPSYjXR1GKGx3xeoUvnivTDuQzM=;
        b=UnPSygepj/ApiuHvPmaZivtdcJ+OMxJHD2GexzlEC2xVbjxfiaDLNiEgd7X2zTRLN7
         3jNRsj6svNSQLRG3EwivtI3bLosFUK5paKQ+NQwB4GGPcCon8P53XF6RClwkAYaO0ZIB
         6Ykbb2FxhrmlH4rab5ECxkMcuC88ZFXdltEz20Lre4y5Yv7z1mr8XcQ/bqpMr5IJI/xK
         htp5vAB3XjBzgis6P2MSgPD31OMTlOG3xTJ8C5A3/TyNus/ed+6AoATvJCiIuBEcsblU
         AYe/QNCkc8pcs1YKn4E0/ByqlTQNH5vErpyPTG5GAbB+505jIPBmKEktssJBxB115jqq
         YLPA==
X-Forwarded-Encrypted: i=1; AJvYcCUYGuFyL+Se4sENbb85Ue4IPmnRaiyE4dRcXXr8mBU4DJoeJM2VDVPYYOULwjCD7yQrLjORuEunfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCQ4Y++WPgNGLnnNkBqRPDkB+z7A09i3tCMCIQyQrJ9vZGWTmC
	G8AHb8eMyF14RnqeryT+jIZ/jaUU7SfjZYaAPkx+14TRZrQgRyLN5ZD3pVQrox4=
X-Google-Smtp-Source: AGHT+IGFHwFQ99mHOKHLLsrCtuLnOv+VrrxaTcWgKFCATGwuZhLv7Zk5Z474pGF9RhYDinH0QTPZug==
X-Received: by 2002:a5d:5f4a:0:b0:374:c269:df79 with SMTP id ffacd0b85a97d-374c269e0d7mr16000044f8f.22.1725608338871;
        Fri, 06 Sep 2024 00:38:58 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3749eea60e2sm21002351f8f.62.2024.09.06.00.38.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 00:38:58 -0700 (PDT)
Message-ID: <64758ccf-7ad4-4490-b938-864ade9ae74c@linaro.org>
Date: Fri, 6 Sep 2024 09:38:56 +0200
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/21] dt-bindings: thermal: tsens: document support on
 SA8255p
To: Nikunj Kela <quic_nkela@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
 viresh.kumar@linaro.org, herbert@gondor.apana.org.au, davem@davemloft.net,
 sudeep.holla@arm.com, andi.shyti@kernel.org, tglx@linutronix.de,
 will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
 jassisinghbrar@gmail.com, lee@kernel.org, linus.walleij@linaro.org,
 amitk@kernel.org, thara.gopinath@gmail.com, broonie@kernel.org,
 cristian.marussi@arm.com, rui.zhang@intel.com, lukasz.luba@arm.com,
 wim@linux-watchdog.org, linux@roeck-us.net, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-crypto@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, iommu@lists.linux.dev,
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org,
 kernel@quicinc.com, quic_psodagud@quicinc.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-13-quic_nkela@quicinc.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240903220240.2594102-13-quic_nkela@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/09/2024 00:02, Nikunj Kela wrote:
> Add compatible for sensors representing support on SA8255p.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
