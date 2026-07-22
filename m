Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6A33546E4
	for <arm-scmi@vger.kernel.org>; Wed, 22 Jul 2026 17:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784741727; cv=none; b=JION9BhGTvB77St8DhBTEQm8JRhLzQXPbvGnWsxVpkpn5iP/LUMSnuiIfSjv1eHfmiivAX9q4U9kzR+sFXs5LMd2IzVpjsjR/3qPRTQEoaADLH6dU7dKiNXfu3BZql4s0YSDw74KLdJ/qWszqoZNScZ6WI7YIc9O+3vxiXUcP/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784741727; c=relaxed/simple;
	bh=fvkkfjgg4G77fpgA//Jhxnin2sfH+uTZ8nvHyHGDVUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qHaEht7/ZVuYtUvbondh2D3N5Uv6xyxuhKsKSszL35NbcQrT3tTVSGCG2GkIdUGA4KVwLLrMHaXI1l1X5wyqyn9rU5lhyhzUTg7Qb0eqD0sht9B3ASpZMKtOCdShUdA6UgpCperzsP9M8J8o5VURRN7giX39SiKZDUcPLRMx/JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZafguT7D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZafguT7D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBB451F00A3D;
	Wed, 22 Jul 2026 17:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784741725;
	bh=TxEYmlqGGiYq3Bc30IofrgYGCXgAw0TDgEYkHxOaSog=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZafguT7DuXfAqRN1DjjINYsRkMFXjM1pCVCPbbT0ELGaqm/m3P1wFO0HchscpckLp
	 hDsDPquf95CEYh+vNNOpZNIBzL/NeZWIxrYZ3c+AJEf7y9VjqUS8Lq4j1K5jENpnDt
	 MPnhpRxS3vO2+OlKkgYwlC0hwgn4bhoGPSMKsskdE1PLG/5ZzCWyxwtou3Nh1t2U6e
	 vKZ37g1Dp7j58q2qPOeYdPHCFcy7cqnwdIRCkVchIxICaeItb15v3LfFcbw4YVIS4v
	 aa/Hu0sqW3TtuWZdbvpB9kRnirvD7koFceetkE85lxB/i9t7sOddbM03pzqIPiIbX5
	 uHB+ImqKmK2QQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 2/2] firmware: arm_scmi: Unrequest devices if driver registration fails
Date: Wed, 22 Jul 2026 18:35:21 +0100
Message-ID: <20260722173521.2184378-2-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722173521.2184378-1-sudeep.holla@kernel.org>
References: <20260722173521.2184378-1-sudeep.holla@kernel.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

scmi_driver_register() requests protocol devices before registering the
driver. If driver_register() fails, those requests remain in the global
IDR and retain pointers to the module's ID table. Once the failed module
load releases that storage, later request matching or SCMI device creation
can dereference the stale pointers.

Unrequest the complete protocol table before returning the registration
failure. At this point table registration succeeded, so every entry is
owned by the current registration attempt.

Fixes: d3cd7c525fd2 ("firmware: arm_scmi: Refactor protocol device creation")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/bus.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index af3d28717cd2..a86fa18fc5d2 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -395,10 +395,14 @@ int scmi_driver_register(struct scmi_driver *driver, struct module *owner,
 	driver->driver.mod_name = mod_name;
 
 	retval = driver_register(&driver->driver);
-	if (!retval)
-		pr_debug("Registered new scmi driver %s\n", driver->name);
+	if (retval) {
+		scmi_protocol_table_unregister(driver->id_table);
+		return retval;
+	}
 
-	return retval;
+	pr_debug("Registered new scmi driver %s\n", driver->name);
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(scmi_driver_register);
 
-- 
2.43.0

