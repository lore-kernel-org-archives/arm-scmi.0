Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549912;
	b=HAa+F2fjrtAZ5vJcOEFuVkjo66JENW5PYudLE4FtwG+qEeLFLzirnmut7jyI9qhz3KLS
	 XaZHFIPwbyoiA3huCujgmR3mGbRxG0lvJyUEi2N77wpmn6POhAT1IgNHLWe5dG+sSD05z
	 g2dvbwY+3OdikWG18XPjxV2JSUlEeuWjjR17HMHHZUUhz9N34L1a0zWCJMEEjs3dyKI+Z
	 lZeLpMhz8YDkraK+UY+PCGYz33yYKSTiSl+uSgcI7Qc0cw40U4aaj+HIkeuToecZ316LA
	 JvJp5hUCoq0VT4/Na3kmTbgUa0InUpP8qN98+4WOvfDUhf65r/xc9Mp4zpmgRon05Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549912;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NFHmRHZDP4KZMqXoft3CdPRqj6bVtGZS5aMMlQV9Br4=;
	b=EgFwdrb0xYTuvJ5nkVDOHVs+lmpEv+P/dVVhvbOZZoDjTOKTDEBXyvhXtFSfPDoOZUXY
	 dFKjjUK3ECvZKGPhCjIlyeMAKODKHQ7EDX4tVrfQ7yU2v4pQX7s1b6ZkbdwHNlq7YkZoe
	 Yn/Fn4/AU8qvTtMBUiXNekR9qJbEG31XdCXwGmNzetokYAiGGKcB7Y+hXjesgWnr0sQyw
	 BVFARLppiCD6faAsTrvfNLn0dV9nl7KiYe1GVhlXmSETbAdtTQYDMHsoLoZf2oK71qFMo
	 /dnzTGwVxbh4aqG/JQUeO3tiex1uff1WSAY5TIRa/HIk0FIqnclE+DxiWpYg2ZQU2Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CVG1tZDt;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2599B606A31E;
	Tue, 24 Nov 2026 19:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2599B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CVG1tZDt
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96450339;
	Tue, 24 Nov 2026 11:51:48 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8951F3F763;
	Tue, 24 Nov 2026 11:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795549911; bh=ZSnmt7kYmnx1PZQYwxHBtza47Ju1Y7fhtcsUTObr3B0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CVG1tZDtdhxF6/aSWrbqJu4JjVzn1vAbYrRYtMl04/M+/iQdRJicfMyK/jwul9cyl
	 lfLpXqSOSVqITh1CMhPMhgFgU1tRvAdv+E3xh989GNQFuWvc+0oGqqW7FDE8Onmo7e
	 fdeFSlCSnDXLN2lW8f+p+FQYWkZJWvdw8pJo+Mug=
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
Subject: [PATCH v17 27/34] firmware: arm_scmi: Expose per-instance identifier
Date: Tue, 24 Nov 2026 19:48:33 +0000
Message-ID: <20261124194841.1147072-28-cristian.marussi@arm.com>
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

When multiple SCMI instances are configured, the SCMI stack probes and
it is initialized multiple times: one core stack for each defined instance.

Each istance is simply identified internally with a number and such number
is already exposed to the user to name the root of the per-instance debugfs
subtree, if enabled.

Expose such unique identifier to the SCMI drivers so that they can use
that same identifier when in need to name their per-instance resources.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v7 --> v8
 - fixed Doxygen 'non-negative' integer
---
 drivers/firmware/arm_scmi/driver.c | 1 +
 include/linux/scmi_protocol.h      | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 9dd7becb9b1b..4429144392b7 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3445,6 +3445,7 @@ static int scmi_probe(struct platform_device *pdev)
 	idr_init(&info->rx_idr);
 
 	handle = &info->handle;
+	handle->id = info->id;
 	handle->dev = info->dev;
 	handle->version = &info->version;
 	handle->devm_protocol_acquire = scmi_devm_protocol_acquire;
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index f0b091e6709f..ab2fdf55eb85 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -1081,6 +1081,10 @@ struct scmi_notify_ops {
 /**
  * struct scmi_handle - Handle returned to ARM SCMI clients for usage.
  *
+ * @id: A unique non-negative natural integer identifying the SCMI Instance
+ *	associated with this handle to be used across all drivers for
+ *	naming purposes: same identifier used internally as the root for
+ *	the debugfs per-instance tree.
  * @dev: pointer to the SCMI device
  * @version: pointer to the structure containing SCMI version information
  * @devm_protocol_acquire: devres managed method to get hold of a protocol,
@@ -1101,6 +1105,7 @@ struct scmi_notify_ops {
  * @notify_ops: pointer to set of notifications related operations
  */
 struct scmi_handle {
+	unsigned int id;
 	struct device *dev;
 	struct scmi_base_info *version;
 
-- 
2.54.0

