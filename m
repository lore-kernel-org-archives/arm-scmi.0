Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793012114;
	b=ICjHyYTw7X5ISHRC+xTMFzHN3dUJPVhP0kFZw2o/X+x8BvtHbvdae5oa1NPgw4uHkV/5
	 MwUFmTakAjECT9vX9WaYkMBsJJNysod2C7F04Jj1pXq+SlgOkc2Uz5SfChqw42t2m7ujq
	 /rMxTNqY5D8AmM2VosfT1VCHiEwelAKOC5Ma4EEG2bP0mFcUYToh9JEuy7U8UmTfbnaJv
	 aANzhOapNdvOdqd+sa9OEEm1s08b8k0uCn2yQtI603uByZRZQn73OPCJh8QrVmMgbKq+4
	 2KrZiKNpEyphirnWZDAa8G1LjfMoh5tMxYtZAZX8HXa9YLjVnOj1hUb2XaqThKDpdUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793012114;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/34PRy7IZamTfvrfBz2SgNlJeG8xvFiKY+9NW4j4T8k=;
	b=BMsutvpBirFGHkFd4RNucKFflsbwWBkPtEZ7CDXJATKz2tqPrs0uEyHKg+UkomkH+KCb
	 A03vwGzjZ18tP512SLvpoxHKOPDK6rWVWDqiMOWuCajixhRR0Un/Jk0PzWPgYFkrS1Twp
	 QZnMUIBMSnQJTntg8PEfot/+KeJ5GGikiOn7rDa/REhKNdcgjeNN1Q6UqOmlOXSZ8aZWA
	 muAxj2WRJYDMQj66vyeWz8c4N3pqb2amVKrRBKcVB1o9tT8e/4vKPnddZcTFbRQM2deqa
	 U+YvqWBCk8TKgyHEQ+s698HDjRs5/vaPFhtcOicdTVygRgdE865Bq9TkOClO0kQFhnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=npeyzLan;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C98D606A322
	for <arm-scmi@vger.kernel.org>; Mon, 26 Oct 2026 10:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=npeyzLan
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 790A41F01828;
	Mon, 26 Oct 2026 10:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793012114;
	bh=/34PRy7IZamTfvrfBz2SgNlJeG8xvFiKY+9NW4j4T8k=;
	h=From:To:Cc:Subject:Date;
	b=npeyzLanlMaE4+dFPlPllLN0ki3hZb+RfYbqGtd1kqL8Vme5X7HtPm2C1q5Hq+u2Q
	 TfrQVMyPGrRZSiXu8idaQ0MEZFirDkSFYIiA5eTyulmVvyaX1q1V+BC3VOMBUyvCsQ
	 ofEgBmkLA0AMU822onLF6GP+f+a57KuL24O46jCF36Fr023bil45sdZ+pqiN9O+bb8
	 DNTFeKJuYNN0XhX5e04UpqysODIWi+3hRw4gBxCZVcGeZG32MI9JKUkLQpR1uuZnct
	 vXO0vdT1zwkRsNyE7GvWtXdpR6CYdPTfcH+czpCfIZvBkOFOhMFFq7Q0ICHgjkMqdU
	 WN2Wh4tHEQ3zw==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH] firmware: arm_scmi: Drop redundant ACPI configuration guard
Date: Mon, 26 Oct 2026 10:55:10 +0000
Message-ID: <20261026105510.1778073-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
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

Commit 98b9bfb659a9 ("ACPI: bus: Use acpi/acpi_bus.h without
CONFIG_ACPI") makes the ACPI bus helpers and their stubs available
through linux/acpi.h for all configurations.

Drop the local CONFIG_ACPI conditional around scmi_acpi_device_hid().
ACPI_COMPANION() returns NULL when ACPI is disabled, so the existing
"unknown" fallback preserves the current behavior.

Fixes: 17b3cdaa7ab4 ("firmware: arm_scmi: Fall back to ACPI HID when "compatible" is absent")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 1e6f69b14321..6c6cb7209b13 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3107,11 +3107,7 @@ static void scmi_debugfs_common_cleanup(void *d)
 
 static const char *scmi_acpi_device_hid(struct acpi_device *adev)
 {
-#ifdef CONFIG_ACPI
 	return adev ? acpi_device_hid(adev) : "unknown";
-#else
-	return "unknown";
-#endif
 }
 
 static struct scmi_debug_info *scmi_debugfs_common_setup(struct scmi_info *info)
-- 
2.43.0

