Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667A02010E1
	for <arm-scmi@vger.kernel.org>; Thu, 23 Jan 2025 13:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737637462; cv=none; b=Y5WADLa9OKUj65oJhUlFAJ/6z8rhHVZr5BrqstAK1cZJsWJ5nzmk6RbzjwQlwewLmRwK+wasGtZUWImPyYgLfjLwhMIPR/PH1Lrtt2dksfVihBVeUCUzp5TiLKsHvja6AVW8ebFGVMzm0hotZnZEQf2mpPfb60YwY9t2/hQkEho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737637462; c=relaxed/simple;
	bh=Vdzu+Fwt06yiMZfjE+22PPXLLqoNKYmCMWOlFKYGS6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RqgEaUO0/XpzwAZYPLRcY9TIbvsLae5WIo5LtXAUK/wPJ2garVuN1kRBxMBNnwt0B/TWj9ZTQaLhceuHVNTq9DFgcL/Ck2MKkBDUckX7UU2g5WnKZt+NBHTgu74GpXsvpkjJk3oF/dIMXyC7zDpsPKi+nWJP25KllrD5C4pSB+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FdEYTTYD; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FdEYTTYD"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-436a39e4891so5840995e9.1
        for <arm-scmi@vger.kernel.org>; Thu, 23 Jan 2025 05:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737637457; x=1738242257; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cl9194DFZdwJ8whugEX9MZlsEcPw/nky6ZU9/dikYFM=;
        b=FdEYTTYDEvniTcg2CeNDFuMCP8sA5IQQm4JVQyPUHDf0Rn49AmAORdaJKWnDRexbit
         s9FmLHg2XPaY6dRoWLY1fuewXkOHQuKCrzL7DM8ziTZHVVpmu+t3i1XQ6dLujnY4pDSv
         VbPQ3FrnBCF+PtYXTdzasMk/bR2Hhbv1X5j92SQxrfhhXLTZ4xgVaAJ+NsDZfY1iFAW1
         ebfsvmg+r5awbAPdhoNHTaPK9pq1YwUmH5JfJHgrF31/x/NEXIUu0vLid8brb6xrPCum
         jowWsZt2AcbRb5YcFd33e12i5Gm4poGVk2CDaGRCDWRhndVbbk+csA2PtGvYnk7D1WDJ
         bHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737637458; x=1738242258;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cl9194DFZdwJ8whugEX9MZlsEcPw/nky6ZU9/dikYFM=;
        b=VkfslKBM7dXjvWDfGfxVRc0h0NTP8pqMA7QO7/0+1PzrdXZUO9iQoIWWc0xXSz7EIS
         cBVSr963umhXqBNJrO1OWKI98eR+ua61ayqe+BP7ascE6Wl3DnRmuOroyDFypsKn9Wg3
         Qikm7JECn027RcajrzJO6twEkzdYdzBHqQZJSqDxG0srzNwf4nmSVnSlY1zhl6urwfZ6
         wdS4hFwmAEjPBb8ppxhcjEq6tlMDHLQBAuXmMVkKU8tSXjUYz1Suq66oWZ+gDyNUKKjC
         r7uJikBErWlGrBg/vOiae3dQvDupT9uBU184IfDUXNI6HcbhNKaeDnIYbcMkwLtRw1tM
         W9yA==
X-Forwarded-Encrypted: i=1; AJvYcCX6b0gOH4aFvdsLvMtpmewM6TiqW30T8tYbz7Nnyw7mj1zgwEOXnTHLBdz2/rrDIYPNRScCM1ISwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPxbapW/5/Oo/4As141M0+OofdMJs1rvHZ1wyFrcuGAdy256wt
	muN0AAECIjp4oh9hT3e4JKOIt8CObMOs65g7sm5fIfnzJvZbaGmhNDYDM4Izsh4=
X-Gm-Gg: ASbGncuqVnI9mD5wEyEER4AGfV6hxYHcBKrmZD8hfVwI4B5ynUqAVFahOPzjSjAvl+X
	VkG/m8C/H9Hd+HThyj8VMGDukHbMHu/GN+X1xoO8P+k+ODc8X/90jDLnYykepK6ZFlHCJM4aCK0
	OpJAJh1+fwehM3nFV20iCumX3rMfHstWbpCnblYL1Kje1+fzOuomHNgvlcP6aADpxkY39uqKshX
	HHd+qTAY1hwoiqMiZ6JiE5T6JUDpaBWwMDNfyJKaNKQxf/uYiNhpCc2BD59W3GZx/3VOBIIqWxa
	vW4Kj+TuP77mUpyKabvf
