Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2511D5AC6
	for <arm-scmi@vger.kernel.org>; Tue,  9 Sep 2025 09:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757410797; cv=none; b=Y8jLckWDwaRva8fQl3fOTyOdusHGO7kC8qBe2Sel7bzQDv6/vIifEGNzV6oHk9PN0dd/SE5ddTiFik4KlANjuwv9MeNfvafse8Ecj5DzRYPJVbYf6WbWwelcOMebh6zKAlVV+k3zsB3MH8iZU+8weObx2JE8S/LlXV3It8peSF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757410797; c=relaxed/simple;
	bh=ZqTIhoxpRaUsXfMaG4XVvb6F65/P00Xs0kV9aEsz0ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=H2kwecrxc25CbxncKlqGqxyMmh3oN5lnaYcfYvJfJzMq+Irt6Xozf67makor0sgD+V34PNzG5/CrOIZs+mLVF4PUxbzJxcF+wOygR3Th4j+gEe41b2o0pmYIjDhzdthKsmVwJIGaZr0Vjr+HQZc7Yb1/u2+5iLQ/BQz2G2++47I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hukBhjAJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hukBhjAJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757410793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R5SuLPKP6QNmvh1TmNhSBXqAPxbhjyq+GV6/uflQ99Y=;
	b=hukBhjAJDgJhAkcdp/7IiHRxvCGYa+FqhrE+avIwh/FvbM5nGXoEu0YvZhR6FCSnJ0YKGT
	WRu7oC3q1O05eUZ1zik9IwYp8kFhlQ513oq0nY7tdBFZM+zXbzjvz/Iih4KAfxDx6rzwcv
	/RX72HymVmp5ROnAeSfewLEdg1xFRhM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-Bsh9QwOxOW2ekw5hWzKi6w-1; Tue, 09 Sep 2025 05:39:50 -0400
X-MC-Unique: Bsh9QwOxOW2ekw5hWzKi6w-1
X-Mimecast-MFC-AGG-ID: Bsh9QwOxOW2ekw5hWzKi6w_1757410790
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b60dd9634dso51144811cf.2
        for <arm-scmi@vger.kernel.org>; Tue, 09 Sep 2025 02:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757410790; x=1758015590;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R5SuLPKP6QNmvh1TmNhSBXqAPxbhjyq+GV6/uflQ99Y=;
        b=ZCmxQ5bzt3+4LnfURHYKtJT1fS/v8ZPWX+BfxqJGWSqw2qLahmh52ZahaYhM/R2Stt
         HP0iGWJvn/esJ3/9W42qNKTxiClDkVG2ajtt/GPF6EbLd50WVdro8kFkuaydWLilz3rB
         qr5oF9WkgfqPjtHveD8XtLhIT9m6LdpGBVSOYC/43dJPXkUk801ZspKnADRxTvBGWonE
         WiyYoGAPBjFtZcOw895qEpRyT2lJwBAY+ESXmnfSI7yAfnchfv+xit8I02zdnvkrUco/
         9z81Pe2r/zdA6tbFkTzUQfkO/n6HdQ8wiaErk4GkzP44c1f+RNX31i9vlAgJs2jnBu/t
         2Dug==
X-Forwarded-Encrypted: i=1; AJvYcCUWb8+S38MML9OYv2Npl7oahwpaojTT0e4ikJqsIxA4tC/0hz21lw7BMBr5Ziyqhze6z2d1/7Ephw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa/hMAI0vr9n8MKAytFbEiILG7oYMREmX2n3CPpfbBQQX+61E5
	MPJVuV47nucoqCoysPn+salvr8CuA9Wp7c4jq6U7Rw0agvTTnBUM138JbIow+2QNHIeT6+ni4F/
	jxJN3Pz+MXDk7kN91qAE5YriyGIuCUkNOjp2a1TSZvqioZk1kBQYHHBlGDjRH
X-Gm-Gg: ASbGncs2zhEvO8U9O8EvV1wHdUu39UIRKcEcbpaTcnxA8H89IOpL3tmASUsWAg7te5t
	k3p3OwmwUHYa0VGYG1pp1BvyT9DdERlgrLsq8uSM731PKDZYQlji9Vrr2dMtb85Do8IxcUEZsWZ
	irj7lYWzjsacGgwbXr2vnaP5Mx6YFZl8q0k5RWVsAm2FBaJSN4KHk5BJpjhVDCPDRc5hQ7H2tXc
	S0xMVOqc0uKmPxL7//CPW6iHmoXGior2+Idt7m6HjZ7cWFcnhqXJxJG9Qi8gVz8DD45WGkMDibo
	I99dWIpeL4Ay3uK3uatp3rwRfe4zVp6VOpHCSzeyTD6Cw3+0Ti1V3C9EqyuLVPMEwoyNHu+QqoG
	PzbFjQzcErlIo20BiT5c=
X-Received: by 2002:a05:622a:14d:b0:4b2:8ac4:ef4a with SMTP id d75a77b69052e-4b5f848239dmr100627961cf.65.1757410789881;
        Tue, 09 Sep 2025 02:39:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF32u03YWf0xFsHNwv4lu2FNzdlBMcHC/jd+orwwY/MAKlb650jQ6YeSwxCEA5UmnrgNTF0kw==
X-Received: by 2002:a05:622a:14d:b0:4b2:8ac4:ef4a with SMTP id d75a77b69052e-4b5f848239dmr100627741cf.65.1757410789492;
        Tue, 09 Sep 2025 02:39:49 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b61bbbc28csm6792371cf.28.2025.09.09.02.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:39:47 -0700 (PDT)
Date: Tue, 9 Sep 2025 05:39:45 -0400
From: Brian Masney <bmasney@redhat.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] clk: conf: Support assigned-clock-sscs
Message-ID: <aL_14XofqnwAd3QE@x1>
References: <20250901-clk-ssc-version1-v2-0-1d0a486dffe6@nxp.com>
 <20250901-clk-ssc-version1-v2-2-1d0a486dffe6@nxp.com>
 <aLdmXcdJnoeXEJaQ@x1>
 <20250909085013.GA26483@nxa18884-linux.ap.freescale.net>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250909085013.GA26483@nxa18884-linux.ap.freescale.net>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Cs0lNUnckzlVw_A_ZOCuZcPFTIyFNlRgKaM75Xr3gx8_1757410790
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 09, 2025 at 04:50:13PM +0800, Peng Fan wrote:
> Hi Brian,
> On Tue, Sep 02, 2025 at 05:49:17PM -0400, Brian Masney wrote:
> [...]
> >> +		if (IS_ERR(clk)) {
> >> +			if (PTR_ERR(clk) != -EPROBE_DEFER)
> >> +				pr_warn("clk: couldn't get clock %d for %pOF\n",
> >> +					index, node);
> >> +			return PTR_ERR(clk);
> >
> >This chunk can be replaced with dev_warn_probe(). Sorry I missed that in
> >v1. Otherwise the rest looks good to me. With that fixed:
> 
> dev_warn_probe() could not be used here. There is no 'device' pointer
> here.

Ahh ok, gotcha.

> I take __set_clk_parents() as example here, so use pr_warn().
> 
> >
> >Reviewed-by: Brian Masney <bmasney@redhat.com>
> 
> Could I still keep this tag with keeping pr_warn()?

Yes. Thank you!

Brian

