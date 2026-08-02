Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D6B23BF676;
	Sun,  2 Aug 2026 14:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785682730; cv=none; b=J1SsV8WbV9VLw1AUhFLNFWZ1XsE5t+Dy+6oOohapPq0ch1RI114uAGllJjDAc80ierLYOTLE3cHR/nnzVODTHveLxTEEZsQRCELR1wQs2xpNzB70C47bAvWqWmkXcOuJXm6hWzHNNjDqXI8XzD1qgssn6zoWUsSbAjm5svLoZZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785682730; c=relaxed/simple;
	bh=SE9i3/tTu5pAP6GiKh0wKiCLy7dkcpp7/uGlOfBJfxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lyjwnJLFvYhdVoK7tL8+Rvv1x2dwHg/GUB0VCbgtihGtbQex9Zv+czhk7w7od+u640Cn+NTFElr4JUSfbO3crkMG0iKNBj9PduDY/LK51R8zyes92ViWYUEkdGyR7+w9QPFe0wYz+PM+8oYUDYqpYK0S2g83DOTEf+RikwSPQn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=SDRSg/jO; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="SDRSg/jO"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B20C3143D;
	Sun,  2 Aug 2026 07:58:44 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 437393FB3E;
	Sun,  2 Aug 2026 07:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785682728; bh=SE9i3/tTu5pAP6GiKh0wKiCLy7dkcpp7/uGlOfBJfxE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SDRSg/jOquP2eHxP6llvhKYgUhsJcXY6cWzhAJW+zrl5laCKtKYVDawVfyKxJP7Zq
	 zWRsO3x/MTFSxZ43MJU5f3o5er0J4YchpkmjEUbtcSQY42WIL54YXIuAvrSi/Ot7D7
	 DJxKJ/duWO8HoQq1/nALuZnfhPnG7/s/efk6II2k=
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
Subject: [PATCH v7 18/23] firmware: arm_scmi: Expose per-instance identifier
Date: Sun,  2 Aug 2026 15:56:13 +0100
Message-ID: <20260802145618.1952804-19-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260802145618.1952804-1-cristian.marussi@arm.com>
References: <20260802145618.1952804-1-cristian.marussi@arm.com>
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
 drivers/firmware/arm_scmi/driver.c | 1 +
 include/linux/scmi_protocol.h      | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index d209b3ca0174..87489bc075c2 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3337,6 +3337,7 @@ static int scmi_probe(struct platform_device *pdev)
 	idr_init(&info->rx_idr);
 
 	handle = &info->handle;
+	handle->id = info->id;
 	handle->dev = info->dev;
 	handle->version = &info->version;
 	handle->devm_protocol_acquire = scmi_devm_protocol_acquire;
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 5ca8513385a3..198768752168 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -1127,6 +1127,10 @@ struct scmi_notify_ops {
 /**
  * struct scmi_handle - Handle returned to ARM SCMI clients for usage.
  *
+ * @id: A unique positive natural integer identifying the SCMI Instance
+ *	associated with this handle to be used across all drivers for
+ *	naming purposes: same identifier used internally as the root for
+ *	the debugfs per-instance tree.
  * @dev: pointer to the SCMI device
  * @version: pointer to the structure containing SCMI version information
  * @devm_protocol_acquire: devres managed method to get hold of a protocol,
@@ -1147,6 +1151,7 @@ struct scmi_notify_ops {
  * @notify_ops: pointer to set of notifications related operations
  */
 struct scmi_handle {
+	unsigned int id;
 	struct device *dev;
 	struct scmi_base_info *version;
 
-- 
2.54.0

