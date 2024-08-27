Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C31C1C4ED9
	for <arm-scmi@vger.kernel.org>; Tue, 27 Aug 2024 14:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724769524; cv=none; b=RYeRTJboEd/jtbPmkWnzg/tFmxRiG3Br+6s2H2GtSBg0SDNFJHcdKnq3JErj5NbYzJfhzx3mXi9iVmvWLJp5D1hw66dyowUBi99oNj1SmzbhMw85ZiVNJ1i1y/kKsz7VIsKKUZRQxA5V++mgCOWx4je3XDHjOkT9qYOAkBRAbnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724769524; c=relaxed/simple;
	bh=yvPM0ocGGkdkL7BrCSCbGEI4gFOb2V/borOa9gQrP5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OatBNKU4mfAEQHceryVRQb1IR8uGumWI4d+Uqh8V0/pmkuYp/q6fTnUOh95Tf0vqfFpuclMEKAlw93PONEuUu3doBqOcM1/8GFVdt0WPS2T7Tm18aQDA2SJxWsBZlGoY/CW5AVFUu3bbBcXfvxg8gZSA/RWh5XlunErYPUZbXSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF1C911FB;
	Tue, 27 Aug 2024 07:39:07 -0700 (PDT)
Received: from usa.arm.com (e107155-lin.cambridge.arm.com [10.1.198.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0EE6F3F66E;
	Tue, 27 Aug 2024 07:38:40 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: arm-scmi@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 1/3] firmware: arm_scmi: Fix trivial whitespace/coding style issues
Date: Tue, 27 Aug 2024 15:38:36 +0100
Message-ID: <20240827143838.1465913-2-sudeep.holla@arm.com>
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

Fix couple of unnecessary multiple blank lines and spaces instead of
tabs.

No functional change.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_scmi/base.c               | 2 --
 drivers/firmware/arm_scmi/clock.c              | 1 +
 drivers/firmware/arm_scmi/driver.c             | 1 -
 drivers/firmware/arm_scmi/perf.c               | 2 +-
 drivers/firmware/arm_scmi/pinctrl.c            | 1 +
 drivers/firmware/arm_scmi/transports/mailbox.c | 1 -
 drivers/firmware/arm_scmi/transports/smc.c     | 1 +
 7 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/arm_scmi/base.c b/drivers/firmware/arm_scmi/base.c
index 9939b1d84b7a..d52873523cd2 100644
--- a/drivers/firmware/arm_scmi/base.c
+++ b/drivers/firmware/arm_scmi/base.c
@@ -42,7 +42,6 @@ struct scmi_msg_resp_base_discover_agent {
 	u8 name[SCMI_SHORT_NAME_MAX_SIZE];
 };
 
-
 struct scmi_msg_base_error_notify {
 	__le32 event_control;
 #define BASE_TP_NOTIFY_ALL	BIT(0)
@@ -105,7 +104,6 @@ scmi_base_vendor_id_get(const struct scmi_protocol_handle *ph, bool sub_vendor)
 	struct scmi_xfer *t;
 	struct scmi_revision_info *rev = ph->get_priv(ph);
 
-
 	if (sub_vendor) {
 		cmd = BASE_DISCOVER_SUB_VENDOR;
 		vendor_id = rev->sub_vendor_id;
diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index 134019297d08..2ed2279388f0 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -365,6 +365,7 @@ static int scmi_clock_attributes_get(const struct scmi_protocol_handle *ph,
 	ret = ph->xops->do_xfer(ph, t);
 	if (!ret) {
 		u32 latency = 0;
+
 		attributes = le32_to_cpu(attr->attributes);
 		strscpy(clk->name, attr->name, SCMI_SHORT_NAME_MAX_SIZE);
 		/* clock_enable_latency field is present only since SCMI v3.1 */
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 66806578df5a..69c15135371c 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1030,7 +1030,6 @@ scmi_xfer_command_acquire(struct scmi_chan_info *cinfo, u32 msg_hdr)
 		scmi_bad_message_trace(cinfo, msg_hdr, MSG_INVALID);
 		scmi_inc_count(info->dbg->counters, ERR_MSG_INVALID);
 
-
 		/* On error the refcount incremented above has to be dropped */
 		__scmi_xfer_put(minfo, xfer);
 		xfer = ERR_PTR(-EINVAL);
diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
index 4b7f1cbb9b04..2d77b5f40ca7 100644
--- a/drivers/firmware/arm_scmi/perf.c
+++ b/drivers/firmware/arm_scmi/perf.c
@@ -310,7 +310,7 @@ scmi_perf_domain_attributes_get(const struct scmi_protocol_handle *ph,
 		}
 		if (!dom_info->mult_factor)
 			dev_warn(ph->dev,
-			         "Wrong sustained perf/frequency(domain %d)\n",
+				 "Wrong sustained perf/frequency(domain %d)\n",
 				 dom_info->id);
 
 		strscpy(dom_info->info.name, attr->name,
diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index a2a7f880d6a3..3855c98caf06 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -913,4 +913,5 @@ static const struct scmi_protocol scmi_pinctrl = {
 	.ops = &pinctrl_proto_ops,
 	.supported_version = SCMI_PROTOCOL_SUPPORTED_VERSION,
 };
+
 DEFINE_SCMI_PROTOCOL_REGISTER_UNREGISTER(pinctrl, scmi_pinctrl)
diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index a481a2866062..9d258f5d5da8 100644
--- a/drivers/firmware/arm_scmi/transports/mailbox.c
+++ b/drivers/firmware/arm_scmi/transports/mailbox.c
@@ -238,7 +238,6 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 		}
 	}
 
-
 	cinfo->transport_info = smbox;
 	smbox->cinfo = cinfo;
 
diff --git a/drivers/firmware/arm_scmi/transports/smc.c b/drivers/firmware/arm_scmi/transports/smc.c
index b7243939f161..2ffed5280eab 100644
--- a/drivers/firmware/arm_scmi/transports/smc.c
+++ b/drivers/firmware/arm_scmi/transports/smc.c
@@ -85,6 +85,7 @@ static irqreturn_t smc_msg_done_isr(int irq, void *data)
 static bool smc_chan_available(struct device_node *of_node, int idx)
 {
 	struct device_node *np = of_parse_phandle(of_node, "shmem", 0);
+
 	if (!np)
 		return false;
 
-- 
2.46.0

