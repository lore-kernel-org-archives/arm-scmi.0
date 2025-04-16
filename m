Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EDF199E9A
	for <arm-scmi@vger.kernel.org>; Wed, 16 Apr 2025 00:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744762960; cv=none; b=rCdLQTfG/WZdgm/2sKI1bqBtEXVHRgMpcxGSIWzUbR49EPbyObvnUpYGcOBhkkyhnRlCNt027Q1vVrb5G6RksjfbS/LoV8ewn59WwpF5k7kmPVj7QZRLbmR0wJi6n04RG0nGIi1qJ069QVG7TfeD4Az++gjgI+sMp7HJlzL3mKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744762960; c=relaxed/simple;
	bh=JAVzFtrR3wPALkRGHAXp3IUuCyWv237nnKle2dZqwcU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bNV0jz+T/TMl21l3onlfIbd6Dv404QlzuOCaFF+/d78K7XX/Q+Y9z6p/twGpASMIAMblTtu3Shmu5EEbV4xPpXYDEW51Jco8ogTSrDDMf6o1xOHmLs5LX3ipF4GTizaBLu/XNy842O7BfD0WQ3u8oCxrMRr1BeV40loBZ+P1OQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=v453ixmI; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="v453ixmI"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-227cf12df27so1688725ad.0
        for <arm-scmi@vger.kernel.org>; Tue, 15 Apr 2025 17:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744762956; x=1745367756; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ACqAYlm5krokAGL+78ntX/x7zLWwFVWqme9e2g2yYQE=;
        b=v453ixmICtftrtGYX5yegRGXtlKTz0wttdIl35XrHftAWrXm2uJQVODfaCxSxpB0cl
         TljuryO/LOrGh4N4leU+rq9SJgStEaV6gOnTNOITH+gfkTTeKuydFAydgfxPkkJ2aw5F
         OlHge9cpgZR+DgiGs0BzSAJjY35uinlzsaE1CLQz6KLT/GN5Fznau9nQC/wFMzGAa+vM
         hqzQpPLZPq3SlvDvjqyyCASSOuLqYbdoT0b8RAoGetOPX/wL4fmbilM6C0Pnj3RltsGE
         lDKqoledQpHt6vZOPlg42+bKlS3oYtG53RbcoU03zoen/MckgCp9EAOKuiv/NxBFsktz
         UGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744762956; x=1745367756;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ACqAYlm5krokAGL+78ntX/x7zLWwFVWqme9e2g2yYQE=;
        b=gBGIPf8WpeEjCsvHNlClgICCjan+Ge/mI3BW/p6s8uoXYd5ELHAoc3M5WcAcvQ86dY
         s2JsDkcm/Hetyz78FH2jKAoO9bLVhFd5M0wlwRtuoLE1fDfo3MQMshU0SA3ZU6Yt30Pw
         PBQdaxAiSVLg4gostbXGXsPiFN9G9jT8Aei0KUlGPpSEQeP3rcmOqehlQGSgV5Q/iNXP
         L/ARxymoM2KKynH9409irW8XqkSKvjT+YwGe7+NqDYNAzvzCb5Wv3M7bxs61mspkdTO3
         puKzzbb7qI94y6ev2JYtHL/CKLHrseifmZFmeAwxgos2E9ZhgFSgyJ11vpV5Q+oPPa1k
         jS/g==
X-Forwarded-Encrypted: i=1; AJvYcCWYHD3on7CpMRo18T2Fl9BwhmtjlIfbOcY/5a09OHUUKRjVmHxDIDnFLHxIWNNw1an2QT0789EVPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxG/YIMKmf1lsn38MnKIjl8maFFTCD1Swap8qetFFrkjNbXaLiv
	OnadbQMIc5M/wt2GuHKlb4PcCRxz4AQADU+CZlSt3bRI9gIGdTTHYluUgrEa5Tc=
X-Gm-Gg: ASbGncu3of0Xs7+1px26PaaSq54ybE5ovhkDVmYUMTvQiNaFbev4TvWRO4f9ZzSkckm
	HoshgPTM9xHCDC6duHMl1ch88ogKg5wX6S9vYVIQvE/iYFIvaGtXKFuubbctW+pMjUwoAjI4ou9
	yMeJKtF3kOxZxQiWUl0T+LPg02ZXTeBPlgLBibkfDzCFiFnuFGwNMLaWqXUPZXYvJZ8SuGT258g
	F2nRpTn8ezCiUVZaUbZu+GC7ngNp2LSCgH/1fmMGtj9nJrRUUsIQolekP+x2HjBsY45k9d46uC1
	yb9qY4Nr3Y3A8pg++l8fZFXE0UAGu7d8R8FkJLQ=
X-Google-Smtp-Source: AGHT+IFoYsvr3s0uILkFt3gwv6jD8BXxjsezB7vgQ+fGuU1952j8Qdg94Jrp7dJaxMrxiPw+uj4P9g==
X-Received: by 2002:a17:903:19c7:b0:21f:6dcf:fd2b with SMTP id d9443c01a7336-22c24991fffmr85134115ad.1.1744762956036;
        Tue, 15 Apr 2025 17:22:36 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33ef0f41sm1514565ad.41.2025.04.15.17.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 17:22:35 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: "cristian.marussi@arm.com" <cristian.marussi@arm.com>,
 "souvik.chakravarty@arm.com" <souvik.chakravarty@arm.com>, Sudeep Holla
 <sudeep.holla@arm.com>, "arm-scmi@vger.kernel.org"
 <arm-scmi@vger.kernel.org>, Dhruva Gole <d-gole@ti.com>, Sebin Francis
 <sebin.francis@ti.com>
