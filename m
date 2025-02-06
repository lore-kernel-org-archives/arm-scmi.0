Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C27222C321
	for <arm-scmi@vger.kernel.org>; Thu,  6 Feb 2025 11:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738842019; cv=none; b=Z9eedl9HAzTITro4CwqwPlSxRJAJ12F/togabzKoCVnFbGYub7vL4smn7wutbfk5BFW29liozTGe5+Y+90hOMYAKjsmboo7h5c+xKKFikYTinY/CN1Ddc32OFR9yEL+QMeB/OJ3cNftHcuI64WM/Ixe0ovCBOAF51iKcXIIVMxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738842019; c=relaxed/simple;
	bh=JwrnIDxa7fiK9DOXokfhuwLBPcCS07LencS6UDbMmbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mDEbiqtbeqWkr9HRmMYAxGpIMZyaas4ou7d1xBigjATwq2AEpcRCdV7zZzXxlhk6J6XjTTrVyq8oKb6nBzzvhxcvLFtWhKEIGQxpvG1ufV2Gow3nOobQ8zobjvIHwW5SUimW1DXpNBpHvh4JHohZdgHUjg5FzCiLTAjY4rTpac0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ERGVUPfd; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ERGVUPfd"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38da6dde4c0so327373f8f.1
        for <arm-scmi@vger.kernel.org>; Thu, 06 Feb 2025 03:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738842014; x=1739446814; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RKka8q8Has39PLR0Yd8RpCT4IAmN7UpWKg6ZilU2jFU=;
        b=ERGVUPfd5717HiKZFuAUGPIxRt0qdPYNkojYyoouiXbzrvYxtiJ9f53ZENtnk3xf3g
         ZavxoJLU+77BkKgbD/VleN228CftFaqR9EigNCmsy+sXxxkESaV4LbYB+7ePHgVdqGof
         hgAtvQztdvjibJmSfdpVvwwuUPtTlFwXhv7EgTOl2IhDfpEPEkaDQ3mFEHPrMy8CZXkV
         vxg8SG/wzsiYQJ6UIjurpMPC3ktzRI3fBC9lHSS9qEBiIunldKZopxCIYUnjZiSiJTvZ
         1p8M94O1Ki5Z4qw6WqqrsZwdMvRVleTf934rjGSrzRFe8mJcAHI4tLIJJWNCx09p8eru
         5lIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738842014; x=1739446814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKka8q8Has39PLR0Yd8RpCT4IAmN7UpWKg6ZilU2jFU=;
        b=SBzEIy9uOyjcxq9xdw6ra0O+NT/BVHBc7v9H+y60irlR5sHHK/DAsMwi19ISNwsc/X
         A+FewbudEpRtf057PNnrO2R88oseEEkondAV9RUjNeTcdU2M67zjwn1I0oft5fBV+mr3
         Bzj8yDlmEYNEqige8XwyXNYi3/uK3sjR7JVZaYXBYdbMl859P+bLdEckf6HKaV0mbZ2b
         Y5jgl52KT5KW/ZRhDLguvjaC3ZEQSUrb/es8zsh1T0k2LBvJKS9E+0BkB3Yrn8nk/BbR
         zx4drrbjcw49tdy85m6WXDtINyl3hNHOh9RpQgpdsyw45zqsbqGuo1P8T7FSbLWKCaZJ
         zIYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrILCneOJrZivgTvmLmniM1DBgJno/MVWioW3Hq1TmyMqiQvYymHnxj/P1U76e5qS74So3iesw8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJGtkwL2fKY7H7a+tTn0il/MkHEVoEGbrBUKaR+LlF/lc1oFbx
	dyS0Axk2yiMBvW/BQbF/TecRhUJ6YupxzXeiusm4cJvEGK/4hFQNXKPtqUckQo4=
X-Gm-Gg: ASbGncsb/s0OJVH9d8OyNEeXalIdzhgD7YsqhbPDTITw2lWiNFg3Np2BPL5000oPmNr
	KoNGGg3jaxJC4Vaadlu9qLSLez2vu/gt5FuWo0O+CjPuFlSQxKRX99YSidOQB3hHxPlhE92XmG+
	8Acs5XlJQzjq32CGsSq5vNSZQaopoQDFv7Lz9UlHW9slhb9XXD0vAqZNaTKP8p0qvREbkTF9UxI
	QtlA8BANsy/4Bnv4PQLMHxHoa5o/7uHFjegsGgTwGAZiszeJaeFUYG4zAYUBVsj0vddQe0XKKeV
	g3UEQp7P7bl6XRXDnw/F
