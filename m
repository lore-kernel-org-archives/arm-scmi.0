Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921986;
	b=BolLH+YaLyh9VU1ch8wV7uERRS1G2dLPGBnca0Uk9c7nLDzXKDB2+gLwNyMXKpNmQRdY
	 cebxd4SUloboRqW/pwJcsWnX8d13Q9NLVt5DzVA1+r6Tnvom3JfIUBHPC8onoG6F+Tzsv
	 LsHBqsmyFvCh9ROgPcxZlaII45yOWuw8tPM8lvTs9rFr460txj2FudTJvoBf0TK8HQuOq
	 SWr//SLhPkh+BFVTpMYXPZicMxPIe1XC/mZVlPmNFbV6Pkoe7/1ECrL1vt8DdGD61+Ian
	 RRxv/vFu9Am3OgYwd+JDpKY++4Ii4ww9R0M0+HtKh/mHqrhUztlbxv1VF0zUhiyWqTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921986;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=T7T7UGIIkVUgG9LfHoVSYdrZwZAi99AYKs3CGE26d2s=;
	b=NnqFvpcBAkGyf075aI8p68ehzsUByWLlu71gzo1Gc5P1Bx6NB7LfpNHjrzBKLmBY/cOw
	 8StrJUO1vPAHBisDbS7TzqtsRDh3++oHM8ALJtnQlqp6d4b8WufwoS5OmUn/y+aUp+d4i
	 qqBvUDPNJFBCPp/iKgZqLQce0IZ4ei/hpIYD9dVT2QYOAVy9JvxvvPghebxyUZb9Fu5VX
	 SUmefWD8+2SGOFd0TlcxNUoN7hk+y55OA3RUjsGkq91p8MYxNKbsE+4Rai7KDAd7GgalD
	 cMfo8Oav66XvaF0qVPPVMxd3BUXVa8Z6w2wemFyJwRBWbtvsNRFT90XP8BvnbxMdB2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="lhRXqfF/";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D9C3606A887;
	Tue, 17 Nov 2026 13:26:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D9C3606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=lhRXqfF/
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB3DC1688;
	Tue, 17 Nov 2026 05:26:21 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6A943F632;
	Tue, 17 Nov 2026 05:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794921984; bh=vK/miWmof/8h+vBME1eqAohgMhzjU0W7rnh1mXlNVDw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lhRXqfF/HfCs5Kz9DH6iz6x718uppDib07fhNCokcLhBhJO6WCMyCf2+oH6hWehXz
	 oSZGrC5k5p+5BsoWTwPzPpXPPhWl+nTf0S//JH8psWkz2pQOuCH2L8rqlElL6+7h3A
	 OWD829LtetvxmFbiQBH6ygUmKWsIa3aB+PoM7Mao=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	philip.radford@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2 2/2] firmware: arm_scmi: Fix SCMI Power Control driver removal
Date: Tue, 17 Nov 2026 13:23:11 +0000
Message-ID: <20261117132311.291199-3-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261117132311.291199-1-cristian.marussi@arm.com>
References: <20261117132311.291199-1-cristian.marussi@arm.com>
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
 .../firmware/arm_scmi/scmi_power_control.c    | 88 +++++++++++++++++--
 1 file changed, 82 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/arm_scmi/scmi_power_control.c b/drivers/firmware/arm_scmi/scmi_power_control.c
index bbccebe834c3..82cc6e6bb96f 100644
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
 
@@ -105,6 +113,9 @@ struct scmi_syspower_conf {
 #define dwork_to_sconf(x)		\
 	container_of(x, struct scmi_syspower_conf, forceful_work)
 
+#define work_to_sconf(x)		\
+	container_of(x, struct scmi_syspower_conf, suspend_work)
+
 /**
  * scmi_reboot_notifier  - A reboot notifier to catch an ongoing successful
  * system transition
@@ -122,6 +133,10 @@ static int scmi_reboot_notifier(struct notifier_block *nb,
 {
 	struct scmi_syspower_conf *sc = reboot_nb_to_sconf(nb);
 
+	guard(srcu)(&sc->dead_srcu);
+	if (READ_ONCE(sc->dead))
+		return NOTIFY_DONE;
+
 	mutex_lock(&sc->state_mtx);
 	switch (reason) {
 	case SYS_HALT:
@@ -188,6 +203,10 @@ static void scmi_forceful_work_func(struct work_struct *work)
 	dwork = to_delayed_work(work);
 	sc = dwork_to_sconf(dwork);
 
+	guard(srcu)(&sc->dead_srcu);
+	if (READ_ONCE(sc->dead))
+		return;
+
 	mutex_lock(&sc->state_mtx);
 	if (sc->state == SCMI_SYSPOWER_IN_PROGRESS) {
 		dev_dbg(sc->dev, "Graceful request timed out...forcing !\n");
@@ -225,8 +244,6 @@ static void scmi_request_graceful_transition(struct scmi_syspower_conf *sc,
 		if (!ret) {
 			/* Wait only up to 75% of the advertised timeout */
 			adj_timeout_ms = mult_frac(timeout_ms, 3, 4);
-			INIT_DELAYED_WORK(&sc->forceful_work,
-					  scmi_forceful_work_func);
 			schedule_delayed_work(&sc->forceful_work,
 					      msecs_to_jiffies(adj_timeout_ms));
 		} else {
@@ -285,6 +302,10 @@ static int scmi_userspace_notifier(struct notifier_block *nb,
 	struct scmi_system_power_state_notifier_report *er = data;
 	struct scmi_syspower_conf *sc = userspace_nb_to_sconf(nb);
 
+	guard(srcu)(&sc->dead_srcu);
+	if (READ_ONCE(sc->dead))
+		return NOTIFY_DONE;
+
 	if (er->system_state >= SCMI_SYSTEM_MAX ||
 	    er->system_state == SCMI_SYSTEM_POWERUP) {
 		dev_err(sc->dev, "Ignoring unsupported system_state: 0x%X\n",
@@ -326,6 +347,14 @@ static int scmi_userspace_notifier(struct notifier_block *nb,
 
 static void scmi_suspend_work_func(struct work_struct *work)
 {
+	struct scmi_syspower_conf *sc;
+
+	sc = work_to_sconf(work);
+
+	guard(srcu)(&sc->dead_srcu);
+	if (READ_ONCE(sc->dead))
+		return;
+
 	pm_suspend(PM_SUSPEND_MEM);
 }
 
@@ -346,6 +375,10 @@ static int scmi_syspower_probe(struct scmi_device *sdev)
 	if (!sc)
 		return -ENOMEM;
 
+	ret = init_srcu_struct(&sc->dead_srcu);
+	if (ret)
+		return ret;
+
 	sc->state = SCMI_SYSPOWER_IDLE;
 	mutex_init(&sc->state_mtx);
 	sc->required_transition = SCMI_SYSTEM_MAX;
@@ -353,12 +386,54 @@ static int scmi_syspower_probe(struct scmi_device *sdev)
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
+	 * Once here any possible in-flight notifier will have completed and
+	 * further notifiers will bailout immediately.
+	 * Cancel any work which was possibly already scheduled.
+	 */
+	cancel_delayed_work_sync(&sc->forceful_work);
+	cancel_work_sync(&sc->suspend_work);
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
@@ -385,6 +460,7 @@ static struct scmi_driver scmi_system_power_driver = {
 	},
 	.name = "scmi-system-power",
 	.probe = scmi_syspower_probe,
+	.remove = scmi_syspower_remove,
 	.id_table = scmi_id_table,
 };
 module_scmi_driver(scmi_system_power_driver);
-- 
2.54.0

