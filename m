Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D951B4F09
	for <arm-scmi@vger.kernel.org>; Fri,  3 Jul 2026 20:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783110334; cv=none; b=OHxs47QRyiy3hhG8kYBSxX3k0/qiNCH2QBl6gP295YwySZzyc3c/DZ9oi5zb8Iipj9z50h7xRCattD2+nJmFw+ZOh1Ubm1WN9xS74yuOY/snldIlJJHKrXef2bPeIEZEcpGFFyZJgZTWqJeE+Ft6GWV8gONp67H5iJLXrj0ELuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783110334; c=relaxed/simple;
	bh=f0Vyb65y29VRt1RTOdK0e5peiM8JQdRz+hB1qDWnWs0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lNvthOtpnXMGaFTXuyf1dG5KxaU26jsnZ0/W5hM8DpFZEONRC+m7p1akiopIrE5qQZ5zJO4rrhwPiBJnHjCsbviHikX7q7JOkGkM+mvHgH7vMhx5xiO0r3bNGiz3WFREWNhR117Xgx/H6bqd5zXp0NfSu9Yuotu5Ktyonf2Aro4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KWsOwBw+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KWsOwBw+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E0D1F00A3A;
	Fri,  3 Jul 2026 20:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783110333;
	bh=HX1nHvlk3c1+dgVJ4v3uKemvU735Z6kr6zZ67avlLqY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KWsOwBw+LnsGFKHwadeAKj7CbGjZ2esIZyKZRtrS7xRZ7yzQwbpmcadipOTCbJd9O
	 AWGoAn1L9v9w94fLjjEaNgPHB8n8lx+4/RJNXu5rtPaRtXMPo//SeDvkklS1xrOiny
	 wT6f35Ds25Hrl4b8C2vFknflRNJtKZo+RM/It09y52I1mhqrJRHAYIaTM4sbgxdhQQ
	 4QSJhzmQL/koeSPkY0E/Wlw3/KBZzsXMw/SL4s30CkfRxapW1Y/2k4pZu617pfTuMi
	 6i+cvRWo2qT+B5iVTPzoD6MNYx7cPX3mMCD9A8CYsLtPZN2cPc1ebZMHeLtEcJy7Wl
	 lPWcbPUpAuGdw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 03 Jul 2026 21:22:42 +0100
Subject: [PATCH v3 06/17] firmware: arm_scmi: Unregister device notifier
 before IDR teardown
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-scmi_core_fixes-v3-6-5bae9766abfc@kernel.org>
References: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
In-Reply-To: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

The requested-devices notifier looks up protocol fwnodes from the
active_protocols IDR. During remove, unregister the notifier before
releasing and destroying active_protocols so no notifier callback can race
with the IDR teardown.

Keep the bus notifier registered until after the protocol state is torn
down, matching the existing remove ordering for SCMI bus users.

Fixes: 53b8c25df708 ("firmware: arm_scmi: Add common notifier helpers")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 4b369b003003..6df0fe055d64 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3402,6 +3402,9 @@ static void scmi_remove(struct platform_device *pdev)
 
 	scmi_notification_exit(&info->handle);
 
+	blocking_notifier_chain_unregister(&scmi_requested_devices_nh,
+					   &info->dev_req_nb);
+
 	mutex_lock(&info->protocols_mtx);
 	idr_destroy(&info->protocols);
 	mutex_unlock(&info->protocols_mtx);
@@ -3410,8 +3413,6 @@ static void scmi_remove(struct platform_device *pdev)
 		of_node_put(child);
 	idr_destroy(&info->active_protocols);
 
-	blocking_notifier_chain_unregister(&scmi_requested_devices_nh,
-					   &info->dev_req_nb);
 	bus_unregister_notifier(&scmi_bus_type, &info->bus_nb);
 
 	/* Safe to free channels since no more users */

-- 
2.43.0

