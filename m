Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C6D2620DE;
	Sat, 27 Dec 2025 16:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766854293; cv=none; b=oqBKdp047XGWNzjdtjRhx3+ZM4MuauIhzQ20G3puMYEO1hnjJThJdVocH8nT24lkpmMpBHeYnxU72NCQE1QQa2KYfwgad6VXM9CRRXIFFg6Mv8Mm6hmOrAq0gVYJ/D4ME5winNCt/hzBHmc8RSCn7m/XF3ZVZo0vU0wc/kgLQKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766854293; c=relaxed/simple;
	bh=B7zLnLljwoMPGT0IB2w/Kzo1ein/Oxh5pI3jR23Dr9s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hQGdeTQm0YetKfgLzRHj4zE/FnDJoy15RvlrHJROCjx2itTamPSm7vfExM2gjK8zJnFqhMSywXjg66LwrwFluu6kwvacipxxxWkDoVyRBheu7iUnbt5kAWTq34GBZImTeMq5xnk5kui23NcWUy/oLos9wr2C6nbHmuOPa24V07k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BE69339;
	Sat, 27 Dec 2025 08:41:57 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 01FA73F694;
	Sat, 27 Dec 2025 08:42:01 -0800 (PST)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	philip.radford@arm.com,
	peng.fan@oss.nxp.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 0/2] Rework protocol version negotiation core logic
Date: Sat, 27 Dec 2025 16:41:30 +0000
Message-ID: <20251227164132.1311988-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this small series rectifies the protocol negotiation logic employed by the
core SCMI stack when trying to cope with newer unknown protocol versions
advertised by the platform under any circumstances.

The existing protocol negotiation logic per-se was fine, but unfortunately
the whole negotiation process was started at the end of the per-protocol
initialization phase since it relies on the version querying performed by
each protocol initialization logic.

Unfortunately, this means that if the protocol initialization failed
upfront as a whole, maybe exactly due to version incompatibilities, the
negotiation itself will never be started, effectively failing to negotiate
a better version in the exact scenario where negotiation would be mostly
needed.

This series simply moves the version_get query process out of the single
protocol units and delegates to the core SCMI stack the whole procedure:
this way, the supported protocol version querying and any further needed
negotiation exchanges are performed by the core SCMI stack right before
the start of the protocol initialization phase: as a consequence the
protocol initialization phase will now be performed using the appropriate
protocol version as negotiated in advance, when needed.

As a consequence per-protocol versioning code is considerably simplified.

Based on v6.19-rc2.

Any feedback, as usual, it is very much welcome.

Thanks,

Cristian


Cristian Marussi (2):
  firmware: arm_scmi: Rework protocol version negotiation logic
  firmware: arm_scmi: Remove legacy protocol versioning logic

 drivers/firmware/arm_scmi/base.c              | 11 +--
 drivers/firmware/arm_scmi/clock.c             | 24 ++---
 drivers/firmware/arm_scmi/driver.c            | 98 +++++++++++++++----
 drivers/firmware/arm_scmi/perf.c              | 57 ++++-------
 drivers/firmware/arm_scmi/pinctrl.c           | 12 +--
 drivers/firmware/arm_scmi/power.c             | 18 +---
 drivers/firmware/arm_scmi/powercap.c          | 21 ++--
 drivers/firmware/arm_scmi/protocols.h         |  9 +-
 drivers/firmware/arm_scmi/reset.c             | 18 +---
 drivers/firmware/arm_scmi/sensors.c           | 22 ++---
 drivers/firmware/arm_scmi/system.c            | 14 +--
 .../arm_scmi/vendors/imx/imx-sm-bbm.c         | 10 +-
 .../arm_scmi/vendors/imx/imx-sm-cpu.c         |  9 +-
 .../arm_scmi/vendors/imx/imx-sm-lmm.c         |  9 +-
 .../arm_scmi/vendors/imx/imx-sm-misc.c        | 10 +-
 drivers/firmware/arm_scmi/voltage.c           | 13 +--
 16 files changed, 153 insertions(+), 202 deletions(-)

-- 
2.52.0

