Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A2EE3E3D91;
	Mon,  4 May 2026 16:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777913542; cv=none; b=gflKz/uhKgB5/JvC/fQzRyX7juScdSHh2RiqQ3HPddX4ammUQX4wu2ofyAVWpJfW/O8BRGUty5nVhhtiDoSH6n2ukLQxTWWkkqkYIKoo39tNs+pz/RNMEFWccyH2C5L9KXDGNlWKAWl/LtmMAB17hA4tLWdXrSCa70iDzETPZRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777913542; c=relaxed/simple;
	bh=pv+EpS7kLPV3FVH6OLAo+oFowntQxkqnyKJDj4ef3Nw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qUr5wluf/rstDIzQY29F21eTA3xiMrebBTFqgJm5bzbesTrCaohrWuHCfpR+n7GBGYKf6YqyMFKghWLCMvXsAmmYh6+4UhZonpWZy/wS5W7U2ZGiVL9x/ha3s1Xm2XliYpCg5EIXZ2zgxAVohIp/la0Sg5OEE53hFqkaM+4s9bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iRgt/lCm; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iRgt/lCm"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07EA51691;
	Mon,  4 May 2026 09:52:12 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3AC773F763;
	Mon,  4 May 2026 09:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777913537; bh=pv+EpS7kLPV3FVH6OLAo+oFowntQxkqnyKJDj4ef3Nw=;
	h=From:To:Cc:Subject:Date:From;
	b=iRgt/lCmFj8j+ufPwH9ykGp8wmjs1isNFTkh857I9OgPI/m97OLfDC/YGYLaJPd1b
	 zK43UgIVU+kjdU6vrlxKgXg39h+ezYe/B0buZeQ6civbYy/PjXv7nAuzLR7+nV5YpI
	 nGZZI9KhIvloGxEgPLXxEQCgQxfIw8G3QGcscG2I=
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
Subject: [PATCH v1 0/3] Rework SCMI transport drivers probing sequence
Date: Mon,  4 May 2026 17:52:01 +0100
Message-ID: <20260504165204.639499-1-cristian.marussi@arm.com>
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
   have still needed by the SCMI core driver to be parsed)

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
card and enjoy correct sequencing of the box.

In this V1 we remove the ugly register_while_probing trick and introduce
some basic mechanism to allow the probe to be deferred until the underlying
transport has probed and it is fully operational so as that can be used as
a supplier device. This is obtained by:

 - moving the problematic platform driver registration away from the probe
   into its own module_init/exit

 - adding a few common well-known optional helpers that can be invoked
   to retrieve the supplier reference, if ready, OR defer the probe when
   neeeded.

Instead, we do NOT introduce in this series (as we attempted in the RFC)
a mechanism to support multiple instance probing also for optee and virtio
transports, because there is currently NO possible way to bind such probed
transport driver instances to the related SCMI instances, so that this
would narrow down the multiple instance scenario to the case in which each
underlying SCMI server instance is setup in exactly the same way.
(same protocols for each node)

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

Cristian Marussi (3):
  firmware: arm_scmi: Add transport instance handles
  firmware: arm_scmi: virtio: Rework transport probe sequence
  firmware: arm_scmi: optee: Rework transport probe sequence

 drivers/firmware/arm_scmi/common.h            |  59 +++++++-
 drivers/firmware/arm_scmi/transports/optee.c  | 118 +++++++++++++--
 drivers/firmware/arm_scmi/transports/virtio.c | 137 +++++++++++++++---
 3 files changed, 279 insertions(+), 35 deletions(-)

-- 
2.53.0

