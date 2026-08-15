Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00AC542D761;
	Sat, 15 Aug 2026 18:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786819064; cv=none; b=pMALtSDJthmK3wbOsyKuTXYSpD0FD8etuJFUQ8XHF3fpAIpJagCDl2119ZsQ+mFmRT/ht5t5rs9CbBC+B3R0ixHxrdXMfijoNOOLf4Z9Z0z3RuGIBpu216/aOLWubjXuQdddT6WYJZ0hD3I9mGs0IgRJ+mDiM5uYIP2U9MsStFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786819064; c=relaxed/simple;
	bh=Z0r4rM8507TO+Aoce0sL/jnAEskwgtQpU8zB5M2zbsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hfppUJaPax3vgZd1YndGTGS1pviKnOX5rn6HrdWbz89yT4cZ/5+aYdQbyXk5J0mNDq9uA4uHv861rdEbd/AY46ElMne7b9pg9pgHRXBEk4ibB/GDvhUwktqDSiwfmzBhEbD/v/Yt6+MgXO+hluKHZ39Og5nPEXK5RlF1RTsN/o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=CWaOYaUJ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="CWaOYaUJ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 860C81D31;
	Sat, 15 Aug 2026 11:37:38 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B97E3F632;
	Sat, 15 Aug 2026 11:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786819062; bh=Z0r4rM8507TO+Aoce0sL/jnAEskwgtQpU8zB5M2zbsQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CWaOYaUJvjm7CIpPU6msywoAUJRSgNm8+RMLPkKtn81HIx/E9qYzIu9VGBvWMWxtp
	 VMqxUeEDWXTvUu27S1ezXvE0Top59TEbEMblx4/dOGxC1FJFWOAvsh89tPhY8ru7VM
	 kLMCOwL4ywAHySyngtPwCx1R5gpQdE1zECEM4Exg=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	d-gole@ti.com,
	jic23@kernel.org,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	david@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v9 18/24] firmware: arm_scmi: Expose per-instance identifier
Date: Sat, 15 Aug 2026 19:35:46 +0100
Message-ID: <20260815183552.3250194-19-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260815183552.3250194-1-cristian.marussi@arm.com>
References: <20260815183552.3250194-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When multiple SCMI instances are configured, the SCMI stack probes and
it is initialized multiple times: one core stack for each defined instance.

Each istance is simply identified internally with a number and such number
is already exposed to the user to name the root of the per-instance debugfs
subtree, if enabled.

Expose such unique identifier to the SCMI drivers so that they can use
that same identifier when in need to name their per-instance resources.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v7 --> v8
 - fixed Doxygen 'non-negative' integer
---
 drivers/firmware/arm_scmi/driver.c | 1 +
 include/linux/scmi_protocol.h      | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 281930ffd567..d7b7a26eabe6 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3341,6 +3341,7 @@ static int scmi_probe(struct platform_device *pdev)
 	idr_init(&info->rx_idr);
 
 	handle = &info->handle;
+	handle->id = info->id;
 	handle->dev = info->dev;
 	handle->version = &info->version;
 	handle->devm_protocol_acquire = scmi_devm_protocol_acquire;
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 037b486dc873..a85c00bf72f2 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -1125,6 +1125,10 @@ struct scmi_notify_ops {
 /**
  * struct scmi_handle - Handle returned to ARM SCMI clients for usage.
  *
+ * @id: A unique non-negative natural integer identifying the SCMI Instance
+ *	associated with this handle to be used across all drivers for
+ *	naming purposes: same identifier used internally as the root for
+ *	the debugfs per-instance tree.
  * @dev: pointer to the SCMI device
  * @version: pointer to the structure containing SCMI version information
  * @devm_protocol_acquire: devres managed method to get hold of a protocol,
@@ -1145,6 +1149,7 @@ struct scmi_notify_ops {
  * @notify_ops: pointer to set of notifications related operations
  */
 struct scmi_handle {
+	unsigned int id;
 	struct device *dev;
 	struct scmi_base_info *version;
 
-- 
2.54.0

