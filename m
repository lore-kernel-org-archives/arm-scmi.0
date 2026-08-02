Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BF013BBFC0;
	Sun,  2 Aug 2026 14:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785682646; cv=none; b=h/z1dA3HXL3CyWkz6XlcfjPITIwyfRdiNMt8kQomyvAlzIbJNhl6Yszi4Jxeg8Kzywg+Gi7+9Thmgdl0b3wHQxGHsB8Qt8UMt0l7KyeElTbpX1BQQYl0mfyrQfFp5sWnCivcTDQFY+jBU5ZA5qYg6xGPt9Kwy7ecodWnG1t/7Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785682646; c=relaxed/simple;
	bh=MvVBkOZSe0geStki8LTVG9QNqXX9D+MNvefmfwSOKOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gTvaDKBwcDLjk8Dh3y4yihHp9WenmL/rTQSX4fpEUi3NB3c3SK7mmI2iscf/WRM4tCf4zYPKa/YWEQbEaZzpE/YrYOQ01jsQcWPtW/It6N/PDzOE6qHS4eHl0NnXsW/h4EhOqIhngoQB1mL1X118F/VD7gMiX+8MQ0gefAS/7Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=o6kutoQ0; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="o6kutoQ0"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56CBF1476;
	Sun,  2 Aug 2026 07:57:19 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BAD0E3F632;
	Sun,  2 Aug 2026 07:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785682643; bh=MvVBkOZSe0geStki8LTVG9QNqXX9D+MNvefmfwSOKOI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o6kutoQ0bmbQXl0lobf4FNa0v6TE1258JTKjLfYR8ATdN8/mMA7hgqVCNKOenuOT3
	 XLb0T45HwAFLENA4KP8o6FKtLuFiFzHIsI1LwXD+4H+ZPKGxYrRtD2SpsajIKv05jV
	 G5sYbyW7f20XBvnkqEyPPw7wW1HwQioDIbXlD9B8=
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
	jic23@kernel.org,
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
Subject: [PATCH v7 01/23] firmware: arm_scmi: Add new SCMIv4.0 error codes definitions
Date: Sun,  2 Aug 2026 15:55:56 +0100
Message-ID: <20260802145618.1952804-2-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260802145618.1952804-1-cristian.marussi@arm.com>
References: <20260802145618.1952804-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SCMIv4.0 introduces a couple of new possible protocol error codes: add
the needed definitions and mappings to Linux error values.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v4 --> v5
 - map SCMI_ERR_IN_USE to EBUSY as natural
---
 drivers/firmware/arm_scmi/common.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index be0ed89b3524..767f08be416c 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -46,6 +46,8 @@ enum scmi_error_codes {
 	SCMI_ERR_GENERIC = -8,	/* Generic Error */
 	SCMI_ERR_HARDWARE = -9,	/* Hardware Error */
 	SCMI_ERR_PROTOCOL = -10,/* Protocol Error */
+	SCMI_ERR_IN_USE = -11,  /* In Use Error */
+	SCMI_ERR_PARTIAL = -12, /* Partial Error */
 };
 
 static const int scmi_linux_errmap[] = {
@@ -61,6 +63,8 @@ static const int scmi_linux_errmap[] = {
 	-EIO,			/* SCMI_ERR_GENERIC */
 	-EREMOTEIO,		/* SCMI_ERR_HARDWARE */
 	-EPROTO,		/* SCMI_ERR_PROTOCOL */
+	-EBUSY,			/* SCMI_ERR_IN_USE */
+	-EINVAL,		/* SCMI_ERR_PARTIAL */
 };
 
 static inline int scmi_to_linux_errno(int errno)
-- 
2.54.0

