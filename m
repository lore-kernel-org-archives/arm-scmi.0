Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A5B70830
	for <arm-scmi@vger.kernel.org>; Thu, 20 Aug 2026 05:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787202627; cv=none; b=kh0lFZmAnMChTjaQ8RSBuDS8GuM6wgf0upJESreWRs6Unh8OwtBiQeddAi7UOYSLdxnmylISRvhD+ZieMoLCjKw+eLP+Dg3NTmFZNU2/MrDEgKkN9iIieOQCScZ5h2hVAlDbWZ9xY8/cIYiv6XlWGNlSaWpMoygPuFmONjWuVa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787202627; c=relaxed/simple;
	bh=Y6LD7rCa/Fp6CP9+jmeqeUp1auE+4ZYcET61cTZi1mk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sAXEQawbyKhpB4R++RG4qS6ULQmDWxxPJVWRJwmqzuzHhVpaigN7OEvC18TUIcW8ZmXL5L1MR63z38tLGgbcJ0eqz1C1dY+bqtkngRczvWNon2/+NSsgPKZ03hmtOl3hrDkXvKJs3L9hhbLhziuUVG4HuSZ3oNGpt5CgaYyIuIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=VNl/+21E; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="VNl/+21E"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso998541f8f.0
        for <arm-scmi@vger.kernel.org>; Wed, 19 Aug 2026 22:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787202623; x=1787807423; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y6LD7rCa/Fp6CP9+jmeqeUp1auE+4ZYcET61cTZi1mk=;
        b=VNl/+21El5LOzOu8yM3f8xyu7JTMXM/PSdZUZpvsCj4GYsqgq5/xjKQGcoD0ZOPC0M
         4qxzNm6APKJuAIvemDDbG94NxdW4Cqjedu3GNOVhe8gP4VsDINHsZ7duYmzjfiTWsxpr
         d5HDJBW8rf1gV3mypGs6wN+7lhE707Oe7Yt9kJgfcNlgxAARckw7KUnDSlKG4UG5TW1+
         mzzcoj3PfGmlC9tN7OPtVIwAhx+F1p7bWF74DYKDRK/QaVFDW8lKU8vCJdqb1dk/HQc2
         F5iuR2OSwo6u0AJMrSDl9p8SUn6ZDYg5bzqzknpKzJckk2YgtkC1HFr70Q995Rzd/AuX
         +qEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787202623; x=1787807423;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y6LD7rCa/Fp6CP9+jmeqeUp1auE+4ZYcET61cTZi1mk=;
        b=OH4294NEzjl8P1BEG5DTDERWsU5l9Oz4pj5MoCbjxv3OCwkNqIP5ER3YzOoDSgzLt5
         he6ahuk6zMTqxabcx3TkdzzSLY9ZdLUPcqMqay0oVu9KaStlZQ1NdcOvTi1Uy30S4pfV
         7shCmNYwnUGMkRIn8JJbG4R5R1L57V3g4Au4YNKnNOQwzumFitg0wB6Xv3e4IMAPgTgO
         U0q8JGJ5LKjdRkzm2tSC/3tfAKk8vEcQe8BHgVOl0Fam3EDp8KmjM0BukmPCa9ClwrdJ
         Hwqz5ouom6547rmlBsDd4RtnrqLjrPFhw6YBO0JyZfWUVEkBVpR05KZwZWVID3evcpCV
         L2hw==
X-Forwarded-Encrypted: i=1; AHgh+RqRw4aqj3RaZS1td1XPswh/exhFYhK1w2JRPBksAtrWGGMyydV2HVO3vG9uG/QkbhaJkxUbYUs+HQ==@vger.kernel.org
X-Gm-Message-State: AFuF++k9gscsYq4ZAaGEdvQHuE7xP1v6mBelWrUxJMT6qE+cXqmnobCk
	gDFN2ZDCRwdKhMO0TvPOH69sh83KX8c1zJGe1osfA3f5QwytQQVg5+JZ49MjVizZiTfe7TO3+62
	w9AY5up0=
