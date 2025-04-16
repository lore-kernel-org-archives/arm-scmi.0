Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E043E1519B4
	for <arm-scmi@vger.kernel.org>; Wed, 16 Apr 2025 13:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809783; cv=none; b=Z9FpTZ/99cqqA4m+F2j6brX4L1qvHW7/KJMhTEmJ26PmYTDBI+tnK/nfoYK11W4UjrcX/lKVStteR9vd3PEywoPbUzgVdHy3HvmtJOubpD8oZkf8c2+Mhm/NrROKKD4L0TJl0jjJbASRt8fScHE825/qcJUz9xuaxGMDfFTdAqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809783; c=relaxed/simple;
	bh=fdmkCVNZD+OLt08bDKDUJNgAcnZYD3q5tfbD4xiZT4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s6u1fhrJQvbQz3u/i4AC2b+r/hqZX7wZYTMVIPkM6fE4CU6gH2nbEhiWBL4bYvysrNk674D1RRAp5pOUe+OmvOf3yV2hhzm1szKGI9bu5X0S/6KsDtejw2XuhkJV3aLfrDVf8NTLWjHEdiVnIklDwg62xhrt1XAy8TNZ8ZLOwN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j78BZrrj; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j78BZrrj"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7040ac93c29so69648327b3.3
        for <arm-scmi@vger.kernel.org>; Wed, 16 Apr 2025 06:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744809780; x=1745414580; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D4Hvom9AuIKnQlEwMInMMU9cJYj8gXhiac3xAK/x9us=;
        b=j78BZrrjLnqOm7U9qKWbYlII0fhMES9fx0HW4E2ww90c9ae71KAs3uM2kpk8W+c31f
         1eCxl9AB5hpud9nxZStEXcqvB9JBjtBHWD0jmSjYN3oD5QJtJ5NjS5k1ihLZQ90raGEt
         1VWQRb5X/6zSsW5zCnLxdXHzXInfZBf0UdJknnZlt6irfO1QEze7ImaeoCHgfti/r/of
         k0sWecsFgO7QUQbGxF5FLF6vcSlXOVD9ZD6BQoPU3Q9xoALvWWCwUrDOsph6JgvxMA9K
         Gln99L06GvaRjHtVMlh8zWwu8H7+iQpEQp3CZnSVD7YzCIdgp29sApDahNAF0bLcILeA
         KYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744809780; x=1745414580;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D4Hvom9AuIKnQlEwMInMMU9cJYj8gXhiac3xAK/x9us=;
        b=aMgaw/JeNTao+ZYWoVAwb1waatoGpCZiiuMbimjyveOGknZ6ImzBYP6egPajRssW6a
         NDea8kLkkqqA6eY9IqcbdU6Dba8Bm51UGIeie0YFgaDinxsXQFOKlmKxftmJZylXmsg9
         8GExlQXsXpogIIO1dAm60luqoGJlvIvKK9DFHVIk80+UFTDwrqkluG5DOBuZM2Oj8U6d
         Pd/fHRG/gN255L6jOc17tvStSDVA2B/x9iRnSOZTvnj5nmMl96NiwTHM/NAAvzA+9Thb
         3HHedXRTtNDix42eg6nx7FA9e1RK72WNZNrVZiVk+y7MR+YZzthxQKgkNsZeGjWHNDIP
         jjhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHCR8mixC6ceAIIUYa3ksvk1sOfkU21XC8awGu34ew+1EULQk4DeqEebLI8ee2JX6TehRS5Z26pg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt+5w2ung7oCmiIWBBvXrpfXg1g9smBRzIOl+m0SY56mZugjkO
	+lwFZ/VIqzR3hBbyuUG+8mERpCNtaBPYBWRtsapGLMf2oZZ3E+wXLOn7TXDZMEN1PHY7kkqka+w
	2W97eLqShKZ7Qf1c8pCwytSRjoSASEpKiBZY4jg==
X-Gm-Gg: ASbGncvbGjTFSOMubSB3bolc1t7ElQRRscA/nbdMW11+LsF1ZNeiwOyEMMutxGVyPYP
	LmfGxpWiUdJbrI7cyZJQBjxlvqZtyVEZAjfE//0Sxd1WxWLb8dRCXnBCGhoZYknmCHTiWSnT/pT
	SlwbkAXoRA8SAofkZBhZJxm18GlIT5IttIFg==
X-Google-Smtp-Source: AGHT+IHzMIPSOVgnF3SAtIqFsVmAmtY/Q8JZGZwiQlZPATElUT+ict9JZhMy+Mme4u+/JESrvAmFaLIe3SuzIoDEy/Q=
X-Received: by 2002:a05:690c:6801:b0:6fb:4c11:61cf with SMTP id
 00721157ae682-706b32df315mr24015277b3.19.1744809780490; Wed, 16 Apr 2025
 06:23:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7hecy3h7ky.fsf@baylibre.com> <CAPDyKFoLJ4zey6GNzCb9roAAJ5mS7B7exU1NEKtpLyyjD0aADA@mail.gmail.com>
 <7hikn5c5v8.fsf@baylibre.com>
In-Reply-To: <7hikn5c5v8.fsf@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 16 Apr 2025 15:22:24 +0200
X-Gm-Features: ATxdqUHlSYwfYbqFUKEYPuxb9ztfQOoCkhNPF5DMeFcoY95Jp-Uk1G0BKjddg9g
Message-ID: <CAPDyKFpuqk3jH91rkDDz_kejyJ5pFg5XH+=vdTA2aP8MJKUWrw@mail.gmail.com>
Subject: Re: mixing SCMI and PSCI power domain hierarchy
To: Kevin Hilman <khilman@baylibre.com>
Cc: "cristian.marussi@arm.com" <cristian.marussi@arm.com>, 
	"souvik.chakravarty@arm.com" <souvik.chakravarty@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>, Dhruva Gole <d-gole@ti.com>, 
	Sebin Francis <sebin.francis@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Apr 2025 at 02:22, Kevin Hilman <khilman@baylibre.com> wrote:
