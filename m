Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093680;
	b=vCtrGne2onKoamtm482Q6nHT2H2UI2G1bQCvreLJeS6JCl73Ld1vpX+wN3OwS3QoJopP
	 PBuUQBYXwZIOvAn9ZqcNqfJbLm2m03YYVyDQaxVr5BGyxfJg5kpZNO+DuEByRrjdz/ytZ
	 O6SZanI7DnNCZ9UPC/7YvKrqnpkTRVgOYKs2D/CC8e5yDcQaDY6cpLvLVpN2v1qQ5wfAR
	 2B/dr+pxDsjhvRG6bBxitazluOAn5DMtoLeWV9wHedJR3R9w6CAELWUC38fC/RTcQEtor
	 BTl2dE+lKTvznCJbC+jc/0XLQ0aMk+npG1ec9Q4iyNS1VedypNal8fCepYbEPLVQkWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093680;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=KRSS0YC2+ajWi5ptCX9I4lcy2eVuBm7blHyhptRtr58=;
	b=WtSBs+UAiyMBzOhMxrQlOxs1Q+YyVxv8zorGlk3DaWuA9nrPhXA/rwcYTPV6SqRnsdTa
	 ZnmeaUd/jIhpfMLfe9E1MF5AO+m/b6ejKxqA/vmukzPijywYALrS2Fw8GDCpnz/2RUSko
	 QFN0ihn0onMis9OADfPEFJTN8wIh63XN6tlDdFDOozJIP6KCawSTdMHCZLDNXF17doIx1
	 r6buvz/QrHq+CpkxxrtU1+CMP70XN72bfGk22m1xHh4CJmABtlEdGsBJSwvpQ+X0r1dP1
	 B+KibI4b3cjiv5tsEq4U6p2ZnZ5AEjlfT2vsbCboMMwa0VPI0Sm5hEb/qaiaH94/PKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k8Cw1Hns;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F57606A325
	for <arm-scmi@vger.kernel.org>; Thu, 19 Nov 2026 13:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k8Cw1Hns
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 187CE1F000C4;
	Thu, 19 Nov 2026 13:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795093680;
	bh=KRSS0YC2+ajWi5ptCX9I4lcy2eVuBm7blHyhptRtr58=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=k8Cw1Hnsk6FHlJyxFwRkaDJPGexjFGr895QxBI1t0tj8BMpxIsCzay2CHoGKWybIw
	 1YUtKfLKfg8YQxkCERL7B+mHFy7TtoHMMdaeMSWNCubKzGmpgEDWusAEi8S4lKcfQS
	 YawmaJ+J5Qs7VGcLuOX3m3SI9mMW6yVxcnITK6QkesPM1bSGdEzJXwYBqGUiube6MQ
	 P/fybJQvJ4frigZXyTx3S4hRn+045hXY1htQXeYiPaWCyhyO9433xevfqGuS8gtcxT
	 XTL18YIgDLpckVtVMKd3n+O4LBacGRXfq/NZjVxRF7osQAibb/BWNEjMJl0pw0aXa7
	 KovnoNIpub6gg==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] firmware: arm_scmi: Fix fallback to short name in scmi_pinctrl_attributes()
Date: Thu, 19 Nov 2026 13:07:55 +0000
Message-ID: <179509361319.1241838.7050964033270198334.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105112705.3045759-1-sudeep.holla@kernel.org>
References: <20261105112705.3045759-1-sudeep.holla@kernel.org>
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 05 Nov 2026 11:27:05 +0000, Sudeep Holla wrote:
> In scmi_pinctrl_attributes(), the return value of extended_name_get()
> is returned directly. If PINCTRL_NAME_GET failed, the error propagated
> to callers -  aborting pin/group/function descriptor initialization,
> despite the short name already being available in name.
> 
> Discard the return value of extended_name_get() and return success as
> intended unconditionally after the successful PINCTRL_ATTRIBUTES
> transfer. On failure, extended_name_get() won't have overwritten name,
> so the short name copied from rx->name remains intact, which is exactly
> the fallback behavior described by the existing comment.
> 
> [...]

Applied to sudeep.holla/linux (for-next/arm_fw/updates), thanks!

[1/1] firmware: arm_scmi: Fix fallback to short name in scmi_pinctrl_attributes()
      https://git.kernel.org/sudeep.holla/c/6337e8d465bb
-- 
Regards,
Sudeep

