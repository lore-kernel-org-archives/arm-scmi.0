Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AA747279F
	for <arm-scmi@vger.kernel.org>; Fri,  2 Oct 2026 09:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933819; cv=none; b=jHkkoO4phZTMw+dH9hu7idc298ouJ5+Q+/wl9FTlYHC3fpE9MxWU1Uihuiy4fxPCNbD5xsm/VLSq0w1K0aeOSo708w5EnSb8eoCEfZCYxxbdFSctaIOnGw9E2y/XW7cw2ATY5/ZzyeljarB2NepeVwlMfi8l1omtXkajV51YlvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933819; c=relaxed/simple;
	bh=shu7rKxIO8XtB1fmdkNDoNax9lh3rLsniskz/UGSCzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S1qwUuH8PR/CbVbLQYkjlCgAMtx04d8Yt/3XFzfcm+dGc6LFmacAFg+VqreHH3U3TK3LQNVEAADYtdWCH0p8dyWNcbjYsFWzsYeyU72AEGYbom0O8gMNu/yteO/eJtlE9f/8QoXF36Bv8+6KcKpiGvqwHsa3leIGWUj9d/0813A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eZufo0QW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eZufo0QW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB9E51F00899;
	Fri,  2 Oct 2026 09:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790933818;
	bh=XLqSl54g8KdtFaqbkPEJtih1EheroKAqXHnSs+mth1Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=eZufo0QWeCY2sOjMnA/QtQqko1pDDA4pGVZ25j7/LK9BQg4EaykNiqaj4yDTvpIgO
	 M5/0OZiFDSmKzJWrzy2/NffJOznnr1r6Y6JtRi73tmc46snsrlUCK7aYJCwxxhcMvt
	 TAlXSW+s6EAECuXOyWNVtM+rQRpJyk2tT/ExSySWyXNAGAAZvPwGS3+J8hW8X9pKIC
	 YQyQxF3qda9dZJOKOVDqKt7HdbguIFGVCKjlH2ttbU2iAjBtHgSqWac7jQ5IrxYi3y
	 T4/IKluOx+qYWTZQDwENCKPUTBikjFsAoj5dILUUgTSM8w3L1Geq5Pzmquo/QfyTK5
	 GWCszzzX2fyCA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 02 Oct 2026 10:36:31 +0100
Subject: [PATCH 2/4] firmware: arm_scmi: Skip requests for standard
 protocol devices
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-scmi_bus_fixes-v1-2-8695cbab3fe7@kernel.org>
References: <20261002-scmi_bus_fixes-v1-0-8695cbab3fe7@kernel.org>
In-Reply-To: <20261002-scmi_bus_fixes-v1-0-8695cbab3fe7@kernel.org>
To: arm-scmi@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Peng Fan <peng.fan@oss.nxp.com>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.16.0

The SCMI core creates devices for the standard protocol IDs during
protocol enumeration, without waiting for an SCMI driver request.
Recording a request for one of these devices also rejects a second
driver registering the same protocol/name pair.

When the first driver unregisters, unrequesting that pair destroys the
core-created device. No other driver can be bound to it at that point,
but removing it also removes the device that a later driver could bind
to or use for module autoloading.

Skip request tracking for standard devices. Keep request tracking and
rollback for nonstandard devices unchanged.

Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>
Fixes: aac4e67d6eb9 ("firmware: arm_scmi: Always create devices for standard protocols")
Reported-by: Peng Fan <peng.fan@oss.nxp.com>
Closes: https://lore.kernel.org/all/20260928-driver-core-v1-1-0846bb8e0f32@nxp.com
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/bus.c | 73 +++++++++++++++++++++++------------------
 1 file changed, 41 insertions(+), 32 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index f2e2ed56bc32..230ee9f6f1aa 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -186,12 +186,44 @@ static void scmi_protocol_device_unrequest(const struct scmi_device_id *id_table
 	}
 }
 
