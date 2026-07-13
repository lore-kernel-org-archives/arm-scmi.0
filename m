Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545C4340401;
	Mon, 13 Jul 2026 10:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939803; cv=none; b=S5BpJgdR27faEijAAEy0Nna9/dkoe6IHw9A5CmIpj/3ShpMA3x8z/bD9Yw8pg77fYThj/FbZGWLiovCRUvCu80jnHS7kXjfcfYU70pjEbOpsrqFQkhp56nUoXAFyZyPLwxnXqn7UcafbPirPm4zZj6qjCT/7SUJIObGOZ4Zp8Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939803; c=relaxed/simple;
	bh=UuSqjX3wGPXvZ1nUiyi0QJKWscSJQa4ttgNOlQBgEeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mlhh3L3RN8WUwVITWApoZCB3PjkvjlErMQgYQYUBgyiCnSuptY8Zr4TAGbAm2zmTsBrlJbsRgP53/AKO/Dw+pp/5cqkAsB7DfCdxXuns6NQmyH9zYadnjrHVWNvZ8HgO8VzdygvtHkLBlNS1H4eIXvrLFqil9z11jsXtdh3U2cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D/7cW2Or; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D/7cW2Or"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E38601F000E9;
	Mon, 13 Jul 2026 10:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783939802;
	bh=+mC+p0RfcBB2FWIB+0G0/q5bKpwNLL+tjZ4djsboK4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=D/7cW2OrAdKVpLGymKibNuGD64Aoe+sReSQeHEvNAyRX2yy4/7UKJk14wrq2Be28i
	 YCvezXwAwci9pA2rejSEJOWftR0IcmVf6vCslr+FhA/Fq6zqrXayGKRC3lqAAiMdSW
	 7F2/B1JIPN7SE3rexCmA3UcqetkfuQMe6zrzTxLXUjJSo5Ade5GiMS3XGlLDgrcliW
	 eIc1rFl35pNxfqTyBQS5hrHnlBRwMX4Qrldb/tqODR2oN/M0M1wirlNi02ygAqXB5y
	 m0NwxWnEGukBEgdF//MhT6bHwm+fHIGJ/jbOdJ+zjJ9Fy8JPWoyvsEFHsfxEwPQ76s
	 Hk1y1HpOSYP5g==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: sdunnaga@redhat.com
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Use 64-bit division for clock rate rounding
Date: Mon, 13 Jul 2026 11:49:57 +0100
Message-ID: <178393970515.1814568.15303004507285404021.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701195923.444270-1-sdunnaga@redhat.com>
References: <20260701195923.444270-1-sdunnaga@redhat.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 01 Jul 2026 15:59:20 -0400, sdunnaga@redhat.com wrote:
> SCMI clock range descriptors report rates as 64-bit values. When handling
> a range clock, scmi_clock_determine_rate() rounds the requested rate up to
> the next supported step using the SCMI RATE_STEP value.
> 
> The current code uses div64_ul() for this calculation. Since div64_ul()
> takes an unsigned long divisor, the 64-bit RATE_STEP value can be truncated
> on 32-bit builds. In the worst case, a non-zero 64-bit step can be narrowed
> to zero before the division.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/1] firmware: arm_scmi: Use 64-bit division for clock rate rounding
      https://git.kernel.org/sudeep.holla/c/bf1deecccf21
-- 
Regards,
Sudeep

