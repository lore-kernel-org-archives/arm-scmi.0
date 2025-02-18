Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885C425A650
	for <arm-scmi@vger.kernel.org>; Tue, 18 Feb 2025 13:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739887046; cv=none; b=fpxdXHpm7SKAYX7YVP4JP+Nn5YAvyJ93riw4C5H+d/5mu/mOCIeE19LN/AN1a6WaPP1ycmJNmr6pkKShsIMjajvC8WGgPyUYVVV12gPCOQQlqwfQEqyuekjtFLkvsp/RAWf9WykhOBVmqwgH8uR9CtdzGkbJqYw/pa8RudZkkrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739887046; c=relaxed/simple;
	bh=8X63xlxieFnuXJ71kKwsYUyjARtc3OnED/buAuCvQdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BKvROa0mX/rR6+8UE/1n41REekuyumzdzByHdBl4Wqgnm7uUeNxKe7clSj3F8Fyq72V2hhXSnoM3uAtBX7K0NyvWJhQhF0Dx44KwQrEr/WQ4uYHlNaFMTimnDaHOAt5KIlxa8lQ+wgnYsWyKH4UCRrjtIsl5L1faMvVtwsNrA8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PQ9E+0rC; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PQ9E+0rC"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-abb999658fbso258637966b.3
        for <arm-scmi@vger.kernel.org>; Tue, 18 Feb 2025 05:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739887043; x=1740491843; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoL+YYbFyzQi53guRzzbK5042nFC/txzGUKUNjkDPPY=;
        b=PQ9E+0rCoVgIEOj+Q5xOuJn+inL0JD3eGfI+FvyVnN2znmaNXEUr3h9Tz+1585pmcR
         46ZjkuITOjTLSUFmD3KKkqAnoG5Qrr+5maoPgtOUbLmRXVALWuOfnWEykYbL9CS5zAuq
         44ZhAZW3gGnXZsDJUW13yTYL3xfDuJ1KDIYCHAhKvNZ/9kpbrnSoHe2QTAKATxqbQH/w
         swWB5YMNidQj/mu5OfDTPl2lhaalt/0G8A7dCJdFDIK6T4KFxZCh76FxY5tkE97JyZAa
         jEUkEZaReTBKVQvqzz/3pM4bqdAEUSpaHZAbINqMCw2rWQSBxHLQupjgTKIpe4idOJuZ
         pviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739887043; x=1740491843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoL+YYbFyzQi53guRzzbK5042nFC/txzGUKUNjkDPPY=;
        b=JpgMVcPFdRrvRkhxEYMGlQSo74de/khtAr8f5s5XjgZ7YzvvvWnkTyjb4YqCLKsC0c
         WzdXMQ/Sji1uCBOo2Xtj2NBZU/b2F3ldgbKas5NrQV9dAeEVuosLUnRJwL6LWmn87JAU
         wSz8ot2YNOpF08Q7MTts+76vDOMPL1hfMsMQ0noLGoL8zcVDJfsReRren6SA72GbRVBc
         fBTQ8ZfKOr2IwYLZXwFPGRlXHefxxV0MevyEcU1JVghSJtoM5AwBKdVw8cK2RAZh0jH9
         FtSRNwvrtzjctG/ahfeOgyV3/nYpbuOn52P2cG79U5uPF5hgnTHn6kQv+dWnRvNM2a/o
         rDag==
X-Forwarded-Encrypted: i=1; AJvYcCW2RLx/kMb33az7Cx2r6mNbdjEXAPtM7cuqqE0QU1/xw0eLX5DfPbO5dcW0DE8h4yPjjZyegwuGsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5LX0wlVd9OX/WyzrjJ9GvTo/iPI84Jk6GWMpwZ2ai03xqMcKY
	uAHjsxwJNYJXFx3ZVv47OTQBvTPd8mycGjCatbsgRItOpijru4BNiUjStyzqU/HARcp/wL+0Rth
	SRTc+yulp/GISjG/uZUTUv27HGlWKgZaqwFTaTg==
X-Gm-Gg: ASbGncukETtRkch4rYul5vy9AUUoC0ePHuGjpdpjNcypwa7IisHklCzvkvFBmwKJtcW
	m6JOr/2YnyfcN/STynkdvu6HzoCNvUMcELc5xduTt4/IuWcp/EuDlI7rH6NF+qJYAyG35hPMAGN
	/HW/euzTYuiBKK7xnzu0+01TulZA==
X-Google-Smtp-Source: AGHT+IGbl8Gca3FzXqjTeQdy+7kZy+Fll8MQfJSwQrqiqCiX5Jywe/WDIdM2itW+BylU7b3ndenGS44IpmYIjl/JS/A=
X-Received: by 2002:a05:6402:13c9:b0:5e0:68de:ab93 with SMTP id
 4fb4d7f45d1cf-5e068deabbbmr13150541a12.21.1739887042576; Tue, 18 Feb 2025
 05:57:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <PAXPR04MB8459E8D1A82DE43C08B6C26788FE2@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z7Rjyy7_Jg66vqCf@bogus> <20250218130823.GA17099@nxa18884-linux>
