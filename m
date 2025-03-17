Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AFE7133987
	for <arm-scmi@vger.kernel.org>; Mon, 17 Mar 2025 10:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742207517; cv=none; b=OLiIDW4ADs9JpnkT8pQCOEy9oVFUxJLv8ZtLjFEmxqyOFq/uxL4BX70tEF7qJNO1ZLWPDgG6LoMUHNICYzHg4TLDDKxrG+bcTjvjdfsPPWsg4RVB/ae5DOunsmpibhziT6EsAH8vYqUPriRa42Guii8doHR4xSbkkMuAY9sp+jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742207517; c=relaxed/simple;
	bh=0VunvKId+eIYxYj8ySEheQ8DibsTe7qSHuPUkpqsZwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QMRudR6fbn5NmoWanyx96x9lwtA99Q20+bE1j+ganlndBYb4MxvrNXdqSOkYHngi7MyoBAB+/c7S0ggIyhXXKHWAduI41AJ4rrgj4eK2zypOBsHQ85FDCA2N141zGjStypXiqFJVAFpLmTUwekLaJTUD15JkVdm3lcOxyrMolis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E15D42573;
	Mon, 17 Mar 2025 03:32:04 -0700 (PDT)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 42A9A3F673;
	Mon, 17 Mar 2025 03:31:55 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Mon, 17 Mar 2025 10:31:23 +0000
Subject: [PATCH v2 3/5] firmware: arm_scmi: Refactor error logging from
 SCMI device creation to single helper
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-b4-scmi_minor_cleanup-v2-3-f4be99bd9864@arm.com>
References: <20250317-b4-scmi_minor_cleanup-v2-0-f4be99bd9864@arm.com>
In-Reply-To: <20250317-b4-scmi_minor_cleanup-v2-0-f4be99bd9864@arm.com>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3348; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=0VunvKId+eIYxYj8ySEheQ8DibsTe7qSHuPUkpqsZwU=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBn1/oXGXo6nMyBXZwcB8PiBW//97hd3w0Y4eLpj
 OODF0LBRDKJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ9f6FwAKCRAAQbq8MX7i
 mMEhEACwMbFPuziNNpyehwRtN3ACLpifBgRPCfhGpDGXyaBp+mfbHySNr74yMDxG8Gjy3tao/k8
 aAg1Eq75qKeN1BkYxLMAmgdWu1zZ5QPanx4F2f5TjkMR98j9Tl8ecGU10SgvSUKv1OY8UG6n3tn
 Lcw9hW2U/M5lLNwESg36UK3EP3IGEkv2hyxFIOnD+bnVGx3i6k5UkKYmEvJioIvVjvu1lj35Svu
 YLkjbms/SaVe69/+2PtZlwr79kK86Bv1gdZUSU2rUvwLiejNZodQTns3HbKJGlJUTO6BsIHbGJF
 cp2Bf8RG0Gz3U2YLObpWmFTCUYJ2Zz4HzNmzhUlgdI1QYyaVACyOCKgQeXfCBUabq42n2npBgHy
 tHlC0qaMAejiznWvXj6HH5sFzDH13EPRtyDXxP7HPf0EySE41Y+ldkpUtY/w7aHrrddzOo/UiEG
 PSL6B4Xe5hARTtGYPdMEY8m+WIlhon4JF6qMXQiLQ+BRxDLLZt/saL418yqQb4McuPdPX4sSHvS
 BKUMuPZnqxnrMfWVcEaEeQPqt2oyiDKSrH0P2/Zf1wztrvyTUzRbZ+rjcVc9uUM+SEw1ml9rhT4
 AVQNSb1D72QleBfEm5QZOl/yutVX7q1kX3M0DXwrx3SoAq5z0ju7wrcIeS9FP5D9wQ7JFY7OLDM
 chBzVQgZI4M+F7g==
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

