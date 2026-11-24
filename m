Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549817;
	b=kyj/0AgFJqceq2M49VzlSpWSKM+Upa7bDVgn6b9UNedUBOmX7KYY6cw3dNwM+k8mQ2t9
	 qOQ0sJCLE4ihsLmgUL7bDfJTu9m+i3UULR1F5h7UC86B4ouNSi8Gl4aqTCLvOvx+/QVbN
	 VvUO0EuWqiMnKsjWyTpc1Do6VTHBowNBz+65x4WZst0SJri8sppl7Dibbg3ob2dzIlJyW
	 y/spoe9XU7ltkXpL5tS/o8jekANO8Asa+UJgdziYozP0oA6hWMsJdnyNnKHnw9HR7tJI9
	 q3gDWHGM9d9dDlLAMpKd5wkza6cccmaOkUaEz6wlwI8rKkdCuk36nQwgjFZiyyYUkvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549817;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5aHo1OGeOfOj5EfMcl+mo+WPC3cWBElxO5fk9EmyHrE=;
	b=svSGA/+isINvxx7s3VwRsBwKO3ce4WK6e29Kh2cXO1fLddJ9qhXIb+n/i70qpEmGyQfe
	 4vrmKtmZUWlw9xrEDESGmh3Qf8vRfl0XDF0kzKfdJjcAaJsXGkgozE4IDSOmX+pYx0BIf
	 DlksyOSNKYzoS+iWuyq1T25IqFWn2NxpV72aCSu8csW8HM1aWL+h1sa++q0GMVhIf2V0r
	 2oepTueCVDO4eeyN1fb/WqTf8hnZV64coXsYwbvHSTQw8LqeI0vksZXiQokI66fr+Maco
	 xdolxAyW8lkavviq26kw2VMFpZXj06aHleIDBl2YgsUzceYf1Y5spOgLIB2B0yyKPWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=iHFMiSAy;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FF3F606A323;
	Tue, 24 Nov 2026 19:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FF3F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=iHFMiSAy
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFECF16F3;
	Tue, 24 Nov 2026 11:50:13 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA1F73F763;
	Tue, 24 Nov 2026 11:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795549816; bh=wPGFAz4GR+cJOiQT8ezN/i8t+DmkptVFngiVrZEgm7E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iHFMiSAyKDWsGcyswkKUgL/4eJOQlgfv7hVV8B8uowAer51C7VY2VEoV5LibHQGqi
	 xa9pVquB6+WizRNZvC9g5ChL5zVgFGtV3GUWsZhXIPt0KcwMV808xrDap6gEQd+DP9
	 yvWOH2hB82QARS5y88zh9Z4Ei9FKAX7LJOzU4G7A=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	d-gole@ti.com,
	jonathan.cameron@oss.qualcomm.com,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	david@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v17 05/34] firmware: arm_scmi: Introduce a dedicated SCMI Errors header
Date: Tue, 24 Nov 2026 19:48:11 +0000
Message-ID: <20261124194841.1147072-6-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124194841.1147072-1-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new dedicated header and move all of the errors definitions and
mapping helpers into it and out of common.h so that SCMI errors definitions
alone can be easily included in protocol files without all of the unrelated
additional stuff contained in common.h

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/common.h | 39 +---------------------
 drivers/firmware/arm_scmi/errors.h | 52 ++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+), 38 deletions(-)
 create mode 100644 drivers/firmware/arm_scmi/errors.h

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index af5b025ee072..cdd6f887fae7 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -26,6 +26,7 @@
 
 #include <linux/unaligned.h>
 
+#include "errors.h"
 #include "protocols.h"
 #include "notify.h"
 
@@ -37,44 +38,6 @@
 
 #define SCMI_TRANSPORT_DEVNAME_PREFIX	"__scmi_transport_device"
 
