Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1BD1862
	for <arm-scmi@vger.kernel.org>; Thu, 12 Mar 2026 07:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773300754; cv=none; b=ZBKKUM1M0hwYfQitYuCYR9CsV1s0zBXOMsiwhRVgCmlckFjJFlaY/0jBAiibaTSEegO2i9KIHEFZDbnjsR/1/2ksTmtl+RpY5k4Jf90Bg7x7MZ0M3DvqnSCb4+aPtujRv8VEqnsPs97zsy5xlAzg6ZCiCpPuPvmEkI1zDnkIJLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773300754; c=relaxed/simple;
	bh=fAiBvhw3nkiHUEIE5w/lw0EHAr7zte3KtEvhod6gfMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NdqAJv5bwqJoXGjVKHEPYtQ9//ovTc5o9dInv7x8+AfOJoXOsmbeqU4LTdyhHASd2qsIYpyDGawwL4tP4SlCRDFIiD/Npqk2xS4P+VTCGqgA/cIseVwDr3rTs3KOUFHj3TrehMUB5HNHLMspWzbagrOtVQFZlbaBe6hIwqXOCYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MR+wH4X0; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MR+wH4X0"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439b9cf8cb5so775686f8f.0
        for <arm-scmi@vger.kernel.org>; Thu, 12 Mar 2026 00:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773300751; x=1773905551; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QiXMM5jF1nGW1k5BoCG1A7OXeQgJqBMtsH8RcIzP0SE=;
        b=MR+wH4X0N/A2gVSwhcRXrNmCXfuCIq7nNAiD3GNSJtu5Xp7r2uXKGZeiXaXAdY2TkV
         Yp+o7t1nhEZeZgRUNB7h5UBXgtjxoHhWOuThg/qGeAgE3VjaI6gf3/oOMpQCbLCDlfyo
         fI1UM98p7ijVSxuMV0A5E6i/gz0wFL1DK61QnHvBtjiN3WU10W86FWReoyG5huewy0Op
         od+GJytEstA+jE9MDjFDbeETvuS5qWmWNXws75tCdyHiVz2OhxlL/5xBVB8lLHDKQj/i
         bNC/jjWt6BQwZSOczOjhqkD1h1dAuHnYxUvEwS+srZ9PxhaO1+HHNp1WaA1XFooPjTin
         EwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773300751; x=1773905551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QiXMM5jF1nGW1k5BoCG1A7OXeQgJqBMtsH8RcIzP0SE=;
        b=qs6UgWvFrNxCwgpiZpOvIYHi5lhzdpuD9CD5n6Z+072RyZdyZ0aLR+iviCHqfmawKm
         rOMibFbPWio1jMB+OUQ/MEzoBAW8Q3XNXL1KdefaKzQO5MC8KHLVeea9E60GQZyaS7+P
         eD2aGIqGe6HER5j2tKWDrMEO2IyLO2m/PLQHtD+yLmlxRs1UV3UGry1ZodIVsrUoPqXO
         oHEF3B3BXl0gVQdRnXedLGqzeu068iqs3oha6n5BWaDNyfbdKMI6IZ2K9GjLFZ5hg2yk
         VS0ZMGadgbqATmEQprwLAD5ZZWLWBovkkBtQbX/B6fSy4I9fixZlsoUfObCQhFqronw4
         AIfw==
X-Forwarded-Encrypted: i=1; AJvYcCWwer44XMCyHMnCdqNXNQbtkhn91+DBtie1cIxKWnXP/QWHHm5rUuejxBGQ61S1EOH7C9j1stwq5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+BT2EeC2xw7nHYkdLWlOCB0BE8smEC1Gt6p7CmouwRCrAKqE3
	HV9pdc+USfBLFc6EysZKulOIUPYM2+w/En3pP7Vs3APaZ4rxX7Vh78ZkD8Zv8yWNigg=
X-Gm-Gg: ATEYQzweXE1DZm9recsXXHoImnsJXZRZ0l0ET0sTSfwM/kxv6JVIPxegXbKQGzWFh2K
	ekbR+gJYNJU8W6vrcv9lU+iEszgVJT+zRHASuWWZ7pwnm2o5VIucPlUao5PyXAEPLQMym4lePmb
	3AELImC4wLQHKysv+F1jlcrq5PUJuKUiX3NDIE8iy1rpMRPdudq1L5ASZPl72sDPALlmy5HY0B/
	oOo20sAuwOtCZukIZ9MGagk/rGa+ItfRg0VAo2Xnnfk0TkN25uKu2ue1WTV+9xVb2iTiX2AGHsy
	P9ziIlSFxhE/S4HtR+Gyd1YpvT2uh/Z6V3hFf3kmsBqDO/JmT2pKi3XkfVsZC/pw+Vv7QIuDApu
	sOhb8eX5SiZ4GBVGNEl1a5MqjgLml4+u60eBFXipmjOua/c33VbEPuzRNK5dWQ4YBtENgn/ZTqV
	heEbH6LdYyw+XfRhseY8wgHbCNPm7M
X-Received: by 2002:a05:6000:230e:b0:439:cd10:aaf1 with SMTP id ffacd0b85a97d-439f8225346mr10304360f8f.53.1773300750991;
        Thu, 12 Mar 2026 00:32:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe22dd67sm6521914f8f.36.2026.03.12.00.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 00:32:30 -0700 (PDT)
Date: Thu, 12 Mar 2026 10:32:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michal Simek <michal.simek@amd.com>
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
	Utsav Agarwal <utsav.agarwal@analog.com>,
	Arturs Artamonovs <arturs.artamonovs@analog.com>,
	Greg Malysa <malysagreg@gmail.com>,
	Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
	Ian Roberts <ian.roberts@timesys.com>,
	Rasmus Villemoes <ravi@prevas.dk>,
	Philip Molloy <philip.molloy@analog.com>,
	Tanmay Kathpalia <tanmay.kathpalia@altera.com>,
	Oliver Gaskell <Oliver.Gaskell@analog.com>,
	Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Eoin Dickson <eoin.dickson@microchip.com>, u-boot@lists.denx.de,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	arm-scmi@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH 4/4] gpio: scmi: Add gpio_scmi driver
Message-ID: <abJsCq0eqL_6NUFC@stanley.mountain>
References: <cover.1771856828.git.dan.carpenter@linaro.org>
 <e3649db2cbde07a53c7139d72c2c597f9a6d8fbd.1771856828.git.dan.carpenter@linaro.org>
 <4fdab7f4-aa11-4abe-953e-6d9785945fbd@amd.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fdab7f4-aa11-4abe-953e-6d9785945fbd@amd.com>

On Tue, Feb 24, 2026 at 05:10:26PM +0100, Michal Simek wrote:
> 
> 
> Can you point me the dt binding document?
> 
> I am aware about this one and grep is not returning me anything from linux-next too
> 
> https://lore.kernel.org/all/20231002021602.260100-1-takahiro.akashi@linaro.org/
> 

Yeah...  I should have done the more standard thing with gpio-ranges.
In v2, u-boot and linux use the same device tree format.  The difference
is that in the pin control driver, u-boot handles pin muxing by sending
raw commands.

regards,
dan carpenter
