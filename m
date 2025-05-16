Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D86223FC42
	for <arm-scmi@vger.kernel.org>; Fri, 16 May 2025 12:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747399010; cv=none; b=twM4x5p+nt+wU5YMZFR3GVcnHS6JCx8c6lxtMPxgurcvragaAVB1oVfGg1BZ1qXquVrlpI8L7DsmlA2gMUkxEzgSe0EYXF7tJ32lVC1J6kWYjKRzOsXeyuLIaN4xCGr3GWhjUrDLn46Jf2WfjAR52t9vz9CPz/61Li2E1DR/OqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747399010; c=relaxed/simple;
	bh=9wzkyFboHj2a03N7id0xUsk8moBU7q+unrqFgIUfzZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uM2Dzfxn+XIXqwFv+kBZU4jvkxPynQ5/V6iBHOjL0yiv3JoXtwcLERPQQdoP9I63QmkWPDBtVnN+N1fwvjZh+7AxYaZi93aq5oKW1Q+oUZax2gnzUOEyjx/go3BeiU0c4qqsyT4XbbsEZlSLELzxZRf8w/3xJ0NfNTfRQxfXzUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VWRhglZ0; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VWRhglZ0"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e78fc91f2dfso1782719276.2
        for <arm-scmi@vger.kernel.org>; Fri, 16 May 2025 05:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747399008; x=1748003808; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/w1qVHjm/6raN7zGLx8kYdLz9cB5AHuz+jJexa+gClI=;
        b=VWRhglZ0EKWZ14bQ7PfGNfukpyLXmHf/PMKyn1ydxEjneRsgPy5IhDZGjoM7uj1DT1
         +PvU20ihnGYk6e1KaTiBaULidd200f+ntR8KmxZRagxxkJ29hNGadpQFmSF4atf5WpXB
         a7y5vXQp+g7tRPJMICrlbovkSNrxZKoWlpiayZ2bioV0B6DGQDaEfGoX6A0YqLCncfFr
         /x50jo6frmG2io/75l7MuQ5lvSucvqxJhAyQWhPZ/aPwAi3FQXcBrerI35k1niVSCp98
         IpQFH2xbgokvq25zQrDCmCQI1AR6UWeeTDxpyuR3etsf3z/Zy2U4wHm+69XaAs/NkWHF
         aBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747399008; x=1748003808;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/w1qVHjm/6raN7zGLx8kYdLz9cB5AHuz+jJexa+gClI=;
        b=J5v2Qbj+y6iJzszK0WOQiy4qwQPDdZwNQP+cpGR8so0HmB5B5aoo+GshB2QmCSle7b
         eE1/jE3oGI0Q7z1Wc+ZqP6wJHxaPedHcfNCgmckpf4tYvOH//uhCl3h3aWYodVvYQkfy
         fo0YWrwoHmicwGiq/jnwyP7LCJlhQip0FFXBqZw6ZfMsbTRpIkiNbgvTYK/nEFLFw48s
         lAxoBzwHEWBg/AjeVqNZwPEkW0N/8xQx8wek/sIYyBUpUt+EPeTyxtM5f1CCGnKUY9L9
         xaaFhvY54onzAbQ61V6hfK6Wydw8iTqa4cJS+8n6fqTHpoHT4WTBEUfzOrAKdj5MVLfS
         bz/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXkv51MZib0LOxcC7nBhQtDu7SHaCT/B+X0kFeAouCZHb2cp+NBmTVqYJMeYg74fnuEukLs5LZWiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwP2gvljyS3PIGFSAgPQ1Ce+7j5mmA+6zytfAnVd9giRl3dIvzu
	+3CTkVTKQNrcMFLm+kKTATNan0pHv74mLmV7SMCVs6LVOmX2lVFEKWsBn3IOkP+vjtnFncCKy8G
	b3SBV5wtVGcrh19Vh+Kz4LoYB6o2hLD6cLhfKdy6kbg==
