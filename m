Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4684411F81
	for <arm-scmi@vger.kernel.org>; Wed, 22 Jul 2026 17:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784741726; cv=none; b=NsTHStBhpSwHCCNb6QGL8/JrNPdel/7XGo33PwZkiedNDbJvYk8HGLS0jT1X9meEm/8D1AO2NpT6oba9drKp/+UDxRFjloXbxer9QW9BfIinEECCtHwfh7NTRCoNUZJDAKWYOH3qH+Uk2zoPVB1+ZV6pT25n9UpOXb0MJzPS4E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784741726; c=relaxed/simple;
	bh=7N00M8In4kBRlfS6g86ZuvQgyF1moHoZwLaVnrbaYvA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h4F39gAkVhTPDS9RVrRNCPEJ5VUbc5F3XiQhOpyU4S6YwyZp1jHCTtAOzTsFuTtXtrW9/H72r/S7T0fz+rMpcFj03mtYlkoi63tfQdsPMa4FlZWL6HjEjac0R2NICFlla+q7gRMtwTshVHvPDsZD5FbMDInZgEdT+I2FM9T1OPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bPc/t9w8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bPc/t9w8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD641F000E9;
	Wed, 22 Jul 2026 17:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784741724;
	bh=YtMpol975CvesO8Q6KUokIqjrd11Vgy1F01PUcLSm7w=;
	h=From:To:Cc:Subject:Date;
	b=bPc/t9w8P+EPgdRNVaaddVA7qtlGOaL0rjdlTn1S1BRLkOAvncUpTrxlJK/1/+cBQ
	 4r2fi+0PMG5QDv50Oqqdhx3hRnhAjhVy3tIg7RcaddcI80Ua2aWjbXENPIfBU7FQFX
	 2LkyWyjEvlewNNIYU7V0Lev3TUu9RkPOUA5aC1w8SEFm5k4p81hBhQLFej3NUlr67D
	 c5Lv27ohXE6ZTifH8YBhh39ka971zR6t2E/6SVSWsaRgMjHwm4XGJJqZM55QJaeh1k
	 eHlfMYP1oZWwV/hRnUt7OgGH1LvxLWqEa3E9600B8V4B2FS5DPCGeVLEStmnkt93do
	 zfhwnxbaiJvTw==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 1/2] firmware: arm_scmi: Roll back partial protocol table registration
Date: Wed, 22 Jul 2026 18:35:20 +0100
Message-ID: <20260722173521.2184378-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

scmi_protocol_table_register() can leave earlier requests registered when
a later entry in the same ID table fails. Each request retains a pointer
to the driver's ID table, so a failed module load can leave a dangling
pointer after the module storage is released.

Unrequest only the successfully registered prefix, in reverse order,
before returning the failure. Leave the failed entry and the remaining
entries untouched because matching requests can be owned by another
driver.

Fixes: 2858f6e5f064 ("firmware: arm_scmi: Add multiple protocols registration support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/bus.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

Hi,

Couple of more issues[2] reported as part of review of [1]. These
are addressing those issues.

Regards,
Sudeep

[1] https://patch.msgid.link/20260722095250.2011630-1-sudeep.holla@kernel.org
[2] https://sashiko.dev/#/patchset/20260722095250.2011630-1-sudeep.holla@kernel.org

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index df396ab638dd..af3d28717cd2 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -135,17 +135,6 @@ static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
 	return ret;
 }
 
-static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
-{
-	int ret = 0;
-	const struct scmi_device_id *entry;
-
-	for (entry = id_table; entry->name && ret == 0; entry++)
-		ret = scmi_protocol_device_request(entry);
-
-	return ret;
-}
-
 /**
  * scmi_protocol_device_unrequest  - Helper to unrequest a device
  *
@@ -191,6 +180,26 @@ static void scmi_protocol_device_unrequest(const struct scmi_device_id *id_table
 	}
 }
 
+static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
+{
+	const struct scmi_device_id *entry;
+	int ret;
+
+	for (entry = id_table; entry->name; entry++) {
+		ret = scmi_protocol_device_request(entry);
+		if (ret)
+			goto err_unrequest;
+	}
+
+	return 0;
+
+err_unrequest:
+	while (entry != id_table)
+		scmi_protocol_device_unrequest(--entry);
+
+	return ret;
+}
+
 static void
 scmi_protocol_table_unregister(const struct scmi_device_id *id_table)
 {
-- 
2.43.0

