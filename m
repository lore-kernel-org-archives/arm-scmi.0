Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF2380C0C
	for <arm-scmi@vger.kernel.org>; Mon, 16 Dec 2024 15:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734361425; cv=none; b=ETeQNlVVa1CGAk6i8t4+6HDzTiBEwc+Upp5z/NFX+HkG3hjzvwcX1toBS2lInuJTAkerguYYAncpAzKS9Cl9MVt+Fhh9HCgf4y5BtiKs1Cv+72RT2TrOLlTwgtuCym2ZSJoTNohpVT9I9uoXvfR6WALc8XCaenEDX2g+u4L7Y+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734361425; c=relaxed/simple;
	bh=vbmnTHd57lgmE2a+EfJxUode1bCV5PqJOB6qYnzfOZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wf6faCnmX650oGBr/yRMSjyRGW0NjDEm6D0pVvhuTN3PlnYbWVKD4qor2kZAzRRn+ifBJcmbAIJlmmIrZkAWXnv9cpm8oZkyXphoLNC9AnCIOo5BzaQcGDmnd0rhTw6m6r5PXkLg9kyPxJXClcKvuXQr51UQAedk4E7N2ZLVL3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q4wIjinK; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q4wIjinK"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso28883965e9.0
        for <arm-scmi@vger.kernel.org>; Mon, 16 Dec 2024 07:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734361422; x=1734966222; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KLuSdhXzU5fPjlBaCI7uTe9mEWq+Czmflhxz92Y3yQk=;
        b=q4wIjinKgEaz2TrX1kwD0qpfiy6u6a7wan26OfXxpu6g+RS3QZl9mfBj1tVSc+UtTO
         Mr55PU6imVozuGIUmhz++CIoQGTpYQo8Qs6bU7hnsKSno2di19Wb0kI8gYV4XvFdk012
         nN68zW3UN0q83Bt5tRErN4w887v8EIlt5ZvMS2iiDrMCyjSGQyWV5GyosavZIT9l70HJ
         kKoSsoFBPOtHGA1E3vTGKUOZ5cSXNGhlbb7Az3jk+Sf4Ndqu11WHOWwNtjRK5zBUNT+O
         tyO+5CfqWOzSy+v2jS7S2pWTYctOXTUsyi6MvRrkebFVinNTWJImt/BJ4LLkWEwKcr0C
         M80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734361422; x=1734966222;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KLuSdhXzU5fPjlBaCI7uTe9mEWq+Czmflhxz92Y3yQk=;
        b=J1ZdymikaqS+5mk/CIQ8nt/xAs1/8Zo6O4UsqAf1DGu1mJfn4v7KwoNZEtArqwy2gY
         gNvE5wUWmlzMQibWJVq04mdyIQHfysR0006SkD9UUWQ6DR8j1YsAeXzV30J5EbQZTK61
         1H1Tv0jlCLuv8dQCsCWPAYb/1tNImNb7QSlxPKOHpQmxfx69R/fe9rlzaRZKpv1jIFK/
         4j8cCyjwoCrSJA5QoDPMSYUxJAAL3goP90CBIygtSnHFCVo/QFtJ1hI3rVB/t83jo2VD
         dSsNkA0b9qva6Cyhg8fb5SHpEky5LtiLSo1AXdyLkeHc6tNt6/8YJAOZ03fh+wEB7w1v
         GSOg==
X-Forwarded-Encrypted: i=1; AJvYcCW/nS00H0aD7GL2lLkFkAwSQ3S7DbrH4iyKVofxcby14J8qxEHuqIvVf3pkU7AP6kM+KrKlblbO8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXSsuSgXL3ZdXioP7al8oMQYsoBTLjpTot/KaRL+pyRgvXU1ZQ
	CxGCINzrrn94YnPGrTXY1Of0bZy2w/vdMNtFqcrIO3euLnzvVvN7sTnKOOCAhMA=
