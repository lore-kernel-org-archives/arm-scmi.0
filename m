Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47CA41441E;
	Sun,  4 Oct 2026 08:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791100940; cv=none; b=CfzuhiD9gdHiiS0Q6KO3YhW8VxqRfSDvu4tYs82P/NVTZglKEbCNWdwLjeblp/DLNPhK74YgdxJhIUQvERYLz2X4ePuDCe9WKDrkLrpcNFsJgBmJAgA6u9fJo6bawP8HFpdtxWXsOI1itz8kZsAmpAkhesUrRqTYU/NtrJn3wHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791100940; c=relaxed/simple;
	bh=GVrbwNGJZLdCsROdFRy3f5Gdjm35ZuHTncToLW92CxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dKkDcyBx6YoptgCDpC6oTuYfmQkWB5ZPyCp8pChSTHxJKlGDbovWQDB/5Gs8Q2Rwmd3TdU6pfuo9usewaurVLrxDtzhPD0ngZBUBZkZGUWXqhu8LsHdRivZh0ZBvT1rNbA2ZjLjEhL90CVBzes5ck5t7tTteQVE0XQCMLDkZfXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=vsp8D6eu; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="vsp8D6eu"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A7B91A00;
	Sun,  4 Oct 2026 01:02:08 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 82E6E3FA21;
	Sun,  4 Oct 2026 01:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791100931; bh=GVrbwNGJZLdCsROdFRy3f5Gdjm35ZuHTncToLW92CxQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vsp8D6euSoPe7ECzpHJ4Q7KOiZjpSindlqo94/LiuUa6CH0fRz5PUEg479GzeMSRw
	 pREaJsBb/IdSx+SDmu6cWAvb2NCEBFJ813pzw5JX1hnHHrdYa8YWFWBLnlD0Srjhyq
	 mmahUWER6fHnfZ/ZhfvpLrepa66W8FUDSAz/mXYs=
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
Subject: [PATCH v13 01/25] firmware: arm_scmi: Add new SCMIv4.0 error codes definitions
Date: Sun,  4 Oct 2026 09:00:42 +0100
Message-ID: <20261004080106.3355393-2-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261004080106.3355393-1-cristian.marussi@arm.com>
References: <20261004080106.3355393-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SCMIv4.0 introduces a couple of new possible protocol error codes: add the
needed definitions and mappings to Linux error values.

Note that SCMI_PARTIAL_ERROR has to be handled specially, so it needs to be
distinguishable.

Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v12 --> v13
 - use EBADMSG to map SCMI_PARTIAL_ERROR
v4 --> v5
 - map SCMI_ERR_IN_USE to EBUSY as natural
---
 drivers/firmware/arm_scmi/common.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index fe8c22cfb9f7..678258bc7a93 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -48,6 +48,8 @@ enum scmi_error_codes {
 	SCMI_ERR_GENERIC = -8,	/* Generic Error */
 	SCMI_ERR_HARDWARE = -9,	/* Hardware Error */
 	SCMI_ERR_PROTOCOL = -10,/* Protocol Error */
+	SCMI_ERR_IN_USE = -11,  /* In Use Error */
+	SCMI_ERR_PARTIAL = -12, /* Partial Error */
 };
 
 static const int scmi_linux_errmap[] = {
@@ -63,6 +65,8 @@ static const int scmi_linux_errmap[] = {
 	-EIO,			/* SCMI_ERR_GENERIC */
 	-EREMOTEIO,		/* SCMI_ERR_HARDWARE */
 	-EPROTO,		/* SCMI_ERR_PROTOCOL */
+	-EBUSY,			/* SCMI_ERR_IN_USE */
+	-EBADMSG,		/* SCMI_ERR_PARTIAL */
 };
 
 static inline int scmi_to_linux_errno(int errno)
-- 
2.54.0

