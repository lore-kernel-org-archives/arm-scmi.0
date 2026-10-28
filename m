Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793171861;
	b=NHoSEImH4GTdVkWA9YGKEo2HSAdYmFVqTPnXWb6F+yQoYZgLYiXzCYqwn5XDxSSO6SI1
	 atcLsnfPF1yqvH+p4o4QqMqfRoPWY0fPm6ZnnKbr5IUiZs+Il1G4sGXBoOClOOrdpQPu7
	 +FXjAzp2CImOiT+Cq15M7kMN8VCJxgRw8WnbW8ocLwmE6OsQizezEBhxQ9+Ug+QX/akav
	 u+b8BJYY3uL3LAAeP892GBtxiWQDqySofZpImPNMy717DQ3YOADJnB0S4XaHpGHHEngth
	 /dZWCU9P49RW7ilM8d93TgMHImE4UjpgTXVtm9poLF+vWmmFsGpTZ2tKtBLLJx/wd/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793171861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=X3qKYmW+KpgKThN2slX/odFU810T68LPK+2Pye7ps2w=;
	b=5I/cab7DB2ytMgeVreWs0ZslxvxEmvs+3TG4OYyTf0Qk5p1ss1vfQMyfwNXrWp4kMWkJ
	 ZBLiu5PlE1gztTKzvtlf0ZKKMnkNslswsLn151lGW6qTVRt0m7Ka0DwlUH/Rz/Dx2aYe1
	 /Ou8VvHWfnEnA4hadZslIYkZG1f51ud8sjmi4qhepysgBr4efIbzDPPCRAIE0BADEMKfh
	 uhBJDnK46H8dQxvm5m2uksAwX+5EGw9UifDlCqobI71EoRIOHs08kekofx9xZwkZOBmFV
	 Vj6/5ygl9MJN64hIaviEGioL/ZMkq7JqdCBVIRPqSYJmKkSRx2Pfyzgt3bG6zvNlKSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mXYTeY1D;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0E7606A321
	for <arm-scmi@vger.kernel.org>; Wed, 28 Oct 2026 07:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA0E7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mXYTeY1D
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49d05d51553so3878875e9.2
        for <arm-scmi@vger.kernel.org>; Wed, 28 Oct 2026 00:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793171859; x=1793776659; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X3qKYmW+KpgKThN2slX/odFU810T68LPK+2Pye7ps2w=;
        b=mXYTeY1DFU0B3UNUDpGvH1++9XqRCHBN2c55fDs3gaMOQO47WsY0IeKIoXEOK7phre
         qDRnMs8ytOMr0qtfMOSb8TiEdkTuTi3zrvIo29YjRcHCIyNVRu5jvmrnw+c/7+ZTnZdu
         g+m+dlrewe4oGQ7cM44EPt9kdHQxTNGMX2vBj7nmA41j8BZlObfZrV/xzfLKEfzFF9JV
         zX00cy7U2P/7MMHvf57mTP9FPWSpdqrAGPOP7VFbEtS+I5HsiFc5gBOTKp40co7SyViU
         LmvhwSbNkcVsBfy3XytO1tE7SOLtX0a18awiJgg9Nhufe0Sw0QKxI65RIMv39zTiKOBc
         rFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793171859; x=1793776659;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X3qKYmW+KpgKThN2slX/odFU810T68LPK+2Pye7ps2w=;
        b=ye2dUN1H6k/kp3wvaShIv6Urpq/p7zrxyaPZmTcePCdI+iDDGJk98HYDeTvvY67sSf
         lG6rt37A+JNB1dtc26AkFhfabrpOXkAayoFN5fe/s29STjbmTsyIAcQcxn+Zuw8DEYhB
         +5eGf9vE+A2ulWoEHhQ0/+pc7ZlVy5jin7JdBvzEu33+EWmy7daCIfxKCFBo05yF2Id9
         OLhqqDPdGHSBp1QH0FKhpV4b0lq/joxyvHdPeXTsmlCUku91gPHHM8ujOxLivCiFPLMb
         9CQ4rVtWYJkmhXtrV0VYeK8LGMqtOxqDr9cNEXxTrQbVMTFGxIVi9hv+FrejWP2VCKgK
         LDSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTX/ktlQVf22sj8oc9GiaYqQjXcMa4nlM+0kv/92D92/fmTiqUVGRO33njzgGZuomPh5zLBXQcmw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJrRgzVGYzlGSaorSaq070qf9LNjYSRaFmYbhUWM6GtQfUpVOTZ
	eqIkGdmsAhqB4urdLg3yHCIYB8LDYBAIqbnoNpV8LiI85zLAUTNUrvt/G3afgu5DgSo=
