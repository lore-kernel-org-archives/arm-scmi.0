Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784774;
	b=C6+A5lX3wT0LkJv/xZsQ0JXeoX9JeQbkyX+/Z/7UTcpR4rzMO1uYdrJriBOiMrAK+5/8
	 AwY8G3OmErFJOhmbUK8aj/agfEcR0ArDCtqHog0BwFiYCu1hYs2o41Fx99y7CuDmLRhPG
	 2IRfRw3OXfxbV4K5R58lYfAJl3ddn9gIco+9WZVsBnJRzPO1vFMvFE7yrsqRIWT0pDBXa
	 nfI26bjZh+Y4D6g6eOU+N3LqaobD7t5KioBvUC5HCqCmOhLcSJPYSpKebyTD8IlqJF4dM
	 kKPqgrNtOZT6wS7pXT1yBDFl2tLAv3IOlmdxX+xSbJYp5+0pq1/jTRxCO6BXYUbfsSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=SkhmiTU3L0W+PtMKZoljzuVT2by2BnJf0VMN53m+45o=;
	b=pMJ1r/MAwV4UqcVjpqMDSDdov6bPXKws1Xp6fKP24YLfFgMdOPUhUC7p/9Conq03DROV
	 tqooCernqQU/qCBMD+Rwadir2483aT3T7oKEjKbwB1G1FEcsn4OC1C/AlvOhlV+jCdr9P
	 mm8NzyTdc9cRF3UKsAgvuTgpOoqrTVFdGITYQx+Ys75bUhtzePJkGD7kU/ZH9j7lkDqcr
	 gYTnIf4yNGR6GFsiV67QMdqGbxuREYSV/9pYV8fbxDBg34vQfjWvNPKcd/r3IEx5Zhsx7
	 KyEDHcYA1AHlLcnpWEgLZuzytI6uRiB8329ScGwPW7Uaf1mX3dTKkerWpzyLURcAbhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="PQ3pDL/W";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEF4606A326
	for <arm-scmi@vger.kernel.org>; Wed,  4 Nov 2026 09:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CEF4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PQ3pDL/W
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a208d93758so4369955e9.3
        for <arm-scmi@vger.kernel.org>; Wed, 04 Nov 2026 01:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793784772; x=1794389572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SkhmiTU3L0W+PtMKZoljzuVT2by2BnJf0VMN53m+45o=;
        b=PQ3pDL/WaiOiomeexSMaOyFm+o2y1ATQPkbwmgNoTvH4LSLtI7Me6ph5fLKRtWMSRb
         UlAosgGGwz10zXab1eVlWIchC//rHjxJcHyFJ1v6xN4RtHsy9iuww+3PoW5spuDekUxR
         xBCn6aAOyX4c2QmznxlCnF2e1yAF1k2AQPtVD1gLIIdh++EJlC0P3HtUHd4oRoNX5/g5
         O/E1dgHn0Age90xTge7TUTGIfst6vdEO67tz4JFAAvLGnCT/9m3Llj4o2eGop8BEreU6
         FqabL6Jw2D/YHH6/ZgdXYWRkkqbJ0R4ALDaiYEAMYbfUTpRn8U+KPjM0j5RKMXcbXFc6
         hDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793784772; x=1794389572;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SkhmiTU3L0W+PtMKZoljzuVT2by2BnJf0VMN53m+45o=;
        b=SqlADG1rSYooZW7wAyppJePrjKEvowWhMJT53sz5UIZZIhk2+hCsGjbfp2T3wseOl8
         MZnUGTiNHzFk+m7beK5SCVVpAGI6gmxDjWeIRwoL8iB9FX9AUq3jx728xHa8W/dF6/Ww
         UHWOeLWDd92UVEfX9uYBNA1Z6HloDL2lEbZPZVakY1DzmRduGYf4gumNJt+yIvEb0Kwj
         tXFphsVhbKrKnG43gPFPpI6llwRGzns8nFmSYmBWF7hAmhntIfo8eHyvXgbz87nFGP2I
         elEZceSepnz2WNiJ3G9ggAm10AzBPI6jjSR3w+g9dht89XYJQjLWeCjJSdvARtHKe2dB
         h0qA==
X-Forwarded-Encrypted: i=1; AKwUvBxr9ONCM/YWA9dT2juBbL2XahNcMOQHtJyUmDvP1aNRV9nxrsC4dVp5csrgOGWk9cZrJ/aBStS6/w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9kBxjnM8UwtAjVG4GOzxhr/mT2Ql9g9+RG5opupgqwyR6vAUuk
	CTaKTfU2yTWV+Zbkyaq2YKtpywhVGJKCAzo8pInqbc+h+0m2e8nBbhM6lXP6oWmYf70=
