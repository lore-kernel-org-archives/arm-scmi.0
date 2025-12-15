Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6064032A3D9;
	Mon, 15 Dec 2025 07:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765783860; cv=none; b=N+GvtP6KGi5l8pRpak+xLxN9jQlCga28erfdL0xjqGSioBmUuJ2eCYF2iFYQmIzF9uvingEKsvuwPDmPaoTjS3vvpQQrvHQ2/lPsdrYH9t0iG0+rxRT/lvb5BhQJj9PobtSJOA6THHp6OdicvdoTgAGHOXzew4s0Na057AIZ2UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765783860; c=relaxed/simple;
	bh=cqq1WygF8ip5+I3ALGpTWCHJxLIkscoD9iWmQBjY6nM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eT5NkNZG/K5GlazhaaaIVx1zomlLV+CQzCZ8Ac7iNseXjDOgrhkKYDX3j7kLVDMkSnSS487yviyzxEF9/3eFHj0anM3t+H9vV2YjoPLbKPROsSya3xkDTrDer2qH+DDA/GuW6nwbhqLRhqtCqvtOc1IXmYaJaV9QMmcEK18lkUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZrA4UstO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZrA4UstO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7B64C4CEF5;
	Mon, 15 Dec 2025 07:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765783860;
	bh=cqq1WygF8ip5+I3ALGpTWCHJxLIkscoD9iWmQBjY6nM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZrA4UstOic+82ZQ4QSHC9C0T1gI6cYX954HpmrwHKcD0bjXFaQ07vWKYx87oWaieZ
	 RygMFS8ccA2HDovmZSHXRxNsXf3CVsgXBaJdf/nbljauPpORCr9teJSXj9d78KMwC9
	 hX3hnGk0a5hQFzURbc0FWdxluJ8GOYjBK0IigLzJgOV5TwSAOoUGce12h/lCjpdwzF
	 kYBAM8040hIzCpZdlZVgmAFhqNVQRd8b3xeIvCX3deUBhU2YEmM9looCLG+qKm8X85
	 ywxgFZsHpxfQrXL9Z2W6T255EE10AptzXxi5eZWqgkfLMG9flkuypf0fpbjCh/wS8d
	 wCBwm21PClo1w==
Date: Mon, 15 Dec 2025 16:30:54 +0900
From: Sumit Garg <sumit.garg@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Cristian Marussi <cristian.marussi@arm.com>,
	op-tee@lists.trustedfirmware.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 10/17] firmware: arm_scmi: optee: Make use of
 module_tee_client_driver()
Message-ID: <aT-5LtYnLSF_MwW4@sumit-X1>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
 <537c48e3db243b5c68c3192179a948efb3a180c7.1765472125.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <537c48e3db243b5c68c3192179a948efb3a180c7.1765472125.git.u.kleine-koenig@baylibre.com>

On Thu, Dec 11, 2025 at 06:15:04PM +0100, Uwe Kleine-König wrote:
> Reduce boilerplate by using the newly introduced module_tee_client_driver().
> That takes care of assigning the driver's bus, so the explicit assigning
> in this driver can be dropped.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
>  drivers/firmware/arm_scmi/transports/optee.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> 
> diff --git a/drivers/firmware/arm_scmi/transports/optee.c b/drivers/firmware/arm_scmi/transports/optee.c
> index dc0f46340153..8fdb80d3fabd 100644
> --- a/drivers/firmware/arm_scmi/transports/optee.c
> +++ b/drivers/firmware/arm_scmi/transports/optee.c
> @@ -612,23 +612,12 @@ static struct tee_client_driver scmi_optee_service_driver = {
>  	.id_table	= scmi_optee_service_id,
>  	.driver		= {
>  		.name = "scmi-optee",
> -		.bus = &tee_bus_type,
>  		.probe = scmi_optee_service_probe,
>  		.remove = scmi_optee_service_remove,
>  	},
>  };
>  
> -static int __init scmi_transport_optee_init(void)
> -{
> -	return driver_register(&scmi_optee_service_driver.driver);
> -}
> -module_init(scmi_transport_optee_init);
> -
> -static void __exit scmi_transport_optee_exit(void)
> -{
> -	driver_unregister(&scmi_optee_service_driver.driver);
> -}
> -module_exit(scmi_transport_optee_exit);
> +module_tee_client_driver(scmi_optee_service_driver);
>  
>  MODULE_AUTHOR("Etienne Carriere <etienne.carriere@foss.st.com>");
>  MODULE_DESCRIPTION("SCMI OPTEE Transport driver");
> -- 
> 2.47.3
> 
