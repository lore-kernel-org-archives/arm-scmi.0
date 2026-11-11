Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794399070;
	b=NqZJhQ5C79Do+jDXsr1Q98aCL3nUY+HU/bQqIRUJ6lRsmdQuUeNDvemc7wdDMG5QdioB
	 7CZzlneOzd/pbi2kV660Zds0OwL+G0wE3AOodt8vEKv6g2/Z/COvLA8mEU8hq1tD3xpe9
	 8G4BzLfUPuSOx7MrJTHaQWAvBZb7M5dZEI+l7+hoTPIWa2kH1C8R9F/pd565dtE4S5/fw
	 ggAXCz16XNsn5edLp83UR02UpLH6M0r1lkclXzUJd26HZNrdSXDQbDFRPCsMHXCPnPvZi
	 +dieYTz9pTr+QnVxM3wR4zrvaCJmUDgCEvw/5eBVQLiNLZwN1fHoCbFCWIdxdz18Igw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399070;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=dJWrFakGMncVSTy/NQFStPBZpGIW9Ki1okE14NbXwPs=;
	b=t7SxCNgrf/CbDgxlHvQXDhRsYhXWeBa7rf+CHw5YvhUnt0OnGiJULFKvfNj4tfxyZH8O
	 phGQ/jFLyIHO1hULKQ/46Ya7V/7HOU/HKenktMuCpZK9408u8b3jiNQ9UC8Y5QXGRsvgP
	 B5VHBVCPRdKI7IJ0bw4QH2RcxGJD/LrZHdN0P5vVw8ra/drz/9HyRyw0GFPgP8oGMosQl
	 WvGVEwg4ywbOmFrytPjLEI4hDEDugKvsjFJmUkLnYi/yCqVE8Ifk9prdTvaFzfJOj71Hm
	 Uv6yRsPrY2u2TwwDcVdI2W9a5RaUPE/EK7q7ajBgt2hZOgu03rey9DR6rhYQrem3+3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cpQVBU6N;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583AE606A324
	for <arm-scmi@vger.kernel.org>; Wed, 11 Nov 2026 12:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cpQVBU6N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFC481F00A05;
	Wed, 11 Nov 2026 12:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794399069;
	bh=dJWrFakGMncVSTy/NQFStPBZpGIW9Ki1okE14NbXwPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cpQVBU6NMCFOTQdQqKnS4QOAbb9h6o+v8KQTiQ1P1rDmux9bWmCLLwmYmiWIdiJGZ
	 TrKIwzDRg0KzxZxu0wBXzwStKE2tatm97dy9GcbJQ9+EVn7mvWquyAJ2y21OTT183Y
	 mkFZxnbTqrdFCvSrEB5P8dd/d5cC9uquFJ2of9OLHw8czpnyKPoGVCv4DqVO82fNkk
	 WiHuu3YSRArQ95SRRMyoKSgez2V6nDBI2DOWUYQFcaUjmLHeLLkqY5cxmrhfweclla
	 jKfQMHRi3qh842sZt9huYLDzpS3H+ZXnya16llu51WvK4WB0e3IsMe/ZFhV36oltoH
	 9SeoazGv1cdzA==
Date: Wed, 11 Nov 2026 12:11:06 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH RESEND 1/2] pmdomain: arm_scmi: Skip domains that fail
 initialization
Message-ID: <20261111-busy-silent-whale-950f5d@sudeepholla>
References: <20261109155332.1686594-1-sudeep.holla@kernel.org>
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109155332.1686594-1-sudeep.holla@kernel.org>

On Mon, Nov 09, 2026 at 03:53:31PM +0000, Sudeep Holla wrote:
> pm_genpd_init() can fail while allocating generic power-domain state.
> The SCMI driver ignores that error and stores the partially initialized
> domain in the onecell array. Provider registration then fails because that
> domain was never added to the global genpd list.
> 
> Preserve support for partially available SCMI power domains. Log the
> failure and leave the corresponding onecell entry NULL so the other
> initialized domains remain available. Explicitly skip empty slots when
> unwinding provider registration failures.
> 
> Fixes: 898216c97ed2 ("firmware: arm_scmi: add device power domain support using genpd")
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> ---
>  drivers/pmdomain/arm/scmi_pm_domain.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> Resending
> https://lore.kernel.org/all/20260923101608.4180057-1-sudeep.holla@kernel.org/
> 

Hi Ulf,

Gentle ping, not sure if it is landing somewhere else in you mailbox,
just putting your address in To: now and trying.

-- 
Regards,
Sudeep
