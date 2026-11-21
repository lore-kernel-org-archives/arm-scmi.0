Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795304615;
	b=qXXy7KpOAAg9iTqUlbJ5UU09Vn3UALqNlOY94j3x4ufJMDckCKdcSgDZBxTXBYF4WYUY
	 CiMlNRp+y4er4TS5H08rwelH9VGsz9zwA5zqDdR/GTUYlvH0VJ/JITDQ4HRfk1oBoHk5D
	 VL7I12IwY56tV3RJsTqrTfFRGrS/GBf8+slaXD4VUR6k9FcKCVrkzXLocrhaCkdbkt7D9
	 BHgyTRIcIDIIe1WawXqOP5zi6jVGfw+Y5cKjx9c3qqa+NaTaMedo2LmbsGAq1JWnTtv87
	 UNl4Fbp4k/Tc+87A6acM7WXFSpKabZ5WGS8H05nb+xxOUcWIcCj3wbTGij/jgwGrFeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795304615;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vFT5X4VScYFosTBP0L3XnNtdE1oB9AcZg2PDRicv4pI=;
	b=G9j54vJL4Vo6ODW5pFRJASgT6WQ5vNUG6LrK3CCJDGd+YtGfNfGa5AxEP8E9/o/i06fs
	 2oWPEmUkVFgnPsyP334awKClbNXCNldOW6I8Ao933SNTfZec5cz09yiEx7ZdDMAEq0z3p
	 8q3ziCxYSGcq2jJzRW6CHzyDoK3iCdagtU6dFj3KBb/iHjoU8h0iWXL94BBhds7gNC46i
	 1On4oFBMF1poFeTW4s6yTHB9MoTPnQ63mnFdCajyPbSV/O6VMen4PAl+BFamyvlz1xzdv
	 /STP2DYgxH0mw37MUJqejwVRg0GwCRL0IYdZjqtIoKaCshms85PAMzk2OThBmq0AYSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=r+MPzQBx;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B8B6606A32C;
	Sat, 21 Nov 2026 23:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B8B6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=r+MPzQBx
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2653A16F2;
	Sat, 21 Nov 2026 15:43:32 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37C463F632;
	Sat, 21 Nov 2026 15:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795304615; bh=kCb2vXk43N6EA15KnutMEDFVvCutj0Y3CtplbWRuKk4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r+MPzQBxYByHNiQNM7X4BWA7zmfy1JTT+yMVYj3ANPNiyreXPh+pRpWdhwB/QfHR+
	 Dzw0tLny6hLDVgXMf9Gti6xMb3hYv+p0dB84JtsYjizZEDaTDEF7qkFUxan7Zs4AtX
	 G0T0OQx2NzP7lkKM8I9ma3lxaXfBnIiVi7LHFTD8=
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
Subject: [PATCH v16 03/31] firmware: arm_scmi: Add centralized detection of truncated replies
Date: Sat, 21 Nov 2026 23:39:37 +0000
Message-ID: <20261121234005.1525419-4-cristian.marussi@arm.com>
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

When an xfer is allocated with a very well known fixed reply size by
providing a non-zero rx_size parameter to xfer_get_init(), it becomes
possible to verify if the effectively received reply was truncated.

Add the logic to detect and report truncated replies.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/driver.c    | 12 ++++++++++++
 drivers/firmware/arm_scmi/protocols.h |  8 ++++++++
 drivers/firmware/arm_scmi/raw_mode.c  |  1 +
 3 files changed, 21 insertions(+)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index a9b0f704c39b..12c215d04d43 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1356,6 +1356,16 @@ static int scmi_wait_for_reply(struct device *dev, const struct scmi_desc *desc,
 		}
 	}
 
+	/* Check for truncated messages..it will be logged by the caller */
+	if (!ret && !xfer->hdr.status && xfer->expected_rx_len &&
+	    xfer->expected_rx_len != xfer->rx.len) {
+		dev_dbg(dev,
+			"Truncated reply - HDR:%08X  expected:%zd  received:%zd\n",
+			pack_scmi_header(&xfer->hdr), xfer->expected_rx_len,
+			xfer->rx.len);
+		xfer->hdr.status = SCMI_ERR_COMMS;
+	}
+
 	return ret;
 }
 
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

