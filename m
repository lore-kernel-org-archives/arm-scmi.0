Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4798732E756;
	Mon, 15 Dec 2025 07:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765783982; cv=none; b=hoecTAU+LJzDWjRdC6sY0xvRbXGl70kJscc6E6FsOr9JLgA4FK4rrr396Thqkc5BzNtOKGhZPdp0gTtSPMBWAyLJW3W7IaxZEqhY5496KKIMU1OvqZyYCCMji5kz66KnxzGpE350CfSMr9z82qzMpr6Axx4+UBDbha3vZN3TU3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765783982; c=relaxed/simple;
	bh=BA6xeU5bsb5CEAuSg7p2q3xijPwECww0M/yOXMPnGRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q6eU2Ee5RP/HM8O4b43UY2U/pCfAQnCsInazDfIXFaX7CZOThcWlsKUdCoi47Yai7+1k0vz3AkoZ5AJaYskbGmu00M5y0XkVHTTO9cuScSjtT2H+UmF9Vw8z0pupJpr6jdoyJMGuYGGy+B6mp8BaSSZvs/4ct+1b3f5mj0zvmjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W8Z3NaTa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W8Z3NaTa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C51C4CEF5;
	Mon, 15 Dec 2025 07:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765783981;
	bh=BA6xeU5bsb5CEAuSg7p2q3xijPwECww0M/yOXMPnGRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W8Z3NaTaapjPXXOknD7a6ed7PNFUNruwaceXiDABCUWBOPYY86MVGVfghoXYhtEnK
	 nG6cX6w2tYV84SRnuAr/kVxjqZfh4GuLXDkQs+VUSRJ1/yFY5T6gqhLUrz9mkiIpD2
	 5paRRwHe6Gc/9bkWhd70Aldnu+830DoJzm+KY9CLMrod+26ypQmfMeF1gipronNxbg
	 EkP1UNDJgzrWdhSaK5nfa00j1oe13U1i//iKiQrVjjF615EpcIzoaHeveeQ5Yxom47
	 i34Jb1nQ2WE/8MlzUScV5WkkYVKzU5in6og5SUieZSvy1dOTADm5Cp25S+B16yMkIF
	 A4oE0uIJQzEQQ==
Date: Mon, 15 Dec 2025 16:32:55 +0900
From: Sumit Garg <sumit.garg@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Cristian Marussi <cristian.marussi@arm.com>,
	op-tee@lists.trustedfirmware.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 11/17] firmware: arm_scmi: Make use of tee bus methods
Message-ID: <aT-5p7FTvNU8jcLU@sumit-X1>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
 <46dae3cada663b3a5ae1989881d9e74ef40acce5.1765472125.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46dae3cada663b3a5ae1989881d9e74ef40acce5.1765472125.git.u.kleine-koenig@baylibre.com>

On Thu, Dec 11, 2025 at 06:15:05PM +0100, Uwe Kleine-König wrote:
> The tee bus got dedicated callbacks for probe and remove.
> Make use of these. This fixes a runtime warning about the driver needing
> to be converted to the bus methods. Note that the return value of .remove()
> was already ignored before, so there is no problem introduced by dropping
> the error returns.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
>  drivers/firmware/arm_scmi/transports/optee.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> 
> diff --git a/drivers/firmware/arm_scmi/transports/optee.c b/drivers/firmware/arm_scmi/transports/optee.c
> index 8fdb80d3fabd..07ae18d5279d 100644
> --- a/drivers/firmware/arm_scmi/transports/optee.c
> +++ b/drivers/firmware/arm_scmi/transports/optee.c
> @@ -529,8 +529,9 @@ static const struct of_device_id scmi_of_match[] = {
>  DEFINE_SCMI_TRANSPORT_DRIVER(scmi_optee, scmi_optee_driver, scmi_optee_desc,
>  			     scmi_of_match, core);
>  
> -static int scmi_optee_service_probe(struct device *dev)
> +static int scmi_optee_service_probe(struct tee_client_device *scmi_pta)
>  {
> +	struct device *dev = &scmi_pta->dev;
>  	struct scmi_optee_agent *agent;
>  	struct tee_context *tee_ctx;
>  	int ret;
> @@ -578,24 +579,22 @@ static int scmi_optee_service_probe(struct device *dev)
>  	return ret;
>  }
>  
> -static int scmi_optee_service_remove(struct device *dev)
> +static void scmi_optee_service_remove(struct tee_client_device *scmi_pta)
>  {
>  	struct scmi_optee_agent *agent = scmi_optee_private;
>  
>  	if (!scmi_optee_private)
> -		return -EINVAL;
> +		return;
>  
>  	platform_driver_unregister(&scmi_optee_driver);
>  
>  	if (!list_empty(&scmi_optee_private->channel_list))
> -		return -EBUSY;
> +		return;
>  
>  	/* Ensure cleared reference is visible before resources are released */
>  	smp_store_mb(scmi_optee_private, NULL);
>  
>  	tee_client_close_context(agent->tee_ctx);
> -
> -	return 0;
>  }
>  
>  static const struct tee_client_device_id scmi_optee_service_id[] = {
> @@ -609,11 +608,11 @@ static const struct tee_client_device_id scmi_optee_service_id[] = {
>  MODULE_DEVICE_TABLE(tee, scmi_optee_service_id);
>  
>  static struct tee_client_driver scmi_optee_service_driver = {
> -	.id_table	= scmi_optee_service_id,
> -	.driver		= {
> +	.probe = scmi_optee_service_probe,
> +	.remove = scmi_optee_service_remove,
> +	.id_table = scmi_optee_service_id,
> +	.driver = {
>  		.name = "scmi-optee",
> -		.probe = scmi_optee_service_probe,
> -		.remove = scmi_optee_service_remove,
>  	},
>  };
>  
> -- 
> 2.47.3
> 
> 
