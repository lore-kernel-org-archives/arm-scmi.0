Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22FDD1E8327
	for <arm-scmi@vger.kernel.org>; Wed, 12 Mar 2025 11:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741779648; cv=none; b=LkaaufI+2x7iKF9O3TASrmPwQL9vnEwwTFaKxGEN0gji9s3ZqJNostwiEsz1ybRlz4dUrdOScMJizqx7nuZfMjElhBC47JzjvcuTOW5brs+NV+enZS3HWm4IdxSAzB/dIYhPnzpQz4ItAfNBjZEWxsitu3jY8aLc9B12LU+I4oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741779648; c=relaxed/simple;
	bh=0VunvKId+eIYxYj8ySEheQ8DibsTe7qSHuPUkpqsZwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O9dYlqURr/eL/8sRn+iU2aAi1/MRUIa29gTZ9MRie4Yggd+l7+JxboH1yyjdErbVn01FR634IeENpwSZH5/XDh+xgePrFOmSxFd6kU5/zU5tc25PrSK2l33HpbuGWzFAPOdBg/HmK8hvt9w5QBCj1uIIvxDHj2ZAs4Y8mjCiLk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E59D116A3;
	Wed, 12 Mar 2025 04:40:56 -0700 (PDT)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71C343F694;
	Wed, 12 Mar 2025 04:40:45 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Wed, 12 Mar 2025 11:40:26 +0000
Subject: [PATCH 3/3] firmware: arm_scmi: Refactor error logging from SCMI
 device creation to single helper
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-b4-scmi_minor_cleanup-v1-3-c62c6cb4111a@arm.com>
References: <20250312-b4-scmi_minor_cleanup-v1-0-c62c6cb4111a@arm.com>
In-Reply-To: <20250312-b4-scmi_minor_cleanup-v1-0-c62c6cb4111a@arm.com>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3348; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=0VunvKId+eIYxYj8ySEheQ8DibsTe7qSHuPUkpqsZwU=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBn0XK6Jdwi+oy667VHsmKiUVy0gTlQ8w3gayKT3
 UPcvu/qiy6JAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ9FyugAKCRAAQbq8MX7i
 mPXnD/4ht/Ofjlu9URm34XojyW+8Gu/WXXcEh6WPL3RDaVtqTo7NcJds4KqaAOXwy/LnJk82b3Y
 pOGEiTyG2fs/sGJ4aN2B1yIC9pspkeDrfIWNbwguFFVD2/9EE6O4fdGp83EAxpy0m3bG26pKF1H
 R5JuFHx0Rz3yBxm1vxEc43Le1eWYWY16sv3VGX5eY/L+iDwGpX3FnVAAheo/WrrJ0VheKXsibv2
 SMZwjsIXZsPlRNJmGvbM4tS7v5G6jJr0BqLyVxw8mw1CA7GVLtfj85Lq3Ji4mDrMPv533jZuPXS
 6WSofQ/63CbsoJ/FxGl718nvHEuzHsJYG/NpiNzvdz8S0NAvl/4Zfk3knyLmYjyPHqzPPoXTTmn
 Mjv84bhL7d8VN8d0v7cJmp7ZHol24jF66jVG/dm/TVjXwNODlijTrtnkbTSus4FaDLhHPk7ve5h
 FadtXrc6dDBIgeg+f2iy4RNdTgSa3wY/w9Y6vDiDPIlbBINbFKnPdQQF34VfM2ZSyT07QFellcL
 7haa8Q+figqNXU4/Fmh/kZkPB3/BVyGNluBWCUvdPIEGg7/Jmt4PnxNPSM0039gUjpP2BQ0w0pM
 8tWrV+P5q3crTEa+UDgWdmNpefxD4YTwYhXlmbz70mdNcXhoSztOsD+CO8kNgvUJOKMnEXnJiWd
 FiC/MvGBeyMtf0Q==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4

Refactors the error logging related to SCMI device creation. The goal
is to remove duplicated error-handling code and centralize it into a
single helper function: _scmi_device_create().

By doing so, any code redundancy around error logging is avoided, as
error logging during device creation will now be handled by a unified
helper function.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_scmi/bus.c    | 29 +++++++++++++++++++----------
 drivers/firmware/arm_scmi/driver.c |  8 +-------
 2 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index a30fd8e05e423e226a63833f309d8d30c400fabd..493e2c63b107fd9063f11034b71d65f567bb0778 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -411,6 +411,20 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 	return NULL;
 }
 
+static struct scmi_device *
+_scmi_device_create(struct device_node *np, struct device *parent,
+		    int protocol, const char *name)
+{
+	struct scmi_device *sdev;
+
+	sdev = __scmi_device_create(np, parent, protocol, name);
+	if (!sdev)
+		pr_err("(%s) Failed to create device for protocol 0x%x (%s)\n",
+		       of_node_full_name(parent->of_node), protocol, name);
+
+	return sdev;
+}
+
 /**
  * scmi_device_create  - A method to create one or more SCMI devices
  *
@@ -443,7 +457,7 @@ struct scmi_device *scmi_device_create(struct device_node *np,
 	struct scmi_device *scmi_dev = NULL;
 
 	if (name)
-		return __scmi_device_create(np, parent, protocol, name);
+		return _scmi_device_create(np, parent, protocol, name);
 
 	mutex_lock(&scmi_requested_devices_mtx);
 	phead = idr_find(&scmi_requested_devices, protocol);
@@ -457,18 +471,13 @@ struct scmi_device *scmi_device_create(struct device_node *np,
 	list_for_each_entry(rdev, phead, node) {
 		struct scmi_device *sdev;
 
-		sdev = __scmi_device_create(np, parent,
-					    rdev->id_table->protocol_id,
-					    rdev->id_table->name);
-		/* Report errors and carry on... */
+		sdev = _scmi_device_create(np, parent,
+					   rdev->id_table->protocol_id,
+					   rdev->id_table->name);
 		if (sdev)
 			scmi_dev = sdev;
-		else
-			pr_err("(%s) Failed to create device for protocol 0x%x (%s)\n",
-			       of_node_full_name(parent->of_node),
-			       rdev->id_table->protocol_id,
-			       rdev->id_table->name);
 	}
+
 	mutex_unlock(&scmi_requested_devices_mtx);
 
 	return scmi_dev;
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 60050da54bf24c0245290e846f91aea62392855b..b80c574cb3bb2f12b2980fc844ea3da10abdc9f1 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -439,14 +439,8 @@ static void scmi_create_protocol_devices(struct device_node *np,
 					 struct scmi_info *info,
 					 int prot_id, const char *name)
 {
-	struct scmi_device *sdev;
-
 	mutex_lock(&info->devreq_mtx);
-	sdev = scmi_device_create(np, info->dev, prot_id, name);
-	if (name && !sdev)
-		dev_err(info->dev,
-			"failed to create device for protocol 0x%X (%s)\n",
-			prot_id, name);
+	scmi_device_create(np, info->dev, prot_id, name);
 	mutex_unlock(&info->devreq_mtx);
 }
 

-- 
2.34.1

