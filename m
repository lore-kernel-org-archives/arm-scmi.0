Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF1720125F
	for <arm-scmi@vger.kernel.org>; Wed, 28 May 2025 20:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748462967; cv=none; b=a3oqcSEl23WHpB0LqDeQcwxuWxeDn1RhZ/Ncu9kPnWbk6pEeJiyG/pFw78Pxjw1GO81LoOLgyQlgpCJRVaQOzZsCND+vtvS/GGSqdYVOlsxa2Mw6k73tM2Memn6ZN1EULhyVlUiZwobMPCxXem0YDxOajCxI2R33DaztGeKEIpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748462967; c=relaxed/simple;
	bh=BcuZYc+NfvJKV2HPBB+0O9jXQZ7HkvuMWrK3dpkbThU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=j0Pm8cpFtNW7pSD4haRFfqilePka6/y8d8vfYKzNMKstgRiGlSzb2hm9jGesl1mdNiaR/1AYVv2zkRLE4TgFRRxHiEiP1CAjXHnccDj0+NwpsoCb4jgzkJQA7v3axXq2+2+KJaLRVs6GwG4C7Ham/C6wEf7lWYr2ccGzwgalkpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=c8GdmCOe; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="c8GdmCOe"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2347012f81fso3226115ad.2
        for <arm-scmi@vger.kernel.org>; Wed, 28 May 2025 13:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748462964; x=1749067764; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=96TYh7fCtAGKlLMcJtmjqCpShUor0/vxdLcfAimdEUY=;
        b=c8GdmCOeInpJoWuZ7D0pb0JCEmmtqqpY4MMbeordvH+Xpcm7TiD+NNVnpnSYVbC8Ks
         CagZ4fLGyxsqr3xTK/Owa5tYOnmsqPj1GSJUghkUPGNoL8P8RcnfoGPk3DLvprnjy5+k
         ZFY3p2b4Af0djpaiYs/gq8xRn4OE3KYRvjQoWak4HHxELTb/2Ip1sdfo7XZzDsLLKq/u
         f3uNpapZ2wGJMTio+G6LTIZ3nzNXY8aRB+2E9L5a05Dhauz6y9JOBIYBCMtG1WVPmmyP
         JH3jooLf+PT8jrZap3DoCR6gRnn/j8PgTC2gF3dr/xN8c2FXOgsaEbyEzXqhSg232O5t
         iThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462964; x=1749067764;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=96TYh7fCtAGKlLMcJtmjqCpShUor0/vxdLcfAimdEUY=;
        b=rETjBgqE23k+VxhUNY0yrtGXhIVFshr0FFlaHx8GUPV1Rc8iwMWQoCRjVMhFtCfgs7
         MtAj5BxADNDgWKjDxqEtuyGhSdOKIFyF/FdkGnBPWRH3u5VLgM42KAmVVCyyYR4uFd35
         YP7SzmRmL8QUVZlBAq1JXZYZpWRqmAEV+pUxb9qU8+BGc3wPVkRQuY9EK6zJCJMjtWoM
         ks8jkf2VdIP3FXSsRGN5Hw3omElR4IWcM7Ya5jVQBS2AL+XuvKnS8ht8NxZd2XC+Ztg1
         8+qYG6fZfRNIkpytiCnfrtJAP5rU7W1ehi1VikzTl9T6J+dhKQQTdSX+k14EjJMj/NMr
         HF3g==
X-Forwarded-Encrypted: i=1; AJvYcCUJC33tuPrJZMRlw+E+NBo3gxQcl8AkBn2g+wPEgWwnRIQJZibxapMnk78NG1iH4DMFdn4+AYb6pQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRFn6JWLAaAYwuhn2C/P8ppSzI/cnxBeCzNVoE9zF0SzsSOHDa
	shE9fc0FjQm9s+3wzoud1eFQH2Jzn28LqSQ5Vc1Rslq1SwvKoNLoFjTGK+OU6GCu+fE=
X-Gm-Gg: ASbGncvYGc50V1PaboAZU6rzDcR8oEmwOvg8s8xHfnh8DQuHx7Dmww5yTliWb7l3nf/
	whKDMYyR6CnkhyT8XVqcPecfGbHWXcexvAcSM37PtgRYQ1Bc3CAmd/cTNAAMe9DVg0lLVJHf/CT
	Z7SWG9ktdZMV5cqbnkclVuNB++C30UbtgNXHFiL/9A9LtyguZPtUa2aldkG0q6p5ZXmuvatX8Rp
	+393lOeKku59YA5cja6dn98wmsVBCVRxQBbQnOL111riU+xYn9mrz2yjKC3Nd6WEQc0RbXQSq/0
	oWi5KdxzSIi0Z79kZg2t65o+uofF4x3JOAVPGGHc1+SysLoOBw==
