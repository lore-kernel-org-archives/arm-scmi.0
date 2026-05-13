Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AFB38837D
	for <arm-scmi@vger.kernel.org>; Wed, 13 May 2026 16:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778690847; cv=none; b=bqU/eBxjlh6UhWpmNnR4B1+VtwC73UeeqYqdPHd79sDM7gIdgjlo4CMXfA5x/2KLmdam1t+FLFqHmt464vRLUcBoeoFmN8T90ruSVxuUSibrRaQ75fw65DYvBdG67zwNgcgTwPExRjZrAvUxCsr/cTJ/qc44GLzi6SH7MlAchjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778690847; c=relaxed/simple;
	bh=NerSUWdybRrwdgojMfzjf9po47ymq2rVDn6nwavryEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rAQzLZHxUUFwCOmJJ0R+GdV0Wj8BfQLBZCqRdnXHXcHxkwmz53XQkyjzoXivkhl8mkfFcY9ll2UaaVCpv0xmaPFP43/IoFj0lEOWMEOeUp7CTclO8zz4UFalXbr9wr+NA+JRuXzTfXqdnYvni0u3lCYdy2vgh4f9+29bl5kwyuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tI8yM+lH; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tI8yM+lH"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1332772f6b3so5134032c88.1
        for <arm-scmi@vger.kernel.org>; Wed, 13 May 2026 09:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778690845; x=1779295645; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=73hvPWQ+wdtYrhL6I0NsaqzzCZ8hyWVDUJfnT/gOLyE=;
        b=tI8yM+lHuZ/dYtGzuqCED32vTIsPRUY8FN0+2gLpA3b3cmizz2yIU9luqnsQmwyMTg
         6u1w321VgPE4YSQ3CnSc0Rlfpztq5bfQB7pVdjquKUkBQNHwnDxoh3ZushRC5ZFSbNia
         DH+/+OpPgb+rrsWUsbQ1ilX0b2E9sh0lmcCnZcfxLTaVqtGGRSH8Pk/dymNTrRZKmXoQ
         YnhIVx/12aZohZNSjffU0/pIR+NMYeIG4TCOxsyg4xMupYoqjosXTwtcGXcFJpNPxKGy
         +KcCBX1I4Ef2UpZAnJh4mmvbO1kauRtIaBCVxAzb0lWqyAPhUHMdD5Jn4rttJKtxojmf
         2gog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778690845; x=1779295645;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=73hvPWQ+wdtYrhL6I0NsaqzzCZ8hyWVDUJfnT/gOLyE=;
        b=NL3RHwF0ot4pa+q/QiURJbuN7OU7nYAgTWIf48Du1fbOc3U+dCItgDGpglaYWJbozY
         7Eq0eGVdpa6ZrdTwRpCY5uy8xvJJdkRrry2L0gwwI8HC4DweZoTBzP3iyjxGqVArtBW9
         5Yk5I17YBtlyvIeuRByyvAI3NXdszPAjl1rZzMfPTKgpyAVwWJYK3bG7XHvruzHJOWND
         cUJL2Zr7LDbH+RMHpsNEXW0IJbkT5nN9EKZym70MCQVKbYdncad/7QDWAYLMM020jPo9
         m9FtibJi2kxzCm1j2+pscbwSKnYpi+UTsurGU465e/gAzTQPhhDbTbmeEdMFaUOaOqls
         AW1w==
X-Forwarded-Encrypted: i=1; AFNElJ9L9yH31Y/XYxHvmSE24cE0Fqb8GnGfMf+il6CxP3dFx0s4zrp70WBuX/3Vh1A+8kltLLIzI9bE9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyI9F1LAvTWu/gua3nqd84sTqZCBS34cqMWEEgiWRrsm54NfJ69
	flqNBrG+3VuNwxmCAk6/kSN6+RZo4DUXTM3iWLPToSJ+UKhGNcD7VoJF
X-Gm-Gg: Acq92OH4TP7Op93BB+FUd7MEDlx002ogGcannvRcgDNnJEuuNkxAk3XPJsOdmMtj1HH
	F0G1AbeBds1e32BnfYTi4tRonRL74qXxv3743OMZq2QUrrFbzIEaUrrJWDY2w43GBPNjJkwbC+6
	pbw3kej/1/ClMxaXfZv9o7yLngy9zvPNr2ClLRLUlKZrA1Mfpxq+TbVIef221sJsGX31lXBXx3h
	V/HaRMx7NveiFy95Jx6bycKPBP6zuMY9eMjwOIgVx2wmsI2XrofJWkvJ3eHVaqYPdEcXIAofbDl
	1P8tfsK8wWnDWLcCYvfqh5E7jzzcDLS739pbdUdwkUrhaKVgkAj7kTk1v2daRrC5EV5MXYL3HtW
	PJGSWjM2mOotsiI6BS+cyTCc+FlKuaX4EbL9a0pFesfD+Yay4EuN7ok4xeaC4puEo6nVJwlIjRl
	BFeqV/3OTvkQiovUW+gGI6FGwpM3Etd5KVmI3+HUyEFF+PRKe0t0VaW9VpoR04RTtF9EF9HbK4
X-Received: by 2002:a05:7022:6b96:b0:128:d20a:2f40 with SMTP id a92af1059eb24-1342ef3d94amr2693546c88.8.1778690844483;
        Wed, 13 May 2026 09:47:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1327865955fsm30303483c88.11.2026.05.13.09.47.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 09:47:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <632c1bf4-0f3b-4ed8-a6a2-fc102fc7601c@roeck-us.net>
Date: Wed, 13 May 2026 09:47:22 -0700
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] hwmon: scmi-hwmon: Log number of sensors
To: Alex Tran <alex.tran@oss.qualcomm.com>,
 Jyoti Bhayana <jbhayana@google.com>, Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Linus Walleij <linusw@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-hwmon@vger.kernel.org
References: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
 <20260513-scmi-client-probe-log-v1-3-00b47b1be009@oss.qualcomm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260513-scmi-client-probe-log-v1-3-00b47b1be009@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/26 09:44, Alex Tran wrote:
> The SCMI hwmon driver does not currently report how many sensors were
> discovered from firmware during probe. This makes it harder to confirm
> the firmware exposed sensor resources during debugging.
                                         ^^^^^^^^^^^^^^^^

Then please use dev_dbg().

Thanks,
Guenter

> 
> Log the sensor count after a successful probe, aligning the driver with
> the existing SCMI client driver logging pattern.
> 
> Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
> ---
>   drivers/hwmon/scmi-hwmon.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwmon/scmi-hwmon.c b/drivers/hwmon/scmi-hwmon.c
> index eec223d174c0..6f1b0559d5c2 100644
> --- a/drivers/hwmon/scmi-hwmon.c
> +++ b/drivers/hwmon/scmi-hwmon.c
> @@ -362,6 +362,7 @@ static int scmi_hwmon_probe(struct scmi_device *sdev)
>   		}
>   	}
>   
> +	dev_info(dev, "Initialized %d sensors\n", nr_sensors);
>   	return 0;
>   }
>   
> 