X-Google-Smtp-Source: AGHT+IHK7xN1+O0lC7SA+Z4hYlZwlXq1mhwhsAv5rC/JniJV62KNS95+EeAeYIVWA7BzbT+PnwAdWQ==
X-Received: by 2002:a5d:588c:0:b0:38d:b6e6:4445 with SMTP id ffacd0b85a97d-38db6e647bamr3919617f8f.24.1738842014402;
        Thu, 06 Feb 2025 03:40:14 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4390d9334e7sm52136505e9.6.2025.02.06.03.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 03:40:14 -0800 (PST)
Date: Thu, 6 Feb 2025 14:40:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 2/4] firmware: arm_scmi: Add machine_allowlist and
 machine_blocklist
Message-ID: <15f20562-d5f3-4432-94e1-06c8174bf3c1@stanley.mountain>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-2-3af2fa37dbac@nxp.com>
 <230612a4-92ee-4acc-85bf-f1c47dc3c35b@stanley.mountain>
 <20250206110508.GB22527@localhost.localdomain>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206110508.GB22527@localhost.localdomain>

On Thu, Feb 06, 2025 at 07:05:08PM +0800, Peng Fan wrote:
> Hi Dan,
> 
> On Thu, Feb 06, 2025 at 11:02:04AM +0300, Dan Carpenter wrote:
> >On Mon, Jan 20, 2025 at 03:13:30PM +0800, Peng Fan (OSS) wrote:
> >> From: Peng Fan <peng.fan@nxp.com>
> >> 
> >> There are two cases:
> >> pinctrl-scmi.c and pinctrl-imx-scmi.c, both use SCMI_PROTOCOL_PINCTRL.
> >> If both drivers are built in, and the scmi device with name "pinctrl-imx"
> >> is created earlier, and the fwnode device points to the scmi device,
> >> non-i.MX platforms will never have the pinctrl supplier ready.
> >> 
> >> Vendor A use 0x80 for feature X, Vendor B use 0x80 for feature Y.
> >> With both drivers built in, two scmi devices will be created, and both
> >> drivers will be probed. On A's patform, feature Y probe may fail, vice
> >> verus.
> >> 
> >> Introduce machine_allowlist and machine_blocklist to allow or block
> >> the creation of scmi devices to address above issues.
> >> 
> >> machine_blocklist is non-vendor protocols, but vendor has its own
> >> implementation. Saying need to block pinctrl-scmi.c on i.MX95.
> >> machine_allowlist is for vendor protocols. Saying vendor A drivers only
> >> allow vendor A machine, vendor B machines only allow vendor B machine.
> >> 
> >
> >I think patches 2-4 should be combined into one patch.  This commit
> 
> They are in different subsystems, so I separate them.
> 

I mean if the i.MX driver prevents the generic driver from working then
we need a Fixes tag.  It really makes it simpler to understand and backport
if they're sent as one patch.  Normally we would collect Acks from the
maintainers who're involved and but still do it as one patch.

> >message is a bit confusing.  I don't really understand how the
> >"fwnode device points to the scmi device".  I understand vaguely
> >what that means but in terms of code, I couldn't point to it.
> 
> Sorry for not being clear.
> 
> The devlink framework will take i.MX as pinctrl provider, because the
> fwnode is occupied by i.MX pinctrl scmi device which is created earlier
> than generic pinctrl scmi device.
> 

Ah.  Got it.  Thanks.

> >
> >> Vendor A use 0x80 for feature X, Vendor B use 0x80 for feature Y.
> >> With both drivers built in, two scmi devices will be created, and both
> >> drivers will be probed. On A's patform, feature Y probe may fail, vice
> >> verus.
> >
> >You're describing the code before.  Is it a problem that only one driver
> >is probed successfully?  I thought that would be fine.  What's the
> >problem?
> 
> VendorA 0x80
> VendorB 0x80
> 
> If both drivers runs into probe, VenderB 0x80 driver may crash VendorA firmware
> if the firmware not designed well.
> 
> Not big issue. I just think we should block the probe.
> 

This is a theoretical issue for now.  I would just leave it out of the
commit message because it's kind of confusing and it might not even happen
in real life.

regards,
dan carpenter

