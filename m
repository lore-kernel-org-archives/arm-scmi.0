Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794322057;
	b=3Q9ORwncgp/oUicM5FYjRGKWxQR2EY0OIK/C1UyfOBWM2El8MTsFgU8/2DRnNWYjjg6K
	 a4ZmNxo8MvJQJ6K+6wojOx9Y1Ccb+tk7sI+Z8jAdMufG2G8m0GABTvG6ENNbzpyS3YWPt
	 IOtjS2jcYD+2XXPZquaRjbkW8g5JDm/X5hvVQqGgXccVETGnAN3ZrEmE6nQcC8K/IS0h9
	 wRujWwdLmzfZI3q4XP2DfxKWyCwKmlduAiDu5jZf0j4lux9jFpWhtJkax/sJTl9X1Emn1
	 Mt4UdUJ9xoj2pMAC8bNE+g9B9Z55V4JZAMm5MqmEp0F99l9QlFfoYGjIQs6u59+uyrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794322057;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=MO+byH4b4UJciY+YAuSXOwdIPo4Acff/hgRSnkQLcP4=;
	b=t7RhOTynlK1KRzdi+21OyFtBkuOqm8boz4h+7Q6Yaq3BhAeIKf31Bka2lhsEbEPctPfc
	 9bJV0SppU3IeHjv9jDD/DL0GmeEkxiM1ReJB4cmCvnHPxGZkOFBArrV9vVEaAPqRejlE7
	 aiugwbq7Oj5zXa6gHEhy+CAx+xt7WtxXQduRT+zT4tUIJB+Gcbqyw3guy6cHEbpHnOq3X
	 IVY8wRIK9U4L4zAvIYLGgrhl8bzV+S9bKHg8g+RPx4tp2NWMEj43zmdn1/7MLpCC8ATSc
	 6sSIOlPfpEGK1YXUy1fAal/u5C0v4Ju8ohbnMy91LJnLWhdrOSv/ZsdP1Bsj0W7EOkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="lxQqOG7/";
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB603606A321
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 14:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB603606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lxQqOG7/
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490d59c3edaso1535034f8f.1
        for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 06:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794322054; x=1794926854; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MO+byH4b4UJciY+YAuSXOwdIPo4Acff/hgRSnkQLcP4=;
        b=lxQqOG7/ja3vQA3ubzTTIQQXnhHfPS+0aO2YnX7lae2OVRufASV1+doafyCZBTaKNr
         j+LVB34btw2XqAN9zO80UB04MX2wvWDSAaeIgqgzy09tS7K03khvWHJfsbJ3yE5fG7w1
         V1Y2hyUUGrxfopBFqMceSlnDujFZCC7M4rETAOUwOtRgmyj9Dz2JqaENxkNpcTKvOCYJ
         FOHoAKiTaLPRDLPo2MEqmTxxOSMRnZoSAp8o5sxRuz1y4ZYpS8h2JO2oPTuDHc8OyqpE
         gdkdqPf5esqDTQBfb9CPFOQjrCFdLQE9c1uI9wEa2IRvjK9dLYjshru49vGfQPPYXEgg
         yDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794322054; x=1794926854;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MO+byH4b4UJciY+YAuSXOwdIPo4Acff/hgRSnkQLcP4=;
        b=XNT2fHgDOujMLBNLGTNasQb5byoQMJULIBupj3p6yMLGQqF/tZIo028/RqMCvI5fhj
         bRNTWjDp2YJtguagm0vEqRwN36zViiOf5MeUFtj17JDr2NJaKMV1cA1v+495xCWw1FzN
         PMxInQaIYtC0K4+/tb2MOWnxgyoW6t56D1B9Bc6ykuFThSeH8RVJxHgIf7G18nHuZVkY
         seaenmIgaUM2ziesYJaMufs/mIwCmfZ/52GLBwiDXZ15csLbZxgwuOLEZ4DYyoi04alv
         nAAHCogB79DgrZ0nRPOFUXVedw9ZSwI7g/DEd/f3btdeYa+XLA856RBB4j1urODTmr8D
         KrBQ==
X-Forwarded-Encrypted: i=1; AL+hErGy8JSNylVD+Gk5hiN6RufD+hvaGEEowezRKWeKuLlc51NliGczSwkshXWCUVMFl3PHBvXzSH/S2Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z+OZoGuXO30cvrW76H8dN7i7GKyQx6pWowvREZdF68eNkZtqjep
	sek80eEnRJkbXMnNuMhR+rQp9q7EHdO/wHxK6dD86EyqHXbAUWm1rrij8szcCDAJiCU=
X-Gm-Gg: AYBFou0WvBqRMjZJAl8CHFrvzDH7q0XpeYsrGT5lpplCtDqEW4cmz9WL2jRADtylLsU
	DgHRXtpsJv0OqNDMCU6AL4sv/rVmym2lHhdjWhpprj/55MBh1GBWwWKyhztbN/jKIunD4VJzvRW
	rcqGBDCKcqXA4IDMU2rC6Lni4NFsrdvC3GeIOUof4cyfSuHD1sL5hjXFpdpz+mSMyslcgS/uTO7
	iWdwdSBHJHiQ+FYodJBnLsPkFXKsUYKkXfVflYQyKyD6XEG5ZNe3aR0m1S9tQUEnV9ZK0fZfsq3
	dETN5kUcZ7dbDa42qV5Exah9/7bEFq3HBipDfvz2pgWPOaT5q16zeUVktI0EMm6pGJBjpuprIg5
	ha357ESdSvVK8KFT3SqTsfjL8EpyCpNRg97ntFju1+b1Dm014uwQ7tsz4uh0xlQpqnc8ZOAj0J9
	f0Kc/++YC3TcA4Eb8JjlWOlamOjBp1jEDOZoVuLr9m4FSB0gcRwPqsrxKPLtHkkhObli0JOQntB
	Y/LuvXIplpsejrdziIp4gcElg+jTSnkiaIQv4o42MHhu+h9eUufoFgtVuH5y9yetmZW/8VMYheD
	nBsMa+I2hjfxupDzs7BO/p5v1+7nlBeP67EVA1Su8hpHeGdvRXXCDlCbgw==
X-Received: by 2002:a05:6000:29cd:b0:492:aff5:da60 with SMTP id ffacd0b85a97d-4982e82c642mr3775637f8f.13.1794322054505;
        Tue, 10 Nov 2026 06:47:34 -0800 (PST)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a495csm5253059f8f.55.2026.11.10.06.47.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 06:47:34 -0800 (PST)
Message-ID: <7f613b00-bafa-4f4d-889b-4e37f5009b6f@baylibre.com>
Date: Tue, 10 Nov 2026 15:47:33 +0100
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
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Linus Walleij
 <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
 Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-4-52d92843ad97@baylibre.com>
 <avL-4lquUqW9lUNh@pluto>
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
In-Reply-To: <avL-4lquUqW9lUNh@pluto>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Cristian,

On 11/10/26 12:24 PM, Cristian Marussi wrote:
> On Fri, Oct 30, 2026 at 04:58:35PM +0100, Clément Le Goffic wrote:
>> A get of a setting that is on or off, the flags and the pulls, returned
>> 0 as a value, so every one of them showed as set on every pin. Return
>> -EINVAL when the platform answers 0, which is how pinconf reports a
>> setting that is not active.
>>
>> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
>> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
>> ---
> 
> LGTM.
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

I'll apply Andy remarks. Can I keep your Reviewed-by with those fixes?

Best regards,
Clément

