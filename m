Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B41C3A1A58;
	Sun, 10 May 2026 16:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778429180; cv=none; b=RYCEZwAQAk4pbxvNHgzuLt0+JyT4AYkbn2LEIYPTbrpvC9TcuAvwBlFyqASld/E/RXYHOa0o3UIYSScT6gdZ01/pJF6KS4XDB8JH+m4W4FWu2xJRbzwc5HMl9u62DsYIItwsm5TEEjw3wYUJy6E0sjeN46ailsyYFjKQrUQ32SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778429180; c=relaxed/simple;
	bh=Yvl5e0/bXtH3DqoJuR+H+WomG2HEBPx9dK1/VFX327c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h3WEGa1TWwqnCUrS7Wlc6Gszw80IHTLCSlgUxIi7B9ArDCRhH2ks0RyHetC9GmqmksHB2RLHGTjxJsJjXijdYeCZNClgn2kK3UC//9VQ8Wcj8uy7aIdidVER1cXv7RP4gIui8OnFhlTVA2H/MdFbEN7KMXHkBIesFIrjuYkHrqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=cmII/EMT; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="cmII/EMT"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89BE827B5;
	Sun, 10 May 2026 09:06:03 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 446173F836;
	Sun, 10 May 2026 09:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778429168; bh=Yvl5e0/bXtH3DqoJuR+H+WomG2HEBPx9dK1/VFX327c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cmII/EMT+K0ivX+5X1kyLo0EW7NzboZzHQfElWwz9ap5aR17PpmAlfSIzVPQlvDAm
	 4qtayWkWca51phdrVavqtMi7DejboyMIyRh7ZhbmvcvbfdmUcmetZcl5HCrEjVf2z3
	 qYG13l6rVzb3c/Rb0nWST/k4jiB/HOPUXXz2De/Y=
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
Subject: [PATCH v2 4/4] firmware: arm_scmi: optee: Rework transport probe sequence
Date: Sun, 10 May 2026 17:05:27 +0100
Message-ID: <20260510160527.3537474-5-cristian.marussi@arm.com>
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

Use the new per-instance transport handles helpers to synchronize and
optionally defer the core SCMI driver probe up until the transport driver
has completely been initialized and it is fully operational as a supplier.

Introduce proper module init/exit routines while removing the ugly trick of
registering a driver from within the probe sequence of another one, just to
avoid to have to deal with probe deferrals.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v1 -> v2
 - fixed __MUTEX_INITILIAZER() usage
 - use common generic supplier definitions
 - get rid of init/cleanup wrappers
 - use proper barrier on scmi_optee_agent
---
 drivers/firmware/arm_scmi/transports/optee.c | 46 +++++++++++++++-----
 1 file changed, 36 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/arm_scmi/transports/optee.c b/drivers/firmware/arm_scmi/transports/optee.c
index 07ae18d5279d..dbe32e141748 100644
--- a/drivers/firmware/arm_scmi/transports/optee.c
+++ b/drivers/firmware/arm_scmi/transports/optee.c
@@ -154,6 +154,8 @@ static struct scmi_transport_core_operations *core;
 /* There can be only 1 SCMI service in OP-TEE we connect to */
 static struct scmi_optee_agent *scmi_optee_private;
 
+static DEFINE_SCMI_TRANSPORT_SUPPLIER(scmi_optee_supplier);
+
 /* Open a session toward SCMI OP-TEE service with REE_KERNEL identity */
 static int open_session(struct scmi_optee_agent *agent, u32 *tee_session)
 {
@@ -522,7 +524,7 @@ static struct scmi_desc scmi_optee_desc = {
 };
 
 static const struct of_device_id scmi_of_match[] = {
-	{ .compatible = "linaro,scmi-optee" },
+	{ .compatible = "linaro,scmi-optee", .data = &scmi_optee_supplier.th},
 	{ /* Sentinel */ },
 };
 
@@ -561,18 +563,20 @@ static int scmi_optee_service_probe(struct tee_client_device *scmi_pta)
 	if (ret)
 		goto err;
 
-	/* Ensure agent resources are all visible before scmi_optee_private is */
+	/* Ensure initialized scmi_optee_private is visible */
 	smp_mb();
 	scmi_optee_private = agent;
 
-	ret = platform_driver_register(&scmi_optee_driver);
-	if (ret) {
-		scmi_optee_private = NULL;
-		goto err;
-	}
+	ret = scmi_transport_supplier_put(&scmi_optee_supplier.th, agent->dev);
+	if (ret)
+		goto err_put;
 
 	return 0;
 
+err_put:
+	/* Ensure cleared reference is visible before resources are released */
+	smp_store_mb(scmi_optee_private, NULL);
+
 err:
 	tee_client_close_context(tee_ctx);
 
@@ -586,13 +590,12 @@ static void scmi_optee_service_remove(struct tee_client_device *scmi_pta)
 	if (!scmi_optee_private)
 		return;
 
-	platform_driver_unregister(&scmi_optee_driver);
-
 	if (!list_empty(&scmi_optee_private->channel_list))
 		return;
 
 	/* Ensure cleared reference is visible before resources are released */
 	smp_store_mb(scmi_optee_private, NULL);
+	scmi_transport_supplier_put(&scmi_optee_supplier.th, agent->dev);
 
 	tee_client_close_context(agent->tee_ctx);
 }
@@ -616,7 +619,30 @@ static struct tee_client_driver scmi_optee_service_driver = {
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