-enum scmi_error_codes {
-	SCMI_SUCCESS = 0,	/* Success */
-	SCMI_ERR_SUPPORT = -1,	/* Not supported */
-	SCMI_ERR_PARAMS = -2,	/* Invalid Parameters */
-	SCMI_ERR_ACCESS = -3,	/* Invalid access/permission denied */
-	SCMI_ERR_ENTRY = -4,	/* Not found */
-	SCMI_ERR_RANGE = -5,	/* Value out of range */
-	SCMI_ERR_BUSY = -6,	/* Device busy */
-	SCMI_ERR_COMMS = -7,	/* Communication Error */
-	SCMI_ERR_GENERIC = -8,	/* Generic Error */
-	SCMI_ERR_HARDWARE = -9,	/* Hardware Error */
-	SCMI_ERR_PROTOCOL = -10,/* Protocol Error */
-};
-
-static const int scmi_linux_errmap[] = {
-	/* better than switch case as long as return value is continuous */
-	0,			/* SCMI_SUCCESS */
-	-EOPNOTSUPP,		/* SCMI_ERR_SUPPORT */
-	-EINVAL,		/* SCMI_ERR_PARAM */
-	-EACCES,		/* SCMI_ERR_ACCESS */
-	-ENOENT,		/* SCMI_ERR_ENTRY */
-	-ERANGE,		/* SCMI_ERR_RANGE */
-	-EBUSY,			/* SCMI_ERR_BUSY */
-	-ECOMM,			/* SCMI_ERR_COMMS */
-	-EIO,			/* SCMI_ERR_GENERIC */
-	-EREMOTEIO,		/* SCMI_ERR_HARDWARE */
-	-EPROTO,		/* SCMI_ERR_PROTOCOL */
-};
-
-static inline int scmi_to_linux_errno(int errno)
-{
-	int err_idx = -errno;
-
-	if (err_idx >= SCMI_SUCCESS && err_idx < ARRAY_SIZE(scmi_linux_errmap))
-		return scmi_linux_errmap[err_idx];
-	return -EIO;
-}
-
 #define MSG_ID_MASK		GENMASK(7, 0)
 #define MSG_XTRACT_ID(hdr)	FIELD_GET(MSG_ID_MASK, (hdr))
 #define MSG_TYPE_MASK		GENMASK(9, 8)
diff --git a/drivers/firmware/arm_scmi/errors.h b/drivers/firmware/arm_scmi/errors.h
new file mode 100644
index 000000000000..e1b265d5c148
--- /dev/null
+++ b/drivers/firmware/arm_scmi/errors.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * System Control and Management Interface (SCMI) Message Protocol
+ * header containing SCMI errors definitions and Linux mapping.
+ *
+ * Copyright (C) 2018-2026 ARM Ltd.
+ */
+#ifndef _SCMI_ERRORS_H
+#define _SCMI_ERRORS_H
+
+#include <linux/errno.h>
+#include <linux/array_size.h>
+
+enum scmi_error_codes {
+	SCMI_SUCCESS = 0,	/* Success */
+	SCMI_ERR_SUPPORT = -1,	/* Not supported */
+	SCMI_ERR_PARAMS = -2,	/* Invalid Parameters */
+	SCMI_ERR_ACCESS = -3,	/* Invalid access/permission denied */
+	SCMI_ERR_ENTRY = -4,	/* Not found */
+	SCMI_ERR_RANGE = -5,	/* Value out of range */
+	SCMI_ERR_BUSY = -6,	/* Device busy */
+	SCMI_ERR_COMMS = -7,	/* Communication Error */
+	SCMI_ERR_GENERIC = -8,	/* Generic Error */
+	SCMI_ERR_HARDWARE = -9,	/* Hardware Error */
+	SCMI_ERR_PROTOCOL = -10,/* Protocol Error */
+};
+
+static const int scmi_linux_errmap[] = {
+	/* better than switch case as long as return value is continuous */
+	0,			/* SCMI_SUCCESS */
+	-EOPNOTSUPP,		/* SCMI_ERR_SUPPORT */
+	-EINVAL,		/* SCMI_ERR_PARAM */
+	-EACCES,		/* SCMI_ERR_ACCESS */
+	-ENOENT,		/* SCMI_ERR_ENTRY */
+	-ERANGE,		/* SCMI_ERR_RANGE */
+	-EBUSY,			/* SCMI_ERR_BUSY */
+	-ECOMM,			/* SCMI_ERR_COMMS */
+	-EIO,			/* SCMI_ERR_GENERIC */
+	-EREMOTEIO,		/* SCMI_ERR_HARDWARE */
+	-EPROTO,		/* SCMI_ERR_PROTOCOL */
+};
+
+static inline int scmi_to_linux_errno(int errno)
+{
+	int err_idx = -errno;
+
+	if (err_idx >= SCMI_SUCCESS && err_idx < ARRAY_SIZE(scmi_linux_errmap))
+		return scmi_linux_errmap[err_idx];
+	return -EIO;
+}
+
+#endif /* _SCMI_ERRORS_H */
-- 
2.54.0

