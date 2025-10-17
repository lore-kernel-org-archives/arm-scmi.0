Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844141917F1
	for <arm-scmi@vger.kernel.org>; Fri, 17 Oct 2025 13:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760707453; cv=none; b=rBbBoahIRkYbEm3/X+xFOKPjAFQlE5DhLS8xlXTyTe3Qvsf9/CuirdB0PbSck0gX2ACLQ7fsIWchrQS8Aey/I89Leg7fQsb5d1In5poElXF1RJquDptxo7q/fTTU+np3UvtBp7LImcgVyl+5rYbn99EFgA+6ImjMm8vFZNBkFck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760707453; c=relaxed/simple;
	bh=GPen/4TU7v59VVPGFiUo5trF+9QAtLqJfILYy88cmHA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=BT7TMr4QMKrF6DfbrLM33ilQSZK01B+MP53hS4K9wPKo6yJnKaf6hK8kDzg3cWl7MoP/CLwkx072DcUhIb4UgLVVfiqRJBOORid6/v+CmiaLGmcloeVqtb74ryEyDF7+KZ7wIVmkqrLvOPuDPNxD9uMFzXhJPhdAmNi+7qnjSb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11D691596;
	Fri, 17 Oct 2025 06:24:03 -0700 (PDT)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E82C3F66E;
	Fri, 17 Oct 2025 06:24:10 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 17 Oct 2025 14:23:44 +0100
Subject: [PATCH 1/8] firmware: arm_scmi: Set fwnode for the genrated SCMI
 platform device
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-acpi_scmi_pcc-v1-1-0adbab7709d9@arm.com>
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
In-Reply-To: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Sudeep Holla <sudeep.holla@arm.com>
X-Mailer: b4 0.14.3

Add a call to device_set_node() in the SCMI probe helper to associate
generated SCMI platform device with the firmware node of its supplier
transport device.

This complements device_set_of_node_from_dev() and ensures that
firmware node information is propagated correctly for both Device Tree
and non-DT (e.g. ACPI) based systems.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_scmi/common.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index 07b9e629276d..911941e6885d 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -473,6 +473,7 @@ static int __tag##_probe(struct platform_device *pdev)			       \
 		return -ENOMEM;						       \
 									       \
 	device_set_of_node_from_dev(&spdev->dev, dev);			       \
+	device_set_node(&spdev->dev, dev_fwnode(dev));			       \
 									       \
 	strans.supplier = dev;						       \
 	memcpy(&strans.desc, &(__desc), sizeof(strans.desc));		       \

-- 
2.34.1

