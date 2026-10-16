Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809733B777C
	for <arm-scmi@vger.kernel.org>; Fri, 16 Oct 2026 08:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137840; cv=none; b=YSU1AS6YqWCTL/QfduRLCj+4/P3THL543JpugO8i3lvS9woeLJdVXxjZm+W9mN3nyMooUOcC+OFyl/JmMJCpHxSbo9jMd+NG5vEr3JgGPrBm0+dW32YrFpZPrbCrWndbBRVm1W7br/4hgi1+rnpMlt7SLfLNDf+hf5E1lQGlwTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137840; c=relaxed/simple;
	bh=SpIeMvGM0KCvZ5h6HJQBD3tsOOn/Y1VMZ6bO4KT+rYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S2erwoTgkRtDJhNkYcHcPEjoiHABz6bgIJqMvv06Hj60Qnd8XvQHMJ4IK/KBsUGkm0D1Vk+nB7QaGRyvyFrbl7rKCHQ/RulUSwcUslfOBzAdS86X8zF2XEo3iYlAr0NB3ZS8UTuo0Lx68AN79fjZx/EclTTC8Cs7UCnmbHVWnCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FAEF1F000C4;
	Fri, 16 Oct 2026 08:03:57 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] firmware: arm_scmi: Grammar s/thing/things/
Date: Fri, 16 Oct 2026 10:03:54 +0200
Message-ID: <5128072dc75dbf239dff6c967a88060a4d64b3c0.1792137751.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix grammar in the help text for the ARM_SCMI_RAW_MODE_SUPPORT_COEX
symbol.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/firmware/arm_scmi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/arm_scmi/Kconfig
index 783c24a20e29190f..9f6241efd5923fcf 100644
--- a/drivers/firmware/arm_scmi/Kconfig
+++ b/drivers/firmware/arm_scmi/Kconfig
@@ -52,7 +52,7 @@ config ARM_SCMI_RAW_MODE_SUPPORT_COEX
 	  Allow SCMI Raw transmission mode to coexist with normal SCMI stack.
 
 	  This will allow regular SCMI drivers to register with the core and
-	  operate normally, thing which could make an SCMI test suite using the
+	  operate normally, things which could make an SCMI test suite using the
 	  SCMI Raw mode support unreliable. If unsure, say N.
 
 config ARM_SCMI_DEBUG_COUNTERS
-- 
2.43.0

