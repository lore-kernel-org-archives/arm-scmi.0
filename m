Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED68248F73
	for <arm-scmi@vger.kernel.org>; Mon, 13 Jul 2026 11:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783940749; cv=none; b=sEOjY664vG7xfminAWuXsykRMIhDfpHMwsnxl5nbtbSpacfhEzCIrgcv4JAO9JiApoWy6jq/IvDFTCOza0nBryr7RfQJ/F97LBxe5Y9KXREtmSmKHE6QOjsSrd9ptdQ2ufQNjBNDnnPX5/UlmeNv+/8dkhS9OxAythzVcPPlGe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783940749; c=relaxed/simple;
	bh=ymBgWBjmHpx0+UjuFhXmSUZCxzlsEq1CULQENpgwDbc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JR1CJt6jRAzp0m+DfORjNPye/7AAE8SPflyb0I8aztm6IkA5J8JSm3RBb9NVDjzVaqPRuShcriSvG84H+CHdcFxzSC3wlP5yfAndICV/6SW7axjyBmWY8u/gI/0sexTVYfb3bVN+y7zDjtJFGbSbu40YgZReOM2plDJQ4LmbQcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZG9EXzsa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZG9EXzsa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB2801F000E9;
	Mon, 13 Jul 2026 11:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783940748;
	bh=uvSiy5im8+ukroQ2/8CIqL5c1HixXr0B5I98YK9SCBM=;
	h=From:To:Cc:Subject:Date;
	b=ZG9EXzsawu1YTuCCmQLhbPsoCKUx9xWbltM2GIcVVEYM54JcE6IqtLd+d05o/5B6N
	 hmHusz7UqMfzvZXFYJvUbjqQlrhOI5tri+hQRri0PrpGPMsBU3Yp1tHWZ2BImHjCSu
	 IfwemKJmkcZrWnfJB4kTxKmd7Vr0cICsJX4u2YemIY7RlQ5y1s1BXHjpwj2pf2qTz3
	 eyk5vrBt19RvZccLvT1C/nkmq/j0sdRB7HQwuruS+wrcjMqmx87Sbaic/zpkvEzfJc
	 Yj9Bb8zpXnn7wkzXyhPVmpbIDVT++LfgA8XTAaWc5CgVpfRVTrk3JwcR87MtiXSyqb
	 QmD+a02DjSHaA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	arm-scmi@vger.kernel.org,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [GIT PULL] firmware: arm_scmi/arm_ffa: Fixes for v7.2
Date: Mon, 13 Jul 2026 12:05:36 +0100
Message-ID: <20260713110538.1819713-1-sudeep.holla@kernel.org>
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
The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-ffa-fixes-7.2

for you to fetch changes up to 980a8bfe7baec9b9ee0d5443b0b204552e41c407:

  Merge branches 'for-next/scmi/fixes' and 'for-next/ffa/fixes' (2026-07-13 11:38:34 +0100)

----------------------------------------------------------------
Arm SCMI/FF-A fixes for v7.2

Fix two runtime issues in the SCMI framework. Use full 64-bit division
when rounding range-based clock rates, avoiding divisor truncation and
a possible divide-by-zero on 32-bit systems. Rate-limit notification
queue-full warnings emitted from interrupt context to prevent printk
floods and prolonged system stalls during notification bursts. Also
correct a grammar error in the ARM_SCMI_POWER_CONTROL Kconfig help
text.

Fix the FF-A driver RX/TX buffer sizing logic to respect the maximum
buffer size advertised by firmware, while retaining compatibility with
older implementations that may reject PAGE_SIZE-rounded buffers.
Also fix a NULL pointer dereference in ffa_partition_info_get() by
rejecting NULL UUID strings before passing them to uuid_parse().

----------------------------------------------------------------
Geert Uytterhoeven (1):
      firmware: arm_scmi: Grammar s/may needed/may be needed/

Pushpendra Singh (1):
      firmware: arm_scmi: Rate-limit queue-full warnings in IRQ context

Seth Forshee (1):
      firmware: arm_ffa: Respect firmware advertised RX/TX buffer size limits

Steve Dunnagan (1):
      firmware: arm_scmi: Use 64-bit division for clock rate rounding

Sudeep Holla (1):
      Merge branches 'for-next/scmi/fixes' and 'for-next/ffa/fixes'

Unnathi Chalicheemala (1):
      firmware: arm_ffa: Fix NULL dereference in ffa_partition_info_get()

 drivers/firmware/arm_ffa/driver.c  | 29 +++++++++++++++++++++--------
 drivers/firmware/arm_scmi/Kconfig  |  4 ++--
 drivers/firmware/arm_scmi/clock.c  | 11 +++++++----
 drivers/firmware/arm_scmi/notify.c |  6 +++---
 4 files changed, 33 insertions(+), 17 deletions(-)
