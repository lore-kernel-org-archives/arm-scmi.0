Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745B444DB64
	for <arm-scmi@vger.kernel.org>; Tue, 14 Jul 2026 12:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784033919; cv=none; b=SmMdEQDHeIp/5+b2FOrsFaGJFf4htyrzJebTxLZ5UrlD7uuaYwrSvRSLqJHie0Zoao15jnddo6sLgWKIRAkVrOVQXhWy8dgFGVV1V5ZoKKLB1Fsugqrpe5oiXwo08Wz1OLtr1U0DWFa/GtwIkX0Vs4xf4QU6N/+Dqkn/MRdUQ3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784033919; c=relaxed/simple;
	bh=93ulpab+6qFR1chDs8sWCQTT5KoKbIflncspAhv1RuQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GOoVaK+3tRIy05dU1yYThxGDHq+p6p+pncrQFjFWGEfLaA2g+yi8kY5E+tFKTUCD68H/8Ml7M72JrWQ+o5n2YEvWl/cEzXqUt0ambkO+RKbZVB5mt83M7OBx/yMVaNGUDCqKWffKy+K5LBr7BUc1VQsmVq74YBKs5OUrCnTx60c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QYGXvEy1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QYGXvEy1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 773261F00A3E;
	Tue, 14 Jul 2026 12:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784033918;
	bh=iXphdVi6yEozhm4T8Xfu5vY9qu487tsB/iQaR5Z0t5c=;
	h=From:Subject:Date:To:Cc;
	b=QYGXvEy1x/y42pGRh05IvVfTQP/9+8gzFH4Js0sJgFBjvfQ1HkOdKFChwVcuUMtfh
	 AUxkFdVnlLUJ89IpInVd/NZWkXyl/RY3CSYw1bNz9Yn9Dbi815zOCD4uIPykZrQdIO
	 ut7rRcw3IFHlUVSxEQ4L0c29sIpri3hop7FmdwmDeslZHm/xMWM4NNTy3c2WLUj5QZ
	 2DY5w/20e9GEVj1L6SH+wapB3O4SdYAs3zNSZRs8m1Sl5ah3LvHL4wToyVSsa3KhZm
	 /65VdThLeow/sctwx/iUfApjdxN79cS7LHnEw0j9qU6O5nBOrMSth0Mzf4KzZtLg2P
	 5DbDfvTxL8q1Q==
From: Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v6 00/16] firmware: arm_scmi: Fix SCMI core cleanup paths
Date: Tue, 14 Jul 2026 13:56:19 +0100
Message-Id: <20260714-scmi_core_fixes-v6-0-3afe499d46e3@kernel.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPkxVmoC/2XQUU8DIQwH8K+y8CwGKOV2Pvk9jFmAKxs67wxMo
 lnuuwvTxDM8/tP216ZXlilFyuxhd2WJSsxxmWswdzvmT3Y+Eo9TzUwJZYRRI8/+LR78kugQ4id
 lPlnw04DgNFlWp94T3Qp16On5J+cP90L+0pjWcYr5sqSv28oiW9+vDqLTi+SChxGUl4RyHNXjK
 6WZzvdLOrLGF/UHDEL2gKqADEh7RIQwQAfAFoAegAqgszQOxlgXfAfoLbDvAd0AkFr5yQhn+gt
 wC/QfLlgBR9ZYEEoHgf+AdV2/AcTbWWvFAQAA
X-Change-ID: 20260629-scmi_core_fixes-da3cd753b4ea
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

Most of these issues were found by Sashiko[1][2] while reviewing the
ACPI SCMI PCC work[3]. They are posted separately because the problems
are independent SCMI core, mailbox and SMC transport cleanup bugs, and do
not depend on the ACPI PCC series.

The series fixes SCMI core and transport lifetime issues around channel
setup, probe failure, notification teardown, protocol-device creation,
driver binding and malformed firmware descriptions.

The fixes tighten ownership and teardown rules for generated SCMI
devices, internal transport devices and transport channels. Internal
transport devices remain hidden from normal SCMI driver binding but can
be found by explicit teardown paths, partially initialized channels are
unwound on setup failures, and IDR/device lifetime races during probe
failure and device unbind are closed.

The series also fixes notifier and notification teardown ordering.
Requested-device notifiers are unregistered before protocol IDRs are
destroyed, RCU protects requested-device protocol lookups, notification
late-init work is quiesced before transport channels are torn down, and
protocol bind failures now drop any SCMI handle acquired before probe.

The mailbox and SMC transport fixes cover setup-failure unwinding and
early callback windows. Transport callbacks can run as soon as mailbox
channels or optional SMC completion IRQs are requested, so channel state
is now published before those callbacks can fire and cleared again on
setup failure.

