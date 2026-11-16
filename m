Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794818682;
	b=E/UVHoyGL3V4ksJNOvJXF1U+ImMsL8cn9MKdEJyQIHw5bsA/HbHwh1GuRcLxVAmMouuC
	 tPehxF9YSPkalyAoDlWB2xE+s4M6oOObkRFfdayv8ixMtDXtLIKr7L/JdIfW8AgL8urdB
	 OFvFAiyuurG46l824bHk6vlIqBCOHEVNwyLw8HBhAuN97aY/gXdd/+2SW/4Q05mNoLTr9
	 Kezv1iWtA51AdrK2eE+M1YQfQhuc/8WEOZffVQPP+iRSsIsh3wvueMX3qVHGSyV6Qiny7
	 caP16ahqrkKw7iGnre/uOZIHbHE+s1O6IJO42deppv5wGP+GqncpffugqQbVzM0Lgtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818682;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hd1aKH1n90Rfgfu+QVPNJhZOsMqkyhkILEACRzGRf3E=;
	b=TG7NRDNv8usxcjW4beDK8Y5Nd9PgQRie2kXh3gOn7wt5cfk1pclut1xKPpQlq76rjAgn
	 qJhYy7xPa1xuC1JEUC+MgpwswE9hCGc7mZ1JY+wMdBb9j2v8SrSB9zzkwuk2lMjdaiTzb
	 PvOoW5c1ss++pmp4nEBNoGdegebLmjXRikSW0wG5pqY8fQnPZoYEJVPyWrR9AJdj6kVPE
	 jgNoqOqKLPiGLopTY5TWX9MzbxubOfP02twHEAlLzpC+AxAK/8L8pXS07T+pyvIhoamVL
	 Uh+CG3REOLYM5YmCsyCI38X9jSthIAd9XEPLMYSFLHgjmWBW2q/y7aVrsOOY4YxYBQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=O1KFWUzH;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16BE5606A336;
	Mon, 16 Nov 2026 08:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16BE5606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=O1KFWUzH
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA71719F0;
	Mon, 16 Nov 2026 00:44:38 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7AD043F673;
	Mon, 16 Nov 2026 00:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794818681; bh=7IMvt+u0+btiak1eYmUIolBpcJMAvNwLaS8aeollN2I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O1KFWUzHuBpfAl9T4SwIgZ4m/l/NTxDP7+tiKsCzt8MMtPBE2dbK7nW8he3bDVmIv
	 MWvBlNJBP36K99V34FdhqNq77JoUCkJFzH0oFQtE9hgIHv1mE92xNKg4wBcR18gBxM
	 CihWhOW1XqAmyiDWtQpIMLAtiWddKMVjGwze4aME=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	philip.radford@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH 2/2] firmware: arm_scmi: Fix SCMI Power Control driver removal
Date: Mon, 16 Nov 2026 08:42:11 +0000
Message-ID: <20261116084211.3066460-3-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261116084211.3066460-1-cristian.marussi@arm.com>
References: <20261116084211.3066460-1-cristian.marussi@arm.com>
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

Once a reboot is initiated following a graceful shutdown request received
from the SCMI platform server there are a couple of registered notifiers
and possibly a scheduled delayed work.

Take care to properly stop, unregister and cleanup all such resources
when the driver is unbound.