In-Reply-To: <20250218130823.GA17099@nxa18884-linux>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 18 Feb 2025 14:57:10 +0100
X-Gm-Features: AWEUYZkWpaerSf8b2Ez1Ya1KZZyL2tDIepwf1sVobHTbTvSi0q-LK6uhbSjYN90
Message-ID: <CAKfTPtBd14wM2st62m3tnkQOZgBTUmxpjZXghMVff-Yg7wCVDg@mail.gmail.com>
Subject: Re: POWER_DOMAIN_ATTRIBUTES in SCMI
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Peng Fan <peng.fan@nxp.com>, 
	"cristian.marussi@arm.com" <cristian.marussi@arm.com>, 
	"souvik.chakravarty@arm.com" <souvik.chakravarty@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, 
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>, Chuck Cannon <chuck.cannon@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 18 Feb 2025 at 13:03, Peng Fan <peng.fan@oss.nxp.com> wrote:
>
> On Tue, Feb 18, 2025 at 10:41:15AM +0000, Sudeep Holla wrote:
> >On Fri, Feb 14, 2025 at 09:20:27AM +0000, Peng Fan wrote:
> >> All,
> >>
> >> Previously I posted a patch to linux to set all power domains
> >> with "GENPD_FLAG_ACTIVE_WAKEUP" set in
> >> drivers/pmdomain/arm/scmi_pm_domain.c
> >
> >Yes, I remember ACK-ing that and now I am thinking why =F0=9F=98=84.
> >The description of the flag GENPD_FLAG_ACTIVE_WAKEUP says:
> >"Instructs genpd to keep the PM domain powered on, in case any of its
> >attached devices is used in the wakeup path to serve system wakeups."
> >
> >Does that mean all the SCMI power domains remain powered on with this
> >flag ? If so, that sounds wrong to me. I hope it is not the case and it
> >is effective only if the device attached is wakeup source.
>
> Only when the device is setup wakeup source, the genpd framework
> will take this flag as keeping power domain on.
>
> Without this flag, even if the device setup as wakeup source, the
> device's power domain will still be powered off.
>
> >
> >> But in the end we find that some power domains
> >> could be in off state while it still could wakeup
> >> the system. And we have a downstream patch
> >> +               if (!strcmp(scmi_pd->name, "hsio_top"))
> >> +                       scmi_pd->genpd.flags =3D 0;
> >>
> >
> >There you go, so you simply rushed some solution upstream to carry less
> >patches downstream but this time you got bitten again. Sorry, but I am
> >seeing a pattern from you here and I don't really like that.
>
> I not wanna to argue here.
> I DO care reputation. If I do something wrong, I will improve.
>
> >
> >> So I am wondering to extend the attributes of SCMI spec,
> >> Saying In SCMI spec(DEN0056E)
> >> 4.3.2.5 POWER_DOMAIN_ATTRIBUTES
> >> Page 44 of 210:
> >>
> >> Bit[26]: If set to 1, the power domain could
> >> wakeup the system with power state
> >> set as off.
> >>
> >
> >This is not what the above flag is all about. It just instructs genpd
> >to keep the power domain ON as the device attached to it could be a wake=
up
> >source. They are not one and the same. If the device is marked wakeup in
> >the DT and it is both wakeup capable and is enabled, it shouldn't reques=
t
> >the power domain to be powered off when suspending. Why is that not
> >sufficient here ? What am I missing ? I am interested in knowing it as
> >it is important to fix the issue you are trying to address here.
>
> The flag must be set if the power domain needs to keep power on to have
> the wakeup capability.
>
> But in some case, a power domain no need to keep power on and it still
> have wakeup capability from hardware perspective.
>
> For example usb phy in i.MX95, its power domain is off, but it could stil=
l
> wakeup the SoC. But with the GENPD_FLAG_ACTIVE_WAKEUP set, the power doma=
in
> will not be powered off, so more power consumption in suspended state.

This probably means that the wakeup mechanism is not in the same power
domain but in another one that is kept on while the device is
suspended and the main power domain is off. Do you have more details
about this wakeup source that works with powerdomain being off ?
I vaguely remember some old discussions about inband/outband wakeup
source settings for devices which enable drivers to specify if the
wakeup source is in or out of the power domain and if we should keep
it on or not. But I can't remember the details; Ulf should have more
details

>
> So I am requesting extending spec to give agents the information whether
> the power domain could wakeup HW system in powered off state.

I tend to agree with Sudeep that it doesn't make sense to say that a
power domain can be off but the powered devices can still wakeup the
system. It usually means that the wakeup is not powered by the main
power domain

>
> >
> >> This is just an idea in my mind, I not
> >> write code to verify, just wanna to see
> >> any comments from your side.
> >>
> >
> >I wonder if we need to revert GENPD_FLAG_ACTIVE_WAKEUP flag enabling on
> >all SCMI power domains if that is not solving the problem you thought it
> >would.
>
> Revert the flag will cause a power domain not able to wakeup SoC if the
> power domain needs power state on to have wakeup capability.
>
> I am not sure other vendor's SoC design. To i.MX95, without this flag set=
,
> the NETC will lose wakeup on LAN capability.
>
> Regards,
> Peng.
>
> >
> >--
> >Regards,
> >Sudeep
> >
>
