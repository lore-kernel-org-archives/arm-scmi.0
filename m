Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE57221764C
	for <arm-scmi@vger.kernel.org>; Tue, 12 Nov 2024 18:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731437318; cv=none; b=R7LFeEwFZiFa0RKnyKEREnrjjtKxPeEDeEyt+/mMYDE+48w9B9w9P6WzDGIpiHznx3ClaFk0/1indYaMDdpf+giKf8zs1lMyCNXlrS2NiYzkRgknjiE0qPz/BFKG1XZM78PPaX5nc5SAWkRgson+oV6LDgViQFCcMgkE4nn5OyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731437318; c=relaxed/simple;
	bh=nZFqPwj9BUmaePBPVbuDjEfu7haZCtJGCGtPxjBdfVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r5RoiQH+BdV4WN3OV1JrQpqPLxdkwdBetDeKHSsFimBddLm5J0ZecM9YWxITOC/J0RfJ/ptOEF5c7gr9V36lY3pRIz1RWO5TyvFOxppwwD0nZpgTsFonhktV0cq+okE4ZqFGl7W8Hn5+r9f9kK4dUAYmEJd/lE5+1jVPlKiY94A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dZk0boJd; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dZk0boJd"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e9ed5e57a7so49053567b3.1
        for <arm-scmi@vger.kernel.org>; Tue, 12 Nov 2024 10:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731437316; x=1732042116; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vLfb7kUGJLjR3dpRxNjHUX8zNIZ2DpFKhaioXvi+P10=;
        b=dZk0boJdnyXKMW4zV7hFcJB3rYCnur/aSB+WvOdAIOXAgKwaezat708kClyF6v0/1J
         hNg4tTzzmnShjLUqy5dRpPcgbWGPGR4DD9uvchoCTFEtQ+sjj9VPn4fPQyI3Z2hUYn0s
         fEztvP7tLnzjrdHHylW7+60UnFnldvrilgY9qZmJqFmLqQEvdgtYATsfdhrXI27t4TXA
         7QhkLQN6UkpTv2F1iMuVMnmRUaXNjtS8GJMK/XsP8c03nxOIeuRwU7Z2BzkNh/Yf9taO
         VcU44HrehPYN8ahpPqZuykNP0k2vsWaM0znj6e38wac1DF3Ujr5VhX7BaBk+3EiiMnmv
         nAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731437316; x=1732042116;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vLfb7kUGJLjR3dpRxNjHUX8zNIZ2DpFKhaioXvi+P10=;
        b=H9dIUgjfCU5AXGqRgIlJbDb7Lr4PKCcC0f1vzk+P9UL/e6ec72C+N+j7RFLqBuZCZp
         eXpmYXg4/qT7HoO6iY331dhWj3y3MR6qONtFYG1cGREmlCqpfjh1vh7SoxAZrsC7zKap
         an/VgWFa09zAPXk1eY0+MJvwxH2vAFBXeVl63mVNcWkNzeNP4nrrYhilyduQkfqIP/OP
         HNke0nIoaiHT1A30Sz23KlgChVCwUT3udnnatz+t6jQ7zhkOealSdsO/3NYd1MRRtcUR
         uB9LUqGR17c0gldb8NApW+IobWRcnRFRwCJEvm+qb7DQ+MXmIrHIptaYlEf7CxVLRVT0
         yX9w==
X-Forwarded-Encrypted: i=1; AJvYcCVYhxLlIj7WvRyqkt7CHXcHlW+oNgNuyHLZ4KloGaNu4WjDqSmOdrjIbgLszlqxX9hdvTmEYwwGXg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw4ru0VTi7KISNNQEh7luBeRAZO3fuxfiFTrEWNycQe/Uki6Pa
	GNUTDTjJQkR50BiZCNGY1wU5podQqFXkmjyZliVkpLFg3sfGVRGzj/BDkye4tiEpsYWW2pVsUMk
	PFyPfAoV63u8wM4am+cvP3Z0U/SBMrIevt+Q+Yg==
