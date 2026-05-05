Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429D6156C6A;
	Tue,  5 May 2026 15:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777995441; cv=none; b=VoShI8mlfeHEyAUZPx3v4CwxyiVc255bwdL5k2t8iav2oF2VJqwasHcycb6F0W+XdDEnUMRVer0T2Js7dGEatfH8sOET9N55DVqkpAYNANuuC9wvDH9zcOeAB4yWFsuiuRLN7qsOgGl8rAlG89/CnTFcxwPco5BSm+WbSxmaStE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777995441; c=relaxed/simple;
	bh=q215iWUMbXp86E5trCc9BqE+TbdpfYR9pjH0bK8ACX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XcMCtSuVeAz4icM84LJZhJgZzh+ch/bTVxheaEo+EuTMnaLbZaNi5YtTMGe25fW/qHen70aJ/wWe7W8kxYqfGcx8Q37BUe4oRmNMsobKAsoDKUHefsatfYZag1gnCi9QS/Q90zhCn3k6ovpBKn/iPsbQ4RyfdMR+VWC0TC8rpWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lx8GCC+Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lx8GCC+Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A47DEC2BCF4;
	Tue,  5 May 2026 15:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777995441;
	bh=q215iWUMbXp86E5trCc9BqE+TbdpfYR9pjH0bK8ACX4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lx8GCC+QcC/Jt7eypkdc5f0X8D1DJ8Bx9CC6AD+iLfnZKS+mJmkkaINCKj3mT1KKU
	 8EYZi6tr97PWFJKG5NEHZRPVkfucSEXqv+YPGlUvXyxYXjQxoOZGX8K3Jt95BipM3h
	 Q852FL38q1KEBJIcnEi+9pig3eaAT5GA8UWGoIZBoGXYh8iq3Vv7a6bojCo+FpvT8j
	 Af7blbePLSbRn9kpJ4sN0ErsG+j25PDLF6C0J6Ad2XNMTWyJ9NBwDQTrQwbBF4ZbpI
	 iLGZlwjskDeeSGVThwHJFJ0AsOg7B8t7KN+K93iBVLxqWJ+PAJllkds9bsw0I8zghZ
	 DG6LaB/zxusfQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org,
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC][PATCH] firmware: arm_scmi: Rename struct scmi_revision_info to scmi_base_info
Date: Tue,  5 May 2026 16:37:15 +0100
Message-ID: <177799542159.2897058.8611655484605854510.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406155343.72087-1-marek.vasut+renesas@mailbox.org>
References: <20260406155343.72087-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 06 Apr 2026 17:52:54 +0200, Marek Vasut wrote:
> Rename struct scmi_revision_info to struct scmi_base_info , to
> accurately represent its content. The scmi_revision_info is no
> longer accurate, because the structure now contains more than
> only SCMI base protocol revision, it now also contains number
> of protocols, agents, vendor and subvendor strings. All those
> are fetched from the base protocol, so rename the structure to
> scmi_base_info, to match the other scmi_*_info structure names.
> No functional change.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: Rename struct scmi_revision_info to scmi_base_info
      https://git.kernel.org/sudeep.holla/c/0c6eb5d019c1

--
Regards,
Sudeep

