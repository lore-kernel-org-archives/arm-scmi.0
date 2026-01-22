Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D50D3994AC
	for <arm-scmi@vger.kernel.org>; Thu, 22 Jan 2026 16:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769098662; cv=none; b=p7GVwIws2iaSWL5r1VvoZBlRhwdvobIrj7BvvO2ZVrY0Y1WOAXNnZ/NnV5VoW6DGYAtPvjMbbDKB9EzuhJNrOIEoUN7UQ6mPAjjD+YQj2Ui7kvD1JM4k6j15M41g+xIy/ujlVfviM/3JDuQ8pNhe+njpxDkmBGxr+HYGBt9/7E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769098662; c=relaxed/simple;
	bh=HjeLQ8qD73Sk2YMD1wucS1WtV6wsk+vAzVdelCP67H0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ksNkkOUM6SjmLRWMeOtA53J/qaoruQUv2HnuHspUc92zkNoX48nSBzWpJ1KepefBftG5I+WN85KnSPDsM1Qqt6sKIWBZH93fn6ZMi4cNcpjHy6FqacJ5JkOd5CfDwaOiFj/bHCSn7UXBAnhNsA4/n6vPnZcMFrVTR+IqBKFWdIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XM6LKQRj; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XM6LKQRj"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-382f0732612so7078741fa.1
        for <arm-scmi@vger.kernel.org>; Thu, 22 Jan 2026 08:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769098651; x=1769703451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RXPPA+2hVnuz9+lpDAGfbv/AXvnSUFySkKsxMNbKNAk=;
        b=XM6LKQRjYZMYVc/GQ0nTnay3wHCO36WhhN4lymFsIQGrajDYollRWX+IrezfXUElyX
         ptMYJXbc72lgRD6perHXAU6d5SiGo0npo4JKFpvQtdv3lOgMUvNJfx/G2mIOMh1whs5b
         NsJecxk4KFThOPf6F4ssozZPDcw23Li/dJOAI6LkjqpxEs0T79YauxHf3wWBYDHPJGyP
         9q/vyztoy/0eMmMH1iG7jfbp2/THk83bDozGztjhIjhIh3PJeNlCFoU8p7ZyqI5Xsj/v
         9S/heUxBOnQmJMV5PTsgkpmgn40FQrYyexIl2nIZlA9X8HdXUOiFLX1wooxeTv8mswZr
         v/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769098651; x=1769703451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXPPA+2hVnuz9+lpDAGfbv/AXvnSUFySkKsxMNbKNAk=;
        b=dbhW4gwXSFiuQcwNEJV9ydWy7/umqAGEGK+F1IxuBonh95Ls1I4miOqktkM9LkdzuS
         2UeHxqzXK1tAmcQWDjTJjzoIHnTlWkoB93RgXh8wU1jwyy/XRdM4QKIZ30FoEu/lgv4U
         zfcPAPmeAoWTLV8fxGYM0d91O2rzsbct1Ho8/0L449LogU+Mg73ZH2DHvEOXDFwSCtoI
         er2s++kfBywI2VHslhvPjRdMRURPuSgNaMaxc+qW5ALxH4zXXIyQB6d7nZOsTqd5GMqW
         3tJGcWPTsd0sXslu2+0MldYizxcf6rBFKc1dwDTmd7PFpFHHECStFpxIIrDv4ugpSibT
         4sZg==
X-Forwarded-Encrypted: i=1; AJvYcCWXWwBFMh0HVZSO1YoOD6T6oL3Zh/zJWnW450PAcilUom3UksJZ/6YCUKly7m9njV67+ZpC0CnJUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyACPckn360J4v5JQc4p+GmsdSecDPa/V2K3MMjnhQfI+sEzRXr
	lWfoBFuMMIOa6Aojb71pStbO0Uj+RUfcS4r3YLnY/9GXE/P5ePBnsKqd
