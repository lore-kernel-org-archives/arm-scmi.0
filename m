Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5308C524AE4
	for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 20:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789763995; cv=none; b=f14jnGWU/rPhUAK2rg/LenXuFTXjEoR/NplPXqkcilPPnI+z24Vna/KzFZa/ckUMBTMTSafTb/Tm86kG1ue73pix3pv5p/5dipeG7VyPr4ipC2Qw3kMswHnS4/3WDo7+slWaTTe0gkxsQiVX7i1ZNiQOV7hJvxcEYZhyDrAHQhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789763995; c=relaxed/simple;
	bh=xFO/erSL5qG8LKEuVyvicNu8e6xbhP4+3KYp7hnLEXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eIMZ5kDOwCbtS2HY4kf6xX8E91+tm33FgO3aQOZQj7SehSSLPeJ+1/q7t5YYdoHsSx6wtosCHPo1hgs8Mkfv9iITDhtgOqXF9HGgZCmbc9DjarEgPvp7hZsrsLfh4Ax4cFOAd1cdK2wgkulXqIA0Xps80YH2QxZXCkB4FkqOtHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=jTOulGGY; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="jTOulGGY"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so6619765e9.1
        for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 13:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789763989; x=1790368789; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SrF5NSzar5jv65m2jp9XTBtvCU5/5PF93POgQGb8pAQ=;
        b=jTOulGGYDfMtiQoK6I0knZuq3g1Mo1j3aCCz8fvl2korIYRIRmITvyuXEAXNU0iqHL
         861eFGGGPgN/+jJ9C6NHsMzk2fGYFLU4XcjSAs1GGW0RVPzwjUSuj+ucWkZ+oCTIDwDi
         /xFaGn2H0fXTcorwHgO2mdZT7PZfe/+gogPXH8ErAdRD9etGO0tHmVakEubJpYGh2Fc7
         W0Y91x7G1qQMdW+6RRnirtD1VJcrsIC3qsYZ397SLxD/YLd0ewF2R2p2S9tmEN3qA/rb
         KFlOoHPHjUQpH6IBsRBDHTlzPCddI9hBjV1oN76DOv70hBp6JL/4vSo5AHLpp3gX6eCu
         kHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789763989; x=1790368789;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SrF5NSzar5jv65m2jp9XTBtvCU5/5PF93POgQGb8pAQ=;
        b=AHaWmF5+Nhh1FqxVUju5v8CAp0BLybcCm3Cw/Idnk/RkA6Fix2IWIRoCKksgq1Zygi
         KEVNP94kjLd/0puwRy2f/rgO89IbQZ8Dq3Mj+S1fkhc5NBn7EjOuSU6gtugLRkcsKXX8
         beBLsCHRyZujruoD8lVHbM4Ws1lHgBpUn8iVGshc7hBN4R9kIFbbqqJ6QTYB8eOfcRt9
         FTcREvPLxOo7RER+K5EoIbQsvoiD7gzhxdcdgv78GWYfjDOtoQ1h5nHl+7me/U5WaEuy
         nqI2mNnPtS++3zwaa2uTgQoPhK895QEwoaRaqo6c5/+7+2QusYH8RnkC1M50U4I9zrme
         JZCw==
X-Forwarded-Encrypted: i=1; AKwUvBxLU2iAoaxnAvrlcf0Cc7X4kXM1sS8JZ61gkrxGWF1770jpBelRpSANhQzF5x2/Ur9NF2l7YWpZJw==@vger.kernel.org
X-Gm-Message-State: AFuF++lWaE0rHHyFKUHq4P9cp8V6hBcSgi76W3/06NGz/xFxMqGXF/+G
	2YWV7pUvmZwgB1zyfqZ2qbPZWcHkz0MuL/pu/KtnWCe6BUtLhR3S+yg4vHfWegevJr0g7STmfGC
	97A5J
X-Gm-Gg: AYBFou20g0jBXy4e0Z0BP4WdLbBTxa0IagfEUXgrucBrFefqiRkvhHo6LHMNrs/RbVb
	i39YkB5yCU1O02BqTq+slwEum4VdSg+HjWersQV6OfWbI4nvgZRbpT7d7yLyQORCAQVTqJcbfEG
	V1+0gib3E10bRkYN9N53U/qThnTq8VDOGX49XwAiOnuDhPK7HhDqtbbzwdpnfLsa6q09udVY5gn
	lgI8ZNM2WriGzdWtSuLssL6DxFsjFLypuyFfIYCk/TJhrUjCesRFD6wbE0dvZuyQddvOfR2Fly1
	SZCffeQ5fsE1HYCHMiIX9Bv1/MMpN0gJXCJ47+FIXAz0wUEg+eVavQqPbvR1hg904zTbg7R3pEt
	kZP1wkk8Ki6UuTVVXZ7JacaxPe47Y/MmKgjKL24aGfG8fiz6vPwPTBcs6zYq8pjFkixEB3E5+M7
	6tCbva3mmcmdOm1F6KU47HJgWvI49lVq3bn91knj/B5KbbVUHGlj/r4gwMVMlUxlRvZWozFeQ4m
	1s=
