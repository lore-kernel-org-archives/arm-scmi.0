Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549809;
	b=gxzJt/titGbO9s3VMEqwxmzXAlGwmKBDbaRwn9AiFDhb5GaB6WFzzkkY/pgJv6hRrncZ
	 DhOeFrwh4HVx75CfHzNflCw/odx5TPI/Vef1Cf3CVRrDITRkeB+kCSBxN/pqYH9QZSe+2
	 A8Xhr5JdVRpzex/n1OIM/EE5RHxQvGtKVk6XMZmPkFJtEKX1dr/pzX+a3+9MLWGY9cL6j
	 ZXlP3Qhyb5Cap5BSBeRvf9kzkP3yUt9q0MeXmSiLRaqq09mK9G0wlZNFSAHTtOtOcKLTC
	 0w1MICYsFtkN7gw2cimSct44GcX/stqK8YPTsCKGoq9Lfa8uOQ8fRfqEkZQ1FZCCwww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549809;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yNyKWZOKL+pL6ans6rni0y3A9ZwAY/enEa6bOoRGTiY=;
	b=t4zFgAU2FE1WT3jr6p63/DM+OsUeAc8jHBLJZWOfcUpevwAk8KexebuTL9ffUAXRlYR1
	 wU2V0G0t9Y0zAXKBETmh4hLNEGSbn8m29bVsy3PCoY52zx/0+ENfnSGt07mLPmFBt/v8E
	 UkZ6fFwzDzlb/Ry4ImmSP4l/cEROLlUHcF4IjpN++sxyLqpz4QZYqYErwJnutFJWMgxJz
	 Mg+9bsV38e2AtikYjKwygTdbVRTYwTnOeg0zbsvFtaEesbRkCYuzm/ROmQjEYU6ap+FKB
	 59TNO/offMaJcDrlDuygfGPxz62uA1gv721UzS4z55dz6WojGpBCLStvo2wS9U3dWvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Li1HQ431;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BE97606A323;
	Tue, 24 Nov 2026 19:50:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BE97606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Li1HQ431
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D39116F8;
	Tue, 24 Nov 2026 11:50:05 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 653393F763;
	Tue, 24 Nov 2026 11:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795549808; bh=CHkShNmAafdRmkE3fj+tkXnVfpPqAB5vDKfdzNp4PA0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Li1HQ431u6djcBCNqeK4cnYE7nZopfvrxGyoZok43KxAzv0oAZHp+rXbw92S5PKym
	 +Osc6Jdt4Nfn6q8no18XoipZ6SVJJ1629hhEv8WQucPw98B03ZHdJWDJEDf6wzsSYl
	 8LMhcTx7xqmEoo4rBFYV2yaQpDrM9Im8LYkBcs/Y=
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
Subject: [PATCH v17 03/34] firmware: arm_scmi: Make Clock attributes size deterministic
Date: Tue, 24 Nov 2026 19:48:09 +0000
Message-ID: <20261124194841.1147072-4-cristian.marussi@arm.com>
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

SCMI Clock protocol CLOCK_ATTRIBUTES command varied in its reply payload
size together with the specification evolution.

Between Clock version 0x10000 and 0x20000 one trailing field was added.
The current implementation used the maximum possible payload size across
any protocol version as the rx_size paramenter passed to xfer_get_init:
such solution works fine but inhibits any possible centralized check on
the size of the received reply.

Size the requested reply strictly according to the expected protocol
version.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/clock.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index 6b5d50b35a48..ed93970c3b87 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -362,10 +362,14 @@ static int scmi_clock_attributes_get(const struct scmi_protocol_handle *ph,
 	u32 attributes;
 	struct scmi_xfer *t;
 	struct scmi_msg_resp_clock_attributes *attr;
+	size_t rx_size = sizeof(*attr);
 	struct scmi_clock_info *clk = CLOCK_INFO(cinfo, clk_id);
 
+	if (PROTOCOL_REV_MAJOR(ph->version) < 0x2)
+		rx_size -= sizeof(attr->clock_enable_latency);
+
 	ret = ph->xops->xfer_get_init(ph, CLOCK_ATTRIBUTES,
-				      sizeof(clk_id), sizeof(*attr), &t);
+				      sizeof(clk_id), rx_size, &t);
 	if (ret)
 		return ret;
 
@@ -1002,12 +1006,16 @@ scmi_clock_config_get(const struct scmi_protocol_handle *ph, u32 clk_id,
 	int ret;
 	struct scmi_xfer *t;
 	struct scmi_msg_resp_clock_attributes *resp;
+	size_t rx_size = sizeof(*resp);
 
 	if (!enabled)
 		return -EINVAL;
 
+	if (PROTOCOL_REV_MAJOR(ph->version) < 0x2)
+		rx_size -= sizeof(resp->clock_enable_latency);
+
 	ret = ph->xops->xfer_get_init(ph, CLOCK_ATTRIBUTES,
-				      sizeof(clk_id), sizeof(*resp), &t);
+				      sizeof(clk_id), rx_size, &t);
 	if (ret)
 		return ret;
 
-- 
2.54.0

