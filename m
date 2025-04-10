Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762CC2857F4
	for <arm-scmi@vger.kernel.org>; Thu, 10 Apr 2025 13:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744290478; cv=none; b=G329vdqqNDMI5I3SY12mJuBdRQLwkR2UoaBc/XFqFeuYvBsj4+yt9hiUOj9Hfa70RQQoxa8MF+oDsTt7qxluEcd8xLPiNDZKsyuxacsbxtbvxOAc0T8kt6cmX5JNbQz0PEqsKjDpsxNWMojscYF4cdbVgbm65nnQJ0qC50NEzG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744290478; c=relaxed/simple;
	bh=lHD4Q+UyGGesE7j57jrgWLir7MbHLPfKarul8sWlSUQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jdIF+1yH7lGkSmOGW7Q+8g5Zf3OAeLo70P70ttdKzYrD6HCMGe04Rb8GzDAnZGrzTDx+oTQLvgxnogqMfobx5A/7LKuWOSUqz/2psr7RFtM5FnNakwVcWmL2gn0Nu/zpkZ0zN/uuT0QPOxTHLqmzqbFW8i0QreRS29PbwOKeiB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pVhFOC7s; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pVhFOC7s"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6ff37565154so7665147b3.3
        for <arm-scmi@vger.kernel.org>; Thu, 10 Apr 2025 06:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744290474; x=1744895274; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4+YwqgkWX6ksp6dOtQcWchvaVAU91OcpE7UzR6g9Gxk=;
        b=pVhFOC7sfw4OcjRv9/CexIbKLva0YTVOMfgDhGWbRxpA3b9ojYKodXZLyOU4NqUS/v
         XvGz8q3RpEQ/hxQle5AtK8ziTyOPT6CUuc/Ee5dvUHWffMdVz536bJJFu/JUD/2hFDYN
         tdQR6jIoL0PUwWw7i6Vc7No9UG6Sitvne6dZLtUMx43hXk9GPkPcOw4JWt4qez7clgmm
         xUyiZHzjRfY0LDY01aMjH+KcxcWoUnDgSS/KHmYAX7rE1bdtq1JLzBZDO6OCkIsFmncm
         2RDkFV6VeA2Wz5liMTi4+a4EoyzpYTz+5bOpPFcG0g2EaF4r+zQFhaRrDXwn6LS43ZVg
         A4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744290474; x=1744895274;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4+YwqgkWX6ksp6dOtQcWchvaVAU91OcpE7UzR6g9Gxk=;
        b=g/NyvAeqqhjqCy2A7IpmOOdsTgid0US9NxkwrwoUCUN91wdOVH9tJV3qUzW3qFq2iD
         vT/KNMvMyVy0c8vl44vV3Vyjh5l/FKnUD8BSHv12KtMbtR07/p469IcXiyHKjexatvmY
         DEOhATMZsKb4Rrocz/oCEErDncoZ0aQsc+gby6vbC03+ZyKrj+H2E4i6oLkiusSjI4cw
         e5MAQ/gevYGv+jXBhcz1BbW4TfdrB54wj0U3aAWvZi7eZ5EsuQo0Mg5g+5aCzeR3Qw1B
         F4dAyh/5QJUgUtqql7KxSFa66odzrJZDT3MhnF9BMQDD3noBufNcHrnYGYJhef48itk7
         YQwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhGybPUARV1OcDxCABSgXLpMQDMCNVDEdUcc5HSg5PcZWZbRsUjq40IYgj2gtSvxJ8IK2PCy1zAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlNzuuy76/fzE7vylxxREaTMCxy6KP9r9jAXpFjqzMnxi/VN2m
	aIjqBRPDb9UFGCjjscgFz4R8rtD8jZFcLYIAwVi/TdfNcZBaeHZP/VnqRvWPOQoDLp4Jc7u2eC/
	OpNWyLyAIQqYD+CohBLKBJQWJjwh1VP6lbHJZ1A==
X-Gm-Gg: ASbGncssYtpyM3OOYdTcClsBso71GZuIsDFJ61Zf1rcTHpJvAs+gNUhhQeJiHXyptan
	V+86t5UVk/ckcoKC6V8STdBMokUmRzbcxWb1itqwUCSp92RbXlg/mMQu+5i8wbh8Yeim0qesk2I
	VQZ0OnukBERCvYrq61MS+eDhs=