X-Gm-Gg: AR+sD13SKdAy8tKkqlEisD9+4PMEVgjNpjp34Ig6peh4Sr66xAXjXXk3zvitdZ5kCk9
	9I5NsPslZ+rgkeZL71zylloGR9EjpYZCoqCo7/mlYqy4wGu1O7cUZ/T7uT1fFqVLZWgh+82qsks
	PVzI1ktIz5tsSRCIxUR1LpgUHt+B0qi7btKwpunQwWkH0epC4NfOHnKs40zll6LEeU6bfOdUXOx
	fjHabiFrBe35v9BZXu3aH3JRkhv+IBeTe3lrzaLXRPdZ7KqWepIR48+VaeDoRzqohk1GW5PHiuT
	KQTJO9PmkJk/a22rlR8PnxLS7MpkboiH03JLjp9DYPlGlly3W+/U3ZaSFhKxmeqVSXvgnsW7dQO
	DdHpT3m6GozAkRki7jhaN7Q9rZZCksFdjVcB6ryy2rHK3vHbecMkGSwN52W8xUz945QknYieqqM
	+cRF/suUsB5TTNIvCfyBhzJlcpwgtSk4bYLPiqfDgeA/JvxiWS6tJsGRtcVR07Fzj5zA==
X-Received: by 2002:a05:6000:4a06:b0:47f:e886:6dff with SMTP id ffacd0b85a97d-482b1e8441dmr19088264f8f.4.1787202622544;
        Wed, 19 Aug 2026 22:10:22 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-482b14415ecsm9857566f8f.7.2026.08.19.22.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 22:10:21 -0700 (PDT)
Date: Thu, 20 Aug 2026 07:10:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Li Jun <lijun01@kylinos.cn>
Cc: sudeep.holla@kernel.org, cristian.marussi@arm.com, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] firmware: arm_scmi: pm: use DEFINE_SIMPLE_DEV_PM_OPS
 for pm struct
Message-ID: <aoaLBNkkSynoGH5M@monoceros>
References: <20260820021718.2454014-1-lijun01@kylinos.cn>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="64mgobiinqdcer6v"
Content-Disposition: inline
In-Reply-To: <20260820021718.2454014-1-lijun01@kylinos.cn>


--64mgobiinqdcer6v
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] firmware: arm_scmi: pm: use DEFINE_SIMPLE_DEV_PM_OPS
 for pm struct
MIME-Version: 1.0

On Thu, Aug 20, 2026 at 10:17:18AM +0800, Li Jun wrote:
> use DEFINE_SIMPLE_DEV_PM_OPS for scmi_dev_pm_ops,and add the value of
> .freeze .thaw .poweroff .restore.if these address are null, may cause
> error in s4.
>=20
> Change:
> -Replace SIMPLE_DEV_PM_OPS() in v1 with DEFINE_SIMPLE_DEV_PM_OPS() for pm.
>=20
> Signed-off-by: Li Jun <lijun01@kylinos.cn>

The things I wrote at
https://lore.kernel.org/all/aoaFlNcXC8zfS0j5@monoceros/ mostly apply
here, too.

TL;DR: Wrong placement of inter-revision changelog, missing
pm_sleep_ptr(), and maybe most prominently the request for patience to
start with a single patch and learn from the feedback for later patches.

Best regards
Uwe

--64mgobiinqdcer6v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqGjDoACgkQj4D7WH0S
/k72yAf/Xemjdc635zCuZFUG//Sy+vXuZ9veArfR+8cm4wu1BmIGSXXCH80VU63b
X/hJh3utR5VCmn7t5qP2jbKooon7mfghtKW1EyNvByfsbWhxZ2g+fPBKRfef8aCG
BCscpFWVfEgjG8cEKBSJCY2+ufqAztavvGOfKWE7sNFomTP2cxySPUKm+eZ2Aoz+
TeR0+45yRxzKk5747ALvDo6N4XWeKpJPxNRE5/c8mI0ADF+5S5bqkQxOC5coAgok
rLhBbkLGQ8ci2KCsrYv38BSn1yuIQg1W8M3k+G28pHb4OLrhU1pZ9TZ8EyDtiHjJ
f3ltyL2zRkpIm7nqqOEYlD7501KxwQ==
=rYU0
-----END PGP SIGNATURE-----

--64mgobiinqdcer6v--
