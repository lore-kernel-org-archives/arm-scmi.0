Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B96034A785
	for <arm-scmi@vger.kernel.org>; Fri, 27 Feb 2026 16:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772210332; cv=none; b=SGy+aqkjUGkdsQRPpW33Tppkoj7O84sCOpjYoMj2Xt+Q4hEtPgZlwFfdDeVWXx8cjn8tPS+pgJW5QUsiQULlujgpCjyojCERjzHwO10On4Fz3peLaDUmsMUWgtI3Yo+vW63GC8lM6I29V124s2W7LhOB6Ej4FfQqH19/3pUpnc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772210332; c=relaxed/simple;
	bh=nR+w4zGkLQzjRTIc7kjY/q5/CbnV6sRdNO5FlWgP6N0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=t8VbeMpKU8WZ3ziOugnLEAq/KeSPSH8MXWBoAEAjc18C1VNKCb7lMSstHeH2YEYUUdrFJBLQ+1y7Bn4QFeqpGvogYueJYiTtbbr+OL49/ORNKN88zKQDZEVQuZD9wM3N2hPw9NzGj1c3oiLlvO/RL65Ab6Wq5hmTBuVFsUd1KAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=faqXkrrx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="faqXkrrx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772210328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4eN+vouZzrt2RU3yojqU84OifC1c0sqNvd03CXYM2zE=;
	b=faqXkrrxX9jDebOGqPS4po+d59RE5auZS4BLM5bIDiAroSemkTkgOwuETJGDwDftOpubpk
	8Br+cI9O8i5FtY2BxMGZYywT3OUxeM2e00hE0buMYnzatoMLaGfWOR+K4u1JHtdetEbX3U
	X/pOeYi/ulTDWhbANC1pLtbQuS9zZ3k=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-0XKPHh2ZP5-Fu2XReHT4ow-1; Fri, 27 Feb 2026 11:38:47 -0500
X-MC-Unique: 0XKPHh2ZP5-Fu2XReHT4ow-1
X-Mimecast-MFC-AGG-ID: 0XKPHh2ZP5-Fu2XReHT4ow_1772210326
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899b6a1a557so232935766d6.1
        for <arm-scmi@vger.kernel.org>; Fri, 27 Feb 2026 08:38:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772210326; x=1772815126;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4eN+vouZzrt2RU3yojqU84OifC1c0sqNvd03CXYM2zE=;
        b=qz+UUoC7SvEAy2wy0Lo7zD2y6gjsH1Z3Xpi3sgfUr3PmTta3FusXztCG80YYpwhf8E
         lNgVt/W2dvSDKkaVppRzCBUIi9m/y3JXxFtormNrQ9oRnnWixgtP14Napputm5p/juIo
         y5MWGk0YFBvr7FzbPRq4kDbq7qHi9qPi75LMIfz6C2b83N3QbWo07r8dAOnD5GYZ7JUI
         I9vJ++fb1DQ409LWzdONhaD2h21/nfeJsvDF7bOYM1WaKnzlidXK2ov0YMCmvUUfuhAF
         ebgagkNnzYgRqnBY36MQTD4N8BilB52BhtfcNGxKqbY+m1kFE/pVlhb0b2gcvV18Px08
         UViQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjHYsJ5Q8Layfa6uI/RvubdQl6MEre2j/tSmXGHcIsGlQ2FGqA1SGHILoTGE3W0j2/ZsUkKHO+4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/shUeo3BCSXNnxSrtK9eoJ8zwRZQ8JKhoQN8Bt3j6D21AT97Z
	JdFs8zyP0bJkHDi1xMi/B1Ut3HVyWAyEGUuSzTC6XjpCQiAPKKsH07Tadk9ovFsNcq81d/E11R4
	OD01IUSa2HTAgrPMgUD2ohxveRkTAaD9yHz3/+ABFnoDWbAvTWmWGeAlvdugI
X-Gm-Gg: ATEYQzzW4wdimeZsQ7eTltPQikjLeSNIsoYPOXIVcW2QQr+acdLfzW6ElQWMnHg6vwB
	Mlh4+3Go9Ij0QS6wLFKRvEJvo9GtRMT9znII+TVuJvyXuUMOfz/ozq5tFPAiZm9lsIRtPp6rbaQ
	UndkRXvxdxEvi2+Xks321LUR54ZwGpTAfeXRRRBNgiynK97mTZqrdHfc9azwwZUxJfls5A3lKof
	iisLthXJ226SX3V7DWOq+Net0KhmqoGnkEns6VLb7LMQMi/LSvqKENSoFCCdvmip7NRgvXJT+yv
	ZXnE+1shAxHDJqFOYiM4yjRatqqkgnRBIsqf50jcrv6nEbsGRYFiotm4/FLFehIOEGwgJS7yQno
	rDFQZ649IQ3E7zhFP/JyBSuORYVlNuZqkIcISbcb+6Oqu/9splxhNFZpR
X-Received: by 2002:a05:6214:21c6:b0:899:a57e:887a with SMTP id 6a1803df08f44-899d1d84730mr49660206d6.8.1772210326392;
        Fri, 27 Feb 2026 08:38:46 -0800 (PST)
X-Received: by 2002:a05:6214:21c6:b0:899:a57e:887a with SMTP id 6a1803df08f44-899d1d84730mr49659456d6.8.1772210325713;
        Fri, 27 Feb 2026 08:38:45 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50751256df4sm24041401cf.16.2026.02.27.08.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 08:38:44 -0800 (PST)
Date: Fri, 27 Feb 2026 11:38:42 -0500
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 01/13] clk: add new flag CLK_ROUNDING_FW_MANAGED
Message-ID: <aaHIkpuK7AFXbeM-@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fEp8cz9XdS9O2K3cQSk906ZMCCQALTmplHWGOidf57M_1772210326
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 26, 2026 at 01:16:45PM -0500, Brian Masney wrote:
> There are some clocks where the rounding is managed by the hardware, and
> the determine_rate() clk ops is just a noop that simply returns 0. Add a
> new flag for these type of clocks, and update the clk core so that the
> determine_rate() clk op is not required when this flag is set.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
...
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 1cda2c78dffaff037f0f16b0f11106b63b3a746f..187f8248a9c840c701cbbba99bb7cdeef7b654ee 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -32,6 +32,8 @@
>  #define CLK_OPS_PARENT_ENABLE	BIT(12)
>  /* duty cycle call may be forwarded to the parent clock */
>  #define CLK_DUTY_CYCLE_PARENT	BIT(13)
> +/* clock rate rounding is managed by firmware, don't require determine_rate */
> +#define CLK_ROUNDING_FW_MANAGED		BIT(14)

Based on a conversation in the Renesas driver change, I think we should
rename this flag to CLK_ROUNDING_NOOP. Let me know if there are any
objections, or suggestions for a better name. I'll let let this sit out
there for about a week or so before sending a v2.

Brian

