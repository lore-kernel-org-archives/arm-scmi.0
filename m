Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8725F23BF88
	for <arm-scmi@vger.kernel.org>; Tue,  8 Apr 2025 05:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744091710; cv=none; b=iV2gJuDjNwCC4h//TRLPKd8znYIK59mHfiTCTTYX01nQl+baNjfno6Tj+v1XP+4z5Rv5dnGZF3DVgupzXwOjjoEoVBIm+koG8PQfP0a70FWcTMcw59myKyne4DlA7jnunt+hf0gOuPkxxnNc95OCTnC1OJwSMlBadCb49MWTjus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744091710; c=relaxed/simple;
	bh=EufmTM1zhzstYC870JF6VYLrqWC1C32Ol14xs1Bdbk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KEEEoEIU2A3QkbrbSTRhEzaZLOIk4s320SJNCOk3si3x0Nrbh1zojhKfkFEAB2O2CoCTYKJu9XhmQiTw4HkmnETb6lQayoHkvWxLmx028z1QMUmgYohYceSDLGmfxM00rINXTd80rcKILWM7T5fUcA30vZ/O7l2qGVWhdzMRXrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hn7nsySc; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hn7nsySc"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736c1cf75e4so4350057b3a.2
        for <arm-scmi@vger.kernel.org>; Mon, 07 Apr 2025 22:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744091708; x=1744696508; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5NB0nHoebXQJILemQcp89vOlxV4NeZBSLk4VRg3eTpU=;
        b=Hn7nsyScn9UBTXghNDxMP3oaTlyb3ApH0kJG3zL+Wm4+uJfJBboOPfrG1uIcasuWXP
         9J5+0hHiRqfPEcpVUdh9/8LV0Hipu4JHMUal4lJANhQAkl28lIb0LAxHum8nWqxlVLQ6
         Tg/w4l5iIY92RI8NvZY4wFQyUje1jOEZqLwEh/PVXdJeq5zjn5GCHMsEWv3TxBwLIt7/
         JUiUKF0EOvf3Gz5K2zqzIhVCxn3Qz3k0pI+8W6DZp0FJ49Z1lVbHRRwdyPJovqKoLNM0
         o6z3EWwFOZMP4xJpUjnwN0s9ysnUUGfWaw8ga8HxwJfXTbJQdKDSqkyGbpvjo0Vh47QE
         01TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744091708; x=1744696508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5NB0nHoebXQJILemQcp89vOlxV4NeZBSLk4VRg3eTpU=;
        b=r8TY04n/VA+Y6CcvSTA7wqPig0pce/zTmu3QHOyhZ9xTjEQjm/qJUxMZI5EwOzUAsV
         H4MwDJZKreqlrA02Gj1LsRUss6ED8S5GD411oW7IsgPAadNIioNhY9voa8MWgNGvB6Pc
         i8xNzGpsHH8WOxUjC6Cs/Nsecp/shvFA6UYWw9K06dkLuqENB0BVrUE6m39l38TdAOFD
         aUnwbVtjHANYICvs78SuqY1vbiYAYECWg1woLBpAK4qB9s696nurO+RW+FrlmTVxAhlS
         XbzWo6+09h1pz4e9hcjdNfeWc6WRaDM58ysO3Ytz8ejZqC0gwCcRrSqiEf2heSw5tPBs
         zffg==
X-Forwarded-Encrypted: i=1; AJvYcCVgYXO5r1FLjhADC+G0H6+DMh8P+CRLYBAUFjiuwlbB1PyWoL6/JqKfQPCb3wWwxtL9opoEj86huA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn8DWsa1U9aOtHXux3GH40CPLTpg1GN3pePSJDbQHHg0Q0wxu/
	bybg5KP4WN8/iezNAvD0kEXNF3UBaExIcSzhN/I5NJIeT/PlHzsipzHKLjC8GgQ=
X-Gm-Gg: ASbGncuXYM3WQHc/zalFr0mRbpa0w/GQd9be+DBiGYEtzRBC38veDm0vE6AbEjuydOU
	icOI+28BO3LvFfFdIxL6fWEyAL0DYm+NJMTQ9hcGoaaEzje89DRuLyqCxNMFr0U1atQyMZ1g5mW
	2vBKmG/LMjFVAeeCA2XoTmOltg0v2Ei1zkmChtUd1bClhG5ODbg7haEDygUDrMZe1x19Q/iTDJW
	pek9FIn9fylb06+SnylztuMbtWpF8NysvMMsGBEmiDQ7nfPExc7WDcFWheE7IEGk3MSfpRJBjhP
	uNkcKr2ez0JOUupn4dEacOxAarAcxD+tPvIi9dwv1v9muA==
X-Google-Smtp-Source: AGHT+IH8/8MnEU5W15/zDVbhBHdpldSTqXJSklAXnGqc4WwlEqny15brb73QCGi2KHBhsKrotrm3cw==
X-Received: by 2002:a05:6a21:6f01:b0:1f5:7353:c303 with SMTP id adf61e73a8af0-20107efef49mr21361016637.11.1744091707768;
        Mon, 07 Apr 2025 22:55:07 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9ea0985sm9951195b3a.104.2025.04.07.22.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 22:55:07 -0700 (PDT)
Date: Tue, 8 Apr 2025 11:25:05 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Henry Martin <bsdhenrymartin@gmail.com>, cristian.marussi@arm.com,
	rafael@kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] cpufreq: scmi: Fix null-ptr-deref in
 scmi_cpufreq_get_rate()
Message-ID: <20250408055505.oked4a3drsym46wz@vireshk-i7>
References: <20250405055447.73925-1-bsdhenrymartin@gmail.com>
 <20250407-wondrous-turtle-of-foundation-e92250@sudeepholla>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-wondrous-turtle-of-foundation-e92250@sudeepholla>

On 07-04-25, 12:30, Sudeep Holla wrote:
> On Sat, Apr 05, 2025 at 01:54:47PM +0800, Henry Martin wrote:
> > cpufreq_cpu_get_raw() can return NULL when the target CPU is not present
> > in the policy->cpus mask. scmi_cpufreq_get_rate() does not check for
> > this case, which results in a NULL pointer dereference.
> > 
> > Add NULL check after cpufreq_cpu_get_raw() to prevent this issue.
> > 
> > Fixes: 99d6bdf33877 ("cpufreq: add support for CPU DVFS based on SCMI message protocol")
> > Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> > ---
> >  drivers/cpufreq/scmi-cpufreq.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
> > index c310aeebc8f3..c735f39245bf 100644
> > --- a/drivers/cpufreq/scmi-cpufreq.c
> > +++ b/drivers/cpufreq/scmi-cpufreq.c
> > @@ -37,11 +37,17 @@ static struct cpufreq_driver scmi_cpufreq_driver;
> >  
> >  static unsigned int scmi_cpufreq_get_rate(unsigned int cpu)
> >  {
> > -	struct cpufreq_policy *policy = cpufreq_cpu_get_raw(cpu);
> > -	struct scmi_data *priv = policy->driver_data;
> > +	struct cpufreq_policy *policy;
> > +	struct scmi_data *priv;
> >  	unsigned long rate;
> >  	int ret;
> >  
> > +	policy = cpufreq_cpu_get_raw(cpu);
> > +	if (!policy)
> 
> How about `if (unlikely(!policy))` instead ?

Henry, this change applies to all the patches you have sent. Also please send
them as a single series, as they are related changes.

-- 
viresh
