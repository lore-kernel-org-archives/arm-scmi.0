Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B600488210
	for <arm-scmi@vger.kernel.org>; Tue, 25 Aug 2026 15:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787670719; cv=none; b=jVZGzh5tFaUXoblmn4k57+Awkm0GS6RwT/dkCAMDbdIwvv2anSLIxJTuabiEVqUIrU8wLPGkhN8hKfCpesxh0iSQ1Icx+ncm5x1pWEisbbTJdD7/XNT9T0zLkSl+1eZsCWNtv7R+osJk75/Ny2bUeJBB5Uv/rAVAzDyT1tzUoKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787670719; c=relaxed/simple;
	bh=VSfhDbGuaO6bj6wZHF4WXo8dJZaWBr1sYjz3PhauiKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=RLJyIQ0QtQl/gw9r4stKdhQm1WaNu59S3tO63L6MRbywuE+HmAicS4dLbMy1cM7PcAYSCnZFhjAZpldqbHClwwfOwY7S9ObL1btW3qnxDiG/SVuSVucXWLRT4/esIY/tgn6P6V6vy+aJ4PQg8CDNZ8jFqFiVB+t73FAvxsPzMVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cmNwOCPW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cmNwOCPW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787670715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l2TAxOwHRDlM6cSmZF0xTyxxMoyKXBFa/St1ecjf+fY=;
	b=cmNwOCPW0pCLo1vgxbiI8024BSzxbFhi3JiPy5Bv8SJO4i3CWLe8pnJoGKFUOrad+B/b/+
	ss0febDjN34CvxqR7kDJPsYhRohx65REzsx6IYHVayw4b9b70DhLTuDcUesPRiEXiPUqHm
	uTFVlFozsf2xG5Uyv+HbX3OiX5QSvDo=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-qpo-HrriPNWVqcEIB3LdAw-1; Tue, 25 Aug 2026 11:11:53 -0400
X-MC-Unique: qpo-HrriPNWVqcEIB3LdAw-1
X-Mimecast-MFC-AGG-ID: qpo-HrriPNWVqcEIB3LdAw_1787670713
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d33c89a29so66867151cf.1
        for <arm-scmi@vger.kernel.org>; Tue, 25 Aug 2026 08:11:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787670712; x=1788275512;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l2TAxOwHRDlM6cSmZF0xTyxxMoyKXBFa/St1ecjf+fY=;
        b=mg3CVsM1tU8NRFFmX/i1uanS4LjkMvwgTnFkE9gvq4PY5OoiEK557Pweq5PizDckbG
         i2FMl3kP8h8SsU9tPWLmNtWzCF7DMlHrfF7uL5IkwbeXcPsgm8G3UB9mlIWuLtECEPDY
         7hRiKknAQsnhXhyML2f3YjEWD7fBAI+zY9EpExhbrPj8pYoqujSyT8jjFO0ynQLxj4bo
         KuoF3006ash2iZ2uBcFeN4g3e1AHDZtRfkQNrV6PbU3BajRbdwjg2BcdOzCkXhxknME1
         VaBhVCvEMf3n2HdVARMV3BDyVpo8qkcgqhwjkLtE0mebzuxDilmNsz6CaEqQI0BrEK6C
         cffA==
X-Forwarded-Encrypted: i=1; AHgh+RqvVwYEXZ/NKJgRoqZNUbfnclMkWxHdunNV7AKXW8KGIGdgDPW+BipLtWAl3xmlcwN9yQVFpXLNeA==@vger.kernel.org
X-Gm-Message-State: AFuF++nubQs4DkroEQ2iiUGyT5CErEwMi4K1E4cZiCbj6uxYpXBckx+t
	+axMIyC9XnZOPV5ZjxWHsMABoHwismeNQGo9xMuU3pyfXCyDAGNB/dB5fykoDK7IxFjpxagzkEY
	bKB7Vpuc5rrnXjKLtU2g409/ynjj3PcUtdGx5KDmpCT6vh6V213D1W3TRfCaR
