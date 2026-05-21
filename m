Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D86E36F8EE;
	Thu, 21 May 2026 16:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779380781; cv=none; b=JyMMscGKlXQljFHgFC36Mrgcg5FrV9QArCKFCOBkoTVaUxLxiQsgqr7fhcjYoTvMHrOAWfhDm4iGp143SV2diM+2ENfjzN/Mrif5sqiimTOoJle9yEB8djEZ7JlI49dlF/9Q/9OjCrdD7FkXdeZhM3vCrbf7mDaUuW2ipZwCKlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779380781; c=relaxed/simple;
	bh=j++7hljezKXML5HUtkPlCEvwTOdmoIUBREOMWVbB6I4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXEiDn2vVn8YrQHwOB8XU0bKDLbOkxQOPKlevVFjfNlCdVUzj2C8USErdQr4+wM0w4c/1btjdIxETbU5v15SN/+si6aiaXgWCpY5CMSwhDL23iv1LMSAzcGrNYwmcEwF2z7967Le1Kaoy21XJZbzCOrUcJ3t9JyxEfc1TONGKac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IZIOmK2x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZIOmK2x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A7E51F000E9;
	Thu, 21 May 2026 16:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779380779;
	bh=ATzsR08xkxxmP0oKAz5Eu3T3oucBynDdLnl6uo8rnng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IZIOmK2xZE31Nai9izZcaqnvJxgfX5OB3BgVGn5cwr6KiVStO2gEUQNGCRpQm7k8E
	 l3Ppqjcd5N+YTn5cAqum3BSrDJxUw8fJiLYo4qPuxxUZNtirh16qiieep3BFEn1ONM
	 lO9HFuPkaPXfaEMY0B8Ye5WKDAExUnTiVgR2K8mS/2BL9HoVVLQOD1UP9h9pfIXRWi
	 qLf/9RuNWBOoa7ZOxF3Oi+hu1vlsh2eT/daKPkSNtNnW5e1Z8mtIbhTrCz8ZCwmAbL
	 RezC+Cz7+bz+H1v+a/JCQBocXaTjJ5mDaqk3HAq7RR+KGfSuCaeVn5QTEsyqT0b/Ei
	 qSxeWYZCNdN1A==
Date: Thu, 21 May 2026 17:26:15 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Fix OOB in scmi_power_name_get()
Message-ID: <20260521-loutish-lurking-koel-229bd9@sudeepholla>
References: <75caae28bdffb55199a0bc6cac5df112a966c608.1778838987.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75caae28bdffb55199a0bc6cac5df112a966c608.1778838987.git.geert+renesas@glider.be>

On Fri, May 15, 2026 at 11:59:15AM +0200, Geert Uytterhoeven wrote:
> scmi_power_name_get() does not validate the domain number passed by the
> external caller, which may lead to an out-of-bounds access.
> 
> Fix this by returning "unknown" for invalid domains, like
> scmi_reset_name_get() does.
> 
> Fixes: 76a6550990e296a7 ("firmware: arm_scmi: add initial support for power protocol")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/firmware/arm_scmi/power.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/arm_scmi/power.c b/drivers/firmware/arm_scmi/power.c
> index 3aa84ceb6d2bab68..4a7215e02dec035d 100644
> --- a/drivers/firmware/arm_scmi/power.c
> +++ b/drivers/firmware/arm_scmi/power.c
> @@ -204,8 +204,12 @@ scmi_power_name_get(const struct scmi_protocol_handle *ph,
>  		    u32 domain)
>  {
>  	struct scmi_power_info *pi = ph->get_priv(ph);
> -	struct power_dom_info *dom = pi->dom_info + domain;
> +	struct power_dom_info *dom;
> +
> +	if (domain >= pi->num_domains)
> +		return "unknown";
>  

The only user of this function must not call it for domain >= pi->num_domains.
However, I am thinking if it is bit inconsistent within SCMI core now. I like
the way pinmux/ctl handles this as I don't like the alternative for this
(i.e. ERRPTR(-EINVAL or something)). Worst case if this ever causes issue
we can change the signature of the scmi_{power,reset}_name_get to follow
something like pinmux and update the users. Thoughts ? Happy to apply this
for now.

-- 
Regards,
Sudeep
