Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EDF411F8F
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 12:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573683; cv=none; b=GGGoieZozsQlyqeHFqHh1vEV73S+8fVsF3qjoBUeTDY7H6Kkl0FnCYAJT8XR0etFN/Ww4tvBNeUwhPpNo0Hd8DMCnRaiUJWrqipuQPtf8+eRiAPrLW50365O14DTKDYS1j7wgtyUjnOG0HS6gh6RD5M2DVTtWnkFwqp/O0Yl9wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573683; c=relaxed/simple;
	bh=eiBo1yduJHaXAj53sijSuIC7kmal8T2Qf0O1edtX+Zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hlQwIavEj7fTPYnTFfebB/lzmgfLSJ6FwgUydcRUdQenJXjxKLq9/v+7CJL9a44VCcr1Xi872BEl/vxwsjiKso+5TYPi8JCQwINiybFjN35l9cP+6jJscntvHcmmz9dDmFYEISCS+ibAHrx10wHZ11Zw1nDVJYwi3pfskXSSs58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ak5bNc39; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ak5bNc39"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso5431231a12.3
        for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 05:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787573679; x=1788178479; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IJ2S2NN5RmqVB8PHkfxAhd8Zl5dVEhVpefrqaDYB2O0=;
        b=ak5bNc396c9nI3LQikLj+knbykk1XtzUDJ7bNWAGhrX5w0pfWO1C37kPAJRwdUtj1h
         sslNEKNO3hPYWl3Yb1w8pXlcDevqqR+63cfLaN6ZokSWN0SD+XGGtZgcdYCNFwOJMEWD
         KNVew/vQPLsMyNHNeCFgy/GebeEhhSusKESZsjs+wE23sAwvrhMMNhONhjI6xgXgrucb
         M0/PfaLb0QNn7gqGmuf1HomtPB8ek16E6xIjCnhGZaATooZZnf3eUIIH3ClON7Y8F2b+
         7QSmXVMODEK3WeYqOVQKw5SFuxYZhD2cNkK6uewInDHJMil0PEr/XeCJG54jGm7wjX8Q
         +KDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787573679; x=1788178479;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJ2S2NN5RmqVB8PHkfxAhd8Zl5dVEhVpefrqaDYB2O0=;
        b=kMvGzQPPBBnJFNXOlFexxzPoc5s6unwCLCymww5ZzwbRjjSIwelAVZygRvwGiW7Lih
         kA8bfnQNnjvwpOW+SpKJOLpv3RivAWCrfkAfZTw+VD++M71m/rPEJurBGtzqkY0TpZHt
         W4nTIKN9fgA+/dJATcWvRj1sTfnRqjtB/50dC+FQKiwBa9k78+o15tj0ulrQy2kihP9L
         54CwuIIi1obfwBPF64kJicCITpHbvZQ4q//PegRSHx0DXvMmk4RF02vhJpFpZAZJ07l6
         fcyLJcb3wrfcKGNtXM74pfj9iT/oqOf0OIoE+vsEN5LKMCEVjL2v1ydCGe5Dh0Hj13OZ
         jc5Q==
X-Forwarded-Encrypted: i=1; AHgh+Rru/Vr/JY1euanHJlSA0aVSxxJxameeZjMkxDdSQKd87v/BXq6tjycLXfL+nuImGdp3xF0mDSkb3Q==@vger.kernel.org
X-Gm-Message-State: AFuF++mbZkmdnBMHOzFcEpPSuUH9XiEqAkj64GQfSIV6iioFiPFJ0hxl
	pobuhjb92Rvq2pJDzrXj+L4q74m4XvvZVFXY4Wy4ELppRT8wyM8XUJwkjjYw5u4568U=
