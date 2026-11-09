Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215787;
	b=hmb6Tp0xCAwX9YOlg4z3aZKebSJjv+356a7idfvbPt30J095bFuN2Ml61RaRavzKk9Sv
	 TiNoLnfA58wozs+0ZWHNN4YNn1FWXRqHdda2riBUE2Xe34THQsBgRIBh8KjpP5cTQ7gBa
	 QA6BYYNOnc89OsPSpRgmwXElnmp8RYisutAjNa/q35jgFN8T36l3m8kXfQAb71MslYZFe
	 gtkmzwOCSbvQ40MJW1R+FqIu/S80RZnfV+b1Ry1Vu2aFxPQWRnrZLZToWwBDTzIuH999V
	 ZLpzJUdMG6lpyHuQcV6YCrq218I+owC5t4n9O/QdMjkTujXJlgWJl39sfv3TXi6LCzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215787;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PjsDcIwG04TmODXdDk875Fbl6S3uxlA1cenk9DEJCXo=;
	b=gHR5GeGYHU6dkAw/OnJ1CzOgE01E68BebKjJyfxIUKWPuQqVuF0Q/sCZpQ3kYn764IGF
	 Q5EJOEF8TApUreGHDe7FNPkP9LuHAZ9b2BothIXCgjdyLZAGKrL/vTj2hEkE0Esyip3uK
	 yJVJLEhje3Ud2vZK+JWRM0MpxnQrGpAhg1nZEN9U05OUXSTVoi9816m77oOtyy4s5yfM6
	 gy2YOAWpQuFZlDCpgskTLo3L/NN7DzTW1JR7oyfK+P8Wl9NIw+r6RS4rHLPMsECTBTt1p
	 jB/+AoCGh0ji1yKHLPg4vswXiux6v/Sd3Fx/lKwrToQ39nrQO2ChA9DL//wD1TdJaxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=WGsaCd4o;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273B0606A339;
	Mon,  9 Nov 2026 09:16:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 273B0606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=WGsaCd4o
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7959315A1;
	Mon,  9 Nov 2026 01:16:23 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98D6E3F85F;
	Mon,  9 Nov 2026 01:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794215786; bh=24aCbuqzFNJvnaf3Y/y65CRhQlCLaPit95os5BSF7Lc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WGsaCd4ooRqqRmTRsZoMt6nQaIZznMi+W2WaM3T3xI1uIMggRpoLiJRufIQrueYlb
	 Y9hrUBQxIYAn8BzaNCFC64mfb/HwOMWTebZ9OOnt72Wwx25nwQU3QzUwC6V8t0RlK0
	 R4s4R1AFtkIu2vCAuxROsBkBHGQFwS4keHVRYI3k=
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
Subject: [PATCH v15 28/35] firmware: arm_scmi: Add un-managed methods to get/put protocols operations
Date: Mon,  9 Nov 2026 09:12:14 +0000
Message-ID: <20261109091221.2532706-29-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109091221.2532706-1-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
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
index 015dc8473161..c2166a48bc86 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2641,6 +2641,31 @@ scmi_devm_protocol_get(struct scmi_device *sdev, u8 protocol_id,
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
@@ -2697,6 +2722,18 @@ static void scmi_devm_protocol_put(struct scmi_device *sdev, u8 protocol_id)
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
@@ -3489,6 +3526,8 @@ static int scmi_probe(struct platform_device *pdev)
 	handle->devm_protocol_acquire = scmi_devm_protocol_acquire;
 	handle->devm_protocol_get = scmi_devm_protocol_get;
 	handle->devm_protocol_put = scmi_devm_protocol_put;
+	handle->protocol_get = scmi_protocol_operations_get;
+	handle->protocol_put = scmi_protocol_operations_put;
 	handle->is_transport_atomic = scmi_is_transport_atomic;
 
 	/* Setup all channels described in the fwnode at first */
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 4fa32d629e7a..8c143cbddb5f 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -1145,6 +1145,9 @@ struct scmi_notify_ops {
  * @devm_protocol_get: devres managed method to acquire a protocol and get specific
  *		       operations and a dedicated protocol handler
  * @devm_protocol_put: devres managed method to release a protocol
+ * @protocol_get: unmanaged method to acquire a protocol and get specific
+ *		  operations and a dedicated protocol handler
+ * @protocol_put: unmanaged method to release a protocol
  * @is_transport_atomic: method to check if the underlying transport for this
  *			 instance handle is configured to support atomic
  *			 transactions for commands.
@@ -1167,6 +1170,10 @@ struct scmi_handle {
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

