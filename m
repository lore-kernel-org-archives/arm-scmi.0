Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A485183CAB
	for <arm-scmi@vger.kernel.org>; Mon,  2 Sep 2024 11:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725275599; cv=none; b=egq8wVESN/UbbETgrPsfUb8FyiTxdkhLRmevCgryfsdEOKK72F1XwbvvQ672azrOnJmQ7se/zm5uFbwy7yMal2OqnpnSnM6o0sGTYZu+uycLM8F95imX5ZH5zD0c8wdRReEecRjGOVGYuw+sg/Cg/IkbTOZ57iWVMpcNdvRJbqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725275599; c=relaxed/simple;
	bh=DWzn1hYA+MqPVdMdjEmyelcVAh57NyETVCIWQcpDC9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I3HE2KpklOqTT2mU3a8k4MSul6TTwFymttKPH17ccTiSHfRrK5RgLYz2n5lhMCTGtFSFzLvXmOHRGfk0V5fXwSsOsEDCDg4xM6EGbPyj3FbFzToUSQCBailbhtB6wEV9qBx6KDSUqP9LCz1jxm3TO6+JSP4Yt2SBIZjHCc8odj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iJ8ZqelK; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iJ8ZqelK"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42bc19e94bdso18530905e9.3
        for <arm-scmi@vger.kernel.org>; Mon, 02 Sep 2024 04:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725275595; x=1725880395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t0y66KZsilWy5/q39E1+glqNVuSns5JZhAjLByhViBs=;
        b=iJ8ZqelKXJymdJWrC2q1XKRPSuI2+MxDVEE6CjA+fjLWqla5YFbXnVmIWbQCAbylI2
         FIumhjKQ+gJlmKiiezMg/SyqPoDKb6aoIKpOHyIwYyqLt2eyZ7vrn18EvwFt7qaY7eYi
         33xZkr7vhpE/QY+7gvnj4rOhyIdneZf75T7nv8WfLbhlkxe1FVc+wu/NbrsL1KslhacT
         yNjyIHwSerKUnMI6wdyntu48ZInsMmdSUm4bk0IgTGC7rfHT008SkKlVANK6Tjz7+2eK
         EWJXGe7JlGEuFOq2aXPuQkuvykzst+jnKHUS6B5ukPlTQuXpH9Zt8pe47tKjg4TCcTXM
         r0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725275595; x=1725880395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t0y66KZsilWy5/q39E1+glqNVuSns5JZhAjLByhViBs=;
        b=d8jLbRHN+ztmuJ0ah+LKOGErakBgnAoj2wvCBWqDNHUfZUONFsw3O+i7H5LirhRGYx
         vwZ/237jh/uvdduTLG0wTz32mkL/07DkpFmAunp2ds0nvB6gx22YpRkgCoQx0XUZ6X/y
         NXwF5KMrOPGYROoCyyFGQJ1FaAYgnradJo2K2It3O4MuWb7t0PbzQFv2AmU8qu+aQmSM
         9x25ezZGMgj6twIUElQ/7mALhoQtCfgRGCz9/sigbxFqvTWuusaxL5kXhV2o9cpFqDv8
         4R6qHfFEDim4JiQ2/FPbZyNEJcvc9RpgaMbyYgU8VxSphD0hanURIltlQbxr9hHyVOjn
         IzPg==
X-Forwarded-Encrypted: i=1; AJvYcCWHZqSApPO95Jwy6iS7UbjIX3NsO1MClRcub8t/Z2jpc1Y1ERvk90Nv8HOoIrmvMf5MoY4wwbzWjA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3ZVDceQT+3EMA+7EcafCMpHteOVNA3oL94K0C0TIxItsHWIY3
	KhWaOqjkoM/7pztDIjpxeN8w5CvaUNaUDMLjwc8eZ9bJA1P51poNqMQk5AIizVw=
X-Google-Smtp-Source: AGHT+IFxCzBbJEBnXgmaDcBmR8nMNXjOhCACiDRaC3OZHxGXv/tYXf8mnP+AgdXOfY0pl7t3Hw1Y7g==
X-Received: by 2002:a05:600c:3b25:b0:426:6320:7ddf with SMTP id 5b1f17b1804b1-42bb01fb0fbmr100596305e9.35.1725275594477;
        Mon, 02 Sep 2024 04:13:14 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42bb6e274ccsm136021455e9.37.2024.09.02.04.13.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 04:13:14 -0700 (PDT)
Message-ID: <ad18f559-b067-4f2b-9bbc-6830bbe2f252@linaro.org>
Date: Mon, 2 Sep 2024 13:13:12 +0200
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/22] dt-bindings: thermal: tsens: document support on
 SA8255p
To: Nikunj Kela <quic_nkela@quicinc.com>, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org,
 herbert@gondor.apana.org.au, davem@davemloft.net, sudeep.holla@arm.com,
 andi.shyti@kernel.org, tglx@linutronix.de, will@kernel.org, joro@8bytes.org,
 jassisinghbrar@gmail.com, lee@kernel.org, linus.walleij@linaro.org,
 amitk@kernel.org, thara.gopinath@gmail.com, broonie@kernel.org,
 wim@linux-watchdog.org, linux@roeck-us.net
Cc: robin.murphy@arm.com, cristian.marussi@arm.com, rui.zhang@intel.com,
 lukasz.luba@arm.com, vkoul@kernel.org, quic_gurus@quicinc.com,
 agross@kernel.org, bartosz.golaszewski@linaro.org, quic_rjendra@quicinc.com,
 robimarko@gmail.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-crypto@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, iommu@lists.linux.dev,
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org,
 kernel@quicinc.com, quic_psodagud@quicinc.com, quic_tsoni@quicinc.com,
 quic_shazhuss@quicinc.com
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240828203721.2751904-14-quic_nkela@quicinc.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240828203721.2751904-14-quic_nkela@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/08/2024 22:37, Nikunj Kela wrote:
> Add compatible for sensors representing support on SA8255p.
> 
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