X-Gm-Gg: AZuq6aIrGYuNznkGsLyVuum26wn3032g6zXvVviQ/EufvT22iL9OwdIBIpTVUJCbgdl
	sza6wkWvCNrTeeoyXgYqGvo7ONbWeShOV9o/Mua4RkLvvdcAVFLRa33hjytVKr6KCpg/hZmLdS0
	YEqT5ayMOcKD2/TqHRG7HTrMKjuDsDSUHcG6TnxZ2LcAeGnN2OrldapQ9YgiqlfqP1Q/nzReqIH
	FvqENiLH7mVy6kPs5V1dt9cC794hMl89ZGb8yzENpr0nm/CQOYjJTjRoo2+W/xQUjkEbRkI8d7m
	zSKv3hElr7/jlX7De3ThiKSTmfatcgAgjZm1Cj1reFggB/cUhJ0dblc8wXGwkxGGazA+qmMhmPH
	KLlwnL6O/wp7ungW+ogLjQygrjw5aJ7xjV+denBZAmuLU1lKSqjg0DHXPoVWsBdvSYbMm2yJpH5
	zy7rCvczlZaoE1f0YOJG7Hn8Ln6NLmEg==
X-Received: by 2002:a05:651c:31c6:b0:37a:84e5:a1cc with SMTP id 38308e7fff4ca-38386a37928mr72388961fa.22.1769098650866;
        Thu, 22 Jan 2026 08:17:30 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.148])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384fb94f6sm56092161fa.49.2026.01.22.08.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 08:17:30 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: arm_scmi: extract domain ID validation helpers
Date: Thu, 22 Jan 2026 19:17:27 +0300
Message-ID: <20260122161728.1225583-1-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the voltage protocol implementation by moving repeated domain
ID boundary checks into dedicated inline functions. This reduces code
duplication and improves maintainability.

The new helpers are scmi_voltage_domain_validate_id() which validates
a domain ID and returns an error code, and scmi_voltage_domain_lookup()
which returns a pointer to the domain structure or an error pointer.
These are used consistently across the voltage operations.
No functional changes are introduced - the validation logic remains
identical to the original inline checks.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
Hello maintainers and reviewers,

Continuing the refactoring work from the previous one [1], this patch
extracts repeated domain ID boundary checks in the voltage protocol into
dedicated helper functions. This improves code maintainability by reducing
duplication and centralizing the validation logic.

The patch introduces two inline helpers:
* scmi_voltage_domain_validate_id(): validates domain ID and returns an
error code
* scmi_voltage_domain_lookup(): returns pointer to domain struct or error

Thank you!

[1] https://lore.kernel.org/all/20251103161044.2269377-1-a.shimko.dev@gmail.com/T/#u
--
Regards,
artem

 drivers/firmware/arm_scmi/voltage.c | 59 ++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 18 deletions(-)

diff --git a/drivers/firmware/arm_scmi/voltage.c b/drivers/firmware/arm_scmi/voltage.c
index 17127880e10a..62010df24053 100644
--- a/drivers/firmware/arm_scmi/voltage.c
+++ b/drivers/firmware/arm_scmi/voltage.c
@@ -262,15 +262,37 @@ static int scmi_voltage_descriptors_get(const struct scmi_protocol_handle *ph,
 	return ret;
 }
 
