Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77701494AC
	for <arm-scmi@vger.kernel.org>; Tue, 27 Aug 2024 14:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724769524; cv=none; b=cU8DAdEHOMTpedwGL3+KG4nVz33S7lWJ+gPCOGAqs9alpMV0D5Bi4+tWoMYoKOQwlzKXC231YUyKk+kFho498pAVj+tl5hXVmxuckrOwPhvAnl5zbHrqjFxzvzet3ColoI1BYmoaW6k1Yx4VmDaQu7tZ5aLqMHrrjXPuNnp+LVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724769524; c=relaxed/simple;
	bh=vw9LRa7nGeAeFYpPUwQPvZond7xRpNBZiQayn7DxBvY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K61oHjTFx/GyzH/El9jxGzECL5GMi1P0n152Fb0A27BadzYcwj9su2FKtOEt4GW1s+bzny7kK/P0d5sYOll0J8mACfA9vpR4ziO7c/MBntRW4Gh+90e8ZDItepS+NVbju0zy5A2Ko3n/o5FKqbgJ6kCZWFbvnJN2WSeOaOa5NPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D346DA7;
	Tue, 27 Aug 2024 07:39:07 -0700 (PDT)
Received: from usa.arm.com (e107155-lin.cambridge.arm.com [10.1.198.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 41F123F66E;
	Tue, 27 Aug 2024 07:38:40 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: arm-scmi@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 0/3] firmware: arm_scmi: Minor coding style cleanups
Date: Tue, 27 Aug 2024 15:38:35 +0100
Message-ID: <20240827143838.1465913-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the recent changes in the for-next/scmi/updates, the builder raised
few issues that are also reported by checkpatch. These patches fixes few of
those issues.

Sudeep Holla (3):
  firmware: arm_scmi: Fix trivial whitespace/coding style issues
  firmware: arm_scmi: Replace the use of of_node_put() to __free(device_node)
  firmware: arm_scmi: Replace comma with the semicolon

 drivers/firmware/arm_scmi/base.c               |  4 +---
 drivers/firmware/arm_scmi/clock.c              |  1 +
 drivers/firmware/arm_scmi/driver.c             |  1 -
 drivers/firmware/arm_scmi/perf.c               |  2 +-
 drivers/firmware/arm_scmi/pinctrl.c            |  1 +
 drivers/firmware/arm_scmi/transports/mailbox.c | 11 ++++-------
 drivers/firmware/arm_scmi/transports/smc.c     |  4 ++--
 7 files changed, 10 insertions(+), 14 deletions(-)

-- 
2.46.0

