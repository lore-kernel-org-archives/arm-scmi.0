Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549800;
	b=NsfURjoXNLSf378N6t8Kf8ejKrvtu7qng1I0P9qR0nCUTO5m+XKd5crzNRglZiSs1TN9
	 eFkMW77g0UgSGJhGV3xKabTv/L65XAUzNQ5p9nORyNmWsxs7C6Om/uSjL4PlXNrwCjjUQ
	 11L4vePJHqdvpwEmhU+cZ1SOje2lOKkh7y0UjmrPONaCp6sEFuvnBzTtOHoKEk81+W53q
	 6dOynimTf4d1BpWwQwAzU67MnEtka3fBmwZD7vMgXLUM9ULrYwkGSAWsc4IZxObcDCx6P
	 VlNtA78O3u+t8OrkoubtUJGgMN42A9vsDT8Fa2YxOE+9w40tRGSRwqQKJuqLcj3qB5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549800;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vtM2MEBmduOcZZltNQ7NOe1dSUbwO9go+8cdTtGYRPE=;
	b=nUa43TCT/NtRQjK1HpMRB/foVX1XVzbutP26B5j5z8u4zQNk6KmxCt8QG8EdUOCknRNT
	 VZqUX+rfyL5JXpLSJoFe4IMFa6EPF9BIwGPBAryP/TpSlxyjAkZVwWkdmwrIZkrchwPpG
	 KRDGcpsZWIhn8zNFseecP16FP1kXHq8QRSsj9eTTRaRuQrL+X4Wesw6qVWUDcIQHMJt/d
	 L6FkHiskKR0ZOqSAzrlYg9ASE4uCDRJExhIEqGIMYuG7Et+MzcF5eH50100OWFNlOq5C/
	 E0YlO85+nuMRGjKEdJcJwnsb7NMQQx9Frh4+p01DTAmywnAFtUD0YwmDdDoefUM6S0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DlPx3Trw;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6307C606A683;
	Tue, 24 Nov 2026 19:50:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6307C606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DlPx3Trw
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA6B0497;
	Tue, 24 Nov 2026 11:49:56 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0AA433F763;
	Tue, 24 Nov 2026 11:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795549799; bh=hg/2DnWI8gLzOZWWZXz8Xss4EyuZZ/xSdaUsIAEYlfM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DlPx3Trwn1iTMVbnYyz6mM1lIeiMM4jHxEOV8dD8d0lCfio3OjH6AO00g3bOTQD0k
	 wD21GqXNXhBdtDqgiGkTyvMr04RCz0kABbNngGTnMQkRH1NG3yg5DhPP9I5dMwsV2I
	 s9YlzM6XovU6v5daRzOQbXvDmGNKc8h4rtq0fdAk=
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
Subject: [PATCH v17 01/34] firmware: arm_scmi: Harden iterators state parsing
Date: Tue, 24 Nov 2026 19:48:07 +0000
Message-ID: <20261124194841.1147072-2-cristian.marussi@arm.com>
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

Add checks in the core multi-part iterators support to detect generally
malformed and inconsistent multi-part replies.

Fixes: 36b6ea0fc6bc ("firmware: arm_scmi: Add iterators for multi-part commands")
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/driver.c    | 10 ++++++++++
 drivers/firmware/arm_scmi/protocols.h |  7 +++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 05092301db29..55d9cc487916 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1873,11 +1873,21 @@ static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *en
 		if (ret)
 			return ret;
 
+		if (i->t->rx.len < SCMI_MULTIPART_REPLY_MIN_SZ) {
+			dev_err(ph->dev, "Invalid multi-part reply.\n");
+			return -EINVAL;
+		}
+
 		st->rx_len = i->t->rx.len;
 		ret = iops->update_state(st, i->resp, i->priv);
 		if (ret)
 			return ret;
 
+		if (!st->num_returned && st->num_remaining) {
+			dev_err(ph->dev, "Inconsistent multi-part reply.\n");
+			return -EINVAL;
+		}
+
 		if (st->num_returned > st->max_resources - st->desc_index) {
 			dev_err(ph->dev,
 				"No. of resources can't exceed %d\n",
diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
index 8583159059e6..c15ec188291a 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -33,6 +33,13 @@
 
 #define MSG_SUPPORTS_FASTCHANNEL(x)	((x) & BIT(0))
 
+/*
+ * Common minimum size required by all the existing standard and vendor
+ * protocols to hold number of returned and remaining items in a multi-part
+ * reply.
+ */
+#define SCMI_MULTIPART_REPLY_MIN_SZ	(sizeof(u32))
+
 enum scmi_common_cmd {
 	PROTOCOL_VERSION = 0x0,
 	PROTOCOL_ATTRIBUTES = 0x1,
-- 
2.54.0

