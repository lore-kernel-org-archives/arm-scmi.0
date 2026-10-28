Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793192710;
	b=TRAgmu1gTCRtL4cDKZ6ZwHYKZm44iiBWQenh1YQEoDkJJh9Hpx+p18T3xrXc9rhYYwM2
	 yFQd2VAoPmWZBcG3VFiNcuATKVMD3KpSHXgN3ZG+Q6w8u0Ei8+9pDjc7SR8XCgtCXWAIp
	 Bb4I7TrguScfz12s4bUX623Ab9+puBG8QzMQ6kmfmsAZ77ZbhHui9LoawVsCONHgjmkNo
	 5PmH8oBySwbXlNlUrlQZ3+wfSCB4AWg6aj9C+ZEt6uHDVzZpTmoSrZHBsqLqDYWwH08Ij
	 wWKuqF2XnYvFwnkuJecJ0XEe3eILSR4Lc3UVvC96tqUyqJ6dEFCvU1ECwUnSOFXChlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793192710;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=PA/fmPJB+1WcJ0F4ZZpw0PCjAYENlo82bBuzNSOQBGg=;
	b=jGogHnff/C7k9fZV2wh9fIsKiINe2U9NSVXEOGEDtyY4wH0pFvYQeP3n6u+WBejBU5Yl
	 +sBkE1tMnCJDoTyqPUsMCCJu2xVNFdeTdVmAyaxmg56sKi39HeM8ce4J7NCIAjwP38EZ6
	 Q822c2JCVJYzftq6y5taFsXsP4fNgKeUBuJywXe2dbxM+vP0q0kBoFnxqSan+yF7YNQkU
	 EwwiwTn1gpCdB9oOlf3tpKSE9GtAHq3FJvNxUWnpvxChDvRU+kNSM+iwvyLEgRyyOBepW
	 XX5W6DiVX2uFzsC+wu1oomZItnnUfQsqqF9bVU5waXtl8XiW2NTwuBCA/50m+WuadHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mv0Sh4VD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53F5606A31A
	for <arm-scmi@vger.kernel.org>; Wed, 28 Oct 2026 13:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mv0Sh4VD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 590981F01828;
	Wed, 28 Oct 2026 13:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793192709;
	bh=PA/fmPJB+1WcJ0F4ZZpw0PCjAYENlo82bBuzNSOQBGg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Mv0Sh4VD19aKmjXJVfg+X71t0b4ob8egYaLzKcQI+nnfdMyUP6fN4/C4YEUL2YPGs
	 ps1+0JljDCJUuycdT3RuPdD7HcEBfQINA9civk/rNSlMFvdHGXZcCUSSYXzdhhWNRW
	 ya6woYfThDavbBh4deMAl++/040XyE3hGHFBNUBQJIi3kCxXwbE9kbPLq/CR7q7OQa
	 xX2XonzLcSXp5CHtFFvFlCDLr8UPHHZyEWy+FCx7Qm6WoWrqQ9mrJG4d44b34jSb2v
	 rAdZkAuBg5Cxypax8/42OTTInIzXl5lzP1XxjGh4EjRUoNqCPd9FuQWKACCdufKt2i
	 hiclUdQNaTUwg==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Peng Fan <peng.fan@nxp.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH 2/3] firmware: arm_scmi: imx: Validate MISC control response size
Date: Wed, 28 Oct 2026 13:05:01 +0000
Message-ID: <20261028130502.2999676-2-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028130502.2999676-1-sudeep.holla@kernel.org>
References: <20261028130502.2999676-1-sudeep.holla@kernel.org>
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

scmi_imx_misc_ctrl_get() uses @num to report the number of
values returned by firmware, but it did not retain the caller's value
as the capacity of @val.

A response with more values than the caller allocated was copied into
@val unchecked. For example, the MQS regmap callback supplies storage
for one value. Retain the input capacity and reject responses exceeding
it before copying, then update @num only after a successful copy.

Document the in/out @num contract of the exported helper.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-6897b44a-57fb-4964-95f8-447d0ce526e4
Fixes: 61c9f03e22fc ("firmware: arm_scmi: Add initial support for i.MX MISC protocol")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c  | 16 ++++++++++++----
 include/linux/firmware/imx/sm.h                  |  6 ++++++
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
index 0c708b2dd496..f00f7acba845 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
@@ -273,10 +273,16 @@ static int scmi_imx_misc_ctrl_get(const struct scmi_protocol_handle *ph,
 {
 	struct scmi_imx_misc_ctrl_get_out *out;
 	struct scmi_xfer *t;
+	u32 num_values, max_values;
 	int ret, i;
 	int max_msg_size = ph->hops->get_max_msg_size(ph);
 	int max_num = (max_msg_size - sizeof(*out)) / sizeof(__le32);
 
+	if (!num || !val || !*num)
+		return -EINVAL;
+
+	max_values = *num;
+
 	ret = scmi_imx_misc_ctrl_validate_id(ph, ctrl_id);
 	if (ret)
 		return ret;
@@ -290,16 +296,18 @@ static int scmi_imx_misc_ctrl_get(const struct scmi_protocol_handle *ph,
 	ret = ph->xops->do_xfer(ph, t);
 	if (!ret) {
 		out = t->rx.buf;
-		*num = le32_to_cpu(out->num);
+		num_values = le32_to_cpu(out->num);
 
-		if (*num >= max_num ||
-		    *num * sizeof(__le32) > t->rx.len - sizeof(__le32)) {
+		if (num_values > max_values || num_values >= max_num ||
+		    num_values * sizeof(__le32) > t->rx.len - sizeof(__le32)) {
 			ph->xops->xfer_put(ph, t);
 			return -EINVAL;
 		}
 
-		for (i = 0; i < *num; i++)
+		for (i = 0; i < num_values; i++)
 			val[i] = le32_to_cpu(out->val[i]);
+
+		*num = num_values;
 	}
 
 	ph->xops->xfer_put(ph, t);
diff --git a/include/linux/firmware/imx/sm.h b/include/linux/firmware/imx/sm.h
index ba5d93bd6158..0aec7da0ae78 100644
--- a/include/linux/firmware/imx/sm.h
+++ b/include/linux/firmware/imx/sm.h
@@ -29,6 +29,12 @@
 #define SCMI_IMX952_CTRL_BYPASS_AUDMIX	8U      /* WAKE AUDMIX */
 
 #if IS_ENABLED(CONFIG_IMX_SCMI_MISC_DRV)
+/**
+ * scmi_imx_misc_ctrl_get() - Read an i.MX MISC control
+ * @id: Control identifier
+ * @num: On entry, capacity of @val in words; on return, words read
+ * @val: Buffer for the control value
+ */
 int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val);
 int scmi_imx_misc_ctrl_set(u32 id, u32 val);
 #else
-- 
2.43.0

