Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3AA3C6611;
	Wed,  3 Jun 2026 15:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780499876; cv=none; b=isA70mZRyYpapBz6SVLaL2DiCkGlWH2WzAc6t9NkQ/w/x+3rvsElxJJZKBoQLKwbzGGFH1SYAIG6LDWY+gfZv7tpqmgo2Vnq9wUuOXDazxNAhaowr/I0jdF+QDRv4UGI8f8ptN5+WUzA+/9nTdv8iiZ1Bx5MQX+Iffhkw1Fpml8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780499876; c=relaxed/simple;
	bh=u+UNVQsRxEhZMKtBKwtFTpgVN+6uMDz5daX7qmBcnoU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jMe4yNpcEA4nh861hD2CjCHTj0GrjY0L/r22cPe7c7JBdTu2QUCEM6BXuVNjEAUWIS6LDGUPllUmzMY27TxP2AERfRD7mU3efqxhOBxysG7byVJGNQa1XB1Z0ku3Hs79E+CJ/jsPkZRwMkGWE8Tgj09+6cRHhdS2QjbdVxuMJeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C92261F00893;
	Wed,  3 Jun 2026 15:17:53 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] firmware: arm_scmi: Grammar s/may needed/may be needed/
Date: Wed,  3 Jun 2026 17:17:51 +0200
Message-ID: <5180d04abfb8e3074a321e2eb73bacfdd61c30c5.1780499850.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix grammar in the help text for the ARM_SCMI_POWER_CONTROL symbol.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/firmware/arm_scmi/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/arm_scmi/Kconfig
index e3fb36825978ed6f..783c24a20e29190f 100644
--- a/drivers/firmware/arm_scmi/Kconfig
+++ b/drivers/firmware/arm_scmi/Kconfig
@@ -96,7 +96,7 @@ config ARM_SCMI_POWER_CONTROL
 	  firmware.
 
 	  This driver can also be built as a module.  If so, the module will be
-	  called scmi_power_control. Note this may needed early in boot to catch
-	  early shutdown/reboot SCMI requests.
+	  called scmi_power_control. Note this may be needed early in boot to
+	  catch early shutdown/reboot SCMI requests.
 
 endmenu
-- 
2.43.0

