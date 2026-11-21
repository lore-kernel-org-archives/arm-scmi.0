Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795304609;
	b=YkvGzzDSC5+BEAR9Mh0mbaUG2wg76dtAQ6bsIOr5LpQIIBeGgLe6ku+qOcoVYT6e1oIQ
	 B4eNNHY31d4orrEahBXPSPKmoIFYskY0eH2uGL0lT20wXj9ZugOo/K+/WVap1jLWeMy74
	 EIFrzmClqKhpoAUuiOzlmwmg0LbKijgigx//vmPvDbQXEacQ2ZvmFVmYHyBSHMY4tzkzV
	 ydAYdArZzVmr6+Hipd9xe1rYuFkH/ky/iJE/Ryl3rAm5iM2rw4zSb0J1aD8lRNqeWZQhV
	 6iZyMx7qOTNade+r4AhWLW+aIC6/4Y/sax+hL/KThsZdvFCKqbXp7mUNPqeP8+zzwVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795304609;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vtM2MEBmduOcZZltNQ7NOe1dSUbwO9go+8cdTtGYRPE=;
	b=HPhNDeBsDbxuLjXMEav2E+uVIf/WQeEbgZwm7bpMp8XJs/Y5UFTHXbw7QcyEeaA/+5o8
	 bViE07nvkCPk9rWsY7XVY8rJaQ72dnDg9b5sg9DWOo/mbSDJlFkJNJLG28ATomKTiO108
	 sEo76dtyNS3CMMVZQU5Qi+tpGm8xrRfZoCOl1FjMkL9Z6zk5qZNHd+3YbquKpMQDkRwMG
	 si7hABFt7qEZnMZT8w+51IU+v29OmxOa7Kaq0Oj3CrrCajZeNZIgasjOpFgjlgDOUJfa8
	 r173XrHkbs//4cEqO/M6gbNcWMnSvtt2joNAvJftrojvwg6IRnL2jIul1GVBakLsWUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="khB94L+/";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76FAF606A332;
	Sat, 21 Nov 2026 23:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76FAF606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=khB94L+/
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D59F616F2;
	Sat, 21 Nov 2026 15:43:25 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E1AF93F632;
	Sat, 21 Nov 2026 15:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795304608; bh=hg/2DnWI8gLzOZWWZXz8Xss4EyuZZ/xSdaUsIAEYlfM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=khB94L+/wrwZF+A06ZEvugtQ+fZpCE6NF/neZq7rZW2XV4NVCIsGL8HqAUmktn3HV
	 u82wcho8LUZ+Ymasrx8aH4qJEweFK2N0NRjo64vZfB82IM3ercnvYJnZ0EIVwEHXZx
	 MwZXyasKnAyXBT/O3D7m7LO4Od5QqisVxO5aa8Is=
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
Subject: [PATCH v16 01/31] firmware: arm_scmi: Harden iterators state parsing
Date: Sat, 21 Nov 2026 23:39:35 +0000
Message-ID: <20261121234005.1525419-2-cristian.marussi@arm.com>
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

