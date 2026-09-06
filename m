Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6214B42589D;
	Sun,  6 Sep 2026 10:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788689309; cv=none; b=fakQDX4UZL/4tbSp9T5lKzSjkd/7XF+21EbzLP95uClPX7uB0qTGfg9Igl+OqpCrVslLpVCAtZjIusJnSJJLvEuk5srgofIJ+fib53vQqEC/RFskDy3HMWw4aaKazA7kj7Ttg7rAt/szqVRSVHHBkgNJF67vGc1LioRgYGZ4RsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788689309; c=relaxed/simple;
	bh=Z4XAKMl4RMOK5W30PhQGzYX/oEEluOfmyRNtc3qCBsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ndrtyL3VjMrBdOyIZX2kJDzk0CCSj7MeJs7H3cce8F9j3qtVwKLhignbkigfSpKlTu8Cq2IoN4qwIldj1aFVkxIB7wUDipNywsPjQHhbhRGK2AAnc+Qy015RZKdATrEiDZFvTkisB/oL79yGOr9eyYLN5rS4fv2C9SCNF+/etx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=dM2Zsekj; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dM2Zsekj"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3BC71BA8;
	Sun,  6 Sep 2026 03:08:23 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD92F3F7D8;
	Sun,  6 Sep 2026 03:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788689307; bh=Z4XAKMl4RMOK5W30PhQGzYX/oEEluOfmyRNtc3qCBsQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dM2ZsekjZyjf2DpJM+W73nvQPKPnq5x7zuYw78TqAOyrhd8Xu3drvhjEwpuGunS9d
	 Uy98rRhhfx8ZKbwLX00n06Yc8HXW9m9rwRtb2k6AUDjUnXZ+m/DpVKCXegA4Hj2sWA
	 ZR1Zc25jw2MtIb29mfTgbjWIXDoKdHtKBi5/g/bw=
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
Subject: [PATCH v11 18/25] firmware: arm_scmi: Expose per-instance identifier
Date: Sun,  6 Sep 2026 11:06:16 +0100
Message-ID: <20260906100623.3488327-19-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260906100623.3488327-1-cristian.marussi@arm.com>
References: <20260906100623.3488327-1-cristian.marussi@arm.com>
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
index e8d93690ecc2..c003e7be7696 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3352,6 +3352,7 @@ static int scmi_probe(struct platform_device *pdev)
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

