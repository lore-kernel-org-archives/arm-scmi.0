Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6713F40149C
	for <arm-scmi@vger.kernel.org>; Mon, 11 May 2026 14:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778510829; cv=none; b=jrh/4A8ylhniHV/NPl6doe2lIDvQeaOVJNlZrN8H6z8ADymvzddvuocpSSUylVbtv8GbvMNSYB4EWcQloRlBMbfEhlslRwS6bW9CN1wkCunteQSm/Ub1W/1e28IVucDa3Z5v7HXl2JyctmUAPSpwMGEZcwwm/BgYlK6f0hVcz4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778510829; c=relaxed/simple;
	bh=Tuk6Cpk8cxw0DoMwyejCxEWUJP6eeioUgkg4CQQALUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=kxaiOxQsAGnFOPxh/Ji9YaE6RrItg/aFo/sWrRHF6W2UTgeiSR4LPhJDBtCs4PWEieoCg0oIbDW59YiPgFgBbP/39iIgxtahg0uPv+638kc2ez9xMIF+tPWUejPzcBjmBwAkTB7fI2Zogppzq6Mg2P77T5b4OlmB+uUAyULMECg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YTXOEBYP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YTXOEBYP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778510826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u+Cerdam1U54WBH71GKfZQRR4jeB6y2Uccd1vRw3E2Q=;
	b=YTXOEBYPiqZanRUYMSvkRkNilWamWWZWzaUy68JzmAKIYJfJaSe3e0Zu3wJ2Ufo6iyzeFB
	GhfcXBR5fCjNJ3ycViOSlyh3RI13qCXIuPUYII96O4EY3peVkPM5gf8RaaXxHTEVs03pEM
	ni24s//4CZr09epDW79tNR90Iap/gWE=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-0q1jX0XONDeY0QK5zrqWjw-1; Mon, 11 May 2026 10:47:05 -0400
X-MC-Unique: 0q1jX0XONDeY0QK5zrqWjw-1
X-Mimecast-MFC-AGG-ID: 0q1jX0XONDeY0QK5zrqWjw_1778510825
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8b5ceedb5c1so103233886d6.0
        for <arm-scmi@vger.kernel.org>; Mon, 11 May 2026 07:47:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510825; x=1779115625;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u+Cerdam1U54WBH71GKfZQRR4jeB6y2Uccd1vRw3E2Q=;
        b=b1H1vd2djscQTIbjQvmGKudpJJlmSImyZ+N79RKV/6GX3nm+7sVOKW1bYekZ7+6ARS
         JtzDUDqyxmDA+R7yQI5vj0mPcAOZcRw/weVNP9ietGHI8rcD7j/JiPVNsUYzDgnSo3NE
         pVZGn6Qu4brEERDBno92AgjuwOVi+Ig1Hm1N6Fe4oznny182u0Dz1jOf1zxeC9xBvQqe
         3+PUwzcFOIWXlwkWkRFv1VXk3CF2OwxUb17b3qZEhvp2OBSay3DU2/KmqtTo+LPqXSYh
         VieQvOgDclcN5C125iHkSaRA8hldnlFOC0HXH/mU/rTJEiI6LEwuUPiVCgeaNTkTqUPQ
         c8XA==
X-Forwarded-Encrypted: i=1; AFNElJ8Z1ZZtJIiplxPrB943t8uK2DgcouVd1ZqFzqNJfs5G92IwyIkK40/BlmDRYXX2hgKnFA2hh+b9XQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8e99Aw1S4SRnXXKMV79wHPQoqJWxXV5Y8gDVmgIPzU9QscUDe
	e5J1Y4O+EWpkjMyJzmJO4K/HXEbZ83WMhuSYEYsZkPNXBqJHTYOz/zy80w1YZu1aihSokyn3H9V
	APMNSkGrbDJZ40+GR0yIyEnLiL4ccKKS6STDp7L8OZtKQ3akpsQVwj16lkwbv
X-Gm-Gg: Acq92OEh6v4NcY2jw/9UVlNv8Sz83cRv9u+uwwNQGzQNDe70+aAn4bFjoeG99yRssBm
	yPpBpIijC57tTw2ai/sfeym+G2fbW9wPy2AWi4zt9PrLrWQK+wT+ouOnChKFMsl9h6j6UuQyodR
	qUdiYeuXb5W80Kv33Xlb77RN7u0wqyOMjQDnI4626fnERonh9kiSPbWKfj2lINRjlZn8bflMhAk
	JX6tTDaZlJwsyo9fvWsvXqLh8bMUg2R60L/i9MUIknCbA9vrpLwa8OxqhtQ5rE3vhKVYeBUVCjK
	4j/983IEr2jODXjYGKPo5yEppvx0bh4buVUs0b5M07glrUM274HoAd6iZ2zyqfDgAxv2cTjwDiB
	DmIdEbBbKjoQLq5aF/10ltf5Il1W2mCPvqw6Pbl4rZIpDr064wMJk6Bfy
X-Received: by 2002:a05:6214:242d:b0:8ae:6587:3d54 with SMTP id 6a1803df08f44-8bf4302e586mr246563936d6.26.1778510824420;
        Mon, 11 May 2026 07:47:04 -0700 (PDT)
X-Received: by 2002:a05:6214:242d:b0:8ae:6587:3d54 with SMTP id 6a1803df08f44-8bf4302e586mr246562986d6.26.1778510823795;
        Mon, 11 May 2026 07:47:03 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53d6442d0sm310791716d6.46.2026.05.11.07.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:47:03 -0700 (PDT)
Date: Mon, 11 May 2026 10:47:01 -0400
From: Brian Masney <bmasney@redhat.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, peng.fan@oss.nxp.com,
	michal.simek@amd.com, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4 05/15] clk: scmi: Use new simplified per-clock rate
 properties
Message-ID: <agHr5VZAPvZkSlJQ@redhat.com>
References: <20260508153300.2224715-1-cristian.marussi@arm.com>
 <20260508153300.2224715-6-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260508153300.2224715-6-cristian.marussi@arm.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xoChNh8tO0LIv9XXeGXAtlyoB_oAv9wARMCUAILRpHk_1778510825
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 08, 2026 at 04:32:50PM +0100, Cristian Marussi wrote:
> Use the new min_rate and max_rate unified properties that provide the
> proper values without having to consider the clock type.
> 
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

