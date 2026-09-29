Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766285221E4;
	Tue, 29 Sep 2026 12:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684764; cv=none; b=hlmpzOWAjSnZtOsParGWYiJIngBcl4YM03+P2sHUAEi44cXKDgty3qu/vtNW/9/FojbPQK293j5Ig5o4r2n+sRxx8T8qRH9lZeQ72sF2BAiUhuUw3H95AbvZ4jjlDqjJ2vEIhqiXr9TftdvSTVvY2I+HaJf1GpAuvujihW83Hsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684764; c=relaxed/simple;
	bh=CTuFz/ZO+k2NfE8V44pck4xi5aX3uyQw5l/Bp9rCqNw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JMxhQX1PW0S4pK6v021V9i/kjllcGEJzuHZMUXUGz0JNSOyuywVbddWUObfRebv1FhsSPgJ7bUVeq+w88KfUfXHKfHVeOUtUPgMAb8tkNuAWR0pFyVrKu/gQr/L1I4F1HkZdw0/GfpXtYU51P++BpQAwdYaFbKfZAHSxFA5NFRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3B401F000FF;
	Tue, 29 Sep 2026 12:25:59 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] firmware: arm_scmi: Update ARM_SCMI_HAVE_TRANSPORT rationale
Date: Tue, 29 Sep 2026 14:25:56 +0200
Message-ID: <48c4bed8036dcb55f554f513ce2ae61807c5677d.1790684637.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Not enabling any transports no longer breaks the build.

Fixes: c0397c85b53d0bc6 ("firmware: arm_scmi: Use WARN_ON() to check configured transports")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Perhaps ARM_SCMI_HAVE_TRANSPORT and the WARN_ON() in scmi_driver_init()
should just be removed? See also commit fc789363c9f095ed ("firmware:
arm_scmi: Remove legacy transport-layer code").
---
 drivers/firmware/arm_scmi/transports/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/transports/Kconfig b/drivers/firmware/arm_scmi/transports/Kconfig
index 0e34fbf250532327..6ba0dcb86204d7e9 100644
--- a/drivers/firmware/arm_scmi/transports/Kconfig
+++ b/drivers/firmware/arm_scmi/transports/Kconfig
@@ -5,7 +5,7 @@ config ARM_SCMI_HAVE_TRANSPORT
 	bool
 	help
 	  This declares whether at least one SCMI transport has been configured.
-	  Used to trigger a build bug when trying to build SCMI without any
+	  Used to trigger a runtime warning when enabling SCMI without any
 	  configured transport.
 
 config ARM_SCMI_HAVE_SHMEM
-- 
2.43.0

