Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1966331EA8
	for <arm-scmi@vger.kernel.org>; Thu, 30 Jul 2026 02:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785380047; cv=none; b=n3pUpftULeC3iEOH2X8NskPSFAMXQkRPotZ43+f6FKdExxCmA594iz5fEf0L7TzgSlUTp+PMxCiDDGFP5Vxk9fJ0+E7Juo13DDu/DoDVnfh7+6PRQEQL3DMYJWIJ2Dy6VBUjepqDWNRLIqPcRrc5Qs0TaXceSmlwZ4IPHO7Zk0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785380047; c=relaxed/simple;
	bh=PfYmxf5/8ZNEUvp8941gHzqvWQ8pIHtxdg/I/Gj1QE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RTpwsfi3E2tVur8kOYUbQolIztHB+xJS/SNHzJc/uqHyjnDDeu0zPKcSyl5HUGNsKULzgrvqGPkTJmtiR1G1hgi5AqF5rA2Aqk/yaVT6VoiyfefNLy3ynmK7HMWaw6xzqLa7wvlUUit1tTPqj3UyBoNDVAEiOuSwwi1M/rjsRu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eS11Z9Wf; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eS11Z9Wf"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8486ac3f347so314412b3a.1
        for <arm-scmi@vger.kernel.org>; Wed, 29 Jul 2026 19:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785380045; x=1785984845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DvhzTaFF4mKlbah7teVvLdI5FxseT4MERMwxNhSA5W8=;
        b=eS11Z9WfBNnAHopTfKLuON4fepIWROYTQ2VnL38f96Z4xq7925AWbiI5RBwz87qDch
         YPv0YF/Fm+eNgPvMrHBHOgqJ6sjYnOkbA7VYmUzk/pg7XtNaYssGV1gGGDGj87VLsvcP
         Hkl+vspqhlIO+sTU5UpztWZ7gn1uBFBep7eoysqFh+9n+B2frU0Fi+LsZnjqrKRA3QcB
         3VW7S5ljgFv/7Zs+qQtDmBa8gYRwtN3TpsmsFD3zHiSaTQbdHVOJBE7bJkxgwoWqzclE
         flDHjy/N5N9HmHIuspxuqmsxFJ+hzC/QLadBg1yGeZDbdgJWsEy1vTIPLX60LHCywEEZ
         jJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785380045; x=1785984845;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DvhzTaFF4mKlbah7teVvLdI5FxseT4MERMwxNhSA5W8=;
        b=KJV3KywR0I3kQ/vdfQqz+ne/5aVPH8RC1DkO2B7L0QBogbRnnlEK+PVM7byfrhR+1c
         Czx7jL9zxfot5oXOUjSo/CGqUvQxmPNHRmz8gdQPqPMP0xbJmKVqqn1bcXfZBRkqGKMR
         p2PcxtOubRtB1TmDT8w15kk6DFYR7tRMCbCC9zrlDj5ZC28scGQzNyDdXc0YqeYK/k72
         3dtvD7Kg/Z6nSFG1j6RqVUhfs57sxQQrkb7F5IurgxnoBimdRi+MPbChmmf+hSmdLZYJ
         A01RtNNLXOVtFABGr/lgKzXvswyuaUktwVeIioAKkG4IFGBlZyVyDJc0LqwDAZ5qPQDw
         rgzQ==
X-Forwarded-Encrypted: i=1; AHgh+RonSc8xciAs+GFpDQvMM5Px80Ddr1OSgZIza/1zrrU2IUomQSHrWRDrng8d37eMOJAt/JY52folBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdWUNS51lJUDZ7tXvZCVP9wVQI2d+Jcpo47X6eRccyeXK+ptZs
	Pgqr0ae/emIXd3+W4erCpFG+ICkbQQl72hKz7VPEFmICI0rHSwXt9b+9pZrNGQ==
