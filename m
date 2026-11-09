Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215710;
	b=xNz97Lwh23xAEg/kPG0DZe2rEz6a42J7oTl8cJHViEbkIyy8tKJwxCFlpucuj0oSL46i
	 ytrFtDOLSe5EnXgXVMiYj3xf4Vu2w2vWhkANTy78p35GnsOsgboQei2dNicwdHJXdglPm
	 r8EMwoGJ4XD95nCg4/8+/wIl9pVRKwVGgVH8I2PJQUdvqLgKo8WbR3ZtSZeMKCQThutZj
	 8BuzjIWh9UKU5B3U/OsRmqkaE8/bylnFG2Vx8hFY6uJz6sOkxU9974pOSDtJ3vHMPFNE0
	 56CAmNLK9cQ6asLyTYJFS2jyO6uoXPzU1SYR2fxyLDapHyw+JT3JqBBR+kCK3kh0AYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215710;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h/z+X7iEkKV49oF6OxaGD6WKtFLpZqWt61lF6Ja+o6Q=;
	b=xifPygkt6rSkKdX6ycxLCJr/VLEhas7Rwzsgo07M694crF9OJKnPqmPY6BRycpXIalYX
	 bFaJRPsPMWn/OYT3zbdeK9WavVSK2apFEnpmtHS4vB5NariieMTUgvBhaTiJFcvtY4tec
	 TWs7EYWQg6Dj6ewMwgLxCePO0eZXJPEZrNFEHY62pk8Vthrw6tZMnTCQIZNuZcCn0/QO0
	 MZGyA1y+rBLxK+q5bi+iiTfsGV+j5aNS3gLNSkpVJxy9FETl3Fb3pYbZN+BrUgCa1wIG7
	 hwouZp/D7i08gD6S9Zf3KOl/BhUIAY3Ce48rQoKmU3t6LRoK1Dpl1cGsaawrG9sMGNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=VqRlz+lA;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80708606D809;
	Mon,  9 Nov 2026 09:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80708606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=VqRlz+lA
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD5FF14BF;
	Mon,  9 Nov 2026 01:15:05 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 05EBF3F85F;
	Mon,  9 Nov 2026 01:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794215708; bh=h7QGUUz5MSwC7hcc9IF0u/AdaY1xHifslTurPKhU3wE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VqRlz+lA/3GES/nPPFBj9cLsfnLf+Tjc+ADdXHyKprOzoiAM4K0e3gy77artmOhMa
	 A82OW/8z+V2b51q5tApJXTifcifA2Jf4J4fcmihAAEUi1ptB6dQAWfzgH/ij5tDapF
	 fOopE0NUhxUnu0aRZGIaudKqHFPSWgK/n3Ycpwxo=
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
Subject: [PATCH v15 04/35] firmware: arm_scmi: Allow registration of unknown-size events/reports
Date: Mon,  9 Nov 2026 09:11:50 +0000
Message-ID: <20261109091221.2532706-5-cristian.marussi@arm.com>
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

Allow protocols to register events with build-time unknown sizes: such
events can be declared zero-sized and let the core SCMI stack perform the
needed safe-net boundary checks based on the configured transport size.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v14 --> v15
 - better commenting
v12 --> v13
 - improve variable naming
v10 --> v11
 - account for ktime_t field when checking boundary
v2 --> v3
 - split out of previous patch on protocol notifier
 - use max() instead of max_t()
---
 drivers/firmware/arm_scmi/notify.c | 28 +++++++++++++++++++++++-----
 drivers/firmware/arm_scmi/notify.h |  8 ++++++--
 2 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
