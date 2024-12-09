Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC5018DF6B
	for <arm-scmi@vger.kernel.org>; Mon,  9 Dec 2024 09:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733735530; cv=none; b=Mj6njz5aB6CS4+O/wxw5TmIP2c1dx3V5C0i+VzvQSz527QyBPqniCeEH3uFqo0SH9mbTKgSA84alIvLadp+kDsqtNF3oVXqYWJFWgj1Q9+Bw1DSvtqttGFOiNfnQgCC6Qa20CTralfyCMrzL+YZEc8SzK8esclSz5QL7OanOIt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733735530; c=relaxed/simple;
	bh=h3U0EZ1mrb3gqJxM/laxxDr92i5qpfvAUQ7Frf2u+Hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PtOgm8+NKWKPgxQ33UL9m1zDq5Sc27PDe9mxWCZCdYUA8RPkokn9fEK8vpXfW8DEFRGFpDD+o68bVBYMj6jZBO8RVIrkVVyY9yLEOtDa7HLelTVRpGboSJdSVmzxq4ITVqfp5gKoq8zYVmy0II4jReJLAqFnuZAEo/1hEn9xUH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zICO4v8+; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zICO4v8+"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434ab938e37so26161785e9.0
        for <arm-scmi@vger.kernel.org>; Mon, 09 Dec 2024 01:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733735526; x=1734340326; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eHbMlbgWO3bzBNNeHS2sHD9CC6+WaWdJ9GK1c1w2/jU=;
        b=zICO4v8+sl+XTdx7l2Ej0inS29aJcL4pngShGuPwmGkkRPb5Gun2AZXdGi2tAF33gp
         QrBP9uQAG8a49BqFUKG5Ep+dBvffRdCA4d8BXmjSkM78+vd6LsFVoRf21cVJwILsOA58
         xmTFDfBcbB2zCKEWeBl6MyJoy4eg1rIeH0/6aeMGnkPsiddkODlkEdVOLS4Uz0Qm5SVG
         c/zju4stNovoZBbl2HKimfg0Fb+OieVsR/nuvkJcK+7kwfJkLEpSS1JQgFqN0wyJ+mWz
         GONHKGYB4h3Q0cfqSa/lWvTEuIqucqewRX1b4NYx6cxeQz+D0+pmRk451YXpXkDJJAJw
         beBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733735526; x=1734340326;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHbMlbgWO3bzBNNeHS2sHD9CC6+WaWdJ9GK1c1w2/jU=;
        b=gttLFUXTuzeL8yT1IzqrfkiJlM9wQgh4v4CoeflyiZbTIz0UYfPeiXEeQBKMDY4ccP
         tlGp9q+h7yOegNFz1Kmby07Sjfw12PvFxsZpu6IpHzYCYNXT0FhFRmR/28uJuyGA6bpJ
         SMuau6ur/8S33PKmpn8YK+RYWLHMd0l5CYuapd201HGGDk5/QpRTLLnn8uTYlgIsaHUd
         sJocSYqvjArK2vW7kakhQMOyyNIjNZ46zXPC5dG0Dozk6Cz/BdITKyvptkICEEmj2pJ2
         LjyGfzZUWshrE4nKc55ISAE507vMjRZ4qTOheRAKcdamvJWZmsWVpaLR5Ze0WmvgEfRo
         qYzg==
X-Forwarded-Encrypted: i=1; AJvYcCUk6wwHcsd7GclUJNVHWB1NVb1xjvDzwkrIN782QrvR3qqLiJak+YrI98nwbGU2Pc3PRJe8IhwRkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqtfpP7eX9hxwaKw2QbJZZv7OGNfXjvImzHl/BCfuXrT9TwTsx
	uVZz1mRbbM1pV/N/MnO8kuHuh9t12FZRwBNyE8tVm1QKSachjKNWM3d1QOC02U8=
X-Gm-Gg: ASbGncvjXb8bND692ko4YnuEL0FXthq8G1xjpCokkdI17B+nU1P/cCLRQ+o+xCh2yOP
	HFIhy1L+BsEpMk32fzin/onPRyvSxlMeCMHsK0/cC9IAhU4Z2M5BADgfUsesY3G8RBmQtdwfvCP
	H61t+aWwsP3jwk1PDBK+yfy9L3aigziYHJXyQQrRwvGWAAkCWuauo3kf/LHjenVFCXTdJtWREDQ
	+f8zIb04spOKaJUiK5qYtCMT2daq29f9Ngtd9/3p2koTl1zRxIfeC0=
X-Google-Smtp-Source: AGHT+IHhPb22PMaOGlccXXjnxqHxj7jC1Q4B6r+s69ZPmdovPN8G0ra4/yZH2uddmSFXwQMRXgGvAw==
X-Received: by 2002:a05:6000:470a:b0:385:dfab:1643 with SMTP id ffacd0b85a97d-3862b378d0emr7400128f8f.27.1733735526245;
        Mon, 09 Dec 2024 01:12:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861ecf4045sm12708923f8f.8.2024.12.09.01.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 01:12:05 -0800 (PST)
Date: Mon, 9 Dec 2024 12:12:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Etienne CARRIERE - foss <etienne.carriere@foss.st.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] firmware: arm_scmi: round rate bisecting in
 discrete rates
Message-ID: <e75495ca-7cc4-48eb-ba27-607de6951181@stanley.mountain>
References: <20241203173908.3148794-1-etienne.carriere@foss.st.com>
 <20241203173908.3148794-3-etienne.carriere@foss.st.com>
 <7fe840af-d56d-4cb6-8d82-d42631409b2a@stanley.mountain>
 <4c39a5a437fa42d483d1f704ec7ab4ac@foss.st.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c39a5a437fa42d483d1f704ec7ab4ac@foss.st.com>

On Mon, Dec 09, 2024 at 08:16:24AM +0000, Etienne CARRIERE - foss wrote:
> Hello Dan,
> 
> Thanks for looking at this change.
> 
> On Friday, December 6, 2024, Dan Carpenter wrote:
> > 
> > On Tue, Dec 03, 2024 at 06:39:08PM +0100, Etienne Carriere wrote:
> > > diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
> > > index 09ccd6cea7f2..7bbb2ee55f4f 100644
> > > --- a/drivers/clk/clk-scmi.c
> > > +++ b/drivers/clk/clk-scmi.c
> > > @@ -61,13 +61,20 @@ static long scmi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> > >       struct scmi_clk *clk = to_scmi_clk(hw);
> > >
> > >       /*
> > > -      * We can't figure out what rate it will be, so just return the
> > > +      * In case we can't figure out what rate it will be when the clock
> > > +      * describes a list of discrete rates, then just return the
> > >        * rate back to the caller. scmi_clk_recalc_rate() will be called
> > >        * after the rate is set and we'll know what rate the clock is
> > >        * running at then.
> > >        */
> > > -     if (clk->info->rate_discrete)
> > > +     if (clk->info->rate_discrete) {
> > > +             ftmp = rate;
> > 
> > No need for this assignment.
> 
> It is needed. The round_rate handler in scmi clock protocol driver 
> I added in drivers/firmware/arm_scmi/clock.c expects the argument
> to carry the target rate as input value and provide the closest reachable
> rate as output value, hence initializing @ftmp above. I needed to preserve
> the value @rate since used if this round_rate handle is not available
> or returns with an error.
> 
> Note that I could have changed scmi_proto_clk_ops->round_rate() 
> function ABI to split input target rate and output rounded rate into
> 2 separated explicit arguments.

No, no.  Leave it.  Sorry.  I wasn't paying attention.

regards,
dan carpenter

