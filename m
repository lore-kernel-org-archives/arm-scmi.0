Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87409839E4
	for <arm-scmi@vger.kernel.org>; Tue, 29 Oct 2024 10:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730196585; cv=none; b=nkPIu+aP1kauvROiliheq00M7j3jChWUKscbKSO28tfua0ysh2oPfnvMO3iHU6Uyy9niJoYuwDiCz3dBPD9FLMHdIU3T51qv04Tt6iniqi6QpfbJ8PQTsXOS7/OM56M68kX6D2pVoVljAuaNd5NnnU/xwVY3KPmFZKMUNzrhAeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730196585; c=relaxed/simple;
	bh=ybQkhmgvt/A0gPRLGbN+a1ATGe5zgQobG1V1fNChV0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lGSPc0UuaGA8yL3cFdVQnmN1Pc8jyVvpSTNGuRkeR5K5JeLugSymXx++7bpcl3GZtWsZLJy+/RpdCjP4bl2IkXxkxmo9+ilRMhoKAcwfRjgjC1moJwHwunNR0OcLCHoBFfIF5np5RnHs856ybY2ixWMDnXBY5gx4CRR8kc7hF+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dubWiluL; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dubWiluL"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e3d523a24dso4026926a91.0
        for <arm-scmi@vger.kernel.org>; Tue, 29 Oct 2024 03:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730196583; x=1730801383; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qf1RqEgnkN0Yu1iXcTPSAq7k5g1GF5Ku9wkGTVlJ2DA=;
        b=dubWiluLhf51QI77ddvCacYf18VNE1pKW7a1z/9Oosoqqf6lQ2ftXECtDJjXuQssBz
         DTAfSh9g+JE6VV7T2228AnajMFiCOD3FXQNLBz71CXaBBXn0rAkU57z2gF7VXVaOY4Uv
         dYk10GfWrsAoO7zWwYp4h+hOp2WnI9hUbj6lZTkHSCh12kgCzzX9DHF9tHRDTaJsvclm
         0PjZH2X0A+0zWW+zNUwcsotPW5lWeKSfGMPNkXGmSSXhLLm+FC8d7J7CqN4bJ4U4soU1
         VIjz77rCmcMhKc2E0NoMgNHEu/ErGE3B9BmXld/RTmLxW7UaF46vgXdIrVzB9XTS5xPU
         eD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730196583; x=1730801383;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qf1RqEgnkN0Yu1iXcTPSAq7k5g1GF5Ku9wkGTVlJ2DA=;
        b=U+M/zV8/h9st7b7PeVamtoWRDaR5R7BiJr1Zg0CBVrgFxCOgYHD0ojf0g0UuTKR21i
         9Y+BthoH+hBxgbvrh9YRdDcqHqjMQDWdidLXcV2yYSUEmHJ/h/ISPGEpKyuOl1j8dRlN
         npTcrhks+IhQ2jKCKmCPypcXNn4rKrFh8VaEWN543MLhQkm5I9jrAvzCw17xBQOmPqIk
         L4NDhS88mR6C0FjN+LdrOlWe0dZvQgIT5V4w6r8FvI6FZNjggvdY1gp7UWVie9gWmmlc
         ADJ1fF2g2P3yD1bBMPJkcr/fAxJBi4DD0wRi6+ElZsvW7DNJI/UcjAZp465ETi9bQGWO
         j+iw==
X-Forwarded-Encrypted: i=1; AJvYcCVgnZkzFtEnE9RbwNnscKe+VOzGS2T+yovbAV+6DlrHn21EpnOvgTvnyjXkEB1wxDfhAhxKhisy+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrAbhM4y7UJYEz6UkriPQw2busfkhw1prtGjRhErDqaMs2SINv
	Jt5iRTlGCWpvmgIxK7I4S8qcId47xTLNa/TOHsW5wUyk/BVklLVR278BLg0JE24oqmWV4zDTrHf
	YoxzD1zgEHHxcLU99m592XcmJ2UkPPc4ufol32Q==
X-Google-Smtp-Source: AGHT+IGqarZyDyVW29Wx64cdh9mGFvkEebafPvzq1D0/NM20qB0rkCbaT6DWVi3mViNlNjrDoPPLWNohWwr3GaWFYFs=
X-Received: by 2002:a17:90a:b111:b0:2e2:d16e:8769 with SMTP id
 98e67ed59e1d1-2e8f106926emr12754455a91.15.1730196582692; Tue, 29 Oct 2024
 03:09:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c5fdc171-0dc7-4c38-88e7-fcf9de7cbec2@stanley.mountain> <ZyCuAKfqRnuFdAwC@pluto>
