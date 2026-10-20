Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792480158;
	b=E36cgmZp4i265EMq2L/22v/39hmBEs36nezNNy/iTaPxNcdiZguGQpITGTVoi7AG6opJ
	 vcO1PkejKMTzOPCdcynFwQSVxzCCR7sh8vjNDU6drI2LkXIK52IootGgvPxPwOkyx4Zt8
	 1Q9ke/m9RZye3u9xv/nSiHFrgqVtAu6zt/MBlk0EgZVEAHo7anOrFD/vXgzqOskpWSraj
	 pd7bzTrVoPZDNWwJ3RdyC/n7S9+1KpxEVT+yrXAPh8LAJI4/8ez6cjzmlf1NuryBLgaLP
	 ddzR5y3OToldiiVLJFDSi/VO/b4nas6m/BZfip6zFxBtd+E9unNYKwImRzVnIWikkow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792480158;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=PPF5Lg+md+ScchRlISc/5Y7zr+t9DzuuY8wGaLIwWl4=;
	b=fosXlzPgrj3jb7J+0eSnY/mQpxJWyG6R4dZFtBf7duMi/GDCVZUYwa7T/S16fB7xz9f1
	 1M+JTGcDmOI+UkV5YmsN5uve97+WBMcDca+SpjVLFgf1n7Wyu5cFMFzMhH5MBLXx6M3Lz
	 e4gMhIGYtJ0kiJgkW1kUPVzWKI7iOz6tITJyiTG248paGOsyNjpCkm1++aLt0Xm+fDDF/
	 vq052IpsLbyfmOciKxA4lUWekOJ7mZAzSTiO6EFNVr8jFaot6TQVg4hywz7SvDtFKXl9j
	 hKYly0sRP5GnRVr4yneNbTyRPVLTz9tnMzP44vi+dogD2rx6JAVM5z/ozxy2bjsy6EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.46
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9C2606A31B
	for <arm-scmi@vger.kernel.org>; Tue, 20 Oct 2026 07:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF9C2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7cc0e865dd1so895363137.1
        for <arm-scmi@vger.kernel.org>; Tue, 20 Oct 2026 00:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792480157; x=1793084957;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PPF5Lg+md+ScchRlISc/5Y7zr+t9DzuuY8wGaLIwWl4=;
        b=BsIX4R4rIAYRVM4dAEjYcqLISIXNLxVUsQNvPROmQGmLeJOjIzzRIS/zGD6xZa6Hyf
         X+bhpQ/TCrZlji8GpvRjj5p8lBtKdUfTGiXP349hKcDejK6YqnyalMXpxYllOV0vKvRr
         PDk+PIvlAeV6Q77Gd4euzpT84PuNeuE9SLsu0AXEagNzSVDwv2S6QNTOVM1lTT2r4PV0
         jhD6ZGACVolxG1S4tpjktGR1C9xEV118IVRCsu1vgvGzmIh70cTdmFSR/YrS/IUmFtRW
         I/b91KNM91X9E2+DVYAOTDB43iIu8hlq4Jv9gY5wGXnpM7OEBpI5hGre5Fu/2ta0sNVm
         JOLw==
X-Forwarded-Encrypted: i=1; AKwUvByLHC3D754prRAvdnWCg9VKuxrwc+Iy8c19IQUwU+j7PmjntBs9iiNHVa4hcsexyG+Tsv/qEIm/SQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKmEJeNvdg8DmYU76SnEIU82bikhQv/VekS9ZwEUI5gSzvvSYgo
	2lxmk9p6ltlsKiyX9zUwRYqxXwIZa5FDqin7NTdunO6guarRKxRMwLFIfsD7amubtSo=
