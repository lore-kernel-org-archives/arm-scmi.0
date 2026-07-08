Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C7E358389
	for <arm-scmi@vger.kernel.org>; Wed,  8 Jul 2026 09:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783501233; cv=none; b=WSwgQ6SiWbyeEjohKoxCRvMNIeOC9a8wafBns1cACoriBp/i6Z8n11WtafF0VJfAJIE+DKT3mtPKbI+UQ7qyMz6nLgyYHGCqNojEiEDqw88vC4XA3xI+jgn7noMcnLu6xWxCEoQZKzhyNRi3yhz7w/D7IIc8fMBjIybF9f5pAtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783501233; c=relaxed/simple;
	bh=ljV7hNWEUA6gw/k0+QVZW4PsQbB+Hx/mnj+iPgDDRz4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JIOE9ltmrEn1egMKXK75HUZudWOsOk8NENwUMOkiQOsODWSIWVHlXyfeItZ8mNDnWUjv63oeGVp0w5cV0ODwiGoT++e2x/SLYizLJ9CY66ZRF1gonhXvkkmf5neS9PyCyVKeEydD38mCavyH1KMCEBAA7kA9OXoYGb1bmqtNotI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IkxvWSBD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IkxvWSBD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D2541F00A3A;
	Wed,  8 Jul 2026 09:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783501232;
	bh=JaB0WB569Mzor3NPRy78URi25bnDtlJxO5Le7z0tLes=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=IkxvWSBD4zRa1grARNJZshA001gYN4+80gyDXPByL1iCOIgdw2k8Pwmm0/6uM+Bzq
	 q26PSMcJgUqbHnPclvlMiM2P8GzTJwQypEWsz2yqNAfdtwKsyks7UaaRgm+FYueogG
	 Ugu1DgEEBPTFQlB+ADwb0yRu71DNB3VL1usP1J0Aqtlh93v76oW4n8RN+eVwAQVkzO
	 ICt+b36wrhzgsZFBZQT2e7k6DPpDa76gSOdJXVZBqKPZnNBZC47V1Y4cxy36rgmTzT
	 sf0eNK3HuzRX4/yevCdgkyGH51wY6dR7TaXxLb1gCTBC2MEXhPgmmJctKBZc1YvFuw
	 8GGYTfah8MC7Q==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 08 Jul 2026 10:00:04 +0100
Subject: [PATCH v4 08/16] firmware: arm_scmi: Unregister device notifier
 before IDR teardown
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-scmi_core_fixes-v4-8-53142cd60b63@kernel.org>
References: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
In-Reply-To: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

The requested-devices notifier looks up protocol fwnodes from the
active_protocols IDR. During remove, unregister the notifier before
releasing and destroying active_protocols so no notifier callback can race
with the IDR teardown.

Keep the bus notifier registered until after the protocol state is torn
down, matching the existing remove ordering for SCMI bus users.

Fixes: 53b8c25df708 ("firmware: arm_scmi: Add common notifier helpers")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 41f1b2c49521..67267507ea1d 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3403,6 +3403,9 @@ static void scmi_remove(struct platform_device *pdev)
 	list_del(&info->node);
 	mutex_unlock(&scmi_list_mutex);
 
+	blocking_notifier_chain_unregister(&scmi_requested_devices_nh,
+					   &info->dev_req_nb);
+
 	/* Stop transport callbacks before tearing down notifications. */
 	scmi_cleanup_txrx_channels(info);
 	scmi_notification_exit(&info->handle);
@@ -3415,8 +3418,6 @@ static void scmi_remove(struct platform_device *pdev)
 		of_node_put(child);
 	idr_destroy(&info->active_protocols);
 
-	blocking_notifier_chain_unregister(&scmi_requested_devices_nh,
-					   &info->dev_req_nb);
 	bus_unregister_notifier(&scmi_bus_type, &info->bus_nb);
 
 	ida_free(&scmi_id, info->id);

-- 
2.43.0

