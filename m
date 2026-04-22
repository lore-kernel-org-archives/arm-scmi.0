Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7C91E5201
	for <arm-scmi@vger.kernel.org>; Wed, 22 Apr 2026 06:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776841018; cv=none; b=n0yKZkz4r6ZVfcQln1Zdc4d9fugysB12v9EM45KLPGJPvHi+pzK3n+C7gleIStMahTDDObN7jSk3XmU6aSve9fe6SBy7Xe8KhONwsKQs2k+5MBvZVSPMr7A51TU5t4F7GGbFKI1Q7TkGWre1mhOTbj9v2qwAewIeU9Z4PA7XRG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776841018; c=relaxed/simple;
	bh=wpkRjIorbMJMpqwzpLdjkd4Y24lBbCPn4ze08bDnJqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lGwIiwElCw8lOEvkPWLWB8PxIUnAhviofaSAfDxW/N6AFaqPF11ArwYAFwcdviO4L/PrWmi/7N6gQ8A3Fq/myo2HtF125Z2X+XjCHDOhBndxSb48LSctCKIOOx9KIlozqx6AW9siKPhb/vcBRTYiFRgd1WK+QS8JvYjJk+FSiBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7dcd9061b1aso1331564a34.2
        for <arm-scmi@vger.kernel.org>; Tue, 21 Apr 2026 23:56:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776841016; x=1777445816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQBlVUrhFqLpmXIMAS6FxW1MbLcWzT++sufCtB36Fh4=;
        b=rbBlhJu96nW2H0b4pGQM7g1SibyEbDWP8fh5kgL+n/EUKkoelaAQs6bPnMNT1DyvvJ
         0/NG9NTOCC7BBFR5RhgDXFB2XitDYM8/j7LNctA96TU3xXediNwjYEKTCvJX1tnYvPsE
         n8KtCPjdZYHf6AffTHryOcuLwbu5oMeKPx9Wf2inPxSwdTBnZGwDGhxXOLH1Mx78j/W7
         Hft4yAUz+sjFJgsFTS/pFV03RKLdvFUmuSLBm1O6UBQLOoBkDs1xuQ45cI5wbKJ7sgLi
         KyvSYKF87e2ieZNMJmSgAv3L2ixOmNZrkgDorOEA1M47ZeemBLjjVebcRBeP5qBuVypS
         JWCw==
X-Forwarded-Encrypted: i=1; AFNElJ9mavVGOKrteQxM5T7Q9QXrcJK2ZWO8LJOgtoYieTL2E6V97gdEp0x5EZD7NhaGi832x6urXqW39g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiaJzj7/rplgD8DHLNKZokfS8ywCXrmYlAPGd7mV3OGmBjs0ID
	JDNqwFB/TiF4RGZY4pCUZq4i3AO6gA/tqB/VTpBnLdLAZHJHS4ao0kK0XJdSeRZ/NBY=
X-Gm-Gg: AeBDievXzNgOsys6q6KQkNM91cY6TO0pSA+g9pZ7lm3BJGbNWlBEEwYG+Yeh+sDt2lw
	KiOXruXHK0YtUdQaS5ZKwQ5AIUd7WJDfvKtrElO6ZYXeVKAqdcZvQPq58p+gLVnW+Zv1zmCQTV6
	1PRUl1TToTjG4bKNKrEOR94g+Fdi5cKmtOpO3nfS+G4XO/ZCV6habQhGCievn5PkTuLdqq9I6j/
	kA9K4GbAES5fLW1Ta4EPRrolftgzcT3e4l478kp8aDDx6qKesz3nZjGNsBu3rb7pb3kSyfte2fJ
	akjctuPmIN2bquFmhZ/YO0C4bKWSele+xIsvsSmfXN98x+KDeauvia0TPqJFJaC3inxUFUutTKF
	OfGj/f1ZbESMhuc2A2I3OQpyQXXhqr/iUm47rR2mRpfla3/18sPg7ePZuft/gfL7AatkqmD5t1M
	5FBjzR6DwekaZiht2L6gACQFWERCrxI4ZmlOGENa/a+Jur9Ha97tJTplJToOH1fFQm8PpIBpM=
X-Received: by 2002:a05:6830:2b0a:b0:7d7:f031:37bf with SMTP id 46e09a7af769-7dc95230e00mr12297493a34.19.1776841016410;
        Tue, 21 Apr 2026 23:56:56 -0700 (PDT)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com. [209.85.160.54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dccc616568sm6096758a34.0.2026.04.21.23.56.55
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 23:56:56 -0700 (PDT)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-40ee9b945d5so4030725fac.0
        for <arm-scmi@vger.kernel.org>; Tue, 21 Apr 2026 23:56:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8fC6bfu5BsOeV+GnQkg9H64ZpV2EEOtYARZJ+LhZC+1TTHgxHrP3qUE3mXovRSg59qv/k4DrDhgQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3a0d:b0:60f:f543:232a with SMTP id
 ada2fe7eead31-616f4b50368mr11299488137.2.1776840661908; Tue, 21 Apr 2026
 23:51:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
In-Reply-To: <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Apr 2026 08:50:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXxEsYuOay0+Tf=4ByTAMp0=iXwcS4YSy7UY9_CE0hb5A@mail.gmail.com>
X-Gm-Features: AQROBzBFb_WdSQXK0LqlocZWzf5masVqawoXkZ-ffV8evv9b39yVA9knMtYt5TM
Message-ID: <CAMuHMdXxEsYuOay0+Tf=4ByTAMp0=iXwcS4YSy7UY9_CE0hb5A@mail.gmail.com>
Subject: Re: [PATCH/RFC 05/14] firmware: arm_scmi: Add scmi_get_base_info()
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Apr 2026 at 20:12, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Currently non-SCMI drivers cannot find out what the specific versions of
> each SCMI provider implementation on the running system are.
>
> However, different versions may use different ABIs (e.g. different clock
> IDs), or behave different, requiring remapping or workarounds in other
> drivers.
>
> Add a public function to obtain base protocol information for the
> selected SCMI provider.  This will be used by the R-Car X5H Clock Pulse
> Generator and Module Controller drivers.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -3504,6 +3504,37 @@ int scmi_inflight_count(const struct scmi_handle *handle)
>         }
>  }
>
> +/**
> + * scmi_get_base_info() - Get SCMI base protocol information
> + *
> + * @of_node: pointer to a device node for an SCMI provider
> + * @version: pointer to write base protocol information
> + *
> + * Check if an SCMI device has been instantiated for the passed device node
> + * pointer, and, if found, return its base info.
> +

Missing asterisk, reported by the kernel test robot.

> + * Return: 0 on Success or -ENOENT.
> + */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