X-Gm-Gg: ASbGncs5+Y6uTBsy1QLbstHZIwKCxDljAfDWDsAITJS5nJSOsqqp4Y8hzDYFq7HengH
	XXmf+WN2PI0iaJSnGmmnjOtdlstTzYVNgXXCEcQf1uV7YmreEM1RyQZzQggE2TKb0GiAy38OKuS
	7R8N/QP/jwHySCVBpOxEIHEdV2hkKHTxpoVwFVvrGy1l5x0HkqGRceOMoged+Mlb85DEyS5mD7z
	CqsX4k2oZt2z73uvBwqppsXtdKklnN16I9Oe6XsyDiW9SgXqKSnPYdIkoBgOQ==
X-Google-Smtp-Source: AGHT+IFgA7pE6iq5l4aNj3MEJdJlOnoKDyOippnT7SVkzxP8qOFsy+JUmRbt9eJuqN9H6l9ghLXbHg==
X-Received: by 2002:a5d:64ee:0:b0:385:e055:a28d with SMTP id ffacd0b85a97d-3889ad38e4amr9996892f8f.57.1734361421518;
        Mon, 16 Dec 2024 07:03:41 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8012034sm8305834f8f.22.2024.12.16.07.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 07:03:40 -0800 (PST)
Date: Mon, 16 Dec 2024 18:03:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: gchen chen <gchen.guomin@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, guomin_chen@sina.com,
	Sudeep Holla <sudeep.holla@arm.com>,
	Xinqi Zhang <quic_xinqzhan@quicinc.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] firmware: arm_scmi: Delete the meaningless
 scmi_bus_id.
Message-ID: <c3803026-8286-431a-9042-62cf46ede408@stanley.mountain>
References: <20241216073745.2973317-1-guomin_chen@sina.com>
 <Z1_p0nU93PHJ4Sg_@pluto>
 <Z1_2rxJ7TOEIOMp7@pluto>
 <CAEEwsfRhe4-YAwe027huSXwFfkV-O-8w1GDNf=URa9efRsXiKA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEEwsfRhe4-YAwe027huSXwFfkV-O-8w1GDNf=URa9efRsXiKA@mail.gmail.com>

On Mon, Dec 16, 2024 at 06:37:01PM +0800, gchen chen wrote:
> > > > diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> > > > index 1b5fb2c4ce86..bbf1f05f2be3 100644
> > > > --- a/drivers/firmware/arm_scmi/driver.c
> > > > +++ b/drivers/firmware/arm_scmi/driver.c
> > > > @@ -2641,8 +2641,8 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
> > > >     cinfo->max_msg_size = info->desc->max_msg_size;
> > > >
> > > >     /* Create a unique name for this transport device */
> > > > -   snprintf(name, 32, "__scmi_transport_device_%s_%02X",
> > > > -            idx ? "rx" : "tx", prot_id);
> > > > +   snprintf(name, 32, "__scmi_transport_device_%s",
> > > > +            idx ? "rx" : "tx");
> >
> > I agree on what Dan said AND also this results in having the same name for different
> > devices across 2 instances if you have a per-protocol channel because you havent anymore
> > the protocol_id bit.
> hi  Cristian，and dan
>     Because I used a 3-tuple [parent name, name, protocol] when
> creating the SCMI device name, I removed the prot_id from the
> parameter ‘name’ when creating transport devices. This way, it avoids
> the repetition of protocol ID in the SCMI device name.
> 

I haven't actually tested this code, I'm just going by reviewing.

scmi_channels_setup() calls scmi_txrx_setup() in a loop with a different
port_id each time.  The info->dev is the same on each iteration.  Since
the name is the same except for the rx/tx then __scmi_device_create() will
find the existing device on the first line and return success instead of
allocating a new device:

	scmi_dev = scmi_child_dev_find(parent, protocol, name);
	if (scmi_dev)
		return scmi_dev;

regards,
dan carpenter
