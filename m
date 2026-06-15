Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0304401A3F
	for <arm-scmi@vger.kernel.org>; Mon, 15 Jun 2026 16:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781541658; cv=none; b=jj09KL9MgzPwrn7TEsfaNJBKzqdkE+bPu3z74rTJKuNw68tUAWR1INl/fml+IFzfIA2q5x41HqBGr+5xURX8DS7fo16DSDOcyyx1Cxx98PZxt6W//IpbMj8wBuB0ZyozyYm6itngBWcDJ9wZ6pstNJ8DEie8Z9iu/qqW9Uqhfv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781541658; c=relaxed/simple;
	bh=sgFYe03AdqAI3bmcuoDq5yghX+BkC5mlsAqcpIEve6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=iAFuTQq+NXA4DpTMm6r4/6UyBdLrAutopgBfoa0cX1HWPxL8puEzBIw256+DopBLozs4E5ZPgfNEDpKZzxWA83CM7LFMD1ndBwk+Spu/siUYDeaVaxvtk7Z76TyEGssmfSsUGlw+wO3rIh/yZXDWpXxMWIPK8jATmUOcJEAQpBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ONRgOO5V; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ONRgOO5V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781541654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fYiGHVY1xpFWEX6h4yQg4Y2KYAiZFnPKyRrFWVlw2cc=;
	b=ONRgOO5V3u2ytYqn0L/ERJ5Tgtude6rP6Li9duSvWX47YlErAipSYtyTDWMH9TnQe/4AFu
	Pi8OlRJqNnzlsRdPHZ8Mmer2wV2uEQb4gJVimkHznntzswKmt2leZC8LXmUkhsS0WOnn99
	obg/XP7JG4AKsd0/BnsJr2ETNDj8394=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-gzb31tpyNJWulrw2H6FRhA-1; Mon, 15 Jun 2026 12:40:53 -0400
X-MC-Unique: gzb31tpyNJWulrw2H6FRhA-1
X-Mimecast-MFC-AGG-ID: gzb31tpyNJWulrw2H6FRhA_1781541653
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915b9dd020cso933616885a.3
        for <arm-scmi@vger.kernel.org>; Mon, 15 Jun 2026 09:40:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781541653; x=1782146453;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYiGHVY1xpFWEX6h4yQg4Y2KYAiZFnPKyRrFWVlw2cc=;
        b=pCMJrTuD5d7fu+LwdaZtpCkA5NBKotkWVM0yepjz+9scupOOejYjW7hauST7ZmwF2m
         qlh6ZgfT0H7/q4gvOV53fyLFELIQ6yoS2FUl8PpePavDgCTKpfBCzVkvbh9OX+fLvHoS
         Fax3nNWFYX/1ujuGMR1hPvKe/WIEQYy0iaMriLYbibAHD22RKoL99Bp2S+Oy6uLpp/11
         uhNenzFvhdWIj//QuWUnkoKlz3+xYPqrirt5jsz3o5Ly3QxQ8LPLKTgkvDyAIOmkQJOE
         8CBtiinls2s4aDWQJ6unNps50qXUxBbM9WkAq4j28qER/kv30ood/5zXY4OngTkKDv9V
         sZSw==
X-Forwarded-Encrypted: i=1; AFNElJ8kKCy/sbKvxOKRaydl/wHdz2WGWNB2oDeML6PlwXbaKyVSX/geeOBAEcxTvM37RyKB5+6lYcN+Ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YyON53S6Wvt/4kUyy6TKn58E0Y18hBUgh3cvbGLUY9zYU6x9cxY
	Gza9XpqknlmZx7rMP8TSZ3HrdiMSLIK7D5kmCXDFfeM2lR2aRYDXKxCUVp6qLtfzRqvXr/w8Qkh
	I/3Of3nRsnR8UNdWK3Z+TOwmlSzO4NUj8PZTLgYtucIrccwu/6SX95LJFlYdi