X-Gm-Gg: AYBFou1y+L3k2Y3mw6JXkBk+D1H8LlASvb7z6MkPkJVDz0iOvhi0VqfZgMQzvkgCndW
	vv940t5fJqayCq8GMvd6uALlvuF8Z9iN48mjz65Z2IgrWuXlkI99prv2bYfaVdcXz7bup41pV4t
	nE24CD4xGlXvPbkaggjKS5eckRgzfjRsTS4ysknDdyvOkRG/Lvdy4b9qtVBB0XAghSgjdCx87HO
	eLSumggTO4clFaf9urQW5DqFL+AabFyLRYatTrBABmvxjDqx3MZqppJimvxkSQysKVQaDM6LUXD
	W2ddorYj45U8/FcqJXWSyQnQKnGWuG8AeOZ8DSJBOzPgrADfRmU25zSN1Bd+dEQY34GzqPDY1Pd
	XYAnVeS5kS6/Aj4LEWkJzv4bs6G7DCbj/ujkn7Bcf7z29zGtx32rgLNybW+lG46Z7d1vNOyOlOn
	bpx18+ashKZ8GICfSGbdCfkUIEqviPLeoE/qB2LgQMIuyJW8PBt0jte3zQD7OCVfcjgLoyPxEpe
	hEO0UV56fkhU+Vnj8CS4/CyLIxtVa4BGQIwe9t52PBjF4uUBdqjE0s3KechKlk4i4k9KJdfCDtr
	VGw5wVrS+UmB2H40SVT7t2IGe3diej3IWrpnHT5G+Wz4lxIsTEcfIBtQio+D2LC+JrrJ1jBR7i9
	OSg==
X-Received: by 2002:a05:600c:840e:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4ac17d168b1mr393740865e9.11.1793784771558;
        Wed, 04 Nov 2026 01:32:51 -0800 (PST)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fedc09675sm2799433f8f.55.2026.11.04.01.32.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 01:32:51 -0800 (PST)
Message-ID: <1995c873-084e-462c-83eb-5bc454882c18@baylibre.com>
Date: Wed, 4 Nov 2026 10:32:50 +0100
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] pinctrl: scmi: report an off setting as not set
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
 Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-4-52d92843ad97@baylibre.com>
 <aunHoe9PfumHp0Gh@ashevche-desk.local>
Content-Language: en-US, fr
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Autocrypt: addr=clegoffic@baylibre.com; keydata=
 xjMEafx9bxYJKwYBBAHaRw8BAQdAtc85GIwDXLz0rh9thWXC80Lji0otVDVncXT4qaS4j1fN
 K0Nsw6ltZW50IExlIEdvZmZpYyA8Y2xlZ29mZmljQGJheWxpYnJlLmNvbT7ClgQTFgoAPhYh
 BJjMiHuM4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsDBQkJZgGABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEH6EW4KtCh6Tt+sA/jVC35rY1npFlOy7YnncTdrID8Qf855JA78IzXgvzpGp
 AP9FkuuT80m66PP3DvgYX9kVnG17mSDKO0+v2W18v6ZgCM44BGn8fW8SCisGAQQBl1UBBQEB
 B0DMwF4u//aQyzsFlO8rPJ/cqsAuPH80IeIA3HOEo5mlVgMBCAfCfgQYFgoAJhYhBJjMiHuM
 4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsMBQkJZgGAAAoJEH6EW4KtCh6TdSgBAMDS0MiWCivt
 LjzZc9bs+P/xdXywUjDKq3lpQGJ6vZ0GAP9vI6DnN7vwVK6jt6/+0aBGkog5Ura9+WwRFEdM
 vLfPDQ==
In-Reply-To: <aunHoe9PfumHp0Gh@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On 11/3/26 12:38 PM, Andy Shevchenko wrote:
> On Fri, Oct 30, 2026 at 04:58:35PM +0100, Clément Le Goffic wrote:
>> A get of a setting that is on or off, the flags and the pulls, returned
>> 0 as a value, so every one of them showed as set on every pin. Return
>> -EINVAL when the platform answers 0, which is how pinconf reports a
>> setting that is not active.
> 
> ...
> 
>> +static int pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param,
>> +					    u32 *value)
> 
> I would dare to keep it on a single line.

Alright, I'll do it here and wherever in the serie.

> 
>> +{
>> +	if (pinctrl_scmi_pinconf_inactive_flag(param, *value))
>> +		return -EINVAL;
>> +
>> +	if (param == PIN_CONFIG_DRIVE_STRENGTH)
>> +		*value /= MILLI;
> 
>> +	return 0;
>>  }
> 

Thanks,

Best regards,
Clément
