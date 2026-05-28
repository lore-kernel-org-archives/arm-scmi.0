Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DF62FD7D3
	for <arm-scmi@vger.kernel.org>; Thu, 28 May 2026 18:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779994732; cv=none; b=alu4rMX4yY+224PX33x2d9zHdB+IW/sFuB1GkrdbCRIcY444Wdh4IblktLGnfulG+b7ILYp0NWhFCEHtWS1DjmH3UMix8Ue3cDIylkrmivZv4CJWBYPxBEqBHN4bS4sF96lmk05IffctIpX4sfAAxn8yMVUSvR8QB0dvBgUN25c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779994732; c=relaxed/simple;
	bh=LjGz0M5iAQymTeg/Eu7bZFgolUFPmGasgmTcd72SHjA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ssjGX7fEzOiOm3RDkQAS/HcsN2uqsOvb6LYIwXsfl+vLPFl2/gVBeSR7PYKOoiFls4lCncqFdZmmzTXT8EXowA9ky2yDM1w/7vzPvKt9hFzrXNs7S0qFOSJfpiroBfjnYGGIPs+X9pDKlJieGMOAsBoQW9uiH4vxXuc+DsK/J1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+XmSXXC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+XmSXXC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 617171F00A3A;
	Thu, 28 May 2026 18:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779994729;
	bh=dDl9WiRVkFnZ4KGhUiamMsE2H6ZfjTwqBgTNaY1yr7U=;
	h=From:To:Cc:Subject:Date;
	b=V+XmSXXCwcFoSJLN0hohvGp86TLcp1ewIHOc90trTleZoLNe7H8Cp6uqk7ujSjlR3
	 Z0Z9XHOml16LfD0G+ulUMz3It+B8WYEQzfSjj1Uc9vcJimt9fApdzT+TxipEFf2eO7
	 b9PZWyG/EcOelMGiC3Cht0WiLpEyiuU00Vw3TIVJh0kq3JOKWVdOhRS5QB1O/E0d33
	 Q3JlnkqQO2OqZ+Loe5BkegBKfbI6J4a24vKM7PQf2xpOD8vIZyabUln6xENT7GSTsF
	 FLurdNIPMLutZAOom3dAQEtdN/iHHze7+2gxPdZxR1mx3xmwWBpqzlFw2rnsLfjFx9
	 aJqm1JwqhlD2w==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	arm-scmi@vger.kernel.org,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v7.2
Date: Thu, 28 May 2026 19:58:26 +0100
Message-ID: <20260528185827.776851-1-sudeep.holla@kernel.org>
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
The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-7.2

for you to fetch changes up to 524abd2fa6907ebe2762342be339afcc5b227dc4:

  firmware: arm_scmi: optee: Rework transport probe sequence (2026-05-21 17:31:51 +0100)

----------------------------------------------------------------
Arm SCMI updates for v7.2

1. Improve SCMI clock handling with a protocol-level determine_rate operation,
   simplified per-clock rate properties, dynamic rate allocation, bounded
   iterator support, lazy full-rate discovery, and hardened parent/rate
   enumeration.

2. Fix several SCMI bounds and payload validation issues, including clock rate
   discovery OOB handling, power domain name lookup, Powercap domain state
   access, BASE_ERROR_EVENT and SENSOR_UPDATE payload sizing, and sensor config
   width handling.

3. Rework SCMI transport probing for virtio and OP-TEE using per-instance
   transport handles and a generic transport supplier, removing the need to
   register SCMI core drivers from transport probe paths.

4. Add i.MX SCMI MISC reset reason support and print i.MX95 boot/shutdown
   reasons via the System Manager interface.

5. Clean up SCMI core internals, including base-info naming, quirk parsing and
   table iteration, and list iteration.

6. Fix SCPI clock provider removal so child clock providers are unregistered
   using the same DT nodes used at registration time.

----------------------------------------------------------------
Cristian Marussi (16):
      clk: scmi: Fix clock rate rounding
      firmware: arm_scmi: Add clock determine_rate operation
      clk: scmi: Use new determine_rate clock operation
      firmware: arm_scmi: Simplify clock rates exposed interface
      clk: scmi: Use new simplified per-clock rate properties
      firmware: arm_scmi: Drop unused clock rate interfaces
      firmware: arm_scmi: Make clock rates allocation dynamic
      firmware: arm_scmi: Harden clock parents discovery
      firmware: arm_scmi: Refactor iterators internal allocation
      firmware: arm_scmi: Add bound iterators support
      firmware: arm_scmi: Use bound iterators to minimize discovered rates
      firmware: arm_scmi: Introduce all_rates_get clock operation
      firmware: arm_scmi: Add transport instance handles
      firmware: arm_scmi: Add a generic transport supplier
      firmware: arm_scmi: virtio: Rework transport probe sequence
      firmware: arm_scmi: optee: Rework transport probe sequence

Geert Uytterhoeven (7):
      firmware: arm_scmi: quirk: Improve quirk range parsing
      firmware: arm_scmi: quirk: Simplify quirk table iteration
      firmware: arm_scmi: Convert to list_for_each_entry()
      firmware: arm_scmi: Fix bound iterators returning too many items
      firmware: arm_scmi: Use proper iter_response_bound_cleanup() name
      firmware: arm_scmi: Fix OOB in scmi_clock_describe_rates_get_lazy()
      firmware: arm_scmi: Fix OOB in scmi_power_name_get()

Marek Vasut (1):
      firmware: arm_scmi: Rename struct scmi_revision_info to scmi_base_info

Peng Fan (2):
      firmware: arm_scmi: imx: Support getting reset reason of MISC protocol
      firmware: imx: sm-misc: Print boot/shutdown reasons

Stepan Ionichev (1):
      clk: scpi: Unregister child clock providers on remove

Sudeep Holla (4):
      firmware: arm_scmi: Read sensor config as 32-bit value
      firmware: arm_scmi: Validate BASE_ERROR_EVENT payload size
      firmware: arm_scmi: Validate SENSOR_UPDATE payload size
      firmware: arm_scmi: Validate Powercap domains before state access

 drivers/clk/clk-scmi.c                             |  48 +---
 drivers/clk/clk-scpi.c                             |   2 +-
 drivers/firmware/arm_scmi/base.c                   |  25 +-
 drivers/firmware/arm_scmi/clock.c                  | 301 ++++++++++++++++-----
 drivers/firmware/arm_scmi/common.h                 | 165 ++++++++++-
 drivers/firmware/arm_scmi/driver.c                 |  98 ++++---
 drivers/firmware/arm_scmi/power.c                  |   6 +-
 drivers/firmware/arm_scmi/powercap.c               |  18 +-
 drivers/firmware/arm_scmi/protocols.h              |  13 +-
 drivers/firmware/arm_scmi/quirks.c                 |  17 +-
 drivers/firmware/arm_scmi/sensors.c                |  12 +-
 drivers/firmware/arm_scmi/transports/optee.c       |  46 +++-
 drivers/firmware/arm_scmi/transports/virtio.c      |  52 +++-
 .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    |  86 ++++++
 drivers/firmware/imx/sm-misc.c                     |  73 +++++
 include/linux/scmi_imx_protocol.h                  |  14 +
 include/linux/scmi_protocol.h                      |  36 +--
 17 files changed, 802 insertions(+), 210 deletions(-)
