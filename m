Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883528;
	b=g+ollJIbvLfOyxh+eGzk5+sInXSzY37LpTBJ6wX87NmeQ5ZhJ5a2HVN4vnjp5VBGOMC8
	 cxDM1stIaLtP58oneAht5KhtEjedoPyTZaxkAqbMyLDIXnp55C8Ajn1ySy4UEtpCtu+ko
	 8TYGqTY+QedyO2hvy2Vivg7p8BUKO0iqdmdEINyd/QniSy2bqsR1hP1iiqvBzk4YOgJDZ
	 0RS8sH68EtpdfeHR7PPDp/GgV/yeGgnGB4nP3Io/U1WmQeuHT+MMafzRX1PnQnDVh3yHQ
	 6g51pHTK0MHfJftk3lD9N6cvImCSFeUyksDlcZt5z5kysqBqUvIv61evn/d7VGLUsgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=30cvqab0GneMjzQY9b3Yhah4cXyfQoNJoQir3EuyP94=;
	b=Na1/fSX6fjgjZVOEwaiNsC17Zw8i+Jtd/F5KpWUgJRHJqadeqH9L5tuvb3AJhyc03v++
	 BDOal0zKm+AKzrfteWkc8aGmjkRCMcAN0oqoFhrc0isT2ehrdVGMKRIE6ajmCIWyiak2a
	 HCbFCQ90EPn+TARdy8Fih52bxyntO0bWdOD0aLJSzcd38sp3o3y8XvtbeY5QsRi+Dj7c1
	 dL+lsHpmrGCzUF1yIpPBNy+T2Xclo5n2iIDeLuF7p/B6tipVLFL/SFSvdBo6HHvzbcSFO
	 lGPNfWmUZd7pQo4Si2+96p1wRBZa48CGxksul36iDMpQX2RTleavJBuU5qxTu6l1DKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="L/wD4a/y";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2E4606A326
	for <arm-scmi@vger.kernel.org>; Thu,  5 Nov 2026 12:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF2E4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=L/wD4a/y
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso12378775e9.1
        for <arm-scmi@vger.kernel.org>; Thu, 05 Nov 2026 04:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793883525; x=1794488325; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=30cvqab0GneMjzQY9b3Yhah4cXyfQoNJoQir3EuyP94=;
        b=L/wD4a/ylJXV0XF6/0PTSkMyL+0qSb6ZlhBosU4BX5Pj7KjRTFLwMBonjApHISxwI/
         qFX7A4EodJjv05cV1+Pvp5a9CnM4jSs7QUtlDgey5lt5MO/bWOIyVehVkIb+rUQiO7nD
         wKsQKIq2EEO0D6T13iNaiR4S2XmKG1xswSwlgamKifo8fMU5iRG2ESLyWyyF8njfzBKP
         hDhjc74qZsFhiomidhtIFh7xPrwvp3uZEhfh88UPF81e9sb+yoKFGmm0d63HpJuTTThK
         TwVr+c0za+UngVjYzur+ILK68hcWgncUpdmnjBRY0klqXtSxfQ7I1LRYEppK3SZNw9sl
         qNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793883525; x=1794488325;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=30cvqab0GneMjzQY9b3Yhah4cXyfQoNJoQir3EuyP94=;
        b=a1JP1J6qf1TW/hWh642Jv4iup4zf/6BHlBL+EA4vqBSD7qxlD9vC4pMb2g5D0gkM8V
         TQZ5f/EdK9fdhlEzIptvDtNVGwj8hu2qdgFtSN3P2RpzqaUhC9n8GgDoDZLNUrGkjcl0
         GGjFC5FeZdlu8cIDI+Ovu79JNfkoOH0xSPIu9BNLr3oTJvTN/zB6V1u1ADWobWFoKW2M
         trYE2/IdX4d3nON7+sA1O2HEQ306/zCL2zg0DfFWyIRPCaJIFNfs5W44te7lqpkZ98MP
         Tt6z8xjVcDvwx7NRKB8q09ZPPQzQcqogUO3cqK9+I9lhV51BeLRZIJnyOuzPWCs9J6Q0
         X3oQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTcyQK5Pgo3t/6Il/C8oZOuZBhIflJGlyXSnkS9Bg6T+Vl45fAYuETxuOM9UfKEDxQEy8tuBYYIA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+YHLnJNedpCdDDtQW5BSNAQiNmBPNJIwV6U2BDx/N97MoYyX4E
	qNzJWGtN5KsbnSWXk3CFoOJjrHnYgO+T1cRUFQa3JPS7KKrxG+WfqZxANcfYhKihV2M=
