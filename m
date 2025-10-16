Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F161D31A7E2
	for <arm-scmi@vger.kernel.org>; Thu, 16 Oct 2025 09:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760607294; cv=none; b=lNOEd0PAUNLym2bIMZ707lj0CnNFkpWsT0iQkwlgxm9rFU+91IPzk+I1hEMOtJfmuC6fv8ABrJjUhZu+V4DAT0ufZqGNa5dNA50b1edD9RQOKHZUUvlxZSImnsjpZdPI5R40NWojeTQtMvBTrUCDYwF4iRAeNeoH08N2SgvLCCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760607294; c=relaxed/simple;
	bh=uOch7FQy4HVdhxXnEM3N327TmNp5uof4XFtrM10b5yU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=THlexnlhzKT3sbhZThckyRnAHCenwZsD7zM6JNy9tDjbS3UBZrnn5vu11/btSI7WM1z7aeOgjuQmFBtlsgFlhicpJDZfaITMD/1Vjl0PI/Ol5aR8ECis9jDH6ciSHWHjoaesHM2dkiY9a+NJmgoSJAPSml+rx6WhfsU55yuaviM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94B2A1688;
	Thu, 16 Oct 2025 02:34:43 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 47CFF3F6A8;
	Thu, 16 Oct 2025 02:34:50 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	arm-scmi@vger.kernel.org,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [GIT PULL] firmware: arm_scmi: Fixes for v6.18
Date: Thu, 16 Oct 2025 10:34:48 +0100
Message-Id: <20251016093448.945198-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
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

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fixes-6.18

for you to fetch changes up to 20b93a0088a595bceed4a026d527cbbac4e876c5:

  firmware: arm_scmi: Fix premature SCMI_XFER_FLAG_IS_RAW clearing in raw mode (2025-10-15 15:28:49 +0100)

----------------------------------------------------------------
Arm SCMI fixes for v6.18

This series contains a set of small, focused fixes that address
robustness and lifecycle issues in the Arm SCMI core and debug support,
ensuring safer handling of debug initialization failures, correct flag
management in raw mode, and consistent inflight counter tracking.

Brief summary:

 - Fix raw xfer flag clearing
 - Skip RAW debug initialization on failure
 - Make inflight counter helpers null-safe, preventing crashes if debug
   initialization fails
 - Account for failed debug initialization globally

There is no functional change for standard SCMI operation, but these
fixes improve stability in debug and raw modes, particularly in error
paths.

----------------------------------------------------------------
Artem Shimko (1):
      firmware: arm_scmi: Fix premature SCMI_XFER_FLAG_IS_RAW clearing in raw mode

Cristian Marussi (3):
      firmware: arm_scmi: Account for failed debug initialization
      include: trace: Fix inflight count helper on failed initialization
      firmware: arm_scmi: Skip RAW initialization on failure

 drivers/firmware/arm_scmi/common.h | 32 +++++++++++++++++----
 drivers/firmware/arm_scmi/driver.c | 59 ++++++++++++++------------------------
 2 files changed, 47 insertions(+), 44 deletions(-)