X-Gm-Gg: Acq92OE3Jwl18m0wNRuj4T9jO4B6Ch2MzI/nTZsMNtatIl4DZvBNvAA1cNxSmrA6G2d
	WyKCt1j9gjGnHBSvr8qV+tJY28PTqeDefbWZoSq+8TI1P7JmcuIBXoKqoq9jB7k53YG0+67QSLh
	aVE/whVj2CeV1TYtc/Ra3wrianfVF4FJVZYlwNF8suhPHSH6/4JpcHkPSe1erhOvNO7hWRN6/tK
	Lxs0QIn8K3W8Wiry4/WWfG2cwqZ+kZQdElX12gt3pWLdqY9RsagTB97NcuODca5LElIeCrtpUVT
	pI501szI4MC68+5zo79RED+tjaBMNGEfm1AcryG9UmkPfeCVdNJmiungAIZtUlOTFJKQURKHK88
	4pCO9HI2IoL+4RuaPb/UGDa9pGDi4r4ew6G0iDK/nrEqxocehdas7PNlx
X-Received: by 2002:a05:620a:31a0:b0:910:87f4:9a26 with SMTP id af79cd13be357-917f1e44e09mr1835938885a.41.1781541653016;
        Mon, 15 Jun 2026 09:40:53 -0700 (PDT)
X-Received: by 2002:a05:620a:31a0:b0:910:87f4:9a26 with SMTP id af79cd13be357-917f1e44e09mr1835934985a.41.1781541652604;
        Mon, 15 Jun 2026 09:40:52 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91619f06835sm1180700185a.14.2026.06.15.09.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:40:51 -0700 (PDT)
Date: Mon, 15 Jun 2026 12:40:49 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sebin Francis <sebin.francis@ti.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v10 4/6] clk: Add KUnit tests for assigned-clock-sscs
Message-ID: <ajArEQ1rA7AtH-uG@redhat.com>
References: <20260612-clk-v10-v10-0-eb92484eda38@nxp.com>
 <20260612-clk-v10-v10-4-eb92484eda38@nxp.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260612-clk-v10-v10-4-eb92484eda38@nxp.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fXiVi123XifMbmxSAA3clXbrnnbnRAU1g50AnRt_Ihg_1781541653
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Jun 12, 2026 at 04:46:26PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add KUnit test coverage for the assigned-clock-sscs DT property that
> configures spread spectrum on clocks before they are used.
> 
> Extend the existing test infrastructure to support spread spectrum:
> - Add struct clk_spread_spectrum field to clk_dummy_context and a
>   clk_dummy_set_spread_spectrum callback
> - Wire set_spread_spectrum into all dummy clock ops
> - Extend clk_assigned_rates_register_clk and test parameter struct
>   to propagate initial SSCS values
> 
> Add a new separate test suite clk_assigned_sscs with three categories:
> 
>   1. clk_assigned_sscs_assigns_one — verifies that a single
>      assigned-clock-sscs entry correctly configures spread spectrum
>      on one clock, testing both provider and consumer paths
> 
>   2. clk_assigned_sscs_assigns_multiple — verifies that multiple
>      assigned-clock-sscs entries configure spread spectrum on two
>      clocks, testing both provider and consumer paths
> 
>   3. clk_assigned_sscs_skips — verifies that malformed DT properties
>      are correctly skipped without error: missing assigned-clocks,
>      zero-valued SSCS, and null phandles, tested for both provider
>      and consumer scenarios
> 
> New DT overlays are added for all test scenarios:
>   - kunit_clk_assigned_sscs_one{,consumer} — single valid entry
>   - kunit_clk_assigned_sscs_multiple{,consumer} — two valid entries
>   - kunit_clk_assigned_sscs_without{,consumer} — missing assigned-clocks
>   - kunit_clk_assigned_sscs_zero{,consumer} — all-zero SSCS values
>   - kunit_clk_assigned_sscs_null{,consumer} — null phandle
> 
> Co-developed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Looks good to me.

It's probably not appropriate for me to also put a Reviewed-by here.

Brian

