Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549813;
	b=O/WCmdW5rmZKnYCune5fjH2+PIz5p2GCVHQPnjyG3jlkHVQjmNjXGQw239cAwdnN17KQ
	 6tzP2XsGAteuVNPOtoZWqlPLb+xF6nv6qxx12KENovijOOnGHA9vaE+gOIStPEykafK3x
	 CJ6gI0F3u5PH5Xj3hInGeh3hfy5oDi6gCnPN91gKzdl8lyCINd+jXMwi5+Os89N92JtxQ
	 1hPWC5m1MXr7fHCLXOmAI58J9Cac4PmnFf2OXMsonwsj/5xy5HAmMOGYDERRAfS3Rx1JF
	 y/6QCr4CM6Gmo66PnjXicCWqyX3ogaJ85V1Ra47mxCdN56l9fg0ETJ+mUp/IoBlmFLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549813;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jETPLRhF/JqpQhlLnqC1hF/PUwvT9Oj9eMPfu6mFc1E=;
	b=fOSlWEdG9vR9QyLNXuUuSdkdYDoZZBtFlhsSmaG+lugjBSLmkHmUROTgGgreyo21nC04
	 z7ZTdWnPRC278Bb8doz6rXKoWSFAqzE1iPpQ8kkxt2wBn64JDGLfVnjjc+rMVOYkhGXcx
	 xmmS5h02C3PQIcO6bQNanGIqWm+2ctN2GYKmiT0wKYL5+exBZofIurEWkr8jwMdBMtdUg
	 2EQkKKe/idpA61gkpDIRhKRR7m989wNzS3Z01HK/cFKwq4yaws6yqZzdCogE8TxWL5S1S
	 VGKOWL64Vf7U+4AA4zgmwlWtVfWVOh0SqIe1UVX3yfPAKCZC0h71Va22U7SBXdcSGfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=rP7AptOE;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D75606A31E;
	Tue, 24 Nov 2026 19:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40D75606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=rP7AptOE
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5FA5175A;
	Tue, 24 Nov 2026 11:50:09 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF6823F763;
	Tue, 24 Nov 2026 11:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795549812; bh=vhj8JCMkbElzFgACKyd9Z4oz+pirvspnP3YqYpUhPj4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rP7AptOEUa/VYTpMRua2eNI9nOgJDeUhekb/ksL+K/P+OBvpwWt7jnOAu0obaIZcm
	 nBkmv4XUaL+jJZTlb6t2XXl9yr1J2gQv+jCd8+yO9s1BC7SxE8VEibPuLHyQK+pdkl
	 ZC1/SEVDvqAiMhY3VPljMfcVVAwa0KtU3mqel60M=
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
Subject: [PATCH v17 04/34] firmware: arm_scmi: Add centralized detection of truncated replies
Date: Tue, 24 Nov 2026 19:48:10 +0000
Message-ID: <20261124194841.1147072-5-cristian.marussi@arm.com>
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

When an xfer is allocated with a very well known fixed reply size by
providing a non-zero rx_size parameter to xfer_get_init(), it becomes
possible to verify if the effectively received reply was truncated.

Add the logic to detect and report truncated replies.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v16 --> v17
 - use %zu
 - consider expected_size when reset_rx_to_max
---
 drivers/firmware/arm_scmi/driver.c    | 14 +++++++++++++-
 drivers/firmware/arm_scmi/protocols.h |  8 ++++++++
 drivers/firmware/arm_scmi/raw_mode.c  |  1 +
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 6dd249c08f5f..35adee6a7a15 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1356,6 +1356,16 @@ static int scmi_wait_for_reply(struct device *dev, const struct scmi_desc *desc,
 		}
 	}
 
+	/* Check for truncated messages..it will be logged by the caller */
+	if (!ret && !xfer->hdr.status && xfer->expected_rx_len &&
+	    xfer->expected_rx_len != xfer->rx.len) {
+		dev_dbg(dev,
+			"Truncated reply - HDR:%08X  expected:%zu  received:%zu\n",
+			pack_scmi_header(&xfer->hdr), xfer->expected_rx_len,
+			xfer->rx.len);
+		xfer->hdr.status = SCMI_ERR_COMMS;
+	}
+
 	return ret;
 }
 
@@ -1508,7 +1518,7 @@ static void reset_rx_to_maxsz(const struct scmi_protocol_handle *ph,
 	const struct scmi_protocol_instance *pi = ph_to_pi(ph);
 	struct scmi_info *info = handle_to_scmi_info(pi->handle);
 
-	xfer->rx.len = info->desc->max_msg_size;
+	xfer->rx.len = xfer->expected_rx_len ?: info->desc->max_msg_size;
 }
 
 /**
@@ -1616,6 +1626,8 @@ static int xfer_get_init(const struct scmi_protocol_handle *ph,
 
 	xfer->tx.len = tx_size;
 	xfer->rx.len = rx_size ? : info->desc->max_msg_size;
+	/* When a specific rx_size was specified, check for truncation */
+	xfer->expected_rx_len = rx_size ? : 0;
 	xfer->hdr.type = MSG_TYPE_COMMAND;
 	xfer->hdr.id = msg_id;
 	xfer->hdr.poll_completion = false;
diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
index c15ec188291a..50b89c56e309 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -106,6 +106,13 @@ struct scmi_msg_hdr {
  * @rx: Receive message, the buffer should be pre-allocated to store
  *	message. If request-ACK protocol is used, we can reuse the same
  *	buffer for the rx path as we use for the tx path.
+ * @expected_rx_len: The expected length of the payload in the reply, excluding
+ *		     the status field. When set to a non-zero value this is used
+ *		     to evaluate if a reply had been possibly truncated due to a
+ *		     misconfigured transport: it is only set to some meaningful
+ *		     non-zero value for replies having a very well known fixed
+ *		     size, definitely not for variable-sized xfers with an RX
+ *		     len initialized to max_msg_size.
  * @done: command message transmit completion event
  * @async_done: pointer to delayed response message received event completion,
  *		or NULL when no delayed response is expected. Protected by
@@ -139,6 +146,7 @@ struct scmi_xfer {
 	struct scmi_msg_hdr hdr;
 	struct scmi_msg tx;
 	struct scmi_msg rx;
+	size_t expected_rx_len;
 	struct completion done;
 	struct completion *async_done;
 	bool pending;
diff --git a/drivers/firmware/arm_scmi/raw_mode.c b/drivers/firmware/arm_scmi/raw_mode.c
index 7e42dd6cc2af..45206edff446 100644
--- a/drivers/firmware/arm_scmi/raw_mode.c
+++ b/drivers/firmware/arm_scmi/raw_mode.c
@@ -574,6 +574,7 @@ static int scmi_xfer_raw_get_init(struct scmi_raw_mode_info *raw, void *buf,
 	xfer->hdr.status = SCMI_SUCCESS;
 	xfer->tx.len = tx_size;
 	xfer->rx.len = raw->desc->max_msg_size;
+	xfer->expected_rx_len = 0;
 	/* Clear the whole TX buffer */
 	memset(xfer->tx.buf, 0x00, raw->desc->max_msg_size);
 	if (xfer->tx.len)
-- 
2.54.0

