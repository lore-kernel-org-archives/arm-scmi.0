Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 767C23D34A8;
	Fri,  3 Jul 2026 12:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783082198; cv=none; b=pbVwVQ17fx2abGWT5QWPJWW/F5WwwEhWPDn9OZkhl19dY+DbhM43qwbqyWj7D9vHHg6gxNSkLUWMkrLBu+dUJZ2eHiyTyCXeJK2/P3C8QvX9zF4YlcVubftiiAYFBtJBOoubjHMi3mIsbyGNSkGwbyem80KAoJ52b5gxM+c3OUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783082198; c=relaxed/simple;
	bh=LBRQ6wFBIx9uyX3JPutqMO45oA7CkE7M/GSDecI1/6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J6YeI8wrsXqi+3pGPcEuqz/yEa8aJ/+wVpLRB1TXcveTF4pMqRF3smH+xBen8cMlxaDmDvfYABFhrvPnoVvYyYUfmZ8LFYyWVzRm9Mz7OxBG80qX/IfzTpcvf6urRvZvD0C43WtTm4SY642Qj/Mn0ymnS6DqgoU+owBIxEtM32U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ksj6jRDD; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ksj6jRDD"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 730C8463F;
	Fri,  3 Jul 2026 05:36:32 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 77A063F905;
	Fri,  3 Jul 2026 05:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783082196; bh=LBRQ6wFBIx9uyX3JPutqMO45oA7CkE7M/GSDecI1/6g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ksj6jRDDy32orDxQXaNIZG9l3Ar6cKouJfKYyU+uGE2mHQRPuKRRgwuE3abMhbyLs
	 5RfzVjjEhL2DWiqWAhOEaVxqZGv01B1gT91aR8GEvmjMYp3AyJfi93otMw6NUAOlO1
	 8U8tdfLpx8/iAUXrSC+/H86Wf0pROV8nxNDQ7Ou8=
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
	jic23@kernel.org,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	brauner@kernel.org,
	david@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v5 02/23] firmware: arm_scmi: Reduce the scope of protocols mutex
Date: Fri,  3 Jul 2026 13:35:40 +0100
Message-ID: <20260703123601.381275-3-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703123601.381275-1-cristian.marussi@arm.com>
References: <20260703123601.381275-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the mutex dedicated to the protection of the list of registered
protocols is held during all the protocol initialization phase.

Such a wide locking region is not needed and causes problem when trying to
initialize notifications from within a protocol initialization routine.

Reduce the scope of the protocol mutex.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v1-->v2
 - Fixed improper mixed usage of cleanup and goto constructs
---
 drivers/firmware/arm_scmi/driver.c | 49 ++++++++++++++----------------
 1 file changed, 23 insertions(+), 26 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 8e06e40d1a11..b616b73df957 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2224,7 +2224,6 @@ static void scmi_protocol_version_initialize(struct device *dev,
  * all resources management is handled via a dedicated per-protocol devres
  * group.
  *
- * Context: Assumes to be called with @protocols_mtx already acquired.
  * Return: A reference to a freshly allocated and initialized protocol instance
  *	   or ERR_PTR on failure. On failure the @proto reference is at first
  *	   put using @scmi_protocol_put() before releasing all the devres group.
@@ -2270,8 +2269,10 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
 	if (ret)
 		goto clean;
 
-	ret = idr_alloc(&info->protocols, pi, proto->id, proto->id + 1,
-			GFP_KERNEL);
+	/* Finally register the initialized protocol */
+	mutex_lock(&info->protocols_mtx);
+	ret = idr_alloc(&info->protocols, pi, proto->id, proto->id + 1, GFP_KERNEL);
+	mutex_unlock(&info->protocols_mtx);
 	if (ret != proto->id)
 		goto clean;
 
@@ -2318,27 +2319,25 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
 static struct scmi_protocol_instance * __must_check
 scmi_get_protocol_instance(const struct scmi_handle *handle, u8 protocol_id)
 {
-	struct scmi_protocol_instance *pi;
 	struct scmi_info *info = handle_to_scmi_info(handle);
+	const struct scmi_protocol *proto;
 
-	mutex_lock(&info->protocols_mtx);
-	pi = idr_find(&info->protocols, protocol_id);
-
-	if (pi) {
-		refcount_inc(&pi->users);
-	} else {
-		const struct scmi_protocol *proto;
+	scoped_guard(mutex, &info->protocols_mtx) {
+		struct scmi_protocol_instance *pi;
 
-		/* Fails if protocol not registered on bus */
-		proto = scmi_protocol_get(protocol_id, &info->version);
-		if (proto)
-			pi = scmi_alloc_init_protocol_instance(info, proto);
-		else
-			pi = ERR_PTR(-EPROBE_DEFER);
+		pi = idr_find(&info->protocols, protocol_id);
+		if (pi) {
+			refcount_inc(&pi->users);
+			return pi;
+		}
 	}
-	mutex_unlock(&info->protocols_mtx);
 
-	return pi;
+	/* Fails if protocol not registered on bus */
+	proto = scmi_protocol_get(protocol_id, &info->version);
+	if (!proto)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	return scmi_alloc_init_protocol_instance(info, proto);
 }
 
 /**
@@ -2369,10 +2368,11 @@ void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id)
 	struct scmi_info *info = handle_to_scmi_info(handle);
 	struct scmi_protocol_instance *pi;
 
-	mutex_lock(&info->protocols_mtx);
-	pi = idr_find(&info->protocols, protocol_id);
-	if (WARN_ON(!pi))
-		goto out;
+	scoped_guard(mutex, &info->protocols_mtx) {
+		pi = idr_find(&info->protocols, protocol_id);
+		if (WARN_ON(!pi))
+			return;
+	}
 
 	if (refcount_dec_and_test(&pi->users)) {
 		void *gid = pi->gid;
@@ -2391,9 +2391,6 @@ void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id)
 		dev_dbg(handle->dev, "De-Initialized protocol: 0x%X\n",
 			protocol_id);
 	}
-
-out:
-	mutex_unlock(&info->protocols_mtx);
 }
 
 void scmi_setup_protocol_implemented(const struct scmi_protocol_handle *ph,
-- 
2.54.0

