Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1541836C9D5
	for <arm-scmi@vger.kernel.org>; Wed,  1 Jul 2026 16:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924798; cv=none; b=Mw3t18/aZFKU4UN5OFXwNJ0ohv13qmL9Z+MAkKsYEsfw6DbEgQ9CPKGGiHInuJC8J6uqR9s7NiO8Z2SgWx7FtaAW097mWVx1GS+mkrzeXgf/vVF+bm3Z2Ry3xWHkp1aWQk9iRJJBjaL4Z2MGThzgd8JGGLqIab9Roeq/N+cWObo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924798; c=relaxed/simple;
	bh=suDF4RPgftEUkKdNzCQktjAxnez6MLgleH1uFnCd6v0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HRAfeIKX3ZqGZKshi9iaFAKkUBaL4mMBUVZl5NeN4HyMci0n8od4eO2QGndhWrQV4NKLcWKj5eFwXPu8CAyyfsqobTUIkgYibP4BiWTRNbxxglaiu1Lw4paV7wVttr/dgazBrwC9OXiu8NdlwRL3XyQ72VER3l2kEB1pQqCjnwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hemTOLvy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hemTOLvy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F6D51F00A3A;
	Wed,  1 Jul 2026 16:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782924796;
	bh=m/vPmW68Mm8MPJoTFcuWd7T+2p/M42dSAOH2+LtBZ50=;
	h=From:Subject:Date:To:Cc;
	b=hemTOLvyTMTjX88+Kyxz+N/FOpuM18KkrpTebVErJJV9slXoEWfrOmTihZpxIdbPp
	 mTo6/S6qaieGRcpqslJu+NpD8gfEzlLXKgfOgu8ekJeUFvd0hN6y3I/FxFXcU1h2B/
	 WhC0Hf+ZWsUCI9hs0AsKlM0xpGTJSIH96zOk7hj70zLT4zCXzR7wJa85iESNfVcmWl
	 cX83m9U8Qx0h3OtAN7knYvaUYveDuAldLaKCG4OzfyEDlJqwc6ksHQs5RfQjEQxCm+
	 ndo2HaY6lqq+LfTsZmVseTh5fySCmjmzNUgI1fh1YjnZLvk/xvi6VyJStjlwImLONq
	 PGghmIo0D7aSw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v2 00/14] firmware: arm_scmi: Fix SCMI core cleanup paths
Date: Wed, 01 Jul 2026 17:52:21 +0100
Message-Id: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMpFRWoC/2WNzQ6CMBCEX4Xs2Zr+CKaefA9DCJQFqkLNLhIN4
 d0t6M3jl5n5ZgZG8shwSmYgnDz7METQuwRcVw4tCl9HBi11JjNtBbveFy4QFo1/IYu6NK4+pqY
 6YAlx9SDcgji65F/mZ3VFN66atdF5HgO9t8tJrb2f3cg/+6SEFI012ilMlbX6fEMa8L4P1EK+L
 MsHk1W+o8EAAAA=
X-Change-ID: 20260629-scmi_core_fixes-da3cd753b4ea
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

This series fixes a set of SCMI core and mailbox transport lifetime issues
found around device creation, channel setup failure, notification teardown
and malformed firmware descriptions.

Most of these issues were found by Sashiko[1][2] while reviewing the ACPI SCMI
PCC work[3]. They are posted separately because the problems are independent
SCMI core and mailbox transport cleanup bugs, and do not depend on the ACPI
PCC series.

Here is the attempt to fix them, some of them can be dropped if it is too
theoretical. I have addressed all the issues that made sense to me at the
time of reading the report.

The fixes tighten ownership and teardown rules for generated SCMI devices,
transport devices and transport channels. They make internal transport
devices reachable by explicit teardown without exposing them to normal SCMI
driver binding, ensure partially initialized channels are unwound on setup
failures, and avoid IDR/device lifetime races during probe failure and device
unbind.

The series also fixes notifier and notification teardown ordering. Requested
device notifiers are unregistered before protocol IDRs are destroyed, RCU is
used around requested-device protocol lookups, and transport callbacks are
stopped before notification state is released.

The mailbox transport fixes cover both setup failure unwinding and an early
interrupt window: mailbox callbacks can run as soon as mbox_request_channel()
binds the client and starts the controller, so the SCMI mailbox transport now
publishes its cinfo before requesting channels.

Fixes tags need to be checked again or even dropped if it is not a stable
material. Just some placeholders that I thought are appropriated are in place.

Summary:

- Fix OF node reference ownership for generated SCMI devices.
- Allow explicit teardown lookup of internal transport devices.
- Clean up TX/RX channels when SCMI channel setup fails midway.
- Fix SCMI device lifetime handling around child lookup and bus ID reuse.
- Free transport resources when IDR insertion fails after channel setup.
- Unregister requested-device notifier before active protocol IDR teardown.
- Unwind mailbox channels on TX receiver and P2A receiver setup failures.
- Protect requested-device protocol lookup with RCU.
- Avoid modifying an IDR while iterating it during channel cleanup.
- Clear the SystemPower singleton flag on SCMI device creation failure.
- Reject out-of-range DT protocol IDs instead of allowing u8 truncation.
- Stop transport callbacks before releasing notification state.
- Publish mailbox cinfo before requesting mailbox channels.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

[1] https://sashiko.dev/#/patchset/20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com
[2] https://sashiko.dev/#/patchset/20260630-scmi_core_fixes-v1-0-f932c1e51992@kernel.org
[3] https://patch.msgid.link/20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com

---
Changes in v2:
(Mostly addressing the additional issues found by Sashiko)
- Added fixes for IDR mutation during channel cleanup.
- Added SystemPower singleton flag unwind on device creation failure.
- Added validation to skip out-of-range DT protocol IDs.
- Moved notification teardown after transport channel cleanup.
- Published mailbox cinfo before mbox_request_channel() can enable callbacks.
- Link to v1: https://patch.msgid.link/20260630-scmi_core_fixes-v1-0-f932c1e51992@kernel.org

---
Sudeep Holla (14):
      firmware: arm_scmi: Fix OF node reference handling
      firmware: arm_scmi: Fix transport device teardown lookup
      firmware: arm_scmi: Clean up channels on setup failure
      firmware: arm_scmi: Fix SCMI device destroy lifetimes
      firmware: arm_scmi: Free transport channel on IDR failure
      firmware: arm_scmi: Unregister device notifier before IDR teardown
      firmware: arm_scmi: Unwind TX receiver mailbox setup failure
      firmware: arm_scmi: Unwind P2A receiver mailbox setup failure
      firmware: arm_scmi: Protect device request lookup with RCU
      firmware: arm_scmi: Avoid IDR updates while cleaning channels
      firmware: arm_scmi: Clear SystemPower flag on create failure
      firmware: arm_scmi: Reject out of range DT protocol IDs
      firmware: arm_scmi: Stop channels before notification teardown
      firmware: arm_scmi: Publish mailbox cinfo before channel request

 drivers/firmware/arm_scmi/bus.c                | 72 ++++++++++++++++----------
 drivers/firmware/arm_scmi/common.h             |  2 +
 drivers/firmware/arm_scmi/driver.c             | 44 +++++++++-------
 drivers/firmware/arm_scmi/transports/mailbox.c | 26 +++++++---
 4 files changed, 90 insertions(+), 54 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260629-scmi_core_fixes-da3cd753b4ea


-- 
Regards,
Sudeep

