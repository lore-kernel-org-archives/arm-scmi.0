Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321948;
	b=mGHIFnlplna33XTnQKXnby7CrtTN0enTGP0Y1kjZoF/QgD4g9wXuk0U52jyXpxpt0CMu
	 fxzedoG7I9PXhl/lA0o7+x7d4IFMtZsdoGHK1FmLEYk30I6sDcvkHNQ9eK2juzEipG27X
	 oOi1qNg6eV0/lP0N1d8UVzfm1QpT1ncYiJd728C6f9YQbv76i2CefkStzL4X/7deERuCm
	 ARLUtsmW3slf/bUBDJCK0t2AjXcfVIGOU3odbYyF8nUoQd/OSi3l7ZUs1mvP3H+c9ZVAf
	 ah77yePiXPFdMxEmtc2jvXaOb6Z+ZjvcSDLuFI/AzwlvqkO1kQwBbhB2OaZyd0VesEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=L9jyp2wuPUVlelOs6NqY1BezFPyW+K5DLWLSt8XZey4=;
	b=KTMKjitko24c6lAG/0FTQvcab87rJBeT4bTHiX4gTVIUTDJ97Ex4047aVDA9RAGu9pgT
	 9oiCPqBMDrjvev3eEkEMVCBWEawoqTRiqHDSdhhKuKlvtwunk2HBVj5WnmzgyikMnVE56
	 QdLYnz0RvZTGaXfgnDeQVV8pD0OgFv3fGUskKCb1UF9L/0eC8/OewxdNFUOSFHSzpZEwU
	 uSnKrvS+XTHwJA9CWeuc/qU9KR8kX3kHS0gXHiZG4HbqbPpb+pXzX2lEGE5TmRRLv83du
	 6pq7hpSokXtphNRx4su9vWe1NYwQ250SSgYm4WL1QEQar13xBGEcGk7LATD4UnDjLEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=A4QYkVdj;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B90160A3817
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 14:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B90160A3817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=A4QYkVdj
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-49318428d98so1117048f8f.1
        for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 06:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794321946; x=1794926746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L9jyp2wuPUVlelOs6NqY1BezFPyW+K5DLWLSt8XZey4=;
        b=A4QYkVdj6QsIg6y/7whUfEp3RADSoFj6acoAjkv5/Rv/06V5aFl8cgx+A4lxCYl3zC
         nyQ+EygbyNm5Eke+OqXnuDHC/AebKcULAHM7a29PxkGKhrYyr3y+7FrGAFjrdZUkIwEB
         CbrdWO0TgYxHeLr7cNb7OryBNKlFKV3Mq+vRH2thgFjhI2DdA0CBxEx2JfwNIWVhAPpS
         9dvpAEvJM7IP9rPNQEfQj0YLGr6H9LRSOG2o3dPmfkPWDu7+2GtB0wmmF0nOJmZ6hd4L
         Sn6HbGEKqL6LIa9xhb56o6znkK58IY4F+YYdlUelrlUNY6px5YaKBLTwclLm3h62fV5m
         Grxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794321946; x=1794926746;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L9jyp2wuPUVlelOs6NqY1BezFPyW+K5DLWLSt8XZey4=;
        b=LH6sXppQkzRhKJTsXoI1gCqKD1WJA90neUdzpMZVrWg0TyTVW24965LyB2n3MUJf8q
         nzxEvlrTrfglVLs9OuXXN0fTmH8W+LiORpluTBL/tGle8qBmcn+/m7vMrdTMS3J/oGZP
         s8shyB4cuCTirjxvSGhbRNdE582ZMtTaHy8fwINzhqK+Eb9s5OCAK13eCjqIqtSfj2Nv
         d/bZnOhr8T8b2cA++D63vA6pbW142PoJOxF+k9Cv9KOfipGUPgD/D0liCK4tN/aVmptc
         fAQN427LJjtIu/z9LHuoVrV89yCDnz4aiv1c+T+5eSuxoAo9jGEe1HzscTp1GO7tvIIw
         2j+w==