In-Reply-To: <ZyCuAKfqRnuFdAwC@pluto>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 29 Oct 2024 11:09:31 +0100
Message-ID: <CAKfTPtA4VwUhiuwm7u-tm=iLFE3m365+-Z84tg6hAse3oMkxMg@mail.gmail.com>
Subject: Re: Question about identifiers
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, girish.pathak@arm.com, 
	arm-scmi@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Souvik.Chakravarty@arm.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Oct 2024 at 10:42, Cristian Marussi <cristian.marussi@arm.com> wrote:
>
> On Mon, Oct 28, 2024 at 06:09:50PM +0300, Dan Carpenter wrote:
> > Two questions:
>
> [CC: Souvik]
>
> Hi Dan,
>
> >
> > 1) In SCMI pinctrl protocol each pin, group or function has an identifier.
> >    uint32 identifier
> >       Identifiers are limited to 16 bits, and the upper 16 bits of this
> >       field are ignored by the platform.
> > The linux-kernel assumes that the identifiers are basically, 0 to nr_pins,
> > 0 to nr_groups and 0 to nr_funcs.  Is that a fair assumption to make?
>
> It's not an assumption really, any SCMI resource on the system, across
> all of the protocols, is identified by a number in the *contiguos* range
> (0... TOT_RESOURCE - 1) where TOT_RESOURCE is usually gathered with some
> discovery initial command...looking at Pinctrl specifically in 4.11:
>
> "Protocol commands take integer identifiers to describe a pin, group, or function.
> The identifiers are sequential and start from 0."
>
> Pinctrl deviates a bit from this since you have 3 different kind of
> resources, so you have 3 different TOT_RESOURCES values to query.
>
> ...maybe adding "sequential and contiguos" would have been clearer...or
> maybe it is just that I am used to SCMI spec parlance/world so I
> implictly interepret like this...
>
> IOW, for any protocol, in general, the platform is expected to expose
> to the agent a contiguos set of IDs numbered from zero...i.e. without
> holes due to reason like 'resource X is not present on platform Y so
> we'll leave a hole in the set of IDs returned at discovery time because
> is easier than remap the physical resources to the set of IDs exposed to
> the agent'
>
> >
> > 2)  In the spec 4.11.2.7 PINCTRL_SETTINGS_GET and 4.11.2.8
> > PINCTRL_SETTINGS_CONFIGURE it only allows for pins and groups, not functions.
> > Meanwhile gpio functions are functions.  That's just a mistake, right?  I've
> > been working under the assumtion that it is.
> >
>
> Mmm, there were a lot of discussions around functions and GPIOs (which I
> dont recall now) and a last minute rework to some commands in that
> regards, so that now you can use those 2 commands to (optionally) get/set
> the selected function for a pin or group specified in the command.
> All the other configurations are, indeed, only pertaining to pin and groups:
> what do you think is missing around functions ?
>
> Moreover, are you sure that you have the latest v3.2 spec from developer.arm.com ?
>
> Since there were a lot of betaS for v3.2 cycle...with changes especially
> around functions/gpios...so many betaS that, till last month, AFAICS, even
> the ACS SCMI compliance suite on the tip of master (still not an official
> release, though) was broken, since it was really implementing Pinctrl
> testcases against an old obsolete v3.2-beta (i.e. testing non-existent/older
> pinctrl commands...and I have fixes to upstream for this...once I'll have a
> bit of time...)

IIUC Dan question, He wanted to know if he can use
PINCTRL_SETTINGS_CONFIGURE for setting the output value of a  GPIO
function without taking care on which pin it really outputs.

But as I understand the spec,
1st, you call PINCTRL_ATTRIBUTES for functionA to get the GPIO
function descriptor bit[17] and the number of pins or group which can
support this GPIO

Then PINCTRL_LIST_ASSOCIATIONS for functionA will return the list of
pins that support this GPIO _functionA. Let assume it's only pin5

Finally  PINCTRL_SETTINGS_CONFIGURE on pin5 to select functionA
and PINCTRL_SETTINGS_CONFIGURE pin5 to set config 18 (output value) to 0 or 1

>
> Thanks,
> Cristian
