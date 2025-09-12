Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6EB2E9EA3;
	Fri, 12 Sep 2025 11:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757675985; cv=none; b=u4oqeEeDHzJWK39MQKd6EUapiCJYN59ESq12MUw1VU6kUHlyoSnZoapWqBVuouU3Z9vL2jWJr+9PjFgAVoa6XFAxhY/giyEY9fTXUVQKGmr1HW1hljTcFZ5pCHb2nHunjwFT0WD+dfOog5XdPrZsrTJ13HE8T8GNZ3qnTNI5+d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757675985; c=relaxed/simple;
	bh=NpOzU8fMlQGJAp7+5VPm6I1vH1ZuPIl0Vlz7jRTaHcA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JiJvtI490Uun0YP9PP8vmRGlE3OTf8HztbVeZHB0zvy1rvKMN+Pxr1K893o62U9U69iBeed11TGUykUOhhHafxipFDgyfsFpN2NOYM3Jb++ARC5M/dgPGXYBze7iSNL76Kx6JhUh0W+midgvO73AdQWzV26WZJ9f+JoliN1EWZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0D061515;
	Fri, 12 Sep 2025 04:19:34 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D6D083F63F;
	Fri, 12 Sep 2025 04:19:41 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] firmware: arm_scmi: Simplify printks with pOF format
Date: Fri, 12 Sep 2025 12:19:39 +0100
Message-Id: <175767593833.2285226.9343371180097428105.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250912092423.162497-2-krzysztof.kozlowski@linaro.org>
References: <20250912092423.162497-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 12 Sep 2025 11:24:24 +0200, Krzysztof Kozlowski wrote:
> Print full device node name with %pOF format, so the code will be a bit
> simpler.
> 

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: Simplify printks with pOF format
      https://git.kernel.org/sudeep.holla/c/2f86054cc1a6
--
Regards,
Sudeep

