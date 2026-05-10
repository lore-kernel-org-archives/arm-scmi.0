Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 850E33AE6E9;
	Sun, 10 May 2026 16:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778429165; cv=none; b=E+t/DhJ9bRai7PU+F8/A50EKEmB376Tm2bWab78NX/l2GbGYt4GWIbWX6em2NosD6NOgZebRLnt0/B5SAE3LmU+ifT9f14TC1zVThkqY09IYVHSmnul9vKq1uI6nM202jqPJtCCyyIrN+R1oC8V879m3vJK8wY4bfDmrOprdVX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778429165; c=relaxed/simple;
	bh=F8vJTCBI4I5uGCkR814PIgh1GPQVvIXCgM00JJbgA/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LEMev+O/LZ8s2yrJut8Ov1A+xZOKdzZ39hLcA27/Y+D6R7xSSuyrXWLehWm7T5H1vnkT1vlepzwfohDKOt2+Qw7PS3SeyBo1jNhCwTZuxui7cMMjnTOC/mPS9NC46Rb4aLg7W5O2KcTmj8U+ZFBCZOYMzsUQ8d4qoYkpfP7Vuog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Cko+oeNM; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Cko+oeNM"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 912462A68;
	Sun, 10 May 2026 09:05:57 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5765D3F836;
	Sun, 10 May 2026 09:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778429162; bh=F8vJTCBI4I5uGCkR814PIgh1GPQVvIXCgM00JJbgA/4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cko+oeNMv/Ig3vwFiSCaMydLGhIpo+I5VdahVwH9YwqnVijIMjv5v5s2uQ8p0wAPn
	 uQXpdbRXUem7YRI9oAXmAEE0MtKmDNSMLjqHBkeltJzSAsmF7W2E7TTn4w8aOzIfHC
	 8UyoP8ed4eV7lDKp7fElGu0djPCfA9aNXovtuhg8=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	philip.radford@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	gatien.chevallier@foss.st.com,
	u.kleine-koenig@baylibre.com,
	dakr@kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v2 2/4] firmware: arm_scmi: Add a generic transport supplier
Date: Sun, 10 May 2026 17:05:25 +0100
Message-ID: <20260510160527.3537474-3-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260510160527.3537474-1-cristian.marussi@arm.com>
References: <20260510160527.3537474-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the capability to define a common generic transport supplier which
embeds the logic needed to support one single unique instance of transport
supplier.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/common.h | 111 +++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index af6f9f498e14..e2885173594a 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -502,6 +502,117 @@ struct scmi_transport {
 	const struct scmi_transport_handle *th;
 };
 
+/**
+ * struct scmi_transport_supplier  - Transport descriptor
+ * @mtx: A mutex to protect @available
+ * @available: A reference to an initialized transport device, when available.
+ *	       This reference is implicitly used to track the status of the
+ *	       supplier and it can cycle through the following 3 states:
+ *	       1. NOT_READY - PTR_ERR(-EPROBE_DEFER): no supplier available;
+ *		  this is the transport initial state.
+ *	       2. AVAILABLE - <supplier_dev>: a transport supplier has been
+ *		  initialized and it is available, ready to use.
+ *	       3. BUSY _ PTR_ERR(-EBUSY): transport supplier is currently in use.
+ * @th: An embedded transport handle object that embeds the helpers
+ *	implementing the above mentioned logic
+ *
+ * Note that this transport driver enforces single instance probing.
+ */
+struct scmi_transport_supplier {
+	/* Protect @available */
+	struct mutex mtx;
+	struct device *available;
+	const struct scmi_transport_handle th;
+};
+
+#define to_sup(t)	container_of(t, struct scmi_transport_supplier, th)
+
+/**
+ * scmi_transport_supplier_put  - A helper to dispose of a supplier
+ * @th: A reference to the transport handle to use
+ * @supplier: A reference to the device supplier to manage, cannot be NULL
+ *	      or ERR_PTR.
+ *
+ * Note that putting a supplier will have different effect based on the
+ * current state of scmi_transport_supplier.available:
+ *  - NOT_READY/BUSY: @supplier will be set as the new available device: this
+ *		      can be used to made available a supplier OR stop using one.
+ *  - AVAILABLE: if the @supplier we are disposing of matches the currently
+ *		 available one, roll back to NOT_READY state.
+ *		 Any other attempt to override an available supplier with a
+ *		 new one is rejected, effectively enforcing one single supplier.
+ *
+ * Return: 0 on Success, errno otherwise.
+ */
+static inline int
+scmi_transport_supplier_put(const struct scmi_transport_handle *th,
+			    struct device *supplier)
+{
+	struct scmi_transport_supplier *sup = to_sup(th);
+
+	/* Nothing to do when the provided supplier was never real */
+	if (IS_ERR_OR_NULL(supplier))
+		return 0;
+
+	guard(mutex)(&sup->mtx);
+	switch (PTR_ERR_OR_ZERO(sup->available)) {
+	case -EPROBE_DEFER:
+	case -EBUSY:
+		sup->available = supplier;
+		break;
+	case 0:
+		/* Putting a supplier when in the AVAILABLE state causes a
+		 * transition back to the NOT_READY state, BUT only if the
+		 * supplier we are disposing of was exactly the device that was
+		 * previously made readily available.
+		 */
+		if (supplier != sup->available)
+			return -EINVAL;
+		sup->available = ERR_PTR(-EPROBE_DEFER);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/**
+ * scmi_transport_supplier_get  - A helper to get hold of a supplier
+ * @th: A reference to the transport handle to use
+ *
+ * Note that, trying to get a supplier device can return:
+ *  - a ready to use supplier device, (subsequently made unavailable)
+ *  - PTR_ERR(-EPROBE_DEFER): no supplier is available
+ *  - PTR_ERR(-BUSY): supplier was already taken by a previous get
+ *
+ *  This allows the probe to defer and wait when a possible device can
+ *  be reasonably expected to appear.
+ *
+ * Return: a usable supplier device on Success or PTR_ERR on Failure.
+ */
+static inline struct device *
+scmi_transport_supplier_get(const struct scmi_transport_handle *th)
+{
+	struct scmi_transport_supplier *sup = to_sup(th);
+	struct device *supplier;
+
+	guard(mutex)(&sup->mtx);
+	supplier = sup->available;
+	if (!IS_ERR(sup->available))
+		sup->available = ERR_PTR(-EBUSY);
+
+	return supplier;
+}
+
+#define DEFINE_SCMI_TRANSPORT_SUPPLIER(__supplier)		\
+struct scmi_transport_supplier __supplier = {			\
+	.mtx = __MUTEX_INITIALIZER(__supplier.mtx),		\
+	.available = INIT_ERR_PTR(-EPROBE_DEFER),		\
+	.th.supplier_get = scmi_transport_supplier_get,		\
+	.th.supplier_put = scmi_transport_supplier_put,		\
+}
+
 #define DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, __match, __core_ops)\
 static void __tag##_dev_free(void *data)				       \
 {									       \
-- 
2.53.0

