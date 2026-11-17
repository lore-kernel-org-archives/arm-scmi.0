Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932994;
	b=qxjaH3ynO7aFy1nO8mgdivl7Se7O96tSuhAH2eSDKmegz4xmFf3jbir5s6LnWmxTCwWi
	 XCuKDrDE/GYn+uyY4YAnEM0yRVpbwMYEXtPw54Jk0snzKdvyZtlejXm4e7meb3GSA4V6c
	 +Mc6Eo0zzSH2tEMWQXZMWWYsUNlwFxMsRLZ5HUiC+iKpFDw2PfkAHIVtrzuem+VBurV8I
	 Wod5MFJI5IlXzqyKW+MbKxUIFtxA2kl0DitG+z4jdObIdesbA1U2m7ZdffBqxPJnPQ5Px
	 JKb+7lVRuW69wkb8c/FdV8qkT4NjlqYTS1+g4z6xWDnQ58xcxb6Rh3RWLfYW28xtTfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932994;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Xah6kH3NsJjHjsSaD0EvODIXJgcLgPXtuKW/zjmxYTw=;
	b=R8uk4QWC/jzcGrtJY/ddWTYEVD/Wuw5/Bpsuuamq5Zu2UgT7ztIFx11DaNvYiZ11rShk
	 txt67lj7A8GhQlNPokys7JMONULbjWHmvudPUP+BQsjJaaiRVwSI6saTjfp7gg4Z6qR0N
	 DCdInX/syFpn4bqvkvuVO6e7xphEfhG8ZbzExdi2fciH7dCE+SsZpt9ICzoiQRiEQJsPS
	 h0aEsDUX4Jo1WO7KDRVm4SDpL7wrXBlwC5Tfihm+X2rOQ1Wz0c1T4cKJVY1DYgVBBy62v
	 WbovLEFqbQm/UcrCYTbZto3uaypdGka/Q1Zkn73Le9eyE8w2+fk2HO48dH7mOHO8Ubw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=g77SUc29;
	arc=none smtp.remote-ip=95.215.58.193
