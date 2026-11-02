Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636299;
	b=mzExHzNNBwFy5VqdfA2JJQfC833HEfoxhuNNn6Ko6l1t9HFdeoZlSagOYf4+z3O7F8pa
	 bYXSBGHu3VSNePbKyNIcUk7KBecwd5rEk+XYWZofCnL8fWZ6Rreo43i1VVxppTI/HFwBO
	 KOmYc49FpFnJnFNOisNkMeHDtMYCdFANUJyvcKd7I31ELYk413+cZ0M2dgO+HOxrTragS
	 fXHAtbXsdcbfZCmNYCb4wMETsR9Xsjt5VekyRpcMfeBD8QkO5Tazwr+w9E9qBUW3oustx
	 OzvWEjWi9fdbeUtDN4NOhi2CPSD4IF6ta1N4PRvCH6lkNyCUNsSMCTos9y4zVnOg5EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636299;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=CEYWK6dZMstnnI6DPMgpQiEcWnhOCPU2yQEpw8GUcNs=;
	b=uQHLNLsF9lozDy9oV3mIaw0ztVJuyyirpVmUpjmp+MoVWbSNIP1Co98F5/3/Jr8+/ybV
	 Uxka5MA6Nhw24Vs4xrhwG2GZgcNUhO3e2atU85IF5RN5B05Z2G39GYWlBRKNHOT5SBuYp
	 mob634H/MS/NacoHCbCLHcR6Hat+flnaiLhfQzds0QM+jpk+rSmhpr2wP1wrUehsDWOML
	 21i7xx9EMQAe3uZV0Fws/G20UaHvRCd+6ytai20WifVBjVjzieNu7jmZobQuVL6B/p7kK
	 6ObKJrc2qKYj3wgDTq+N9KiwZ9x9nTn5Ba3NwvzZeLdaBCKtGBBQ6R/yE3aW2ifA//A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="FGp/FbGp";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E848608360B
	for <arm-scmi@vger.kernel.org>; Mon,  2 Nov 2026 16:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FGp/FbGp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4EBF1F00A16;
	Mon,  2 Nov 2026 16:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793636298;
	bh=CEYWK6dZMstnnI6DPMgpQiEcWnhOCPU2yQEpw8GUcNs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FGp/FbGpc0lRcpJbhvzYIYewjQMX/cGbpfWsgXEbXvFryJxqxKMXFS8voviRT1jvQ
	 cWfLJIren/DHR74/jHx//lCBojRvFDRbA/Hg4TFhX2TUw2sInVWamaC/TJDBYfs6ph
	 940xgez1STlKWRNhpHWhXKzb4A5XPDiJhN2hyd70RSm5NyfwIvMRhvtfdLqzqjIvV0
	 RHKH4VEertGeSjcsC+A8Cr7Nv8fx3Qmm1Zc/Hq1BN+zSZRdKMdvUIShZjJMMe4JW5f
	 fDFVd0egVTpH2U03jkRe+cB4BE6+hhGYM8YN/5eWo6e2eeU+LITBOXQTG3MX5PIQKj
	 D2Rk+GNQeF99w==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] firmware: arm_scmi: Free mailbox state on mapping failure
Date: Mon,  2 Nov 2026 16:18:11 +0000
Message-ID: <179363627396.1026156.9462471466297757648.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028153203.3305067-1-sudeep.holla@kernel.org>
References: <20261028153203.3305067-1-sudeep.holla@kernel.org>
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

On Wed, 28 Oct 2026 15:32:03 +0000, Sudeep Holla wrote:
> mailbox_chan_setup() allocates its private state from the SCMI base
> device before mapping the shared-memory area. If mapping fails while
> setting up an optional RX channel, the core ignores the RX failure and
> keeps the base device bound, retaining that devres allocation.
> 
> Release the private mailbox state before returning the mapping error.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/1] firmware: arm_scmi: Free mailbox state on mapping failure
      https://git.kernel.org/sudeep.holla/c/38b6268eae65
-- 
Regards,
Sudeep

