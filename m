Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330AB414A27
	for <arm-scmi@vger.kernel.org>; Thu, 13 Aug 2026 11:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786620819; cv=none; b=cfkzzwB7ZJS+T80r2lVolU1E1vMvWrnEFgOVDkJOs0jhoVjg3qoeWuAL8RLLqVWEow9Y20c2s4HqfHIuslzA3zMGvZYoxP8kT4pAGpP0mMqB5aAa0zZDOpwnG/fnLlLztD6aOlGI2oFs6q1coBKGk4QRn38a+nxPwTWUmEb88Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786620819; c=relaxed/simple;
	bh=vyyaGzkDTqUizz6c96B6sxioGyULVLGFC8aE0iZou7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XsKj9/NAfRen4yho2wAZkqPoAGazaQaoYqueRyEmEwqxUssFaTh2D/PiP4FZP7ru5to0MYak3npO/tG1Pbyz2o3SVFsFOiE+vF6cYGFsxnnwIMQyamzKwCByRGBJuejeImpvB4F5UZtUP2PoumnKXZsMMYFYMgcaSu1ebvBshS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h79y3Uim; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h79y3Uim"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F0141F00AC4;
	Thu, 13 Aug 2026 11:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786620817;
	bh=sFnA6Ef7ubnQ2/hX+qzCf4AYCihzuJoRE0dgbY1LGCE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=h79y3UimKev9g0XE2GkoUt5TZHI3tZe9g74UkHcs7Xgl2TfT9R46VhsGhK7RZ8yyg
	 +/5jTS9Mahtj+4qaIxaCInF/VhIZJ3HzfkTVPbQJQZMFsxR0AAxYYFRNdu7OJ2xmMz
	 ViwSmEzbJDQzW5Wz9Zdz/QVrJ08Hs3LrRJk/mJ4p0i0PyIV4DRU+h5zWyeNXYbHK/P
	 1RzLMEfDdEbDqWx34OZT6op4fArhkhgb0WUrOxwznFCIS0fV7tx4l7MtQklz0nnLjs
	 7Ag8OWjrHdT8eQ0OgWNAWuJwAYeBdBGY07rvcsGIdXuZNs/gc+XbDLuOV19pyNYe7S
	 mZ38lw0sxefGQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 13 Aug 2026 12:33:01 +0100
Subject: [PATCH v3 6/9] firmware: arm_scmi: Refactor protocol device
 creation logic
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-acpi_scmi_pcc-v3-6-cb6b88b4ebb3@kernel.org>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
In-Reply-To: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-team@meta.com
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15.2

Move the protocol validation and device creation logic in scmi_probe()
into a reusable scmi_device_check_create() helper.

The helper centralizes checks for the protocol ID range, implementation
availability and duplicate activation before invoking
scmi_create_protocol_devices(). This preserves the existing behavior
while allowing the logic to be reused by the ACPI path, where protocol
child fwnodes are absent.

No functional change intended.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 60 ++++++++++++++++++++++----------------
 1 file changed, 35 insertions(+), 25 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index aad678db0f6e..951ba3df6ba6 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3244,6 +3244,40 @@ static void scmi_enable_matching_quirks(struct scmi_info *info)
 			   rev->sub_vendor_id, rev->impl_ver);
 }
 
+static void scmi_device_check_create(struct fwnode_handle *fwnode, int prot_id,
+				     struct scmi_info *info)
+{
+	int ret;
+	struct device *dev = info->dev;
+	struct scmi_handle *handle = &info->handle;
+
+	if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id)) {
+		dev_err(dev, "Out of range protocol %d\n", prot_id);
+		return;
+	}
+
+	if (!scmi_is_protocol_implemented(handle, prot_id)) {
+		dev_err(dev, "SCMI protocol %d not implemented\n",
+			prot_id);
+		return;
+	}
+
+	/*
+	 * Save this valid fwnode protocol descriptor amongst
+	 * @active_protocols for this SCMI instance.
+	 */
+	ret = idr_alloc(&info->active_protocols, fwnode,
+			prot_id, prot_id + 1, GFP_KERNEL);
+	if (ret != prot_id) {
+		dev_err(dev, "SCMI protocol %d already activated. Skip\n",
+			prot_id);
+		return;
+	}
+
+	fwnode_handle_get(fwnode);
+	scmi_create_protocol_devices(fwnode, info, prot_id, NULL);
+}
+
 static int scmi_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -3372,31 +3406,7 @@ static int scmi_probe(struct platform_device *pdev)
 		if (fwnode_property_read_u32(child, "reg", &prot_id))
 			continue;
 
-		if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id)) {
-			dev_err(dev, "Out of range protocol %d\n", prot_id);
-			continue;
-		}
-
-		if (!scmi_is_protocol_implemented(handle, prot_id)) {
-			dev_err(dev, "SCMI protocol %d not implemented\n",
-				prot_id);
-			continue;
-		}
-
-		/*
-		 * Save this valid fwnode protocol descriptor amongst
-		 * @active_protocols for this SCMI instance.
-		 */
-		ret = idr_alloc(&info->active_protocols, child,
-				prot_id, prot_id + 1, GFP_KERNEL);
-		if (ret != prot_id) {
-			dev_err(dev, "SCMI protocol %d already activated. Skip\n",
-				prot_id);
-			continue;
-		}
-
-		fwnode_handle_get(child);
-		scmi_create_protocol_devices(child, info, prot_id, NULL);
+		scmi_device_check_create(child, prot_id, info);
 	}
 
 	return 0;

-- 
2.43.0