Received: from mta1.migadu.com (out-193.mta1.migadu.com [95.215.58.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963A2606A330
	for <arm-scmi@vger.kernel.org>; Tue, 17 Nov 2026 16:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 963A2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=g77SUc29
X-Envelope-To: arm-scmi@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=L5r87W+vvYhaC4SQ0Zx2qEfNiZ7OppygpT1qNDZLbu4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794932991; v=1; x=1795537791;
 b=g77SUc29ucT/305eXQyOO/RdLLnTiApw0sYGzoEYg9tr7a9qf2N6jCchSzK9gEuD6vlCP8gg
 ZtGYFskQqf4gkxIzRo5iyfvUmBn+b7M0xzh/kV6fJ1MyltaOSZYObdCp2OsO++bGXGNFNmgQxUB
 XuKC7ddVWcLSayz+JbP6QyJA=
X-Envelope-To: arm-scmi@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ec8f52277812aa2e;
	Tue, 17 Nov 2026 16:29:51 +0000
X-Mizu-Trace-ID: ec8f52277812aa2e
X-Migadu-Flow: FLOW_OUT
Date: Tue, 17 Nov 2026 16:29:47 +0000
From: Bradley Morgan <bradley.morgan@linux.dev>
To: marek.vasut+renesas@mailbox.org
CC: akpm@linux-foundation.org, arm-scmi@vger.kernel.org, cristian.marussi@arm.com,
 eadavis@sina.com, geert+renesas@glider.be, kees+treewide@kernel.org,
 leitao@debian.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 marco.crivellari@suse.com, michal.simek@amd.com, oleg@redhat.com,
 panchuang@vivo.com, petr.pavlu@suse.com, pmladek@suse.com,
 ptikhomirov@virtuozzo.com, ptsm@linux.microsoft.com, sudeep.holla@kernel.org,
 systemd-devel@lists.freedesktop.org, willy@infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_=5BRFC=5D_kernel/reboot=3A_Add_orderly?=
 =?US-ASCII?Q?=5Fsuspend=28=29_via_/sbin/suspend_user_mode_helper?=
In-Reply-To: <20261117084523.50711-1-marek.vasut+renesas@mailbox.org>
Message-ID: <03D974DA-29CF-404A-99BD-545D199E0A6B@linux.dev>
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 17 November 2026 08:44:19 GMT, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
>Currently, Linux responds to firmware-issued poweroff and reboot requests
>by invoking user mode helpers /sbin/poweroff and /sbin/reboot, which give
>userspace the ability to perform orderly poweroff and reboot according to
>policy set by userspace.
>
>This is not the case for firmware-issued suspend request, which directly
>invokes pm_suspend(PM_SUSPEND_MEM), without giving userspace any way to
>determine the suspend policy. This is problematic, because the userspace
>might not be quite ready to suspend right the instant when the suspend
>request from firmware arrives, e.g. because the user is interacting with
>the device and the userspace knows that interaction will end in the near
>future, at which point the system can be suspended perfectly well.
>
>Introduce a user mode helper, /sbin/suspend, which acts the same way as
>the other user mode helpers, and which is invoked when firmware-issued
>suspend request arrives. Userspace can use the helper to apply suspend
>policy, most likely by invoking init system suspend target. In case the
>helper is not present, retain current behavior and suspend immediately.
>
>Note that /sbin/suspend is non-standard. I also considered registering
>an input device and sending KEY_SUSPEND via such a device, but that does
>not seems nice. I also had a look at wake locks, but I don't think this
>is the right tool either. I am sending this as an RFC, because I would
>like to get input on this. I am including change for two platforms, SCMI
>and ZynqMP, which could benefit from this. Thank you for your input !

Hmm. let me use my thinking glasses.

>
>Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>---
>Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>Cc: Andrew Morton <akpm@linux-foundation.org>
>Cc: Breno Leitao <leitao@debian.org>
>Cc: Cristian Marussi <cristian.marussi@arm.com>
>Cc: Edward Adam Davis <eadavis@sina.com>
>Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>Cc: Kees Cook <kees+treewide@kernel.org>
>Cc: Marco Crivellari <marco.crivellari@suse.com>
>Cc: Michal Simek <michal.simek@amd.com>
>Cc: Oleg Nesterov <oleg@redhat.com>
>Cc: Pan Chuang <panchuang@vivo.com>
>Cc: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
>Cc: Petr Mladek <pmladek@suse.com>
>Cc: Petr Pavlu <petr.pavlu@suse.com>
>Cc: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
>Cc: Sudeep Holla <sudeep.holla@kernel.org>
>Cc: arm-scmi@vger.kernel.org
>Cc: linux-arm-kernel@lists.infradead.org
>Cc: linux-renesas-soc@vger.kernel.org
>Cc: linux-kernel@vger.kernel.org
>Cc: systemd-devel@lists.freedesktop.org
>---
> .../firmware/arm/scmi/scmi_power_control.c    | 11 +-----
> drivers/soc/xilinx/zynqmp_power.c             |  4 +--
> include/linux/reboot.h                        |  1 +
> kernel/reboot.c                               | 34 +++++++++++++++++++
> 4 files changed, 38 insertions(+), 12 deletions(-)
>
>diff --git a/drivers/firmware/arm/scmi/scmi_power_control.c b/drivers/firmware/arm/scmi/scmi_power_control.c
>index e791a206768c2..b61afb46ca7ef 100644
>--- a/drivers/firmware/arm/scmi/scmi_power_control.c
>+++ b/drivers/firmware/arm/scmi/scmi_power_control.c
>@@ -80,7 +80,6 @@ enum scmi_syspower_state {
>  * @reboot_nb: A notifier_block optionally used to track reboot progress
>  * @forceful_work: A worker used to trigger a forceful transition once a
>  *		   graceful has timed out.
>- * @suspend_work: A worker used to trigger system suspend
>  */
> struct scmi_syspower_conf {
> 	struct device *dev;
>@@ -93,7 +92,6 @@ struct scmi_syspower_conf {
> 	struct notifier_block reboot_nb;
> 
> 	struct delayed_work forceful_work;
>-	struct work_struct suspend_work;
> };
> 
> #define userspace_nb_to_sconf(x)	\
>@@ -254,7 +252,7 @@ static void scmi_request_graceful_transition(struct scmi_syspower_conf *sc,
> 		orderly_reboot();
> 		break;
> 	case SCMI_SYSTEM_SUSPEND:
>-		schedule_work(&sc->suspend_work);
>+		orderly_suspend();
> 		break;
> 	default:
> 		break;
>@@ -323,11 +321,6 @@ static int scmi_userspace_notifier(struct notifier_block *nb,
> 	return NOTIFY_OK;
> }
> 
>-static void scmi_suspend_work_func(struct work_struct *work)
>-{
>-	pm_suspend(PM_SUSPEND_MEM);
>-}
>-
> static int scmi_syspower_probe(struct scmi_device *sdev)
> {
> 	int ret;
>@@ -352,8 +345,6 @@ static int scmi_syspower_probe(struct scmi_device *sdev)
> 	sc->dev = &sdev->dev;
> 	dev_set_drvdata(&sdev->dev, sc);
> 
>-	INIT_WORK(&sc->suspend_work, scmi_suspend_work_func);
>-
> 	return handle->notify_ops->devm_event_notifier_register(sdev,
> 							   SCMI_PROTOCOL_SYSTEM,
> 					 SCMI_EVENT_SYSTEM_POWER_STATE_NOTIFIER,
>diff --git a/drivers/soc/xilinx/zynqmp_power.c b/drivers/soc/xilinx/zynqmp_power.c
>index ce75bc5ca9633..cd1cab58e84ca 100644
>--- a/drivers/soc/xilinx/zynqmp_power.c
>+++ b/drivers/soc/xilinx/zynqmp_power.c
>@@ -112,7 +112,7 @@ static irqreturn_t zynqmp_pm_isr(int irq, void *data)
> 			orderly_poweroff(true);
> 			break;
> 		case SUSPEND_POWER_REQUEST:
>-			pm_suspend(PM_SUSPEND_MEM);
>+			orderly_suspend();
> 			break;
> 		default:
> 			pr_err("%s Unsupported InitSuspendCb reason code %d\n",
>@@ -196,7 +196,7 @@ static void zynqmp_pm_init_suspend_work_fn(struct work_struct *work)
> 	if (pm_work->args[0] == SUSPEND_SYSTEM_SHUTDOWN) {
> 		orderly_poweroff(true);
> 	} else if (pm_work->args[0] == SUSPEND_POWER_REQUEST) {
>-		pm_suspend(PM_SUSPEND_MEM);
>+		orderly_suspend();
> 	} else {
> 		pr_err("%s Unsupported InitSuspendCb reason code %d.\n",
> 		       __func__, pm_work->args[0]);
>diff --git a/include/linux/reboot.h b/include/linux/reboot.h
>index aa08c3bbbf59a..c009deb3eb2b6 100644
>--- a/include/linux/reboot.h
>+++ b/include/linux/reboot.h
>@@ -177,6 +177,7 @@ void ctrl_alt_del(void);
> 
> extern void orderly_poweroff(bool force);
> extern void orderly_reboot(void);
>+extern void orderly_suspend(void);
> 
> /**
>  * enum hw_protection_action - Hardware protection action
>diff --git a/kernel/reboot.c b/kernel/reboot.c
>index bc71183d4ad87..1d830051dc920 100644
>--- a/kernel/reboot.c
>+++ b/kernel/reboot.c
>@@ -851,6 +851,7 @@ void ctrl_alt_del(void)
> #define POWEROFF_CMD_PATH_LEN  256
> static char poweroff_cmd[POWEROFF_CMD_PATH_LEN] = "/sbin/poweroff";
> static const char reboot_cmd[] = "/sbin/reboot";
>+static const char suspend_cmd[] = "/sbin/suspend";
> 
> static int run_cmd(const char *cmd)
> {
>@@ -872,6 +873,20 @@ static int run_cmd(const char *cmd)
> 	return ret;
> }
> 
>+static int __orderly_suspend(void)
>+{
>+	int ret;
>+
>+	ret = run_cmd(suspend_cmd);
>+
>+	if (ret) {
>+		pr_info("Failed to start orderly suspend: fall back to suspend-to-mem\n");
>+		pm_suspend(PM_SUSPEND_MEM);
>+	}
>+
>+	return ret;
>+}
>+
> static int __orderly_reboot(void)
> {
> 	int ret;
>@@ -951,6 +966,25 @@ void orderly_reboot(void)
> }
> EXPORT_SYMBOL_GPL(orderly_reboot);
> 
>+static void suspend_work_func(struct work_struct *work)
>+{
>+	__orderly_suspend();
>+}
>+
>+static DECLARE_WORK(suspend_work, suspend_work_func);
>+
>+/**
>+ * orderly_suspend - Trigger an orderly system suspend
>+ *
>+ * This may be called from any context to trigger a system suspend.
>+ * If the orderly suspend fails, it will force an immediate suspend.
>+ */
>+void orderly_suspend(void)
>+{
>+	schedule_work(&suspend_work);
>+}
>+EXPORT_SYMBOL_GPL(orderly_suspend);
>+
> static const char *hw_protection_action_str(enum hw_protection_action
> action)
> {
> 	switch (action) {
>


Right, I had a look, this doesn't "hurt" to merge, like for example
nothing will break, and this looks simple enough, but again, as you said,
/sbin/suspend isn't standard, so that's a crux. I'm thinking using PM may
be a "lightbulb" idea for me here. But I may be going crazy.

hmm, if I had to say tag or no, I'd give the tag:

Reviewed-by: Bradley Morgan <bradley.morgan@linux.dev>

Since

1: this doesn't hurt to merge
2: this looks very very simple and quite cool tbh.


--- Thanks!
