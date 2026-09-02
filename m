Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F25034DCCD
	for <arm-scmi@vger.kernel.org>; Wed,  2 Sep 2026 08:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337523; cv=none; b=pio5YFIOFQYlYEJIC6pmESyVEiaYQ+yewP8aQfvrDnMcvxMs4xj9b+66ADkpi94KsWTu6JPO8ps2OYYKeYIaEVgFv19jC9BgNaE5hEjWFsoJxYIzIsWqaG7ufJfBzcMFpCvNcJ2/N/55/09WRCRqeiB/hKUvFo7U62NZQJs0TO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337523; c=relaxed/simple;
	bh=Sp1QK5LGgO5maxug6ZtQkRrFOSxuL20QJO7Pa5SFUnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V+Ks76scVw5P1cNQU5Pqjw/M4Z5U05w3FQ7FkwrPmJXuVdVhnX64x3vI46nfUoZpA45bC3LbRjeUDt7RIV2IHhraoSR7D6g16Wjq1pYWZ1LsdU16ql/ZKtqq55rsJhbxI0XkrBkQSPVKcFCmG1VeJBJZKZh0q3vxXs1Mc4cm1nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kSHjCpCO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kSHjCpCO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39701F000E9;
	Wed,  2 Sep 2026 08:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788337522;
	bh=V4cjnEZHVqF64iKTgnAiV3FLLJ82RwZm/qh1EbR5VhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kSHjCpCOSziJ58UY/b8x/YAN0OUlrlTv+OxsWT9VE/ubKOWxLVQ/NlvDnTUs9YyoX
	 aeJ0qMF09xV/0lAedo/xJEjVsMG2Flf9nznaor0+zGRGPxHdhMFOlLqbS5/mZOOOv1
	 IitvzX/03CInPoKuYomZXLmzoCYwZzZ0BVCbMPQ83cCD/TcLc1JxUbYWaXlTVHfQ7J
	 8IsMu1TOghCiRSkWfMNsfJYIAVpXN8n0dyoJLQQLQueMTAEyJRev5M+/bBmOvpvFKy
	 wUcHPwJ2/MxD8JVuu6y+8bYLj22N0h1M22qeE4h0uafCqf/EUMnDtW+1BeIJn5/X9b
	 3aWpGTanNbXBQ==
Date: Wed, 2 Sep 2026 09:25:19 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
	Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 9/9] firmware: arm_scmi: Validate PCC shared memory
 signature
Message-ID: <20260902-miniature-bullfinch-of-agreement-4e15fd@sudeepholla>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
 <20260813-acpi_scmi_pcc-v3-9-cb6b88b4ebb3@kernel.org>
 <20260824132450.000045ca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824132450.000045ca@oss.qualcomm.com>

On Mon, Aug 24, 2026 at 01:24:50PM -0700, Jonathan Cameron wrote:
> On Thu, 13 Aug 2026 12:33:04 +0100
> Sudeep Holla <sudeep.holla@kernel.org> wrote:
> 
> > Validate the PCC shared memory signature when setting up an SCMI PCC
> > channel.
> > 
> > Reject channels whose shared memory signature does not encode
> > PCC_SIGNATURE combined with the PCC subspace ID, so misconfigured
> > firmware is caught before the transport starts using the shared memory
> > region.
> > 
> > Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> Interesting there aren't more checks on this in the various PCC users.
> Question for another day perhaps.
> 

Tried cleaning up all but some platforms like Hisilicon kunpeng complained
it will break their platforms. So added a warning in the core but I want
to enforce stricter check here for SCMI PCC.

> Seems correct to me.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> 

Thanks!

-- 
Regards,
Sudeep
