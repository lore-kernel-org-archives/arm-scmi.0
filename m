Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0DAA3955FD;
	Sat, 15 Aug 2026 23:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786836403; cv=none; b=ftdA8JP9mLiXA/GlplCsWtJYrOlWLUxsfl1OSCWz6V2dYjRPEkDHrgEnNZqsfalbeGMr8TazCWJwp/qFIaAeg4R3dWDb47NAWlSbB38dOjh9vc9ntd+WT79y3AziJ7HirOfjVYk/sumsZT0YhKOg4sEreq6y5cvPEBkOXbjAee8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786836403; c=relaxed/simple;
	bh=bWQb7uwORFSY6GGme2jUY9rEAwIe/vwccDMcGQhyUF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dfn8EQwYUZumLy6r5Pef2ID6LM0hQ2Sgd6Dik4L34bSPyi8puM/pB22851waiR/7HLwG+chladsDHRzW4N520S/FqShOnoVwF+ZxxFMwNDCac6ICrSjAqwCFihTci3A5xxNFz0eLj1RIMydFFRAUgHJYJGVcAAtaErMeY3NhWV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iRt4hOSN; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iRt4hOSN"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21BFC1596;
	Sat, 15 Aug 2026 16:26:37 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B32403F673;
	Sat, 15 Aug 2026 16:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786836401; bh=bWQb7uwORFSY6GGme2jUY9rEAwIe/vwccDMcGQhyUF4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iRt4hOSN7B4mYmPtbMoDYSzjdiEE/0BtWGWDAHJyu/6NJr7B9PseWowUTg+JffO9E
	 82GBblUBwVVig7aC1XuOkzYfOTrc2rL5+Y4oROd2P4rXbNfBcIJMhXXz2K2f+VTsVA
	 BXI1K7CDU2ua0oJQiz4kzWNSEso28qEkGLEvtHN8=
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
	Cristian Marussi <cristian.marussi@arm.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [PATCH v10 01/24] firmware: arm_scmi: Add new SCMIv4.0 error codes definitions
Date: Sun, 16 Aug 2026 00:25:41 +0100
Message-ID: <20260815232604.3730754-2-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260815232604.3730754-1-cristian.marussi@arm.com>
References: <20260815232604.3730754-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SCMIv4.0 introduces a couple of new possible protocol error codes: add
the needed definitions and mappings to Linux error values.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v4 --> v5
 - map SCMI_ERR_IN_USE to EBUSY as natural
---
 drivers/firmware/arm_scmi/common.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index b9723c105fc1..d9db4a4d17dc 100644
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

