Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795304682;
	b=13EOQ1ekmH2ZKu0Fun4cvfdi35k2VP70ONl0zoHzI/0Gh/kuhV6iFIZs6jGNktKWt5fH
	 fiuyOLBap2/W2ahyHU26QilDHVlYIGN4bj5c2qmVqPvNIhatHxY/qURi3mxLY4FO1J/66
	 s7jEeNJMhex4Ycm6aiXEjpqNHhrIxaHnQ5jWzcAbfJd3svOXQZR07ROaA/QdX6q8sLKF/
	 RrhDSJ6Nh/tSRjAAzlcRIhCG0GetYHOfo738ZvafgMLXQE6a6t9aWtRZ+4f9U8W7hGkn+
	 UV/lX+8G3o71pm4ykbxikd/EhXk4kih6E2X5Yl8DvhsVT7u2QBx5zhSQMcvVWM7edFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795304682;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Yfdde+/hJowzTbg0KjHhSlaVR/+nDe4W6soN7D1vscU=;
	b=xhFg9muliDWXdArGIyrCL9zwJWxi7ZV7+KejmXCf0qKl8xWQWEG7/bT8GlksM0m0ZwrA
	 YSX5/1fqyP2DNRi55Kj1gX8lixOj3SL3CifmGEYARRzL0GoRtyvTcq53hG4r+tgCcoA0m
	 ZPHsSQKF+0UP8onuXCLZJ2yQNf1Ht83a0j62Xg+l0Qvm1HISKN5SrUNavdu7t8pBliTB/
	 PHvWjdBOdsLAMxkdph4LuoJ0YoaUsiBEs453bwY4TbPRaZiiU18PDc78tNiDRNyNDEdyS
	 Ll4ZHwXqmXnjUTgKPjcB9T7nDiFCBUxbZiSK2s/PwL3zpgFn2VX+PBIEDfnZD4XuHPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ZiNGVtjp;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E000B606A331;
	Sat, 21 Nov 2026 23:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E000B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ZiNGVtjp
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BB5E175D;
	Sat, 21 Nov 2026 15:44:38 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FDAF3F632;
	Sat, 21 Nov 2026 15:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795304681; bh=MXfhRpApggBTfwv/7/s4oWFtSJgBGz+mbDFJ2DLWHjI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZiNGVtjp/2ZT9xZrQL4FhHdZxNgCY+hrOBg60Dt9PyXrs6qFLUzd8Bu0p8ni3S/Ss
	 9HAbxks+eivZoHAhgqxDyHZDsJKknjZ6ziiKJK2w/frGSbV03Dkn+OpbrQWP4Gremn
	 5TvC/DugIYHTaGodq+N5yIC4AnosI7bCri46LtKU=
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
	jonathan.cameron@oss.qualcomm.com,
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
Subject: [PATCH v16 24/31] firmware: arm_scmi: Expose per-instance identifier
Date: Sat, 21 Nov 2026 23:39:58 +0000
Message-ID: <20261121234005.1525419-25-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261121234005.1525419-1-cristian.marussi@arm.com>
References: <20261121234005.1525419-1-cristian.marussi@arm.com>
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
index 4b3f291e623a..5203872b57e1 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3451,6 +3451,7 @@ static int scmi_probe(struct platform_device *pdev)
 	idr_init(&info->rx_idr);
 
 	handle = &info->handle;
+	handle->id = info->id;
 	handle->dev = info->dev;
 	handle->version = &info->version;
 	handle->devm_protocol_acquire = scmi_devm_protocol_acquire;
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 4b4c7b336c71..12a980dbc7c8 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -1088,6 +1088,10 @@ struct scmi_notify_ops {
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
@@ -1108,6 +1112,7 @@ struct scmi_notify_ops {
  * @notify_ops: pointer to set of notifications related operations
  */
 struct scmi_handle {
+	unsigned int id;
 	struct device *dev;
 	struct scmi_base_info *version;
 
-- 
2.54.0

