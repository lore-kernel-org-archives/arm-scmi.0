Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D952F532F
	for <arm-scmi@vger.kernel.org>; Sun, 17 May 2026 19:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779044660; cv=none; b=kaX4FLTO8XXSDWy61+pI0LZjbzlYfxjVaM0KOz/K4CjEyki+FGr7bWApua6fhYb9ja8WNZrkXUA1lG0tJyTcRHCUnBQoJ+U6sXw1hsQHIix2r31a/SYmjX4/8TzITMMpBiBUg/ASPKmOdj4F8vVchZf7zyeT77mhrysplnOBzUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779044660; c=relaxed/simple;
	bh=wmrINHNC5u8IqUM6rO4aCaP3fCrqwycCjOZWb1jejqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=Qc86LGsjBzC8TQevEMBG1fSwYREAaQy1nRM5pHXKJ6sv6aq5It1VNyUDrcCe5yqMoTM/Ml8kmamBXu0fZbtcDsl9lr2jlAh56m/c9hNiXBTzDdbTf2ce+w8dqyR1KzaChUkcb6Bvfd8froYkPqi8uMAPC6itSw7KuooE9s2vATU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ai79QUYs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ai79QUYs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8F08C2BCB8;
	Sun, 17 May 2026 19:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779044660;
	bh=wmrINHNC5u8IqUM6rO4aCaP3fCrqwycCjOZWb1jejqw=;
	h=From:Date:Subject:References:In-Reply-To:To:From;
	b=ai79QUYsZCUANw/WsOyZXZkGmpszQ0q5nq/YwbMJ00NRrvKOmpgtvFUcbcG+AF409
	 wAX2xAF59bIQLNZd9nOehDMcTmPSbJt7nsNiJfrN5D0MfduwnfPf24CBGJDAt9cyV3
	 xKM2NTNXqJImk+Trm1fePnju3KuGTenrjrZIfOOabrcpYwzOA8lfxX9bbUghmtU6ie
	 GkazHmueVmMzqT0okZ5bqHLMS0h7aHwkjmdZQqI1nflPF58y8mBIP0d0U5FfYyTn6A
	 mgkTyCih4nokFh8Ao8mdBcmRntrF6zWR9hdc7tnYhqkRsucrhNaCjJbwjZc8ClM2X2
	 DMh+4I0+O05xw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Sun, 17 May 2026 20:02:41 +0100
Subject: [PATCH 2/4] firmware: arm_scmi: Validate BASE_ERROR_EVENT payload
 size
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-scmi_fixes-v1-2-d86daec4defd@kernel.org>
References: <20260517-scmi_fixes-v1-0-d86daec4defd@kernel.org>
In-Reply-To: <20260517-scmi_fixes-v1-0-d86daec4defd@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.15.2

BASE_ERROR_EVENT carries a variable number of message reports,
with the count encoded in error_status. The notification parser used
that count without checking whether the received payload contained all
reported entries.

Reject truncated payloads before copying the report array.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/base.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/base.c b/drivers/firmware/arm_scmi/base.c
index 4df2620e3c5d..d08a4f6a9ced 100644
--- a/drivers/firmware/arm_scmi/base.c
+++ b/drivers/firmware/arm_scmi/base.c
@@ -325,6 +325,8 @@ static void *scmi_base_fill_custom_report(const struct scmi_protocol_handle *ph,
 					  void *report, u32 *src_id)
 {
 	int i;
+	u32 error_status;
+	size_t expected_sz;
 	const struct scmi_base_error_notify_payld *p = payld;
 	struct scmi_base_error_report *r = report;
 
@@ -338,10 +340,19 @@ static void *scmi_base_fill_custom_report(const struct scmi_protocol_handle *ph,
 	if (evt_id != SCMI_EVENT_BASE_ERROR_EVENT || sizeof(*p) < payld_sz)
 		return NULL;
 
+	expected_sz = sizeof(p->agent_id) + sizeof(p->error_status);
+	if (payld_sz < expected_sz)
+		return NULL;
+
 	r->timestamp = timestamp;
 	r->agent_id = le32_to_cpu(p->agent_id);
-	r->fatal = IS_FATAL_ERROR(le32_to_cpu(p->error_status));
-	r->cmd_count = ERROR_CMD_COUNT(le32_to_cpu(p->error_status));
+	error_status = le32_to_cpu(p->error_status);
+	r->fatal = IS_FATAL_ERROR(error_status);
+	r->cmd_count = ERROR_CMD_COUNT(error_status);
+	expected_sz += r->cmd_count * sizeof(p->msg_reports[0]);
+	if (payld_sz < expected_sz)
+		return NULL;
+
 	for (i = 0; i < r->cmd_count; i++)
 		r->reports[i] = le64_to_cpu(p->msg_reports[i]);
 	*src_id = 0;

-- 
2.43.0