X-Google-Smtp-Source: AGHT+IFfMaV0Ij3T3tldLauIZsdbGiEdyirSW5JG2BohSSJNY2hQK3fqNX1SRxOVtDQ4hJ9zH+XqLQ==
X-Received: by 2002:a05:600c:3d06:b0:434:eb73:b0c0 with SMTP id 5b1f17b1804b1-438913c7e31mr266934345e9.5.1737637457469;
        Thu, 23 Jan 2025 05:04:17 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31afa30sm64090025e9.20.2025.01.23.05.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 05:04:16 -0800 (PST)
Date: Thu, 23 Jan 2025 16:04:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: zuoqian <zuoqian113@gmail.com>,
	Ionela Voinescu <ionela.voinescu@arm.com>, rafael@kernel.org,
	viresh.kumar@linaro.org, cristian.marussi@arm.com,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: scpi: compare against frequency instead of rate
Message-ID: <8ebf8f26-c3d9-43c0-b417-ce3131a84eb4@stanley.mountain>
References: <20250123075321.4442-1-zuoqian113@gmail.com>
 <ad11dfc1-5e88-4421-b427-3955d4220133@stanley.mountain>
 <Z5IzMhTOhtujyH0n@bogus>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5IzMhTOhtujyH0n@bogus>

On Thu, Jan 23, 2025 at 12:16:50PM +0000, Sudeep Holla wrote:
> (for some reason I don't have the original email)
> 
> On Thu, Jan 23, 2025 at 02:12:14PM +0300, Dan Carpenter wrote:
> > On Thu, Jan 23, 2025 at 07:53:20AM +0000, zuoqian wrote:
> > > The CPU rate from clk_get_rate() may not be divisible by 1000
> > > (e.g., 133333333). But the rate calculated from frequency is always
> > > divisible by 1000 (e.g., 133333000).
> > > Comparing the rate causes a warning during CPU scaling:
> > > "cpufreq: __target_index: Failed to change cpu frequency: -5".
> > > When we choose to compare frequency here, the issue does not occur.
> > > 
> > > Signed-off-by: zuoqian <zuoqian113@gmail.com>
> > > ---
> > >  drivers/cpufreq/scpi-cpufreq.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/cpufreq/scpi-cpufreq.c b/drivers/cpufreq/scpi-cpufreq.c
> > > index cd89c1b9832c..3bff4bb5ab4a 100644
> > > --- a/drivers/cpufreq/scpi-cpufreq.c
> > > +++ b/drivers/cpufreq/scpi-cpufreq.c
> > > @@ -39,8 +39,9 @@ static unsigned int scpi_cpufreq_get_rate(unsigned int cpu)
> > >  static int
> > >  scpi_cpufreq_set_target(struct cpufreq_policy *policy, unsigned int index)
> > >  {
> > > -	u64 rate = policy->freq_table[index].frequency * 1000;
> > 
> > policy->freq_table[index].frequency is a u32 so in this original
> > calculation, even though "rate" is declared as a u64, it can't actually
> > be more than UINT_MAX.
> >
> 
> Agreed and understood.
> 
> > > +	unsigned long freq = policy->freq_table[index].frequency;
> > >  	struct scpi_data *priv = policy->driver_data;
> > > +	u64 rate = freq * 1000;
> >
> > So you've fixed this by casting policy->freq_table[index].frequency
> > to unsigned long, which fixes the problem on 64bit systems but it still
> > remains on 32bit systems.  It would be better to declare freq as a u64.
> >
> 
> Just trying to understand if that matters. freq is in kHz as copied
> from policy->freq_table[index].frequency and we compare it with
> kHZ below as the obtained clock rate is divided by 1000. What am I
> missing ? If it helps, it can be renamed as freq_in_khz and even keep
> it as "unsigned int" as in struct cpufreq_frequency_table.
> 


I misunderstood the integer overflow bug because I read too much into the
fact that "rate" was declared as a u64.  It would have been fine to
declare it as a unsigned long.  The cpufreq internals don't support
anything more than ULONG_MAX.  I have heard someone say that new systems
are bumping up against the 4GHz limit but presumably that would only be
high end 64bit systems, not old 32bit system.

The ->freq_table[] frequency is in kHz so a u32 is fine.  I guess if we
get frequencies of a THz then we'll have to update that.  But when we
convert to Hz then we need a cast to avoid an integer overflow for systems
which are over the 4GHz boundary.

	unsigned long rate = (unsigned long)khz * 1000;

The second bug is that we need to compare kHz instead of Hz and that's
straight forward.

regards,
dan carpenter

