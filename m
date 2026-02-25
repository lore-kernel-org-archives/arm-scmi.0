Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0103B95FB
	for <arm-scmi@vger.kernel.org>; Wed, 25 Feb 2026 14:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772030099; cv=none; b=B/3tVFR16VTNvWL4EJ5KzEdtztytwVw//B/Qa3vMDwJlE3o1ASKXfkg0VaHGIPLUxIpFIYVlcD1gQ+lrcbda7Ype43fonIdAz+VJ+wKvy3MTrSo6p97wU+4YlKZ9IMtFLCn5oRKxkGzp+h5kdeHXwPO8dCVP4w0vfDdMXmCP2vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772030099; c=relaxed/simple;
	bh=FYHNwuuJ8GR6jNpQRin47d5BrWW/5mhMYOu+alqoBtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hzKZ7wWuq0fPm0QWiaDumuo1VWgljKa3EVag0srk8ejpFbcrhuKkozBhumxQsfXI8i1VtQbNZn2SVNA8Mk/eJuPaT4+OmQXlR8m/wr79oB/d/9naheojVNX2dWBtp1f0nsInlOWaWqZ1AKrkbx7D0TEoSuJ3UdMaRcBkiHFgD4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x3e3TRvA; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x3e3TRvA"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-48372efa020so54453505e9.2
        for <arm-scmi@vger.kernel.org>; Wed, 25 Feb 2026 06:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772030089; x=1772634889; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0HkfTL169D0fGrdmLzQDRgZYg8tUQjAXGwSswhqog3Y=;
        b=x3e3TRvAMz6TK4R9UkiLerx/KzkvtLhXIln7A6SOhN9vC3Nn1DMQtO6cDVQMWYou0q
         s3D7YNK/5j+NNlIl3XWUF6yODHAgvhxffs6G9PpL/6bFhYS7S47ZIUTEL+xVzKHKv1Dk
         KqYOmsPgCq4EvojYJ3tFgvihj9LrgmGTjuVok6AbKM5bxf9lGT14tDbH4kpmyH28NHsJ
         waayRy1mBi9TL1V2xMTjtyNJVd1lFZpqrG230lGK2u3oQhLl1eGAu+QRHb4FQCRqnE2C
         BN5uciT7Ba1RpHu/ni1PM+whWuHc1K/bswrGdOl+2YMzxLm4x9FbiLLhuCbffrxoOzHy
         iqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772030089; x=1772634889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HkfTL169D0fGrdmLzQDRgZYg8tUQjAXGwSswhqog3Y=;
        b=hWWW6Y+TjvGvrG3VFXAeaLnoHIe2ZwX+5l6rdCxVo8nV2IjGc8gbQJF+wyny/1wjXe
         DagGM3WJ6Qc8h7wexme5zOeqRAhlfz5sNTOiSt1SNhmvEYvF/O/uY8NV9td1vdWohrN1
         H30M/hGUBiAHPCGDT9VjO76s+Sptt8bEvrQh2WkLYUUU4gcPTbZtpbGpVQppuxmt3VCi
         /OqsRaXpUujc6c4OfHliUPTN73uPck2afdN4lCLuWo9B7jKU35LTeZqvLaXwAF2VrZLv
         quFPGw7fVTok2ufgWOd4OrQ/nyiDdijNipnQhQ1rDxbktJws9Ty5HkLj14vurTVf12Ur
         N/6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXjZYOPPIevMQbGDo4dIxWnLW7LSfD+CrD7uxgGeFkOp/euNcRKq5+Tmqyh3I5w1yHIt2v6TtFdpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxizVSYg50IgO3VJkNfvN2jWkD/QZQmzAen+gHeQqJ8SWHd96As
	XNycD/g2vLeBQGb3kwXcubn3T1Ir4F2qVpY9gibARZsiFTFUWXyYJCe9tverxQKU+68=
