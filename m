Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD1E8610D;
	Thu,  2 Jan 2025 15:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735832263; cv=none; b=l/gh327Eo4TMWnToP5oIOT3b4KHAlRUuNTEe7eEGbP0cXPUNM3A1vnzvUSgXcnbkOszpxModJmoIPlN/2FDf5kogIZrqwDLMsHQDJ1Ieh667BfZvijt8GAAMgfsjTAOxZ9vaCEDp+qcJIMo4c7Kr7XiWlo81rQs43798l4PMllE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735832263; c=relaxed/simple;
	bh=eC8Om47sihQkbFhWQIOCVNf9fGcy6IT1X9aqM3mfLkA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AdELMYXNHOKmHFQyHOsQZX4yQsk+4X8ElDuVolcvLKp1boH3RZV0HvQxdXud2la5/KKnYonDEkgtCEYp6fvQXIDuuuSgdTEcMsX0aHmXE6kPUH1Ex13sEIH8NfaOQveGRptJR6tY+b5LcsreWfJG8H4dKh2XB45Zy4PTnOXKxD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5016F11FB;
	Thu,  2 Jan 2025 07:38:08 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 16C5A3F59E;
	Thu,  2 Jan 2025 07:37:37 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	dan.carpenter@linaro.org,
	johan+linaro@kernel.org
Subject: Re: [PATCH 0/3] Add SCMI Vendor module autoload support
Date: Thu,  2 Jan 2025 15:37:30 +0000
Message-Id: <173583220044.2167015.12505379511834560492.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241209164957.1801886-1-cristian.marussi@arm.com>
References: <20241209164957.1801886-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 09 Dec 2024 16:49:54 +0000, Cristian Marussi wrote:
> a tiny series to add the capability to automatically load the proper
> vendor protocol module when an SCMI driver tries to use it; while proper
> vendor protocol selection is already provided by the SCMI core, automatic
> loading of vendor protocols was not.
>
> Lookup is now based on module aliases following the pattern:
>
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/3] firmware: arm_scmi: Support vendor protocol modules autoloading
      https://git.kernel.org/sudeep.holla/c/54cf6e786caa
[2/3] firmware: arm_scmi: Add module aliases to i.MX vendor protocols
      https://git.kernel.org/sudeep.holla/c/d4cc8912cbff
[3/3] firmware: arm_scmi: Add aliases to transport modules
      https://git.kernel.org/sudeep.holla/c/3f3f0e53e9ae
--
Regards,
Sudeep

