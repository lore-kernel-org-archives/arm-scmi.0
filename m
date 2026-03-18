Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183F330F80C;
	Wed, 18 Mar 2026 15:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773847508; cv=none; b=hxuLauij8J8BZHfgb7wiKOYoix4VKkZd9pYOpvTuCpW+PpDpcMn79cfTKV/KHXcrRXIPxY7zcFGVyzbQQwk2lgcxooiLqirLgy2oI72MIegarOGTgvZMCumsFJaeRyz3zYrWA12GbaHwaalpKp6ZYx8sKy48PF+I07JPo0qpWTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773847508; c=relaxed/simple;
	bh=nxhXPh3vQNUIoVu+t7BQIF5HZ0lldKFWGEMR6X+FJuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y5iTIgwkEK/6RGy8K5Xgf8yvr4EtsohaFK7Bs7lqpfjOnspD/Z3tbbzOkSlLiWaGLFPyjAWXML3gqcSWgVm5qjnTE3F84rAFMweOIlF0ei2ZjyryO77PpL7wcUMZFsKS6hpFPInZh4H8l4E8bz+zu9hmVVKlK3KMT71T/IqRiXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fgC+yxsY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fgC+yxsY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76040C19421;
	Wed, 18 Mar 2026 15:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773847507;
	bh=nxhXPh3vQNUIoVu+t7BQIF5HZ0lldKFWGEMR6X+FJuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fgC+yxsYUq8NVj+WWQyM2OlwtE3LCphfH9SCKX5ECbV7Ypz8ZP1NnpY3wkZ4B/X3V
	 BurNtscpTZ+4p8jYjdiWEduW8LrdYlsFgjMpuCfx3Iflf83UirRTgewOIgi4ZVdAfZ
	 fhaiWnt01Xajdg4pF5HI9dt9WEHshQgCEAXVBS7R/9wbfrL4t6jR5+EuOLy5rZiI1R
	 OrWQIJu9Hh36zzaZqsN82kun+69iTHqpw1K+nDXI90SgqW26v25PKHme90VTPii4ZI
	 SVb+mKC+4zZWcOWOHxlQ41yWVtXlFUfz50NNWHxlx0Ec5CPYHH4Fj7VPV6l0VnmuQ3
	 Ohyz9v31Micgg==
Date: Wed, 18 Mar 2026 15:25:03 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/2] firmware: arm_scmi: imx: Support getting reset
 reason of MISC protocol
Message-ID: <20260318-savvy-courageous-mule-b3f9ae@sudeepholla>
References: <20260305-scmi-imx-reset-v1-0-18de78978ba9@nxp.com>
 <20260305-scmi-imx-reset-v1-1-18de78978ba9@nxp.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-scmi-imx-reset-v1-1-18de78978ba9@nxp.com>

On Thu, Mar 05, 2026 at 09:56:44AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> MISC protocol supports getting reset reason per Logical Machine or
> System. Add the API for user to retrieve the information from System
> Manager.
> 

Sorry for missing this earlier. It looks good though my usual rant is that
this MISC protocol is becoming never ending dumping ground for all sorts of
info you want kernel to dump in dmesg. Anyways, I am not too bothered as it
is not any user ABI.

If, you plan to ask i.MX maintainers to pick this up,

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

If not, I need their ack for 2/2/

-- 
Regards,
Sudeep
