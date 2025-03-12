Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1D3723AE64
	for <arm-scmi@vger.kernel.org>; Wed, 12 Mar 2025 11:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741779647; cv=none; b=b/AAgdPryBFtEOwTGD8c2R+zUdOIvW2w/QWsaXQIcYfX4RYqvxpipMGh0oNXU4GL948ztZmYml/8vI+9O4A+DVB9D828ADW66ne1TXE3rLnRqngFV4mEPjgzYFe1TqNotN8Ubpcr8bMT01H+r24fQSq8LAX8DiRjVmE98R0PlIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741779647; c=relaxed/simple;
	bh=das9EqDKBZfkwRTCcRMlY6ZRJ43jXpNz8KtuySsJ6qI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wmq2UKKIr2XfCbOXM562HUs253tDzYeX/sTPAnktbjpghefcZawORuIYTYQOQe+wgo1/vjDjmGLM1Z+M5YbyL2qhIazenWh1FcJrsswTB1Ylhduu3tlEGdvbnpflk+t5IQEMxGyOBwKonboL6jt2RrWtRlyK0azV8Do+YUAPwd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFFF81682;
	Wed, 12 Mar 2025 04:40:55 -0700 (PDT)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A6B03F694;
	Wed, 12 Mar 2025 04:40:44 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Wed, 12 Mar 2025 11:40:25 +0000
Subject: [PATCH 2/3] firmware: arm_scmi: Refactor device matching logic to
 eliminate duplication
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-b4-scmi_minor_cleanup-v1-2-c62c6cb4111a@arm.com>
References: <20250312-b4-scmi_minor_cleanup-v1-0-c62c6cb4111a@arm.com>
In-Reply-To: <20250312-b4-scmi_minor_cleanup-v1-0-c62c6cb4111a@arm.com>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3252; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=das9EqDKBZfkwRTCcRMlY6ZRJ43jXpNz8KtuySsJ6qI=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBn0XK5z/fs3X3oDJq9HA9QiNv5A7RlmIcK15Wrl
 yCNgaVjE0WJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ9FyuQAKCRAAQbq8MX7i
 mCUKEAC1kwHaHEpBrFARMxPMM9ht7SRbhw2is+y359Y0j7nt3IM6SfW1S70kydfWvKplIA41gGg
 zqyoE9QcXZ7d8Wpn5s8JYJapkp91cu4m6XSxVX+gl2U8piW81vy3wSDY0pl1DdZLNJUykwD26qO
 GEdLleN6F5DuiCgRlPSRkKny7GnjVSTvTCe2Q7AFmSB4odg4BcE3q8M5Q4YznMNuBu9r4df/PfF
 aM280+1e245K4vUgw/5eUrh8Ewh7F1D375/Yg1LA+h4iQ3luHsQ9Fx5Dg1SskZ84Ss47QAK1cOh
 RibFdEhl6dG6PKD7PZ8FxHWR9r0ygS5f2s2hyGNJae8+jxPKpljze++l7Y0ajKyBeboHBYEr6TN
 3R9gqwh7oHzmK0BNBjcLisOUOHgnIfev6Ls/qGdnEyyXbOdxdKVvSxgrGO0qrF1YWaQyJo5kzM+
 r8L6I66BiGtIZAK+VazhkdEPVdrZdDp+m+Pe1dK4tr1VQpNEz43btSCVNm93Zk0eGXmWc7ljMuZ
 uazIOr+fGI15D4TT7yfg5ClaaDjE8O2k1yTjCfcCCkgV76YEmmyFbVORECcWzs3i9JDeOGZOUuX
 k2ahs//phoSXwFQdpzFfy6O+HtzdX+x772ssigRbcsyloCll3ZnrDJ4Q3vP1MJ25O+8lAWlH8VU
 4/BfX2H0isuUA+Q==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4

Currently, the device matching logic is duplicated in two functions:
  - scmi_dev_match() used by the scmi_bus to match scmi_devices with
    scmi_drivers.
  - scmi_child_dev_find() used to check for the presence of a device
    with the same name and protocol_id to avoid adding duplicates to
    the bus.

Refactor the code to eliminate the redundant matching logic and
consolidates the functionality for better maintainability and efficiency.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_scmi/bus.c | 43 +++++++++++++++++++----------------------
 1 file changed, 20 insertions(+), 23 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 050a5ff5dc96a7df58edff5faeb8c1ec6228b97d..a30fd8e05e423e226a63833f309d8d30c400fabd 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -206,52 +206,49 @@ scmi_protocol_table_unregister(const struct scmi_device_id *id_table)
 		scmi_protocol_device_unrequest(entry);
 }
 
-static const struct scmi_device_id *
-scmi_dev_match_id(struct scmi_device *scmi_dev, const struct scmi_driver *scmi_drv)
+static int scmi_dev_match_by_id_table(struct scmi_device *scmi_dev,
+				      const struct scmi_device_id *id_table)
 {
-	const struct scmi_device_id *id = scmi_drv->id_table;
+	if (!id_table || !id_table->name)
+		return 0;
 
-	if (!id)
-		return NULL;
-
-	for (; id->protocol_id && id->name; id++)
-		if (id->protocol_id == scmi_dev->protocol_id &&
-		    !strcmp(id->name, scmi_dev->name))
-			return id;
+	for (; id_table->protocol_id && id_table->name; id_table++)
+		if (id_table->protocol_id == scmi_dev->protocol_id &&
+		    !strcmp(id_table->name, scmi_dev->name))
+			return 1;
+	return 0;
+}
 
-	return NULL;
+static int scmi_dev_match_id(struct scmi_device *scmi_dev,
+			     const struct scmi_driver *scmi_drv)
+{
+	return scmi_dev_match_by_id_table(scmi_dev, scmi_drv->id_table);
 }
 
 static int scmi_dev_match(struct device *dev, const struct device_driver *drv)
 {
 	const struct scmi_driver *scmi_drv = to_scmi_driver(drv);
 	struct scmi_device *scmi_dev = to_scmi_dev(dev);
-	const struct scmi_device_id *id;
-
-	id = scmi_dev_match_id(scmi_dev, scmi_drv);
-	if (id)
-		return 1;
 
-	return 0;
+	return scmi_dev_match_id(scmi_dev, scmi_drv);
 }
 
 static int scmi_match_by_id_table(struct device *dev, const void *data)
 {
-	struct scmi_device *sdev = to_scmi_dev(dev);
+	struct scmi_device *scmi_dev = to_scmi_dev(dev);
 	const struct scmi_device_id *id_table = data;
 
-	return sdev->protocol_id == id_table->protocol_id &&
-		(id_table->name && !strcmp(sdev->name, id_table->name));
+	return scmi_dev_match_by_id_table(scmi_dev, id_table);
 }
 
 static struct scmi_device *scmi_child_dev_find(struct device *parent,
 					       int prot_id, const char *name)
 {
-	struct scmi_device_id id_table;
+	struct scmi_device_id id_table[2] = { 0 };
 	struct device *dev;
 
-	id_table.protocol_id = prot_id;
-	id_table.name = name;
+	id_table[0].protocol_id = prot_id;
+	id_table[0].name = name;
 
 	dev = device_find_child(parent, &id_table, scmi_match_by_id_table);
 	if (!dev)

-- 
2.34.1

