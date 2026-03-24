Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BED23EF0BA
	for <arm-scmi@vger.kernel.org>; Tue, 24 Mar 2026 11:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352448; cv=none; b=Zd4Ufo5b3xpwpGsZ/tZ9D0xbEN2kmERa+Z2j+v/gLQEjdqjrXXBaKZh+DM0RTjoHCUMFtSMsGwEnoerQZUuobVn7tmqnkUtIXe2uJOwwF6u5JvprYLDd3Z+CfhGi7pTxNDSXKWXoL9gkUiklwO4ZeAzpzZZJMTaMzBfcpRjjzOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352448; c=relaxed/simple;
	bh=9K31B+KMgL2pWzK42966IOpc+REPzpYxrHPyhZW4u2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S3lIEbzvLo1PzaFm1Hd4qK5ZtN0g0h7TzrbVKdUjTjbfkDivZCXWnT15dHdebvCa0EH9vwDWnQNDxz9qRAZbNazs3RiaKx3VNoCMJNwyU8+SpzJazqHGVrBHdq44cjlfQQ0M/9zUZvji0+tvVEzkMJTx+O2Q0fLP5jsPgNYFeKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rKS5hhbJ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rKS5hhbJ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso43532685e9.3
        for <arm-scmi@vger.kernel.org>; Tue, 24 Mar 2026 04:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774352442; x=1774957242; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ndr81qWrh1fbHF13yyK1nq93jUzU2WWIcf+1FEmV7LA=;
        b=rKS5hhbJ4QdR7UMiUbJd29r1X3n5bvidkhitudYIqWUNKo9Yo9rrVLc1dSRuNSX22b
         l1s29M9bDTMQ/f3TeeAtx3s+oSGfRCZ1f91I33R88T+gZQkSLnW+PWyBB/SN5TjedAZn
         Zq4fb5TC1ZQAYTcDja+lKCmNUwK1S36zINY4vocV1YqPtRu5620ufUg2sKHlxu45qriC
         Fjg5eXRLm+dJ2C+zSWP1UiQqnedi37s26LieCspkI/7vlV3qsN5Vr7v3jUp1ufIVkrfq
         3hDuDWDXF7O+F5pcIM5ERcl5V6Acffwk6TeVS1C7klnMwO74HxXfPxOAQu26TV9hfojg
         2kFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352442; x=1774957242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ndr81qWrh1fbHF13yyK1nq93jUzU2WWIcf+1FEmV7LA=;
        b=M1tzEfplGbdwhEdovrg2iXQkLzCgxEHrFggWiH0HcYI1wKohfAnBh8zU/NQRNNczGe
         wcy0fp5BNzWN46kqqlbLhyDR9zgVt9KlHwA8dARnSjcp7yaEBMV2AWriqKF2XPTct+Rx
         Mt8930kRIDelQ89qYagjF3h6wl8RsQ+tHw6Tfmn5aRib736ZTNBe2Y+TGMwaQkkMOnOo
         BtEUWb6itB/i8Wvuzj4t0dyUhbAk7zoPc+YWsb7PQjzPtH916PPmH7vji33i26/7eBAT
         MMzEXaWUoEt4sZ+eC9pnKUySMtBQeFu6r1Oo9xmSuMkfdap4iJtT/6mh/nW7gUilKPUg
         nifA==
X-Forwarded-Encrypted: i=1; AJvYcCU0sDKxOUen8uwJzYGQ9heRQRId/oqictj7gwkJ2Q9sgqNE54M3+6X3FGDx4k6w9eZQl/b1nrBVaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDMbhAZjv8FjrDtKAg/aE/PSIRG4jtTfCHTuDuLvwtQbZBAHLo
	kdtZ+/pPGqCqFbc2EXJaVh20SeWkB1B7snEfPbaU7fobhT5EpmGZY50/uouFJcwWkcI=
X-Gm-Gg: ATEYQzwNjOY8e+1c7jvKd4IVlz69VUSK5bygbVSzDfIQ2nSw3q+nwG+f0iIJLS94ILd
	a/pq2CVA/qNlSB2bqtHqqjzUlydvgvfmX5maZjheA/+kVoozauquGEm9pvBEIZfpNZmgO/5wsD4
	DNXTWImnj4U4D6fVCQf5Rca51Bmtvf31dlNcvCDFK7L8zrTw5Q+bx1xWmEgVVJ0okaZpdZWrEyl
	/w4hwSaRlcmpxTSgONVT7uK4CmiLYRJlg40tOEa4dCSYmtP3kAIT7QRz59wkgBb53ofxo1shLlo
	JOPYJmVDTCKDReXJPFIzqXY2aE3i7gv3gbxgFK06e56sHVkEilK1F+sukMaMatpTzdjkWbKxrnz
	5lSmi70RuRjACuCcAS4CJ7Kl9jzgXbR6xvwE/7lyIVAwy4/ISHGhJYRmfhGiD0Dh9ztDMIS2wEQ
	1LgPmu3VAuqrUWpf0nFzh699J2Qlvy
X-Received: by 2002:a05:600c:46ce:b0:485:2f4a:6ae6 with SMTP id 5b1f17b1804b1-486febb56demr206987245e9.6.1774352441962;
        Tue, 24 Mar 2026 04:40:41 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711701804sm47542065e9.4.2026.03.24.04.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 04:40:41 -0700 (PDT)
Date: Tue, 24 Mar 2026 14:40:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Tom Rini <trini@konsulko.com>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>,
	Peng Fan <peng.fan@nxp.com>, Greg Malysa <malysagreg@gmail.com>,
	Utsav Agarwal <utsav.agarwal@analog.com>,
	Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
	Ian Roberts <ian.roberts@timesys.com>,
	Oliver Gaskell <Oliver.Gaskell@analog.com>,
	Yegor Yefremov <yegorslists@googlemail.com>,
	Philip Molloy <philip.molloy@analog.com>,
	Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
	Eoin Dickson <eoin.dickson@microchip.com>,
	Arturs Artamonovs <arturs.artamonovs@analog.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tanmay Kathpalia <tanmay.kathpalia@altera.com>,
	u-boot@lists.denx.de, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	arm-scmi@vger.kernel.org, linux-gpio@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH v2 4/4] gpio: scmi: Add gpio_scmi driver
Message-ID: <acJ4NiwCRchgq7-t@stanley.mountain>
References: <cover.1773256350.git.dan.carpenter@linaro.org>
 <f8e1dcb617917dfe69efce0b3407f8786e4c971d.1773256350.git.dan.carpenter@linaro.org>
 <acC2fSdjDmj5Wp1a@nxa18884-linux.ap.freescale.net>
 <acDzsKoMdfcXecca@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acDzsKoMdfcXecca@ashevche-desk.local>

On Mon, Mar 23, 2026 at 10:02:56AM +0200, Andy Shevchenko wrote:
> On Mon, Mar 23, 2026 at 11:41:49AM +0800, Peng Fan wrote:
> 
> [....]
> 
> > >+	ret = snprintf(NULL, 0, "gpio_scmi%d_", bank_cnt);
> > >+	uc_priv->bank_name = devm_kzalloc(dev, ret + 1, GFP_KERNEL);
> > >+	if (!uc_priv->bank_name)
> > >+		return -ENOMEM;
> > >+	snprintf(uc_priv->bank_name, ret + 1, "gpio_scmi%d_", bank_cnt);
> > 
> > build fail in CI [1]:
> 
> Moreover, this is reinvention of devm_kasprintf() to begin with.
> 

devm_kasprintf() isn't an option in u-boot.

regards,
dan carpenter