+static inline int
+scmi_voltage_domain_validate_id(const struct scmi_protocol_handle *ph, u32 domain_id)
+{
+	struct voltage_info *vinfo = ph->get_priv(ph);
+
+	if (domain_id >= vinfo->num_domains)
+		return -EINVAL;
+
+	return 0;
+}
+
+static inline struct scmi_voltage_info *
+scmi_voltage_domain_lookup(const struct scmi_protocol_handle *ph, u32 domain_id)
+{
+	struct voltage_info *vinfo = ph->get_priv(ph);
+
+	if (domain_id >= vinfo->num_domains)
+		return ERR_PTR(-EINVAL);
+
+	return vinfo->domains + domain_id;
+}
+
 static int __scmi_voltage_get_u32(const struct scmi_protocol_handle *ph,
 				  u8 cmd_id, u32 domain_id, u32 *value)
 {
 	int ret;
 	struct scmi_xfer *t;
-	struct voltage_info *vinfo = ph->get_priv(ph);
 
-	if (domain_id >= vinfo->num_domains)
-		return -EINVAL;
+	ret = scmi_voltage_domain_validate_id(ph, domain_id);
+	if (ret)
+		return ret;
 
 	ret = ph->xops->xfer_get_init(ph, cmd_id, sizeof(__le32), 0, &t);
 	if (ret)
@@ -290,11 +312,11 @@ static int scmi_voltage_config_set(const struct scmi_protocol_handle *ph,
 {
 	int ret;
 	struct scmi_xfer *t;
-	struct voltage_info *vinfo = ph->get_priv(ph);
 	struct scmi_msg_cmd_config_set *cmd;
 
-	if (domain_id >= vinfo->num_domains)
-		return -EINVAL;
+	ret = scmi_voltage_domain_validate_id(ph, domain_id);
+	if (ret)
+		return ret;
 
 	ret = ph->xops->xfer_get_init(ph, VOLTAGE_CONFIG_SET,
 				     sizeof(*cmd), 0, &t);
@@ -325,25 +347,23 @@ static int scmi_voltage_level_set(const struct scmi_protocol_handle *ph,
 {
 	int ret;
 	struct scmi_xfer *t;
-	struct voltage_info *vinfo = ph->get_priv(ph);
 	struct scmi_msg_cmd_level_set *cmd;
-	struct scmi_voltage_info *v;
+	struct scmi_voltage_info *vi;
 
-	if (domain_id >= vinfo->num_domains)
-		return -EINVAL;
+	vi = scmi_voltage_domain_lookup(ph, domain_id);
+	if (IS_ERR(vi))
+		return PTR_ERR(vi);
 
 	ret = ph->xops->xfer_get_init(ph, VOLTAGE_LEVEL_SET,
 				      sizeof(*cmd), 0, &t);
 	if (ret)
 		return ret;
 
-	v = vinfo->domains + domain_id;
-
 	cmd = t->tx.buf;
 	cmd->domain_id = cpu_to_le32(domain_id);
 	cmd->voltage_level = cpu_to_le32(volt_uV);
 
-	if (!v->async_level_set || mode != SCMI_VOLTAGE_LEVEL_SET_AUTO) {
+	if (!vi->async_level_set || mode != SCMI_VOLTAGE_LEVEL_SET_AUTO) {
 		cmd->flags = cpu_to_le32(0x0);
 		ret = ph->xops->do_xfer(ph, t);
 	} else {
@@ -356,7 +376,7 @@ static int scmi_voltage_level_set(const struct scmi_protocol_handle *ph,
 			if (le32_to_cpu(resp->domain_id) == domain_id)
 				dev_dbg(ph->dev,
 					"Voltage domain %d set async to %d\n",
-					v->id,
+					vi->id,
 					le32_to_cpu(resp->voltage_level));
 			else
 				ret = -EPROTO;
@@ -377,13 +397,16 @@ static int scmi_voltage_level_get(const struct scmi_protocol_handle *ph,
 static const struct scmi_voltage_info * __must_check
 scmi_voltage_info_get(const struct scmi_protocol_handle *ph, u32 domain_id)
 {
-	struct voltage_info *vinfo = ph->get_priv(ph);
+	struct scmi_voltage_info *vi;
 
-	if (domain_id >= vinfo->num_domains ||
-	    !vinfo->domains[domain_id].num_levels)
+	vi = scmi_voltage_domain_lookup(ph, domain_id);
+	if (IS_ERR(vi))
 		return NULL;
 
-	return vinfo->domains + domain_id;
+	if (!vi->num_levels)
+		return NULL;
+
+	return vi;
 }
 
 static int scmi_voltage_domains_num_get(const struct scmi_protocol_handle *ph)
-- 
2.43.0

