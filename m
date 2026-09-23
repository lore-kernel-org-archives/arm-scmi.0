Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E57249D5A3
	for <arm-scmi@vger.kernel.org>; Wed, 23 Sep 2026 12:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168132; cv=none; b=gGMBN5Flc6eaXEa/Wm+h5mXzXkKLXYGKKqSjg3Z06owppkIdF+lyA0aRjDPa7jB2mPZ2vj8UVOfznZeu9HreGZ3zCPB32+VP4/6QzTpIzDWJeT1UFpEP/UAHi3GfVz0AtZoB9o1OIA7hoNg+p9y7v1Ovi4tMM+hQwGu3e2TVK5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168132; c=relaxed/simple;
	bh=Lwt36zS62yRZ6vCK1BD8pkNCQA1zr2fjHFHmb2IlsjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SjSxpVS49tB5/rgSFcce5zc8jaHRs1yF257W8H5RilnA6ML9ikVwZl+PNQIYLlRDfxw+4zejhm0VF3GqUV2g8ZAOpdosr0gXOeMDtfPqVVjDwuD9T+gYAQtvvDebJZpDTgaVhQMd7gRpnPYcCxoC33A8TeI7Y5MvEw+KcRrypTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=h7zZjekR; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="h7zZjekR"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso6059845e9.2
        for <arm-scmi@vger.kernel.org>; Wed, 23 Sep 2026 05:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790168129; x=1790772929; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lwt36zS62yRZ6vCK1BD8pkNCQA1zr2fjHFHmb2IlsjU=;
        b=h7zZjekRjKB/fNX58WS4XfFDDb6hb1VDFk44Tlxf8gihKEmKcpux0r7+lhnUwvpLUf
         TwAr7yvPhCYFZc0pczYfGfi1ZXJ0nhI39D7RG1XsUjSDZauVO96D/YfRvEEaD7qQkmCg
         harhPAUGHcVPJZbmHeOjgN/D4Q/PBqiQ51UlfKPQochFUsDz77Sb2MRzYmuTint//9UM
         pIXb4sBog3tjkkwdLcRKpsC5bAu0DKAKzkRMnMkogTdBAhRaZaVkXxh6bfZWba1oQhXo
         KmapCqmvmrepxiXF44Kpuk8+wV+xvlh+Nms/vGeOgbNRqpgr+Ape2IxAW98JoggMeg13
         xQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168129; x=1790772929;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lwt36zS62yRZ6vCK1BD8pkNCQA1zr2fjHFHmb2IlsjU=;
        b=U2Cn2aKDx62jLcq6ZnFv5EQR4TDeMHn6yZVU2GLZGm55L7qk+Mh+bnaCDCYDgi08Xd
         JvpNBLyI85swBMtjJC5QkcuPTBszfmGGUsQMmN6R8aZmLc9hzardr15HxRlkfq/jD3Pw
         i6f0fOrgypCE39HzwftaOEnY3Y89Q3Jtex6TUvSTY5bnJn1JrT8ySntHaMsP6A4Y0ASo
         a9p6429ZkvFPD3tFnuFSONqCtSBocUpgP+ZQTku+3OMTtVh2YpF1PgarmqZODifbCDI1
         SrCfqxfWHYCqSU8ZPd7+6CTIPAO+xAxhUBSCPtzbaiLQdtZ8ALWLfG06Sxi8s4eU6UzY
         I9wg==
X-Forwarded-Encrypted: i=1; AKwUvBy/RsLapFTcwSmHpkJAvKmF3hUCCZkNm08XUPcYHeC8k7fXYOGio5ukrqoHPPw5yQVR97ohZphPYw==@vger.kernel.org
X-Gm-Message-State: AFuF++mU4aJjVK2VfG2z5WMY69SL8e8gMizWGHZ7Q8j8hEgAOzCXKXsk
	MLp0kL4tWPpdO0uXJbn44uXNd+N8emZ99lbSSIm+0QDFUaHenCAiCPfuIEEoScYDQ38=