X-Google-Smtp-Source: AGHT+IFewsYJCktnuceGsgr3WAcEIfrntHMOdc1rvbRH1soHCb3/02OVfTQAmvofJnBxAdrsqWfDzQ==
X-Received: by 2002:a17:902:e744:b0:234:d7b2:2ac3 with SMTP id d9443c01a7336-234d7b22c7emr39655005ad.20.1748462963996;
        Wed, 28 May 2025 13:09:23 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d358f219sm15552915ad.112.2025.05.28.13.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 13:09:23 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: "cristian.marussi@arm.com" <cristian.marussi@arm.com>,
 "souvik.chakravarty@arm.com" <souvik.chakravarty@arm.com>, Sudeep Holla
 <sudeep.holla@arm.com>, "arm-scmi@vger.kernel.org"
 <arm-scmi@vger.kernel.org>, Dhruva Gole <d-gole@ti.com>, Sebin Francis
 <sebin.francis@ti.com>
Subject: Re: mixing SCMI and PSCI power domain hierarchy
In-Reply-To: <CAPDyKFoRaHhZP5zxqtrkRDPnZ+MOVb4rdKLk-g-gdiQEORNMMw@mail.gmail.com>
References: <7hecy3h7ky.fsf@baylibre.com>
 <CAPDyKFoLJ4zey6GNzCb9roAAJ5mS7B7exU1NEKtpLyyjD0aADA@mail.gmail.com>
 <7hikn5c5v8.fsf@baylibre.com>
 <CAPDyKFpuqk3jH91rkDDz_kejyJ5pFg5XH+=vdTA2aP8MJKUWrw@mail.gmail.com>
 <7hzfgf8xsw.fsf@baylibre.com>
 <CAPDyKFo_P129sVirHHYjOQT+QUmpymcRJme9obzKJeRgO7B-1A@mail.gmail.com>
 <7hmsc4s3tl.fsf@baylibre.com>
 <CAPDyKFoRaHhZP5zxqtrkRDPnZ+MOVb4rdKLk-g-gdiQEORNMMw@mail.gmail.com>
Date: Wed, 28 May 2025 13:09:23 -0700
Message-ID: <7hecw8pkek.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ulf Hansson <ulf.hansson@linaro.org> writes:

> On Fri, 25 Apr 2025 at 16:39, Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> Ulf Hansson <ulf.hansson@linaro.org> writes:
>>
>> [...]
>>
>> >> Anyways, curious what you think.  I quite like this solution because it
>> >> solves two fairly big limitations in the SCMI PM domain implementaion
>> >> that exist today with one relatively simple solution.
>> >
>> > Well, I am not the one to convince in regards to DT bindings. Putting
>> > the DT bindings aside, I think your extensions for the SCMI Power
>> > Domain to support parent-domains makes perfect sense to me!
>> >
>> > In regards to the DT bindings (again, I am not the expert here), but
>> > maybe we could try to extend the current way we describe parent
>> > domains instead of inventing something entirely new. Could the below
>> > work?
>> >
>> > scmi_pds: protocol@11 {
>> >         reg = <0x11>;
>> >          #power-domain-cells = <1>;
>> >          power-domains = <&MAIN_PD>, <&WKUP_PD>; // a list of phandles
>> >          power-domains-child-ids = <15>, <19> ; // a list of indexes
>> > corresponding to the list of phandles above
>>
>> Yeah, this is probably better.  I'm not crazy about introducing novel
>> DT bindings either.  I will make a PoC of this approach.
>>
>> The catch with either approach is that it will be a long list.  e.g. on
>> the TI AM62L, there are 50+ SCMI IDs.
>
> Just wanted to share a brief update. I got the opportunity to chat
> with Krzysztof and Abel at Linaro Connect this week, about extending
> the power-domain DT bindings, in the way I proposed above. We agreed
> that it seems like a reasonable approach.

OK, great.  Thanks!

I just posted an RFC with an initial implementation:
https://lore.kernel.org/linux-pm/20250528-pmdomain-hierarchy-onecell-v1-1-851780700c68@baylibre.com/T/#u

Kevin


