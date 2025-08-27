Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7152DAFB5
	for <arm-scmi@vger.kernel.org>; Wed, 27 Aug 2025 15:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756309530; cv=none; b=XQLXK1xXMfErrOF6FfSqRHJWiz2z96CDdJ37CZ5rG6xn/S2zWNFIGqxNI9t/4Sj88F4X5QdFP1UgeaXTjjHq1irxJHw+psItpM6peeYdcEOlv8wYFkCwwmarHQuRfyOyyk0IG/515RkoKb3QmgPYAijRRc8f4eMvKeZsbAlOTdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756309530; c=relaxed/simple;
	bh=/p97CHZTchgZ2x/w77sCPBCAKYLVfRuzWu9KdaEGTW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=L6wuNTbHE2KHJ0CQjumKZ9rJ8lOtVeXg6Jg4Pr3+6PN4duPd8teJ7AlYy359wA3cI/BqVLqtI3aUVqDQxj4B6k0LO3ATm0eE1F5Y2entu8+OHBnRGpTPQqVt8/bJrAH9dINA0HNqSRWFIFGi67BgBx9hbVSwCLeYieD4tozuYYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fA3tUvxh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fA3tUvxh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756309526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BDqVhSeK1e71j8vG7CPDHZkgMbyJjBHY6Iqx2foqFvE=;
	b=fA3tUvxhxYz5mAWi8qlNj+OiXdu3zjnuRYvbCQ6oXCLKPM1j1vnhIET6HZfYLYhYK/GL5S
	lTSzKmAym2slEDtdCbqS89pRieBZrQIPVPvGOiSJ2G/k6KxRIJFcC4QoTdFp0oeNXYRWpa
	L2H1Y9bi+h3kvktoLzaqpGfmIkcOOsA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562--1xN54MHN3aiCgvo3KupOA-1; Wed, 27 Aug 2025 11:45:23 -0400
X-MC-Unique: -1xN54MHN3aiCgvo3KupOA-1
X-Mimecast-MFC-AGG-ID: -1xN54MHN3aiCgvo3KupOA_1756309522
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e86499748cso293834485a.1
        for <arm-scmi@vger.kernel.org>; Wed, 27 Aug 2025 08:45:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756309522; x=1756914322;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BDqVhSeK1e71j8vG7CPDHZkgMbyJjBHY6Iqx2foqFvE=;
        b=dWv9CIcsG+e8Vh5vDUAPeMbMEkUHokrfgzvNGVP939yC+mlvQWdLvCH+/rDaIqG9FG
         nujqiDofndODTRdnL8s1JISCKr5X7kHhj3RUnXvWLtcveKQ1WYQ+AL80zLY8mMpm4hvS
         6jxJR64jzpKczXAkKuPSefXxv33xb+YhEa1Twmads381adpARjnyWyGQ3eMeBWV7Yjct
         ABwlgZI9YGqEeFtSjcpeCy7xTUypo/ISULsAqAZMeSoCqlrBFOdu8KsEB2ORytZP62MC
         iGQzuZjHmAYsyLWWXpoD1b5S4fr85pKRZD6WuV/z0Arhk27t7nP/gkvY8oA1covGdiUd
         gQzg==
X-Forwarded-Encrypted: i=1; AJvYcCUmQaYTEQq3PtH3owYI/4VBqVtFswlyznspxNV4Lst1k5rnSON6qjWGhGP//hV16ryRBLzzxYvRjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpaJlG9VYdDNKlS0Iyg1TW9Rwaj+MdwJLsmQv4433jB+SKAesb
	/dvxwIb0+4gomSf7RTalrwGqkGpYTvxYVEeUAlQODc/LtHPA9d6uvUy1+9LeIQYrSWqWw+2BMou
	hw0ZPAMk+NUJGjJIIizskgKxgCxR6kqZUNnua0cEcP+ZNlTvAb3b7v82kbaRE
X-Gm-Gg: ASbGnctIszUTrhNIntYXV/Jb0/VvmzlqUhrcCDl+yURn/sZP4MR4pC7oj+79zq188OC
	5W275Lmu8lRS4GEpH760fKoJT/ZNdtn5GIIXNl/hqaKgUsYJGCWjztwsT4OFp4yOsPZyihlPJBG
	Xm3EO25s7CK+FNh2j5ThmgcnRiZp0CeoeIf9TYuwYZpDrckkqi4MsAv0juu6vLDMPDmPnWuT7f+
	FTLGO4PJOnKO/VTdLlm/LDSuKZAGwwr3w7XQObz2XHovMnkU2GGvVs5hFOKYHYCjTrFso4D+O7h
	/fq96a4W8iqCLFU/HuWzppwR7Llr6DLBqa+mCY2XLzN+S1mIaGegwWpL7xw6FcQdAZMzmscRqi9
	HZe2ogku2lbbiNde59Dw=
X-Received: by 2002:a05:620a:3709:b0:7e6:9753:d959 with SMTP id af79cd13be357-7f58d941f00mr677233385a.4.1756309522440;
        Wed, 27 Aug 2025 08:45:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmUGjZymg97kwzbvc9Ng0QsbL1xmqeZFpXH0SyMzHjWziskdn6bTnadHzycYk8K6ZKteAcMQ==
X-Received: by 2002:a05:620a:3709:b0:7e6:9753:d959 with SMTP id af79cd13be357-7f58d941f00mr677228485a.4.1756309521893;
        Wed, 27 Aug 2025 08:45:21 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b2b8de632csm94044401cf.36.2025.08.27.08.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 08:45:21 -0700 (PDT)
Date: Wed, 27 Aug 2025 11:45:19 -0400
From: Brian Masney <bmasney@redhat.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] clk: Introduce clk_hw_set_spread_spectrum
Message-ID: <aK8oD6HNw131avjI@x1>
References: <20250812-clk-ssc-version1-v1-0-cef60f20d770@nxp.com>
 <20250812-clk-ssc-version1-v1-1-cef60f20d770@nxp.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250812-clk-ssc-version1-v1-1-cef60f20d770@nxp.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _lhi-XKWIm5sBCD1yOVm_NxOFnGqHXJTRzWXND4DNdA_1756309522
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 12, 2025 at 08:17:05PM +0800, Peng Fan wrote:
> Add clk_hw_set_spread_spectrum to configure a clock to enable spread
> spectrum feature. set_spread_spectrum ops is added for clk drivers to
> have their own hardware specific implementation.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/clk/clk.c            | 32 ++++++++++++++++++++++++++++++++
>  include/linux/clk-provider.h | 29 +++++++++++++++++++++++++++++
>  2 files changed, 61 insertions(+)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index b821b2cdb155331c85fafbd2fac8ab3703a08e4d..48c7a301b72b30fd824dae7ada2c44ee84d40867 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2802,6 +2802,38 @@ int clk_set_max_rate(struct clk *clk, unsigned long rate)
>  }
>  EXPORT_SYMBOL_GPL(clk_set_max_rate);
>  
> +int clk_hw_set_spread_spectrum(struct clk_hw *hw, unsigned int modfreq_hz,
> +			       unsigned int spread_bp, unsigned int method)
                                                       ^^^^^^^^^^^^
Should this be 'enum clk_ssc_method'?

Also can you add kernel docs for all of the parameters? I know it's
documented on 'struct clk_spread_spectrum' below.

What do you think about having this function take that struct instead as
a parameter to match what's on the clk op?

Brian

