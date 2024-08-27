Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03E321C4EDB
	for <arm-scmi@vger.kernel.org>; Tue, 27 Aug 2024 14:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724769525; cv=none; b=s2hJqnSz7aupey14l24JRaobr1lgQ9S8ZuE/EtI7u+rGXvudG85971uk8ILpXypXnyFg3hdBZh9F2KEfLB3rKh/HA4CUrJOpiLZQfWh4xyI2EMCjZO66iUZ36doX55boso/IYf4RRGQJME9Z87Y1Vr0i3t+ge4CyIc/HRFFkFe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724769525; c=relaxed/simple;
	bh=a6+R7PyFMaLqobYgYKs4rX/rbR4V0ZO36vAVkYaJeXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DG3bKvaq/j1Cnv9hC3C2uyrTrwoghPHdOmEktNqNI73XAHwxunvJQxkCZI7BqyUeq3VISZulhmzQ5+DTCJXhc2szVGcySl5n3lF/UE5jYeDgdnNzaaaPDXFJ+Dr94PTwr9ZHkifz3wYbYmbz8v1+35NfzV9rtjj40peg5E47HMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81FA113D5;
	Tue, 27 Aug 2024 07:39:08 -0700 (PDT)
Received: from usa.arm.com (e107155-lin.cambridge.arm.com [10.1.198.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C6C6A3F66E;
	Tue, 27 Aug 2024 07:38:41 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: arm-scmi@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 2/3] firmware: arm_scmi: Replace the use of of_node_put() to __free(device_node)
Date: Tue, 27 Aug 2024 15:38:37 +0100
Message-ID: <20240827143838.1465913-3-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240827143838.1465913-1-sudeep.holla@arm.com>
References: <20240827143838.1465913-1-sudeep.holla@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use __free for device_node values, and thus drop calls to of_node_put.

The goal is simplify of_node reference cleanup by using this scope-based
of_node_put() cleanup to simplify function exit handling. When using __free
a resource is allocated within a block, it is automatically freed at the
end of the block.

This cleanup is aligns well with the recent change in shmem.c to use
__free for of_node_put.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_scmi/transports/mailbox.c | 10 ++++------
 drivers/firmware/arm_scmi/transports/smc.c     |  5 ++---
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index 9d258f5d5da8..1a754dee24f7 100644
--- a/drivers/firmware/arm_scmi/transports/mailbox.c
+++ b/drivers/firmware/arm_scmi/transports/mailbox.c
@@ -129,18 +129,16 @@ static int mailbox_chan_validate(struct device *cdev, int *a2p_rx_chan,
 
 	/* Bail out if provided shmem descriptors do not refer distinct areas  */
 	if (num_sh > 1) {
-		struct device_node *np_tx, *np_rx;
+		struct device_node *np_tx __free(device_node) =
+					of_parse_phandle(np, "shmem", 0);
+		struct device_node *np_rx __free(device_node) =
+					of_parse_phandle(np, "shmem", 1);
 
-		np_tx = of_parse_phandle(np, "shmem", 0);
-		np_rx = of_parse_phandle(np, "shmem", 1);
 		if (!np_tx || !np_rx || np_tx == np_rx) {
 			dev_warn(cdev, "Invalid shmem descriptor for '%s'\n",
 				 of_node_full_name(np));
 			ret = -EINVAL;
 		}
-
-		of_node_put(np_tx);
-		of_node_put(np_rx);
 	}
 
 	/* Calculate channels IDs to use depending on mboxes/shmem layout */
diff --git a/drivers/firmware/arm_scmi/transports/smc.c b/drivers/firmware/arm_scmi/transports/smc.c
index 2ffed5280eab..f8dd108777f9 100644
--- a/drivers/firmware/arm_scmi/transports/smc.c
+++ b/drivers/firmware/arm_scmi/transports/smc.c
@@ -84,12 +84,11 @@ static irqreturn_t smc_msg_done_isr(int irq, void *data)
 
 static bool smc_chan_available(struct device_node *of_node, int idx)
 {
-	struct device_node *np = of_parse_phandle(of_node, "shmem", 0);
-
+	struct device_node *np __free(device_node) =
+					of_parse_phandle(of_node, "shmem", 0);
 	if (!np)
 		return false;
 
-	of_node_put(np);
 	return true;
 }
 
-- 
2.46.0

