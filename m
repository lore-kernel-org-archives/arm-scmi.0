Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD243043B0
	for <arm-scmi@vger.kernel.org>; Mon, 15 Sep 2025 12:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757939754; cv=none; b=ftwO8TWbYNt2Tz55us3Tjp5SPq7s8RZvlXFHM+qSwnxnYZmOYE3O5Wjx/V5+QglLoZZeUJ8hdQYX/z55HY+xiYfKwUqNlO9TUzd/Q1svCajydkBW32yL9ptz3MWI9D//J0qwQbz3xtNL48k+T7HtAT4FkmQLSYXae3TWNN1b7qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757939754; c=relaxed/simple;
	bh=gpLksYcw9Myqwzil/WQeDaXG00Vp4w5WqIhVKKBj/rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=mGNPctMJCb+v+pA2UMlMGPrFNqMedPBgEdsgKIHzkrKMYb/9ya1TXsuPQ9LT4ue2ufkL7KPvMVhBuWIAeu68ub87fT+DL+u269m0pZyfUqJyvnnSciWQKavOW7f91awpODH3OmyUOFRaRgQLfYreBpDlimSh4kbkrOh1HtN1v2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R8mxsZIA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R8mxsZIA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757939751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wLL8rzXBaL9TL+cKj7734rcnA0rGbpZjb3H9q3ePb+M=;
	b=R8mxsZIAozw1D3D2hjWbuyZPRDARpMApGustgFmRsrEdwY2cWRQ5S6mTEUrYPsr6Tdf1US
	D/teNfTTukBg3WVdIYFgeU6ihEmPJ3fGNoapeQ1FHmZoSQQV5RkW1z9saqUXeD6p4Sj+gg
	CoFhl8nSKgt43HVTGnWxizjFS+96R9s=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-M7tQUMCANueRdJ0FsPturw-1; Mon, 15 Sep 2025 08:35:50 -0400
X-MC-Unique: M7tQUMCANueRdJ0FsPturw-1
X-Mimecast-MFC-AGG-ID: M7tQUMCANueRdJ0FsPturw_1757939750
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b49715fdfbso145845131cf.2
        for <arm-scmi@vger.kernel.org>; Mon, 15 Sep 2025 05:35:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757939749; x=1758544549;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLL8rzXBaL9TL+cKj7734rcnA0rGbpZjb3H9q3ePb+M=;
        b=uujMf1ajplp4AT/SB9LfVDNDW7Xi8NSgw61/3H4tAS82YVuXWDRupmXNqkNtOQPq50
         8I5u1rbdhsU3GbTnLOuBtn2QpvfzT0w86ZpQFHfO3hnjysceuP0VvhxlZp1wzWabGbwR
         XOJF+4uKNzx5y0rGgEJuE9areDo7MgKm6fO0lxuZDqz9H5yQxETIK2XbruC4Ngl1ozL0
         x3Y8saCmTe200O4BcmnRfKyRcaOoq2ZoZIVA15wKX6C/n76q3hyNKjFD6GLi6IMv2g7F
         KEnuh9g/7jfKuZ1Jo/Yxf1wtylA1ZFbDA2V6t3fNFtDsHI1KU9V8hRjaj00qGbLrA/pq
         HOyQ==
X-Forwarded-Encrypted: i=1; AJvYcCURyRledDjsB/tVIa4poQ8VfVO4aRY1px+Jlk2C1wVdfBm6t0IidZdXbhQTX4VV7OlTF/vaSVuLaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0Zp+GnIvtREYlcmGDhHkzYs2gkrL77jIixUPu+IlEecMFkyay
	rdS63D3X9qqjutXC2W4wgpxp6dwPgrLmqlkEsBwXe15P3H1+Zp3ZPa96k0hRu+wPMjARVBBV4e/
	Y0fDCte+MmiRBt3iPlCSbUCfD6ZgREvro1MC6WIf9oxPHJetpijCi96s2nUvyBe/9C2k0P44=
X-Gm-Gg: ASbGncuXhtyOPov5dgRS8V4qdr54nTnEQhOxsC1dGb4INv6t+16FtMbcXnf64DnZpCH
	XKGhCCxkanfynXFsujZUpfHNo+mhF+Inb2RaANartweCmFb9wao6H02W52M5dvbW+dpi6VExDj2
	w1M3doGGD7aSk3m7ig9IR2+eCxwsROB7hxY2LdI0wDIhg+ykk3kaIO4d+roq4x11ciN63kME+WZ
	mtWGmgNCc7sIpR91ukLVsI7tc+Lr3VcaMXZ7XYOTyJC34oeTpydW5juPwY+ieQ89+aYWp0Vv+KE
	DyOq2NiFCXJs/6kfRFlirbV0S4ZmGPIEyZLk3m7TQT/MEtj2w4wzLHJxwFnIQUWDEIqsOzpynpW
	5qklEj2PXO4+p9NxeEBcIjTnbawVTnUk=
X-Received: by 2002:a05:622a:1346:b0:4b4:8f9f:746d with SMTP id d75a77b69052e-4b77d04040fmr148337431cf.24.1757939749219;
        Mon, 15 Sep 2025 05:35:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHY7Mxjz8VG1qTosAk9YY8DjG+y2q7MXDw84ZmcJWfZt1ziy/I8az1raMUNBU225CmbUCJKNA==
X-Received: by 2002:a05:620a:3194:b0:7f9:7000:f7bb with SMTP id af79cd13be357-823fbde9118mr1346851185a.7.1757939388265;
        Mon, 15 Sep 2025 05:29:48 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b79a7b639esm26809461cf.5.2025.09.15.05.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 05:29:47 -0700 (PDT)
Date: Mon, 15 Sep 2025 08:29:44 -0400
From: Brian Masney <bmasney@redhat.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 4/5] clk: Add KUnit tests for assigned-clock-sscs
Message-ID: <aMgGuDxzYZpw9sti@redhat.com>
References: <20250915-clk-ssc-version1-v4-0-5a2cee2f0351@nxp.com>
 <20250915-clk-ssc-version1-v4-4-5a2cee2f0351@nxp.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250915-clk-ssc-version1-v4-4-5a2cee2f0351@nxp.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Aioz4kCPdi9Z0-ty_cd5KZmUVn98kIYlopUAabx-_9g_1757939750
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 15, 2025 at 04:29:38PM +0800, Peng Fan wrote:
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
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

This looks good to me. I'd typically leave a Reviewed-by, but that's
probably not appropriate since I'm already listed with a
Co-developed-by.

Brian

