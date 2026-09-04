Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E525013AC
	for <arm-scmi@vger.kernel.org>; Fri,  4 Sep 2026 15:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537580; cv=none; b=XNjPBEiXDsHoQzah6wJG+I7yX9eXV0LmBq7OGESvKJMqUH0KcihyTis4S52spTz0mmeXJEe5swszV+pmJfTrNqbHL1yms6k1yqhdFHf8c15o3AtUVvn5PH/+eeNgTb7wdRW7Vbl0gFstMM4vmxai3j8ps7X84ZijOKb41bo3aaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537580; c=relaxed/simple;
	bh=ls6lU0em2JAiNAP+27cWVqpW/BpSBs24Gq8dxV4nQL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fwDEC2Zaw3haBF8xkUNtvgmO9DmI4e7DdqQ59riaETWX2oSQChivIEv5UMk4prPzIV2MKxxdeV/Wc5H/DYML+UNUdBzTeZ65EOAmwZlWoujDpg3Lxa/VheZAJ6tFhkLbd86qE876mhs7WYRi7j6unkOd18EJoodbCgfK18KbWQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LoV+6npU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LoV+6npU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C21D1F00A3E;
	Fri,  4 Sep 2026 15:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788537579;
	bh=8eEzBt5w9dH/8EXW2rlpjud9RALZkOP/eXJPPIgYa1g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LoV+6npU3X0tfRsiNWA+pguUTvNwILVq4PEvW2b637t8f4ZYMqq2rRVt+P+8eVqGd
	 j6iUOZapXILEQgxZUVrab3rzfCWLfNIiZPDbQKiXfBIKQkbn/iIvOf6bd4rgpO0AjF
	 1S/vyYeW7gICB6Z6G8qMJftLq1lhrlV+1vYgxpGaQPJBccKwlSaRjVFd0oiVgLU9et
	 7KJfaqvTKGqWs+jA8zIQe0D4+NVTi8UJ7UnobBPhk9N8b51Rf1ak/l9eXwADcGRlxl
	 W7BKK8HmpssMcpQCZWxXzYUBHCVzNlHEVdY7xE5JqYdDOMUdOPl5t+p4iTebFrgrYg
	 IATp+wN8huChw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 04 Sep 2026 16:57:56 +0100
Subject: [PATCH v4 1/9] firmware: arm_scmi: Set generated device fwnode
 with platform helpers
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-acpi_scmi_pcc-v4-1-6ebe9755606e@kernel.org>
References: <20260904-acpi_scmi_pcc-v4-0-6ebe9755606e@kernel.org>
In-Reply-To: <20260904-acpi_scmi_pcc-v4-0-6ebe9755606e@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-team@meta.com
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Breno Leitao <leitao@debian.org>, 
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
X-Mailer: b4 0.16.0

The SCMI transport probe helper creates a platform device for the SCMI
core. device_set_of_node_from_dev() propagates the supplier's OF node,
but leaves generated devices for non-DT transports without a firmware
node.

Use platform_device_set_of_node_from_dev() for devicetree suppliers so
the shared OF node is referenced and marked as reused. For all other
suppliers, use platform_device_set_fwnode() so ACPI and other firmware
nodes are propagated with a reference that platform_device_release()
can balance.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/common.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index fe8c22cfb9f7..244f4ee5b655 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -649,7 +649,10 @@ static int __tag##_probe(struct platform_device *pdev)			       \
 		goto err_mem;						       \
 	}								       \
 									       \
-	device_set_of_node_from_dev(&spdev->dev, dev);			       \
+	if (dev_of_node(dev))						       \
+		platform_device_set_of_node_from_dev(spdev, dev);	       \
+	else								       \
+		platform_device_set_fwnode(spdev, dev_fwnode(dev));	       \
 									       \
 	strans.supplier = supplier;					       \
 	memcpy(&strans.desc, &(__desc), sizeof(strans.desc));		       \

-- 
2.43.0

