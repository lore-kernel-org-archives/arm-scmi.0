Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA992F7AAB
	for <arm-scmi@vger.kernel.org>; Sun, 17 May 2026 19:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779044658; cv=none; b=ruLxEqA2taw34wcTU7HuiNiIlLrTlU1oBxij2UqIi+Y1qK43t9+01d7eqGQ9d0F63yxCkAISXmhWEyogHDatnR8qQVygd45yFtJPZ8Fowk0tvzOFjQ39u8iCXjwFnXSxm72KPNPbBHsl8N5uPT7VIuQEtT0GOmSz176lPJ7ismU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779044658; c=relaxed/simple;
	bh=NB/CNEIUtc4ERpE+q/zZYxQAMn7kc0YFmUFa9eiJFWI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To; b=A6PU9HUGMwaTldWUpkRNHwBLEdK4zCod9OAtzLYgbD5jf0f+cw0JXz6I7tw0IYFkFiyesayFYhSAcPrDXQKH5lRi0En0bEd0UdaLCzCvh3A+87T+rdlwwvf2V4TMfBy52QtsskVU0ZZ7ZDQRH+op+vIJyZAza2yzuhLjTWJypE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R3ST2v2F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R3ST2v2F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80B1AC2BCB8;
	Sun, 17 May 2026 19:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779044658;
	bh=NB/CNEIUtc4ERpE+q/zZYxQAMn7kc0YFmUFa9eiJFWI=;
	h=From:Subject:Date:To:From;
	b=R3ST2v2Ff6oxWZ/02/DbxJSe4waGUpXE+GdCEU/t5e6wvaPggGl38AuSAfcAdfh7p
	 IxPq9Tva3H38fJZ+XncBaQPb8rT+P5ZkLdArsCH2WQhl/Tb+s5uTNv5KmvG3S/esEp
	 5qASULYUY10uEr+ACtz9bKKHkOXWh1fXy0SLvIaKtxciIZprcnTO6h2mUbRrIH6r3d
	 pavqZj678+n32kc50eCUjKrqY/0QxrKGLBbZtubeY75T96VHOzPsgGcGTqnmye7XDc
	 AgHXBudAD0aDYzfR2YtwiK/Ib5gnH69IoLfc0hurOPRBLJpsvEABT+Beaaq8YaSx0C
	 z9XWMUXpUMvvw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH 0/4] firmware: arm_scmi: Fix protocol parsing and
 validation
Date: Sun, 17 May 2026 20:02:39 +0100
Message-Id: <20260517-scmi_fixes-v1-0-d86daec4defd@kernel.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANMQCmoC/yXM2wpAQBAG4FfRXNuyI5RXkcSaZZRDO0hp393i8
 us/3CDkmATK6AZHJwuvS4COIzBjuwykuA8GTDBPMl0oMTM3li8ShVpneWoNWosQBpujLwj9qv4
 tRzeR2d8H8P4Bud8JR24AAAA=
X-Change-ID: 20260517-scmi_fixes-211563fc2ff2
To: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.15.2

Hi,

This series fixes a few SCMI protocol parsing and validation issues found
while checking the driver message layouts against the SCMI specification.

The first patch fixes a clear response width mismatch in SENSOR_CONFIG_GET,
where the driver requested a 4-byte response but read it as a 64-bit value.

The next two patches harden notification parsing for variable-sized payloads.
BASE_ERROR_EVENT and SENSOR_UPDATE both carry counted trailing arrays, so the
received payload size must be validated before copying or parsing those
entries.

The final patch fixes Powercap protocol v2 helpers to validate the domain id
before accessing cached per-domain state.

No functional change is intended for well-formed SCMI responses.

Cc: Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

Regards,
Sudeep

---
Sudeep Holla (4):
      firmware: arm_scmi: Read sensor config as 32-bit value
      firmware: arm_scmi: Validate BASE_ERROR_EVENT payload size
      firmware: arm_scmi: Validate SENSOR_UPDATE payload size
      firmware: arm_scmi: Validate Powercap domains before state access

 drivers/firmware/arm_scmi/base.c     | 15 +++++++++++++--
 drivers/firmware/arm_scmi/powercap.c | 25 ++++++++++++++++++-------
 drivers/firmware/arm_scmi/sensors.c  | 12 ++++++++++--
 3 files changed, 41 insertions(+), 11 deletions(-)
---
base-commit: d0deb8265c8551343c5c155aaded6b56639e3820
change-id: 20260517-scmi_fixes-211563fc2ff2


-- 
Regards,
Sudeep