index bc046f2f83a6..a30589c9b377 100644
--- a/drivers/firmware/arm_scmi/notify.c
+++ b/drivers/firmware/arm_scmi/notify.c
@@ -595,7 +595,16 @@ int scmi_notify(const struct scmi_handle *handle, u8 proto_id, u8 evt_id,
 	if (!r_evt)
 		return -EINVAL;
 
-	if (len > r_evt->evt->max_payld_sz) {
+	/*
+	 * Events with a zero max_payld_sz are sized to be of the maximum
+	 * size allowed by the transport: no need to be size-checked here
+	 * since the transport layer would have already dropped such
+	 * over-sized messages.
+	 * Note that, though, while this protects from buffer overruns, it is
+	 * no more possible at this layer of the stack to detect zero-sized
+	 * events corrupted by truncation.
+	 */
+	if (r_evt->evt->max_payld_sz && len > r_evt->evt->max_payld_sz) {
 		dev_err(handle->dev, "discard badly sized message\n");
 		return -EINVAL;
 	}
@@ -751,7 +760,7 @@ int scmi_register_protocol_events(const struct scmi_handle *handle, u8 proto_id,
 				  const struct scmi_protocol_handle *ph,
 				  const struct scmi_protocol_events *ee)
 {
-	int i;
+	int i, max_msg_sz, default_report_sz;
 	unsigned int num_sources;
 	size_t payld_sz = 0;
 	struct scmi_registered_events_desc *pd;
@@ -766,6 +775,9 @@ int scmi_register_protocol_events(const struct scmi_handle *handle, u8 proto_id,
 	if (!ni)
 		return -ENOMEM;
 
+	max_msg_sz = ph->hops->get_max_msg_size(ph);
+	default_report_sz = max_msg_sz + sizeof(ktime_t);
+
 	/* num_sources cannot be <= 0 */
 	if (ee->num_sources) {
 		num_sources = ee->num_sources;
@@ -778,8 +790,13 @@ int scmi_register_protocol_events(const struct scmi_handle *handle, u8 proto_id,
 	}
 
 	evt = ee->evts;
-	for (i = 0; i < ee->num_events; i++)
-		payld_sz = max_t(size_t, payld_sz, evt[i].max_payld_sz);
+	for (i = 0; i < ee->num_events; i++) {
+		if (evt[i].max_payld_sz == 0) {
+			payld_sz = max_msg_sz;
+			break;
+		}
+		payld_sz = max(payld_sz, evt[i].max_payld_sz);
+	}
 	payld_sz += sizeof(struct scmi_event_header);
 
 	pd = scmi_allocate_registered_events_desc(ni, proto_id, ee->queue_sz,
@@ -805,7 +822,8 @@ int scmi_register_protocol_events(const struct scmi_handle *handle, u8 proto_id,
 		mutex_init(&r_evt->sources_mtx);
 
 		r_evt->report = devm_kzalloc(ni->handle->dev,
-					     evt->max_report_sz, GFP_KERNEL);
+					     evt->max_report_sz ?: default_report_sz,
+					     GFP_KERNEL);
 		if (!r_evt->report)
 			return -ENOMEM;
 
diff --git a/drivers/firmware/arm_scmi/notify.h b/drivers/firmware/arm_scmi/notify.h
index f18f98c5ab3b..ff4044fd7448 100644
--- a/drivers/firmware/arm_scmi/notify.h
+++ b/drivers/firmware/arm_scmi/notify.h
@@ -18,8 +18,12 @@
 /**
  * struct scmi_event  - Describes an event to be supported
  * @id: Event ID
- * @max_payld_sz: Max possible size for the payload of a notification message
- * @max_report_sz: Max possible size for the report of a notification message
+ * @max_payld_sz: Max possible size for the payload of a notification message.
+ *		  Set to zero to use the maximum message size allowed by the
+ *		  transport.
+ * @max_report_sz: Max possible size for the report of a notification message.
+ *		   Set to zero to use the maximum message size allowed by the
+ *		   transport plus the additional ktime_t timestamp.
  *
  * Each SCMI protocol, during its initialization phase, can describe the events
  * it wishes to support in a few struct scmi_event and pass them to the core
-- 
2.54.0

