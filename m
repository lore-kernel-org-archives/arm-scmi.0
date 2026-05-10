Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B43F73644AF;
	Sun, 10 May 2026 16:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778429160; cv=none; b=FllsX5HqjAzgT9DEqRC5lg4XNLBLqZ5+Td1Pz0ranNyDc/f2CNEmOlOZz+2mP0ye+D4UI3nQGmwuyHDOMkUSirN3iB+yKAZwHMQtqQgHUOK8oG0llX1CvdyYhxrV+tqrn9Dfu4W7qLDWWVCEk/6rHPB/r1kZGa6zw0V9fp08eYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778429160; c=relaxed/simple;
	bh=myTaqAtC7/L1Xq3s01EGR42VOFZpWLVRSjMnBYulHi0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BQxbRfwnZmzKuGsKdY+9IHH3WomOhwZoiS0H9qX5/ZMV3tHf7uJUem9GvGoVwO3BUnxg83YO3gX6t10kuY2OGvHfW9yN9g6RUfiOS4wWmwtbJBVsDLXjTTPaxfN5R2mgGfadXj+GFkOi1MW1zk16EO6arZrtmT9+2e2VY/q9UbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NBuya4Ir; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NBuya4Ir"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5F7D26AC;
	Sun, 10 May 2026 09:05:51 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 704E13F836;
	Sun, 10 May 2026 09:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778429156; bh=myTaqAtC7/L1Xq3s01EGR42VOFZpWLVRSjMnBYulHi0=;
	h=From:To:Cc:Subject:Date:From;
	b=NBuya4IrypJzViUSWTnthUpvVcxQm9ocZE0mU4ihSCs9sp93ljx3DG8hpUS/B+apm
	 oiOusT6xqNPLddYFGzv5QSE6/Dbgn8Tu3ggzDhyWoGcA5GkNJ7AePAXwbiuJ5ctWU1
	 0Y6HkLxg29DjOflaPETcGJ1FTDv9PFfoFMgbOyKU=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	philip.radford@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	gatien.chevallier@foss.st.com,
	u.kleine-koenig@baylibre.com,
	dakr@kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v2 0/4] Rework SCMI transport drivers probing sequence
Date: Sun, 10 May 2026 17:05:23 +0100
Message-ID: <20260510160527.3537474-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

when the SCMI transports were split out into standalone drivers [1] the
probe sequence was laid out in such a way that:

 - the transport drivers would have probed first, triggered by the firmware
   driven discovery process (DT/ACPI)

 - afterwards the control would have been passed to the core SCMI stack
   driver via the creation of a dedicated device that would have inherited
   the original firmware descriptor (since that same DT/ACPI node would
   have been still needed by the SCMI core driver to be parsed)

The tricky part came around with some transport driver like virtio and
optee since they are, in turn, upfront dependent on an external distinct
kernel subsystem; IOW these have first to undergo their own subsystem
specific probe/initialization to become fully operational as transports:
this kind of initialization sequencing of course must deal with the
possibility of probe deferrals BUT at that time we avoided this by using
the trick in virtio/optee transports to register the next stage drivers
ONLY at the end of the subsystem specific probe routine, from within the
probe itself.

This register_while_probing behaviour is ugly and has 2 main issues:

 - it is frowned upon and can lead to hangs in the driver core whenever
   some core locking is changed as exposed in [2][3]

 - it limits these transport drivers to a single instance probing since of
   course you cannot register the same driver more than once

Note also that such dependencies are NOT explicitly represented in any way
within the firmware description tables: i.e. we cannot play the fw_devlink
card and enjoy correct sequencing out of the box.

With this series we remove the ugly register_while_probing trick and
introduce some basic mechanism to allow the probe to be deferred until the
underlying transport has probed and it is fully operational so as that can
be used as a supplier device. This is obtained by:

 - moving the problematic platform driver registration away from the probe
   into its own module_init/exit

 - adding a few common well-known optional helpers that can be invoked
   to retrieve the supplier reference, if ready, OR defer the probe when
   neeeded.

Instead, we do NOT introduce in this series (as we attempted in the RFC)
a mechanism to support multiple instance probing also for optee and virtio
transports, because there is currently NO possible way to bind such probed
transport driver instances to the related SCMI instances, so that this
would narrow down the applicability of this multiple instance scenario to
the case in which each underlying SCMI server instance is setup in exactly
the same way. (same protocols for each instance node)

Based on v7.1-rc2

Tested on:
 - an emulated environment against a mock SCMI Server (virtio)
 - a QEMU based setup against SCP-based server running in OPTEE (optee)
 - JUNO with the standard SCP reference firmware (mailbox)
 - RADXA ROCK_5B with Rockchip fw (smc) 

Thanks,
Cristian

[1]: https://lore.kernel.org/arm-scmi/20240812173340.3912830-1-cristian.marussi@arm.com/
[2]: https://lore.kernel.org/lkml/aaA6t-J2gRy3dE1_@pluto/
[3]: https://lore.kernel.org/all/ad9cglZCwtsVsGmq@monoceros/

---
v1 -> v2
 - fixed __MUTEX_INITILIAZER() usage
 - reworked supplier state machine
 - introduce common transport_supplier logic
 - get rid of init/cleanup wrappers
 - use common generic supplier definitions in virtio/optee
 - optee: use proper barrier on scmi_optee_agent
 - virtio: fixed possible race between supplier made available
   and scmi_dev made visible
 - virtio: restored initial virtio_device_ready() logic
 - virtio: issue a proper reset device on probe failure

Cristian Marussi (4):
  firmware: arm_scmi: Add transport instance handles
  firmware: arm_scmi: Add a generic transport supplier
  firmware: arm_scmi: virtio: Rework transport probe sequence
  firmware: arm_scmi: optee: Rework transport probe sequence

 drivers/firmware/arm_scmi/common.h            | 163 +++++++++++++++++-
 drivers/firmware/arm_scmi/transports/optee.c  |  46 +++--
 drivers/firmware/arm_scmi/transports/virtio.c |  52 +++++-
 3 files changed, 238 insertions(+), 23 deletions(-)

-- 
2.53.0