X-Gm-Gg: AYBFou3EnuhKCJ+ECwoyzmI4xLO61OrKvBiRN57cgjE7Nm0pJwlLBEdZzPxHHqlBPm4
	qDo8ZVPwm4sYcs2DlEHP/wrbHoDj5cFcomrPoo2+313cKMRGIU9waiFWyvhQL8gL/EuQot+yvHm
	/qlwOoi3h+N/JrmDkJvRfYhDygHDRglyla2v8mBX8E4BmglLdHeSu550zONuqb5FMy60T/MtZ9z
	9ahA8uBXnDt2CyhFgUC/OOXZY9kKHws6HoEoNh73LCcRkgH0HmgMkpGeJ8EbjX9p6Gn7v7tqa5z
	VWIhKR+UCg3TdsMkRUDCR4shzwhfpESxaY/aHOiPvyEyAQs7KRjnuSkA164ITqfcBkQjN5oxpBn
	TGPgazKXo/1l5pgSl26kVnuPBWX2FWObw6172P4P0WAMTx7VwHqbsY7KHbeI/XiS9yphVxWQTDV
	GnrfdrXFBgR2ZwsdxWUf/u3zSJ2qhbj+Z38Alro/oJzKzu8ZW1pBiKi9YK20rAyeR6ju2/YprHh
	ppKsdMLb4/dJyzJrEf/OFmCrBLvzdzlMio4S1yzcDgNQRw/U/a7nXN00FkCR3XS9dIQGb3Xsoe+
	f4CJdSvzJdwnHXSLlotyUCvsBxbpln/LfrLOryrPUGf21xOaBKKXIQ77p0gcn20jXM5cJepKG/T
	ymeDbmoos9UUKgGY=
X-Received: by 2002:a05:600c:198e:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4a967ba8856mr25106675e9.33.1793171859280;
        Wed, 28 Oct 2026 00:17:39 -0700 (PDT)
Received: from localhost (p200300f65f19a904c16506b94501b867.dip0.t-ipconnect.de. [2003:f6:5f19:a904:c165:6b9:4501:b867])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a97bf5d7cdsm20719315e9.3.2026.10.28.00.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:17:38 -0700 (PDT)
Date: Wed, 28 Oct 2026 08:17:37 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: gaohan@iscas.ac.cn
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, 
	Inochi Amaoto <inochiama@gmail.com>, Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <me@ziyao.cc>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-clk@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 07/18] pinctrl: zhihe: add A210 support
Message-ID: <auGhPHjanNTkkzG-@monoceros>
References: <20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn>
 <20261027-a210-scmi-v1-7-74d58ce85bd8@iscas.ac.cn>
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bf4vux6swhzzilrx"
Content-Disposition: inline
In-Reply-To: <20261027-a210-scmi-v1-7-74d58ce85bd8@iscas.ac.cn>


--bf4vux6swhzzilrx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH RFC 07/18] pinctrl: zhihe: add A210 support
MIME-Version: 1.0

Hello,

On Tue, Oct 27, 2026 at 11:36:58PM +0800, Han Gao via B4 Relay wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h>
already provides of_device_id without introducing a lot of unneeded
build dependencies.

Best regards
Uwe

--bf4vux6swhzzilrx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrhoY0ACgkQj4D7WH0S
/k4lEQf/aQompiZrE8lzHamk+WXWr2kv9iqPDmKByLu358ny9EKvV3eNOG0y3m2B
hMQ9inmxBjyfz0TMb3NkQtmXVKnu41A8A6mcl3B97akrhcvKxPDgsn8FWhhNJiBs
s0jrcYuMILEssk5h7k5Ah8fEdVAXbDTp88j/afUmb9QfOZxjaW+SXfLYigacUFT0
U8Hy6rX3B+GESX5uvdxOY69bn4dHt7Qwr56FksGQtIi7Y9DbyRhhMRnwCy4pCLnw
ZD9t3GwAHwOm1fdsdqP0zLsJPukoZPNmbT58FjRf45TfYHmOSulG5O3oszd4ElAw
wrbitVSdlgy1G4VvYAZKJRQLV5gF2Q==
=JnXH
-----END PGP SIGNATURE-----

--bf4vux6swhzzilrx--