X-Gm-Gg: AR+sD12xt7REpJOC0lz7wfAmOLw3Sp10zzfWpWpXHRW6SeU+YU7aBjQIN8Zm+0i8+5a
	UF/fF4z1KYO7vqHmbzOSASIO74MLoD4lJLqdAcjxw8hh0GgrfkEjkjkZ0lx7jeHxrLvk34D7zY7
	r+kUAZI2XF6hCqrEgj38a8mp4/AKB+JF66zNvVZaP/95WGcS40bA049Ib2YiiF4qEpw4jmzp5eD
	7GVRHKlBdXHLJF2dhbYumQVZJHzL4ghgqkP/LH2bjs8f911BjLbQbTk01E6mYZowIrW4WaHeBKE
	Nz38bn8/lLQVqkLTuUC94GuhzgOFPoYP3fYwEWf/5tdyDGF16WnpC+FSd1AoUE6qxGrkXaW+pUJ
	lnU3qmZFvFau8bdz/zvEQyz7lW8GlI6eFvqRqZ6bDVmKEfzeR4NpQT5tCAQeNpmajsktUZ44vS5
	wgCNb3ds4tjYz0Ci3Gx9rQTqdQbc5icwj9elH+stEp2MEAcH60gIVE2JNumKE2kRH9/U1AgUc2s
	VxBVb7SJSPD0eeutyv4tSvp88pPyxvP2fpuTw==
X-Received: by 2002:a05:6a00:428c:b0:847:9d6c:a56d with SMTP id d2e1a72fcca58-84ebde78871mr496822b3a.12.1785380045338;
        Wed, 29 Jul 2026 19:54:05 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0301b3csm2148213b3a.34.2026.07.29.19.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 19:54:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c175bc7b-aa9a-409e-ba89-b04ecc38dfb7@roeck-us.net>
Date: Wed, 29 Jul 2026 19:54:02 -0700
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] hwmon: remove tautological dependency expressions
 from Kconfig
To: Laszlo Ersek <laszlo.ersek@arm.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Cristian Marussi <cristian.marussi@arm.com>, Heiko Stuebner
 <heiko@sntech.de>, Joel Stanley <joel@jms.id.au>,
 Sudeep Holla <sudeep.holla@kernel.org>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260729215436.2103380-1-laszlo.ersek@arm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260729215436.2103380-1-laszlo.ersek@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/29/26 14:54, Laszlo Ersek wrote:
> Commit 554b3529fe01 ("thermal/drivers/core: Remove the module Kconfig's
> option") [1] obviated some of the "Optional dependencies" (as described in
> "Documentation/kbuild/kconfig-language.rst") in "drivers/hwmon/Kconfig".
> 
> Namely, said commit restricted the valid/possible subset of the full
> Cartesian product "CONFIG_THERMAL x CONFIG_THERMAL_OF" to
> 
>    { (n, n), (y, n), (y, y) }
> 
> through "drivers/thermal/Kconfig". Numerically (using tristate values),
> this set can be expressed as:
> 
>    { (0, 0), (2, 0), (2, 2) }
> 
> Over this set, the "drivers/hwmon/Kconfig" tristate expression
> 
>    THERMAL || !THERMAL_OF
> 
> or equivalently,
> 
>    max(THERMAL, 2-THERMAL_OF)
> 
> invariably evaluates to "y" (2).
> 
> Similarly, with THERMAL having been restricted to
> 
>    { n, y }
> 
> or numerically,
> 
>    { 0, 2 }
> 
> the "drivers/hwmon/Kconfig" tristate expression
> 
>    THERMAL || THERMAL=n
> 
> or equivalently,
> 
>    max(THERMAL, THERMAL=0)
> 
> invariably evaluates to "y" (2). (Note that "THERMAL=0" returns either "y"
> (2) or "n" (0).)
> 
> Commit f37353320ee9 ("hwmon/drivers/core: Simplify complex dependency")
> [2], which is the final commit of the series that [1] is the beginning of,
> cleaned up the hwmon C source code in fact; however, it missed the
> now-collapsed dependencies in Kconfig. At the time of [2], six of today's
> such dependencies were present in Kconfig. Since then, two more have been
> added (such that they persist, anyway): one by commit 4f8d374b770a
> ("hwmon: (max6650) add thermal cooling device capability"), which was
> independent of the above-noted series, and another by commit 9855caf5d4eb
> ("hwmon: add driver for the hwmon parts of qnap-mcu devices"), which was a
> descendant of the series.
> 
> Remove these always-"y" dependencies.
> 

Dependencies such as "THERMAL || THERMAL=n" were supposed to enable the
driver to be built as module or into the kernel if THERMAL=n, and to
force it to be built as module if THERMAL=m. However, both THERMAL
and THERMAL_OF are boolean, so this really does not make sense.

Applied.

Thanks,
Guenter

