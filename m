Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B5981ACA;
	Thu, 30 Apr 2026 09:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777540432; cv=none; b=meuinCsZsLI3XSebUIDwev5DuouCegDd9WxoNS7XkYQX4tPRpQMsEh7gNzhBT3x4mk1DNP91PuZerWT4JivLY9o4d1uuGTSBh8bmJ70Kbd5j91N8AxIxYwMFQCk/Tq3IxiM29cnaaKgZtMQU3tUqd5PPqleK6uSU4NGXRs+V1qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777540432; c=relaxed/simple;
	bh=UdNB1egWYjpUHiiwp2CFfEtBa7QoII0RZrh0xQbjLGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=chMk4mlW/NWEyqOGOf9MlWZL66WmJtKxHL/7+8twzG/2aKOWsOqTTVSe4y47h9Q+UR/+AGerCvl/sDlaoAsWgruH4TaVidnS/cU+inz1WUQRo8Tep/Bd11WfhVbICwZJRnmyxkOGjL7fJ4VUjhXE1+Mt7FGqKHf3O6KVcn51ffY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RAtE09c/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RAtE09c/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 116A3C2BCB3;
	Thu, 30 Apr 2026 09:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777540432;
	bh=UdNB1egWYjpUHiiwp2CFfEtBa7QoII0RZrh0xQbjLGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RAtE09c/Pq4kL4koWknd9JnUKr6X7YSZn8+aOr84h3F8VuzIw9nGbNfYjzgVOVStb
	 PfZ9zaOTiIdfH7QSRpAadzDY3cLewijCk+xAKzI+08bUll2fq9Ac8VjZg6db9HFPG1
	 bg3amLo6SkLBFzvfr1DGUGaG/7WQ6Ra3wgdcjtvFTtCMd+AfW6GXuFBMv+EXt8mt9J
	 +izL3jjVhVoBhyblugNDVbjqVTz/FELwo9lXE31lUJNQTyOBKUja2qtbICMUob7K0a
	 QeW/C1DlNJOogoiSoUaxU4nLGbvLrdHYhfEKggYjgL2F245krxrYnQ2fnCBkIOAg3t
	 uEfbvQj29D0Qg==
Date: Thu, 30 Apr 2026 10:13:48 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/2] firmware: arm_scmi: imx: Support getting reset
 reason of MISC protocol
Message-ID: <20260430-private-versatile-jacamar-fd932f@sudeepholla>
References: <20260305-scmi-imx-reset-v1-0-18de78978ba9@nxp.com>
 <20260305-scmi-imx-reset-v1-1-18de78978ba9@nxp.com>
 <20260318-savvy-courageous-mule-b3f9ae@sudeepholla>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-savvy-courageous-mule-b3f9ae@sudeepholla>

On Wed, Mar 18, 2026 at 03:25:03PM +0000, Sudeep Holla wrote:
> On Thu, Mar 05, 2026 at 09:56:44AM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> > 
> > MISC protocol supports getting reset reason per Logical Machine or
> > System. Add the API for user to retrieve the information from System
> > Manager.
> > 
> 
> Sorry for missing this earlier. It looks good though my usual rant is that
> this MISC protocol is becoming never ending dumping ground for all sorts of
> info you want kernel to dump in dmesg. Anyways, I am not too bothered as it
> is not any user ABI.
> 
> If, you plan to ask i.MX maintainers to pick this up,
> 
> Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
> 
> If not, I need their ack for 2/2/
> 

I have left it in my -next queue assuming I would get ack if I need to take
it. But I haven't received any, so not sure if I need to take it or drop it
assuming it will go via i.MX tree ?

-- 
Regards,
Sudeep
