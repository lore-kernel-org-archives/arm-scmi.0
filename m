Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52A9325761
	for <arm-scmi@vger.kernel.org>; Fri, 31 Jan 2025 14:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738333121; cv=none; b=HfANAkiAd77YAw9Tf5DULEVdJUI9aQxiahm/xyYBg6/jbe2IFVIoqSCqEOJc/mNTaHrDGe4qrcoW456XOss6rO/UW8gqGd8DDeIJZxcMOed+ZkePELxBwWFZSKrJ5/MTD4gfPwrbqsrGNZu27qAZLA3tmThOAO/Bvmh/KRsNon4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738333121; c=relaxed/simple;
	bh=WkwoNL3RTDlYEH45iR+jWSg8o4CYiyItYjbY8UzRdLU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Wj8L1s0hIWwEMCclFH5U0jRALtZ08XiPfiNTf7WDus3DEPjjc/MY/qri6p2NVqN7hweCJ7xq6qK1jEP6ZqWPcy74Q51Es+HmOyuEE/bdnzDqFSFY7d6J7Nq8YMpeSqVjqPPYAwvOJxSMkAhIfh9Suogskmcfr2sKg6oaivaasMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D5A8150C;
	Fri, 31 Jan 2025 06:18:59 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 89A773F63F;
	Fri, 31 Jan 2025 06:18:32 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Xinqi Zhang <quic_xinqzhan@quicinc.com>,
	Peng Fan <peng.fan@nxp.com>,
	Guomin Chen <guomin_chen@sina.com>
Subject: [PATCH 3/3] firmware: arm_scmi: Emit modalias for SCMI devices
Date: Fri, 31 Jan 2025 14:18:22 +0000
Message-Id: <20250131141822.514342-3-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131141822.514342-1-sudeep.holla@arm.com>
References: <20250131141822.514342-1-sudeep.holla@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to enable libkmod lookups for SCMI device objects to their
corresponding module, add 'modalias' to the base attribute of SCMI
devices.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_scmi/bus.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 862dd34eca62..7af01664ce7e 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -287,6 +287,17 @@ static int scmi_device_uevent(const struct device *dev, struct kobj_uevent_env *
 			      scmi_dev->name);
 }
 
+static ssize_t modalias_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct scmi_device *scmi_dev = to_scmi_dev(dev);
+
+	return sysfs_emit(buf, SCMI_UEVENT_MODALIAS_FMT,
+			  dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
+			  scmi_dev->name);
+}
+static DEVICE_ATTR_RO(modalias);
+
 static ssize_t protocol_id_show(struct device *dev,
 				 struct device_attribute *attr, char *buf)
 {
@@ -308,6 +319,7 @@ static DEVICE_ATTR_RO(name);
 static struct attribute *scmi_device_attributes_attrs[] = {
 	&dev_attr_protocol_id.attr,
 	&dev_attr_name.attr,
+	&dev_attr_modalias.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(scmi_device_attributes);
-- 
2.34.1