Subject: Re: mixing SCMI and PSCI power domain hierarchy
In-Reply-To: <CAPDyKFoLJ4zey6GNzCb9roAAJ5mS7B7exU1NEKtpLyyjD0aADA@mail.gmail.com>
References: <7hecy3h7ky.fsf@baylibre.com>
 <CAPDyKFoLJ4zey6GNzCb9roAAJ5mS7B7exU1NEKtpLyyjD0aADA@mail.gmail.com>
Date: Tue, 15 Apr 2025 17:22:35 -0700
Message-ID: <7hikn5c5v8.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ulf Hansson <ulf.hansson@linaro.org> writes:

> On Tue, 8 Apr 2025 at 01:31, Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> Hello SCMI folks,
>>
>> I'm trying to figure out how to model a power-domain hierarchy when
>> there is a mixture of SCMI and PSCI domains.
>>
>> Let's say I have a top-level PD, managed by PSCI, but inside it it has
>> both a CPU cluster (with cluster & CPU PDs controlled by PSCI) as well
>> as some other sub-domains for leaf devices that are controlled by SCMI.
>> A simplified version looks something like this:
>>
>> SOC
>>  |
>>  |- TOP1_PD (PSCI)
>>      |
>>      |-- LEAF1_PD (SCMI)
>>      |-- LEAF2_PD (SCMI)
>>      |
>>      \-- CLUSTER_PD (PSCI)
>>          |
>>          |-- CPU1_PD (PSCI)
>>          \-- CPU2_PD (PSCI)
>>
>>
>> So the main question is: how do I describe the SCMI part of this today
>> in DT?  Currently, I have something like this for the SCMI-controlled
>> PDs:
>>
>>         scmi_pds: protocol@11 {
>>                 reg = <0x11>;
>>                 #power-domain-cells = <1>;
>>                 bootph-all;
>>         };
>>
>> and the leaf devices under LEAF1_PD and LEAF2_PD would have
>> `power-domains = <&scmi_pds N>` properties, indicating their PD is
>> managed by SCMI.  That part works fine.  And I'm also able to model the
>> CPU PDs and CLUSTER_PD just fine, including using
>> domain-idle-states... (Hi Ulf ;)
>>
>> But... how do I describe the relationship of this hierarchy?  In
>> particular, when the SCMI-controlled PDs are actually subdomains of a
>> top-level, non-SCMI PD.  I tried adding `power-domains = <&TOP1_PD>`
>> inside the scmi_pds node, but that property seems to be ignored.  So it
>> seems that currently it has not been considered to have SCMI PDs as
>> sub-domains of other PDs.  Is that correct?  Is this something anyone
>> else has considered adding?
>
> I haven't heard of this topology before, but I believe I can
> understand the need for it. Especially when using the PSCI OSI mode.
>
> In principle, if any of those LEAF1_PD/LEAF2_PD are being in use we
> must not allow the PSCI state to be selected that corresponds to the
> TOP1_PD. Right?

Correct (mostly.)  TOP_PD may potentially have multiple domain-idle
states, and if any LEAFx_PD are active, it could just mean that only the
retention state(s) of TOP_PD should be selected, not ones that involve
context loss.

> I can think of two ways forward, there may be others:
> 1) Put the leaf devices themselves in TOP1_PD *and* LEAF1_PD/LEAF2_PD.
> Thus these devices would have two power-domains. Whether this actually
> works for your case, I am not sure of, but I think it could be an
> option.

Hmm, I don't follow.  How/why would this help?

And more importantly, does the current PM domain code support devices
that have multiple PM domains?  I see there are examples in the binding
docs, but I have not seen that in practice anywhere yet.  I did a quick
test by adding

   power-domains = <&scmi_pds N>, <&TOP_PD>;

in one of the DT nodes, and at least according to
<debugfs>/pm_genpd_summary, not only does it disappear from the SCMI PD,
it also doesn't show up in TOP_PD.  It seems it can be in one or the
other, but not both.

> 2) Enable parents to be described in the "scmi_pds" node. To do that,
> we need to extend the DT bindings a bit, as we need the SCMI index
> that should correspond to the SCMI-child-power-domain. In other words
> "power-domains = <&TOP1_PD>" would not be sufficient.

This is the direction that I was thinking makes the most sense, and
actually reflects real hardware.

If you have any thoughts about what that binding change should look
like, maybe I can have a look at implementing it.

Kevin

>> The hierarchy I describe above is not made up, it's for the TI AM62L
>> SoC, which is in the process of being upstreamed[1], and we're trying to
>> figure out the proper way to describe the power domain hierarchy of this
>> SoC in a way that can support the multiple low-power idle states that
>> the SoC family plans to support.
>>
>> All suggestions, redirections, corrections welcome!
>>
>> Thanks,
>>
>> Kevin
>>
>> [1]
>> https://lore.kernel.org/r/20250109-am62lx-v3-0-ef171e789527@ti.com
>
> Kind regards
> Uffe
