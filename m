Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CAC175A86
	for <arm-scmi@vger.kernel.org>; Mon, 25 May 2026 20:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779741859; cv=none; b=kB0aQrrKNWs1Z0T12zxJtYsyxvSeZIwvrXXJCHwadwTLuLlHCBKj7k7rLV/yQvm0Mkdp19LLLxDCeTODnPLYczc4CZxxfwa+3LLnsIH0NyoB6qjCDUrpMIg7ZkI9ut016LUMFpPXCxtuX9N8fYrDtc1psDHt7dr/8UKiijz1Z/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779741859; c=relaxed/simple;
	bh=GHMKrOHf3dnyAp4iz8bvtq5PWjtX87lscoDRf4uC8yE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eI7owuD9lLq82QYq5hhhxmrzIJIXdRFyUbvpawTc+UjeFhwPnpkpUIiRgMzcJBsBZ9j8hOhWdyBm9lag974sq61s7Yho9SqwlGQJVR54n/A9aq3InVKlEuG0PfIcMwVkL443MxaTRmDrDYfyCalq30pR1vOIEsItA2v9HFSGj18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jAzHwS+t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jAzHwS+t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 797621F00A3D;
	Mon, 25 May 2026 20:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779741858;
	bh=/7NAGk2PTjrSuxAU53GJ+dkf6zZQMPpsPWuOx8oT0f4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jAzHwS+tpKvNKbh7idJaE8L9W/vb7c6+MBMRmHu9l5WP/WF196JCheC5Yw2G1B88E
	 nY8YKt/CtIUfXoc/PbCMHmR1xz3RzuyIJm+JNwrr32QhXJy3JWR2TGrczZYeMQX5uC
	 7VpmuwEpev2GUzEv4N/uBkIfRVCyQv6wDZIzVFitqF5KKzAvDcfjjEUWLGLB9ZDMKj
	 J9Zy5Z9ppB+sX3uk8WIrZOb33N0HY64NyP+/4rzXMSGYl53RIbCK6lKwVDto9qRK1t
	 T79C9Cf5ESvz1LGDQoBpwHQbocYRoOUShagUgjk+okVFhLh5ZzZRWrUCrJq3yQSa50
	 dCW2Qj12NQjGw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Mon, 25 May 2026 21:42:40 +0100
Subject: [PATCH v2 2/9] firmware: arm_scmi: Set fwnode for the generated
 SCMI platform device
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-acpi_scmi_pcc-v2-2-4f38938d08d8@arm.com>
References: <20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com>
In-Reply-To: <20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

Add a call to device_set_node() in the SCMI probe helper to associate
generated SCMI platform device with the firmware node of its supplier
transport device.

This complements device_set_of_node_from_dev() and ensures that
firmware node information is propagated correctly for both Device Tree
and non-DT (e.g. ACPI) based systems.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/common.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index 7c9617d080a0..cc469370e989 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -497,6 +497,7 @@ static int __tag##_probe(struct platform_device *pdev)			       \
 		return -ENOMEM;						       \
 									       \
 	device_set_of_node_from_dev(&spdev->dev, dev);			       \
+	device_set_node(&spdev->dev, dev_fwnode(dev));			       \
 									       \
 	strans.supplier = dev;						       \
 	memcpy(&strans.desc, &(__desc), sizeof(strans.desc));		       \

-- 
2.43.0

