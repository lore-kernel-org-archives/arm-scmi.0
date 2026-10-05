Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCE43C1087
	for <arm-scmi@vger.kernel.org>; Mon,  5 Oct 2026 08:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791189056; cv=none; b=AY9XESZmsgdqlfYJlU4AG4MpKCtgUQ5w6Sk4idGAkw7wKb8l+n72vd3GPgFsRbTJ1e96q7ct5rFYgZ8/q36Pru7RtiW44eUU29wsMMAvJM7809+k39KsRY8tvdoDrDJVqyQFOZhdZV1DnDSuD6KsqYZ78Ln/2s2/yPmVvFKOf3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791189056; c=relaxed/simple;
	bh=O+yUWZTCgpHLDEfDhnu6xkubjb9+dTBZ0p2iv6XWoZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m43tVqXWbgMWoDql5IJP/dlFD0Kmp9PfcywJYDNaBwmHNgh0C+x0A2TgbRE0Tv4d/QC6MwFhYkkMOtzcPlnCyzfTWV7+ykk6jO2BCIEXQuoJFFx1T6hVuooqxhwc9Yptx14a1SYY/3SVEn1eRAzmIyDT+fGRDFclV0zNQqlVA04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VEi56WQl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VEi56WQl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFA7A1F000FF;
	Mon,  5 Oct 2026 08:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791189051;
	bh=AHRJeNmG2ZJhrqQmjhop1kqAz7uZY2DcY++vK/kXQfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VEi56WQlTRXgfffrhn50tBqMIymjtMnpvgVMHqggXVreO2UserT4KbV+UueBcTzlR
	 apVIAQGFM+ER/eFumYj+wCJfGJBkGuw7fomf6IR4eUfbfXzqSZjl74qDPBYXcGBcpJ
	 G3/FnpIJDSCaOIjlM4n4w0VLjWC03/YsFoF7aXCDlQ+AxoIWipXL26XzeA0l3izS70
	 PculxufUfft/6mxGNi4HY82flfz1COo9jyn2KpwjcSBk41GPFnO/ZxzzsLwxkVtncL
	 juuzhTHFkHFNrpGVyG7BPsz+DGdBp/9f21Q/q0ltpO+iaLztdDhCMz6HtgUg3gqJJA
	 wqpQPy9HPzcCQ==
Date: Mon, 5 Oct 2026 09:30:48 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: arm-scmi@vger.kernel.org, Peng Fan <peng.fan@oss.nxp.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH 2/4] firmware: arm_scmi: Skip requests for standard
 protocol devices
Message-ID: <20261005-elegant-straight-potoo-adadcf@sudeepholla>
References: <20261002-scmi_bus_fixes-v1-0-8695cbab3fe7@kernel.org>
 <20261002-scmi_bus_fixes-v1-2-8695cbab3fe7@kernel.org>
 <d1474169-bf2c-486c-91f1-3754638dbe0e@oss.qualcomm.com>
 <20261002-immortal-normal-nyala-a9b6ce@sudeepholla>
 <d1307d5e-975b-4a4d-b810-d295a1ecd109@oss.qualcomm.com>
 <20261002-swift-of-massive-greatness-ca8ebe@sudeepholla>
 <792f60f7-3b8d-48a1-bf4a-c356bf63ceec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <792f60f7-3b8d-48a1-bf4a-c356bf63ceec@oss.qualcomm.com>

On Sat, Oct 03, 2026 at 03:13:42PM +0200, Hans de Goede wrote:
> 
> Ack, as I said above if we want to allow multiple drivers claiming the same
> device-id. Then this patch is fine as as.
> 
> With that resolved, the patch looks good to me:
> 
> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> 

Thanks, I may repost with no change just to see if sashiko grabs all the
patches correctly and succeeds in reviewing unlike this version.

-- 
Regards,
Sudeep
