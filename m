Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A1022A817
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 12:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787574155; cv=none; b=GPKHkWmP1JIaFn+QvRkTQcJclSd7sylhNE9HkGkN3N6HK40BxukQv6UQMln8nWIJC5vhaIg46Ww3YmRlvfh+a67aJptdOxm1Ogxjlrw3HwmlRm2nX3swnb1cngEr4i8ekdyyh+W9NU2ewhAxHGnOKpdIUCAM7lGZ7s25eBCUXR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787574155; c=relaxed/simple;
	bh=t62Zykvs+8NdpMy0PpJs95Iv6bI1meByLMw4pOoPMnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PrteMookAjQye8kO/RT/cYDZPmt+Rz9hB97kYSv2J14BVBY5iJvDhXh8kyVotoTR1I8zlLPyEMhYAiVvyodwiHkx5ILsAjIMw9W8t1mHGU+c2IywAw5SCovEK/Q9fopmF6w+NKtCgmzZLj18BkGhu3N/2zVdbK5Z97n+kTnbx6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=pQFt21Ik; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="pQFt21Ik"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c15d111ca99so403392666b.0
        for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 05:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787574151; x=1788178951; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MHbWNJk5cOn3r4GzbI0kltGoUU2l7AC2RyCAmVHKUJU=;
        b=pQFt21IkwjmiiRhJbVs9vq5sUPKqNA/BiBzX2+4R8CA5wNXT5sFAXkGqI30NCwHa0Q
         IU7yZd09xRt4vG9OjoNqeimz8I1ZTi3c7ZmE+m0ssjKiAgWzUX1HjtxhfEREDRMXM3B4
         dCehuya0jS5YZgk+kgPbMHbp+Fm86obxRW1ww8YdtAYxNdSURRrUdHlMMRkFGNvEktAB
         Tptvb6uR6imm0sNWpu52XYIZaozPAgTijXUZrq92GqmFBpmZEB1a6qLg7Y+JA+j8/u5s
         qzoBtwmKbGWsFFaH3jl0tNWJK/aCUDORjew3pLnZPEWDWqTL3Jf1Gu6+umBE2MVV8eHr
         /18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787574151; x=1788178951;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MHbWNJk5cOn3r4GzbI0kltGoUU2l7AC2RyCAmVHKUJU=;
        b=ixqJ2d1TRSsT/VvURnUEwZQX/+7wHBTj01GAPUHpeNZz+0nDtH6zNB7fRwxSPoYVR3
         1A2dWR15Ar1F9pCzxh6Iv0V3JAY9WqCurNjHIz73nVw0QBfW6u0Ebq/ntG0n1Fe5Nv+f
         McvtJKP0NVz9qSY27003NMt3s7zfW4T7zbX7dj1cYHvDkq4Fu3K/gvTwxnlcwmQoJUuk
         4roU6jM33V1x5jK44WSGMpKLpsVEhWZrQAFF1jxZBoDnVKTR8vIig33GTuNFhLxOMbx4
         qllgFDwpbvXE56DLPykF7zxmiUA0b01/JXXWNfIeqg3zXrDYfctSNGI9pdir47+JXsW8
         SJIA==
X-Forwarded-Encrypted: i=1; AHgh+Rqe8b6Fo5qvpn4uCMeekjNIR1AhWtol2iIbPGCC+1fVTKyVN28a3xRpSrKWI+wcdBuOEY69NHROmQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kK3SCkZc+DVtnGSr+wY6ERqXNLTUq64f9P6r19Mn23k00LkrxE
	3SVhdb3D6FW5je82gt0rEfnqZ2YdPdzG8+lBTm4vLfSYKAJx28ZIFvuT5/unWx28AcI=
X-Gm-Gg: AR+sD139B3O5Lpgqett2H71hPfkKCJuSpu2AuZQd8Sf65yjvb/e3eR/R974KKMVcPCO
	BcK8OOdASYnY5e1i1Z9lzBKB07skwbayKn5ZUe28ZMrec2dgrihVFO/Vs3YZqHmrERT6QjZTq3R
	PWjTU854kAVN9fIcZMlBVxN2p7ALEHarpzWe++/QTz1FWU7Z614xQimccXSIZtL5ar8V8nUeWnC
	ocDWRenGoEmfePkDEgek5j14BNV5PPISCERxZkNng7NbkCPnW2nMg19zppds3TwVTiu4WgYUpfn
	XBcvvyZ/FrKCL3aMZvkITVAmSdL+KzALeju55D6xdmtS0tGQhRf6sHcjHvc83g8monNOjubpmuy
	FHKas/7i/YBpfpWIv7kV6kJuNR4rK9afDxi4R/ULOuKgRN6q3U8fBC7taQSJzpKsOMef00sbdGh
	PiSR7YCvXTBIJ15aDSJrolgu3upOR5OvAh/A6UzB31UXmrh6AUglMkO2vMAqbLc7UWnKAeukUwZ
	czpF3dQJyfX6jBpzWe7MLav3rNL03I45Omcy3dupVgmp4hi3lLQ
