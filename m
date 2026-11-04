Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793770449;
	b=QrElwFYUdExU+W9gYMJJFMeCz+5znhh/Q2LInu6iT4UinTzhT4EWRkOBh9K8YIkbJSTt
	 PXyIyN5ZM172VYMvwnDeL4hesvMJivQQ4MxBacpOugHehQdFSNmEsYW1r7WHtR3wlCzC+
	 hetx+S3fgQU8u2feQh9jCCsa2pM9hbunVVGxaUolr1hOX31ModM2qAKb+RhrFBdVUVL+v
	 YHcWz3SZjT/NWSYnPQo5dTvquQ0OzafmUK2QdsjNGo5hsmfRxiYQwgS+tMr+RnIWoo1WD
	 FHdsOt8i3CyR6SgErdkOurVwjHjyUk+kQXqRPorDWPfHtFgE4E10R7xBdx4tLHIgIfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793770449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=NaPAIDGDHTTSnPgiyoGnXRPKLlfc2mJQHfqQ2f481xg=;
	b=vfq2YvaEENLTZlSh7ljx+Bbd9W7bR9y4aSOcyZWkP3fFBFGiFnZcPmUMmRuLB5Fd9ctG
	 siWIo7Df/6p8pbNmoYdmFe4+VZaYQtdMxKsao+E5T+AeqNHhkVfIO19RS4l4y9cB6HtAh
	 1tljZ/vPkR/6jaa3gt6tC+I34ssyM7sD0KF9PHQhoYSw+E+flobDy9VTSVh8bygLdGRAo
	 HzkxukDowwn88IDJJqQxZ84/0+ozjAI2pVMmHLwALUFESQsVu/ElmplyXvqmqkABa/2ku
	 MdI8NdoRhQDqFfMgZIgUjZOnfO0gp8RhtXxhEWhV0yArP2w9+l1YXRr5yEUm8ZyQsoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cfss1h09;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0655606A31B
	for <arm-scmi@vger.kernel.org>; Wed,  4 Nov 2026 05:34:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0655606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cfss1h09
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-18a19ae4048so8992c88.0
        for <arm-scmi@vger.kernel.org>; Tue, 03 Nov 2026 21:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793770448; x=1794375248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NaPAIDGDHTTSnPgiyoGnXRPKLlfc2mJQHfqQ2f481xg=;
        b=cfss1h0964nVXzPW6asKCRWluZW36QCD/VgbvvklOprt1lgHuRdHrEFRuqMLE1KVaJ
         zwQJbWZOMLVSjireD60gaeys/K8rzKFR+zYGTCC+q1mlI3M0pdkuipAyJCmYWxbZPgsk
         VtmOYUa+V+8WvgeCXMcEmO1KXh39n3mI967aPOnEGnJmL+0/7chaW7OrR5eF2f33dNy4
         Rwr/7HxvOtuOMGdLAc5rakRd+PjIbkFS3CQ6A2pTFnv/jwcgQUGiz+INamfg+PSJjvd5
         NdAXVlv/nI9c2mvFO5R8WIAp+2RA8Di22xf1Ml4R/X3h8q6dZe0G1BHwNc2LGNgtCfKV
         GvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793770448; x=1794375248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NaPAIDGDHTTSnPgiyoGnXRPKLlfc2mJQHfqQ2f481xg=;
        b=DlyeziK/J6xZWzbvG3pZFU9Co1kiCEY8GLmRZj3nFFKYIop3QpWnuLim5oX1QGZDI1
         jkYEM2yPQd/SThCqzGYOr1jwO55CDcIb6zuxAJqwBMp+c1aMfc64t3T1ql3gYlmnz/IE
         PxBfiD//T+3Z7LOmRrC8qTwBHTDnVMFOwI9VMkCvEClKmMGTJBuj5u++YmvmmSZxQmVm
         ijRwNc3cneI0Xu4yiR9rd6I3nmvSGzNsYWTRSn0e1f45qEG0k2x1zuBVu1GNGezf0CVP
         9UK599RbwJuyAuVT8YLDq9ElGttkvWSPXpGUnxcrr5c4YJfkWyKu68iDg3PoM55hXyX4
         xSzA==
X-Gm-Message-State: APuU4Z+1sJ2YL/VXIvzcDC+z4nuFv/6dZUgYpaz3tS1VAuEoI9S0Bf/6
	M0iTf3UHhrbMOpe40O3538uSLUJ1SLwqXP+DTCzKjOKUXCRkbiACoW5i
X-Gm-Gg: AYBFou2dNzB6hQORAWvQuvLizAd+VESTj86WaTNsHUQuYmSBnzP5B69Fx+5qP/zwL8v
	UhLDw0vJKv4ZlXTRgq89MvBFtVlQ9FvSwtKNSne5NxCMQxCAtW5KKYD4YeCCJow2NyYUapSxAPg
	V/I70GiKSxypTyYGhVsATwMSPvxRMMQgG/v4IwSJJaPZnJSF6ADltd3ZoZOEglS1osF9irfVFPu
	GDsNJ2laO5FPt7JrB9mXcxQWaEWpBVQEngXTgMZzIBbeMFHpYNURmtAEtZwZ4MruyevKm4KJe2c
	tERlhqqJFoMREw2o+i1nGCUYl4g3rEqYVVYzk6r/u3vMy1RdF//utmkoSRueYzQ01Su1RXNckD/
	E/NcQoylYCgtE4O4B17A4q9CfgA6VyRnXr1K56cZFN46Y330izLYrkkjLsJiYmK8jABUszT5nWp
	DbEc7RDUATIiT5FSSOCVpJpCHEhysDkw5pwd3dFoj00+F6IGZxYXbD1FGBTyzOYnqitCiUkHMw5
	zRgttIN1iSEbzwFYS0ziwaWcxLrega7vI/i/l8M/hPluD6UM50QqR/IPPF3/Lmm7LpNDNtMqGEb
	lmpFuAj9AGQtIP3+vVmdZKz8LPooKfr0sx1rCkn4OO0=