Fixes: 2c4b97fee94a ("firmware: arm_scmi: Add SCMI System Power Control driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-dbe4eba7-1520-40a1-92e8-8892b6e47c4b
Tested-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 .../firmware/arm_scmi/scmi_power_control.c    | 76 +++++++++++++++++--
 1 file changed, 70 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/arm_scmi/scmi_power_control.c b/drivers/firmware/arm_scmi/scmi_power_control.c
index e0680e33180e..b0a10fd92fa6 100644
--- a/drivers/firmware/arm_scmi/scmi_power_control.c
+++ b/drivers/firmware/arm_scmi/scmi_power_control.c
@@ -43,6 +43,7 @@
  * possibly emitted by the platform will be ignored.
  */
 
+#include <linux/cleanup.h>
 #include <linux/math.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -51,6 +52,7 @@
 #include <linux/reboot.h>
 #include <linux/scmi_protocol.h>
 #include <linux/slab.h>
+#include <linux/srcu.h>
 #include <linux/suspend.h>
 #include <linux/time64.h>
 #include <linux/timer.h>
@@ -75,6 +77,8 @@ enum scmi_syspower_state {
  * @state_mtx: @state related mutex
  * @required_transition: The requested transition as decribed in the received
  *			 SCMI SystemPower notification
+ * @dead_srcu: Am SRCU to protect dead flag
+ * @dead: A boolean flag to be set during driver removal
  * @userspace_nb: The notifier_block registered against the SCMI SystemPower
  *		  notification to start the needed userspace interactions.
  * @reboot_nb: A notifier_block optionally used to track reboot progress
@@ -89,6 +93,10 @@ struct scmi_syspower_conf {
 	struct mutex state_mtx;
 	enum scmi_system_events required_transition;
 
+	/* Protect dead */
+	struct srcu_struct dead_srcu;
+	bool dead;
+
 	struct notifier_block userspace_nb;
 	struct notifier_block reboot_nb;
 
@@ -123,6 +131,10 @@ static int scmi_reboot_notifier(struct notifier_block *nb,
 	struct scmi_syspower_conf *sc = reboot_nb_to_sconf(nb);
 	bool cancel_work;
 
+	guard(srcu)(&sc->dead_srcu);
+	if (READ_ONCE(sc->dead))
+		return NOTIFY_DONE;
+
 	mutex_lock(&sc->state_mtx);
 	switch (reason) {
 	case SYS_HALT:
@@ -197,6 +209,10 @@ static void scmi_forceful_work_func(struct work_struct *work)
 	dwork = to_delayed_work(work);
 	sc = dwork_to_sconf(dwork);
 
+	guard(srcu)(&sc->dead_srcu);
+	if (READ_ONCE(sc->dead))
+		return;
+
 	mutex_lock(&sc->state_mtx);
 	needs_forceful = sc->state == SCMI_SYSPOWER_IN_PROGRESS;
 	mutex_unlock(&sc->state_mtx);
@@ -236,8 +252,6 @@ static void scmi_request_graceful_transition(struct scmi_syspower_conf *sc,
 		if (!ret) {
 			/* Wait only up to 75% of the advertised timeout */
 			adj_timeout_ms = mult_frac(timeout_ms, 3, 4);
-			INIT_DELAYED_WORK(&sc->forceful_work,
-					  scmi_forceful_work_func);
 			schedule_delayed_work(&sc->forceful_work,
 					      msecs_to_jiffies(adj_timeout_ms));
 		} else {
@@ -296,6 +310,10 @@ static int scmi_userspace_notifier(struct notifier_block *nb,
 	struct scmi_system_power_state_notifier_report *er = data;
 	struct scmi_syspower_conf *sc = userspace_nb_to_sconf(nb);
 
+	guard(srcu)(&sc->dead_srcu);
+	if (READ_ONCE(sc->dead))
+		return NOTIFY_DONE;
+
 	if (er->system_state >= SCMI_SYSTEM_MAX ||
 	    er->system_state == SCMI_SYSTEM_POWERUP) {
 		dev_err(sc->dev, "Ignoring unsupported system_state: 0x%X\n",
@@ -357,6 +375,10 @@ static int scmi_syspower_probe(struct scmi_device *sdev)
 	if (!sc)
 		return -ENOMEM;
 
+	ret = init_srcu_struct(&sc->dead_srcu);
+	if (ret)
+		return ret;
+
 	sc->state = SCMI_SYSPOWER_IDLE;
 	mutex_init(&sc->state_mtx);
 	sc->required_transition = SCMI_SYSTEM_MAX;
@@ -364,12 +386,53 @@ static int scmi_syspower_probe(struct scmi_device *sdev)
 	sc->dev = &sdev->dev;
 	dev_set_drvdata(&sdev->dev, sc);
 
+	INIT_DELAYED_WORK(&sc->forceful_work, scmi_forceful_work_func);
 	INIT_WORK(&sc->suspend_work, scmi_suspend_work_func);
 
-	return handle->notify_ops->devm_event_notifier_register(sdev,
-							   SCMI_PROTOCOL_SYSTEM,
-					 SCMI_EVENT_SYSTEM_POWER_STATE_NOTIFIER,
-						       NULL, &sc->userspace_nb);
+	ret = handle->notify_ops->event_notifier_register(handle, SCMI_PROTOCOL_SYSTEM,
+							  SCMI_EVENT_SYSTEM_POWER_STATE_NOTIFIER,
+							  NULL, &sc->userspace_nb);
+	if (ret) {
+		cleanup_srcu_struct(&sc->dead_srcu);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void scmi_syspower_remove(struct scmi_device *sdev)
+{
+	struct scmi_handle *handle = sdev->handle;
+	struct scmi_syspower_conf *sc;
+	int ret;
+
+	sc = dev_get_drvdata(&sdev->dev);
+	if (!sc)
+		return;
+
+	/* Wait for any notifier to complete and inhibit further processing */
+	WRITE_ONCE(sc->dead, true);
+	synchronize_srcu(&sc->dead_srcu);
+
+	/*
+	 * Once here any possible in-flight userspace or reboot notifier
+	 * will have completed and further notifiers will bailout immediately.
+	 * Cancel any work which was possibly already scheduled.
+	 */
+	cancel_delayed_work_sync(&sc->forceful_work);
+
+	/* Unregister reboot notifier...if any */
+	unregister_reboot_notifier(&sc->reboot_nb);
+
+	/* Unregister userspace notifier */
+	ret = handle->notify_ops->event_notifier_unregister(handle,
+							    SCMI_PROTOCOL_SYSTEM,
+							    SCMI_EVENT_SYSTEM_POWER_STATE_NOTIFIER,
+							    NULL, &sc->userspace_nb);
+	if (ret)
+		dev_warn(sc->dev, "Failed to unregister notifier\n");
+
+	cleanup_srcu_struct(&sc->dead_srcu);
 }
 
 static int scmi_system_power_resume(struct device *dev)
@@ -396,6 +459,7 @@ static struct scmi_driver scmi_system_power_driver = {
 	},
 	.name = "scmi-system-power",
 	.probe = scmi_syspower_probe,
+	.remove = scmi_syspower_remove,
 	.id_table = scmi_id_table,
 };
 module_scmi_driver(scmi_system_power_driver);
-- 
2.54.0

