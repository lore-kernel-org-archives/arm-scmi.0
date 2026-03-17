Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771003A4F56
	for <arm-scmi@vger.kernel.org>; Tue, 17 Mar 2026 10:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773742284; cv=none; b=L/yqtoEJ68ERVWFt/2knms9HfcBSpydOJM1mvGvASisr4OIt2HC8gaOQSRFtPyo9Rofq2qRAXi9DAfXmzHqu2WKN0H4AeVHNEHWFwHDqhwULEgulqCi62j5jn55oBkypO54pYmYKpIC7iz2/IeAN2gyXUc1EIWax1O+9J5ncyvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773742284; c=relaxed/simple;
	bh=7vBVC397CoGIya1ctMudRcRai4xV9ibDB4MtaoCBrys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I/y0rg8bqol077AlZHN8kS4j3wyfQCDMv48Ari8nufmAmapP8XyYF8EZz6QuJh9D7fZCBPfeZk8lPcJ6GnHt0kUmzzl19F/M4l6+Tig7XvDJTRIaoaoViIQgPufc2S8FJ0FBnDt5PJA3Cb4HBic/1Ie7Ve/ngN/i2/d9ELA53cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EwGu6zoJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EwGu6zoJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA9C6C4CEF7;
	Tue, 17 Mar 2026 10:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773742284;
	bh=7vBVC397CoGIya1ctMudRcRai4xV9ibDB4MtaoCBrys=;
	h=From:To:Cc:Subject:Date:From;
	b=EwGu6zoJnXt/3S1s975RwtYkS4ohXR4OHOQC33pULA2GR/d8EM51XHJs6aehtSNFR
	 KVq5lCNHQX4AMJcZLTQuRWKIxahUvoBFRWEgenT3tXTsmmc54Hfk3rv1msbjSzDTYC
	 Eah1H95leKd5OMr0ikC4ougyyXljh7wE9lBR48On+NfFdLGoM8YZJogycH3XRF77xt
	 ytT3Hdr2/omS0vASp7NP2ObTXjYlv1mhFEYeg1noblpvFhnpFa7BGxbRWV1I3DVlkc
	 EJbyrYJfZLRdzfVWenLWEnlvGivMo7MCqHzuJg3m7f8/CxRnJhiDTPB93GW87iGixj
	 s9bq6K+yDOvWQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	arm-scmi@vger.kernel.org,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>
Subject: [GIT PULL] firmware: arm_ffa: Fix for v7.0
Date: Tue, 17 Mar 2026 10:11:12 +0000
Message-ID: <20260317101115.3873019-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-fix-7.0

for you to fetch changes up to a4e8473b775160f3ce978f621cf8dea2c7250433:

  firmware: arm_ffa: Remove vm_id argument in ffa_rxtx_unmap() (2026-03-06 16:26:08 +0000)

----------------------------------------------------------------
Arm FF-A fix for v7.0

Fix removing the vm_id argument from ffa_rxtx_unmap(), as the FF-A
specification mandates this field be zero in all contexts except a
non-secure physical FF-A instance, where the ID is inherently 0.

----------------------------------------------------------------
Yeoreum Yun (1):
      firmware: arm_ffa: Remove vm_id argument in ffa_rxtx_unmap()

 drivers/firmware/arm_ffa/driver.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
