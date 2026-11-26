Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795657720;
	b=mh2WkDcgob68ByoOK0rpLbQF7eF3ZeJ9bc3XUz8F27DEU4jOgq4VUrqZggfiDa0NdBo+
	 75+EbwPQfJSUsVdypcyWLM1oZa2VE3UHZTRO8G6i/vwAY9iM33b+pYWCiUkoyqjAQbZuX
	 PwQGojNyGRckru76Z0CWgZnuHqI1UYeryQM04JSNaeAW+G/I2ozDn2m2JbE2Dbwzc/Qse
	 8PevJRxNEZbMOsIuQIGy+Xom4JCO1TbCrhSfcyOTD0Q9jEU8EmiN0mZJxhL7XkTtHHkuM
	 oDsMS7dcr63DsL1Pc6nVPwOiMlOCSO+e8P9YLhGEzOS9Bmu8Wj0avJ0fwQSAkyWHz6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795657720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ShyQmu0ddnJkdrSZothJXBYQH0ElJQ6+WmuFcfsJFK0=;
	b=VDrAWp+enaJszMAa2lIYB57dFjUB9FAJpcfp0uUoaYS5IfUn0qFQxV83Xf7vasmPBn5O
	 mZkfCLo/bNkeuNDK5//iTztnTyQtPOPe5rQqyimLuL426zcZtk6J2DU6bgd7uLcWIoutW
	 7oykgO4Dk+hFf4a3ZkEZO/o1XRt9XqLJZIL6t4nmhqM9WhQaok5iAcfvNy0ot/kfpEoIc
	 x0ZVJxWCchi1WJ3+q1+N0hbBf3yrCbPcHuJ4vayAlWyJp4L+xf15+zzhe6DHnIaCFYYgq
	 CGJl/pncwqktD+ql+0ETobYFRi3ZKeMtO2vmhuluMm6HD24F9YroQjyPa+/gN71Ho9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hQSzxchW;
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A57606A323
	for <arm-scmi@vger.kernel.org>; Thu, 26 Nov 2026 01:48:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45A57606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hQSzxchW
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-9211bbce3abso50962266d6.3
        for <arm-scmi@vger.kernel.org>; Wed, 25 Nov 2026 17:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795657719; x=1796262519; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ShyQmu0ddnJkdrSZothJXBYQH0ElJQ6+WmuFcfsJFK0=;
        b=hQSzxchWLCNm4jB8simRGB8bDBAlY0D9Vh/YLFVYubFLqvvbO5kQsiKwyECCuUcXUh
         OT5CfaXyHJVzxBIEv3CHuZcLcUYu6EbR3hwY4vD0U3mK5jd4FsXR71vidJIRF6FETUgj
         pZO85ubHxTG5dNZtimvzlxV6JFEOoRUctUhcsJnE2p3wkZV5RQ0VzIogJPIuvsOJHSXx
         5cmQh40zbSQXBHJA1Wp3qFYp4fOxIJFfVkm510sE0fsIKh8Y1zLt5cUeS4xjfpD5IChD
         O+3aZmS/IQwM8kpfPQ+Rs2iIIGISCo0A695Awspu82ujSfzWMjm1XeTeewLZapku/tRN
         hbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795657719; x=1796262519;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ShyQmu0ddnJkdrSZothJXBYQH0ElJQ6+WmuFcfsJFK0=;
        b=TsRwXH8SxwkbqiUCWhpWS1M5ljUjGmnRruJReLPF03re9BEVTbe3iYVz8QhsSGMoAb
         UMR232nY0ndBT3VI+HQdtlShMDsNkYrkroCQjEsNT6gMNt+VhQ161Ncf+EtwoZQzobT/
         JEadyx9OpF1UniU+pJ/5PeoIcp+ZAFEB0ZFnklMggMLezUgh9WXnLFXlEGLv0h9Vsvyl
         xHJkQAkO4+XUQxXMUV3ibZkuLA38OEYXJZCLl3RsI4ndlKlsPE/2JtwNMTMhcnRhwb6k
         0BVJng4e7idCUsaoHVAd67wM5jXLdRIkeJye2OV9XNrlkdY5LmFr9OICYf1GajRIhT69
         GVKA==
X-Forwarded-Encrypted: i=1; AL+hErENQh0H1QFa1wuo92AKOb515dgNB88WelcRZH2QqTsMmgL95u9stdiNy7b3+2tx8tsNbTG7l+XjEg==@vger.kernel.org
X-Gm-Message-State: APuU4Z92w3j/JEJXEAmrQgZopgsD09eaF9/wC3czGMwvTETgoKKRAWoy
	LnMqBIN9XeA9dgIsnz70H1YccLiGKedLCggW0iINNFip1KGIRQ44+wDz
