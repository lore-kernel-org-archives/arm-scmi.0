Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793311543;
	b=umCL9DzsgBn2vNtY07bpHpv1tOQrmYe7YBF+GeK/0LojxRlgtVegwMvThWGCy7ZOP8ay
	 WQZuSz/JMLHpFuPe19LM0yM0EM1e/pJWr9sTG5gCPixApmkWSttATQoDAJVpvVO/B9rtw
	 VV0bNJsWzzMvlIxkZ5SG3/AzNEiA+DaUmnYAHQHTALTr6Suz46ZwCFzv23Nrd6FcB08Jw
	 91Ur2aByOUzFwCCnPDKxOFqKPXI3YZMNKGH9AFqNWHCnqdwfA6Ff4HsB+9Y3Q27J0cP1K
	 fxyLGqQjdJe5S7PHw82xusNgYwDZABgOyWoqhtvZIIYxeHfK+xx7xvc5+7DvkOdWx6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311543;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=7M/wxxdndP3E2ZjYh6p7rGr91d6BR8M0XyDE1EyLxu4=;
	b=G1Y/gGvqqNtqKn7NedEXXpdHAAccNzIF2VZgTDJPEQV+76WwWGO1BONcJEhv/zmIdugc
	 4Y4BoIYrGHd0EDxiizpSk6LYo8va+zRbMHs7UbpadNcaFHJdYY7srCG4xNSPjSwsu6t59
	 0G7z9k2XeHdNXXJAptzW+Y58TfitkUHkQmnOaH1JyinId5vaU8g1kNS0NRAUjNS9fGoEc
	 iPYWnL3nPd7xjm1wrT6Quh53sXfwyqU28lmZlCx7Ju3hTfXJqfCBog6Ht9gAZXNWGUEpA
	 PkAzwdD8fKgtH5EN0Mk1zqHz6m87V3eZ1emlvrRpfJ+oGetRq/3iyJYf/SIr7iMB8Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Jj4Da+y3;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73E8606A31A
	for <arm-scmi@vger.kernel.org>; Thu, 29 Oct 2026 22:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D73E8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Jj4Da+y3
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F46215A1;
	Thu, 29 Oct 2026 15:05:39 -0700 (PDT)
Received: from e121740.arm.com (e121740.arm.com [10.33.8.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CE633F673;
	Thu, 29 Oct 2026 15:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793311542; bh=XL7lVmGkH9v0/AlI6TLawa7TNgDaqN/Y1Le1BKA4gl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jj4Da+y3lg20pAKDtXJgsekBy9S+JVIFGSkTQqDm1yPiLKR2RHE7ntUg0CNWxLsic
	 LZLIWeG8W4Y2hhPislXQSAgALDdIgwloGgWvu42h8uMNusKjYvxaEHj8s1vLzoy3Zk
	 c4lbJU/PpFGIaGf+IOIbkPnFOUTgj5LhbglkebXk=
Date: Thu, 29 Oct 2026 22:05:31 +0000
From: Philip Radford <philip.radford@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	Peng Fan <peng.fan@nxp.com>, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 2/3] firmware: arm_scmi: imx: Validate MISC control
 response size
Message-ID: <auPDK9bG/H8GTOK5@e121740.arm.com>
References: <20261028130502.2999676-1-sudeep.holla@kernel.org>
 <20261028130502.2999676-2-sudeep.holla@kernel.org>
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
In-Reply-To: <20261028130502.2999676-2-sudeep.holla@kernel.org>

On Wed, Oct 28, 2026 at 01:05:01PM +0000, Sudeep Holla wrote:
> scmi_imx_misc_ctrl_get() uses @num to report the number of
> values returned by firmware, but it did not retain the caller's value
> as the capacity of @val.
> 

Hi,

> A response with more values than the caller allocated was copied into
> @val unchecked. For example, the MQS regmap callback supplies storage
> for one value. Retain the input capacity and reject responses exceeding
> it before copying, then update @num only after a successful copy.
> 
> Document the in/out @num contract of the exported helper.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-6897b44a-57fb-4964-95f8-447d0ce526e4
> Fixes: 61c9f03e22fc ("firmware: arm_scmi: Add initial support for i.MX MISC protocol")
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c  | 16 ++++++++++++----
>  include/linux/firmware/imx/sm.h                  |  6 ++++++
>  2 files changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> index 0c708b2dd496..f00f7acba845 100644
> --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> @@ -273,10 +273,16 @@ static int scmi_imx_misc_ctrl_get(const struct scmi_protocol_handle *ph,
>  {
>  	struct scmi_imx_misc_ctrl_get_out *out;
>  	struct scmi_xfer *t;
> +	u32 num_values, max_values;
>  	int ret, i;
>  	int max_msg_size = ph->hops->get_max_msg_size(ph);
>  	int max_num = (max_msg_size - sizeof(*out)) / sizeof(__le32);
>  
> +	if (!num || !val || !*num)
> +		return -EINVAL;
> +
> +	max_values = *num;
> +
>  	ret = scmi_imx_misc_ctrl_validate_id(ph, ctrl_id);
>  	if (ret)
>  		return ret;
> @@ -290,16 +296,18 @@ static int scmi_imx_misc_ctrl_get(const struct scmi_protocol_handle *ph,
>  	ret = ph->xops->do_xfer(ph, t);
>  	if (!ret) {
>  		out = t->rx.buf;
> -		*num = le32_to_cpu(out->num);
> +		num_values = le32_to_cpu(out->num);
>  
> -		if (*num >= max_num ||
> -		    *num * sizeof(__le32) > t->rx.len - sizeof(__le32)) {
> +		if (num_values > max_values || num_values >= max_num ||
> +		    num_values * sizeof(__le32) > t->rx.len - sizeof(__le32)) {
>  			ph->xops->xfer_put(ph, t);
>  			return -EINVAL;
>  		}

Why does num_values have to be less than max_num, can it not be equal to? Isn't max_num
already smaller than max_msg_size due to the initialisation above?

Regards,
Phil