X-Gm-Gg: AR+sD13sJEK7mSs27386xFAnYexzAhOeIrFA3CrJ9ZkHhIsa291BPgVB70OyD1EkUku
	8GQPjJyGoVnRhwouqPJvzt0sZkEBOcxKMhclPn5UHIFdyHjPDe8/ecscAs+ggNZppJqG93sBfFx
	LKHAKVE+LplaSASU5TqkxRajK6Tnj8MrWgD6n27WS1Wy3rqScsAJ3qs560zw/updaPFSuZsvrs6
	2+w9cSBVL9aHAQKpLccqNdrh+lVC8we/e6dJQ3hUQ6WBIWdQJefLnzh57bnjJJxSodvVLH3NVSZ
	mHgavtc45X4GxEuJN8rClEoswnrMBupY3Lej++7UEUG+ZsQ14Jqz8Rdn/qkMjxxg3xl37ArdRjU
	843z0ZMSMO/yXp4hRvBS0emB6oJc6L59iunMTMA/uYCGQIhz2Tcx0pDeZkw44BHLZOp61c6/z+4
	Br0WuM3G+8pSFnwAOZJIB3H8JmIr1L4UlLAuMXh14LvXFyO0vODX29ewKmm1g4/kVm+o/iwP5hl
	Y3beFOfZ7c6bfEY1CKC0Cb1X5/zpd1Sbr1s7XmjdqiCukjnK8v8
X-Received: by 2002:a05:6402:2b98:b0:6a3:6d6d:2296 with SMTP id 4fb4d7f45d1cf-6a582b0cfe9mr21318328a12.5.1787573679054;
        Mon, 24 Aug 2026 05:14:39 -0700 (PDT)
Received: from localhost (p200300f65f19a904efa8a94b704adaa2.dip0.t-ipconnect.de. [2003:f6:5f19:a904:efa8:a94b:704a:daa2])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6a59e00129fsm10155492a12.1.2026.08.24.05.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 05:14:38 -0700 (PDT)
Date: Mon, 24 Aug 2026 14:14:37 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Hans de Goede <johannes.goede@oss.qualcomm.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Guenter Roeck <linux@roeck-us.net>, 
	Jyoti Bhayana <jbhayana@google.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] module: add SCMI device table alias support
Message-ID: <aowz8Tcf-ZvVf38m@monoceros>
References: <20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com>
 <20260618-scmi-modalias-v2-1-8c7547c1be21@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2dhawfj2mm2jx7wk"
Content-Disposition: inline
In-Reply-To: <20260618-scmi-modalias-v2-1-8c7547c1be21@oss.qualcomm.com>


--2dhawfj2mm2jx7wk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/2] module: add SCMI device table alias support
MIME-Version: 1.0

Hello,

On Thu, Jun 18, 2026 at 03:56:34PM +0000, Bjorn Andersson wrote:
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_deviceta=
ble.h
> index 3b0c9a251a2e..769382f2eadd 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -473,6 +473,17 @@ struct rpmsg_device_id {
>  	kernel_ulong_t driver_data;
>  };
> =20
> +/* scmi */
> +
> +#define SCMI_NAME_SIZE		32
> +#define SCMI_MODULE_PREFIX	"scmi:"
> +
> +struct scmi_device_id {
> +	__u8 protocol_id;
> +	char name[SCMI_NAME_SIZE];
> +	kernel_ulong_t driver_data;
> +};
> +

Note this won't apply since commit ad428f5811bd ("mod_devicetable.h:
Split into per subsystem headers"). Please create a header below
include/device-id for scmi similar to what was done in ad428f5811bd.
(And don't add an #include for it to mod_devicetable.h, but to the
modpost program only.)

Also please only add a driver_data member if you need it. And if you do,
consider using

	union {
		kernel_ulong_t driver_data;
		const void *driver_data_ptr;
	};

instead of a plain kernel_ulong_t driver_data member. I'm working (less
than part-time) on changing the existing device-id members accordingly.

See e.g.
https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.c=
om
for an extended rationale.

Best regards
Uwe

--2dhawfj2mm2jx7wk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqMNaoACgkQj4D7WH0S
/k4jGgf/c9brV06dZI0ixNsgSDxInOAAwxzw0Va6pEilBFWeD/1x8NZxQxIb86eu
ERFi9ET7K8J1CkEXpSDumSzKSUdfMylIEURvojgjfnQEsYGjKUB3lgyc6ZMvZJE8
KVGIQQhfXJzgdOen9ivFrmp13avoOEZecODfflOtBiCVBT9yqo9G8cB98iPlfN0n
/20yUKuCi9BVxfitySRFAt3h5YGf8mWqJYyRGszONcDeatlQ3hYxcZRc6nWohvA6
Pj79A4QISdBE4jbZiuZ4B7Tqk88TXQ1mLTCo6WZ0jaoWxESWjauNoBJPyj55WW4m
FOrbj1Kew7KV7tsLQ07HGfCNIJuI9A==
=DfdU
-----END PGP SIGNATURE-----

--2dhawfj2mm2jx7wk--
