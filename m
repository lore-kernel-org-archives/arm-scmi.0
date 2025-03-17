Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 864C0133987
	for <arm-scmi@vger.kernel.org>; Mon, 17 Mar 2025 10:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742207516; cv=none; b=P8cgtRLNm6mHDoEmqIem6Q3FHB+X+pEnhGWGiW9/Xv9TDjJQr/+3Ul1QXSze/jidfWSiedPm1jj0f0sP6u7+YKFnkrdlVJ24HbJJi5NizdFyYzmJo9JI9Pwai9JPnjytqrArwdSRhxBl83xFf8OmY2EluAAImhFenvM5PmaewHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742207516; c=relaxed/simple;
	bh=WbYcwPFa1V2cCGxOBvupgDD2HrO3B51Gf6RHdYRG7bU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WXhC5sTc53v4xVbRUDtBSCmTDAISIyuY4dLQMMoaa2cefheUyMW1SMSINv3MGn+wSqEH/qUNVf//hJgvJEd3Nsoxyld/wqEo+cNDE3OhQX2DHONLXiyTT96YFSjl8fsR44dk0CNSAPQnP7lMg9cVxypk+LiW64cugvw+dum4mOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3A45169E;
	Mon, 17 Mar 2025 03:32:02 -0700 (PDT)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 352E73F673;
	Mon, 17 Mar 2025 03:31:53 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Mon, 17 Mar 2025 10:31:21 +0000
Subject: [PATCH v2 1/5] firmware: arm_scmi: Ensure scmi_devices are always
 matched by name as well
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-b4-scmi_minor_cleanup-v2-1-f4be99bd9864@arm.com>
References: <20250317-b4-scmi_minor_cleanup-v2-0-f4be99bd9864@arm.com>
In-Reply-To: <20250317-b4-scmi_minor_cleanup-v2-0-f4be99bd9864@arm.com>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1346; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=WbYcwPFa1V2cCGxOBvupgDD2HrO3B51Gf6RHdYRG7bU=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBn1/oXaCG+TDZZOhTJY9TOzNiRDmh/ASClooXQS
 ULvaQc4/RGJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ9f6FwAKCRAAQbq8MX7i
 mDlcD/91WvfqsEDo8QCGDSrZP0K5rqejcpFZa1tHSr8VIDVtwcPHu7663QvlQvroM1N2tX+Ktk2
 xBpVmOVwD+fW+hgbPyo6h1DegKGCJtr4LVcZEsWxvNwlCpbQh6QVo3Fa9+d/o+qIf5DaVR17lud
 H3rNbLrzV0h1ZyHZJEPKlBj3HKwtiQLMQVXzsq9isyceXlYhqA06AFE9oDjWsItf0VmAqdPqpHR
 MdaA5VXOweATiNwoONMmE1j67BzBLmW9zg2E/DIxd8/5O0ACOSGFyswqqPHF1A9AiF7ewFxPPpx
 vKHkysRwFMWAMZ9s8wqjqhnyrvSy9xNytGd55d1B8pF9kdc3fZ879z9MkaJHc+09pTEa5azo3zv
 9WyvR9wIPnYKcMkYt+LFoP89jNwKWbr3zzf2osdZ6KfJq/iwk+ie2v+0hzfXrt8Wk9zGoDY6NfU
 whaJa358FDrHscdlDCAiPRM4wsggk/Bs9v4hQVIkgcapBkB2KvXufFo3m3+QvIgrawIg7cZzfT0
 IuMDJFvpAtzDBp9MXdzaZc+WAc3QhFwj4IQDBL+YungCViVlDuAfem6EIzdfzKghNauE2EYoijJ
 Ix5kvOvm/Wzkr8sED/BiMahO+CdKOXUZm9bNjtr+KiWHyQgUkTcSYc/9mROtuTb6xIjt92Wo/af
 LwY/K6iJPZHg3/A==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4

Currently, devices without a name in the id_table cannot register drivers,
and no scmi_device is created without a name via scmi_device_create().
However, the function __scmi_device_create() allows devices with no name,
which are then labeled as "unknown."

Removes support for matching scmi_device instances without a name,
ensuring consistency across the driver registration and probing process.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_scmi/bus.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index a3386bf36de508d312e2c4fa2e27ba62ba3776a0..050a5ff5dc96a7df58edff5faeb8c1ec6228b97d 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -214,13 +214,10 @@ scmi_dev_match_id(struct scmi_device *scmi_dev, const struct scmi_driver *scmi_d
 	if (!id)
 		return NULL;
 
-	for (; id->protocol_id; id++)
-		if (id->protocol_id == scmi_dev->protocol_id) {
-			if (!id->name)
-				return id;
-			else if (!strcmp(id->name, scmi_dev->name))
-				return id;
-		}
+	for (; id->protocol_id && id->name; id++)
+		if (id->protocol_id == scmi_dev->protocol_id &&
+		    !strcmp(id->name, scmi_dev->name))
+			return id;
 
 	return NULL;
 }

-- 
2.34.1

