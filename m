Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823215;
	b=HBNpGRRG9xW09RY6I21fX37rJfLwbaCGaLVsv73rdUfCZIAGcYPkTywxqbRHPyxTkA7I
	 8TnBAealeKw365psn/1dqfVFI0ZpZwayeaskerW4N5WyPV469Wm6/Qur9Un18ID7ybigq
	 QX9ZFDMonPpSAbuky3Gv91YockHXdm029yjH2AWOcTv0unJTLiiV/H53MDZa5BXEVbjUQ
	 3mnNYDMYEklkcAe0rXpgsocITQ4vrVS3hR8PrCCHsr8GhB39cQZ3TzEiIe3ztFbRCM36D
	 CyTVuFwWDQZI3s3h1WgV+I261zGR7qHvhRX006Mr+X/OfIbt5owvzrb6+eT18GNZ2nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=L2QG11mcJBEDMvu/QuPkL2NoETjOTlYzjaGlnujMsbc=;
	b=srj1iaDDpoyx5v196O9uVWdhaH7s6ad5IxdWQATVS9ypZk2m2ryRDW73xKgNuO/iNC9+
	 8BxadoPJh+SsjmvfzWhZGL+TGC9GPudoR2JZ4UYHHWJEnUDzE2UXcV77kobS/lBu1Ca87
	 Vpzn7O/AJ4XuOO6CPo1yorj3SrihUNFObNvH1tTemFNv9ntfm3OEL37Xv5sWmNT0P+LpS
	 pN6RpkhZWNEs4LAz3jc5M+BbhwNTPVjZPEv0/UoM5sKbEB0eAbSzxECvnkFduQXKLjA+u
	 3Tu2QJI35yD4v+LrGwP/ApoJZvOu6Pc0MSj+oQbS6Tb/6uXEHKT38jRGGs36WBS3CvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=EZyfG2ka;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786C7606A31C
	for <arm-scmi@vger.kernel.org>; Mon, 16 Nov 2026 10:00:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 786C7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=EZyfG2ka
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso1233528f8f.1
        for <arm-scmi@vger.kernel.org>; Mon, 16 Nov 2026 02:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794823213; x=1795428013; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L2QG11mcJBEDMvu/QuPkL2NoETjOTlYzjaGlnujMsbc=;
        b=EZyfG2karYEC6c2v8a9CVKvIn3VTpcvJjBWEKWkwZnMuVrzc3zfNGmB4Mkt8Q2Nxlk
         GefOEJ/SKzAyW/cCiDPKHIfnla/ZHoqVairWDum9XOHNcvHXHpgaqJs0jZvAbCwtUw2y
         /OZRstU9JA6TLMOPBwJlQBF2LZ6sSivDXJo0tgTSmk5h6DWDKhiX+f9OHcScLEV9J6M+
         9D4an3zou30wtp+HhT9CGL+Ep+3D2RjGQjuSJZHW+4SNUt2H2ocP5BYNUlEshsgKsM/I
         5v8n/qJqE2icsgR6ZMA7JHiNnOs7SKAGQlpCgutl27CEGsil1AOla/GK26pcMo8YWu5t
         kOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794823213; x=1795428013;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2QG11mcJBEDMvu/QuPkL2NoETjOTlYzjaGlnujMsbc=;
        b=ZkIY8QYvEoNoH8yd5DvAJuQYW788DJlXV8Xsd9y3DX9pphKlO7dQYPtV2rfkvu7MSR
         PHycz0/XD4imOC5KnZi2MUHzdh1innLS+Zb6uvknai7wsWYW07M9B/Hc92h1xqFlJGIy
         dyv/aZGwyrHlZVM67xMGqbZrk0oQCdcfEfYrcs/+m+nm0s7/uVWRu5gvkbqfnVk5dGfD
         Ih9QXIZFQMXThBYqeVyi+2OKIKTMa2yc95R+cecfxiAj4oqya4JOHQamXgQ6x49ofW6I
         q44XoXoARGjo9mAtZNCIgUyFahEeW0YqcNASeBg/ROJ3/N9LD5PNdNQJJKTLxtAbrbw+
         Y13w==
