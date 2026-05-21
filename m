Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B4617557E
	for <arm-scmi@vger.kernel.org>; Thu, 21 May 2026 14:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779372616; cv=none; b=Szk+193go6NPIlI5HNDPAkUhDoh398Lc64N6XYTTgnM5xTqwthoC8xVbNQhqVLbDyVTiUKjjgnxGbaDHmSuci2sduk/ha4a2dkp+zr16sJW0kH8dDIlkQVyNTYRf78WjhWRrut6tq6odSDCB+9CrScrgb9hF9UUDaO+CnINzkoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779372616; c=relaxed/simple;
	bh=OJw1tzdVjROWxfXGfsdAM3fxET9PyJrGpGI0xqltnzs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WwUTOZIghZQG9Tdkm0riIrj1s+XNVAR7uKl/Ha6pZ5hLgx89lAXhuDMWRkGt8TnCecpDTFpvQBQAHeOrZek+1DFN84gjHAsSBiuiDLp2+1ZxTOMURUHkLWByyM6zIzoPcz5NtWSJayFvk7QhDVhAKruqCzSsEk15quPJuqcEjJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ns1WJZVp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ns1WJZVp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA4E51F000E9;
	Thu, 21 May 2026 14:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779372614;
	bh=35YDvwp6F7I9fGWtxxPA64fKKS1ajDvwVmVIBA8od1I=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ns1WJZVpavHrIUNHeOW4iduOWaGxq0oKE5bgpyOw+B5feDr7ucpneCQ1hIxzCKh3H
	 tIbW78UIk2L7tuXjlE1eZ1kwGf8+izoxlCGf3JpU3To+xXsATRlA/FklVelpPLo+RP
	 BqRvm1DlmAC8fFjWBeBbjvclibvI3Pd3H2iLLMf4L2VCZRhh1rAjNir6k2o+W/PXP3
	 VKCXvjSjn4CMGqPDJdN1pKtikkoiYiIr9LOMOdKeIehFQyvWUGz5yYrMH45ytXllfq
	 +2nrTB9c75b/hsNRCGpQ0dk6T2oEcoPnL+Akf1ODakD4RipHfN4cOm7QuLZsq82G60
	 SFcFydFv4q0FA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH 0/4] firmware: arm_scmi: Fix protocol parsing and validation
Date: Thu, 21 May 2026 15:09:05 +0100
Message-ID: <177936870652.1992706.7312445035946256503.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517-scmi_fixes-v1-0-d86daec4defd@kernel.org>
References: <20260517-scmi_fixes-v1-0-d86daec4defd@kernel.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 17 May 2026 20:02:39 +0100, Sudeep Holla wrote:
> This series fixes a few SCMI protocol parsing and validation issues found
> while checking the driver message layouts against the SCMI specification.
> 
> The first patch fixes a clear response width mismatch in SENSOR_CONFIG_GET,
> where the driver requested a 4-byte response but read it as a 64-bit value.
> 
> The next two patches harden notification parsing for variable-sized payloads.
> BASE_ERROR_EVENT and SENSOR_UPDATE both carry counted trailing arrays, so the
> received payload size must be validated before copying or parsing those
> entries.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!


[1/4] firmware: arm_scmi: Read sensor config as 32-bit value
      https://git.kernel.org/sudeep.holla/c/f6fe7c3c007d
[2/4] firmware: arm_scmi: Validate BASE_ERROR_EVENT payload size
      https://git.kernel.org/sudeep.holla/c/56e7e64cdd0e
[3/4] firmware: arm_scmi: Validate SENSOR_UPDATE payload size
      https://git.kernel.org/sudeep.holla/c/32bc5496b481
[4/4] firmware: arm_scmi: Validate Powercap domains before state access
      https://git.kernel.org/sudeep.holla/c/fcca603c6a09

--
Regards,
Sudeep

