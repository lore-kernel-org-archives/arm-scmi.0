Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564694;
	b=iF1AX9IYRxC9fW3zalR4Ps3PTeS3Nj2RvqhvG2Tf485iDk59ETR4g+TElG3JxUJhRg+E
	 ctMrD/o9nF777OWzbBdB9g3J+L87FsZ+gnqX1KdeZEgUjmwhnN3h4E2qeFqIQGZPdl84I
	 EkUTcsuJObmPKPe0iePanKX3kqEdUBCytPki7CyzQOFK7pOFI1BZNZt+uc9ADN5LX7u/r
	 br+es5iZsoL7r3JXRrL/hlPE/IPnMx1e7B0fktvm7A2yisowx31ne53cu8v5dF6YnGbEp
	 N6xqR1hjI+n7huoQCNjGTclU9/Z5hQjCERlSb/osJ+gXpLMkSSjlpMdadE7wGQS+Cjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564694;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=c5kWoRfoh+LID+vIMXgha8z+pQ8NIChzIfvaIu/18OQ=;
	b=tQ6TZS4/KA4XyWvmYJZqBHxZ6lb7x4fSvgY9htwEVwYNPzfPxD/KDvDcaTO6lLyvxhQ7
	 bmKAlkmaPHioItyVu2LJ3gJ8TPiNcFTWvgsPw2M+KJNCaMJ9Y5ms0KX6Pzc9qaGPjdNaL
	 yCqrJLcGZ8KObLT8Rk16Ts2Aeu8EliWpBZh1YA7kkLBDIqFvbcWvjwA+3TLYCwUusAFw3
	 aiMomlY8Q5ReD9UmfSVRqW9mtcYeUxURM4Q8kr4i23zC5mwDD2WNmR8lOuvgLPSmNRY/e
	 +vNZZZGNcDZuyWAnM34lqH1VB0V84kmd3h7v2KSW+tfIW6FdyFR436aEed3bVgJP31g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YVfrwGb7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE94C606A880
	for <arm-scmi@vger.kernel.org>; Fri, 13 Nov 2026 10:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YVfrwGb7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC50D1F000CC
	for <arm-scmi@vger.kernel.org>; Fri, 13 Nov 2026 10:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794564694;
	bh=c5kWoRfoh+LID+vIMXgha8z+pQ8NIChzIfvaIu/18OQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YVfrwGb73VBd/mLLVth1dbc+CKZgt/nfR7trq3JvDURbVPM88IHuNK4v+2g7Yt6xe
	 8TVrG6j3pw3Povif5CHNl0Ov4qX3JPFeIsEt4dbI4V6H34DWMcEfF0xKdpRLQ4Ybxm
	 2UI5U6Z/P4MSaKw2PTrRBN4i7tAYUUQqRw9KC8+jtGw+l1617PQYrJqgI8MwMjXgC+
	 uOto5Sqha6sV4NCrnJKFIdysqQzbvBIuyke+5he3GcLRuB36FGs37RrXl56CNhWBVO
	 FBGHScyeX/XqH3y5R0xhOeeZprbuudAvWMJ3sxKIZmD4DNa2E4v7sPsl0uwcdzE0qf
	 8+VoX66/yAI+Q==
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-71ab5e64742so940922eaf.3
        for <arm-scmi@vger.kernel.org>; Fri, 13 Nov 2026 02:11:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGoWUwr441j9+G7DZv69+JYLWCs32LlC9dgKosx5hLTfuabMgHCHZ/1+ZI8+uwo5VBQcq9xaxnsbA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/DrakXwmPpu8RaHFgyxcbi6wiu3qJjtNHTmw2ccr/5KXE5nwA+
	Y0xrSSzorbd9QAF3mfzmo54rrLZd2UITbnU7SOHZzXQN/b+C361oMiHVLB6x/vKN3x6STeEXzvU
	6aAbDKetpmaYfPN8hPdLd3GdojgVz39s=
X-Received: by 2002:a05:6820:c2cb:10b0:700:8d6d:93fe with SMTP id
 006d021491bc7-71ab50158a9mr835957eaf.38.1794564693938; Fri, 13 Nov 2026
 02:11:33 -0800 (PST)
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-7-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-7-52d92843ad97@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Nov 2026 11:11:17 +0100
X-Gmail-Original-Message-ID: <CAD++jLmS1Et_B_U2W5W3GAx8ge5V+B5innksqKwxYnBzh=JPag@mail.gmail.com>
X-Gm-Features: AclHuK9gw9rzvmJfnK1wHvLc_pWsubTkRQG1I-TXfEXhLtnbQg50tNAfCDomXWw
Message-ID: <CAD++jLmS1Et_B_U2W5W3GAx8ge5V+B5innksqKwxYnBzh=JPag@mail.gmail.com>
Subject: Re: [PATCH 07/11] pinctrl: scmi: give no groups to pin-only functions
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Peng Fan <peng.fan@nxp.com>, Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 4:58=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clegoffic@baylibre.com> wrote:

> For a pin-only function PINCTRL_LIST_ASSOCIATIONS returns pins, but the
> driver registered them as groups. Register pin-only functions without
> groups.
>
> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl=
 driver")
> Signed-off-by: Cl=C3=A9ment Le Goffic <clegoffic@baylibre.com>


Patch applied for fixes.

Yours,
Linus Walleij
