Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A4E343D71;
	Thu, 26 Feb 2026 11:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772104537; cv=none; b=d1BLFMyqy2AoHAOLz5l7SWfs7iyBczKya/npMYzniS0yTLz0t7ckEvqnqIIZLp12XCa75zfdkqNQAF9nLH5Ej5polngJRUZwhaac351+Q7gJL3mFoTA/bG7WKp6Z1a/aJjIRBNRyZz+1DEk8eXDgSjzCVQxRH1a5Sl0ZpJzhMz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772104537; c=relaxed/simple;
	bh=lvQcx5UOb8i32NzHhDuAg96y4tCRaJKr7eMEL0SWPXs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=TyKVV/kHeKSQoRJRwEKW+dIculf5g5OZnTKYvKXJie1oKGpfmz/QJqgpUQZtAcVW/mMS6bUoaQe9MbONHUrWr2EXZTeY4WD6aMl0Xw5K+VIZQ/+KCcTFPXKKFGlVx5tDtJ8UbT0+ZfTHocWe0FXiwQXgoIpclgNC4gDjl1sD3no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IpWW90QF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IpWW90QF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71969C19422;
	Thu, 26 Feb 2026 11:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772104537;
	bh=lvQcx5UOb8i32NzHhDuAg96y4tCRaJKr7eMEL0SWPXs=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=IpWW90QFrGiwyKsV7+5K4Zr2E2vLzPpA2df0NnUHm+AQOOvRBV0626SYmukIZAY/6
	 Txmj2BHbY4Jc6TyrIrShCLyc6ATt8iFsvzlKXDkYqJZlJqzs1w6JegS2CqwWTZ/sN6
	 omBG1Nfhd6xhSzALDMRO/F+dDKvNn5o23A3ShIQWtG4DMWblNPmAmsA3ei+ZQLmo9L
	 NgNk3ExnIPNdBZv6beLpSI2JD0T68FJm3yzAeWxRTX5t40cxqKmB5wA/4159rxM5Fo
	 G3Xal0PHEiXCM5T32yQnmr39xR0MC6SpEMWmhb5k8dG8HzVyfGvjpevZyPOR5uvrRB
	 Eke7YokVACAFQ==
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Feb 2026 12:15:33 +0100
Message-Id: <DGOUMO3FAOO8.VAD47Q3CKIPL@kernel.org>
Cc: "Cristian Marussi" <cristian.marussi@arm.com>, "Gui-Dong Han"
 <hanguidong02@gmail.com>, <gregkh@linuxfoundation.org>,
 <rafael@kernel.org>, <linux-kernel@vger.kernel.org>,
 <baijiaju1990@gmail.com>, "Qiu-ji Chen" <chenqiuji666@gmail.com>,
 <sudeep.holla@kernel.org>, <arm-scmi@vger.kernel.org>
To: "Gatien CHEVALLIER" <gatien.chevallier@foss.st.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5] driver core: enforce device_lock for
 driver_match_device()
References: <20260113162843.12712-1-hanguidong02@gmail.com>
 <aZ9ZN7H1thCmkPEQ@pluto> <DGOBYS4LNHWW.2JTHJHGQA37C@kernel.org>
 <5a291dbe-de59-4603-a712-40d4edc19aa3@foss.st.com>
In-Reply-To: <5a291dbe-de59-4603-a712-40d4edc19aa3@foss.st.com>

On Thu Feb 26, 2026 at 9:54 AM CET, Gatien CHEVALLIER wrote:
> It may not be that trivial because unconditionally moving it to
> module_init() would not guarantee that the TEE bus driver probes
> before the platform device driver. I think there's a bit more to it.
>
> The platform device driver, as is, is not functional whilst the
> TEE services are not available. Therefore, it could falsely fail to
> probe if probed before. We may consider some sort of API to know if
> the services are available?

Ok, so there are three drivers somehow involved:

  (1) module_tee_client_driver(scmi_optee_service_driver)

  (2) scmi_optee_driver with compatible =3D "linaro,scmi-optee"

  (3) scmi_driver with name =3D "arm-scmi"

(1) registeres (2) in probe(), and the only thing (2) does is allocating a
platform_device with name =3D "arm-scmi", such that (3) is probed.

So, to me it seems that the indirection through a fake platform device is
unnecessary and instead (3) should just have compatible =3D "linaro,scmi-op=
tee"
and return -EPROBE_DEFER if (1) is not ready. Besides that, this seems like=
 a
use-case for device links.

Thanks,
Danilo
