Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2B5369D47
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 15:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584462; cv=none; b=DmTGFW+YBgKxdu5USaDYQT5OKYOTp1+zQKRGnGNt4LsVNV11mxA6+1X8P//YUmwe8yGvYC6s0dKYS2YVlxKQIr5TVrK5aS44kOAr/nuNNswKQoy1X0Bn4Bk7j/3K8U1LRRxJqACMlXgzJ782qvDXZav9qXJhSLgNg0LPNXgeCrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584462; c=relaxed/simple;
	bh=PMHzlusqnjEcUolJb6Rj0ihhVcm0EmxTzAkLKIuEEmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=DKkZou68FZZpBqSP5H+PiemYvVwL1iWdfSATch1ZJMpf77y4vE3Qo63AbZ7QC2/RjzmQxUmeeW9mfulEEtrfvbXr7ZGz6mGMkapHkrggDUDqD5HLP1FcnUwO3AA9LTJBuG6EVtBCDNk/VdASfigIa1cNPaNYvQqonxgFgWLNM/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RQ1ywwYh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RQ1ywwYh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r9JEBxETCpjKOyzPxUj8DiK5Y8iV5A7DhykNYlgKppA=;
	b=RQ1ywwYhBSzgemMFnvk2LOPOKEsN8G3U041gYQ1gub52vQQf5JXQmWNISH87NWSdr9U59b
	5E96eDnCvOE61vPX7qcjGITu8btjfXfBDaYSloduwbM05tjtDJKEiQz3gJPU9ar9WEc5s6
	6R1b5qs/zj7KBGmuE7LcEWdx0lUo6B4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-tf61xkTPNU2miX6fM9KHpQ-1; Mon, 24 Aug 2026 11:14:18 -0400
X-MC-Unique: tf61xkTPNU2miX6fM9KHpQ-1
X-Mimecast-MFC-AGG-ID: tf61xkTPNU2miX6fM9KHpQ_1787584458
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91931144870so440076585a.1
        for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 08:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584458; x=1788189258;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r9JEBxETCpjKOyzPxUj8DiK5Y8iV5A7DhykNYlgKppA=;
        b=M+E2VrmJTRQM/p+68FfJXErx15WFJ3GINVKOOiKiGxpOfji9GcV1e4Djx8Q/CfM0cn
         EmS0n3Oiw/h5o1qzwL0U9dbRUnz5pocjWPIXBv8NPRtHpAWKaWj7NXLCYTaAB6gxcZlG
         rZE63fiuw3ctuVCjV0Hd7ala9rC7yg3fJdC3cbLBixb5dv6pbTELI/QrHtR7bV1+nUhf
         PMQjLlUYAZYW26bAqnqEg8XubpaArQdwkxK2yBu4pYA8p+EL4r+syMbCqr/qKEDkUL+G
         krUmOkZrtb6MkkG020auzWgdfutk/q/GQgycOWULzFC62f3skZAWO5iycPPf90rmSioI
         a4lA==
X-Forwarded-Encrypted: i=1; AHgh+RqRaAoD3lEybQ5ElfhsQy7KIGESmEXemGQkFRzoori3B/yyXazrWXps3/LqeiVEOSuOqvWrpt+rag==@vger.kernel.org
X-Gm-Message-State: AFuF++mPjaIsrcieZuwTR+s2TkeADVH8hmmwVpeKEJnxtqxs+X8Yj1p6
	cwuvIBz8mGvdnJYDZZzKNz+TMvANx4lzscIY94kqidPYrjuHDPZIh2+B1o3KYsZyDsl2D3b0oBL
	Ug7MV+V1szONee4j6AzUBvcn823OVHVq90MnOp3E0EB5FwPwAC4ut1b166MyM
X-Gm-Gg: AR+sD112M4ZPsCFCd3dDVAgvrhcleoCoIQRjxne1VcyuIu0ARW1Ps30WmrXKo/cwDxj
	W9jduPUuYuyCmMuVpO+H7WruZhe/lXIyr7PX8PjUjoEwPIb1Avb5d/xz+o8enaQytSlPZCBDMz+
	Wevdh2B4xTEcZthhxDoARrFUrqGMy4LM6ZFqFZjJaT8WPY/nZughj8VDJypsTxQfY0CD/hKx8uP
	VPWELqcXLKRUF+z6keuZtVkCliiMv73f6BOQjHfGMVe5LQNVELniJhtk3YDc5OME5rZZvd3OyHp
	WGNva3lZTEZqnUABxZYHdssy+1eU9KOkPsgja9T8dnI46tas2K8PG+VM9DyGcGPJa0Iy82MAEB9
	caEy05gp8ASJCDcvnarpXlpt5L3pbfMxl8qM=
X-Received: by 2002:a05:6214:2a49:b0:8f1:440c:7f81 with SMTP id 6a1803df08f44-90c80942e22mr260846836d6.4.1787584457524;
        Mon, 24 Aug 2026 08:14:17 -0700 (PDT)
X-Received: by 2002:a05:6214:2a49:b0:8f1:440c:7f81 with SMTP id 6a1803df08f44-90c80942e22mr260845166d6.4.1787584456812;
        Mon, 24 Aug 2026 08:14:16 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c93a82554sm64013126d6.45.2026.08.24.08.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:14:15 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:14:11 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
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
	Vladimir Zapolskiy <vz@mleia.com>, Heiko Stuebner <heiko@sntech.de>,
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
Message-ID: <aoxfwycOmEzLzhEU@redhat.com>
References: <cover.1787239813.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <cover.1787239813.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: t4dUDoLP-iIn23w-v_2Po3dm0he7dP7qDYFOsC7OkVk_1787584458
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 21, 2026 at 10:53:10AM +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Hence this series aims to make sure all members are fully initialized,
> to avoid such bugs, and to prevent future breakage when converting
> drivers to a different method for specifying the parents.
> 
> Part One[1] fixed all cases that I identified to be real bugs, in
> response to a crash I saw on BeagleBone Black.
> 
> This series is the clock subpart of Part Two, which fixes remaining
> cases that are currently harmless.  These are still fragile, and may
> cause future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Thanks for your comments!
> 
> [1] "[PATCH treewide 0/5] clk: Make sure clk_init_data is fully
>      initialized (part 1)"
>     https://lore.kernel.org/cover.1787165329.git.geert+renesas@glider.be

Thanks for cleaning this all up! For the series:

Reviewed-by: Brian Masney <bmasney@redhat.com>

