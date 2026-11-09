Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215703;
	b=Uu0d3dFmFtHiAhBwb6iK3J3BOo8sSXd7PMVafSQ6IeFKgT3/Ff4oh6AcMzvnHJNpcjIp
	 FNhyF2NlGtOwNcu2CuzeNUpxmH/X33E/ouYVSN4qNI9i+XVhpIRv39GCNbop6SB3Fz/7e
	 8CECzH3dW53vz4MGOEb8XZ2+3BcipwcI9R4gWZ+HFYO6ZXY5q2C8HB9Vc9izYsxweqiXi
	 1ddcXJU7+rkrVPTmzq3Tu5vfhYE/df5rFpfStWqsi5grtF6orwOdf/Pzbc9bMk4LKP3qD
	 +6bARadPUUotvseS1gOcR/bTIiEXtOFgTqBSWvnGy6glSd7HIJrkyWgQ/2/smBr79cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215703;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=M2LC6HAA3z2TSFZOhUn96h+weHQAUKLv1SsC4JtJ+GY=;
	b=HhjfaeTDcBQbAWBzNErKjyr1C9TFrKs6NofT4tfFmo3aahQvuaxvY94uKRcJjORlH70P
	 V8wL3QpKU/Jm8QovmhsrPWovqkfzPFByFmiCfpQGh3rWx5J5SRFAS/9i5bXW9fKba2hWt
	 N4uWryV1jTwNjYdlWOY/iEh4SGYTWOYXAUWj0q49WyB1qZZi+PG6L/RJN1Ju/G/1h5ZSK
	 4OcWF75taLCNAR0cdkW1rgJdDb5jFXm2nDZLTy2smL+QDm8bl1NApC039p/rbFvTaJbp6
	 Ek38MlrxeGJBuQBSNkvsRVKkOwuOKMuOkj1Oellw0FaQ5daM/rMFuZqzpYljDeq/92w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Mpnybo0T;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 137E2606D80E;
	Mon,  9 Nov 2026 09:15:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 137E2606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Mpnybo0T
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F44614BF;
	Mon,  9 Nov 2026 01:14:59 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA4153F85F;
	Mon,  9 Nov 2026 01:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794215702; bh=0dlJbrNVf0Re02mDqutTlVfjnEu3p2Icr+k+yT4RG24=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mpnybo0T2xdGNKt8qgDl2HXeCHKaIpdvAcz8t+5agVx/cCZCjQJWFHUUZe1QiDBgo
	 0wdLMUnCaXJeneZhknRdwPvs6N+x4Hm3+lMVdkpoFPFUOzYO26s/Vpch7LjHREKhs+
	 BNHaY8M7YZMcmbReS2YTBNm2b/JBkTNAy5phR/ss=
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
Subject: [PATCH v15 02/35] firmware: arm_scmi: Add new SCMIv4.0 error codes definitions
Date: Mon,  9 Nov 2026 09:11:48 +0000
Message-ID: <20261109091221.2532706-3-cristian.marussi@arm.com>
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

SCMIv4.0 introduces a couple of new possible protocol error codes: add the
needed definitions and mappings to Linux error values.

Note that SCMI_PARTIAL_ERROR has to be handled specially and as such it
needs to be distinguishable but, as of now, all of the available sensible
error codes are already mapped to some other pre-existent SCMI error
condition, so we settled on -EBADMSG which is far from ideal, but at least
kind of captures the nature of the underlying issue.

Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
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
index af5b025ee072..e3390686fc58 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -49,6 +49,8 @@ enum scmi_error_codes {
 	SCMI_ERR_GENERIC = -8,	/* Generic Error */
 	SCMI_ERR_HARDWARE = -9,	/* Hardware Error */
 	SCMI_ERR_PROTOCOL = -10,/* Protocol Error */
+	SCMI_ERR_IN_USE = -11,  /* In Use Error */
+	SCMI_ERR_PARTIAL = -12, /* Partial Error */
 };
 
 static const int scmi_linux_errmap[] = {
@@ -64,6 +66,8 @@ static const int scmi_linux_errmap[] = {
 	-EIO,			/* SCMI_ERR_GENERIC */
 	-EREMOTEIO,		/* SCMI_ERR_HARDWARE */
 	-EPROTO,		/* SCMI_ERR_PROTOCOL */
+	-EBUSY,			/* SCMI_ERR_IN_USE */
+	-EBADMSG,		/* SCMI_ERR_PARTIAL */
 };
 
 static inline int scmi_to_linux_errno(int errno)
-- 
2.54.0

