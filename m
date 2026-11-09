Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215707;
	b=IUQYQJbcygZp4dp1o7YWyyPkvkyBccy0Wnr4FDHHXu34hzyqHJYhjduq8xe7SAwhIuFs
	 bvwnXo4+k+tCldMkTnWTv/6gaS/9M7EtkObbORAKMMVu7k6lLSrzTwU5VTZsLVMEs+PtE
	 qvWHnsjlV2Dq+h4T7T2iCHxV/uLzmNtF1kUPEhRbItoB43glzAGDUmuwArws1HXPAuD0a
	 0O2A0xev+fhVb2usXbPWCwNMfPUUU4Vxxredk3nPFVvTB1sZixAwvrmqsWG68c/nG52eD
	 JCOWyk5cBvGSN6yHD0b8+k6QSha3/9uXp93L9ZhK//PaGsy8ShMtU51QsJ/VFMQWmVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215707;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UYJz7fX4zwi80x+P/NG3pIBBNTjCoj0tA1TBNbVJ9WM=;
	b=wh42smfc7QVAeCMSWvvETIEbJiYQ9nhRGrHuzbf+Bw/6XSq5HjpWRq+bblqvylka4ZvB
	 nxuNFwiGgd622Vw6Lr3cOk6OAe0GpNgm4M83M5IMUtavv8PEqB34eh2rakEo8daAGswYq
	 ydXx2Lq9sXUPDgySsXzKgPSYkEEagf1mjnaeP5v24Xsnw7KBFzBAIsnAElicEZyfUWw3o
	 RPTL/Mr6D6rMxeSY/SOwja04P0FyTzv+753BhBgEWPqgtwDNd7x4Cfz2yLjYblwvcZsMm
	 jK74nX4oL/UGCXivAjN0rQJZZQqAVpCa+AerGssIXrGXaWN8R9GDG94dx2vgm+LancQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=L2mxu04X;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FF97606D827;
	Mon,  9 Nov 2026 09:15:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FF97606D827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=L2mxu04X
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B36B015A1;
	Mon,  9 Nov 2026 01:15:02 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D249F3F85F;
	Mon,  9 Nov 2026 01:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794215705; bh=R78LreelbUvgmoXazot1Q7WXG8aY7jM8C3RE/Bq+AmQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L2mxu04XL4WbiGkffgKcq+n5X55MkkIC93nquWDEPJhrnu0NbRr+qrLw/NTHplb7P
	 J6gLzjNAFCAWV/6x1IZusZv37rTL/duNvmpw8iUdskvCWqqmGFUUUlmJhnd1C4Avkw
	 0ngncz82JUPrBEkM3Qo+pB2Aj1wRREGArDsv2Wag=
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
Subject: [PATCH v15 03/35] firmware: arm_scmi: Introduce a dedicated SCMI Errors header
Date: Mon,  9 Nov 2026 09:11:49 +0000
Message-ID: <20261109091221.2532706-4-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109091221.2532706-1-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
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
 drivers/firmware/arm_scmi/common.h | 43 +----------------------
 drivers/firmware/arm_scmi/errors.h | 56 ++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+), 42 deletions(-)
 create mode 100644 drivers/firmware/arm_scmi/errors.h

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index e3390686fc58..cdd6f887fae7 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -26,6 +26,7 @@
 
 #include <linux/unaligned.h>
 
+#include "errors.h"
 #include "protocols.h"
 #include "notify.h"
 
@@ -37,48 +38,6 @@
 
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
-	SCMI_ERR_IN_USE = -11,  /* In Use Error */
-	SCMI_ERR_PARTIAL = -12, /* Partial Error */
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
-	-EBUSY,			/* SCMI_ERR_IN_USE */
-	-EBADMSG,		/* SCMI_ERR_PARTIAL */
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
index 000000000000..707761cd8d34
--- /dev/null
+++ b/drivers/firmware/arm_scmi/errors.h
@@ -0,0 +1,56 @@
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
+	SCMI_ERR_IN_USE = -11,  /* In Use Error */
+	SCMI_ERR_PARTIAL = -12, /* Partial Error */
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
+	-EBUSY,			/* SCMI_ERR_IN_USE */
+	-EBADMSG,		/* SCMI_ERR_PARTIAL */
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