X-Received: by 2002:a05:701b:428f:10b0:143:5c2a:e45f with SMTP id a92af1059eb24-1ac4f91ef0emr37439969c88.0.1793770447458;
        Tue, 03 Nov 2026 21:34:07 -0800 (PST)
Received: from CRASHEDROM.localdomain ([142.249.36.161])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1bcedsm4263001c88.7.2026.11.03.21.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:34:07 -0800 (PST)
From: Chengyu Liu <lui2012qwq@gmail.com>
To: sudeep.holla@kernel.org
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chengyu Liu <lui2012qwq@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] firmware: arm_scmi: fix deadlock between reboot notifier and forceful work
Date: Wed,  4 Nov 2026 13:33:59 +0800
Message-Id: <20261104053359.1613991-1-lui2012qwq@gmail.com>
X-Mailer: git-send-email 2.25.1
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

scmi_reboot_notifier() calls cancel_delayed_work_sync() while holding
sc->state_mtx, but the work it waits on - scmi_forceful_work_func() -
takes the same mutex.  If a forceful transition work is in flight when
the reboot notifier fires, the notifier holds the lock and waits for
the callback while the callback waits for the lock: deadlock, and the
reboot wedges.

Moving the cancel outside the lock is not sufficient on its own, as the
callback also calls unregister_reboot_notifier() unconditionally, which
blocks on the reboot chain rwsem (down_write vs. the in-progress
chain's down_read) while the notifier waits for the callback - the
deadlock would just move to a different lock.  Fix both sides:

- Notifier: compute the decision under state_mtx, drop the lock, then
  cancel.  A callback that slips in between sees state ==
  SCMI_SYSPOWER_REBOOTING (not IN_PROGRESS), skips the forceful
  request and finishes, so the cancel cannot miss it.  (The callback's
  own system_state early-return does not cover a work item that
  started before the reboot began: kernel_restart_prepare() runs the
  notifier chain before setting system_state.)

- Callback: only unregister the reboot notifier when actually forcing
  the transition - that is the only case that needs it, because the
  forceful kernel_restart()/kernel_power_off() would otherwise
  re-enter scmi_reboot_notifier and self-deadlock on state_mtx.  When
  the state is not IN_PROGRESS there is nothing to force, and skipping
  the unregister keeps the callback from blocking on the reboot chain
  rwsem while the notifier waits for it.

Found by static analysis.

Cc: stable@vger.kernel.org
Signed-off-by: Chengyu Liu <lui2012qwq@gmail.com>
---
 .../firmware/arm_scmi/scmi_power_control.c    | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/arm_scmi/scmi_power_control.c b/drivers/firmware/arm_scmi/scmi_power_control.c
index 9557363360..b5a0b71505 100644
--- a/drivers/firmware/arm_scmi/scmi_power_control.c
+++ b/drivers/firmware/arm_scmi/scmi_power_control.c
@@ -121,6 +121,7 @@ static int scmi_reboot_notifier(struct notifier_block *nb,
 				unsigned long reason, void *__unused)
 {
 	struct scmi_syspower_conf *sc = reboot_nb_to_sconf(nb);
+	bool cancel_work;
 
 	mutex_lock(&sc->state_mtx);
 	switch (reason) {
@@ -138,11 +139,18 @@ static int scmi_reboot_notifier(struct notifier_block *nb,
 		break;
 	}
 
-	if (sc->state == SCMI_SYSPOWER_REBOOTING) {
+	cancel_work = sc->state == SCMI_SYSPOWER_REBOOTING;
+	mutex_unlock(&sc->state_mtx);
+
+	if (cancel_work) {
 		dev_dbg(sc->dev, "Reboot in progress...cancel delayed work.\n");
+		/*
+		 * cancel_delayed_work_sync() waits for a running
+		 * scmi_forceful_work_func(), which takes state_mtx - it must
+		 * not be called with the lock held.
+		 */
 		cancel_delayed_work_sync(&sc->forceful_work);
 	}
-	mutex_unlock(&sc->state_mtx);
 
 	return NOTIFY_OK;
 }
@@ -190,10 +198,11 @@ static void scmi_forceful_work_func(struct work_struct *work)
 
 	dev_dbg(sc->dev, "Graceful request timed out...forcing !\n");
 	mutex_lock(&sc->state_mtx);
-	/* avoid deadlock by unregistering reboot notifier first */
-	unregister_reboot_notifier(&sc->reboot_nb);
-	if (sc->state == SCMI_SYSPOWER_IN_PROGRESS)
+	if (sc->state == SCMI_SYSPOWER_IN_PROGRESS) {
+		/* avoid deadlock by unregistering reboot notifier first */
+		unregister_reboot_notifier(&sc->reboot_nb);
 		scmi_request_forceful_transition(sc);
+	}
 	mutex_unlock(&sc->state_mtx);
 }
 
-- 
2.25.1

