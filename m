Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921984;
	b=mrvAAPyvhIvkDcWpEomWkucAhlrH2tofEEgNN9p2Sdr8u0lXxVHfAcAKBytadaHfXT+I
	 q+pLbPi8seRWVMiRBEMsJDedP7fO2shf8a24hw+DxxqymRZ18ZqYap0rZ3gxPsKL0Cm2c
	 t79WGLmRRQPAF19+3HTDHpl9WMG7bPQ6p/yNuPRZ+lgK7ZEHHc9mVJy/Iy3YAg70QRju+
	 WjAD8i/J9ZCr389Yw+c9nUy0Jv/JhawW3y2QCndScaWZKkQlP7AER7WpXVmGYQwuejmY3
	 Z9LifJUauCZBk7knoPX5d27iyxS60iRjbwgFG88Hhg8bG2u6Al3wuD9KiZzHpxcREtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921984;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fUllIm/XDuS2iQlbpNvDQdzHZZVdN5n8PCpoG/kMHUU=;
	b=h35ON1fZp/qiVsBlwQYUmysjxz9mZmYXALivGsithvHtRboIbO9nAgQNiEM7BzhOFDve
	 Lp7jbO10DBBrp2e/6M2IOJXn/vsYx5DfSpdcJ1S1upJPipnVtDbYXzxk6Q+eZMqNvfLYV
	 3jfwMKL46YDBvGainh+CsIjmk7B2ntTKz/znO1/HSthBDHH8FHgyC2gKy72hxBdQ9CwED
	 g9r8oqlKyH0kL/8CWjbbdRVFfwoDr8/TatwZPzzZpU8AG/QRMYSd7JCO57py0Cu7xHfKS
	 9z/NAHFdeVxuiG55pnbXPDO0slVu0FfZUb6EwJQBTh/ZbDPRw2xQomD/nJzNn/f/xjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Bd5JfgQd;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0F8606A331;
	Tue, 17 Nov 2026 13:26:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB0F8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Bd5JfgQd
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E78314BF;
	Tue, 17 Nov 2026 05:26:20 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2E4423F632;
	Tue, 17 Nov 2026 05:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794921983; bh=tlMKluP7fnFNOnJbtIoCp+QmSdDQQUNSb1mvylnQg2I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bd5JfgQdqrGCHSDAmZBwZyEFFczg+m54B75B6qdcgN6QeZZEF0ZtN6Ca1a/nIyopq
	 xi71wVG/GzWAELjA1qWizLw0dGP+rLU84NSdxf6RMG3gnynw4/UREkhGoajd0FuyAS
	 D43A4I0dbhDB4vSf0mrRUI2M4dXv4bQwxO+3IdE8=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	philip.radford@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Chengyu Liu <lui2012qwq@gmail.com>
Subject: [PATCH v2 1/2] firmware: arm_scmi: Fix deadlock between reboot notifier and forceful work
Date: Tue, 17 Nov 2026 13:23:10 +0000
Message-ID: <20261117132311.291199-2-cristian.marussi@arm.com>
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

When an ongoing reboot is detected scmi_reboot_notifier() cancels the
scheduled pending delayed work by calling cancel_delayed_work_sync():
this is done while holding sc->state_mtx which is also taken by the
worker is trying to synchronously cancel.

Such locking, though, guarantees mutual exclusion between the conflicting
activities carried on by the two threads.

Stop synchronously waiting for the cancellation so as to avoid deadlock.

Fixes: 2c4b97fee94a ("firmware: arm_scmi: Add SCMI System Power Control driver")
Reported-by: Chengyu Liu <lui2012qwq@gmail.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/scmi_power_control.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/arm_scmi/scmi_power_control.c b/drivers/firmware/arm_scmi/scmi_power_control.c
index e791a206768c..bbccebe834c3 100644
--- a/drivers/firmware/arm_scmi/scmi_power_control.c
+++ b/drivers/firmware/arm_scmi/scmi_power_control.c
@@ -140,7 +140,7 @@ static int scmi_reboot_notifier(struct notifier_block *nb,
 
 	if (sc->state == SCMI_SYSPOWER_REBOOTING) {
 		dev_dbg(sc->dev, "Reboot in progress...cancel delayed work.\n");
-		cancel_delayed_work_sync(&sc->forceful_work);
+		cancel_delayed_work(&sc->forceful_work);
 	}
 	mutex_unlock(&sc->state_mtx);
 
@@ -188,12 +188,13 @@ static void scmi_forceful_work_func(struct work_struct *work)
 	dwork = to_delayed_work(work);
 	sc = dwork_to_sconf(dwork);
 
-	dev_dbg(sc->dev, "Graceful request timed out...forcing !\n");
 	mutex_lock(&sc->state_mtx);
-	/* avoid deadlock by unregistering reboot notifier first */
-	unregister_reboot_notifier(&sc->reboot_nb);
-	if (sc->state == SCMI_SYSPOWER_IN_PROGRESS)
+	if (sc->state == SCMI_SYSPOWER_IN_PROGRESS) {
+		dev_dbg(sc->dev, "Graceful request timed out...forcing !\n");
+		/* avoid deadlock by unregistering reboot notifier first */
+		unregister_reboot_notifier(&sc->reboot_nb);
 		scmi_request_forceful_transition(sc);
+	}
 	mutex_unlock(&sc->state_mtx);
 }
 
-- 
2.54.0

