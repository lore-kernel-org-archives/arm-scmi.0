Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1859394464
	for <arm-scmi@vger.kernel.org>; Tue, 19 May 2026 08:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180422; cv=none; b=l45ytrdzfXXFv6CwNRTxSBPR2Z3ljIMML8x2K5oPIbs95jX4ncna51cX3O3WeMg7iN5z7bruwqY5Ab5PxY+uBm4MW8+608chOjZXDpjg/hUBITC13mI2fsI0+tzKwn7Lgz79WVcoEO+WC6FInbueahGMgbjDl2OS5e2lzA5Wd9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180422; c=relaxed/simple;
	bh=juDUcsZNIvzbRmHpWcCfezrV4oTSuq5bTHew7YfXdp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AmX6miaUWOchvtd7xnVhl7Uvb5SnK1p4kMvgmhsb1IsihigJ3HEbwAd5iy1DXm5rNmVZgn0nWNayghuT8neqANpRTFl2cIUZ01xvoVTn4q/6UKwl8B1SJGi9TDZLDnKocrEGV0OUMeETSYT+/CwEsW+xFVSD1ZeTLRZ6qTVRLcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iu5D4NbC; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iu5D4NbC"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44c350a5b87so1909836f8f.3
        for <arm-scmi@vger.kernel.org>; Tue, 19 May 2026 01:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779180419; x=1779785219; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vlT44GAjdS7aAUiPvcR24JmsWeLTVxOUHH60gHBMn6A=;
        b=iu5D4NbCuoH4UkB1D09zloU7T8ZCg6Y6Gs5fkTUtTxAaR3OZjmGe3yE2K2vDM2l149
         697MWsCpHkItF+gHzERU/5LSBRbgh9xfR0sRBR+sIfMWpQdqlSb1MrplxnWVZoM3aw5U
         TH9zEdcBB4MwAasTMKcIJNxImXNLBtoTNcK8ep21zodvPR7vKrn5RA3I/Siloi4TInRM
         1HlFzfVRvj69G/4Seo7Mo9DdcYJL2eR7K2wfYN1RXezfHPL/SMQaFpZN9CShLvMlIemW
         +YsGTZiNyVo/jpCQr1U3vZA8R06C4LM+zp1wwcp/YUqO/FZCpfEkRx2LFXWICCroL3iX
         Ey9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779180419; x=1779785219;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vlT44GAjdS7aAUiPvcR24JmsWeLTVxOUHH60gHBMn6A=;
        b=bYr8M3C3V+dAzYOmIcCrSrwMHuTfu7ABU1P1FjKeiRwQRlU9wRSl+/+xaf+9ztCFBA
         N2X+uYEppzg9wLh8yofZktZRYZt9aKPAVnuEpbt5YBl6c4sRJPn3sMv42Ctdz13i/ObC
         tjgdlj3obJe+5kYb+7Bypnral+/6SEF62zKAlKQ+S426Llw81oj6fLM/cXsCPuHsQsqO
         AhxsksKkCl18LLDiVlO4FoqUsq8e81yH7ONFG0Zr8Z0EDJjZhjvCQF00IKWwjmilSpgr
         YAAJS+PpcRm9UQ/EWtedwnLc3oxAlD3IZHlo1v+qHA21pERlTew/LIJrMfDJ8qBUQFGK
         pJXg==
X-Forwarded-Encrypted: i=1; AFNElJ/pgNs8bIRqm6XmM/OaKUCQ8N6xQzX94OdJlW2oS2Qt5WSWpXHMuNKR9LwNkltiUMJrI1u4+cpzbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxFERnjjhnucdWcmjbRTskiwQ+PGyhKVdMbIsGlRSdkYyd2AX7
	CO6IxBBLOZ5y1Yg6tAe3rBZxpOXGIbXltQQvkpXaGKdHEhH1ACyl3z1O
X-Gm-Gg: Acq92OEzHikvgn9nxuzND1st64edCtayI4fEARduJHi/I7R3DnrpYMKYfmgdzZ3BqDG
	+iMbHRRUgrH/vXDoc0JxQRI4JxVBkzgIRGHUOWmLFPqatQLOmVmNIUDi0RjyudhzH0zlfrRammf
	RAVxRV0XSIIMMq62rGJt8+H05A8JPaLSIgOowMdEiyeWF9Say3FnY4HQlD1J/TR2njrZv0TQALQ
	KY+q/UZZi56J7LI8Y0Vc22lYiqR2yrwIpKwLbBH9AhZwnA+ObJt6JgUtihIFYh0JV54FwblPPre
	YLt+4ETu4jKB2ckqfrFGlknuUv2+woImLoFuFC4ZRNs380lovNP2x4mwKepMPUQaS/vgRdfJPpk
	W38YvpWCddRoEaAvaUEkZWmQ9P9T8xEUNZs7gbB9mqkwu8JPZDMj91AtkakFNbLEy6+ZrGh1Vwk
	yhsUxBb7Ync1vRRAuJxq7AVJg=
