Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C59841D61A4;
	Mon, 28 Oct 2024 15:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730127751; cv=none; b=nzpXYwqrRaDWEKZMXbePxA4PDI8+x+Hs4tr7Z+LGHHPzKqAD1SBt0P9X79W2U2k3d6B+hgTIpcLHHD6+6jdx9y/FWv0lQr4nLFop5k/rAVUKYsPRMsIGNFj91imrXzBc3o06xziseIgaYSrPSIrf3tz7n70JR3Jh8UHwbxMGS5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730127751; c=relaxed/simple;
	bh=ShUF7euzF4c5+RHQbM1Hhfg5H0exgLDCCvhO3Sqxf3k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qa+8d+aGmT2HY60ePBtkRhXhfYlpYZEVs180UXEBGslem+xQq1sR5uEVEQGA/2JWkzrhm+tA0N6Z655yds/pE98cu0/eNiHM7RmgnOlrSn6VJrPQlydi0h7Uli0fVJcHHjtFzhHEBrkNGWwNssHi/aNNtZEWLxJqyYVHfse45f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B897E497;
	Mon, 28 Oct 2024 08:02:55 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 093E23F73B;
	Mon, 28 Oct 2024 08:02:24 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Xinqi Zhang <quic_xinqzhan@quicinc.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-msm@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] firmware: arm_scmi: fix slab-use-after-free in scmi_bus_notifier()
Date: Mon, 28 Oct 2024 15:02:19 +0000
Message-Id: <173012760863.2640678.4629591944887916314.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016-fix-arm-scmi-slab-use-after-free-v2-1-1783685ef90d@quicinc.com>
References: <20241016-fix-arm-scmi-slab-use-after-free-v2-1-1783685ef90d@quicinc.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 16 Oct 2024 14:13:38 +0800, Xinqi Zhang wrote:
> The scmi_dev->name is released prematurely in __scmi_device_destroy(),
> which causes slab-use-after-free when accessing scmi_dev->name in
> scmi_bus_notifier(). So move the release of scmi_dev->name to
> scmi_device_release() to avoid slab-use-after-free.
> 
> ==================================================================
> BUG: KASAN: slab-use-after-free in strncmp+0xe4/0xec
> Read of size 1 at addr ffffff80a482bcc0 by task swapper/0/1
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/1] firmware: arm_scmi: fix slab-use-after-free in scmi_bus_notifier()
      https://git.kernel.org/sudeep.holla/c/295416091e44
--
Regards,
Sudeep

