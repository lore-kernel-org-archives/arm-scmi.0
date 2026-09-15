Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A60343303F
	for <arm-scmi@vger.kernel.org>; Tue, 15 Sep 2026 17:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491900; cv=none; b=fIlUIs+JAwTEx7ELI4SxxJ2s3AfOJSlZRdxEZ74g7XtGTZpHXZ9T/ajrHbviRBf6zXJlAZaIMaPTQcl95jIrWwLySkNJNpcyt4Ysp8NyrLvNOuB1QSl74gp009wkDba0MNWUPVBhB48SQ9W/v5E2Z+WMW6FI8wUGBOtbJAH8sF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491900; c=relaxed/simple;
	bh=ls6lU0em2JAiNAP+27cWVqpW/BpSBs24Gq8dxV4nQL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MRxqxtGi+IAgo6q1U2u9Qi26v/HQ1nR3CzuoFtSvGMg+0IlWy+vmU9i970wBKbUhum03ilKZJCFWJBexr+5/gYbsXP2XNWko9OZl4AqNEmvVceFCHcXh4ug1nIH+bklqAnZxyQPfbvWlnJLU5Vi+NVG6FFSRnj44uW2tppa9ljg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PzI4I/E8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PzI4I/E8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A7301F00893;
	Tue, 15 Sep 2026 17:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789491899;
	bh=8eEzBt5w9dH/8EXW2rlpjud9RALZkOP/eXJPPIgYa1g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PzI4I/E8s82pCP/TZYlgWkLNf3XXFIvUBvcQCZwbdd7TcWovGx2xrWNHkCNbOV2M0
	 DQG307jcSxZUOPw+YKAQe2LSLRZJCUSmMXipnYpQc3H1Gryduv0MsNyD95+DFEINpL
	 DXxda4Xy9g8KLHn6nyLsBNKElqLC57kE73O/RpEKLJI7foUsgobkUSxlfCRhRezhrH
	 6ZPCMVDWkMpnobCbZkeNR7UJyMu3+nNXFDQZZJS6ESWPnIpcFn2ALuLw8xlS+07y8v
	 JzUpihABU5bsFvClSpkFR2PS6hyHpuYaJr1evC0WIIwyLlFzoFMR39ZUPQb9WMtGPZ
	 uAS0J20pRD8+Q==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 15 Sep 2026 18:03:35 +0100
Subject: [PATCH v5 1/9] firmware: arm_scmi: Set generated device fwnode
 with platform helpers
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-acpi_scmi_pcc-v5-1-298579e9f359@kernel.org>
References: <20260915-acpi_scmi_pcc-v5-0-298579e9f359@kernel.org>
In-Reply-To: <20260915-acpi_scmi_pcc-v5-0-298579e9f359@kernel.org>
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