X-Received: by 2002:a05:600c:630a:b0:48f:e249:4094 with SMTP id 5b1f17b1804b1-48fe632663emr343949425e9.18.1779180419176;
        Tue, 19 May 2026 01:46:59 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c8344asm529862995e9.1.2026.05.19.01.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:46:58 -0700 (PDT)
Date: Tue, 19 May 2026 11:46:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Sudeep Holla <sudeep.holla@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Fix OOB in scmi_power_name_get()
Message-ID: <agwjfyMykDJTlrBd@stanley.mountain>
References: <75caae28bdffb55199a0bc6cac5df112a966c608.1778838987.git.geert+renesas@glider.be>
 <agb1Q6mrGyDwFdmO@stanley.mountain>
 <CAMuHMdXreO-6xQ+e88AKQ_vSiwMPMnx=t8h5JChBAtuV4UDMEw@mail.gmail.com>
 <agcHnzzdhV36j9eH@pluto>
 <CAMuHMdVVAioAk_3K4y-7T0MCa7L++sVcWGRfdj_ESHau0ov9eA@mail.gmail.com>
 <agcNULwGvCACUYx2@pluto>
 <agwhGERAdaKepqgT@pluto>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agwhGERAdaKepqgT@pluto>

On Tue, May 19, 2026 at 09:36:40AM +0100, Cristian Marussi wrote:
> On Fri, May 15, 2026 at 01:10:56PM +0100, Cristian Marussi wrote:
> > On Fri, May 15, 2026 at 02:00:24PM +0200, Geert Uytterhoeven wrote:
> > > Hi Cristian,
> > > 
> > > On Fri, 15 May 2026 at 13:46, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > > On Fri, May 15, 2026 at 01:29:27PM +0200, Geert Uytterhoeven wrote:
> > > > > On Fri, 15 May 2026 at 12:28, Dan Carpenter <error27@gmail.com> wrote:
> > > > > > On Fri, May 15, 2026 at 11:59:15AM +0200, Geert Uytterhoeven wrote:
> > > > > > > scmi_power_name_get() does not validate the domain number passed by the
> > > > > > > external caller, which may lead to an out-of-bounds access.
> > > > > >
> > > > > > Is an external caller an out of tree caller?  So far as I can see this
> > > > >
> > > > > I meant a caller outside drivers/firmware/arm_scmi/.
> > > > >
> > > > > > is only called by scmi_pm_domain_probe().
> > > > > >
> > > > > >         scmi_pd->name = power_ops->name_get(ph, i);
> > > > > >
> > > > > > where i < num_domains.
> > > > >
> > > > > You are right. But this seems to be only API implementation in
> > > > > drivers/firmware/arm_scmi/ that does not validate the passed domain
> > > > > number.
> > > >
> > > > Yes we tend to validate protocol operations calls even if apparently
> > > > safe from teh caller perspective...indeed I have this fixed locally
> > > > since ages in an horrible patch, that does a lot more, and that I
> > > > never posted :P
> > > >
> > > > Usually, if it is worth, we also build an internal domain get helper to
> > > > reuse across the protocol unit...but here really there are only 2 call-sites.
> > > >
> > > > What I am not sure is what to return: "unknown" is safer as of now than NULL
> > > > for sure, but really, what happened is NOT that the name was "unknown" (which
> > > > by itself would be out-of-spec behaviour) it is more that the whole domain that
> > > > was referred to that was invalid and NOT existent...
> > > >
> > > > ....mmm I suppose we are opening another can of worms here :P
> > > 
> > > Like scmi_perf_info_get() returning ERR_PTR(-EINVAL) instead of NULL,
> > > and scmi_perf_domain_probe() never checking the return value anyway?
> > 
> > ...oh probably more than that...and related vendor FW that already exploits
> > these missing checks here and there to arbitrarily skip domains and return
> > out-of-spec non-contigous sets of domains becasue they cannot bother to
> > implement properly the spec (or they have simply forked their codebase from
> > an old drop and never updated it again...)...so that any kernel-side fix
> > you made along the road carries the risk of breaking something and a string
> > of possibly needed quirks...
> 
> Anyway, it is the safest option on the table until proper checks are in place.
> 
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

If it has a description like this then it's absolutely going to get a CVE
assigned.  We're used to hundreds of CVEs and all but I really feel like
this is a bad habit.

regards,
dan carpenter

