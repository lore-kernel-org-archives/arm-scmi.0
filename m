Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5073E2778;
	Mon,  4 May 2026 16:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777913550; cv=none; b=q1H0jSseBW8fyh8fPrOufkFbVRPmvfQp9laWspizCOzF+wzv7AQMhULHhzqeqskeKI114iQB5GWKGWbZ4mwjmUtyCx600RADL/vUGs77TBg7XPYMyWPulY5zK8oz+1NvMxY7VGAMsBwsPFLNCgDA7dTAW6j/OQbBrgz/tgvNtBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777913550; c=relaxed/simple;
	bh=b1TfSp8pJ8Zlwfe8b5wy069zWBg5zqbxvqUZ5fMpVtk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n4SKToMf9whft1EvbgFCeK2oWmAAYyFZMlYBMso987tRbrba1xAcNCoUT6FVfYVewLeZsBCk+gH108fajoLyGkQ/wDSWc29nxg6G9WZ6aDPZpuS19naXLZeHWLDBqN7yyBbR2R8P9GrnYDLtmLsWUDATwbaHum9Z5x+1kzoeG00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=aE8ymg7J; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="aE8ymg7J"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DB4E1691;
	Mon,  4 May 2026 09:52:19 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D4C4E3F763;
	Mon,  4 May 2026 09:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777913545; bh=b1TfSp8pJ8Zlwfe8b5wy069zWBg5zqbxvqUZ5fMpVtk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aE8ymg7J003652yTbbJuowZD3DnZam5JFGJ5kay2wilqWsmGHAkT7hqx9FRPx39/M
	 QnpIn0TS2aAOMVkhdjPcgTplHHeNo9ZO2Nvdfk1GHCXLoueeO8yCW+ouA+3cU+y2Pu
	 +3YqiA4oDaABhYisye+ZwNng56qwYA1QxYpHo4oA=
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
Subject: [PATCH v1 3/3] firmware: arm_scmi: optee: Rework transport probe sequence
Date: Mon,  4 May 2026 17:52:04 +0100
Message-ID: <20260504165204.639499-4-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260504165204.639499-1-cristian.marussi@arm.com>
References: <20260504165204.639499-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the new per-instance transport handles helpers to synchronize and
optionally defer the core SCMI driver probe up until the transport driver
has completely been initialized and it is fully operational as a supplier.

Introduce proper module init/exit routines while removing the ugly trick of
registering a driver from within the probe sequence of another one, just to
avoid to have to deal with probe deferrals.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/transports/optee.c | 118 +++++++++++++++++--
 1 file changed, 105 insertions(+), 13 deletions(-)

diff --git a/drivers/firmware/arm_scmi/transports/optee.c b/drivers/firmware/arm_scmi/transports/optee.c
index 07ae18d5279d..6950089fb659 100644
--- a/drivers/firmware/arm_scmi/transports/optee.c
+++ b/drivers/firmware/arm_scmi/transports/optee.c
@@ -154,6 +154,79 @@ static struct scmi_transport_core_operations *core;
 /* There can be only 1 SCMI service in OP-TEE we connect to */
 static struct scmi_optee_agent *scmi_optee_private;
 
