Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CFD25771
	for <arm-scmi@vger.kernel.org>; Mon, 25 May 2026 20:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779741862; cv=none; b=f5iJL1auSZYjDAG5coGYliQBu+LYOmW9Davia+ZC+gx1SckjIniXOAOfgHR3Y9yzRsFoCCLwImWmC07frxJeLiNRm/6zf2K8imzO0m6GEafi8jZoylp+Z0WdyAG61JJeoRHT67qkUqIgcLEbhhGkFNjw2bdektSIPYNeWJ5BVwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779741862; c=relaxed/simple;
	bh=twPc962be3LBt3r7QTVhyVa6OqGKV+Dfsv6KNMUqgRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h8Rv2BthA+5+7VqM/gef8g2xHXKCYY3PEj+co5uzvh2mJ5KhxfAc18Em2Ye1hIYRZp7vBA+IzthusMMIZ6JLn6RS0W3YNHGuX569SgR4sjiSZAVOvzAXJk2Wr10EmYomdePQUogtA6MCaymxyQlCgCQroMkJX1sfGLiogLh26nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KD7tiTAp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KD7tiTAp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB94A1F00A3A;
	Mon, 25 May 2026 20:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779741861;
	bh=tkDwSFofb2Cx7TIeCwWJaeJKoN+L+6nmkZ1FtUD5ehw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KD7tiTAp6jT5/Mw5HIDbX/3ZPXVE9rsxousi0EakrsJO++ySuCTmKCx2I9jm2xA3r
	 uie2Ddb39PEXViyMiXY4tuahtlJSoQWTBRZ62xjvD2RdMfeQdsrIqx7akp8wa/SR+p
	 Jh8DYcnz9Bszgq0rqtEAlZ7o9+W2nNfLUCVzOx0REPnAT1hrMQh4CkYYpSq22wnrm+
	 +QISr41acoaZsUT8KdIso6vCerujjowk3P7gaHt1qs7HJVXLrpchv459BYtPKX687r
	 KeDGxcP0LFqs1c8BPdYhDK7g5LlTu6BeXPCX+21zNCKtIXNQYF/YyNq7NyZ57LtOmb
	 ySBjSS9bSllCA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Mon, 25 May 2026 21:42:43 +0100
Subject: [PATCH v2 5/9] firmware: arm_scmi: Fall back to ACPI HID when
 "compatible" is absent
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-acpi_scmi_pcc-v2-5-4f38938d08d8@arm.com>
References: <20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com>
In-Reply-To: <20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

scmi_debugfs_common_setup() uses the "compatible" property to
populate the debugfs transport type string. ACPI-described SCMI
devices do not provide that DT property, so the string remains
NULL and debugfs setup falls through the allocation failure path.

Check the property lookup result and use the ACPI HID as the
fallback transport type for ACPI-described systems.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 75dda6d5e8b1..04a0d8202504 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3028,8 +3028,9 @@ static struct scmi_debug_info *scmi_debugfs_common_setup(struct scmi_info *info)
 		return NULL;
 	}
 
-	fwnode_property_read_string(dev_fwnode(info->dev), "compatible",
-				    &c_ptr);
+	if (fwnode_property_read_string(dev_fwnode(info->dev), "compatible",
+					&c_ptr))
+		c_ptr = acpi_device_hid(ACPI_COMPANION(info->dev)) ?: "unknown";
 	dbg->type = kstrdup(c_ptr, GFP_KERNEL);
 	if (!dbg->type) {
 		kfree(dbg->name);

-- 
2.43.0

