Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0701344DB64
	for <arm-scmi@vger.kernel.org>; Tue, 14 Jul 2026 12:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784033921; cv=none; b=keX+LN+JIsf9Qu3zDwePvKYJHVPdsE43IC77fC/RF56ZQV2kQrzGmR1rkseAQJrzSwltNcXrkKfEDFuXag3CcTTjCb4Jhu+XFL/rObqx0VBmRd9zb5+KQ27/KwROtfAT8mk8dBQIwdLPk6S+H6qHH4qAqkL0gmHmHjd9+So84gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784033921; c=relaxed/simple;
	bh=yUdqdHFJN1PmLmBxHmVmrvVYQEyXSx/lom+1K0fAoO8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LT0saI9ny9TZDnrZderObaho38SyxRfQvxzrmm3JLyFgoJ7j9UtTt05zN53rUonLip+iJzj6HD3bgvoT6h2+VCqx8B0CHi5r+oshr0RuMjas7q/Qlqplw5aOrdohx0eUWfi/Y5vNq6lYhlk6caqNY0Dm7dzJfV3u9Yg3AGpc3Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dxrzkx/e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dxrzkx/e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ABF81F00AC4;
	Tue, 14 Jul 2026 12:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784033919;
	bh=sh7Lj/mj9CpIhYE/wABVucKdXgjNm8rvsICwa1CRDgY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dxrzkx/eEbJ2CkWvlZGNUBvxtoGrf5PM6DZh/8MDliqj9L5aUG2MeH7zhq7nkaTXu
	 NdcyfdLm3CYhkORRgYpyk/jYNwXRJz6SBYh313lohKopxZwr/d5zQZY64gNQUiL8tl
	 IP9cnjuovB023m3Bz2/gzJDRCvMoYskaK+zor2kLD9gfzEUh24rS4Gkwp2f+tUa2an
	 TtcJhi7t2nTvTyLhkoJ6SxyL+DP84EXqNOSub9kw7+6VpAIDPKQe/c1s3qZCbkb7ua
	 F0pLs2f48ps3FzAW1ZgJ6Fh5YiDPM6XhOpHrTbIlVN8p27MglZ69hWL61wGtxhBOqC
	 0BrsUGcKUXkLw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 14 Jul 2026 13:56:21 +0100
Subject: [PATCH v6 02/16] firmware: arm_scmi: Unregister device notifier
 before IDR teardown
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-scmi_core_fixes-v6-2-3afe499d46e3@kernel.org>
References: <20260714-scmi_core_fixes-v6-0-3afe499d46e3@kernel.org>
In-Reply-To: <20260714-scmi_core_fixes-v6-0-3afe499d46e3@kernel.org>
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
index 1d1f5d25d773..52aff3aded4c 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3401,6 +3401,9 @@ static void scmi_remove(struct platform_device *pdev)
 	list_del(&info->node);
 	mutex_unlock(&scmi_list_mutex);
 
+	blocking_notifier_chain_unregister(&scmi_requested_devices_nh,
+					   &info->dev_req_nb);
+
 	scmi_notification_exit(&info->handle);
 
 	mutex_lock(&info->protocols_mtx);
@@ -3411,8 +3414,6 @@ static void scmi_remove(struct platform_device *pdev)
 		of_node_put(child);
 	idr_destroy(&info->active_protocols);
 
-	blocking_notifier_chain_unregister(&scmi_requested_devices_nh,
-					   &info->dev_req_nb);
 	bus_unregister_notifier(&scmi_bus_type, &info->bus_nb);
 
 	/* Safe to free channels since no more users */

-- 
2.43.0

