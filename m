Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCD1917995E;
	Wed,  6 Nov 2024 07:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730877792; cv=none; b=b2sTVe+I9Bsfwmmw2w2jG54zeXsY8cjIrPP/51mwpLCwnFw5gvcgzF6Fi/DBnlxuzeUozA3ktirPNi+LvBCvo/ZY1hGjtGz4pOtPRMp+T4ZZ0o//dz+V7KRdYoLRLEaLpztjpvtrB0PyZ+pqDX9CPjaJ+/MNcmHFm+yObq9uEto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730877792; c=relaxed/simple;
	bh=x6tAi3iztnRg7xJSW0CeMk6+NpO+0l0VjsBhfzFqZFM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PIqL0NxQaCvUsuMNA51x3augFCLaG4TmvYuwszgay1r0hMWAE39AYzz0ix8gMVCosv8+vwgJHyB4SYdUV5LzgDKD1CMLBcwwiKyOoxcbXnVmT+f1EIbqv3S5AotPvwuWinGwx5xLabvFo0aBnDjb0i8wz3AT8wQDBQ1HD6yrLM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF7671063;
	Tue,  5 Nov 2024 23:23:39 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AA44D3F66E;
	Tue,  5 Nov 2024 23:23:07 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	justin.chen@broadcom.com,
	opendmb@gmail.com,
	kapil.hali@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 0/2] Support for I/O width within ARM SCMI SHMEM
Date: Wed,  6 Nov 2024 07:23:04 +0000
Message-Id: <173087767267.3975373.2771980370736261734.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240827182450.3608307-1-florian.fainelli@broadcom.com>
References: <20240827182450.3608307-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 27 Aug 2024 11:24:48 -0700, Florian Fainelli wrote:
> We just got our hands on hardware that only supports 32-bit access width
> to the SRAM being used. This patch series adds support for the
> 'reg-io-width' property and allows us to specify the exact access width
> that the SRAM supports.
> 
> Changes in v4:
> 
> [...]

(with some trivial rebasing)

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/2] dt-bindings: sram: Document reg-io-width property
      https://git.kernel.org/sudeep.holla/c/14b2157a9c14
[2/2] firmware: arm_scmi: Support 'reg-io-width' property for shared memory
      https://git.kernel.org/sudeep.holla/c/2cd7f3db25fe

--
Regards,
Sudeep

