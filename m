Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28ABE1EF931
	for <arm-scmi@vger.kernel.org>; Fri, 25 Oct 2024 11:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729856277; cv=none; b=BZeySavLrcfYoF6Jph9vCKxv5vNhR1NhMr53tELI0icqe3Tmwd4Qk7S2b3NcbTB06gvq8Y107DaE7uKBkyPzPPmV/METmi1HiMwx0NeTz+p/eDiLDh+/MdgO3kHHycs85Tc20NgPXv36bgbK9tvB15k7+/iXyWFkN2unPJuOc0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729856277; c=relaxed/simple;
	bh=JBPlVg6/v6xkLhr502ea/jDXXq8F1N17DPmNfwDEhpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pPdyBaFaMVzm0lsDzK8LLKeqCA5mJSWE3b6OF4UPl22rMnv8R6W+5Me933zX6/mWhsl0ix9mCb5bgmoEBlC8AQwBlaUy0qA0PTliyGsUUPLOlcIYH/Pe13gZckZ85j6YZa2PVdBxsl7gLcKHJjAjLjvx1huti/gwZ2L447Dsn+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qo853Jkt; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qo853Jkt"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e5b7cd1ef5so19099857b3.1
        for <arm-scmi@vger.kernel.org>; Fri, 25 Oct 2024 04:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729856274; x=1730461074; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0pj9tzR92Ou3K3UATrngQxHQphalhdLPCHq3UGtO/E=;
        b=Qo853Jkth6Akaaga1PorJMmHjiMhl/g6rThlGOLI4mF3mRacS8itmWlCGweX5Uid58
         4X75YTCyKxcimI2WUdVv+OpeFySkqf2ImkICbFnGA/EbC2B+mPe/OxiEZ+q9sZaEVD5Q
         4vQCqoRZCtxuiAaiMownF1vbofYJnlNNhkmofQChfLw66+HdEh47MmIObsNUyacNLQPF
         vOooRV54V3ARgVvjs/ibK48Ag7JWS+uTZv7G2+OapNFZv0RXA41DyLYN+fgjlBzUf3rt
         izl3+N6PVs/0FQzBMAGB28sl4hiYEQWtEBu7V0Dkbqxtz35Avolpi+yB2gYTa4xDLUn+
         UAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729856274; x=1730461074;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0pj9tzR92Ou3K3UATrngQxHQphalhdLPCHq3UGtO/E=;
        b=QOtHyLi77CzwS9kh8olwH7+isuTAynRj3Ein8bdlcRPJ7qAz5CUZij6UXwnNzbNvdM
         bIo68Jk8uEFgStbcciqlqeokjYv/u206gwT6FvWe12f1NVZmzAwU5xIIJ7SLixiEJzvs
         OQZS41qH4y6SByEwsZH1QgRfkynz1r/TsJuY+4lbOSoGSNnXlGmU740EjSRCzn5s2cZQ
         i6iKFoeflIO7TepcGcSdZMDiVY9/pStevd9iKGvQriKXBtaSFKthkjzUHRXl5QYEcMpq
         qxRCX4hioV8zX/uLv/MkD7skmUMiSVpw2HvQ2ms+qGSFnq7Vw5iZRnABp75o7O6QJche
         etvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAUF02L7UarADTiNjQ7NyES8FU8reIRPB+4vd1sOdJ/jinxsLV8ydEttewSBDcPNCQHvT+/zo8WQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBhBOrfEL3Wuyumjrr+ikGpPXKBpv3KeYw6W5dBOyZoQK3qGxR
	y53JZInuU4/kn4MeAiH0yn1K3L3FQI/+HGJzUXZu3EDksGpEmpKq8vYftFaLoijd4XiWGl18kIY
	7vpT7HSr2SFns6TBht6TBOFcx4Ur2UST3FDCiDg==
X-Google-Smtp-Source: AGHT+IFD7BTwdcuI9robY2MpZ2IUhz+lf5Zd1wfHJA/mGIwmXrFvkZLAnH4rQ6mJPWdfJLOdnu4/9FdSj1zt0edPMB0=
X-Received: by 2002:a05:690c:4b0a:b0:6e7:d974:8d05 with SMTP id
 00721157ae682-6e858152039mr66322057b3.4.1729856274035; Fri, 25 Oct 2024
 04:37:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241007060642.1978049-1-quic_sibis@quicinc.com>
 <ZwfsmqInJlqkQD_3@hovoldconsulting.com> <ae5eaef9-301f-7d3f-c973-faa22ae780ee@quicinc.com>
 <ZxkjqEmkBAsC6UkL@hovoldconsulting.com> <c8e7420b-a7b4-89cd-1b6e-c1f6693c062d@quicinc.com>
 <ik4dyfbphm7lkeipm2dbr7cmdfxewxd4jtuz2jfnscfwcyo2r4@lrin5hnsqvyd>
 <83b635a7-fc69-7522-d985-810262500cb3@quicinc.com> <CAA8EJppx1OmYnfSsMDebRRTbNb3dfAE_MM55T1SpLccP=s_K1A@mail.gmail.com>
 <Zxty8VaMPrU3fJAN@pluto>
