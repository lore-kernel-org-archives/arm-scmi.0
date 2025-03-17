Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5F521D3F6
	for <arm-scmi@vger.kernel.org>; Mon, 17 Mar 2025 10:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742207517; cv=none; b=B1+UIXSadW0YyLTlWKXw0rqdbgpatej/tVB/ro1cdNyF0lRJ60+VZtRg2RoHUl7Jgv2PCktGWybIzOtYazQtsXuiWI4V11FSjHAUvvSo6cNNGCmcR9EJYPHC24yx0yxTbS78Ftn5ZSIwOVsTGsLWkTF0uxXdr23ztcfC3wyEocs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742207517; c=relaxed/simple;
	bh=das9EqDKBZfkwRTCcRMlY6ZRJ43jXpNz8KtuySsJ6qI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NJXuXTwC68jpYsxxkmiqE5X01q5iovGIX8mrCKvXIqwyU9YRrOLICVRs16qXOgkxAHGSwW/zu6yY5LRQwDQbL+3JAx+YEnoEhDHw+Ki8Ni7NTGRnCRCePunaY2ju6k+aFcNYj50XUZH521A2T+n64qvxRkwOaM7duphCofUcJtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA9DB22FA;
	Mon, 17 Mar 2025 03:32:03 -0700 (PDT)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3BB323F673;
	Mon, 17 Mar 2025 03:31:54 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Mon, 17 Mar 2025 10:31:22 +0000
Subject: [PATCH v2 2/5] firmware: arm_scmi: Refactor device matching logic
 to eliminate duplication
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-b4-scmi_minor_cleanup-v2-2-f4be99bd9864@arm.com>
References: <20250317-b4-scmi_minor_cleanup-v2-0-f4be99bd9864@arm.com>
In-Reply-To: <20250317-b4-scmi_minor_cleanup-v2-0-f4be99bd9864@arm.com>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3252; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=das9EqDKBZfkwRTCcRMlY6ZRJ43jXpNz8KtuySsJ6qI=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBn1/oX/bDNN6C4OIcuzQDIH8p91pkEVI67HPAN/
 vlg5PqJOeGJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ9f6FwAKCRAAQbq8MX7i
 mCmRD/91EUqn0e5HHr299UU4qQo8JTS92BhxmGSjlM3JhRUrGRsLUWP1eQUN3LmTaIpHBou9Ebm
 ZDXdsInfZazZYiZXTjMhHx8sk0leJqewwu5XUshKn7zX1vyWiT8sZgkKwE0yyAPvJkLt7tB8nzr
 R7KF6mQM9N1YyLfNRJaVDhwXtf7U7QGVbPQLxYUmZZbj6K927KFil/ecXDlhMY540nY5pavtF44
 MkwmekOjWz8/3iZuojsBpGvHBntZl/QO7uKzqAXLWXSEJFOBfPVWRyDkrD6NOMAwxo/G3giIUhF
 HhCVnLyQNCqt1g9+XbKKifXT/A1dKMbq0uv2UZVyfqiTEy7N48E7IAMKskxpwhbu8XdiccfHT4M
 thzORyH7uqNl3rMkRkgfZUW4IMeQ4M5aszRltf13Z2jjkZQpP+IpC8tjBHdWv31BzGHFvg2IrX7
 ApuGphOsEEFBa9UcRXe90N7C1W15wdLFnatNztq34L7eT7qadgyfLhzL281Mr4qCtuXP6w1uRaJ
 GykV5jkRAe4EwCVIy5lTkljp59OOkvU7GxF/77AmJgsp1Tpz753KgIwkVDJssyxSbBgnlvVh2b5
 flssMoWVuCzwbAb3YScQLA4IyPe0VUGq8eHZFe18+/LDXrMVLtNLa0yk5O3h8sdw+zBVdcPPRE8
 OzVVylSi6KhnZcA==
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