X-Forwarded-Encrypted: i=1; AL+hErEikTy6fDbSv63kwfk3Emo4/qLb41KDNM3e3G+ejuATcLL3KXRf9Vpsam0vnME376FZvikYQjgzUA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8qtn5NbBDAS3Zfz/JoHSU3UVWKI4/mv71gh7gTdDAleTH3yt3z
	14kL5Q0/BQt6Wr/yvqMO8ti0+bwwvrT40euT4F6rGhSBCNxK6qkTStf7Qlyw519JXNs=
X-Gm-Gg: AYBFou0DDGJ3ov6yta5HAjE5rxFVAqaMIjmG2NoCHhXHEvBx5KlovjRMD7E8Z5ZyEz9
	r/wTQXE2iB6CMlxIOvLD5qPD0Eh6WAsEXSgPdagdvoqrcXLo9NPVNEyLJSbHzPwKzHUNw4BP1o4
	1EUwpfGwRRM1XJrHhIImOblx0VJBgEF3D8oKpvgDH5mYyIjRoa1oi6kzFu7B0Ejtyo/UDIbAHTL
	dqsY+FtYI2KFQIRXBYHE8C/OiW79Gc0XzQ1fTQqz6owhfbK03uIItN1J4QscxtvBqjuVQpg6gnp
	tAzGRK24S1mV3vQ+GBoMPzV4hC34hjCShaxHtTC6VGU8KgtLKeHYuir0QOQeC5jN0BrIWPsC/BO
	UMmJ9VEuOBOJ02Tm9kCJKj9BPIAB64VOD6slfWfu3frAb+kd3RxErPPrMEixfWHzLS+uymRRx1r
	EzDlBQF4ZyC2aX2E4aXe2cM8RWv2UlsW5kDA9WW7UlONhLdYrxyehSZkNiGrsIaFt3B9Xz2jYKR
	PSbRNvM4MP+DseVMk4yoREC1qz5khEQJh8obIeMEjeD99HFIdUVIYHCTsqJ3fOQ7HGNN5rBcKe2
	H1UHLDnw++P8aj/B7K4eLKxR9CS0+LLs+YPPcAjo7uu+bAFSea0x/+CTpM7EYmfE58xm79J+jCV
	RvNQ=
X-Received: by 2002:a05:6000:46c6:b0:48e:68d5:818d with SMTP id ffacd0b85a97d-4982e82c2d8mr3373380f8f.16.1794321946400;
        Tue, 10 Nov 2026 06:45:46 -0800 (PST)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988f5b1ce3sm3848234f8f.14.2026.11.10.06.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 06:45:45 -0800 (PST)
Message-ID: <1300fdd4-b4b3-4a89-a37b-ea0d18e3c055@baylibre.com>
Date: Tue, 10 Nov 2026 15:45:45 +0100
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
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Linus Walleij
 <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
 Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-11-52d92843ad97@baylibre.com>
 <avMg5XmU8uSzPR4s@pluto> <avMlrXeemXOSR3ng@ashevche-desk.local>
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
In-Reply-To: <avMlrXeemXOSR3ng@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On 11/10/26 3:09 PM, Andy Shevchenko wrote:
> On Tue, Nov 10, 2026 at 01:49:25PM +0000, Cristian Marussi wrote:
>> On Fri, Oct 30, 2026 at 04:58:42PM +0100, Clément Le Goffic wrote:
> 
> ...
> 
>>> +static int pinctrl_scmi_gpio_mux_set(struct scmi_pinctrl *pmx, unsigned int pin)
>>> +{
>>> +	const unsigned int *elems, *pins;
>>> +	unsigned int nr_elems, nr_pins, i;
>>> +	bool pin_only, gpio;
>>> +	int nr_functions, func, ret;
> 
>> Beside nr_functions, cannot all of these variable definitions be moved
>> inside the scope in which they are exclusively used, i.e. down inside
>> the for-loop ?
> 
> While it can be done, it's not most recommended style. Is it already in use in
> this driver elsewhere? If not, don't do it in a single function. Same if it's
> used in like one or two out of dozens of cases. TL;DR: be consistent in the
> first place.

I'll try to be consistent in the v2

Best regards,
Clément
