Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8670720DD71
	for <arm-scmi@vger.kernel.org>; Wed, 16 Apr 2025 16:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744821266; cv=none; b=JodMU5oqhu95pz33u5Rm7fsI3tqS6mppkWHGHYJ7wewuJBCpB+FS+oiSWD+TGqrCvZ5yUdbVSODZTfFj6cz9TQSxHaX5aphHrq66K3EkpMCcwYa4NKvTWdS+s7yPJ/yzglFVQudCsLpijSgWcNBhj/iOhOMwHeKWVVqNqByGCCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744821266; c=relaxed/simple;
	bh=7SoI0oGtzOZ6HCH2IDW9oybiPN2+TVFIK/CXAeBgozM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Pv5TDRh7JdwoCd9k6TE+TCUrhXQMaSaQ1G0OT7xAyw1ZeF+8batux8CE2GiugfKKJcDKnqgRgI8s8YGFDJsJyVLr9Vq69jgJH3m3mc1NyebqMjLJ8C18/yDs5fzly6gVBDbrh2+9DQz4bFXEl4kzyv+bvF1Yw21RLZ/obCRuXbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mxhwD6mB; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mxhwD6mB"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b0b2d0b2843so420810a12.2
        for <arm-scmi@vger.kernel.org>; Wed, 16 Apr 2025 09:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744821262; x=1745426062; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ov42c5zztfFhtZEBC5JmNsWmbQ4/Rxp7O7sQweGfU0E=;
        b=mxhwD6mBnko73mAyVX1gLDQU58LSZOwOz8wcJLxZaAnVHSKtVsQ+iCaSsTV3dd6Ge0
         SNwpGIECXMmgRNDeUq8tE+VtiJytFBYZzSVdgp3/9kMFMJHsgQwu//Vt0LPhXWzAi9EM
         qsDmKEvqv4CRlFTyu3A/L+WdSqge5eTUGdtJOn3lqW5TiRfi3cgXuGMvi8FvidETcdYR
         C33XCfn8yKJR8zgNhvrNc0JZ9BBnKD2JHakcYOQH85sb3nVi/6tSMmUIoKB3TGDX++D9
         uyyuoGRVk1hlv8ULSQ+fTITczsnuFwPc1Go4BDp2xLS9CYMaHqkhhIFGgtZdolHoGpm5
         QEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744821262; x=1745426062;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ov42c5zztfFhtZEBC5JmNsWmbQ4/Rxp7O7sQweGfU0E=;
        b=UHSv74ZCgchvUUUynX6AqM00kcwmkTQVALGUbsuZq7553zrwx1wYuasDrDhPI+h+St
         +Qz80XDJtyszU3kLmsUvepJ2zTuHAaZHoYxwc8LGrcfuZCYhmfCUqtCE40pXejFncStj
         z9tfd1PIYz6MbqIpe7ZGwNjKnaRQOuzAVaGl3mzOPn+GD3q8RctJe3UMFar2TodcLXjU
         IAWLAT7eH3k3RdIpSMeifVHdkgT4ALw241zecmhvMi2BysCTZXgEPE4w8QhStfAE+NO8
         fFXtJfTbcTqFn73peEi3agloMudCkYlh9WNn2KvGAXhXR/YUvFLTjrd7V2Ql9uETDUOC
         hizQ==
X-Forwarded-Encrypted: i=1; AJvYcCUk8LiSn1w0Piq5HDcUw8esvXKslmZcizDnDM5qyrl4K9uCGOSVv9/emjLkhNjcfDuS0VNIkh5q2w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8oOQZGtaQFTX1dYbEHNBzZmpLp4RhrR+kR/786XeghomYxxQe
	XILYPJmt2i7U04nxNqj4XZyciRZeMcwu+1oQ0S6Fi0uK9V6iko6jL/Cn5R6f4jI=
