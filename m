Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BFF74C52E6;
	Fri, 16 Oct 2026 18:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792177101; cv=none; b=FlX8zMmdKB+VIhUJEauD4zCaHHPlqMzCeRluzRhGqQL3fvitSa5MFQETadel43KnAFCp8jvTdqZ2+TERdHm2N+H30bRZXLYzD/yAXHGw+FJs2mIkXiO4Q5jaML//7YPtwkgHLW3cc5HdmdQJvgJ/zqY4sG9ZuUR/ts0TMDL1h7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792177101; c=relaxed/simple;
	bh=42kHlPTKUszw9XXnkRPigop9KSGW5HQcvZHZc6CeDBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rp3oAtfNSAvRhef/DuuWmNrkB923gXwPb05/NbURXJYvt18deneBi9GgQ20F0w25iagtL/ZR1HOEAnCKe8WcxR0gb5ufmrmtmbf/O3mPhMdshdBS0AplwviiH9OxFrvWt0oymGEr9i/OByUjxQinhy+bvAcULusjBu5FyZxgxow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=sRRZFigX; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="sRRZFigX"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD6C01516;
	Fri, 16 Oct 2026 11:58:09 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B5A343F7B4;
	Fri, 16 Oct 2026 11:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792177093; bh=42kHlPTKUszw9XXnkRPigop9KSGW5HQcvZHZc6CeDBk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sRRZFigXMtycfiB5lWrxHaXEqKuY9lnjRWlz8U18t2eQLzEEf4rC+JkyxDPzxOQWI
	 22xm7gKRgoeBpA5boabEbVDaiGUul74f0sf5QxsdHLyvCw1QtueRbfd124VqYxS1uM
	 cibw0MIHy/ctVbQiE27pjc2WkzbNDfS63ZdIO2kk=
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
Subject: [PATCH v14 26/32] firmware: arm_scmi: Add un-managed methods to get/put protocols operations
Date: Fri, 16 Oct 2026 19:55:47 +0100
Message-ID: <20261016185553.2794459-27-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261016185553.2794459-1-cristian.marussi@arm.com>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a couple of simple common methods to be able to manually get and put
protocol operations to address situation in which devres managed methods
cannot be used.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v10 --> v11
 - fixed a few comments typos
---
 drivers/firmware/arm_scmi/driver.c | 39 ++++++++++++++++++++++++++++++
 include/linux/scmi_protocol.h      |  7 ++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 9531027a12c4..5e33b38cc6bb 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2593,6 +2593,31 @@ scmi_devm_protocol_get(struct scmi_device *sdev, u8 protocol_id,
 	return pi->proto->ops;
 }
 
+/**
+ * scmi_protocol_operations_get  - UnManaged get protocol operations
+ *
+ * @handle: A reference to the SCMI platform instance.
+ * @protocol_id: The protocol being acquired.
+ * @ph: A pointer reference used to pass back the associated protocol handle.
+ */
+static const void __must_check *
+scmi_protocol_operations_get(const struct scmi_handle *handle, u8 protocol_id,
+			     struct scmi_protocol_handle **ph)
+{
+	struct scmi_protocol_instance *pi;
+
+	if (!ph)
+		return ERR_PTR(-EINVAL);
+
+	pi = scmi_get_protocol_instance(handle, protocol_id);
+	if (IS_ERR(pi))
+		return pi;
+
+	*ph = &pi->ph;
+
+	return pi->proto->ops;
+}
+
 /**
  * scmi_devm_protocol_acquire  - Devres managed helper to get hold of a protocol
  * @sdev: A reference to an scmi_device whose embedded struct device is to
@@ -2649,6 +2674,18 @@ static void scmi_devm_protocol_put(struct scmi_device *sdev, u8 protocol_id)
 	WARN_ON(ret);
 }
 
+/**
+ * scmi_protocol_operations_put  - UnManaged put protocol operations
+ *
+ * @handle: A reference to the SCMI platform instance.
+ * @protocol_id: The protocol being released.
+ */
+static void scmi_protocol_operations_put(const struct scmi_handle *handle,
+					 u8 protocol_id)
+{
+	scmi_protocol_release(handle, protocol_id);
+}
+
 /**
  * scmi_is_transport_atomic  - Method to check if underlying transport for an
  * SCMI instance is configured as atomic.
@@ -3380,6 +3417,8 @@ static int scmi_probe(struct platform_device *pdev)
 	handle->devm_protocol_acquire = scmi_devm_protocol_acquire;
 	handle->devm_protocol_get = scmi_devm_protocol_get;
 	handle->devm_protocol_put = scmi_devm_protocol_put;
+	handle->protocol_get = scmi_protocol_operations_get;
+	handle->protocol_put = scmi_protocol_operations_put;
 	handle->is_transport_atomic = scmi_is_transport_atomic;
 
 	/* Setup all channels described in the DT at first */
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 3714be973bd0..436c20d1528d 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -1137,6 +1137,9 @@ struct scmi_notify_ops {
  * @devm_protocol_get: devres managed method to acquire a protocol and get specific
  *		       operations and a dedicated protocol handler
  * @devm_protocol_put: devres managed method to release a protocol
+ * @protocol_get: unmanaged method to acquire a protocol and get specific
+ *		  operations and a dedicated protocol handler
+ * @protocol_put: unmanaged method to release a protocol
  * @is_transport_atomic: method to check if the underlying transport for this
  *			 instance handle is configured to support atomic
  *			 transactions for commands.
@@ -1159,6 +1162,10 @@ struct scmi_handle {
 		(*devm_protocol_get)(struct scmi_device *sdev, u8 proto,
 				     struct scmi_protocol_handle **ph);
 	void (*devm_protocol_put)(struct scmi_device *sdev, u8 proto);
+	const void __must_check *
+		(*protocol_get)(const struct scmi_handle *handle, u8 proto,
+				struct scmi_protocol_handle **ph);
+	void (*protocol_put)(const struct scmi_handle *handle, u8 proto);
 	bool (*is_transport_atomic)(const struct scmi_handle *handle,
 				    unsigned int *atomic_threshold);
 	const struct scmi_notify_ops *notify_ops;
-- 
2.54.0

