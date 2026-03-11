Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE39223EA90
	for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 21:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773265816; cv=none; b=pes4yGJyMUpPZPxG29tMgc94OzIUDHmnXHRaE3n6WB7zef5NOe1kKfsfCMrhgWGWqH3bqE21W2FfHa9DoyVQzmT6XsP3+2vgZU3GYmgd7gSyhHhhmZrmYXgpnCAFxkRjMcwGZEFiXE+U0cL2i1gZkQYUaRCQj5ouILmQp3GGWW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773265816; c=relaxed/simple;
	bh=nUDluusk/uDGZ8oHjMwCbcwuRMtWi9qzMZ+YsH6si/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=QvNOMDfcHgU204BBnWUcT9o7LSdthe34z/ibMKQY/0YkijeOecDODZh7pa4w1QBBWd8R5PwZw8Yt6aPQ+ALn2LkfZjqenOgsKhofA7G2o8Z7HKJi5mHeee/7S6yrfY0m84+KmQaCpNWYFp7Ba0StjNlxIJUpzoaBQF0wP8GX3rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g4ZXlgvU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g4ZXlgvU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773265813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iG1sK9K8o9dl9Vde3v0efNWoYZtYHoBdU4iIKqn1yc8=;
	b=g4ZXlgvUfOsXoNjIyEeT+59rQCiAr21Yoo99Kc3Qu5ZDbFejI0kf18J4NWGGzY8qwClpdi
	eKtLARxvcoyWGJYq8XR1O7kWQ1S9p/4eA8VMfF4ip8di/Zfxzgrd2fTW0dGepSD4wRWiFJ
	r9t7QYOaJo8NAchHzahyDrOS5VGSm0U=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-38jyM5t-PbCOm-UqvKQTsg-1; Wed, 11 Mar 2026 17:50:12 -0400
X-MC-Unique: 38jyM5t-PbCOm-UqvKQTsg-1
X-Mimecast-MFC-AGG-ID: 38jyM5t-PbCOm-UqvKQTsg_1773265812
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd767c51efso49670485a.2
        for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 14:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773265812; x=1773870612;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iG1sK9K8o9dl9Vde3v0efNWoYZtYHoBdU4iIKqn1yc8=;
        b=MsYfPNfzyAxNcPn9MLp+txXubkk7KwSzyqpJX9U9iLhv/U93+kgAsPMjN+9S/2uRx4
         myANuKoHd8NE5cZImq3pGexr8TJ3r6UDdiGyyB0vKdw/fn9fy+Ql7lMV4LwZHNBgDXVY
         sZTHEDJYwHuqNTxIys1FUMsnk2sBKX8WgAde1qQR5asFHk7hr8VUrR4P96xgqyF5M3lQ
         8QZFNkt5kv0z+DglTLRCgrELKr19uwh1o+GBUJeqmZK02F8hcXcMGCTIfVYDUVAQQdXz
         AgKxdFjHjTxuVH2FmKAEDcIleozKnPITb2dVPwmyflVz9+sUs95o8VnSZ4nWmD7jzOQa
         mu+w==
X-Forwarded-Encrypted: i=1; AJvYcCUadRDlxoS7Jz2HwN57UezID8yvIc6sSJN+YXlHLsaBWQc/0X1Y4RQ8sXn4hX6n6a4owLJhcBn2+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSCAZIq1youZszIM7wB4g2wufsjj8JUlkAe5iPJCiUjf6VzH47
	k/NqkDDAVFv43FNN7ySSqnZT+DSbjcTL+DiXCwUdyupMptCkMBRGsIwkGQfKvQM8qvtSUu+kBzI
	6/RZnRW/qH9zYR4OU7uhPJ92pb9WaIxU9iit0iKoZTkpPE/KMmE7cgNH/L2zU
X-Gm-Gg: ATEYQzwWFu3lKVbMWBrep5w/xSyeAu0B0O757LAf8Ke9QE74GjHvs5nONYSU9PLtIaD
	A/WL651q772Pksguni8hDw8qMQ5XtNqe2erus0+Wn9aUfz8sedUD/iWauG4BL//H+Lm+m7XDTwK
	p+Kgbb/hPDgYRrOkDN7noz3Qc+CkchXc9r9RF51WgZ6/RxMhAcDuikmJEcCTD9hKUrLPLYVXBac
	rj+IUr6HxI7672w+AR/uOJc+zIlHj4VW/nNfUcho+XuKDYW4MTIqsqPzEuWB7WhiaS/eO/fmq+S
	vWLqqq6K6hkCmh2MNyYzhr6DnvaNh/Ev6uoA4BKz2ywNU0uh1PvOQKCvQKen+aKI0Ma0Onr7wfy
	fBkv27Yw86kbAtl2blK8=
X-Received: by 2002:a05:620a:44d1:b0:8cd:a071:9aae with SMTP id af79cd13be357-8cda1a8a3b2mr581381585a.78.1773265812422;
        Wed, 11 Mar 2026 14:50:12 -0700 (PDT)
