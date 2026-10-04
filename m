Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F917418360;
	Sun,  4 Oct 2026 08:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791101001; cv=none; b=tSRwITJzVwnCzI4G/iJGiDp9hEo8su5SA6DZGPuf/XQqU0AqbewWFMEi2mNsP7ZKlxRLDuxGXDxSakUDrR6/v3GYFbgCnLm2A7+laVAltQn14PftZwzWnvo5+YobWdRWPtUYoOAZNq/4Fibv6jq0lz13LwZJUlSbLaIut7dv70c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791101001; c=relaxed/simple;
	bh=w4NnxQh1TyOHf86SlCMHmtqOjd3kxzZmKg04sWMsxMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VqGxHUWRczfavdHPMzm4AQhSqmNUgUAlNlnE79g/gEOSkkRYpacb0Kmd+7QnM0kiFSiElkQO1i5GjuIx4E1zhJUMkQjjxWZiI+qHAifTHzKVIndDm7LFazMx5H5oOmUZgztxFBpOn3U46vsDB+JrhUgDluaapDaSQhpFjYvrgh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=kMVTL0ML; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="kMVTL0ML"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41A4C1691;
	Sun,  4 Oct 2026 01:03:15 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71C6B3F763;
	Sun,  4 Oct 2026 01:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791100998; bh=w4NnxQh1TyOHf86SlCMHmtqOjd3kxzZmKg04sWMsxMk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kMVTL0MLhMs47lC/rxg1jPgwmasltblgNjVbNBjtmbpqOtCEXkUfOJjq6BD/omCo+
	 wq8f+lyg0aJ6J6fgyn89Kk0/7L53hw3SLRp4R5KufZAF4zq3t10KsHUj2ifFQ7iwLy
	 n/QXTjGGg3v/2z09Mv6NJGPKxkT0PEQ8McCuC/fg=
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
Subject: [PATCH v13 19/25] firmware: arm_scmi: Add un-managed methods to get/put protocols operations
Date: Sun,  4 Oct 2026 09:01:00 +0100
Message-ID: <20261004080106.3355393-20-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261004080106.3355393-1-cristian.marussi@arm.com>
References: <20261004080106.3355393-1-cristian.marussi@arm.com>
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
index 02e18ed14ac8..303fce8a79c4 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2567,6 +2567,31 @@ scmi_devm_protocol_get(struct scmi_device *sdev, u8 protocol_id,
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
@@ -2623,6 +2648,18 @@ static void scmi_devm_protocol_put(struct scmi_device *sdev, u8 protocol_id)
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
@@ -3354,6 +3391,8 @@ static int scmi_probe(struct platform_device *pdev)
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

