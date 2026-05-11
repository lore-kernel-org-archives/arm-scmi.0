Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF814375ADD
	for <arm-scmi@vger.kernel.org>; Mon, 11 May 2026 14:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778510670; cv=none; b=SaQvUWCns9llKmEPTBhqF1yq0vqK61KFmVmXKwr18RzVjoTtrEfXW1RlZe6xjsEg2vRyWDQmkYbPICQ5gyEA+ZmkHvCwncWfN7c/uVGuNNkQWqYlPV8P4SFwxBF/JzXt3IansnB0MEVEkFjC49V08FVks6Ouz+K/wY1mbMdNGmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778510670; c=relaxed/simple;
	bh=YeUj9wXNgdrewjn/2kxGJgL8PSFFtIVeng7DFODP/tM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=o4n/gkh+b1GNzsBUkFUIr+FBzjWfeqj3JCVKNx/X+IMVOmO83ojrGIClRru7C+Eb1ImBpg9hMeox8ZgI/ehVuIBRTBj5sgoyeTEcp+2cKssHr69NrcZBaMlLVeLh7uWFrbzIax6J0cyodIqzwrYXO3uN7u0466OOjTvSZZjRvxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EH2XyJHy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EH2XyJHy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778510667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Eicqwhgs+eER0wAJIrvpo3UBssGzYDYUrthaa+7DjQ8=;
	b=EH2XyJHyB6fmzGA4HGVzb4L16axxrSiFxlExuM4EJPHDTjlcp7PDeccEw0TxHPIZB/Hb7d
	loZMh7QHPVP5doTl1ybiPLzwc+IP5NPVUmOyacyZijKO+iGYNVKBAcNQx2hRuRzvMboH7t
	kqkef/I0D0GsPitmF0Uoqo3LYYnQZqw=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-MN-QavycMd-ZnyKsEo-amA-1; Mon, 11 May 2026 10:44:26 -0400
X-MC-Unique: MN-QavycMd-ZnyKsEo-amA-1
X-Mimecast-MFC-AGG-ID: MN-QavycMd-ZnyKsEo-amA_1778510666
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8acafc224a8so104910276d6.1
        for <arm-scmi@vger.kernel.org>; Mon, 11 May 2026 07:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510666; x=1779115466;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Eicqwhgs+eER0wAJIrvpo3UBssGzYDYUrthaa+7DjQ8=;
        b=lI70UjfcgiAJj4MK+uOJkRq5IxbsDk/k4GqK14apIuqW9lBGSEZ5OarlCd+6UVpqU3
         bFBuMYhLyDfMQjafirlnCz5JlivZYl8z4TOAind+eDdRKXmJivQ1cnwa2j4VscGFkm4s
         ZIhmClECrKcLRvqHevcUK0I0tpA+eoGGJFSnRW/m//3x4C+N4QXz1DlSV1TpEin7yfty
         oRlF8Jw2IHdooEbI28Cn+pc0dC6TvbAX7W9Pv/NtGeELFxfSThy9SVe8tzJpKOzv0B0j
         3597vbZvpyxdGMq19GvsNntw+Y6LtHQ5qRhQZIqwZwIDiyjs20BgfY98k5Ia7lsGKaug
         rILA==
X-Forwarded-Encrypted: i=1; AFNElJ/StK032pLj1cejQtz7E569vdzvxOxk/DeAHuTscWqKEOk7o2bFRmi+GYQwSHBSN2l3fZsDcVyKNg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8MSUMQAvWpBz5NrkV/jhhWrP0SOYzkOTpG1OcWyw3slVScSl7
	IUpB9f0+6h4E54vzLVRCqQu02fiEs7UKiFNmeCc7RXUj5KnwM41/qta5vpReICFvghTK+cvbHBC
	R0YzbsPziAIdtTvxAGpytoVdBzpd0+MCgc8IenXLL3Y1CnWueEhZCTkiKZ5O8
X-Gm-Gg: Acq92OEDCYfAUCECOM2SHsuYGenND+3Y1shAuH5QAyffSKz5GiZ5bRS6O4SvLuLtdeG
	bZxPHZ012O2PQWybQfOF6RF0CBItJf0Av7rG3JNzWmt/xlcxhFRp3diRDqEGB0FyxfpAkiJ1IJG
	fLQTQGalWk1Iij7E7WwnEp5vrkWC47TgrjySUle525gUfeVRSUm8hygl2ED+rhPIpQalbSZdmBx
	Scq0Z427aF6HiIW4bNdssRKBe3NI1p0HDETdReRwrMZEkuMZ1TjhNa9oGSrfIryRilqD8fzkv1O
	X74YyJb2sUKijylHJ+9l3zYJtOba+Vj98FAdWa2mziOP39EiAdxBvk51MHMt46s0YAtQy9RtJOR
	737GHk5omPeNJb7G09LPVKNcI5D67/mTWV6VMjIZY87bLNrRIfUhWZk92
X-Received: by 2002:a05:6214:242d:b0:8ae:6587:3d54 with SMTP id 6a1803df08f44-8bf4302e586mr246379916d6.26.1778510665799;
        Mon, 11 May 2026 07:44:25 -0700 (PDT)
X-Received: by 2002:a05:6214:242d:b0:8ae:6587:3d54 with SMTP id 6a1803df08f44-8bf4302e586mr246379126d6.26.1778510665344;
        Mon, 11 May 2026 07:44:25 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53c6b8398sm345352276d6.37.2026.05.11.07.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:44:24 -0700 (PDT)
Date: Mon, 11 May 2026 10:44:22 -0400
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
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 01/15] clk: scmi: Fix clock rate rounding
Message-ID: <agHrRhvz_gHLpxPr@redhat.com>
References: <20260508153300.2224715-1-cristian.marussi@arm.com>
 <20260508153300.2224715-2-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260508153300.2224715-2-cristian.marussi@arm.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: F2TCxOsqM_x5X_x1htKVwSZrAWaXcjCdI2U6ELAw3eg_1778510666
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 08, 2026 at 04:32:46PM +0100, Cristian Marussi wrote:
> While the do_div() helper used for rounding expects its divisor argument
> to be a 32bits quantity, the currently provided divisor parameter is a
> 64bit value that, as a consequence, is silently truncated and a possible
> source of bugs.
> 
> Fix by using the proper div64_ul helper.
> 
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Fixes: 7a8655e19bdb ("clk: scmi: Fix the rounding of clock rate")
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

