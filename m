Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAB43E40F5;
	Tue,  8 Sep 2026 20:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788898344; cv=none; b=rqp21kVfqgF13s0zUOWh5q+r5SDAKhmWiN0QNPeDZh+ZiK78XX5DQ6jpLLCB4bzyKd5wIC3k/mRvbbiSFz7Kh0cyvIo8TFWRHyY7aeONkdAKt4WXPh5cg4Xa3QE0AdETFSpcRLV91pQLfNh0V4FZ/Zl7oFRD71kwN0y6tjhf2x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788898344; c=relaxed/simple;
	bh=wBuPzoKpM+zpy8hbBII3PlrgCbDu1TYCJkrjxFrZJ2c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JQFYYnE5pOqQTom7Y21I8fpmoUwpeenv4WNRBT33Y128k6ZSCYMYj/y2c2u4vrJzKRvIISPHYp3zjzus1sXK3AQ0cFQ86cxTxLkoRniQiMUE6tIf9DyFoANbydmdQhKdRM29k2sXK9XARx3kSJ4ARosuGehur4LnGLRtesDmwPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ULmnvtvX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ULmnvtvX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 230951F00A3D;
	Tue,  8 Sep 2026 20:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788898343;
	bh=gwQNucgdxcw2xaZoUzt8fjy3dhGHdMi9HJkfZPr1mCU=;
	h=From:To:Cc:Subject:Date;
	b=ULmnvtvXbDj0LU0MoJUty1kIDEUyjF0WebZxLtJn+xd9gC+G4AV1T8yB2y7XjVUuu
	 XWdux3ddf/fbY7xt0Mg+0CzHB2V+Clyd0LoRGSBzLVN9IUDYVQenLTLjX6AaW9Fzm8
	 9vxFRrY9XS3rpT2a6MS3jaEoPhDzQcoCJRv2fhTCKMnmG8dIktrYJVGGbpAg5rWrFW
	 AJDn2Z4SMeVdmE9GIRekxICi6bLAnPHRqxbjNMlIpWwrmwm4IcQxSnKJhwTLUlXeDZ
	 iuRZ8J+BdNu96UlmWePMjw2LKbMv1mCHZo7xnf+MJ65GcR420QMtngExqria/ahZhE
	 7FWTdGHiTSjcw==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: SoC Team <soc@lists.linux.dev>,
	arm-scmi@vger.kernel.org,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [GIT PULL] firmware: arm_scmi/ffa: Fixes for v7.3
Date: Tue,  8 Sep 2026 21:12:14 +0100
Message-ID: <20260908201216.2993544-1-sudeep.holla@kernel.org>
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
The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-ffa-fixes-7.3

for you to fetch changes up to 8544e0da1a04c77b98e2e313a423a5c72e48ea32:

  Merge branches 'for-next/ffa/fixes' and 'for-next/scmi/fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux (2026-09-08 21:04:42 +0100)

----------------------------------------------------------------
Arm firmware fixes for v7.3

SCPI fixes address resource leaks and invalid firmware responses, while
FF-A gains shutdown cleanup needed for normal kexec.

- Release the device node reference acquired during SCPI domain lookup.
- Validate SCPI DVFS OPP counts and indices returned by firmware to
  prevent out-of-bounds accesses and invalid clock rates.
- Register the SCPI cpufreq device only once across DVFS providers,
  preserving the registered device pointer for cleanup and allowing
  retries after registration failure.
- Run FF-A teardown during orderly shutdown so notifications, partition
  devices and RX/TX mappings are released before a replacement kernel
  boots through normal kexec.

Also includes replacing a literal platform device ID with
PLATFORM_DEVID_NONE and correcting an SCMI comment typo.

----------------------------------------------------------------
Hemanth Selam (1):
      firmware: arm_scmi: Fix typo "upto" in comment

Sudeep Holla (2):
      firmware: arm_ffa: Tear down driver during shutdown
      Merge branches 'for-next/ffa/fixes' and 'for-next/scmi/fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux

Xixin Liu (5):
      firmware: arm_scpi: fix device_node leak in scpi_dev_domain_id
      firmware: arm_scpi: reject DVFS OPP count above MAX_DVFS_OPPS
      clk: scpi: bound-check DVFS index in scpi_dvfs_recalc_rate
      clk: scpi: register scpi-cpufreq once and clear on failure
      clk: scpi: use PLATFORM_DEVID_NONE for scpi-cpufreq

 drivers/clk/clk-scpi.c             | 11 ++++++++---
 drivers/firmware/arm_ffa/driver.c  |  1 +
 drivers/firmware/arm_scmi/driver.c |  2 +-
 drivers/firmware/arm_scpi.c        |  9 ++++++---
 4 files changed, 16 insertions(+), 7 deletions(-)