X-Gm-Gg: ASbGncsjxVi/fZkZzShjSps9ZMNLLEUvyXn2OJLq7ppl3yo4ea3w02oeGB5pfd/U2yD
	TweXLrvAaX4ZSBViINcBQqSfFqMU7/YjutsLOHy76NQm/OKo990HUnsmEBMk4y7ecaNCaR/9sOP
	YZTdbdEsQGgCPvWaFV58aMmfhzj7O5nbVRHd3kUci81Cwyjx/Jjdu47FBjZxOSTwSZdzaVPaxd5
	beR22ru32ZA9ZxfQJ7LJhONSycQgg8B5ClRQKgVJaq3m4OOQJB+yqpXB74rq4jrJPmj3OdOYVmd
	BhI21KLDiqZn5D+cdjhpE6qo5Mcn9V6Yi1QazYA=
X-Google-Smtp-Source: AGHT+IGchc0BN41S/uuROvmkMfVWUYO6mmVDJ+kBd93be8bdeuam/iH+s6qqu3vXiQqhvJq92JbuPQ==
X-Received: by 2002:a17:90a:d647:b0:2fe:e9c6:689e with SMTP id 98e67ed59e1d1-30863f18292mr3835257a91.8.1744821262623;
        Wed, 16 Apr 2025 09:34:22 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308613cb77bsm2003480a91.47.2025.04.16.09.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 09:34:22 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: "cristian.marussi@arm.com" <cristian.marussi@arm.com>,
 "souvik.chakravarty@arm.com" <souvik.chakravarty@arm.com>, Sudeep Holla
 <sudeep.holla@arm.com>, "arm-scmi@vger.kernel.org"
 <arm-scmi@vger.kernel.org>, Dhruva Gole <d-gole@ti.com>, Sebin Francis
 <sebin.francis@ti.com>
Subject: Re: mixing SCMI and PSCI power domain hierarchy
In-Reply-To: <CAPDyKFpuqk3jH91rkDDz_kejyJ5pFg5XH+=vdTA2aP8MJKUWrw@mail.gmail.com>
References: <7hecy3h7ky.fsf@baylibre.com>
 <CAPDyKFoLJ4zey6GNzCb9roAAJ5mS7B7exU1NEKtpLyyjD0aADA@mail.gmail.com>
 <7hikn5c5v8.fsf@baylibre.com>
 <CAPDyKFpuqk3jH91rkDDz_kejyJ5pFg5XH+=vdTA2aP8MJKUWrw@mail.gmail.com>
Date: Wed, 16 Apr 2025 09:34:21 -0700
Message-ID: <7h7c3kcbg2.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ulf Hansson <ulf.hansson@linaro.org> writes:

> On Wed, 16 Apr 2025 at 02:22, Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> Ulf Hansson <ulf.hansson@linaro.org> writes:
>>
>> > On Tue, 8 Apr 2025 at 01:31, Kevin Hilman <khilman@baylibre.com> wrote:
>> >>
>> >> Hello SCMI folks,
>> >>
>> >> I'm trying to figure out how to model a power-domain hierarchy when
>> >> there is a mixture of SCMI and PSCI domains.
>> >>
>> >> Let's say I have a top-level PD, managed by PSCI, but inside it it has
>> >> both a CPU cluster (with cluster & CPU PDs controlled by PSCI) as well
>> >> as some other sub-domains for leaf devices that are controlled by SCMI.
>> >> A simplified version looks something like this:
>> >>
>> >> SOC
>> >>  |
>> >>  |- TOP1_PD (PSCI)
>> >>      |
>> >>      |-- LEAF1_PD (SCMI)
>> >>      |-- LEAF2_PD (SCMI)
>> >>      |
>> >>      \-- CLUSTER_PD (PSCI)
>> >>          |
>> >>          |-- CPU1_PD (PSCI)
>> >>          \-- CPU2_PD (PSCI)
>> >>
>> >>
>> >> So the main question is: how do I describe the SCMI part of this today
>> >> in DT?  Currently, I have something like this for the SCMI-controlled
>> >> PDs:
>> >>
>> >>         scmi_pds: protocol@11 {
>> >>                 reg = <0x11>;
>> >>                 #power-domain-cells = <1>;
>> >>                 bootph-all;
>> >>         };
>> >>
>> >> and the leaf devices under LEAF1_PD and LEAF2_PD would have
>> >> `power-domains = <&scmi_pds N>` properties, indicating their PD is
>> >> managed by SCMI.  That part works fine.  And I'm also able to model the
>> >> CPU PDs and CLUSTER_PD just fine, including using
>> >> domain-idle-states... (Hi Ulf ;)
>> >>
>> >> But... how do I describe the relationship of this hierarchy?  In
>> >> particular, when the SCMI-controlled PDs are actually subdomains of a
>> >> top-level, non-SCMI PD.  I tried adding `power-domains = <&TOP1_PD>`
>> >> inside the scmi_pds node, but that property seems to be ignored.  So it
>> >> seems that currently it has not been considered to have SCMI PDs as
>> >> sub-domains of other PDs.  Is that correct?  Is this something anyone
>> >> else has considered adding?
>> >
>> > I haven't heard of this topology before, but I believe I can
>> > understand the need for it. Especially when using the PSCI OSI mode.
>> >
>> > In principle, if any of those LEAF1_PD/LEAF2_PD are being in use we
>> > must not allow the PSCI state to be selected that corresponds to the
>> > TOP1_PD. Right?
>>
>> Correct (mostly.)  TOP_PD may potentially have multiple domain-idle
>> states, and if any LEAFx_PD are active, it could just mean that only the
>> retention state(s) of TOP_PD should be selected, not ones that involve
>> context loss.
>
> Okay, I get it.
>
> Do note that, the genpd and its governor doesn't support this today.
> Only when the child domain enters the deepest state, the parent domain
> can be powered-off (one of its states can be selected). Of course, I
> think it should be possible to extend genpd to support this.

