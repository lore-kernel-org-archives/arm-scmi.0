Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700E3BA42
	for <arm-scmi@vger.kernel.org>; Mon, 27 Jan 2025 06:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737958723; cv=none; b=PC2R1J5e8yQ/yrRp/ChPssNOxm1+TDg/4zxAF1l8f6ncFKuLJLwr83tSP55tnnKvJKPD2w9jAgOb4Paowt4TM6BVFnwbHA6Fh88VZZSYX9KJRDOOGQc3EFIbaezUpn7XuyG6XL+EuGHChFtauarK+GCa43qlZ/+zFz+k5IZHuqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737958723; c=relaxed/simple;
	bh=XAd8n52BBxOMyfHtR7xwx4+brbQgz1XmQ50DzqsGEak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uuK9I8Fv2qQBqnVscwzMvGdHu/9HuzXA1zSWLIZ+vx9AJe93VX4+WoRgvBMqSLAX1YbD6A9vPmE9LxrV3VRLeeqwH3RAIGhElLs20AqPnyMoE8OxDuqcDeTSqCfZ8VR8B35JwlNC2LtLCrjOZrd6epDzVu7+QYwOCtq8XhLZG9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ASOvp3Pw; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ASOvp3Pw"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-385ddcfc97bso3521729f8f.1
        for <arm-scmi@vger.kernel.org>; Sun, 26 Jan 2025 22:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737958719; x=1738563519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l6JIU8E8ACVtZ15qfbCmjhyH/1YQFjlEda1Tq+6/hDI=;
        b=ASOvp3Pwz0EzHFDfjt8PLiTmXv0K5XoDQdqHqltr2qZRBanx5noCK2kDIqz0fizm0f
         yE/TaXZwOtJm9TBqmYgLaodPvjUZT8ybkyhG4PeSEzrTm5iuVNRCdQfxBNQgUEHO+f1N
         f2dumzOHCxw6FKJpdnEw8IkOXgpnxCr/3L4XcVLdA1N1p85vUOomDFovBm9TtmhKwaX2
         epBkQeY+7upDq0/B989FKEqx6ljExF7CPthmgPret4rxSlo2/GUCmZH+VkQ/xj6UmrmN
         qE+VJuWL+o0g41XHq05IxvPoAkoX5VCQjWJOTS1SBbshsv867RAnJsJRG1Z9o7JhLOWS
         MDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737958719; x=1738563519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6JIU8E8ACVtZ15qfbCmjhyH/1YQFjlEda1Tq+6/hDI=;
        b=mdb0pSU7Y7N9/U/UP0RO0OElbyvm0K4bqUVzFoxf/9Lq9Vn5fubzT1gXDZ9u1fAlWT
         rY0sBue9M6OJUqEQTSCqNSV5tVidH3/oZ+ifJVrFVnLddLoTRgw/VdlT4Rj+AeBYlo/x
         fYjJTLYM/jrV7PWnp8ODtXLR8jNUuDPRI9LwsqUVZoqKjZNHxmkxR2MR0ytKXCIj3wK4
         hiLr7rieNzTGuH0JiyoMS0oXykKHmJFuRU9DNViUGaSmX+mRXrCNO35oOYKWbEzVE12f
         vSOTBvE8AlO6l5lTAHMYWXAnNVUpn3NLJfAH+9upjzidhczJcAL540RzD4xSw6mc6Rdc
         bHNg==
X-Gm-Message-State: AOJu0Yyqkr96/DozWac2gt6te2UsM5Yg/Z3qfn4cgexGfnSHQymjIiWe
	rFgXe4hIRhHYGGch5dziu95/ow02v+ylqWGlHS1fK4TaLGVQjXOq6vdus794CIw=
X-Gm-Gg: ASbGncuOes2ihHVJ5wLUepXrwW+FIRYMP7Y5MVSRtDou2OXrzqtTYKRqeD0G1XA73hL
	tVg+tcCOlYLMuewFjGggSA0cTBsj71mvCzfA+FuQ+AGFZmt9UO33NAoa/m8rY9qmvdMGhEzjiiD
	epV2JcStlDDi5R3wHkA326fziFYXMvvHytuRqQYzvFw+qtmFtokGP/USLgXvMcn/KlCZhV4g3wu
	ALuQj/H5JAV5itE7AOabLHceqBM1h16upo/uE6mrbinutRO0G9VLpdpE3VOUw/YK//syVyJEYFE
	MzyuFV186A==
X-Google-Smtp-Source: AGHT+IEC7h9TF1gYWxcSqhEDbxVeBw48C9qByGcpOriEcI163ECEjHmra1s31tkOTQjUfatKh3w6dg==
X-Received: by 2002:a5d:5848:0:b0:385:f527:be6d with SMTP id ffacd0b85a97d-38bf57b7fb2mr34002926f8f.36.1737958719204;
        Sun, 26 Jan 2025 22:18:39 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17d6f8sm9863010f8f.28.2025.01.26.22.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 22:18:38 -0800 (PST)
Date: Mon, 27 Jan 2025 09:18:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>
Cc: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Girish Pathak <Girish.Pathak@arm.com>
Subject: Re: [PATCH SCP] module/scmi_pin_control: Fix ->write_payload()
 memory corruption
Message-ID: <a27c3603-19fd-4eac-bef9-87de0bd1bf90@stanley.mountain>
References: <ec49918a-595c-4755-8b1b-f0351e63de1f@stanley.mountain>
 <DB4PR08MB7960497670EA3B3C77101E27EBEC2@DB4PR08MB7960.eurprd08.prod.outlook.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB4PR08MB7960497670EA3B3C77101E27EBEC2@DB4PR08MB7960.eurprd08.prod.outlook.com>

On Mon, Jan 27, 2025 at 02:08:43AM +0000, Khaled Ali Ahmed wrote:
> Hello Dan,
> 
> I'd like to update the scmi_pin_control.c regarding your proposed implementation.
> 

Great, thanks.

regards,
dan carpenter

