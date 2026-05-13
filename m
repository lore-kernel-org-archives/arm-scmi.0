Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93422F0C79
	for <arm-scmi@vger.kernel.org>; Wed, 13 May 2026 18:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778696846; cv=none; b=Mdk4+/W6JuhrQBqygmlejRSs4w/QSs0AD4cWg8zRpiu5NyHpXGPf7CnHjC4ziOmVYNUnmLcmx4S3sYKvIhTkK08xnVjffcBOT1J46uzZRretZBIJoOpAHHSS41aYzBbXq0+9nRksHzXL7ExKSyNtJpiiC6+PZd3AgBj4crfWOzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778696846; c=relaxed/simple;
	bh=k5IVFtFkizYO9JvUz++Nf75KXmQjUQ2V7WuK3NLE/xs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hl3DE/jRYzlMpMburj9h6TwVA8s9zH4YW0Dq0e6WUb+eDmd5zEraPi5vHvbfJBRpd5h0L+3kD/B8SQnD3dmFaxIgqZHH6Kua4GKcpff7tC7bgyPPdy5a0yS10agFBqvIKFwqNUyI9Q8TMwoGE26Bmtk7+/Pv7OiYCT34znMRWpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljVtTYYk; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljVtTYYk"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2f0ad52830cso10485754eec.1
        for <arm-scmi@vger.kernel.org>; Wed, 13 May 2026 11:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778696844; x=1779301644; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mKJozyiXPAnQIsv7H4f79u/+ZUVGgrXC9SUuc+YMN9A=;
        b=ljVtTYYkSIjLVTuxIcZsyq14SxBn+lld8q4T+BAfKaunDYIxdmHD6rpbNhBpqKUrTS
         JOy4RxfUQPiNRM4OeBuQ6JbUaOMFYYueIVpZyXRPZ4M+5CphViVFr52yzPfq3BnarQX+
         3cU2gDA9iFB5rfhgGdbBw4fQ35j8sNds4/93YKx3bGD5GjWxNSP0/TqA5i07kzNNHekw
         JCpPjFtUGLbm+Ab0jKqSrke6SdPW1Ob6d7jIhfsyI65ZKQA0SaOofeTB48fzUEJna3rr
         Pkrbzmf1VX6FKaTxQii1tDXPW3v5qmHKDYi75BxAQovFfxrwgqY6g9IvFyoiwtn9dKsv
         wd0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778696844; x=1779301644;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mKJozyiXPAnQIsv7H4f79u/+ZUVGgrXC9SUuc+YMN9A=;
        b=sMM39SFCT13L58TWOWXCHMbCCxDorL0Yh8brxEVSP5zIJfTvi0n10lE/GKIpNx4XAA
         E3rhQ1V9rT91X4aS1yPY8TjPoam0xSJ0zTbQpPM7zIWqjUEGqlXU4tp9BKyk+WFaZOhk
         J0tyZ0ob9FNPG80ooUKnPaovxeG8BhQW0ikW1fivTjN+RC8tWdparYXKhObqq35sDP1k
         TQfjw8BmiNNWJggmtbQ95ZBY5hEDqOMmgrrq2Y2dFi0Xu//JK6ptZnxo70mRvYdaUvmI
         7riw0QaaILaDQGLD1vtH5ruKOTBMlm8bZ1TUlb2gPfuiz0gAWYgJaLEkkCAtjdagscNV
         LDcw==
X-Forwarded-Encrypted: i=1; AFNElJ/xQ4k5mu4LKQMEWUAdPoXqjflca2VlI09CWVbxY0iDGPyGGvyX+KjxDYwC8mBZ3brnY1f9iNhklQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMrLIYu+L9+CUpmMc3pRu9qK8piqMfBcaTUX830JUtBjYQU0sg
	61SwiA+rPX/I5sWogA5zv4REPd6h7vJgaAErDcwUdepELJQBfLmFXxuq
X-Gm-Gg: Acq92OHbB5AX+Ewq6sLmnetgi6dl4q451xSsD6xJnYF0jYhKDpA8o6ybYtBRG18tuJS
	f3BMP5JGCB4dT4ApHXW2ymVGMMo55r/Vaq/kkW1ZqjzvJ4t2vzd8lIi+lme/VzOT+2IFMLLTP18
	TCxukSfZX+KHmYjm+A2JAwirRua7D2448kMCmzO37W3npekINYRRFwa9Oaa3xT0twi+KbnJwxIX
	F9GHaXhgSZSuXQKkAYFQsRyezF+BkXFzLKZXyjh1x1V8vpGhEldCcMZPUoOh8NKL0BqXIhijzp3
	VJXN8VMcR0q/2ReQhatO+bMRkP+FzF9U0h0s9e6yoZdGq3SJUEm0ziZRPPwjeas/3Pv4g+AXVnV
	FNX5HinUVWUs1hb1iXBi7kCcEeBmmSSOcgOUw4FO1eUQb8frfsjKP6CTEy/SwZu1vpaoYNAe+bD
	PgQ+MNGdZK3raz0l6VCR/8m4la9fRMUXOBlKpX24twKEgkdIh5Dlta0ajXSIGV7cS0TlmuYxcc
X-Received: by 2002:a05:7301:7c0c:b0:2c5:60d0:702e with SMTP id 5a478bee46e88-3011996d245mr2563952eec.18.1778696843940;
        Wed, 13 May 2026 11:27:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e3e285sm27544171eec.27.2026.05.13.11.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 11:27:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1f2fb1de-ebc8-40ef-ac53-3348499295e3@roeck-us.net>
Date: Wed, 13 May 2026 11:27:21 -0700
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] scmi: Log client subsystem entity counts
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Alex Tran <alex.tran@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jyoti Bhayana <jbhayana@google.com>, Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Linus Walleij <linusw@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
 <agS8udcvqgQmiqB4@ashevche-desk.local>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <agS8udcvqgQmiqB4@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/26 11:02, Andy Shevchenko wrote:
> +Greg (I believe the trend is to drop such messages and not add them [back]?)
> 

Is there some common guidance on this ? I'd be all for dropping messages
instead of adding them, but there seems to be a perpetual battle between
people who want to log everything and people concerned about logging noise.
As maintainer I always seem to be stuck between those two camps.

Guenter

> On Wed, May 13, 2026 at 09:44:18AM -0700, Alex Tran wrote:
>> SCMI client drivers do not consistently log the number of supported
>> entities discovered from firmware. This information is useful during
>> debugging because it shows which domains or resources were exposed by
>> firmware during probe.
>>
>> Add logging of the number of supported entities to the SCMI cpufreq,
>> pinctrl, reset, hwmon, and powercap client drivers after a successful
>> probe. This aligns these drivers with the existing logging in the SCMI
>> power and performance domain drivers.
> 

