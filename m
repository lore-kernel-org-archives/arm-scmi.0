Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794926120;
	b=gBrLZCkYL9hbVPWY1q8NcvEO/dwtuV5p2rKBqjEf5mAMVWcLaUOrwGTeJcQGhQb7cipI
	 oI68zg5MvYuxfOPVSPG4Lk+4ih5AlQ8AuL6/eWuOe5vInzSsp/9eD0oqMdH0ucDaNRqRf
	 Smy3Z853GXAAc1ebf/4TcL8yo2fAfLGDh+wEEv3OO4n1wTQwp58L8V9pCDvaI1g0cBbyM
	 5Ea2HWF0Z9Yz5UrzA+Aqy/e5udJ2LBXy7aog7W0cX3Ts67KrL0GeHczwoQeJmu3xwt9ps
	 ozzOJees5Jw+J9bzVJ13ctrWsyWVVcWB7AAC4exr+010nQXCWsKOWHPXrqt0ioXYrEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926120;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=p7ojMjj4LC4SS1WElXDJT7WyRei5tH4ru8glaxJTYq4=;
	b=tuDI43q7W0NxtMA6vcVsosE3kHy0+G9bJgh9K9FQaEJY7BCTpm7lXqJG9mWhzgh7avrT
	 afZvrA0vjxx/M8tpHQZHddkYy7pyknwpunp/s4cjbqy001blzAXqHOy9l/CePFage/31l
	 pN+n92UGnCoc7zKkcxYIvpz4LQdQKHIZE3v9nTCPe593HY4DGosjam7FS/wXxbYLd1UZm
	 0fkpQ4ml+CNhCwToB0wbumtDD2x/WFVi2U7mxq2q8UDmUO6qVgVj0Sqc/SNgvQnuIPpFg
	 irYqSIISMJvzT9x0dLVp+VnrwLz7HdPWNmgvg9J9sC/55W659hn5jaXGfXdk24fYvgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3383606AF43
	for <arm-scmi@vger.kernel.org>; Tue, 17 Nov 2026 14:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3383606AF43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9908c849564so1082322241.3
        for <arm-scmi@vger.kernel.org>; Tue, 17 Nov 2026 06:35:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794926119; x=1795530919;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p7ojMjj4LC4SS1WElXDJT7WyRei5tH4ru8glaxJTYq4=;
        b=c5TauMFJGFdAS4AuZbtY/CoHgV3QBBwfw7qxrNCGQ/ZU22rK6RytB+1VgQwsxXOIHQ
         3f5nQPZhto7iBgIPlOT+i0xE2c5scVDvLfOqT9RWGhJSra7QKpwuKjWEJ/KsASyq8PP2
         iC77lShSV2owHIDq5gpQ7PCbOhhYJHn4yUF8tqi5bh1AkEsQh/U9e1WMW4Gk46BeUDCd
         kFELXLjJr0U8xPWDjRL+iMGssfhhIucFDvM+M48MCDT6P56vhoukf9+fsHuyYXVXw5nr
         6v19UUbAAUPsMa078Gm5IINdONk+cLz4j9RGxVZ8eIAQleshTsOMCcqHB/zCpmflanwX
         OUnA==
X-Forwarded-Encrypted: i=1; AL+hErFkzQAZkqhgPlkSnuf4Wn+NyA+Jgawhh1a56uy69K4dyJR0vkk/JdbF08HV1uh3EEn4A3xgprwxEQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8kqb0scwfRVFsiduYA5PIfBdoF6PCHRKprA5Cd05HuoLBhgWFU
	R81KBI8HNox69lmAHDpgpqr/EH7flgU/WFtef7XXtfBu2JK9kvWAIltCj2MdGOBd
X-Gm-Gg: AYBFou1F9QOIFq3QWdeC/vbHZITTCe5UBUlYlFhzbInXZjdG1TGQE7ru2/Y8k8ks4we
	BE3itsiG+gIUWYW7w4vTTpyIoWTDegFqwFvecr1UH02fSkIc8B2y1tCOjtuKUnw+5zsFtMOQdYE
	dJnqSyzsnktBSB/YqwZ9MeAs3ipZCnuXGS1GqT9RJHZsCGOYrCc6p+4dFIhbRMlNWCQ9sBS50kR
	0Nv9GrTF6O7+rSzykFNNHH9WflYD/3FGj8I3UHFUU+AxAmHu5Z3U4pxawq/xa5haEPPFJEbs+oM
	FdnZwIX279m2GHHtdAcv0BJ4mAFp8cYhEDtncbhUSwY69+01xELPMlwwGTPh+fjnSLjmnBUuXnH
	iEj97Y7saIx7UkFq2QLiOXkv/PB/h+gJ03B61nF3xOjjpkE/eW8Icqda0mE1OXt1tM0kDmuydEP
	RhBxCOp1HsG7PERpT9x6rRFTjNeOpaew0woMqhhMlK7NXehgPSSdpyvl4M3ZPjvPutKFjSFyAQH
	CpjSsZxt//SmXtOe96MRezPHQLK9ariGQ9D/IX51b4q/Ntbo6sCEriWstLiAz/PhFhFEF1IBXgC
	hUc97jyLRbNTLslhzak/MBN+oYboKIXcJwhW3CIYtFV4EA5B12qsZaJ/CCIP8kIHW2qKf5UtxeZ
	p7VAeNOjoZMqC
