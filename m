Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3008D360EEE;
	Thu,  3 Sep 2026 09:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788429271; cv=none; b=Ux6SYIfaLGrl+1CsRmV8p8OgaDICij05nncXOIxaMawHZu5TGDgtEtdtV1tXuwdCCgUhiwUmKgW6DNsDj5Eas/wiYRAM7y6H/rv+jFUyzVAV6fQNgtqvGJJQ56cXhCGxK1HIKtkIAaI0pqW17UnwArgh1/VqkybqVafTfHV/SHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788429271; c=relaxed/simple;
	bh=EUJoHar3fsxYOKNovivQg730mDMBg0/uZC5chqSYztQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cm9LIy+y+Q3fNh3yUD2LCF/57j61A2YsYUZFoKjHSbtEwj0jOTcGQGWkEvr0r6Kosu2ENJtZkiCL3Lh3cdDfBN/W4VlD0DQj5MRqTQOqIjCX3/VRYVr/cji3KykGi+skGKptv34SONXE3C34yjXtNxRdj0YfWLCDk0bF9wgiw0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ECD71F000E9;
	Thu,  3 Sep 2026 09:54:28 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] firmware: arm_scmi: Merge scmi_reset_proto_ops.name_get() and .latency_get()
Date: Thu,  3 Sep 2026 11:54:25 +0200
Message-ID: <77c9651a11715013c0eaa8a56dbbc7dc3d9ddeec.1788429130.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SCMI reset domain protocol operations structure does not provide a
.info_get() method, unlike most other protocols.  Instead, it provides
two separate methods to get a domain's name and reset latency.

Merge the .name_get() and .latency_get() methods into a single
.info_get() method, to increase uniformity.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
There are no callers of the .name_get() and .latency_get() methods.
---
 drivers/firmware/arm_scmi/reset.c | 36 ++++++++++---------------------
 include/linux/scmi_protocol.h     | 13 ++++++-----
 2 files changed, 19 insertions(+), 30 deletions(-)

diff --git a/drivers/firmware/arm_scmi/reset.c b/drivers/firmware/arm_scmi/reset.c
index 4bc5c24c2d72d398..2cdddc28ba47a2b4 100644
--- a/drivers/firmware/arm_scmi/reset.c
+++ b/drivers/firmware/arm_scmi/reset.c
@@ -60,8 +60,7 @@ struct scmi_reset_issued_notify_payld {
 struct reset_dom_info {
 	bool async_reset;
 	bool reset_notify;
-	u32 latency_us;
-	char name[SCMI_MAX_STR_SIZE];
+	struct scmi_reset_domain_info info;
 };
 
 struct scmi_reset_info {
@@ -134,10 +133,10 @@ scmi_reset_domain_attributes_get(const struct scmi_protocol_handle *ph,
 		if (pinfo->notify_reset_cmd)
 			dom_info->reset_notify =
 				SUPPORTS_NOTIFY_RESET(attributes);
-		dom_info->latency_us = le32_to_cpu(attr->latency);
-		if (dom_info->latency_us == U32_MAX)
-			dom_info->latency_us = 0;
-		strscpy(dom_info->name, attr->name, SCMI_SHORT_NAME_MAX_SIZE);
+		dom_info->info.latency_us = le32_to_cpu(attr->latency);
+		if (dom_info->info.latency_us == U32_MAX)
+			dom_info->info.latency_us = 0;
+		strscpy(dom_info->info.name, attr->name, SCMI_SHORT_NAME_MAX_SIZE);
 	}
 
 	ph->xops->xfer_put(ph, t);
@@ -149,7 +148,7 @@ scmi_reset_domain_attributes_get(const struct scmi_protocol_handle *ph,
 	if (!ret && PROTOCOL_REV_MAJOR(ph->version) >= 0x3 &&
 	    SUPPORTS_EXTENDED_NAMES(attributes))
 		ph->hops->extended_name_get(ph, RESET_DOMAIN_NAME_GET, domain,
-					    NULL, dom_info->name,
+					    NULL, dom_info->info.name,
 					    SCMI_MAX_STR_SIZE);
 
 	return ret;
@@ -162,28 +161,16 @@ static int scmi_reset_num_domains_get(const struct scmi_protocol_handle *ph)
 	return pi->num_domains;
 }
 
-static const char *
-scmi_reset_name_get(const struct scmi_protocol_handle *ph, u32 domain)
+static const struct scmi_reset_domain_info *
+scmi_reset_info_get(const struct scmi_protocol_handle *ph, u32 domain)
 {
 	struct reset_dom_info *dom_info;
 
 	dom_info = scmi_reset_domain_lookup(ph, domain);
 	if (IS_ERR(dom_info))
-		return "unknown";
-
-	return dom_info->name;
-}
-
-static int scmi_reset_latency_get(const struct scmi_protocol_handle *ph,
-				  u32 domain)
-{
-	struct reset_dom_info *dom_info;
-
-	dom_info = scmi_reset_domain_lookup(ph, domain);
-	if (IS_ERR(dom_info))
-		return PTR_ERR(dom_info);
+		return NULL;
 
-	return dom_info->latency_us;
+	return &dom_info->info;
 }
 
 static int scmi_domain_reset(const struct scmi_protocol_handle *ph, u32 domain,
@@ -241,8 +228,7 @@ scmi_reset_domain_deassert(const struct scmi_protocol_handle *ph, u32 domain)
 
 static const struct scmi_reset_proto_ops reset_proto_ops = {
 	.num_domains_get = scmi_reset_num_domains_get,
-	.name_get = scmi_reset_name_get,
-	.latency_get = scmi_reset_latency_get,
+	.info_get = scmi_reset_info_get,
 	.reset = scmi_reset_domain_reset,
 	.assert = scmi_reset_domain_assert,
 	.deassert = scmi_reset_domain_deassert,
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index fd2d648964f68f53..06914851c4620979 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -528,22 +528,25 @@ struct scmi_sensor_proto_ops {
 			  u32 sensor_id, u32 sensor_config);
 };
 
+struct scmi_reset_domain_info {
+	char name[SCMI_MAX_STR_SIZE];
+	u32 latency_us;
+};
+
 /**
  * struct scmi_reset_proto_ops - represents the various operations provided
  *	by SCMI Reset Protocol
  *
  * @num_domains_get: get the count of reset domains provided by SCMI
- * @name_get: gets the name of a reset domain
- * @latency_get: gets the reset latency for the specified reset domain
+ * @info_get: gets the information of the specified reset domain
  * @reset: resets the specified reset domain
  * @assert: explicitly assert reset signal of the specified reset domain
  * @deassert: explicitly deassert reset signal of the specified reset domain
  */
 struct scmi_reset_proto_ops {
 	int (*num_domains_get)(const struct scmi_protocol_handle *ph);
-	const char *(*name_get)(const struct scmi_protocol_handle *ph,
-				u32 domain);
-	int (*latency_get)(const struct scmi_protocol_handle *ph, u32 domain);
+	const struct scmi_reset_domain_info __must_check *(*info_get)
+		(const struct scmi_protocol_handle *ph, u32 domain);
 	int (*reset)(const struct scmi_protocol_handle *ph, u32 domain);
 	int (*assert)(const struct scmi_protocol_handle *ph, u32 domain);
 	int (*deassert)(const struct scmi_protocol_handle *ph, u32 domain);
-- 
2.43.0

