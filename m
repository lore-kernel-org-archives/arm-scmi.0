Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7BC275AE1
	for <arm-scmi@vger.kernel.org>; Mon, 18 Aug 2025 06:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755499010; cv=none; b=vBAp7jLD7+6UwuhU6o46jJCwXMHTGHHmZu7aPT2fGGqAVIRDEvGNFUlBWE9NmVbLOjFte9lYDCYppBjtcA/2HnR/sDJIiudspeb9f0TMEw7kUck0C1k0iH8+f35ymzbM7dIaD/1WXZclCa8efGM09nV4i2qiO0kZmhKNz3YF0Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755499010; c=relaxed/simple;
	bh=oSh2xMD6SdqqzF+XVFnBtlL5vvi05VvJwkUWiT94P4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RS/R0ZoxN/BC9vHU1Hpcequs2jdesetboS7xFeswgXpLxBLKYxsbDBQWL7SvgpCv2chch0Pbjv5jUBxUeoJHJzo3ywuMCDFmreuA3DgyUYOx14zydYxG8+qhxYl3tPSdhVd3xts01kFiL9XSTJbX5JxLGf0p1pMbMxwF0kTkWSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mXfp/1cn; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mXfp/1cn"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-76e2eb6d07bso3228925b3a.3
        for <arm-scmi@vger.kernel.org>; Sun, 17 Aug 2025 23:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755499007; x=1756103807; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9rjhO/M0uTmlNPmuFaEm9QTozYRIwsNGmKagEyX9yMU=;
        b=mXfp/1cncNhAhS+pN3BLnKDRBw+Y8ZlYatsJJcPgeUpSWzwJy8aZWdXH02mmYMSGJJ
         SV90hQfxjLKxQ1bZMeFQ0Kn9xk49egsUqM/KyWUuduN+XT4vudPeH0RUvtMqNJAv/MLe
         KaQPJsBJyPHW6h4OCheA9bm1YAnB1YIj3prnWw6jnUkSDRqGPcmgErFjKsiZ6PHAi4FK
         WPEAcQuEv4Y7+GhhGFulyHu3nXiR94Oyw0MVhiKVjxNJGg//DNugSn6UV3mKavCsJ/jX
         uXB7XvEDXJc2L+NuLHMRQiNkCCgThg1y45LAwG/Bsji3WfxFHr13lKON9LGU8oxuDltf
         X+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755499007; x=1756103807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rjhO/M0uTmlNPmuFaEm9QTozYRIwsNGmKagEyX9yMU=;
        b=RFxATeh6+qbKUmOz3R2r1OJgpLHfA+JfbMvJKDpj0mn4N+lVEz3HFwzc2cpUa1fPgE
         xFSJUfch2Xtp9Lt0F8Riz0esCVP94Ms69bY2cUTOZwlGYg8Bw7T6lixYgUF9qNu4CcoZ
         3x9Jc//1EIsirhM5gx8b1DRe86wbFtycUi2/JLxcpCs6qktTzmPrhInSEBADcbqFNpjS
         EN/7g0MKRXuQrmfywB6pjWTNJbFx86AC2UYkbzNY8ElubdrXDHKp9MVh7Yyy35KmYGWe
         hWr7LIj6wqLlDSDyW5+zxOzocbixLW40h/gbfRx4qM+lXh4gr7EOtvcM19gjKJrXU78n
         9w9w==
X-Forwarded-Encrypted: i=1; AJvYcCX2UpiLfCbSnUe1m8fHu6Py2Kb1UrHBwtOoWJMMfX5jnMUEDkgPwK1mi8vWV94W2Y196bPPZ2OcYA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy8o6LZn3eS1BGyxarpcmiKZj1Mei715NloA8wxwu4H3VSHumh
	dsMZFjaHjbC8GTDAteZWkoFRyZTpgLogwHDh5/pjQ8wI3AnNqlNO1UCq68dqF1g+Lnk=