X-Gm-Gg: ASbGncvpUjr+kVzcbUQjTkvoMWHbIlU8JwOgo/wUNH9pGSH45XeYDZyYeawoFE8gD8j
	hMhWw4bj3SffHBXDUD1kinSqEGL0fqs5FRhwPhbAmj4rC+Cglcwp40gOQmmNuynrYqDx2wDU2jM
	sJlsODqqUVC+XjinCV4zU8C02vmD8ECWc=
X-Google-Smtp-Source: AGHT+IFghScXhnR3wkBXLDFz1t5z1CZPwZ6TF92wgLasruAxkgk8sfBOlYLoXrREiTdbQmkb0V00WD3XSfLxJL/dw9A=
X-Received: by 2002:a05:6902:2b86:b0:e72:bb4d:80d9 with SMTP id
 3f1490d57ef6-e7b6d32d2abmr3337052276.3.1747399008010; Fri, 16 May 2025
 05:36:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7hecy3h7ky.fsf@baylibre.com> <CAPDyKFoLJ4zey6GNzCb9roAAJ5mS7B7exU1NEKtpLyyjD0aADA@mail.gmail.com>
 <7hikn5c5v8.fsf@baylibre.com> <CAPDyKFpuqk3jH91rkDDz_kejyJ5pFg5XH+=vdTA2aP8MJKUWrw@mail.gmail.com>
 <7hzfgf8xsw.fsf@baylibre.com> <CAPDyKFo_P129sVirHHYjOQT+QUmpymcRJme9obzKJeRgO7B-1A@mail.gmail.com>
 <7hmsc4s3tl.fsf@baylibre.com>
In-Reply-To: <7hmsc4s3tl.fsf@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 16 May 2025 14:36:12 +0200
X-Gm-Features: AX0GCFsCC3XAcrwldXbwu-OHdnGt5Er6pBb3UyqFHjGLue3jB_wauUEaYu5LPLw
Message-ID: <CAPDyKFoRaHhZP5zxqtrkRDPnZ+MOVb4rdKLk-g-gdiQEORNMMw@mail.gmail.com>
Subject: Re: mixing SCMI and PSCI power domain hierarchy
To: Kevin Hilman <khilman@baylibre.com>
Cc: "cristian.marussi@arm.com" <cristian.marussi@arm.com>, 
	"souvik.chakravarty@arm.com" <souvik.chakravarty@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>, Dhruva Gole <d-gole@ti.com>, 
	Sebin Francis <sebin.francis@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Apr 2025 at 16:39, Kevin Hilman <khilman@baylibre.com> wrote:
>
> Ulf Hansson <ulf.hansson@linaro.org> writes:
>
> [...]
>
> >> Anyways, curious what you think.  I quite like this solution because it
> >> solves two fairly big limitations in the SCMI PM domain implementaion
> >> that exist today with one relatively simple solution.
> >
> > Well, I am not the one to convince in regards to DT bindings. Putting
> > the DT bindings aside, I think your extensions for the SCMI Power
> > Domain to support parent-domains makes perfect sense to me!
> >
> > In regards to the DT bindings (again, I am not the expert here), but
> > maybe we could try to extend the current way we describe parent
> > domains instead of inventing something entirely new. Could the below
> > work?
> >
> > scmi_pds: protocol@11 {
> >         reg = <0x11>;
> >          #power-domain-cells = <1>;
> >          power-domains = <&MAIN_PD>, <&WKUP_PD>; // a list of phandles
> >          power-domains-child-ids = <15>, <19> ; // a list of indexes
> > corresponding to the list of phandles above
>
> Yeah, this is probably better.  I'm not crazy about introducing novel
> DT bindings either.  I will make a PoC of this approach.
>
> The catch with either approach is that it will be a long list.  e.g. on
> the TI AM62L, there are 50+ SCMI IDs.

Just wanted to share a brief update. I got the opportunity to chat
with Krzysztof and Abel at Linaro Connect this week, about extending
the power-domain DT bindings, in the way I proposed above. We agreed
that it seems like a reasonable approach.

[...]

Kind regards
Uffe