X-Received: by 2002:a05:600c:c0c3:10b0:49e:823a:9dec with SMTP id 5b1f17b1804b1-49fc5a10b5fmr75871985e9.3.1789763989396;
        Fri, 18 Sep 2026 13:39:49 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49fcd8bf159sm4358055e9.10.2026.09.18.13.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 13:39:48 -0700 (PDT)
Date: Fri, 18 Sep 2026 22:39:46 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Frank.Li@kernel.org, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
Message-ID: <aq2g9otvja7xQqJ_@monoceros>
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <20260918-impetuous-daring-barnacle-1ea4d0@sudeepholla>
 <dca62a09-2af7-463e-9ba0-1be935a95502@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fq4cwhvzzcfekf2h"
Content-Disposition: inline
In-Reply-To: <dca62a09-2af7-463e-9ba0-1be935a95502@oss.qualcomm.com>


--fq4cwhvzzcfekf2h
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
MIME-Version: 1.0

On Fri, Sep 18, 2026 at 04:09:36PM +0200, Hans de Goede wrote:
> Hi Sudeep,
>=20
> On 18-Sep-26 15:32, Sudeep Holla wrote:
>=20
> [...]
>=20
> >> diff --git a/include/linux/device-id/scmi.h b/include/linux/device-id/=
scmi.h
> >> new file mode 100644
> >> index 000000000000..1b4ccfa9dcc5
> >> --- /dev/null
> >> +++ b/include/linux/device-id/scmi.h
> >> @@ -0,0 +1,17 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-only */
> >> +#ifndef LINUX_DEVICE_ID_SCMI_H
> >> +#define LINUX_DEVICE_ID_SCMI_H
> >> +
> >> +#ifdef __KERNEL__
> >> +#include <linux/types.h>
> >> +#endif
> >> +
> >> +#define SCMI_NAME_SIZE		32
> >> +#define SCMI_MODULE_PREFIX	"scmi:"
> >> +
> >> +struct scmi_device_id {
> >> +	__u8 protocol_id;
> >> +	char name[SCMI_NAME_SIZE];
> >> +};
> >> +
> >> +#endif /* ifndef LINUX_DEVICE_ID_SCMI_H */
> >=20
> > You need to include this above file in include/linux/mod_devicetable.h
> > to avoid duplication of its inclusion elsewhere. That's the pattern fol=
lowed
> > I see.
>=20
> That is what I did for v3, but Uwe, who is leading the splitting
> of mod_devicetable.h from one large monster include to smaller
> per subsystem/bus includes explicitly requested me to follow this
> pattern, see:
>=20
> https://lore.kernel.org/arm-scmi/aow2GFAfy84k-N2B@monoceros/
>=20
> [...]
>=20
> >> diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetab=
le-offsets.c
> >> index b4178c42d08f..91ec3704ee2b 100644
> >> --- a/scripts/mod/devicetable-offsets.c
> >> +++ b/scripts/mod/devicetable-offsets.c
> >> @@ -1,5 +1,6 @@
> >>  // SPDX-License-Identifier: GPL-2.0
> >>  #define COMPILE_OFFSETS
> >> +#include <linux/device-id/scmi.h>
> >=20
> > Drop this for above mentioned reason.
>=20
> This was explictly added at request of Uwe because the goal is to
> get rid of mod_devicetable.h including all the device-id headers
> in a big single catch-all include. This is done because currently
> many files include mod_devicetable.h and then if any of the device-id
> headers changes everything needs to be rebuild, making incremental
> kernel builds much slower.
>=20
> (and the same for the second include you point out)

FTR: That all sounds right.

Let's not add the the dependency mess that is mod_devicetable.h.

Best regards
Uwe

--fq4cwhvzzcfekf2h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqtoY8ACgkQj4D7WH0S
/k5r0Qf8De3R8/xBOJ/3LeAPH4UFuVBKGGI19ecvA8OulWQaGdttHVOB4PnQgqqI
zr/VQpCTb0UsY22b7aTRkbE+WpDtBA1glRTMwymtj8USz80zQa5+7SjfjrWcBpLt
CvSb/wjcEMfFDbN9cDw9J0WsUZhuALKA5oZW/kybeJxaLWF3pafGwaSZ8eCC/Ohl
au0Sk7ctvGaQOlJqXEuEqcRubWvFyRDmdgkfTXzJukqSdKh8Zlatdd7IWvSyT5KL
RdGlPH5frkEDcB+9Wu3HXANsWdZIe8FsrozPlGoF+7TgbayKM83MOuglXb0/lTJE
NwVV+Boz1Okzu1j4XOq114FfH2ZSaQ==
=ekEU
-----END PGP SIGNATURE-----

--fq4cwhvzzcfekf2h--
