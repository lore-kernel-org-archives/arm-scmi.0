Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6163264E7
	for <arm-scmi@vger.kernel.org>; Wed, 12 Aug 2026 10:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786528960; cv=none; b=qTQQHcqmdT/fQYQfuJZfucDlXAnsMRo1Yt+Tg9FMp16+1VDw9X6+gH4crpi1JL8SiQD+uDfYAN5DPIDGA0HpBz/r/Av6GUr68DMzgoQwzyAS6fz6LiLqIiIFA7hqXl8eRUzk4QL2YPtLcgeD1amX4hikpT9XxlK6QPr9bxZRWTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786528960; c=relaxed/simple;
	bh=wokLofWxv7vLrWb75WZJGxZonifi+3z274aDMO/O3SE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q5J6Xd1w3wjqjxNcM0L02g++sKTphd6RnlIReyiriOK9DvKYP0mLGU8asiwuSgWG+RCXhq3vvPtHo5xWGRBai2SvwR9iJiXmlHqG//KVTUUuHkEGXB16HjexiS/FXv5I8/+xXJAkR1Ay48VY8mDBOYfFQXnleSOGJYYcqA+3coU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5c375a9e76cso516804e0c.0
        for <arm-scmi@vger.kernel.org>; Wed, 12 Aug 2026 03:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786528957; x=1787133757;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CR60h/fVXoId0NfC1qox1rIsZX7Vdp8o1eA32koeHU0=;
        b=rh8+siNYxQ3xzJUE+3wv4WYaBltL2CctsVaRmAdUa+OF6MZpKIMQVfH1qGLnw5256Z
         YC7WXV3TNhxBthMt0h3YcRsUadv4vcM467OLeBT0G33xxLzV2PL6NLCJihi0JI0yQ33Q
         OusMPX+GtShdQ7zQW9+kYWAfgHe+65KkoRhjfFbUBrd6WMe8LKwzDGWMjX+oZnRMQ2J1
         NHZBexiWt6kUzqhNdXztUAhgBGgY1B2S2dBHK5nYWE4K9jo57LCT5vgKaSS3DJ0mfO0O
         DII2ecnM44JVhWxReCqiYzoGS47mhVFkiaV8W2eCCbrUnPsLETZdjPzIwg0dePNAux+I
         jvnQ==
X-Forwarded-Encrypted: i=1; AHgh+RoAuQ9LFePYHDI77wsiCQYAzDw2f+2fXU+wMI3wSzpor/uHOfChfhDBt8dJ262uGFyuUulTozGEJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc1FFy0PaWDcZ0gt8RPgKTfdwEOq5cD/ixDa7DxVqyqeZLldb5
	HlybOPg6FBF9xUzWVWgajzK70HtTQRwiWU6Psw7Hb6Z/cgTtwuNU0e2cGZzxq3/6
X-Gm-Gg: AR+sD12SIhxSopCsi7SsLISL/GGI0NfiC6lLmq/Jtkr6Oj5YdQ27XHMcZ5PYyx9EjNL
	77AEP02PAtjToFd4W5pX/11pF67nXejo7vWNcMXyRJp8gl0yhgS2fxLQwhe7kWmkm+pNkXZvBNr
	LBDVNTMlTzu7SKx02zJbFPAv7l9lOXaPUubZEVU4ULomphBtLXQxuOJmCS2adgZcftYHPVfqOcT
	3N8Y4NjSie0Tk5sgJLeQTNrdNbov6hAEecqn+19vmgC/e2Q19RQt1YLC3MIu36RCnxUPr595HzW
	MhCLQbbeNweswOCeLCXO4Kd5A7tMPWfDBGQc7XJkl60TKq5b3ttncG9dFnZ9N4nDHLKZOplndoR
	4AQV7p42Co13ncz5LE9UtdQNDq8NRwJH+elMLiQHgkS0jTVbAXGRqoiC+hEOOqvYVUMIF0/0DZM
	O5Tc3S3x5aABGGHaQsU+rC07Lglw89djh7iJty5nFLq1fDXBo0dbHmyv87Zy8zyfl3/NBNNc8XZ
	Du55SP0Vf6JE1CggGiwSlSYdA==
