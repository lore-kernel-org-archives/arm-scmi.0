Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BB43EC2EA;
	Wed, 27 May 2026 09:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779873841; cv=none; b=MpDNfWJoxtXhBpLAVP3/10qKJ+/IJprUxcblyx1xQuRHXxg+O2zai0vp8shTWExJauS/OdgM7b3W1ESPu5TGAMT60IeCyVqUCUSl4+PexuhOhJ5QnBR5JsUulZpRhUPqPNgVSYykR643WYYq/mMmzseL3PXWBJPe32ZVizSiH28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779873841; c=relaxed/simple;
	bh=GxMtrspK4JjWxiPCyRBKuL/N51uWiOsxFoUVCVCoBSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LXTp0OnCgzvQ2U/dwJxbmLeYwfwCWjWRRXGx0UHemW5FT+kLRZFffa4ZQkuLWnojis6IvXbMF4eboC9Efa6PX2dSYR5BxnH/+EW+RS3K/gzAn7nfrFwQaEvRvJJ5vk51OaU+ZfHl+yNJqxkSA+B1qXx9CuGL880vfgdrSI8G0uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fHMjafNB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fHMjafNB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B2C1F000E9;
	Wed, 27 May 2026 09:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779873836;
	bh=MSgZXwm4hvrVwoAJAoET78JUvjtvH8l4XQi9FYyT1AI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fHMjafNBSazwaUmfT3nMZN+WVJk17zpuzdlhKcTZzzCrELfoEgZheDd2dIuP/CMX7
	 T6JE7+jcw6PmXwJ5MEGgM6EEbuqjN2tbuRKnoOfR5c8AnvkIs0hBI2CP/Y2SFiwcIj
	 8DBI9gA7KLPY61Gvkgn58Uli8ZC4qEJdDbzrtjYnaAM33E4p/nr0MOYVuZ/WEgNW86
	 C3dfP0idXB8ac0t/n+0crtEHpaxWbbgX7lZ1rlRqLdCxW5uuyAgQ03+qlwLOZ5Wn2H
	 VlLOH7EtwKhpretUthkHfMrq7zWZAhVLjaNsSvTj6RJbAUrC3gtrrd8oU4KSnYWhcZ
	 M1E8ncE5WL58w==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	philip.radford@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	gatien.chevallier@foss.st.com,
	u.kleine-koenig@baylibre.com,
	dakr@kernel.org
Subject: Re: [PATCH v2 0/4] Rework SCMI transport drivers probing sequence
Date: Wed, 27 May 2026 10:23:50 +0100
Message-ID: <177987374695.279042.10837727890884135101.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260510160527.3537474-1-cristian.marussi@arm.com>
References: <20260510160527.3537474-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 10 May 2026 17:05:23 +0100, Cristian Marussi wrote:
> when the SCMI transports were split out into standalone drivers [1] the
> probe sequence was laid out in such a way that:
> 
>  - the transport drivers would have probed first, triggered by the firmware
>    driven discovery process (DT/ACPI)
> 
>  - afterwards the control would have been passed to the core SCMI stack
>    driver via the creation of a dedicated device that would have inherited
>    the original firmware descriptor (since that same DT/ACPI node would
>    have been still needed by the SCMI core driver to be parsed)
> 
> [...]

I haven't seen any reports of failure in -next with these, so I am happy
to take it for v7.2.

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/4] firmware: arm_scmi: Add transport instance handles
      https://git.kernel.org/sudeep.holla/c/9dfae7d2edb4
[2/4] firmware: arm_scmi: Add a generic transport supplier
      https://git.kernel.org/sudeep.holla/c/ab6eb28a47d4
[3/4] firmware: arm_scmi: virtio: Rework transport probe sequence
      https://git.kernel.org/sudeep.holla/c/c08051901a55
[4/4] firmware: arm_scmi: optee: Rework transport probe sequence
      https://git.kernel.org/sudeep.holla/c/524abd2fa690

--
Regards,
Sudeep