Yes, I'm aware of the current limitations here.  I hope to contribute
some support for this also.

>> > I can think of two ways forward, there may be others:
>> > 1) Put the leaf devices themselves in TOP1_PD *and* LEAF1_PD/LEAF2_PD.
>> > Thus these devices would have two power-domains. Whether this actually
>> > works for your case, I am not sure of, but I think it could be an
>> > option.
>>
>> Hmm, I don't follow.  How/why would this help?
>>
>> And more importantly, does the current PM domain code support devices
>> that have multiple PM domains?  I see there are examples in the binding
>> docs, but I have not seen that in practice anywhere yet.  I did a quick
>> test by adding
>>
>>    power-domains = <&scmi_pds N>, <&TOP_PD>;
>>
>> in one of the DT nodes, and at least according to
>> <debugfs>/pm_genpd_summary, not only does it disappear from the SCMI PD,
>> it also doesn't show up in TOP_PD.  It seems it can be in one or the
>> other, but not both.
>
> Attaching a single PM domain is managed by bus-level code via
> dev_pm_domain_attach().
>
> If a device has multiple PM domains, the driver/bus for it needs to
> manage that specifically, typically by using
> dev_pm_domain_attach_list().

OK, I see.  But in my quick experiment with this, I found that adding a
2nd domain to a devices power-domain property, it disappeared from the
first domain also.  Any idea what is happening there?

> The idea in 1) was based upon that we
> could manage the two PM domains via a device_link that we would create
> when calling dev_pm_domain_attach_list(). Not sure if it would really
> that well, but possibly.

OK, I can have a look at this.  But describing things in DT this way
( a leaf device listing 2 PDs ) doesn't seem like a correct description
of the hardware, and more of a workaround of Linux limitations. 

>> > 2) Enable parents to be described in the "scmi_pds" node. To do that,
>> > we need to extend the DT bindings a bit, as we need the SCMI index
>> > that should correspond to the SCMI-child-power-domain. In other words
>> > "power-domains = <&TOP1_PD>" would not be sufficient.
>>
>> This is the direction that I was thinking makes the most sense, and
>> actually reflects real hardware.
>>
>> If you have any thoughts about what that binding change should look
>> like, maybe I can have a look at implementing it.
>
> Usually we describe parent domains by using the original power-domain
> DT binding, but this is limited to work for when the child-domain node
> has #power-domain-cells = <0>.
>
> We need to investigate if there are any other DT bindings we can get
> some influence from, perhaps clocks have something similar?
>
> Anyway, without further thinking my idea would be to add a new
> property ("power-domain-child-ids") where we can put a list of indexes
> for the child-domain that corresponds to each of the parents that we
> can list in "power-domains".

OK,  I'll start researching some options here.

Thanks for the guidance,

Kevin