X-Gm-Gg: AYBFou0ibkRR8hYR6j/IppAvOyD9+GHqF7MviEd9eG1Upz/G9asHBfWZSoqQiGXxGdV
	ZuRiSSmOHTDlE+3HFrcsTvKD/KV2XUt2eIK4gHzvg88asSQPUxn3mFX5hRBypk5SlC9EyocVVG6
	M/Ln9PGFK0psp2fLnKGKN1ktd5febSycqb8v4voqGy5XpTu7wTvnGcRemrqBrwoJxLHEqu+4KhN
	scC0238I8P1zdgP1L2WOi0XWWVrVZUxVT7jwouxEQOXeVrWme/zDe9OoCLrp+UaIpKzLqFEbsf8
	ce7J6hNl3KJv/Hq3uegAlH01jgs7ntEkOKyLSyI4/moTgm9WZQ3fk1+qHnDgUYClcbxWN6SCvY3
	lEhTcrwGUWUAdBmJRkvdCLw6CgeBMnJMojp8T/VCk++qdzLxVqXkJDlN1IzmP5rUDT1jkXK0fEH
	dhJLOyHEpO6JrSr6pSw9Z0ATdTzJby67TxZUPdSGEV67jVOsZCKv2i+IRXGhJVorC8OCuGQcZok
	OP+dl6sxspqPwd7JDoBAwwUGA4BCKZ3HE411MiQCUYHmEsQnwzQqsfFrzPv
X-Received: by 2002:a05:600c:4505:b0:49e:6249:268b with SMTP id 5b1f17b1804b1-49fdf1578a7mr31453415e9.32.1790168128729;
        Wed, 23 Sep 2026 05:55:28 -0700 (PDT)
Received: from localhost (p200300f65f19a9046bef90cd97470407.dip0.t-ipconnect.de. [2003:f6:5f19:a904:6bef:90cd:9747:407])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49fde1c159esm84444015e9.4.2026.09.23.05.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:55:27 -0700 (PDT)
Date: Wed, 23 Sep 2026 14:55:26 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Frank.Li@kernel.org, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
Message-ID: <arPMAXs4jjUeu1DE@monoceros>
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <arFKVhlgJge5EZyj@monoceros>
 <20260923-sceptical-mauve-firefly-f5456d@sudeepholla>
 <6b5a8300-ebf9-4717-bd39-952e89fc5e78@oss.qualcomm.com>
 <20260923-snake-of-magic-satiation-c3b857@sudeepholla>
 <a5e56180-b96f-4fac-980e-e837e84cd5a5@oss.qualcomm.com>
 <20260923-calculating-positive-inchworm-28d3cc@sudeepholla>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p23qdzzba3kphtno"
Content-Disposition: inline
In-Reply-To: <20260923-calculating-positive-inchworm-28d3cc@sudeepholla>


--p23qdzzba3kphtno
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
MIME-Version: 1.0

On Wed, Sep 23, 2026 at 01:01:44PM +0100, Sudeep Holla wrote:
> If Uwe is fine, yes I can take v7 as is.

Fine for me.

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

The nice thing is that the device_id structs are not API, so this can
also be addressed later if someone comes up with a clever idea how to
implement it.

Best regards
Uwe

--p23qdzzba3kphtno
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqzzDsACgkQj4D7WH0S
/k6svggAp6Jdfc+Xv2nUfAqFVfbCWZPZ88qKW1qMOteW0gWpuiaNHYYP2davG6FM
Wm9f4BcMIVB5SEWCvqqMT+zvwMxy8614yA4/sd756UX1mJZDA/nvw8+ZkMPnkXNa
IBp2GTVwH1XF7O91KL9nZCsC52taJ7wE2yrBojLRNEB/+KIw164n7lbXO3XrBIoE
h0QLxyatblxOchoALTVDIFb9u664jBtlTFzDKepLyyGaeHbSBk+RJ8Uz/v8ls3Kd
3fFPADN4IEJAnHIDOCExNdpreKhCW/1aRhZf5YZJX300ZH3x59s8UKvsg2iYEzm6
BGRNNyDjN4kR+bqzxKfXqWs9TXUpFg==
=Uvoh
-----END PGP SIGNATURE-----

--p23qdzzba3kphtno--
