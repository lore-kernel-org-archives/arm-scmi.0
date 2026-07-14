Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F234483BA
	for <arm-scmi@vger.kernel.org>; Tue, 14 Jul 2026 12:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784033925; cv=none; b=qPyvFhKZzmm/Sz8gClDe8mcRcnGWaqMTGzcpwT9mF9WORVZKB7bqHshbKwcgxkjSf49f1n3AkcL4L49tcs1oAGe2syiq/qDwqw837lvlK/nP3d+CA/MoWtWpbI4oNRKMR/7XOI5Vot1wzh8/8Dg+Lz4vGjvCH2kLIyw9VL1zIGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784033925; c=relaxed/simple;
	bh=cNmqzZ024OrizRHtBXfuG9rHr93ZogBL0PUArRc6/Ww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=emwtD9ZDV/3A6mhyX/LANRc5n/qARHvaz3vKbfK54JdK4i/T8HBwwtsv5O/UmVNOA2WO7qqh0kVrfsJOu0Rwe2ecMnUDfLe8ub+uviAQ1PpWAxJJ6otfS9AHfqd0HG6+KUWWTgyQDKDUsP3B2Xz+RL9TBHEGPTBhnxKVUYZhl4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xfg17pOC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xfg17pOC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 165DA1F00A3F;
	Tue, 14 Jul 2026 12:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784033924;
	bh=hkKcOyZICo08l5q0F5dJW8wCAI/JQBA7W4IQh7k1JQM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Xfg17pOCKH58qm9QOQp3s/D113V6sEVUxJZ6+29T43uNYoNmOCrRsUAwCOUBFPCkp
	 arVTHe95z5hFReyp2+agYWTPNUN4NQrQP/0It9KOjjtE48NNOuH7VlOyfw/hKp8fYf
	 gRH/rlt7YEl3PIGlPKBKrg0GvtzniOAUGid9O+maO8z8i3QXSfY0w5EXAqqDvb18X0
	 6mxw3l9iFWmvrs7oNXht1U0lx7IndAuHMkTEHXYDUDJ263zGxamkNsc6KgJCWE9/o2
	 JX4VVrVt5iFMvuMJEk9iJvOmYG2ZNNQaqycO/MWQWcb3IyQ9IoFQPneMLIYnAVrn+p
	 24yGKCNKYsjKA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 14 Jul 2026 13:56:26 +0100
Subject: [PATCH v6 07/16] firmware: arm_scmi: Reject out of range DT
 protocol IDs
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-scmi_core_fixes-v6-7-3afe499d46e3@kernel.org>
References: <20260714-scmi_core_fixes-v6-0-3afe499d46e3@kernel.org>
In-Reply-To: <20260714-scmi_core_fixes-v6-0-3afe499d46e3@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

SCMI protocol IDs carried in message headers are limited by
MSG_PROTOCOL_ID_MASK. The DT parsing paths noticed protocol IDs
outside that range, but only logged an error and then kept processing
the invalid value.

That lets a malformed 32-bit DT reg value reach helpers which take a u8
protocol ID, where it can be truncated and/or treated as a different
protocol.

For channel setup, two different out-of-range values can also be used as
distinct IDR keys while aliasing the generated SCMI protocol identity.

Skip DT protocol nodes whose reg value does not fit the SCMI protocol ID
field before setting up channels or creating protocol devices.

Fixes: 05a2801d8b90 ("firmware: arm_scmi: Use dedicated devices to initialize channels")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index d17559c897a9..0735c6374269 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2873,9 +2873,11 @@ static int scmi_channels_setup(struct scmi_info *info)
 		if (of_property_read_u32(child, "reg", &prot_id))
 			continue;
 
-		if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id))
+		if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id)) {
 			dev_err(info->dev,
 				"Out of range protocol %d\n", prot_id);
+			continue;
+		}
 
 		ret = scmi_txrx_setup(info, child, prot_id);
 		if (ret)
@@ -3339,8 +3341,10 @@ static int scmi_probe(struct platform_device *pdev)
 		if (of_property_read_u32(child, "reg", &prot_id))
 			continue;
 
-		if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id))
+		if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id)) {
 			dev_err(dev, "Out of range protocol %d\n", prot_id);
+			continue;
+		}
 
 		if (!scmi_is_protocol_implemented(handle, prot_id)) {
 			dev_err(dev, "SCMI protocol %d not implemented\n",

-- 
2.43.0

