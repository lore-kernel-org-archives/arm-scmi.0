Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B0F417BE0
	for <arm-scmi@vger.kernel.org>; Fri,  2 Oct 2026 09:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933818; cv=none; b=TLpiN2AeZHtIwSzWJfMZJ+TzPU3jkj28QFRofPMZSkSxH6Jxbiy0PZX1L1YOAOzm6SIbZfaifvTHGW7AeKGXyei+RG5Lof8OwwL1F6z6cefxcvsYYCIGm61LoIch+Np8+Dov0V0DqujXf8WlGF5LqbEHxKl2lnGoCDrvgMZeADE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933818; c=relaxed/simple;
	bh=QCeurmh6KJvdMYd4NQ+wLxkkmGl5Acqkhob+GI2ipWw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OSLQQpg4vFM0W772n4cSyDf/MXSKpwtia4BC1EouO+EVJ16Mc70QsyTwa81Y7IBznCzqeM5rnMbqRsS40qJa+dn152S+EVzKr0aupNUgRXL5nYIr9f+bKitS1MNWJahxRBvVl+gfhxzGZy1ot9EfXzh1B5+0u5dTpVl6y4qMK5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AT9xMCmN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AT9xMCmN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A21C91F000FF;
	Fri,  2 Oct 2026 09:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790933817;
	bh=FTAklqKVtLlypZ4KGb3IbJa7QFH0IyhsMLm+eSzE0HE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AT9xMCmNuonoT0dWkJPsxsgai2/6VpVnNDxTORi6ofgCT4PsJ8135XQiG0K1vt0JK
	 bnJt8T0FCId2fDbRt6SFAbb2/qWsnXbnQGaCiYFbahns+sDr07EU0PQjc44teZblvU
	 +9HEyglUNSfF9veSisTSqBkB8i4JqTVK3+Eq7phFOSlM3E6h5g0Mj7qeRXYu5zvSg1
	 hIM8DFXLFvbhKewlU1JFY+ZnFWjuE278zWBFWhQXf1tppflaBWkiapPFqPTsFa++Fb
	 Eo9RKKO1L1kjWqk+f2fXJQ6Xy0e/3jo0LjV3oZuSp/peofx9SEL+FZiRjUV7zRdHc6
	 gY1BQy8TT78CQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 02 Oct 2026 10:36:30 +0100
Subject: [PATCH 1/4] firmware: arm_scmi: Avoid protocol devices in
 exclusive raw mode
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-scmi_bus_fixes-v1-1-8695cbab3fe7@kernel.org>
References: <20261002-scmi_bus_fixes-v1-0-8695cbab3fe7@kernel.org>
In-Reply-To: <20261002-scmi_bus_fixes-v1-0-8695cbab3fe7@kernel.org>
To: arm-scmi@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Peng Fan <peng.fan@oss.nxp.com>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.16.0

Since standard protocol devices are created without a driver request,
rejecting SCMI driver registration is no longer enough to prevent them
from appearing when raw mode is enabled without coexistence.

When raw-mode debugfs setup succeeds, scmi_probe() returns success
before protocol enumeration, so it does not normally create those
devices. That early return is not sufficient: scmi_device_create() is
exported and can be called later.

Skip protocol-device creation in exclusive raw mode, including named
non-transport requests. Keep named transport devices so raw mode can
still set up its channels. Share the raw-mode condition and transport
name check with the existing bus paths.

Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>
Fixes: aac4e67d6eb9 ("firmware: arm_scmi: Always create devices for standard protocols")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/bus.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 25197197db8e..f2e2ed56bc32 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -36,6 +36,12 @@ struct scmi_requested_dev {
 /* Track globally the SCMI SystemPower protocol device. */
 static struct scmi_device *scmi_syspower_registered;
 
+static bool scmi_raw_mode_only(void)
+{
+	return IS_ENABLED(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT) &&
+	       !IS_ENABLED(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT_COEX);
+}
+
 /**
  * scmi_protocol_device_request  - Helper to request a device
  *
@@ -60,8 +66,7 @@ static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
 	pr_debug("Requesting SCMI device (%s) for protocol %x\n",
 		 id_table->name, id_table->protocol_id);
 
-	if (IS_ENABLED(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT) &&
-	    !IS_ENABLED(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT_COEX)) {
+	if (scmi_raw_mode_only()) {
 		pr_warn("SCMI Raw mode active. Rejecting '%s'/0x%02X\n",
 			id_table->name, id_table->protocol_id);
 		return -EINVAL;
@@ -210,12 +215,17 @@ scmi_protocol_table_unregister(const struct scmi_device_id *id_table)
 		scmi_protocol_device_unrequest(entry);
 }
 
-static bool scmi_device_is_transport(const struct scmi_device *scmi_dev)
+static bool scmi_device_name_is_transport(const char *name)
 {
-	return !strncmp(scmi_dev->name, SCMI_TRANSPORT_DEVNAME_PREFIX,
+	return !strncmp(name, SCMI_TRANSPORT_DEVNAME_PREFIX,
 			strlen(SCMI_TRANSPORT_DEVNAME_PREFIX));
 }
 
+static bool scmi_device_is_transport(const struct scmi_device *scmi_dev)
+{
+	return scmi_device_name_is_transport(scmi_dev->name);
+}
+
 static int __scmi_dev_match_by_id_table(struct scmi_device *scmi_dev,
 					const struct scmi_device_id *id_table,
 					bool skip_transport)
@@ -591,6 +601,11 @@ struct scmi_device *scmi_device_create(struct fwnode_handle *fwnode,
 	struct scmi_requested_dev *rdev;
 	struct scmi_device *sdev, *scmi_dev = NULL;
 
+	/* Exclusive raw mode still needs transport devices for its channels. */
+	if (scmi_raw_mode_only() &&
+	    (!name || !scmi_device_name_is_transport(name)))
+		return NULL;
+
 	if (name)
 		return _scmi_device_create(fwnode, parent, protocol, name);
 

-- 
2.43.0