X-Received: by 2002:a17:907:845:b0:c20:fed2:898b with SMTP id a640c23a62f3a-c2492782dbemr1724856766b.23.1787574151309;
        Mon, 24 Aug 2026 05:22:31 -0700 (PDT)
Received: from localhost (p200300f65f19a904efa8a94b704adaa2.dip0.t-ipconnect.de. [2003:f6:5f19:a904:efa8:a94b:704a:daa2])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-c24962a3c13sm1308598466b.26.2026.08.24.05.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 05:22:30 -0700 (PDT)
Date: Mon, 24 Aug 2026 14:22:29 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] module: add SCMI device table alias support
Message-ID: <aow2GFAfy84k-N2B@monoceros>
References: <20260820194850.459739-1-johannes.goede@oss.qualcomm.com>
 <20260820194850.459739-2-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2tfcczky2nyuuvxm"
Content-Disposition: inline
In-Reply-To: <20260820194850.459739-2-johannes.goede@oss.qualcomm.com>


--2tfcczky2nyuuvxm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 1/3] module: add SCMI device table alias support
MIME-Version: 1.0

Hello,

I just replied to v2 and only then found out there is a v3 already.
There is something wrong with my mail filtering, sorry.

I'm forwarding my review comments to here (the part that still applies).

On Thu, Aug 20, 2026 at 09:48:48PM +0200, Hans de Goede wrote:
> diff --git a/include/linux/device-id/scmi.h b/include/linux/device-id/scmi.h
> new file mode 100644
> index 000000000000..4150481524d4
> --- /dev/null
> +++ b/include/linux/device-id/scmi.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef LINUX_DEVICE_ID_SCMI_H
> +#define LINUX_DEVICE_ID_SCMI_H
> +
> +#ifdef __KERNEL__
> +#include <linux/types.h>
> +typedef unsigned long kernel_ulong_t;
> +#endif
> +
> +#define SCMI_NAME_SIZE		32
> +#define SCMI_MODULE_PREFIX	"scmi:"
> +
> +struct scmi_device_id {
> +	__u8 protocol_id;
> +	char name[SCMI_NAME_SIZE];
> +	kernel_ulong_t driver_data;

Please use

	union {
		kernel_ulong_t driver_data;
		const void *driver_data_ptr;
	};

here instead of the plain driver_data member (or don't add driver_data
at all if not needed). This yields better type-safety, see e.g.
https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com
for an extended explanation.

> +};
> +
> +#endif /* ifndef LINUX_DEVICE_ID_SCMI_H */
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> index a397213bedac..d241421c36aa 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -49,6 +49,7 @@
>  #include "device-id/pnp.h"
>  #include "device-id/rio.h"
>  #include "device-id/rpmsg.h"
> +#include "device-id/scmi.h"

Please don't add new includes to mod_devicetable.h. That header is ugly
and each include makes it worse. Just add <linux/device-id/scmi.h> to
the modpost source.

>  #include "device-id/sdio.h"
>  #include "device-id/sdw.h"
>  #include "device-id/serio.h"

Thanks
Uwe

--2tfcczky2nyuuvxm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqMN4MACgkQj4D7WH0S
/k4yMwf+N+KJ5sPPSlOgLDa7K8R0+3z3wNZSXpKG1mfo73lwlNuUQ0o9mdIVnCSh
HjOljqygnPT1KDnD0tyk4aBt8VyDQ7dC93v2tUbPE2EFoHWT9BR9lAcDJY3TqVqz
tjL9DZtz1eAcw4OY5tm7FW6fBRLJTlGAgyzkcgBHxrB/6dIPZ2BaHa+eoJFUN6xU
dBhVHRKQFKBn79sVAVD5tTw46v3SHrs1nbvdIsEtAeVZ+RE+fI+LWfjIknQiSaZ3
4Nlmi2JnGiX9tgfeDp4HEArbnCzrtXLfmr4z8sEMjKzmk6yTKI5AxNXgwRVyD7Eu
UpZzkHPe9Uo1jawnTLk7PSsbMrZ2/g==
=yxWM
-----END PGP SIGNATURE-----

--2tfcczky2nyuuvxm--
