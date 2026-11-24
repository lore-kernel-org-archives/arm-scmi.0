Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549822;
	b=ZXDxcal8AB+dsC8XoFW8I5bboeQMmS5vHvWmhHtHnBYEv9y4ctNtNy9DxSzFZJKLvtVu
	 yR/Qj87RZSZQYtHXnTEx+W7g9vRA67gdLkLYNPGsnjTv4+bKU328brTZlT+Lnc56suFVp
	 YsT8zGIcEO1Jk9/EWbhQPM9p2mUzlEKeDdOZ3L1rY8pME9JojHsODXZh0b9mrCE3PDDXa
	 Rr3npPHZV9T09TjZJXpMP4AlpHk6NcRrwgBlzdSL+KbqdujmCTJhGyrMhbm6l1NhoMKNj
	 FedTHAnB5JR5dsVRC5omNQkIlaEkeQMAcHt7/zZM0BJ5MIz1ryY0ZNsfSkhZX4HfFmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549822;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BzTXmv4/43QI+gEKg0wG102Avm+8UYVbizH4U07EQKk=;
	b=LtH/iZlt5aYpXwWAygZyEcaUgA0/fDEiCyG1rUEZs/9nHgS8q8VkNsmjMEi4RghDxOsd
	 OOh5xJ9Rb4qIKHrZWDJC5UrhmgLjo1PfXiz8c/drlrQmOSroqd8G8EbqIEwy5C1pemk3F
	 PYsKMSxMTH5KidRROSPPQ2UKXQsDSsL+FehHQBsC3pXbfR7JZzURFtZhG9klNf/nXdSZE
	 HC+zAhtv4r5gqptFfDDvHHbbhoaOGQoW6M3HYWyViY+SFZf5ChEFdJjMN4mWejcPlOBJE
	 d0LZA7yOy5qQOAW6P/tkrKENluivPUQnAmEZ20IGtY/p2zu4m70TTPNc1qaZWRXhRGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FDJ7fpJO;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F32E606A323;
	Tue, 24 Nov 2026 19:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F32E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FDJ7fpJO
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13340339;
	Tue, 24 Nov 2026 11:50:18 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1EE283F763;
	Tue, 24 Nov 2026 11:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795549820; bh=hp6B0902OkqPJqA8hd1E1Is4PsF85zVkd8lR/8dLC48=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FDJ7fpJOmbEY3LHWsD51xk1M/QddUDVd0745Ud4dZwBAd3XkrPvTEzsB9MFi4Zweq
	 PSdVu6P2R1AezcQI6o3rkVhkts/z4lioskJMfo8ecDt4trl5LJo9FHD+LETFuojzUl
	 saQCSrsR61/D8kaWtLlVeuNktEF2gZg97Wz8qpm0=
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
Subject: [PATCH v17 06/34] firmware: arm_scmi: Add new SCMIv4.0 error codes definitions
Date: Tue, 24 Nov 2026 19:48:12 +0000
Message-ID: <20261124194841.1147072-7-cristian.marussi@arm.com>
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