In-Reply-To: <Zxty8VaMPrU3fJAN@pluto>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 25 Oct 2024 14:37:42 +0300
Message-ID: <CAA8EJpp-2UhcGSZwVmggVcqtM8acrHKX3WijdfiY_bJo2v+LfA@mail.gmail.com>
Subject: Re: [PATCH V3 0/4] firmware: arm_scmi: Misc Fixes
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, Johan Hovold <johan@kernel.org>, sudeep.holla@arm.com, 
	ulf.hansson@linaro.org, jassisinghbrar@gmail.com, 
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	konradybcio@kernel.org, linux-pm@vger.kernel.org, tstrudel@google.com, 
	rafael@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Oct 2024 at 13:29, Cristian Marussi <cristian.marussi@arm.com> wrote:
>
> On Fri, Oct 25, 2024 at 01:11:37PM +0300, Dmitry Baryshkov wrote:
> > On Fri, 25 Oct 2024 at 09:46, Sibi Sankar <quic_sibis@quicinc.com> wrote:
> > >
> > >
> > >
> > > On 10/25/24 11:44, Dmitry Baryshkov wrote:
> > > > On Fri, Oct 25, 2024 at 11:38:36AM +0530, Sibi Sankar wrote:
> > > >>
> > > >>
> > > >> On 10/23/24 21:56, Johan Hovold wrote:
> > > >>> On Wed, Oct 23, 2024 at 01:16:47PM +0530, Sibi Sankar wrote:
> > > >>>> On 10/10/24 20:32, Johan Hovold wrote:
> > > >>>>> On Mon, Oct 07, 2024 at 11:36:38AM +0530, Sibi Sankar wrote:
> > > >>>>>> The series addresses the kernel warnings reported by Johan at [1] and are
> > > >>>>>> are required to X1E cpufreq device tree changes [2] to land.
> > > >>>>>>
> > > >>>>>> [1] - https://lore.kernel.org/lkml/ZoQjAWse2YxwyRJv@hovoldconsulting.com/
> > > >>>>>> [2] - https://lore.kernel.org/lkml/20240612124056.39230-1-quic_sibis@quicinc.com/
> > > >>>>>>
> > > >>>>>> The following warnings remain unadressed:
> > > >>>>>> arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > > >>>>>> arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > > >>>>>
> > > >>>>> Are there any plans for how to address these?
> > > >>>
> > > >>>> Sorry missed replying to this. The error implies that duplicate
> > > >>>> opps are reported by the SCP firmware and appear once during probe.
> > > >>>
> > > >>> I only see it at boot, but it shows up four times here with the CRD:
> > > >>
> > > >> https://lore.kernel.org/lkml/d54f6851-d479-a136-f747-4c0180904a5e@quicinc.com/
> > > >>
> > > >> As explained ^^, we see duplicates for max sustainable performance twice
> > > >> for each domain.
> > > >
> > > > If existing products were shipped with the firmware that lists single
> > > > freq twice, please filter the frequencies like qcom-cpufreq-hw does.
> > >
> > > That was a qualcomm specific driver and hence we could do such
> > > kind of filtering. This however is the generic scmi perf protocol
> > > and it's not something we should ever consider introducing :/
> >
> > This depends on the maintainer's discretion.
> >
> > >
> > > >
> > > >>
> > > >>>
> > > >>> [    8.098452] arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > > >>> [    8.109647] arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > > >>> [    8.128970] arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > > >>> [    8.142455] arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > > >>>
> > > >>>> This particular error can be fixed only by a firmware update and you
> > > >>>> should be able to test it out soon on the CRD first.
> > > >>>
> > > >>> Can you explain why this can only be fixed by a firmware update? Why
> > > >>> can't we suppress these warnings as well, like we did for the other
> > > >>> warnings related to the duplicate entries?
> > > >>>
> > > >>> IIUC the firmware is not really broken, but rather describes a feature
> > > >>> that Linux does not (yet) support, right?
> > > >>
> > > >> We keep saying it's a buggy firmware because the SCP firmware reports
> > > >> identical perf and power levels for the additional two opps and the
> > > >> kernel has no way of treating it otherwise and we shouldn't suppress
> > > >> them. Out of the two duplicate opps reported one is a artifact from how
> > > >> Qualcomm usually show a transition to boost frequencies. The second opp
> > > >> which you say is a feature should be treated as a boost opp i.e. one
> > > >> core can run at max at a lower power when other cores are at idle but
> > > >> we can start marking them as such once they start advertising their
> > > >> correct power requirements. So I maintain that this is the best we
> > > >> can do and need a firmware update for us to address anything more.
> > > >
> > > > Will existing shipping products get these firmware updates?
> > >
> > > They are sure to trickle out but I guess it's upto the oem
> > > to decide if they do want to pick these up like some of the
> > > other firmware updates being tested only on CRD. Not sure why
> > > warnings duplicates should block cpufreq from landing for x1e
> > > but if that's what the community wants I can drop reposting
> > > this series!
> >
> > No, the community definitely wants to have cpufreq for X1E.
> > But at the same time some reviewers prefer to have a warning-free boot
> > if those warnings can't be really fixed. I don't have such a strict
> > position, but I'd prefer to see those messages at dev_info or dev_dbg
> > level.
>
> I think dev_info could be an option from the SCMI perspective (as per my
> other mail), the important thing in these regards is to NOT go
> completely silent against fw anomalies...to avoid the the risk of being
> silently ignored .... I'll see what Sudeep thinks about...

Absolutely. SCMI layer knows that such a problem might exist and knows
how to handle it, so it should bug the user in a polite way.

-- 
With best wishes
Dmitry