X-Received: by 2002:a05:6122:e44a:b0:5ea:e196:272b with SMTP id 71dfb90a1353d-5ee34ad0625mr4572046e0c.19.1794926118785;
        Tue, 17 Nov 2026 06:35:18 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee34e5e51fsm9149529e0c.9.2026.11.17.06.35.16
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 06:35:17 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7d2ee9e7093so1233661137.1
        for <arm-scmi@vger.kernel.org>; Tue, 17 Nov 2026 06:35:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGTXusjLxwg2ubp/K517/s+sZkvjbYRBndHQCRFySmFiCeMrfoux0AUvYVQQGtiGh0uuTigqwIbFw==@vger.kernel.org
X-Received: by 2002:a67:e118:0:b0:7c1:bc57:c7f5 with SMTP id
 ada2fe7eead31-7d64d69de8amr3553023137.12.1794926116643; Tue, 17 Nov 2026
 06:35:16 -0800 (PST)
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
 <20261113-clegoffic-pinctrl-scmi-gpio-v2-1-faccb4685d88@baylibre.com>
In-Reply-To: <20261113-clegoffic-pinctrl-scmi-gpio-v2-1-faccb4685d88@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Nov 2026 15:35:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWwp4RtKnBpFNJPHdigzrQ-wf3yt-pBZGG9QKs9tcd_Ow@mail.gmail.com>
X-Gm-Features: Aa3M54qy9_Rj7xaMwVGFv3qcI8VRtXgzHIP9TNCjd9LuAgCDDCHrVflQc6VrO_I
Message-ID: <CAMuHMdWwp4RtKnBpFNJPHdigzrQ-wf3yt-pBZGG9QKs9tcd_Ow@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] pinctrl: scmi: send the drive strength in microamperes
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>, Andy Shevchenko <andy@kernel.org>, 
	Dhruva Gole <d-gole@ti.com>, Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cl=C3=A9ment,

On Fri, 13 Nov 2026 at 16:02, Cl=C3=A9ment Le Goffic <clegoffic@baylibre.co=
m> wrote:
> SCMI gives the drive strength in microamperes, but
> PIN_CONFIG_DRIVE_STRENGTH is in milliamperes and was sent unchanged.
> Convert it on set and on get. It is the only unit that differs: the
> debounce is in microseconds and the pull resistances in ohms on both
> sides, and every other value is a flag or implementation defined.
>
> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl=
 driver")
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> Signed-off-by: Cl=C3=A9ment Le Goffic <clegoffic@baylibre.com>

Thanks for your patch, which is now commit cc2f90768e971bcc ("pinctrl:
scmi: send the drive strength in microamperes") in pinctrl/for-next.

> --- a/drivers/pinctrl/pinctrl-scmi.c
> +++ b/drivers/pinctrl/pinctrl-scmi.c
> @@ -14,6 +14,7 @@
>  #include <linux/scmi_protocol.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> +#include <linux/units.h>
>
>  #include <linux/pinctrl/machine.h>
>  #include <linux/pinctrl/pinconf.h>
> @@ -155,6 +156,14 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_co=
nfig_param param,
>         return 0;
>  }
>
> +static u32 pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param,=
 u32 value)
> +{
> +       if (param =3D=3D PIN_CONFIG_DRIVE_STRENGTH)
> +               return value / MILLI;

Does this need rounding?

While MILLI =3D 1000UL is correct from a numerical point of view,
it is not correct from a semantical point of view.

<linux/units.h> has:

    #define MICROWATT_PER_MILLIWATT 1000UL

In the absence of a generic conversion value, "(MICRO / MILLI)" might
be better.

> +
> +       return value;
> +}
> +
>  static int pinctrl_scmi_map_pinconf_type_get(enum pin_config_param param=
,
>                                              enum scmi_pinctrl_conf_type =
*type)
>  {
> @@ -167,13 +176,17 @@ static int pinctrl_scmi_map_pinconf_type_get(enum p=
in_config_param param,
>  }
>
>  static int pinctrl_scmi_map_pinconf_type_set(enum pin_config_param param=
,
> -                                            enum scmi_pinctrl_conf_type =
*type)
> +                                            enum scmi_pinctrl_conf_type =
*type,
> +                                            u32 *arg)
>  {
>         if (param =3D=3D PIN_CONFIG_LEVEL) {
>                 *type =3D SCMI_PIN_OUTPUT_VALUE;
>                 return 0;
>         }
>
> +       if (param =3D=3D PIN_CONFIG_DRIVE_STRENGTH)
> +               *arg *=3D MILLI;

What happens if the result differs from the original value in =C2=B5A,
due to truncation or rounding?

Likewise about the use of MILLI.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