+/**
+ * struct scmi_optee_suppliers  - Transport descriptor
+ * @mtx: A mutex to protect @available
+ * @available: A reference to an initialized transport device ready to use
+ *	       which  will cycle through the following 3 states:
+ *	       1. PTR_ERR(-EPROBE_DEFER) at start before transport is ready
+ *	       2. <supplier_dev> when transport is initialized, ready for use,
+ *	          but still unused
+ *	       3. PTR_ERR(-EBUSY) when transport supplier device is in use
+ * @th: An embedded transport handle object that embeds the helpers
+ *	implementing the above mentioned logic
+ *
+ * Note that this transport driver enforces single instance probing.
+ */
+struct scmi_optee_suppliers {
+	/* Protect @available */
+	struct mutex mtx;
+	struct device *available;
+	const struct scmi_transport_handle th;
+};
+
+#define to_osup(t)	container_of(t, struct scmi_optee_suppliers, th)
+
+static int scmi_optee_supplier_init(const struct scmi_transport_handle *th,
+				    struct device *dev)
+{
+	struct scmi_optee_suppliers *osup = to_osup(th);
+
+	guard(mutex)(&osup->mtx);
+	/* Was any transport already registered ? */
+	if (!IS_ERR(osup->available))
+		return -EBUSY;
+
+	osup->available = dev;
+
+	return 0;
+}
+
+static struct device *
+scmi_optee_supplier_get(const struct scmi_transport_handle *th)
+{
+	struct scmi_optee_suppliers *osup = to_osup(th);
+	struct device *supplier;
+
+	guard(mutex)(&osup->mtx);
+	supplier = osup->available;
+	if (!IS_ERR(supplier))
+		osup->available = ERR_PTR(-EBUSY);
+
+	return supplier;
+}
+
+static void scmi_optee_supplier_put(const struct scmi_transport_handle *th,
+				    struct device *supplier)
+{
+	struct scmi_optee_suppliers *osup = to_osup(th);
+
+	guard(mutex)(&osup->mtx);
+	osup->available = supplier;
+}
+
+static void scmi_optee_supplier_cleanup(const struct scmi_transport_handle *th)
+{
+	scmi_optee_supplier_put(th, ERR_PTR(-EPROBE_DEFER));
+}
+
+static struct scmi_optee_suppliers scmi_transport_suppliers = {
+	.mtx = __MUTEX_INITIALIZER(mutexname),
+	.available = INIT_ERR_PTR(-EPROBE_DEFER),
+	.th.supplier_get = scmi_optee_supplier_get,
+	.th.supplier_put = scmi_optee_supplier_put,
+};
+
 /* Open a session toward SCMI OP-TEE service with REE_KERNEL identity */
 static int open_session(struct scmi_optee_agent *agent, u32 *tee_session)
 {
@@ -522,7 +595,7 @@ static struct scmi_desc scmi_optee_desc = {
 };
 
 static const struct of_device_id scmi_of_match[] = {
-	{ .compatible = "linaro,scmi-optee" },
+	{ .compatible = "linaro,scmi-optee", .data = &scmi_transport_suppliers.th},
 	{ /* Sentinel */ },
 };
 
@@ -561,15 +634,12 @@ static int scmi_optee_service_probe(struct tee_client_device *scmi_pta)
 	if (ret)
 		goto err;
 
-	/* Ensure agent resources are all visible before scmi_optee_private is */
-	smp_mb();
-	scmi_optee_private = agent;
-
-	ret = platform_driver_register(&scmi_optee_driver);
-	if (ret) {
-		scmi_optee_private = NULL;
+	ret = scmi_optee_supplier_init(&scmi_transport_suppliers.th, agent->dev);
+	if (ret)
 		goto err;
-	}
+
+	/* Ensure initialized scmi_optee_private is visible */
+	smp_store_mb(scmi_optee_private, agent);
 
 	return 0;
 
@@ -586,13 +656,12 @@ static void scmi_optee_service_remove(struct tee_client_device *scmi_pta)
 	if (!scmi_optee_private)
 		return;
 
-	platform_driver_unregister(&scmi_optee_driver);
-
 	if (!list_empty(&scmi_optee_private->channel_list))
 		return;
 
-	/* Ensure cleared reference is visible before resources are released */
+	/* Ensure scmi_optee_private is visible as NULL */
 	smp_store_mb(scmi_optee_private, NULL);
+	scmi_optee_supplier_cleanup(&scmi_transport_suppliers.th);
 
 	tee_client_close_context(agent->tee_ctx);
 }
@@ -616,7 +685,30 @@ static struct tee_client_driver scmi_optee_service_driver = {
 	},
 };
 
-module_tee_client_driver(scmi_optee_service_driver);
+static int __init scmi_transport_optee_init(void)
+{
+	int ret;
+
+	ret = tee_client_driver_register(&scmi_optee_service_driver);
+	if (ret)
+		return ret;
+
+	ret = platform_driver_register(&scmi_optee_driver);
+	if (ret) {
+		tee_client_driver_unregister(&scmi_optee_service_driver);
+		return ret;
+	}
+
+	return ret;
+}
+module_init(scmi_transport_optee_init);
+
+static void __exit scmi_transport_optee_exit(void)
+{
+	platform_driver_unregister(&scmi_optee_driver);
+	tee_client_driver_unregister(&scmi_optee_service_driver);
+}
+module_exit(scmi_transport_optee_exit);
 
 MODULE_AUTHOR("Etienne Carriere <etienne.carriere@foss.st.com>");
 MODULE_DESCRIPTION("SCMI OPTEE Transport driver");
-- 
2.53.0