X-Received: by 2002:a05:6122:f92:b0:5bd:ea6e:52f4 with SMTP id 71dfb90a1353d-5c501f08275mr482485e0c.10.1786528957619;
        Wed, 12 Aug 2026 03:02:37 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c45b460a48sm967390e0c.2.2026.08.12.03.02.36
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 03:02:36 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-738a5cc517eso474785137.2
        for <arm-scmi@vger.kernel.org>; Wed, 12 Aug 2026 03:02:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrTdlzB4LEZhw3+YQfHID1OCrFyqi8vm7WH0cQ9AqjoSVcPV7ZCleiD8VFtomh0izauTHH0NmcDvg==@vger.kernel.org
X-Received: by 2002:a05:6102:3fa3:b0:738:531e:a43e with SMTP id
 ada2fe7eead31-76c8e62eb86mr823119137.7.1786528956520; Wed, 12 Aug 2026
 03:02:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505329.git.geert+renesas@glider.be> <49726acff0fee1c3606e83c4f242ef6aad25b4b8.1783505329.git.geert+renesas@glider.be>
 <20260710-adventurous-burgundy-chimera-b2fff9@quoll> <CAMuHMdV=ckONBbTYELPJU8YWoNzdu3PJ95VR8cz+f_7dUeiPUw@mail.gmail.com>
 <20260716214924.GA1477674-robh@kernel.org> <CAMuHMdU0ss6wUEdjC+OYa3iQS439aJ8b_d9M2ws7Ayn4_kOyMQ@mail.gmail.com>
 <20260811163334.GA2354701-robh@kernel.org> <CAMuHMdWbzg-QpFBzzDa2hC3HzAmWUkerESC5O-cSVxmWX3_PkQ@mail.gmail.com>
 <45dfd858-9d59-47e6-91e0-ef9e6e909af6@kernel.org>
In-Reply-To: <45dfd858-9d59-47e6-91e0-ef9e6e909af6@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Aug 2026 12:02:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXJFdJQP1GVXrOWRuYO8Si_WF5X+vpzmAgTZY+tQstR1A@mail.gmail.com>
X-Gm-Features: AUfX_myt-2ep2N9UFFpinQmtMeTX8Y6aB554SNFoItehXn5f25ET5eoahbFPK1U
Message-ID: <CAMuHMdXJFdJQP1GVXrOWRuYO8Si_WF5X+vpzmAgTZY+tQstR1A@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] dt-bindings: clock: renesas,r8a78000-cpg: Add
 firmware property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Wed, 12 Aug 2026 at 11:51, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 12/08/2026 11:47, Geert Uytterhoeven wrote:
> >>>>>>> +  firmware:
> >>>>>>
> >>>>>> RPi is doing similar, but I have doubts. It looks way too close to
> >>>>>> generic "syscon" which is disallowed.
> >>>>>>
> >>>>>> I think this should be vendor+purpose specific, e.g.:
> >>>>>> "renesas,scmi-transport" or "renesas,scmi-firmware"
> >>>>
> >>>> If you can tell me the resource that a 'firmware' provider provides then
> >>>> it is fine, but you can't.
> >>>
> >>> It provides a firmware API, which is not available until the firmware
> >>> provider is initialized.
> >>
> >> I don't know what "a firmware API" is. What does it provide? I know what
> >
> > It can provide lots of things (everything we are no longer allowed to
> > touch directly from Linux ;-)
> >
> >> a clock, GPIO, reset, interrupt, etc. provider is.
> >
> > A clock is an object you can access through the clock API.
> > (s/clock/.../ for the other cases).
> > Firmware is a service (virtual object) you can access through a
> > firmware API.
> >
> > In all cases, the consumer of the object or service needs to know
> > which object or service to use (there can be multiple).
> >
> > In all cases you cannot access the object or service until it is
> > available (initialized and registered), for which we have -EPROBE_DEFER,
> > and/or "[PATCH v2 02/10] of: property: fw_devlink: Add support for
> > firmware".
> >
> > Thanks for your understanding ;-)
>
> I think that's the difference here. Clock is not an object, but a signal
> on a wire or within IC coming from one device (provider) to another
> (consumer). Firmware is not a signal, not a wire, not anything which can
> be provided from one to another.

Oh yes, it is a service provided by the secure world or a different
CPU core to the application core running Linux.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