Most of these issues were found by Sashiko[1][2] while reviewing the ACPI
SCMI PCC work[3]. They are posted separately because the problems are
independent SCMI core, mailbox and virtio transport cleanup bugs, and do
not depend on the ACPI PCC series.

Since I started fixing the initial set of issues pointed by sashiko, more
issues have been identified and now we are v6. Any further reports will
be handled separately.

Summary:

- Publish SCMI channel state before mailbox or SMC callbacks can run.
- Quiesce notification late-init work before tearing down channels.
- Clean up TX/RX channels when SCMI channel setup fails midway.
- Free transport resources when IDR insertion fails after channel setup.
- Avoid modifying an IDR while iterating it during channel cleanup.
- Reject out-of-range DT protocol IDs instead of allowing u8 truncation.
- Use the owning channel ID when tearing down shared transport devices.
- Unregister requested-device notifiers before active protocol IDR teardown.
- Protect requested-device protocol lookup with RCU.
- Drop SCMI handles on protocol bind and device-link failures.
- Clear the SystemPower singleton only for the owning SCMI device.
- Fix OF node reference ownership for generated SCMI devices.
- Unwind mailbox channels on TX receiver and P2A receiver setup failures.
- Fix SCMI device lifetime handling around child lookup and bus ID reuse.
- Allow explicit teardown lookup of internal transport devices.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

--

Changes in v6:
- Moved to disable_work_sync() instead of cancel_work_sync().
- Other than that it is close to v4 with some changes I missed as part of v4
- Link to v5: https://patch.msgid.link/20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org

Changes in v5:
- Added an explicit quiesce step that blocks late-init work before TX/RX
  channels are destroyed(which got accidentally left out of v4)
- Fixed the build break with bisection.
- Link to v4: https://patch.msgid.link/20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org

Changes in v4:
- Replaced the SystemPower atomic flag with pointer-based ownership using
  cmpxchg(), preventing delayed release of an old device from clearing a
  newer SystemPower reservation.
- Cancelled pending SCMI notification late-init work before releasing
  notification resources.
- Published SMC transport channel state before requesting the optional
  completion IRQ.
- Added mailbox setup-failure cleanup for early-published transport state and
  devres allocations.
- Dropped virtio channel cleanup as more work may be needed to fix the issues.
- Re-ordered the patches to simplify backporting hopefully, not 100% sure yet.
- Link to v3: https://patch.msgid.link/20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org

Changes in v3:
- Added SCMI bus resource release helper so bus IDs are released from
  destroy, register-failure and final-release paths, and cleared after
  release to avoid later double-free.
- Moved SystemPower singleton cleanup into the same resource helper so
  direct driver-core child release also clears the flag.
- Removed the unused mailbox P2A unwind label.
- Published cinfo->handle before transport chan_setup() so early mailbox
  callbacks have a valid SCMI handle.
- Added fix to destroy shared transport devices using cinfo->id instead of
  the IDR iterator key.
- Added SCMI handle cleanup on device_link_add() failure and
  BUS_NOTIFY_DRIVER_NOT_BOUND.
- Added virtio channel cleanup to detach unused virtqueue buffers and clear
  local channel lists across SCMI unbind/rebind.
- Link to v2: https://patch.msgid.link/20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org

Changes in v2:
(Mostly addressing the additional issues found by Sashiko)
- Added fixes for IDR mutation during channel cleanup.
- Added SystemPower singleton flag unwind on device creation failure.
- Added validation to skip out-of-range DT protocol IDs.
- Moved notification teardown after transport channel cleanup.
- Published mailbox cinfo before mbox_request_channel() can enable callbacks.
- Link to v1: https://patch.msgid.link/20260630-scmi_core_fixes-v1-0-f932c1e51992@kernel.org

[1] https://sashiko.dev/#/patchset/20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com
[2] https://sashiko.dev/#/patchset/20260630-scmi_core_fixes-v1-0-f932c1e51992@kernel.org
[3] https://patch.msgid.link/20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com

---
Sudeep Holla (16):
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

 drivers/firmware/arm_scmi/bus.c                | 115 +++++++++++++++----------
 drivers/firmware/arm_scmi/common.h             |   2 +
 drivers/firmware/arm_scmi/driver.c             |  81 ++++++++++-------
 drivers/firmware/arm_scmi/notify.c             |  21 +++++
 drivers/firmware/arm_scmi/notify.h             |   1 +
 drivers/firmware/arm_scmi/transports/mailbox.c |  26 ++++--
 drivers/firmware/arm_scmi/transports/smc.c     |  15 ++--
 7 files changed, 173 insertions(+), 88 deletions(-)
---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260629-scmi_core_fixes-da3cd753b4ea


-- 
Regards,
Sudeep

