Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E57376A17
	for <arm-scmi@vger.kernel.org>; Fri, 24 Jul 2026 13:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784900823; cv=none; b=HLdfp4ba5Xtp8eW2i5alO9K7RiasD93oYGDiShva/K6WdaqWAk6y3KGqzN1zKgMaSpZhbb+nwH8mi93O1yI+5kynGPaDOeDFNutZWu9XqMIKSvYEhp1jNXtgBYpeuZTxCycI44QAP+K2B+rNmAxNmFYvEcSwE+WqWgXpoqJcPw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784900823; c=relaxed/simple;
	bh=mLICr51qUhSXGEneDYU1voqEfPhn7pnSVcmO2Ru4VDk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NrCiM+9KXjSmur9HGSczrgmjz873CXil1Z5DBx580MKQQiZVCdWxterbMBW+VBlCI98mXnDHZHyuyEtfnV8wWS1cXbVdu3evK3HU5K0hx7TGQNAkMqzhMJuJlyY3+KEgey5U2YXfQx+Qc1AQjT6g81H5SFIpSWAfyilAp02t+f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=er0CHM2Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="er0CHM2Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 457FD1F000E9;
	Fri, 24 Jul 2026 13:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784900820;
	bh=cbysenA+ym7Lo52Js4E8GSW7rIIJ486XykrgB905yDY=;
	h=From:To:Cc:Subject:Date;
	b=er0CHM2ZQRV9xe1kDZW9gQkS3ZsboFu/zHjR5KAMfWCU5q6X8YXDikQiiBRSnxaoA
	 Io1yU8akXky9wBwETLfdXy96As7pcwenpDV3VwPkxkWBoTWlBrO6EkmgQxG2bYdYHb
	 lJxOOnERMOBkWuTdIYWUgVYcIhfQRdu5E8T9Xv7ACTL2/rTZwn6tr8kYxMkMw1RG3r
	 Y4O26SC6BiX1FZI5J/ogP8Qs+p5VY9bMu5O5TU7oDhmCblPKVm23z7Ch058zYLaJD0
	 Z9DWFZH+vq0rWzmVPROj9HCkTNr5u9SOLlj0M6ieSJkK1w5ZtwzVx5h8tFkp0opKgr
	 ir3I9K2vutFmA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	arm-scmi@vger.kernel.org,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v7.3
Date: Fri, 24 Jul 2026 14:46:48 +0100
Message-ID: <20260724134651.2930500-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

I am keeping these as updates for v7.3 rather than fixes for v7.2,
allowing them to remain in -next for additional reviewi/testing time.
Aside from Sashiko’s review, there has been limited feedback on these
fixes, which address issues identified by Sashiko.

Regards,
Sudeep

-->8
The following changes since commit 980a8bfe7baec9b9ee0d5443b0b204552e41c407:

  Merge branches 'for-next/scmi/fixes' and 'for-next/ffa/fixes' (2026-07-13 11:38:34 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-7.3

for you to fetch changes up to 9f7cd6a62aa754ed6b48cbd5d50de40add1bcc86:

  firmware: arm_scmi: Unrequest devices if driver registration fails (2026-07-22 20:33:43 +0100)

----------------------------------------------------------------
Arm SCMI updates/fixes for v7.3

A collection of SCMI core and transport fixes addressing resource
lifetimes, teardown races and error handling. Most of these issues
are reported by Sashiko as existing issues while reviewing new feature
additions to SCMI.

The changes:
- publish channel state before mailbox and SMC callbacks can run,
- quiesce notification work before tearing down transport channels,
- fix partial channel setup and mailbox allocation cleanup,
- make IDR iteration and shared-channel teardown safe,
- correct SCMI device, OF node, handle, bus ID and SystemPower lifetimes;,
- harden requested-device registration and removal against races and
  partial failures,
- reject out-of-range DT protocol IDs, and
- simplify notification allocations using flexible arrays.

----------------------------------------------------------------
Rosen Penev (1):
      firmware: arm_scmi: Simplify notification allocations

Sudeep Holla (19):
      firmware: arm_scmi: Publish channel state before callbacks
      firmware: arm_scmi: Unregister device notifier before IDR teardown
      firmware: arm_scmi: Quiesce notifications before teardown
      firmware: arm_scmi: Clean up channels on setup failure
      firmware: arm_scmi: Free transport channel on IDR failure
      firmware: arm_scmi: Avoid IDR updates while cleaning channels
      firmware: arm_scmi: Reject out of range DT protocol IDs
      firmware: arm_scmi: Use channel ID for transport teardown
      firmware: arm_scmi: Protect device request lookup with RCU
      firmware: arm_scmi: Drop handle on protocol bind failures
      firmware: arm_scmi: Clear SystemPower flag on create failure
      firmware: arm_scmi: Fix OF node reference handling
      firmware: arm_scmi: Unwind TX receiver mailbox setup failure
      firmware: arm_scmi: Unwind P2A receiver mailbox setup failure
      firmware: arm_scmi: Fix SCMI device destroy lifetimes
      firmware: arm_scmi: Fix transport device teardown lookup
      firmware: arm_scmi: Fix requested device removal race
      firmware: arm_scmi: Roll back partial protocol table registration
      firmware: arm_scmi: Unrequest devices if driver registration fails

 drivers/firmware/arm_scmi/bus.c                | 182 +++++++++++++++----------
 drivers/firmware/arm_scmi/common.h             |   2 +
 drivers/firmware/arm_scmi/driver.c             |  81 +++++++----
 drivers/firmware/arm_scmi/notify.c             |  64 +++++----
 drivers/firmware/arm_scmi/notify.h             |   1 +
 drivers/firmware/arm_scmi/transports/mailbox.c |  26 +++-
 drivers/firmware/arm_scmi/transports/smc.c     |  15 +-
 7 files changed, 230 insertions(+), 141 deletions(-)