X-Gm-Gg: AYBFou17tW9qJ8vJiasYFTt99rKNZl2SKh0yCPt99YIE7AreotHKQA7133zlxsiXFNK
	sWUFyVP/ab6b3JzbsbZAcbIBkKmRZuhh4pOanb/08Pe69iGNn0PeX63mMaPRdOV4POce2e+Uk14
	zeHP5KsUMF68v8PJAPArw8xaBIz/uYLPJNX700ziTuwIa8SSjcjInialnaRX+9/epddioR6ZvDE
	RRYq3ra+FF7yWxGrY8ER7ASShcZH7/eLhkiQjJmGxq552M8CeGLC9r7+ydL+nTDzTdFlkRcsNnj
	Q2XjLvkaVnamJNnVdneOppagNORDuRIb9sNIwTORh/bbUyqnKMDzjRFm6xxfERB9reRVZ8E0Qq1
	ma6cKrgsVpT6aytzVikezwvoQYJWjRDpR7ruK00sxMzBNcbar03oFFUKGXIhV7budf+eF07QfKS
	ImIP9tKludRLcmST/uuWvDKS7ipH5EfH8Oo5dlXv9u8thN3uVKOwXraMnONkgKH5IiixAuqN6f3
	2lGQ5vXvU/izq68LGVUS/JKtXdndEI1IpaV
X-Received: by 2002:a67:e717:0:b0:7c8:4efe:5243 with SMTP id ada2fe7eead31-7cc36951834mr2069599137.14.1792480156850;
        Tue, 20 Oct 2026 00:09:16 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990bb25937dsm2271182241.1.2026.10.20.00.09.14
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:09:14 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-745497ac8fcso1335907137.0
        for <arm-scmi@vger.kernel.org>; Tue, 20 Oct 2026 00:09:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzYwEtF69VR/vRKZVzc4RdYnvAZjCjEoW2hW0p9vgWnRf0e0tfrWtJIqO7/4zEZflIGqqoXP8qpqw==@vger.kernel.org
X-Received: by 2002:a05:6102:3753:b0:7cc:1ace:fd0b with SMTP id
 ada2fe7eead31-7cc368f6decmr2272570137.8.1792480154006; Tue, 20 Oct 2026
 00:09:14 -0700 (PDT)
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <4524363679c1f2163aca3b3dda2bfbde170d095a.1792163045.git.geert+renesas@glider.be>
 <20261019160545.GC3705@killaraus.ideasonboard.com> <CAMuHMdUTz3BR48_Y8_UR9PEjLuavHtN-4uaEKURtqRXFBO0uUA@mail.gmail.com>
In-Reply-To: <CAMuHMdUTz3BR48_Y8_UR9PEjLuavHtN-4uaEKURtqRXFBO0uUA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Oct 2026 09:09:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWqgRL+rzQ7xEzn88Guy+KLUHmHyMwAdhfHhC8Xopc7uQ@mail.gmail.com>
X-Gm-Features: AclHuK-xW82aBw8g83Y0vnua8_TBb23MC_WawHBUIyGh3Twhft0MuZERm0ITiqw
Message-ID: <CAMuHMdWqgRL+rzQ7xEzn88Guy+KLUHmHyMwAdhfHhC8Xopc7uQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] pmdomain: Make genpd_get_from_provider() return -EPROBE_DEFER
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Mon, 19 Oct 2026 at 18:32, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, 19 Oct 2026 at 18:05, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Fri, Oct 16, 2026 at 05:55:44PM +0200, Geert Uytterhoeven wrote:
> > > Unlike provider-based look-up functions in other subsystems[1],
> > > genpd_get_from_provider() returns -ENOENT instead of -EPROBE_DEFER when
> > > the provider is not found, thus not supporting probe deferral.
> > > Currently this is worked around in of_genpd_add_subdomain() by remapping
> > > -ENOENT[2].
> >
> > But not in the other functions calling genpd_get_from_provider() and
> > propagating the error up. Have you validated that no existing call
> > stacks will break ?

Sorry for failing to provide the answer I intended to provide:
IMO all of the callsites should be fine.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