X-Gm-Gg: ASbGncuKfey/7fW7NoukJ1p9RReRRFun0leJBvZeaX7iwhSkQJZI3ny4AzMyIm7fRjn
	/W/MnwSVYuanoksrKRtKZ9pgHPp7R5/mGpBEe2csiRQXfQJoo4rhggfzu9m719ssCykHG9xIaeH
	+5ibvtRcEafGYiE9xD+zzcT4jNJZGmJ1cGedVCpDMNjcAQ0Pz/Jc5/Dy5pYpgIDFhvduBful9Nf
	kxY6OE1Vcp7jwQm/ro7SVHDewzL9haNcmFl0/IeS1FBf7xTAF/aa6Ur0Bcuu1CHK1Ws6FfYYsm6
	UveFXu/Lwy+exab4ZTgqq3fp247In8tpx7URo36aTUuKlvTvS30MArG98pyftQSCstUcGbwfnIQ
	dqBPCoNLxt4JH8rSaMpbzsCwJ
X-Google-Smtp-Source: AGHT+IH8gijQo2HWWMh8yIAt8KnRnmfELcFQEuxNNsjzrP85ncTsOlSt0lA4KoypNRAozLwoHQfe2g==
X-Received: by 2002:a05:6a20:4323:b0:240:50d:4285 with SMTP id adf61e73a8af0-240e63dd588mr12345211637.38.1755499006972;
        Sun, 17 Aug 2025 23:36:46 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d799c8csm7203728a12.55.2025.08.17.23.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 23:36:46 -0700 (PDT)
Date: Mon, 18 Aug 2025 12:06:44 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, james.quinlan@broadcom.com,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Mike Tipton <quic_mdtipton@quicinc.com>,
	Peng Fan <peng.fan@nxp.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2] cpufreq: scmi: Account for malformed DT in
 scmi_dev_used_by_cpus()
Message-ID: <20250818063644.kbzbj7q7a2s4snur@vireshk-i7>
References: <20250815205714.1545571-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815205714.1545571-1-florian.fainelli@broadcom.com>

On 15-08-25, 13:57, Florian Fainelli wrote:
> Broadcom STB platforms were early adopters of the SCMI framework and as
> a result, not all deployed systems have a Device Tree entry where SCMI
> protocol 0x13 (PERFORMANCE) is declared as a clock provider, nor are the
> CPU Device Tree node(s) referencing protocol 0x13 as their clock
> provider.
> 
> For those platforms, we allow the checks done by scmi_dev_used_by_cpus()
> to continue, and in the event of not having done an early return, we key
> off the documented compatible string and give them a pass to continue to
> use scmi-cpufreq.
> 
> Fixes: 6c9bb8692272 ("cpufreq: scmi: Skip SCMI devices that aren't used by the CPUs")
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
> Changes in v2:
> 
> - do not leverage the SCMI quirks framework which in spirit is for
>   dealing with SCMI firmware implementations, this right here,
>   specifically pertains to an older Device Tree. This also makes it
>   easier to backport that change into stable trees where the commit in
>   the Fixes tag is already present. There is no dependency upon the
>   presence of the SCMI quirks framework
> 
>  drivers/cpufreq/scmi-cpufreq.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
> index ef078426bfd5..9df4d968fdac 100644
> --- a/drivers/cpufreq/scmi-cpufreq.c
> +++ b/drivers/cpufreq/scmi-cpufreq.c
> @@ -15,6 +15,7 @@
>  #include <linux/energy_model.h>
>  #include <linux/export.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/pm_opp.h>
>  #include <linux/pm_qos.h>
>  #include <linux/slab.h>
> @@ -424,6 +425,14 @@ static bool scmi_dev_used_by_cpus(struct device *scmi_dev)
>  			return true;
>  	}
>  
> +	/* Older Broadcom STB chips had a "clocks" property for CPU node(s)

Incorrect multi-line comment format.

> +	 * that did not match the SCMI performance protocol node, if we got
> +	 * there, it means we had such an older Device Tree, therefore return
> +	 * true to preserve backwards compatibility.
> +	 */

-- 
viresh
