Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C21D222594
	for <arm-scmi@vger.kernel.org>; Mon, 17 Mar 2025 10:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742207522; cv=none; b=tUYr+4NLkSKOI/u3nmot1URKRQE5AT0pnGeGZ7/xSht6eFTIlYdTyf8Pxczxuf4CiG97rRN38PCm82DhMrQC6X4+InwkZRdi+tIfsSw4vaHGXRIYRByKzfHtvlb6kMy6YRTyPhHwF9ECmJF+b3CWYicuEEyIjOy2Xn3CKCDDCCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742207522; c=relaxed/simple;
	bh=mZZiNnV+dVw+v9KoptYJu4F6GYbaOFq2eVdf689ZBD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NflYQNJsMhIfo55vFi6NRH5WqNwgTspbJx2403Ru/ckiswk6De03mfEc1/vmXrzt1kjtecbtXoaVBOQN040Q16/cvQG9oJUrcsrJ34iT6ovMW1Bvt+juQyaMb3YxkTbgGU1hPWBP/lM2S4vc1tkkqDfMeFIr8vaTGdQ+gVRaPL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E854F2576;
	Mon, 17 Mar 2025 03:32:05 -0700 (PDT)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4982B3F673;
	Mon, 17 Mar 2025 03:31:56 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Mon, 17 Mar 2025 10:31:24 +0000
Subject: [PATCH v2 4/5] firmware: arm_scmi: Assign correct parent to
 arm-scmi platform device
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-b4-scmi_minor_cleanup-v2-4-f4be99bd9864@arm.com>
References: <20250317-b4-scmi_minor_cleanup-v2-0-f4be99bd9864@arm.com>
In-Reply-To: <20250317-b4-scmi_minor_cleanup-v2-0-f4be99bd9864@arm.com>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1404; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=mZZiNnV+dVw+v9KoptYJu4F6GYbaOFq2eVdf689ZBD4=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBn1/oXyNMrXg9MnZVuIKmNMGEYZ4lnH674QgePH
 UGbz08fcQmJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ9f6FwAKCRAAQbq8MX7i
 mGU1D/sHfBvDC7UistySWK57S4vengY/pgahfQwNwjYmXCgjIqLNZPi4MQfhiA+gsTy2cR+ZjAN
 jcJa1FxtzTUZvuGli502xsMomnHpcPaLUwptgXxxOfwy3dsxK9fxUTNodN0Cw/iq/+JTr1zfV9T
 0MMMWgODB2KcuSfBR/BjgXZAuDfgSTZmqPYDtH2MB7N3dim8tSI1gC/zKvphLusxCGglkOVQTDH
 5axyAgB84u4ZFyRZn1h7/epyWEE9MUzrf/3M2gkOQreGCcWPJyyxPYWRZ66vauw0gfmtL42wTuG
 HDoEcs8gk6XKdRfof7iXLT4HdHqWkYtv52sOPT78xzcZ/ZkXdZODHozJe1Ac6VhUK9Hwx+rnSgQ
 OzzWBjfYvn4LRGLuoilv0PTSjEiQWnsRvdQmkjQ9U+oSgZBloSDLc8iRq8RgEsyquere6sn3laq
 +zjD35IOARKxj0m2gwhZuVylyecbr8C1H+cr5kTHt4HSFGWCFzYF3LoenEJjRKWnP5tu/T2xJU/
 ehFrT/11fF4l3cZ1G26IZy9ZSlnavPJDPWrCJcstv6Pl1nTtZqm5a22t+TFo78SS5ncZqfbA3TF
 wvyX37/oy3UXj4fyFZgSycCwww3a6IP5QdG4lKjxPEXT/Hz82M36MJ2pvmlTTx8OFiRoTcX6DJS
 wSUhgD5WxGJMeLQ==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4

With the decoupling of transport drivers from the SCMI core, the
"arm-scmi" platform device is now created dynamically from the probed
transport driver.

Currently, this "arm-scmi" platform device is added to the root of
the platform bus since no parent is assigned. However, the transport
platform device, created from the "firmware:scmi" node in the device
tree, should be considered its parent.

Ensure that the parent device is correctly set for the "arm-scmi"
platform device, aligning it with the correct transport hierarchy.
This will be more useful on systems with multiple transport and/or
SCMI firmware instances as the hierarchy is maintained correctly.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_scmi/common.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index 10ea7962323e43e03e7c5636c56d707803d4ea55..dab758c5fdea3aa34188ef7d424ba8a43ada46d8 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -475,6 +475,7 @@ static int __tag##_probe(struct platform_device *pdev)			       \
 	if (ret)							       \
 		goto err;						       \
 									       \
+	spdev->dev.parent = dev;					       \
 	ret = platform_device_add(spdev);				       \
 	if (ret)							       \
 		goto err;						       \

-- 
2.34.1

