Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795304622;
	b=X+NsPaF1yuddZn1nj90oqJImkoUpq9xSEGszDhEQrYw/b3ZVnyNWBMxpCjBO1xPeqPoL
	 TG9NsYfGOHwqBExgNjNT56fxOqdzKlR1kZPicSvcWTQm5/fp7LS2mYFzrh2naahRuJySi
	 ERnTUelDHyZUElbr+GCO4TEd/tlphn10y98hOC1V5DTSrgVPYXmZxdeIORwZ/jM7uqk4t
	 CADiNQyWJ2emvKqBxLdwlnLA0Xi6IO0HdP9oCxONPaaGYHZU5LOPBexq+RoXVcfAkE91Y
	 a4YKLMXbJSwUCC4cqOxzlCrB7gb5JV573oufRIAV18mMMKSs4QFcruBvyJKsjDpllVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795304622;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BzTXmv4/43QI+gEKg0wG102Avm+8UYVbizH4U07EQKk=;
	b=DnkNk59PD4RlAPuraqi2i0qFPsenTfAoebydudcufuFlzvAvOGgVtvfTIKDi1TFXGKHB
	 VmggVVEQdqlxIjT0cF30JU5bKC1jxBDEmpKrXxcxe8mW/Bj8hYiRwf161UyY823B9zl5p
	 MT33zrxgUf8gwjyDQijHue05x0rxQ32CjMU/rArG0KWEZuiorfgIr592XzEoqO/PlT0RH
	 FkWDjAQO+6vhgss0IlQc6xSvuhdIyAu/7+U2E+ai67HfU3Nh/FCf+l3kyHmJGXEfsNy1O
	 9oEUYXo9VfCPrkly79WILkPCIqB8P6Sn2ujDMXdPt/K0MopDWTPIxD0j6hkBJez0RkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=nb4bQAL1;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2164606A33A;
	Sat, 21 Nov 2026 23:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2164606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=nb4bQAL1
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F81C16F2;
	Sat, 21 Nov 2026 15:43:38 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 77F343F632;
	Sat, 21 Nov 2026 15:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795304621; bh=hp6B0902OkqPJqA8hd1E1Is4PsF85zVkd8lR/8dLC48=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nb4bQAL1k29nfg3Anw98wV7W1AVkPJyrUuwsrPMiYRs4frb3faHrB+LRfCWdm3M1L
	 U2zquT/U7Ir+hd18vwMpnRkGu5C52wG+FwrXfCZAiqpRxbLocnudQjn47dsuq/IPfd
	 XGs3UENUAmVrZxVRSzTLVLqNkAQQnUrzO76I76o8=
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
Subject: [PATCH v16 05/31] firmware: arm_scmi: Add new SCMIv4.0 error codes definitions
Date: Sat, 21 Nov 2026 23:39:39 +0000
Message-ID: <20261121234005.1525419-6-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261121234005.1525419-1-cristian.marussi@arm.com>
References: <20261121234005.1525419-1-cristian.marussi@arm.com>
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
 drivers/firmware/arm_scmi/errors.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/firmware/arm_scmi/errors.h b/drivers/firmware/arm_scmi/errors.h
index e1b265d5c148..707761cd8d34 100644
--- a/drivers/firmware/arm_scmi/errors.h
+++ b/drivers/firmware/arm_scmi/errors.h
@@ -23,6 +23,8 @@ enum scmi_error_codes {
 	SCMI_ERR_GENERIC = -8,	/* Generic Error */
 	SCMI_ERR_HARDWARE = -9,	/* Hardware Error */
 	SCMI_ERR_PROTOCOL = -10,/* Protocol Error */
+	SCMI_ERR_IN_USE = -11,  /* In Use Error */
+	SCMI_ERR_PARTIAL = -12, /* Partial Error */
 };
 
 static const int scmi_linux_errmap[] = {
@@ -38,6 +40,8 @@ static const int scmi_linux_errmap[] = {
 	-EIO,			/* SCMI_ERR_GENERIC */
 	-EREMOTEIO,		/* SCMI_ERR_HARDWARE */
 	-EPROTO,		/* SCMI_ERR_PROTOCOL */
+	-EBUSY,			/* SCMI_ERR_IN_USE */
+	-EBADMSG,		/* SCMI_ERR_PARTIAL */
 };
 
 static inline int scmi_to_linux_errno(int errno)
-- 
2.54.0