X-Google-Smtp-Source: AGHT+IHU1F4In8hSy3BHO7PzehPnwak0Jka/B7VCySs0mHPl9uCBdzOrrdhGUm0wtjc2hrnl2RWBoqNBIdeikfPQLfY=
X-Received: by 2002:a05:690c:6d10:b0:6be:54e1:f1f3 with SMTP id
 00721157ae682-6ecb30a5145mr1527607b3.0.1731437315975; Tue, 12 Nov 2024
 10:48:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030125512.2884761-1-quic_sibis@quicinc.com>
 <CAPDyKFoY8CnxF7JXzkT9_WXyM-TJhW4kmTw=H8NEzch32N1_7Q@mail.gmail.com>
 <ZyJeuVIbWkohymW5@pluto> <20241106071215.jhnzcn4vkdfr3peg@bogus>
 <CAPDyKFr-pmXEhgUgCapzQX3Hn_UAM632TaG8SdkQXaCn5-y42g@mail.gmail.com> <ZzOOPJ_gI9TGadzV@hovoldconsulting.com>
In-Reply-To: <ZzOOPJ_gI9TGadzV@hovoldconsulting.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 12 Nov 2024 19:48:00 +0100
Message-ID: <CAPDyKFqnnw1A+R_wohpV7orKV4oGJNyxD+QL667iWq9d_odmfw@mail.gmail.com>
Subject: Re: [PATCH V5 0/6] firmware: arm_scmi: Misc Fixes
To: Johan Hovold <johan@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Sibi Sankar <quic_sibis@quicinc.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, jassisinghbrar@gmail.com, 
	dmitry.baryshkov@linaro.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, konradybcio@kernel.org, 
	linux-pm@vger.kernel.org, tstrudel@google.com, rafael@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Nov 2024 at 18:20, Johan Hovold <johan@kernel.org> wrote:
>
> On Tue, Nov 12, 2024 at 04:56:26PM +0100, Ulf Hansson wrote:
> > On Wed, 6 Nov 2024 at 08:12, Sudeep Holla <sudeep.holla@arm.com> wrote:
> > > On Wed, Oct 30, 2024 at 04:28:41PM +0000, Cristian Marussi wrote:
> > > > On Wed, Oct 30, 2024 at 05:19:39PM +0100, Ulf Hansson wrote:
> > > > > On Wed, 30 Oct 2024 at 13:55, Sibi Sankar <quic_sibis@quicinc.com> wrote:
> > > > > >
> > > > > > The series addresses the kernel warnings reported by Johan at [1] and are
> > > > > > are required to X1E cpufreq device tree changes to land.
> > > > > >
> > > > > > [1] - https://lore.kernel.org/lkml/ZoQjAWse2YxwyRJv@hovoldconsulting.com/
> > > > > >
> > > > > > Duplicate levels:
> > > > > > arm-scmi arm-scmi.0.auto: Level 2976000 Power 218062 Latency 30us Ifreq 2976000 Index 10
> > > > > > arm-scmi arm-scmi.0.auto: Level 3206400 Power 264356 Latency 30us Ifreq 3206400 Index 11
> > > > > > arm-scmi arm-scmi.0.auto: Level 3417600 Power 314966 Latency 30us Ifreq 3417600 Index 12
> > > > > > arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > > > > > arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > > > > > arm-scmi arm-scmi.0.auto: Level 4012800 Power 528848 Latency 30us Ifreq 4012800 Index 15
> > > > > >
> > > > > > ^^ exist because SCP reports duplicate values for the highest sustainable
> > > > > > freq for perf domains 1 and 2. These are the only freqs that appear as
> > > > > > duplicates and will be fixed with a firmware update. FWIW the warnings
> > > > > > that we are addressing in this series will also get fixed by a firmware
> > > > > > update but they still have to land for devices already out in the wild.
> > > > > >
> > > > > > V4:
> > > > > > * Rework debugfs node creation patch [Ulf/Dmitry]
> > > > > > * Reduce report level to dev_info and tag it with FW_BUG [Johan/Dmitry]
> > > > > > * Add cc stable and err logs to patch 1 commit message [Johan]
>
> > Sorry for the delay. I have picked up the remaining patches from this
> > series. All applied for fixes and by adding stable tags to them,
> > thanks!
>
> As I reported here:
>
>         https://lore.kernel.org/lkml/ZyTQ9QD1tEkhQ9eu@hovoldconsulting.com/
>
> I'm seeing a hard reset on the x1e80100 CRD and Lenovo ThinkPad T14s
> when accessing the cpufreq sysfs attributes.
>
> Sibi tracked it down to the first patch in this series ("firmware:
> arm_scmi: Ensure that the message-id supports fastchannel") and
> reverting that one indeed fixes the reset.
>
> Unfortunately this was only discussed on IRC and was never reported in
> this thread.
>
> Ulf, could you please drop the first patch again until we've figured out
> how best to handle this?

Done, thanks!

Kind regards
Uffe
