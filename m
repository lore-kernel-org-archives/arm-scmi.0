Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5136717A58F
	for <arm-scmi@vger.kernel.org>; Tue, 29 Oct 2024 10:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730197830; cv=none; b=JFjIyLCvst2lz1D6ZUUrrpJJJxHRrRJe3fahxahuQTAxmpyoxJc0i+J+z0DLMF+KN0iQBjgt33ap6ZNSzS27+jiTEgfFU9MoO/cSqOSDcNZGACY/6m5ZU68fy97GfVKVSggrmpX/xxxt+Eyj4dJBeWsF/exUhqGKaLG4VBkZk+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730197830; c=relaxed/simple;
	bh=7igP9dC4TidYYyvKYaEvxysTfl4s8lHJgmNuOwHuiMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k42gMdwaLtFlG7YWjsEfFy8u2+Kr1ddj8vKdNvuntbp53uFAqpfqGhzbstDBNnUliye4OMCqInMc5/KG1Ot3TkZGeoAgNW1nTDJeavR2chaGn6uzfC1ov0/gVe+Wt8VsfX9fl8IiTmiPP+xwkLselnWo9vA09WAzJ3Fs3jAcpnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YQIw5M+a; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YQIw5M+a"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c984352742so5830591a12.1
        for <arm-scmi@vger.kernel.org>; Tue, 29 Oct 2024 03:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730197824; x=1730802624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AyWsPGaLenswLKzBFr+HGCO8emJ7A/n9EkJRzHuahVc=;
        b=YQIw5M+aYQVDL1s5PVsLvo1OV3DOxFY+M+pPDnhn5WMjg5JW46XtKdsUayrH3UgDGO
         iRRrZq0s/ddsVltk92rs/G845RWIf09lObHEdFpdwrZvoX9vPBtYN7FfG/SiPmiHAvh6
         WASXWIsS1/NSNUEpSR/F1GhxJ2RUKlxBkLXQFuDltsyeoMPrFB/jK59F2Vshu/AAUmi8
         6jcy9w6ipl4qHMfy8fsjQEuFZGRM9EiLa3ED2umdnZExuoBVJPn6o7/G0sOhx9p1S6xS
         Jqd54G1J46FemZY4++BWN/MbYiKCGPe3nw/wO8J6vYQXIiN6t1alOLvF9crTZP2PTd7k
         7xIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730197824; x=1730802624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AyWsPGaLenswLKzBFr+HGCO8emJ7A/n9EkJRzHuahVc=;
        b=VPOz4xkVuZfSMvsqcjeWOvn+wkHc/JvP/goufusDl7CJCkQT6qNvYAj6Y9HG3prMK+
         mK+XWtGv+wylUrB9FjOKIu8GNiiUih3cSK7ImMS90gfHQVdfW2OLYUDEnSgLV23NUCkc
         ZI6c6g6FYroPfDoPbMY8qRkhxRt/QzzyJB943x9DeXpTjJaaqY+NjBBpBLX3RPR/1KVH
         +BgAp6PggAPYKyPpCDIh+W1z3pwSzIXrbY+eOEz8BQ89YHs8CaC5RjLjm6StErr5INM4
         63iUBpCMRL7DJOGncH5F2Rm5GZ7D+GBlfbMIRikM97FvbJaF8Rq/+SUw8k2Bv5YPbxUH
         dlFw==
X-Forwarded-Encrypted: i=1; AJvYcCX2Y6lrdAGacanPau2zWCUthtliflZ78Vs3erYL7aM5qgR5EqFTUzDVfgYYVtQW1G8TgtH6e/FYRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTIlMqmvJI9EVzl5/uXuY5FO/ggpOgb+iWNfOLHHKik7o2hjHd
	4TMOU4P7WUvQTqlMe6RoURWf0FgKAQrWnpJq6y/AhwaqzEF3bMmbyzIosQFVvJI=
X-Google-Smtp-Source: AGHT+IFLBIbS2BLWWMeqcJwwvI5hHTAZg9wXCpelBkjfJqZaqwMeXI7tp7y4aYh2UdNiYEMt2Rp83g==
X-Received: by 2002:a17:907:96a9:b0:a9a:a88a:466c with SMTP id a640c23a62f3a-a9de632e59emr1072963866b.61.1730197824394;
        Tue, 29 Oct 2024 03:30:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e214152adsm78966366b.92.2024.10.29.03.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:30:23 -0700 (PDT)
Date: Tue, 29 Oct 2024 13:30:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, girish.pathak@arm.com,
	arm-scmi@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
	Souvik.Chakravarty@arm.com
Subject: Re: Question about identifiers
Message-ID: <ba9cb437-43e4-415d-853b-7847d091c512@stanley.mountain>
References: <c5fdc171-0dc7-4c38-88e7-fcf9de7cbec2@stanley.mountain>
 <ZyCuAKfqRnuFdAwC@pluto>
 <CAKfTPtA4VwUhiuwm7u-tm=iLFE3m365+-Z84tg6hAse3oMkxMg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfTPtA4VwUhiuwm7u-tm=iLFE3m365+-Z84tg6hAse3oMkxMg@mail.gmail.com>

No, no.  I've implemented that.  It's just that I had just implemented unique
IDs for everything instead of 0 - nr_pins, 0 - nr_groups, and 0 - nr_funcs.
This makes it easier.

What I wasn't sure, was how to add the SCMI identifier to the device tree.  If I
want the 5th function to handle blinking lights, I think it works like this:

	firmware {
		scmi-vio-backend {
			compatible = "arm,scmi-virtio";
			#address-cells = <1>;
			#size-cells = <0>;

			scmi_clk0: protocol@14 {
				reg = <0x14>;
				#clock-cells = <1>;
			};

			scmi_pinctrl: protocol@19 {
				reg = <0x19>;
				scmi_gpio: gpio {
					compatible = "pin-control-gpio";
					gpio-controller;
					#gpio-cells = <2>;
				};
			};

		};

		leds {
			compatible = "gpio-leds";

			led@5 {
                            ^
This means the SCMI identifier?
				label = "blink-led";
				gpios = <&scmi_gpio 0 0>;
				default-state = "on";
				linux,default-trigger = "heartbeat";
			};
		};
	};

Let me re-work my test program using the correct numbering scheme and then I can
test that.

regards,
dan carpenter