>
> Ulf Hansson <ulf.hansson@linaro.org> writes:
>
> > On Tue, 8 Apr 2025 at 01:31, Kevin Hilman <khilman@baylibre.com> wrote:
> >>
> >> Hello SCMI folks,
> >>
> >> I'm trying to figure out how to model a power-domain hierarchy when
> >> there is a mixture of SCMI and PSCI domains.
> >>
> >> Let's say I have a top-level PD, managed by PSCI, but inside it it has
> >> both a CPU cluster (with cluster & CPU PDs controlled by PSCI) as well
> >> as some other sub-domains for leaf devices that are controlled by SCMI.
> >> A simplified version looks something like this:
> >>
> >> SOC
> >>  |
> >>  |- TOP1_PD (PSCI)
> >>      |
> >>      |-- LEAF1_PD (SCMI)
> >>      |-- LEAF2_PD (SCMI)
> >>      |
> >>      \-- CLUSTER_PD (PSCI)
> >>          |
> >>          |-- CPU1_PD (PSCI)
> >>          \-- CPU2_PD (PSCI)
> >>
> >>
> >> So the main question is: how do I describe the SCMI part of this today
> >> in DT?  Currently, I have something like this for the SCMI-controlled
> >> PDs:
> >>
> >>         scmi_pds: protocol@11 {
> >>                 reg = <0x11>;
> >>                 #power-domain-cells = <1>;
> >>                 bootph-all;
> >>         };
> >>
> >> and the leaf devices under LEAF1_PD and LEAF2_PD would have
> >> `power-domains = <&scmi_pds N>` properties, indicating their PD is
> >> managed by SCMI.  That part works fine.  And I'm also able to model the
> >> CPU PDs and CLUSTER_PD just fine, including using
> >> domain-idle-states... (Hi Ulf ;)
> >>
> >> But... how do I describe the relationship of this hierarchy?  In
> >> particular, when the SCMI-controlled PDs are actually subdomains of a
> >> top-level, non-SCMI PD.  I tried adding `power-domains = <&TOP1_PD>`
> >> inside the scmi_pds node, but that property seems to be ignored.  So it
> >> seems that currently it has not been considered to have SCMI PDs as
> >> sub-domains of other PDs.  Is that correct?  Is this something anyone
> >> else has considered adding?
> >
> > I haven't heard of this topology before, but I believe I can
> > understand the need for it. Especially when using the PSCI OSI mode.
> >
> > In principle, if any of those LEAF1_PD/LEAF2_PD are being in use we
> > must not allow the PSCI state to be selected that corresponds to the
> > TOP1_PD. Right?
>
> Correct (mostly.)  TOP_PD may potentially have multiple domain-idle
> states, and if any LEAFx_PD are active, it could just mean that only the
> retention state(s) of TOP_PD should be selected, not ones that involve
> context loss.

Okay, I get it.

Do note that, the genpd and its governor doesn't support this today.
Only when the child domain enters the deepest state, the parent domain
can be powered-off (one of its states can be selected). Of course, I
think it should be possible to extend genpd to support this.

>
> > I can think of two ways forward, there may be others:
> > 1) Put the leaf devices themselves in TOP1_PD *and* LEAF1_PD/LEAF2_PD.
> > Thus these devices would have two power-domains. Whether this actually
> > works for your case, I am not sure of, but I think it could be an
> > option.
>
> Hmm, I don't follow.  How/why would this help?
>
> And more importantly, does the current PM domain code support devices
> that have multiple PM domains?  I see there are examples in the binding
> docs, but I have not seen that in practice anywhere yet.  I did a quick
> test by adding
>
>    power-domains = <&scmi_pds N>, <&TOP_PD>;
>
> in one of the DT nodes, and at least according to
> <debugfs>/pm_genpd_summary, not only does it disappear from the SCMI PD,
> it also doesn't show up in TOP_PD.  It seems it can be in one or the
> other, but not both.

Attaching a single PM domain is managed by bus-level code via
dev_pm_domain_attach().

If a device has multiple PM domains, the driver/bus for it needs to
manage that specifically, typically by using
dev_pm_domain_attach_list(). The idea in 1) was based upon that we
could manage the two PM domains via a device_link that we would create
when calling dev_pm_domain_attach_list(). Not sure if it would really
that well, but possibly.

>
> > 2) Enable parents to be described in the "scmi_pds" node. To do that,
> > we need to extend the DT bindings a bit, as we need the SCMI index
> > that should correspond to the SCMI-child-power-domain. In other words
> > "power-domains = <&TOP1_PD>" would not be sufficient.
>
> This is the direction that I was thinking makes the most sense, and
> actually reflects real hardware.
>
> If you have any thoughts about what that binding change should look
> like, maybe I can have a look at implementing it.

Usually we describe parent domains by using the original power-domain
DT binding, but this is limited to work for when the child-domain node
has #power-domain-cells = <0>.

We need to investigate if there are any other DT bindings we can get
some influence from, perhaps clocks have something similar?

Anyway, without further thinking my idea would be to add a new
property ("power-domain-child-ids") where we can put a list of indexes
for the child-domain that corresponds to each of the parents that we
can list in "power-domains".

[...]

Kind regards
Uffe
