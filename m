Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC5D1C6F44
	for <arm-scmi@vger.kernel.org>; Thu, 10 Oct 2024 12:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728564431; cv=none; b=O0HtOJebc2M/i4m+QZgo42tXwT8fV8K4aJRNBptUVKRkQ1hswUPFHmDijG57x+mNqaTpC8T+hnRc/iVuSN/ypKU+fkZuAAdqaCKzQCBGgXSEwWVQLMKKWCqB1ayOhGx/bKt2QmOBndDNnBEKoFP7lwT6Xy1NfF5NC4YMAFfDLN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728564431; c=relaxed/simple;
	bh=H6XoIFOevSL3ECArY/UH+TYLyviH/GlT7zMOpw8Ya4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HPuy+h8A6CHr+72lnZf+b/RpyCnLCKCK/HoGKXd1eGEGNskQKbrWrm2ZHGTBOq0aRsBFnYXUQU5qfbAyPTCOSn9HHZ6xhS994Ww7VUxMTly3NE0QXqlQ8Ne2D+7S616ik5alF5ZFbR8B+e1yNxPgRuaOK+GTbn/tdApyew5o7+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cPsQa1Rr; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cPsQa1Rr"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53992157528so960037e87.2
        for <arm-scmi@vger.kernel.org>; Thu, 10 Oct 2024 05:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728564428; x=1729169228; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jvg90GhUJkEZgFBT4S5OZ3KSFeLvk2senWJrKF/nfbg=;
        b=cPsQa1RrDDO2Y8SgfF1wOgJEcVQx0eKzr9iGh0X3e5o0bgj21I7Rklupj77HOpaSf3
         0JaOBU0kMgMun8PwnEZ8gdnBbES35KBOLVmBn9QrpJ3S1o0heJ+kpAyP11ySXzlfdBs+
         kwg+t6YXf7LJkdFQlP+aM3sxP+7pHpsCEtJdK5OkogvbF88tb8Lu/AITph3gR3ha524E
         emhzttETiim8H4oeTzvMCUWeQlNMOhvVwXM2lH9Bp3b4dLD9+vDDCcsctYFPNgIXhVIl
         l+CuBkIuy2hoV8Fgx4EMnWu5mcoQXreekhu3pLgKy01zNzMbdfibSEqMFJUpW2r72FmU
         Rxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728564428; x=1729169228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvg90GhUJkEZgFBT4S5OZ3KSFeLvk2senWJrKF/nfbg=;
        b=awfpMKUX/LrJozCLIUf/ASqsJxId+FKSpHmP10lyLb5Ipt7jGcUgjDKlDV8UrrYGZj
         FtDozcr4WfwSj3OAPZXK0YkTahv0DzFoTrkF+xaDDZLieiUGmPgPWoy/eNd5qPp5WP09
         AXiJkoFl8qSdmCpRGMBPmi9hFYjdGbRX3qYD94ZsG6wT5vUxezxycA4CN8YsbnVCYih5
         H4q5/2CI5aXEKn4wTTfit4l9mUvQ5QpWj6DwAMb6CXrNnJglU/L9j576rQb5JVtpqKEg
         Pv+XkEYsDlNjsGDzsdmPRTOsXdapZvb/42J3GNIePKa+3NipHm9+VCJg1Ea6IvgI/IoH
         PF5g==
X-Forwarded-Encrypted: i=1; AJvYcCWoQykmqDFrzJtgoKTntavYyAXyUkmHgDEzv8R/7t9y03E05QOOV62q5GPc1H7l+gxNDcCkPx4srQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAVC3SVstBjOGI6wOaw4sP2kEOx22GbCYvKQsTmpvFxuzgeiom
	CL3VEUnZbOU/SaHDLp0qVRR03Pny1RPhTJy678TA7p1Ofb0s077dx/IgVLjZoAs=
X-Google-Smtp-Source: AGHT+IEwUhzG2p8RPIFXKeN4wODP/Ihl371vuyLht7PRhkpddYF7XZr5cr4gcRQ4kIw/DvEG4sP3NA==
X-Received: by 2002:a05:6512:304d:b0:536:54df:bffc with SMTP id 2adb3069b0e04-539c4945be4mr3700627e87.42.1728564427912;
        Thu, 10 Oct 2024 05:47:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb6c1404sm239060e87.31.2024.10.10.05.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 05:47:06 -0700 (PDT)
Date: Thu, 10 Oct 2024 15:47:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com, 
	cristian.marussi@arm.com, jassisinghbrar@gmail.com, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, johan@kernel.org, konradybcio@kernel.org, 
	linux-pm@vger.kernel.org, tstrudel@google.com, rafael@kernel.org, 
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH V3 3/4] pmdomain: core: Fix debugfs node creation failure
Message-ID: <lyn5ufwtpezk7li333b46rak7yiyvskirfe55vqo3un6wenb5l@kmgjtjl3dzqq>
References: <20241007060642.1978049-1-quic_sibis@quicinc.com>
 <20241007060642.1978049-4-quic_sibis@quicinc.com>
 <nlmz5adfxtnhgutblddlf2nlasmd5q3jpcsziaegmfvzsbkk7d@cb6e5qslk7vl>
 <CAPDyKFrG1ZEOOhk1Cb=RqZ-8eeuMEFe0ACz2DGC3=qejjj7Mkw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFrG1ZEOOhk1Cb=RqZ-8eeuMEFe0ACz2DGC3=qejjj7Mkw@mail.gmail.com>

On Wed, Oct 09, 2024 at 01:11:14PM GMT, Ulf Hansson wrote:
> On Mon, 7 Oct 2024 at 19:33, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Mon, Oct 07, 2024 at 11:36:41AM GMT, Sibi Sankar wrote:
> > > The domain attributes returned by the perf protocol can end up
> > > reporting identical names across domains, resulting in debugfs
> > > node creation failure. Fix this failure by ensuring that pm domains
> > > get a unique name using ida in pm_genpd_init.
> 
> Thanks for working on this!
> 
> >
> > Can we make this opt-in or opt-out? Seeing numeric suffixes next to
> > well-known power domain names (e.g. those comin from RPMh or the CPU
> > domains) is a bit strange. Or maybe you can limit the IDA suffix just to
> > the SCMI / perf domains?
> 
> I was also thinking something along the lines of this.
> 
> Another thing on top of what Dmitry suggests, could be to iterate
> through the &gpd_list and compare the existing genpd->names with the
> one that we are adding in pm_genpd_init(). In this way, we don't need
> to add the IDA to more than those that really need it.
> 
> What do you think?

I have no strong preference. Your proposal sounds good to me too.

> 
> [...]
> 
> Kind regards
> Uffe

-- 
With best wishes
Dmitry