X-Received: by 2002:a05:620a:44d1:b0:8cd:a071:9aae with SMTP id af79cd13be357-8cda1a8a3b2mr581376885a.78.1773265811916;
        Wed, 11 Mar 2026 14:50:11 -0700 (PDT)
Received: from redhat.com ([2600:382:7708:94f:6bbc:89e9:5b48:3a11])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda1eab31dsm211687585a.0.2026.03.11.14.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 14:50:11 -0700 (PDT)
Date: Wed, 11 Mar 2026 17:50:08 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v8 4/6] clk: Add KUnit tests for assigned-clock-sscs
Message-ID: <abHjkMXPK0fXcdrO@redhat.com>
References: <20260302-clk-ssc-v7-1-v8-0-2356443a7e4c@nxp.com>
 <20260302-clk-ssc-v7-1-v8-4-2356443a7e4c@nxp.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260302-clk-ssc-v7-1-v8-4-2356443a7e4c@nxp.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hhGzROUFB8PWH-gULxqVdTMCtHqdMEq9xdLPeJ3QTls_1773265812
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peng,

On Mon, Mar 02, 2026 at 11:01:18PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Spread spectrum configuration is part of clock frequency settings,
> and its behavior can be validated similarly to assigned clock rates.
> 
> Extend the existing KUnit tests for assigned-clock-rates to cover
> assigned-clock-sscs by reusing the test framework. Add new test
> device trees:
>   - kunit_clk_assigned_sscs_null.dtso
>   - kunit_clk_assigned_sscs_null_consumer.dtso
>   - kunit_clk_assigned_sscs_without.dtso
>   - kunit_clk_assigned_sscs_without_consumer.dtso
>   - kunit_clk_assigned_sscs_zero.dtso
>   - kunit_clk_assigned_sscs_zero_consumer.dtso
> 
> These tests cover various invalid configurations of assigned-clock-sscs,
> ensuring robustness and consistent error handling, similar to the coverage
> provided for assigned-clock-rates.
> 
> Co-developed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Reviewed-by: Sebin Francis <sebin.francis@ti.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

I'm collecting up patches for Stephen for a git pull. I wanted to
include this series, however I see that the clk kunit tests fail.

[17:34:44] ================= clk_assigned_sscs_skips  =================
[17:34:44] [FAILED] provider missing assigned-clocks
[17:34:44] # clk_assigned_sscs_skips: ASSERTION FAILED at drivers/clk/clk_test.c:3218
[17:34:44] Expected 0 == of_clk_set_defaults(consumer, false), but
[17:34:44]     of_clk_set_defaults(consumer, false) == -2 (0xfffffffffffffffe)
[17:34:44] [FAILED] consumer missing assigned-clocks
[17:34:44] [PASSED] provider assigned-clock-sscs of zero
[17:34:44] [PASSED] consumer assigned-clock-sscs of zero
[17:34:44] # clk_assigned_sscs_skips: ASSERTION FAILED at drivers/clk/clk_test.c:3194
[17:34:44] Expected 0 == of_clk_add_hw_provider_kunit(test, np, of_clk_hw_simple_get, &ctx->clk0.hw), but
[17:34:44]     of_clk_add_hw_provider_kunit(test, np, of_clk_hw_simple_get, &ctx->clk0.hw) == -2 (0xfffffffffffffffe)
[17:34:44] [FAILED] provider assigned-clocks null phandle
[17:34:44] # clk_assigned_sscs_skips: ASSERTION FAILED at drivers/clk/clk_test.c:3218
[17:34:44] Expected 0 == of_clk_set_defaults(consumer, false), but
[17:34:44]     of_clk_set_defaults(consumer, false) == -2 (0xfffffffffffffffe)
[17:34:44] [FAILED] provider assigned-clocks null phandle
[17:34:44] # clk_assigned_sscs_skips: ASSERTION FAILED at drivers/clk/clk_test.c:3194
[17:34:44] Expected 0 == of_clk_add_hw_provider_kunit(test, np, of_clk_hw_simple_get, &ctx->clk0.hw), but
[17:34:44]     of_clk_add_hw_provider_kunit(test, np, of_clk_hw_simple_get, &ctx->clk0.hw) == -2 (0xfffffffffffffffe)
[17:34:44] # clk_assigned_sscs_skips: pass:2 fail:4 skip:0 total:6
[17:34:44] ============= [FAILED] clk_assigned_sscs_skips =============
[17:34:44]     # module: clk_test
[17:34:44] # clk_assigned_rates: pass:3 fail:1 skip:0 total:4
[17:34:44] # Totals: pass:16 fail:4 skip:0 total:20
[17:34:44] =============== [FAILED] clk_assigned_rates ================

Can you look into this? I didn't look in detail, but should the tests be
updated to expect -ENOENT in some cases, such as 'consumer missing
assigned-clocks'?

Brian

