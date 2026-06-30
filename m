Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC433403F7
	for <arm-scmi@vger.kernel.org>; Tue, 30 Jun 2026 09:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782810398; cv=none; b=vCyNXr4F1xqq55hAQqhzBW+To5L3zqhX0rtXLLwSsgs3YVoEM/bXqIEIueLl05xfWnD92NTDjpsu5ywulfSJbKZntrOrpEGrFw98RrbTzkF+RydSX9mWSgpl6CKipIsQxsxWsjDf1U1UEe3tco27gFNVU8xyaxS4bVBrBHmGTHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782810398; c=relaxed/simple;
	bh=sjmUpVBWuoJCRcljU/qcdTYx1asaByou4Q0BawHZE4Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FMbqQZfkD3elY3GaNblvuu58Vr/jkIu3SDgDrXFhQ3JQpKcHFpL9bBNZJ7W4j+j8Qvmql/XrA0mbkmm53rsjJ6R3166fLpgr2nwf5lRRd4vr6SNKpSCWpWIoEq+cl8M7cRn1FjydzLcYV48yE1aFsGyJ0+vFYMcmGNMyVLGzAwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VmaDzfee; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VmaDzfee"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 032A11F000E9;
	Tue, 30 Jun 2026 09:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782810396;
	bh=/MYeLos3b+bdqSNtCHAINAEd4dnwVk65exzwxfrp7cE=;
	h=From:Subject:Date:To:Cc;
	b=VmaDzfee8n6+IOjvcGhUjci2utK8kIaKaXDFyPy/O6GEB7DSJA+wUeD5VuLq71PjP
	 8MSl04l6PJLhaOFOQtfm+CyA/DE1DeNhalulRAyfPl5T11RG89CO8IHBnYkaodu1C/
	 er2pmw6j/oZC0LkZWjLU904hg9AS9xaZcFPN6pzwGlhsNsUwzXkhq7r5FSYs6t3ssB
	 oZyfGRcC6nGFrs5Gq+LDRUtk65RzPCVsKfYS7eAMQPMzoXZjeN08l9qkScd2pvokQn
	 ScIBJls9P9+VgpootFSd6J2M9X3B4/LLXxUrDXDOIzDMhz+u4B49GDe24zJ6fULISU
	 qhOljQo1/20Xw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH 0/9] firmware: arm_scmi: Fix SCMI core cleanup paths
Date: Tue, 30 Jun 2026 10:05:56 +0100
Message-Id: <20260630-scmi_core_fixes-v1-0-f932c1e51992@kernel.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPiGQ2oC/yXMUQqDMBCE4avIPhuwiVraq4hI3Ex1C9WS1VIQ7
 25qHz+GfzZSRIHSPdso4iMq85RwyTPi0U8DjIRksoWti9rejPJLOp4juod8oSZ4x+Faub6Ep1S
 9I84hRU37t679E7z8bmjfD14RXyBzAAAA
X-Change-ID: 20260629-scmi_core_fixes-da3cd753b4ea
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

This series fixes a set of SCMI core and mailbox transport lifetime issues
found around device creation, channel setup failure and teardown paths.
They were mostly found by Sashiko[1] when reviewing some other series.
Posting these separately as the issues or the fixes are not related to [2]

Here is the attempt to fix them, some of them can be dropped if it is too
theoretical. I have addressed all the issues that made sense to me at the
time of reading the report.

The fixes tighten ownership of OF node references, make transport devices
reachable by explicit teardown without exposing them to normal SCMI driver
binding, and ensure partially initialized channels are unwound consistently on
probe/setup failures. The series also fixes races around requested-device
notifier teardown and RCU-protected protocol lookups.

The mailbox transport fixes are split by the feature that introduced the
leaking channel: one for unidirectional mailbox channels and one for P2A
completion channels.

Summary:

- Fix OF node reference ownership for generated SCMI devices.
- Allow explicit teardown lookup of internal transport devices.
- Clean up TX/RX channels when SCMI channel setup fails midway.
- Fix SCMI device lifetime handling around child lookup and bus ID reuse.
- Free transport resources when IDR insertion fails after channel setup.
- Unregister requested-device notifier before active protocol IDR teardown.
- Unwind mailbox channels on TX receiver and P2A receiver setup failures.
- Protect requested-device protocol lookup with RCU.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

[1] https://sashiko.dev/#/patchset/20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com
[2] https://patch.msgid.link/20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com

---
Sudeep Holla (9):
      firmware: arm_scmi: Fix OF node reference handling
      firmware: arm_scmi: Fix transport device teardown lookup
      firmware: arm_scmi: Clean up channels on setup failure
      firmware: arm_scmi: Fix SCMI device destroy lifetimes
      firmware: arm_scmi: Free transport channel on IDR failure
      firmware: arm_scmi: Unregister device notifier before IDR teardown
      firmware: arm_scmi: Unwind TX receiver mailbox setup failure
      firmware: arm_scmi: Unwind P2A receiver mailbox setup failure
      firmware: arm_scmi: Protect device request lookup with RCU

 drivers/firmware/arm_scmi/bus.c                | 50 +++++++++++++++++---------
 drivers/firmware/arm_scmi/common.h             |  2 ++
 drivers/firmware/arm_scmi/driver.c             | 21 ++++++-----
 drivers/firmware/arm_scmi/transports/mailbox.c | 12 +++++--
 4 files changed, 57 insertions(+), 28 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260629-scmi_core_fixes-da3cd753b4ea


-- 
Regards,
Sudeep