+/* Standard protocols table */
+static const struct scmi_device_id scmi_std_id_table[] = {
+	{ SCMI_PROTOCOL_POWER, "genpd" },
+	{ SCMI_PROTOCOL_SYSTEM, "syspower" },
+	{ SCMI_PROTOCOL_PERF, "perf" },
+	{ SCMI_PROTOCOL_PERF, "cpufreq" },
+	{ SCMI_PROTOCOL_CLOCK, "clocks" },
+	{ SCMI_PROTOCOL_SENSOR, "hwmon" },
+	{ SCMI_PROTOCOL_SENSOR, "iiodev" },
+	{ SCMI_PROTOCOL_RESET, "reset" },
+	{ SCMI_PROTOCOL_VOLTAGE, "regulator" },
+	{ SCMI_PROTOCOL_POWERCAP, "powercap" },
+	{ SCMI_PROTOCOL_PINCTRL, "pinctrl" },
+	{ SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },
+	{ },
+};
+
+static bool scmi_device_id_in_std_id_table(const struct scmi_device_id *id)
+{
+	for (int i = 0; scmi_std_id_table[i].name[0]; i++) {
+		if (scmi_std_id_table[i].protocol_id == id->protocol_id &&
+		    !strcmp(scmi_std_id_table[i].name, id->name))
+			return true;
+	}
+
+	return false;
+}
+
 static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
 {
 	const struct scmi_device_id *entry;
 	int ret;
 
 	for (entry = id_table; entry->name[0]; entry++) {
+		/* Skip standard devices as they are created unconditionally */
+		if (scmi_device_id_in_std_id_table(entry))
+			continue;
+
 		ret = scmi_protocol_device_request(entry);
 		if (ret)
 			goto err_unrequest;
@@ -200,8 +232,11 @@ static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
 	return 0;
 
 err_unrequest:
-	while (entry != id_table)
-		scmi_protocol_device_unrequest(--entry);
+	while (entry != id_table) {
+		--entry;
+		if (!scmi_device_id_in_std_id_table(entry))
+			scmi_protocol_device_unrequest(entry);
+	}
 
 	return ret;
 }
@@ -211,8 +246,10 @@ scmi_protocol_table_unregister(const struct scmi_device_id *id_table)
 {
 	const struct scmi_device_id *entry;
 
-	for (entry = id_table; entry->name[0]; entry++)
-		scmi_protocol_device_unrequest(entry);
+	for (entry = id_table; entry->name[0]; entry++) {
+		if (!scmi_device_id_in_std_id_table(entry))
+			scmi_protocol_device_unrequest(entry);
+	}
 }
 
 static bool scmi_device_name_is_transport(const char *name)
@@ -542,34 +579,6 @@ _scmi_device_create(struct fwnode_handle *fwnode, struct device *parent,
 	return sdev;
 }
 
-/* Standard protocols table */
-static const struct scmi_device_id scmi_std_id_table[] = {
-	{ SCMI_PROTOCOL_POWER, "genpd" },
-	{ SCMI_PROTOCOL_SYSTEM, "syspower" },
-	{ SCMI_PROTOCOL_PERF, "perf" },
-	{ SCMI_PROTOCOL_PERF, "cpufreq" },
-	{ SCMI_PROTOCOL_CLOCK, "clocks" },
-	{ SCMI_PROTOCOL_SENSOR, "hwmon" },
-	{ SCMI_PROTOCOL_SENSOR, "iiodev" },
-	{ SCMI_PROTOCOL_RESET, "reset" },
-	{ SCMI_PROTOCOL_VOLTAGE, "regulator" },
-	{ SCMI_PROTOCOL_POWERCAP, "powercap" },
-	{ SCMI_PROTOCOL_PINCTRL, "pinctrl" },
-	{ SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },
-	{ },
-};
-
-static bool scmi_device_id_in_std_id_table(const struct scmi_device_id *id)
-{
-	for (int i = 0; scmi_std_id_table[i].name[0]; i++) {
-		if (scmi_std_id_table[i].protocol_id == id->protocol_id &&
-		    !strcmp(scmi_std_id_table[i].name, id->name))
-			return true;
-	}
-
-	return false;
-}
-
 /**
  * scmi_device_create  - A method to create one or more SCMI devices
  *

-- 
2.43.0

