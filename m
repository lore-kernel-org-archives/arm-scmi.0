Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215700;
	b=wAGjbx/uDOf/VZg8Lmn+Uh4FvdNbqbWlo9+hB76t0JEZ5m3RHi2c6RkUFMqkqAm3ZNpT
	 +6QIwT2oRQybpplfWNXI0bnTB+yQl3t+3X1l9S7iGQc5PyTvvZZNFgj52eAcHo3wnCxok
	 Yh47b3+qquBpQZImxb3MpxOe0h9lFwG4Si2+9F1laOnGy5Mo10Hbr6UJVc+efQu1ntSVD
	 9+X/2rH872892p1Xm2Zl55XgEClk1kU29zgmbYZuoIocy1vvAeloFGpJTV+TkYSKw+rr0
	 AQup4gNm2IPHFXj062bEOpgZOQ4zMnhggOARemPUWGC3CFb8wepZzl6E7FAhHvD8UZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215700;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7hFGzs8/EjS5J+ZEjXgE0CN5N4nDlz9StHFWpagMJ84=;
	b=i0Rh7mKD+aiIjLX8x05XUe5fgdk9JsXDAiAf+xFRptapxK03E7wPxWV8i3u9D3DdBp1f
	 5/ANs4cyV18VF/xbNDJvuADwPAHAKn9BC6HxSz+QOBHEW0lHOx0uh/C4GQcSvn06yt8Iz
	 5NmCe4A1LVAVJNGOKhVHB/Jkktj/5OwKJNKz26nkS7HhSV+nMt1eJVqu68iE5+6uqMANX
	 RW3PiIBoOund+ZM8dD2QaqAiIPWKmQuAg1B09jUewiuroReVLHX1rqyKbUYB58DLxmAA9
	 LqvKPv4Tjt8d+WVjgTEHvjvkxjwnYGhtTF7EeVErH3A3NEYT2BlrljN0qbmHmHgtGng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=B8GPbBGY;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB842606A335;
	Mon,  9 Nov 2026 09:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB842606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=B8GPbBGY
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6337A15A1;
	Mon,  9 Nov 2026 01:14:56 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8270C3F85F;
	Mon,  9 Nov 2026 01:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794215699; bh=tM023w741zmn+KvUuwcT5+Ut+cy8bbmEpDN3iWfwXsg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B8GPbBGYNt6s4hGdWxyRdCaZxZz7tRftP2NtYI10mCXuCkjLlko88wPUlv6YvarHB
	 o0kJR/VA5wDeWNCbcf3Irc5oPOukottJfuymIXuBiExHU/CyNgvG7LCNIW3PZfZlQ+
	 DCseAtUHi6Qc5e7SDNLaAD+P+6Cbp0y9qV4wRxHc=
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
Subject: [PATCH v15 01/35] firmware: arm_scmi: Harden iterators state parsing
Date: Mon,  9 Nov 2026 09:11:47 +0000
Message-ID: <20261109091221.2532706-2-cristian.marussi@arm.com>
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

Add checks in the core multi-part iterators support to detect generally
malformed and incosistent multi-part replies.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/driver.c    | 10 ++++++++++
 drivers/firmware/arm_scmi/protocols.h |  6 ++++++
 2 files changed, 16 insertions(+)

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
index 8583159059e6..b295006ef1fd 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -33,6 +33,12 @@
 
 #define MSG_SUPPORTS_FASTCHANNEL(x)	((x) & BIT(0))
 
+/*
+ * Common minimum size currently required by all the existing standard and
+ * vendor protocols.
+ */
+#define SCMI_MULTIPART_REPLY_MIN_SZ	(sizeof(u32))
+
 enum scmi_common_cmd {
 	PROTOCOL_VERSION = 0x0,
 	PROTOCOL_ATTRIBUTES = 0x1,
-- 
2.54.0

