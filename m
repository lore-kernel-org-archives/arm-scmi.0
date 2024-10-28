Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC38217E473;
	Mon, 28 Oct 2024 12:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730116930; cv=none; b=g7oJV6kUZ2LXITX46Vo2PKRScDAfP2ScnJ1G9MTx3sIL4yBL6z9x41WW9fwrOTTt2A+JNHB6b0UoLql96WCh5sn6vICi16RfkVK5pA5xTpZiVMm2VyiEpz+2zitsvcdjPnKK1WgICp+9ZJ3BMog+yjiKYB8snVMrlvCCPys8EGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730116930; c=relaxed/simple;
	bh=3aKQ2BBElz0G73EOml+SrIVmSfXBL/ilkN1NnO4c7nY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YIsKk4ycrNLAPVLbrctmZ4K2Zt7sSyJIvP6ZlP9Z017JDzydi2LvuX00PEzVXHnJZ4M9M+JzZVD7ZP45VOjmdEH6I5zZt5Pkn0MTw2uMMtzS7XwFw6pwmw4L7Cl3M1rJ6h9h+wjMetXW6gaCZe3WVQkw90vONrCtQkcs5UKYjSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75676497;
	Mon, 28 Oct 2024 05:02:36 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E015C3F73B;
	Mon, 28 Oct 2024 05:02:04 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	quic_nkela@quicinc.com,
	dan.carpenter@linaro.org,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v3 0/7] Expose SCMI Transport properties
Date: Mon, 28 Oct 2024 12:01:44 +0000
Message-ID: <20241028120151.1301177-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

SCMI transports are characterized by a number of properties: the values
assumed by some of them tightly depend on the choices taken at design
time and on the overall archiecture of the specific platform: things like
timeouts, maximum message size and number of in-flight messages are closely
tied to the architecture of the platform like number of SCMI agents on the
system, physical memory available to the SCMI server...so on and so forth.

Moreover, since the SCMI specification does not delve into the details
of specific transports, that are, indeed, outside the scope of the
specification itself, such characteristics are NOT even discoverable
at run-time on an SCMI platform.

Currently such properties are simple default values defined at build time,
but the increasing number and variety of platforms using SCMI with a wide
range of designs has increased the need to have a way to describe such
properties across all these platforms.

This series, at first removes a few ambiguities in how some of the current
built-in properties are interpreted, then lays out a way for the core to
propagate back to the transports any possible setting gathered at runtime
from devicetree and finally introduce a pair of new properties used to
describe such per-platform transport characteristics.

Based on v6.12-rc3.

V3 adds 2 additional patches to fix an already existing similar property
that was missing the vendor prefix.

Any feedback welcome.

Thanks,
Cristian

---
v2 --> v3
- unified SHMEM_PAYLOAD_SIZE definition
- fixed format-string
- added reviewed tags
- added missing vendor to existing max-rx-timeout-ms
v1 --> v2
- added arm, vendor prefix to new DT bindings props
- clarified arm,max-msg bindings meaning
- removed useless warning on advised minimum size on arm,max-msg-size
- fixed maintainers CC list
- removed CCed maintainers from commit log
- using new prefixed arm, props



Cristian Marussi (7):
  firmware: arm_scmi: Account for SHMEM memory overhead
  firmware: arm_scmi: Calculate virtio PDU max size dynamically
  dt-bindings: firmware: arm,scmi: Introduce more transport properties
  firmware: arm_scmi: Use max_msg and max_msg_size devicetree properties
  firmware: arm_scmi: Relocate atomic_threshold to scmi_desc
  dt-bindings: firmware: arm,scmi: Add missing vendor string
  firmware: arm_scmi: Use vendor string in max-rx-timeout-ms

 .../bindings/firmware/arm,scmi.yaml           | 17 ++++++-
 drivers/firmware/arm_scmi/common.h            | 13 +++++-
 drivers/firmware/arm_scmi/driver.c            | 46 +++++++++++--------
 drivers/firmware/arm_scmi/shmem.c             |  7 +++
 .../firmware/arm_scmi/transports/mailbox.c    |  2 +-
 drivers/firmware/arm_scmi/transports/optee.c  |  8 ++--
 drivers/firmware/arm_scmi/transports/smc.c    |  2 +-
 drivers/firmware/arm_scmi/transports/virtio.c | 15 +++---
 8 files changed, 74 insertions(+), 36 deletions(-)

-- 
2.47.0