X-Google-Smtp-Source: AGHT+IHTj9lVHNHQRCehqTJchNEjMsbVYHpTAKLI/Xhh0UmTB8KvIYb0Jfzp9MpyTiwZV4tsdHae2Rtsj4rX/UcTZ7Y=
X-Received: by 2002:a05:690c:25c5:b0:703:b3f8:9e7d with SMTP id
 00721157ae682-70549ece55cmr45223237b3.19.1744290474298; Thu, 10 Apr 2025
 06:07:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7hecy3h7ky.fsf@baylibre.com>
In-Reply-To: <7hecy3h7ky.fsf@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 10 Apr 2025 15:07:17 +0200
X-Gm-Features: ATxdqUEpJ0U9hw0calU5ntHedKjy-gCWh6d2-QCnRYVfz8b3ThunH7OQr0KrTHY
Message-ID: <CAPDyKFoLJ4zey6GNzCb9roAAJ5mS7B7exU1NEKtpLyyjD0aADA@mail.gmail.com>
Subject: Re: mixing SCMI and PSCI power domain hierarchy
To: Kevin Hilman <khilman@baylibre.com>
Cc: "cristian.marussi@arm.com" <cristian.marussi@arm.com>, 
	"souvik.chakravarty@arm.com" <souvik.chakravarty@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>, Dhruva Gole <d-gole@ti.com>, 
	Sebin Francis <sebin.francis@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Apr 2025 at 01:31, Kevin Hilman <khilman@baylibre.com> wrote:
>
> Hello SCMI folks,
>
> I'm trying to figure out how to model a power-domain hierarchy when
> there is a mixture of SCMI and PSCI domains.
>
> Let's say I have a top-level PD, managed by PSCI, but inside it it has
> both a CPU cluster (with cluster & CPU PDs controlled by PSCI) as well
> as some other sub-domains for leaf devices that are controlled by SCMI.
> A simplified version looks something like this:
>
> SOC
>  |
>  |- TOP1_PD (PSCI)
>      |
>      |-- LEAF1_PD (SCMI)
>      |-- LEAF2_PD (SCMI)
>      |
>      \-- CLUSTER_PD (PSCI)
>          |
>          |-- CPU1_PD (PSCI)
>          \-- CPU2_PD (PSCI)
>
>
> So the main question is: how do I describe the SCMI part of this today
> in DT?  Currently, I have something like this for the SCMI-controlled
> PDs:
>
>         scmi_pds: protocol@11 {
>                 reg = <0x11>;
>                 #power-domain-cells = <1>;
>                 bootph-all;
>         };
>
> and the leaf devices under LEAF1_PD and LEAF2_PD would have
> `power-domains = <&scmi_pds N>` properties, indicating their PD is
> managed by SCMI.  That part works fine.  And I'm also able to model the
> CPU PDs and CLUSTER_PD just fine, including using
> domain-idle-states... (Hi Ulf ;)
>
> But... how do I describe the relationship of this hierarchy?  In
> particular, when the SCMI-controlled PDs are actually subdomains of a
> top-level, non-SCMI PD.  I tried adding `power-domains = <&TOP1_PD>`
> inside the scmi_pds node, but that property seems to be ignored.  So it
> seems that currently it has not been considered to have SCMI PDs as
> sub-domains of other PDs.  Is that correct?  Is this something anyone
> else has considered adding?

I haven't heard of this topology before, but I believe I can
understand the need for it. Especially when using the PSCI OSI mode.

In principle, if any of those LEAF1_PD/LEAF2_PD are being in use we
must not allow the PSCI state to be selected that corresponds to the
TOP1_PD. Right?

I can think of two ways forward, there may be others:
1) Put the leaf devices themselves in TOP1_PD *and* LEAF1_PD/LEAF2_PD.
Thus these devices would have two power-domains. Whether this actually
works for your case, I am not sure of, but I think it could be an
option.

2) Enable parents to be described in the "scmi_pds" node. To do that,
we need to extend the DT bindings a bit, as we need the SCMI index
that should correspond to the SCMI-child-power-domain. In other words
"power-domains = <&TOP1_PD>" would not be sufficient.

>
> The hierarchy I describe above is not made up, it's for the TI AM62L
> SoC, which is in the process of being upstreamed[1], and we're trying to
> figure out the proper way to describe the power domain hierarchy of this
> SoC in a way that can support the multiple low-power idle states that
> the SoC family plans to support.
>
> All suggestions, redirections, corrections welcome!
>
> Thanks,
>
> Kevin
>
> [1]
> https://lore.kernel.org/r/20250109-am62lx-v3-0-ef171e789527@ti.com

Kind regards
Uffe