X-Gm-Gg: AR+sD12aBrQ3CIwCnIVXeAt8AZKrRYMV4hUUH+V2APfEv6PddKnnJSXPFAN9aY4HSsS
	b2p47QFy/Z79TXw7BkPiPNdaV1QmGWLNZAO/D4mS29U09AuTR+N2ia5/7ezDw0cBAI9fp/B+Y+4
	5Jb+lAbz+Q4CqIod1Nuhhu4iRhR55k74QbcAtW/E+qnxel0GNmPJreOZqgkFKbDgHjQ/RzgOG1L
	pdCC9CH3DNI2RssP7LGGzLa/AfEWryAPQ3/issceokAMWITORROTpJWi1M4dEJeTgvS0DHFvCyn
	/WC+8vapB7W76UTSweFvQqGPFuGdvirCVXRIzzZ4xya4kcLNmYkhr0iW8hI0P+cMv/b/VutLBhv
	iIYPWhg0P/jvBYPQrQXjvs5TncBXN3HHbRiY=
X-Received: by 2002:ac8:7d13:0:b0:52d:3d46:bfd0 with SMTP id d75a77b69052e-52df5a4a41emr343135861cf.32.1787670712352;
        Tue, 25 Aug 2026 08:11:52 -0700 (PDT)
X-Received: by 2002:ac8:7d13:0:b0:52d:3d46:bfd0 with SMTP id d75a77b69052e-52df5a4a41emr343134781cf.32.1787670711664;
        Tue, 25 Aug 2026 08:11:51 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52e09aad030sm71209161cf.15.2026.08.25.08.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 08:11:50 -0700 (PDT)
Date: Tue, 25 Aug 2026 11:11:47 -0400
From: Brian Masney <bmasney@redhat.com>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Linus Walleij <linusw@kernel.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	David Lechner <david@lechnology.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 00/45] clk: Make sure clk_init_data is fully initialized
 (part two)
Message-ID: <ao2ws3ZA-o8ZVjTh@redhat.com>
References: <cover.1787239813.git.geert+renesas@glider.be>
 <3074509.irdbgypaU6@diego>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <3074509.irdbgypaU6@diego>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0zxm_vWpM7nh-iISM39DzWTIUHNDAoc_j1_uYxMYfwI_1787670713
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Heiko,

On Mon, Aug 24, 2026 at 11:11:32PM +0200, Heiko Stübner wrote:
> Am Freitag, 21. August 2026, 10:53:10 Mitteleuropäische Sommerzeit schrieb Geert Uytterhoeven:
> > 	Hi all,
> > 
> > The clk_init_data structure contains several mutually-exclusive members
> > for different methods to specify the possible parents of a clock,
> > prompting drivers to initialize only the members they need.  However,
> > not initializing all members may cause subtle issues, which are only
> > exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> > enabled.
> > 
> > Hence this series aims to make sure all members are fully initialized,
> > to avoid such bugs, and to prevent future breakage when converting
> > drivers to a different method for specifying the parents.
> > 
> > Part One[1] fixed all cases that I identified to be real bugs, in
> > response to a crash I saw on BeagleBone Black.
> > 
> > This series is the clock subpart of Part Two, which fixes remaining
> > cases that are currently harmless.  These are still fragile, and may
> > cause future breakage when converting drivers to a different method for
> > specifying the parents.
> > 
> > Thanks for your comments!
> 
> I guess more a handling question, how do you expect this series to be
> applied?
> 
> I.e. each clk-arch-maintainer, or in one big thing by the core clock
> maintainers? Just wondering if I should pick the Rockchip patch
> or just let the whole series get applied by the clock maintainers.

Before you pick up anything, let's see if Stephen picks up this series
the next few days before he sends his pull to Linus.

Next development cycle, Jerome Brunet and I will be clk co-maintainers
[1] and will start collecting patches then. If Stephen doesn't pick up
this whole series this week, then pick up the patch(es) relevant for
your tree and send Jerome and I pull as usual. That's just in case
there's other patches that come in during the next development cycle to
these files and to avoid merge conflicts. I don't have a strong opinion
about this though, and could be convinced to take the whole series for
simplicity.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?h=clk-next&id=8bc7ceadce1f362a8b0e88075ef3d926b286c01c

Brian