X-Gm-Gg: ATEYQzzKvdrU3xa6GfIw9bdA9E/dVA8Z1uv/PcXjY2I4hFz1dILrF+Dsto7dc8IDSbY
	k0Oa/YI4rIS/LZ6Ddz6biTvTPqm4Kpu7c5syO7Hzc2mj8GRW5vf1DmFcn0iEZJnGV+lM3P1YVJ1
	JU8AbrueLFt5eus9oQfabPZRk2le4mc/ya7bPo1wsfJG3pbnU4ndTbZdiJfxAeOhJ+wQQnviVYt
	NNMbP0x8E+x2qZFt2S1wsbJhEgUbMbyH3EsLzjfAyoMNtklSwBHY37BqOwN1tZZGBoKoL8kns75
	omZuMMNVTaCJEVCn/ZFet5LwrZV6xp3Y/fRSgDJeq+kkD3f78tosWT+IjNppaLTiQ6/EHcxLtYr
	Jm0FsBniIJRyg0bAxGx+pV3XueXp1PH3mVIgyWxngrt44m3cuVSPHBH87T77x5WSyF4Ny7nxPHk
	8urF2zK1BQFOM2/p1wEib3YiaTmbymzJknyVLqxMP0q0QTByfGzkn9OK8e/p0=
X-Received: by 2002:a05:600c:8b86:b0:480:6941:d38b with SMTP id 5b1f17b1804b1-483c21b0089mr11214625e9.30.1772030088905;
        Wed, 25 Feb 2026 06:34:48 -0800 (PST)
Received: from localhost (h136a.n1.ips.mtn.co.ug. [41.210.147.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfbb465bsm32600765e9.3.2026.02.25.06.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 06:34:48 -0800 (PST)
Date: Wed, 25 Feb 2026 17:34:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
	Alice Guo <alice.guo@nxp.com>, Marek Vasut <marex@denx.de>,
	Utsav Agarwal <utsav.agarwal@analog.com>,
	Greg Malysa <malysagreg@gmail.com>, Yao Zi <me@ziyao.cc>,
	Arturs Artamonovs <arturs.artamonovs@analog.com>,
	Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
	Anis Chali <chalianis1@gmail.com>,
	Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
	Leo Yu-Chi Liang <ycliang@andestech.com>, Ye Li <ye.li@nxp.com>,
	Valentin Caron <valentin.caron@foss.st.com>,
	Vinh Nguyen <vinh.nguyen.xz@renesas.com>, u-boot@lists.denx.de,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>, arm-scmi@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH 3/4] scmi: pinctrl: add pinctrl driver for SCMI
Message-ID: <aZ8Ig0nHh4Zz1nJj@stanley.mountain>
References: <cover.1771856828.git.dan.carpenter@linaro.org>
 <a9f8de77176cf0b8afa2f1addd0183f52da9d00c.1771856828.git.dan.carpenter@linaro.org>
 <aZ8BITY4Cag1tyas@nxa18884-linux.ap.freescale.net>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ8BITY4Cag1tyas@nxa18884-linux.ap.freescale.net>

Thanks, Peng.  This is all good feedback and I'll fix it in the
next version.

On Wed, Feb 25, 2026 at 10:03:13PM +0800, Peng Fan wrote:
> >+int scmi_pinctrl_attrs(struct udevice *dev, enum select_type select_type,
> >+		       unsigned int selector, bool *gpio, unsigned int *count,
> >+		       char *name)
> >+{
> >+	struct scmi_pinctrl_attrs_in in;
> >+	struct scmi_pinctrl_attrs_out out;
> >+	struct scmi_msg msg = {
> >+		.protocol_id = SCMI_PROTOCOL_ID_PINCTRL,
> >+		.message_id = SCMI_PINCTRL_ATTRIBUTES,
> >+		.in_msg = (u8 *)&in,
> >+		.in_msg_sz = sizeof(in),
> >+		.out_msg = (u8 *)&out,
> >+		.out_msg_sz = sizeof(out),
> >+	};
> >+	int ret;
> >+
> >+	in.select_type = select_type;
> >+	in.id = selector;
> >+
> >+	ret = devm_scmi_process_msg(dev, &msg);
> >+	if (ret)
> >+		return ret;
> >+	if (out.status)
> >+		return scmi_to_linux_errno(out.status);
> >+
> >+	//estended_name = FIELD_GET(BIT(31), out.attr);
> 
> Drop this?
> 

Yeah.  I don't think anyone cares about the extended name ever.

> >+	if (gpio)
> >+		*gpio = FIELD_GET(BIT(17), out.attr);
> >+	//pin_only = FIELD_GET(BIT(16), out.attr);
> 
> Ditto.
> 

Huh.  Yeah.  It's not really clear how to handle pin only GPIO pins.

[ snip ]

> >+
> >+#define SCMI_PINCTRL_CONFIG_SETTINGS_FUNCTION -2u
> 
> I see spec is using 2, not understand well -2u here.
> When set to 2, no configuration values need to be returned.
> The command only returns the function selected for the pin or the group.
> 

This was just a magic define I used internally.

regards,
dan carpenter