X-Forwarded-Encrypted: i=1; AL+hErGPpZOVx381aZAsIn6m53BwkHi5juXCeQG/aZCZ4ObLV/aTCqRGcD44IBxXHcdLAFyQhzd3oClHQg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+KAn5ypK5JB00wkd6vtKBxd0El8ylB1SnMZmQaH4slIvTfcY7v
	9DVN+DFz4wqLZFOTac03FFQ99TfGxCOyXTwmW5KX1gi6tmaal5QpdzLrx/QaC7epHOQ=
X-Gm-Gg: AZFdTZckC3hdU7hgCAlng7VWVYGf/u1F9VgQLlPxkITyGW0SGiicFns/vNwziQ4jwFj
	CAHI5JvKGMnjL9YpdB6Z+vujy4pzBScMT3BAMDENlMrWwaNQyuvIEIGrtV/zG8/9ChOaB00dh4w
	x58v+wb7reCveYgWiCJ6GNTfeuNfVADWGyiYM3OusrsQieuZ0pdgoSF1At1E4gSLyQctQZ+SKoP
	Tz9legfywT7S233dvJNF2qLL0XzaBVG6GjVXBa5CH7QVDWmzpwNcD+RX8pPr294qNVNuVRFGshB
	OQ/Zowljq9hQE64j/2ZnqjEcvxuSCrJHdO644509wQY9jQdGkSdQAWQwaQwUvYhvn7UkNbQoMn3
	ZYlC76g2NOhEacsCeSWwQnHz4UlTfPow6YBeLO/h3n7PWemfTJTXr5NyAlCkq20+grDnTTumbW7
	LlXQ6cnqOzv7GbAmNPrsaiB9wjSt5CTfQKUJu5u97I/GiP34p7CITxc2+Jh/39DIIGu6/pc0xzc
	xB3Tjo9lp/ErmrdbCp4v/IYuPyVNFM6UePvX1A832uRdma3BQ5n5GK++cTvEs18nhznHc+nwQtt
	fqWxQy6+fgXhhj2Yb3xRguBq6mlMmvU8uQ==
X-Received: by 2002:adf:e008:0:20b0:48e:6f76:de98 with SMTP id ffacd0b85a97d-49c71e3e1c0mr15349062f8f.9.1794823212810;
        Mon, 16 Nov 2026 02:00:12 -0800 (PST)
Received: from [10.48.2.141] ([212.133.41.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c604ecda5sm20247717f8f.37.2026.11.16.02.00.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 02:00:12 -0800 (PST)
Message-ID: <ce463c97-8fde-44b3-b3bd-c21a69ee61b9@baylibre.com>
Date: Mon, 16 Nov 2026 11:00:05 +0100
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
Subject: Re: [PATCH 07/11] pinctrl: scmi: give no groups to pin-only functions
To: Linus Walleij <linusw@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>, Peng Fan <peng.fan@nxp.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
 Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-7-52d92843ad97@baylibre.com>
 <CAD++jLmS1Et_B_U2W5W3GAx8ge5V+B5innksqKwxYnBzh=JPag@mail.gmail.com>
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
In-Reply-To: <CAD++jLmS1Et_B_U2W5W3GAx8ge5V+B5innksqKwxYnBzh=JPag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

On 11/13/26 11:11 AM, Linus Walleij wrote:
> On Fri, Oct 30, 2026 at 4:58 PM Clément Le Goffic
> <clegoffic@baylibre.com> wrote:
> 
>> For a pin-only function PINCTRL_LIST_ASSOCIATIONS returns pins, but the
>> driver registered them as groups. Register pin-only functions without
>> groups.
>>
>> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
>> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
> 
> 
> Patch applied for fixes.
v2 went out after your mail, please skip its patches 1 to 3.
Its patch 4 does not apply on the patch 1 from v1 (a line join Andy asked for), and its patches 5 and 6 carry the arm_scmi to arm/scmi move from linux-next.

Should I send the fixes of v3, patch 6 included, on your fixes branch, and the rest as a separate series on linux-next?

Best regards,
Clément
