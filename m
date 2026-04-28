Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737302EC57C
	for <arm-scmi@vger.kernel.org>; Tue, 28 Apr 2026 20:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777408427; cv=none; b=Qac2IN3S0fGCL8sLyrJ2WUQgp0Nkvv0VzHceYcgJNmEllJwcx2FJvuayq1S/H778RIboPVl+Xij3VWrVhUjHyMHGSsIjPNt8PdLOWWLVl0eDJCtnu/N8KraQOs6vPlHqa9g1wL2LXspqzb/D1WOf0c6vjW+Cqd3eY2XM+qQA4VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777408427; c=relaxed/simple;
	bh=5W63L7vJAPPbkNRffUZ8GPvklygiDlr1K33wJZ2BgAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=cbWdZ/yllGGKzYra23dQ7iyj1MdEguxQtm3vUVXJnSLOmc1bbO98kx8dMpZWdYx+j09yiqhhrjGLSo6iNtEDS7VU+pwVcaRwNbkG2ulT3SzywSh49OCSPnKv0x/VYbSfCGGQe7ByEIbzptNw14OlCPdxrW7q/UtOZK0V4SqsNDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H8oMMZrH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H8oMMZrH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777408425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VHwv8IafpIjW7d96DL7qFjkHOZaLx+9q+VBMqdpAtL0=;
	b=H8oMMZrHwFBsNBTTqBiqrP35GDcNTBSAIpcTq7n+IKdHtSvNE0Sfxph2M0Uphdl4KC+7ip
	cuxj86KBYPkz6jib5D3ILCu8C3NvCRDqmRZ4TbPgaJIqfZzPBIFSjlqH8IOjZGv4v2q/sb
	BgEnWPVSBWT8h9/K60vdxHezYxvjxI4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-uQQpTh1jMsyFKt48Mfqz1Q-1; Tue, 28 Apr 2026 16:33:44 -0400
X-MC-Unique: uQQpTh1jMsyFKt48Mfqz1Q-1
X-Mimecast-MFC-AGG-ID: uQQpTh1jMsyFKt48Mfqz1Q_1777408422
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fbc70cfbdso196566791cf.2
        for <arm-scmi@vger.kernel.org>; Tue, 28 Apr 2026 13:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777408422; x=1778013222;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VHwv8IafpIjW7d96DL7qFjkHOZaLx+9q+VBMqdpAtL0=;
        b=RgHJzt23m4e/sQhCSQwAtLkdUrUvtodxFnsnHgCDvBFeyBe7RGWOYNjkRvwIzjM5M7
         NHHdlD6hszHqZSZToZaCnN51Dg+4C5nky5DqjeQ9PkWbmrNsoRbJTtwTGIpGZFc7gVzr
         /iIWicL5KCpk9sL+i9B6RCQd1QK1wBui7T06FvHqAaeZbAv2NaUPUvBQnNflJrlJYFbj
         CqqFL6Fp00Y5z2hDnteCJhiKMqARPu/xesvXhEXnkFtP1zc7TYLx+oao2IZIB/YsP/wt
         Qn6Zehiil5juCt6vbpPkP/1BeJ9KjzO8VJUd972+V6eorRPjBZ0M8ulTljITodrabYl0
         89LQ==
X-Forwarded-Encrypted: i=1; AFNElJ8pBXyCxoER6qYMbGu+nZqM8xPn9gJAmqVFEzC/b9Uoi0FPqPS4co6R10AEx2PAgYPuqA+L21U47w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtvBs/hpO/T8uQ6npQIhcNngHDmQHnoW0NJNcyQxHXrSkCMulS
	m2xSecEUYLuK3CpFqJIXtLUSVq06hFBWkgelMvek08h++pKWh4qxhuJ/N74LkhOpy9v3KR3XQ5H
	RViw/4lyWQlsH2CABIJHsWz3KxCxDXN2Rc3XMZ7YXB7hyj+yzSkVZDw/BWS1j
X-Gm-Gg: AeBDieuCvDCXJ54iX5nullmoofPRzExOtCtcGPggZp/daZ8O3CQasrXg1mIde/GPl9Y
	qvZ6NA/+jdZVwzkTuGPxDsjiAZomtU2xqW2sc/G//pCuuINwa3f4aN1W05WDU1PXneOomj26/og
	ctR1upm8wuMH/Xrmk3maScZRt+qZxZFd3rJBVJ9yPaDDQohgrtdHhsEr/WxwQq2WRuTJ3+NtmPp
	As/wXV3y3I84ld1tx177xtyj2jq3sIu59Pb5KGR38BHzR3KTiu/NhxoubVV39CPRwQjeK5dTRf9
	V9lp4hTRFLmfPjK1zHhOt0wDWnkEyOZAHI4lOZsGF6jSndA8/qh8ASBvUXbve2rSQd1I3aYqjQT
	ML4BSidX/CZdh4P69GE21f9jJgxaZY3w=
X-Received: by 2002:a05:622a:1f8f:b0:50f:be4f:4664 with SMTP id d75a77b69052e-51018a4727fmr18458231cf.32.1777408422366;
        Tue, 28 Apr 2026 13:33:42 -0700 (PDT)
X-Received: by 2002:a05:622a:1f8f:b0:50f:be4f:4664 with SMTP id d75a77b69052e-51018a4727fmr18457831cf.32.1777408421914;
        Tue, 28 Apr 2026 13:33:41 -0700 (PDT)
Received: from redhat.com ([2600:382:8104:bdc6:d862:7b9c:1d01:62e0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5100da4d312sm25243291cf.1.2026.04.28.13.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 13:33:41 -0700 (PDT)
Date: Tue, 28 Apr 2026 16:33:38 -0400
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
Subject: Re: [PATCH v3 03/15] clk: scmi: Use new determine_rate clock
 operation
Message-ID: <afEZotnIZYXEtMiC@redhat.com>
References: <20260428201522.903875-1-cristian.marussi@arm.com>
 <20260428201522.903875-4-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260428201522.903875-4-cristian.marussi@arm.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HDDVvgrY5knqvSURlnzGhNJY3I0j-z5vEmcA4R5khVM_1777408422
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Cristian,

On Tue, Apr 28, 2026 at 09:15:10PM +0100, Cristian Marussi wrote:
> Use the Clock protocol layer determine_rate logic to calculate the closest
> rate that can be supported by a specific clock.
> 
> No functional change.
> 
> Cc: Brian Masney <bmasney@redhat.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> @brian: I'd modify further this clk-scmi driver, with a patch on top of
> this series, to properly use your new CLK_ROUNDING_NOOP flag once your
> series AND another (already reviewed) series on clk-scmi from Peng are in.

I don't know if Stephen is going to pick up my CLK_ROUNDING_NOOP series.
We talked about it in person at LPC in Tokyo, and he was the one that
suggested the flag rather than a new shared noop function. However he
didn't pick it up last development cycle.

I would recommend NOT basing on that series of mine to reduce
dependencies, and so that your stuff doesn't get held up by series.

Brian