X-Gm-Gg: AYBFou28TFO0uwmaKLAVWE+OP65ikgfZJ9BPQwcxKy4j56vcEdKg14pISXoyaBmrmMG
	t663LB7CXN4nt5fCDSSnYBwhT4lVZN1EhjC3QTQOmHZmBGAMEh9NFu6uDHe65kFswodiRhfoC/z
	RZJDc4Oqm2TjdtmgxylfTk5W24/Dw03gjk/7iu7uOIf5SvkJetaA0kMtMQaIWjzIL5Hh/5WZGij
	hhLtAbHNuzKBQq7rg5iVU7u3BhDt9O3bUq8EKrKTJM2viFboIh48oqFc1M08nK9vz/D0Yl4NmRN
	/WRCPOAEKsJeErEwCCk8sSyP5fDqSGAr1QeVyEd+kPNjkM+0d+LcUkq1PVrb6I3zqLM3ozRsMJK
	FcxjIkE6f4ehG+BfWx2VJoD7CWju+jhAEnhK6G21SuScemMbd4Jm06lEJXw5anv3IdDgYIta7ML
	VcTYxsQqUgzzCPZ9BHU4yLyhZ2GkhbCLRq1sT7RZiOIYWNM7gzMO6TsVGpXfBnk/GvilR7REQ7I
	4dbmPvb8kkO1HjHzki2lkKgYb+GQfX2Y++rKM6AMdxGfAPkZvutrlk/Dl/O3eFMr7N7o39wMDs/
	9RLqUcRvZS51mqe/QUhM82M+EzfLlyRAwHEShRYmOkjPSAIJaWFFnOPy
X-Received: by 2002:a05:600c:6212:b0:4a4:de70:2ad4 with SMTP id 5b1f17b1804b1-4ac17ffa395mr401888755e9.22.1793883525271;
        Thu, 05 Nov 2026 04:58:45 -0800 (PST)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b63863d490sm27861675e9.2.2026.11.05.04.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 04:58:44 -0800 (PST)
Message-ID: <56932f47-2e35-4152-afc6-6cd41c8393cf@baylibre.com>
Date: Thu, 5 Nov 2026 13:58:44 +0100
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
Subject: Re: [PATCH 11/11] pinctrl: scmi: select the GPIO function on GPIO
 requests
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
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-11-52d92843ad97@baylibre.com>
 <aunIVW4JeM_P2WOa@ashevche-desk.local>
 <73888927-18ec-44b1-bb14-72e72860bfc2@baylibre.com>
 <ausPFWOj-usp084X@ashevche-desk.local>
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
In-Reply-To: <ausPFWOj-usp084X@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/4/26 11:55 AM, Andy Shevchenko wrote:
> On Wed, Nov 04, 2026 at 10:38:11AM +0100, Clément Le Goffic wrote:
>> On 11/3/26 12:41 PM, Andy Shevchenko wrote:
>>> On Fri, Oct 30, 2026 at 04:58:42PM +0100, Clément Le Goffic wrote:
> 
> ...
> 
>>>> +	int nr_functions, func, ret;
>>>> +
>>>> +	nr_functions = pinctrl_ops->count_get(pmx->ph, FUNCTION_TYPE);
>>>
>>> Is nr_functions signed for a purpose? Can it hold an error code?
>>
>> No indeed, will fix in v2.
> 
>>>> +	for (func = 0; func < nr_functions; func++) {
>>>
>>> 	for (int func = 0; func < nr_functions; func++) {
> 
> With the above in mind, the type of func has to be adjusted accordingly.
> 

Yes will do

Best regards,
Clément
