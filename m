Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636265;
	b=AHFvW2rmx0qoMrX6YSEPDF/Yc5NzAX6+IH1rkNCBv7plNuKCeSIfUKfat2wWdfbt8ADa
	 AYQCG3gPrTWAaBA2i6zMBlYmDIuDP37Br7Xn8jlDPCaLUjNIG486W/qVuulz0mwIkIDhx
	 zmHB7QucRWRo8iFRZAg6IFZb/TGM/4pOWe39cUnwclJgHGk/6eXf+mg2co6f2RPRvuBM2
	 ebqsbjhiJ5UfPyj52CdtrTcix+44rmtTxJPDbPayb9K6lboC/e1Ypf5EvvDF2X3TqM6vw
	 mLaKH2UQiCldFpgEp4oKGpCcuaYpuyiiwoG8+I/OfBMpT/HblXlQApFrqZ6lTHRmkGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636265;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=eI0wI9+p7WOpJfp3rC9C9H32Xmag6INnn2VGhq7DbOU=;
	b=bI7R5vegczrtVHUEi3AyqxzYd16Y1oPx+rDRnwby1qOumniuoVTVivzvX5mr5S2Crg9a
	 uUc39U8VzLaEsfqmE906l5CxdZeSJWkktvzSDwjFWW+DoPk85FMOj6SuDS8vyPG1FrvLk
	 zrWQihCKezT2pax4fjdE00O9KVq1oaWZDmPqTgM10NRiWNq/aVk+NVKOYD/vc3Yn/gx7G
	 Akh8t8W/QuBq35DNHgmRukQ+cNPt03itzpzBoVjfvs+c+xJ2+csoQlrG1jwIidApwqlUT
	 YD2N2PrGOqfpBKvXrP6M6aUgcbae+t4o4Ss7mIuH/Wz2SjyGkPF4hfk5vH524Yc9Alg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZYpvuCT0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DEC606AB88
	for <arm-scmi@vger.kernel.org>; Mon,  2 Nov 2026 16:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZYpvuCT0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 707081F00A17;
	Mon,  2 Nov 2026 16:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793636264;
	bh=eI0wI9+p7WOpJfp3rC9C9H32Xmag6INnn2VGhq7DbOU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZYpvuCT0boVRsnbrBtGRI5PDOz73AJ7KeVEtSXZcs/s+TQQPPF1tJol1065eI/zSi
	 z4GXGC7W7yi4cCFQRCJvyYXb9UD5U1wxYhjimqHFya6cbnUvKHwcQB19ZU+9JgGMSR
	 K0mTKqGi2L7sQb69aY4QIpulFBve7el4E60dmooDYtO9KZ/nK8ra6x8t9QIzZ89osG
	 grbJPrRnAe20tBioL32GeM+IluJ6wRW/ZXdr4jcBplEQidU0KEEHIdtph8WG57uzDp
	 lewcLPc96fR3lafjS7QhgmUdWyA6DovTwSI1/YW7h+L1kleuERAPCp+3zIRbjmyHTZ
	 RAcRLfi/n2oIw==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Peng Fan <peng.fan@nxp.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 1/3] firmware: arm_scmi: imx: Track copied syslog words
Date: Mon,  2 Nov 2026 16:17:39 +0000
Message-ID: <179363621802.1025709.8964118647981515869.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028130502.2999676-1-sudeep.holla@kernel.org>
References: <20261028130502.2999676-1-sudeep.holla@kernel.org>
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

On Wed, 28 Oct 2026 13:05:00 +0000, Sudeep Holla wrote:
> The MISC syslog iterator records the number of returned words plus
> firmware-reported remaining words in the caller's size output.
> 
> The debugfs consumer uses that value to dump its fixed-size buffer. A
> malformed or inconsistent response can therefore make it read beyond
> the copied data and allocation.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/3] firmware: arm_scmi: imx: Track copied syslog words
      https://git.kernel.org/sudeep.holla/c/3baf579ba766
[2/3] firmware: arm_scmi: imx: Validate MISC control response size
      https://git.kernel.org/sudeep.holla/c/4e3652a0ac71
[3/3] firmware: arm_scmi: Unregister notifier on enable failure
      https://git.kernel.org/sudeep.holla/c/b9bb2eb88037
-- 
Regards,
Sudeep

