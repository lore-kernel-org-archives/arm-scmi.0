Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215784;
	b=jfnfhtcBbiBBPiFcOJhcDmxMt8vMFfdyw77Kb9Cjya40yxuzIVLUKS2BbQx6lB2ymrKb
	 GA2R4eNSytGy6sG3DoMPbA+LavcnJ5rwU92Jy49qKQSm8MSfxHQNO7mvrwB5VwbmRPsVK
	 vATVUDHUfViOspYHdArS7DDnMRui9Gleki2iVSXHdvesbAaH7mtYCmfGco57yKmxMWTpD
	 wXcxUqIuWvdnox9RuImoqdyeb6LIUdIkwzmYhz2+VB4vwQMIEDZzWoFyRYd1F0nu9f0g4
	 7YjAU//Ixm7kYt/lsPZkmUYy0T3yjgx2bq/iJut8hlw6igEVzVzkzQfe8hJUzHcpb0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215784;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gwmVsT6d+s3J8UMWsgOxymVjfIHMLolJGT/dAoN7VJM=;
	b=QvIdSl9BvpeGW406AhPItCdMOm56e6jamG1pzWTPnkiLjcQTGAleF9fI5i8aYuyvLtqm
	 NWJfgOiLTSwKpo93+KIBvM6zGdYRAy/BjY0HIxAhHm4trdNM+xGs9fglpcjN6W0Ek8dPU
	 385AWMFzMYIHOXx9DMFYcyTvQHA6JVy6vvMGC03jUOvlThrgNrNqWn5K7iN6ZXPL+KCxt
	 nnhfUYuro021UKhdxilBh23qip7T9mmi+FuxfjTelyGX5YkzVefu22g1fg+Aov1iDgdJI
	 WfltftyhcSefxwF0AxxmqsR1hxwdyKK70gosGdN8oTCH3MQjhFZW4OapR3y7IR9XM7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YXYpwLXP;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F9C60A382E;
	Mon,  9 Nov 2026 09:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2F9C60A382E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YXYpwLXP
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 557B614BF;
	Mon,  9 Nov 2026 01:16:20 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F4BF3F85F;
	Mon,  9 Nov 2026 01:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794215783; bh=UDN+6/6nfh9N9nunu9RXX3MZNyhWSWo4Ujj1piGZyZw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YXYpwLXPv3MGnoexxp2/NyvIDUhIEMrlnEYAQPg8ybwQaQ8FbXcGr03vpNjTRb/0N
	 4ucpXnnc3oL42fJuDIBqKIY/ehSZYcm1H8ARXwUogshoxUQVVb+VjqDKe1BzJhqIdl
	 qq2/KXoXm/94nDL821JpV32j846X+ELznfTp0DbQ=
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
Subject: [PATCH v15 27/35] firmware: arm_scmi: Expose per-instance identifier
Date: Mon,  9 Nov 2026 09:12:13 +0000
Message-ID: <20261109091221.2532706-28-cristian.marussi@arm.com>
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
index 8a4664165a64..015dc8473161 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3483,6 +3483,7 @@ static int scmi_probe(struct platform_device *pdev)
 	idr_init(&info->rx_idr);
 
 	handle = &info->handle;
+	handle->id = info->id;
 	handle->dev = info->dev;
 	handle->version = &info->version;
 	handle->devm_protocol_acquire = scmi_devm_protocol_acquire;
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index ed3eaa1482a3..4fa32d629e7a 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -1133,6 +1133,10 @@ struct scmi_notify_ops {
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
@@ -1153,6 +1157,7 @@ struct scmi_notify_ops {
  * @notify_ops: pointer to set of notifications related operations
  */
 struct scmi_handle {
+	unsigned int id;
 	struct device *dev;
 	struct scmi_base_info *version;
 
-- 
2.54.0