X-Gm-Gg: AZFdTZezD3ufnv+w04Ko+YnmdZkKqq/ww2l8ulAJ3s4gWotH7rUYqDsGv7Ait50SaJj
	SySdJSqaUS63IIcwzVaY8pK/xBFPTNqkwTnfzYTWtSMWD7OqD4fB0wJ+ljD1EuTXswNg8I7QNdI
	hx3J5elHnp6K0W3Cne1ncUizX9NISuR4bJVYtCt6oCwD5D0G9+KnTAsGxKeJd7dcfFn8Ap3gl74
	tE8nJi1AerpvRBe017pX/ETeoVw2YrJosaBd9Q3QalmPJ9V2ttTp6pc2nSd+aSAXLAS8JI2CjHR
	KCs+foFy4ZQm3+B7ozWH5SWXznLCfP8Qwu5aBuXdPRqkr3VTDytUq0oHbMufMIj/LQwDtcGs/oZ
	EnhpjbkHUba3ALF9XFz04slEQSmb3u3GTelGtO7dAjGe57BzVJL14Sw3chBin5gFIKvUlzi38VJ
	UoItJ2USKAA8bghlS4MaNI6YnyfbYofICaL0ExKA1F+Zc/B/yF/zMsy9OpPzdFFDbt7sS9R/gEp
	2EZ3kqhC740cfFQmabuXpb5n1LQLcCXjXun8C7tyMFhktuXqq6ye+KxeZ4WhxRKgmghf+vCCtzF
	RgG7HaLtFPTDJz4dEOdUPRGszM9su/bP3IXqpL6Pa+TlOuFu5LtLDsZxkOISMm4s/AzigW7cl66
	/rOW4vY7HGBzRYjGtHN/GfWUEYjXz6dkhYJF/wdS89ESIFjQ9TOAG
X-Received: by 2002:a05:620a:454c:b0:93e:c12c:fbcd with SMTP id af79cd13be357-949bac7665amr3259261585a.73.1795657719106;
        Wed, 25 Nov 2026 17:48:39 -0800 (PST)
Received: from ?IPV6:2600:4040:5abf:f200::9dd? ([2600:4040:5abf:f200::9dd])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb41c105sm1476099385a.39.2026.11.25.17.48.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 17:48:38 -0800 (PST)
Message-ID: <3167e5ef-920a-4e1d-ba03-bc928687577c@gmail.com>
Date: Wed, 25 Nov 2026 20:48:37 -0500
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
Subject: Re: [PATCH] firmware: arm_scmi: Don't mark OPPs as turbo without a
 sustained frequency
To: Dale Whinham <daleyo@gmail.com>, Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Dhruva Gole <d-gole@ti.com>,
 Charlie Garner <charlie@akao.au>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261121-sp11-noturbo-v1-1-37e1083cec5b@gmail.com>
 <20261123-eccentric-ludicrous-roadrunner-0a7efe@sudeepholla>
 <CAFcmK8g+Udyp9h24WSEx2RepBA=rZpEQs==1hTi83A+_zF-GOw@mail.gmail.com>
Content-Language: en-US
From: Haipeng Lin <jimmie.lin@gmail.com>
In-Reply-To: <CAFcmK8g+Udyp9h24WSEx2RepBA=rZpEQs==1hTi83A+_zF-GOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/25/26 8:04 PM, Dale Whinham wrote:
> On Mon, 23 Nov 2026 at 10:26, Sudeep Holla <sudeep.holla@kernel.org> wrote:
[...]
> 
>> I worked out something very similar as a solution. Anyways does it work
>> if we also add the check for non-zero dom->sustained_perf_level ?
> 
> Haipeng Lin has an X1P machine so hopefully he will be able to confirm
> soon if adding a check for non-zero sustained_perf_level into the
> chain still works.
[...]

Confirmed it works. Tested on Surface Pro 11 (X1P64100) on v7.3.4 tree
with this check

	data.turbo = dom->sustained_freq_khz &&
		     dom->sustained_perf_level &&
		     freq > dom->sustained_freq_khz * 1000UL;

Firmware reports both values as 0 for the two 3-core domains (not just
the frequency). I took a debug print of PERFORMANCE_DOMAIN_ATTRIBUTES

  domain 0: sustained_freq_khz=3417600 sustained_perf_level=12
  domain 1: sustained_freq_khz=0       sustained_perf_level=0
  domain 2: sustained_freq_khz=0       sustained_perf_level=0

With the patch all three cpufreq policies are created (cpus 0-3, 4-6,
7-9), each has the full 710400-3417600 kHz table, no boost freq, boost
disabled. Under load every cluster scaled up to 3417600 and drops back
when idle.

Please feel free to carry the Tested-by in the fixup commit.

Thanks,
Haipeng
