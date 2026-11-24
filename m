Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549896;
	b=dwSzVoKNTknPvuCYTCkV3usUwtkrxO+KzMqlWxx0F9mRtF+PTCWC/cUaUUxe5Y98lTBf
	 PdY53iroM25bmVy3Z8GzCqJDUGLZpT0dlljZFJ3oSgSiWh6y5VEH0UCiMiX6vnGbV3ziz
	 Y8ubpGvCHCMgWiEUmIBDN8OC/kDg+iEcmRJXIwg/ePYxOjPlAybkEhpbyBTCy1dxU85Ez
	 ShlvoaCq5MpuEhVAUsP3gR/MWfWT28K6zyJjuIvrKzlpOcfS4cNkB/RzletXGb4AkDIan
	 jxSJSpxijiz2VlAywWPzZNHf7IMslMQ9SI0JKSe45hTxn1uERKn4l2ULxTmhpWQHFWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549896;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zHQArU5+8YrrsMC04rgV10DYKpSzcQP+GuriGqIefiY=;
	b=k2OKGHDUBzfMlDBjPk1ViLMoNmAt3nqORsGMIb+R5131EkPjM8WSanmNv4fLIUSzARWT
	 0l3TIiajZO6WOIWrjnSUQRrRMaErNp6bmoVJevV/7UOX9SOd4VJuv3nhOR3lZGhWo/eul
	 uA4BqpQbRFwLh6B6Y88L8ZrH9IBS+elnGkdH7766zTZJy0rJGc2CEChLMi1xim6qHlPm1
	 12KL3OrYiSsdM/vuRw2LFOuHXL/gm3m67H4X2mWFi3/hkm8xTF8ePJP/SIzWOp6y+W61m
	 I1vz3cWsfJJSHAOamRX0gpJj/AhXtQ74h4FSUbeMwFF1Od/0YKQb7pEfzwjkep9PN1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=sIotvm5o;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F6E606A321;
	Tue, 24 Nov 2026 19:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73F6E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=sIotvm5o
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB0A716F3;
	Tue, 24 Nov 2026 11:51:31 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6D4D3F763;
	Tue, 24 Nov 2026 11:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795549894; bh=UTTDVQsIfnDCYfh79QIOFkJU/xtZ/+rCNzuC10SDm8M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sIotvm5oSSxtLKKfKCabWLDl4V4OEO3FqeMhuVQpTvNDbgSNTX6bxsNZS1C3ZfJgO
	 iY0LHp1SlW9U0IeJdLhlBIr+sFcso8TymtoPCyL+/WNb32+nA3eNkPgSSf/bw3X6kT
	 uRiz2yTEyTA6rYm05tLuPMZQbk5NLLk4xpwLp5A0=
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
Subject: [PATCH v17 23/34] firmware: arm_scmi: Refactor protocol allocation
Date: Tue, 24 Nov 2026 19:48:29 +0000
Message-ID: <20261124194841.1147072-24-cristian.marussi@arm.com>
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

Simplify protocol initialization and finalization using cleanup handlers.
Relocate the protocol put operations out of the setup and cleanup code so
as to be executed strictly after the protocol devres groups have been
fully released.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/driver.c | 53 +++++++++++++-----------------
 1 file changed, 22 insertions(+), 31 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 123050335969..54d9780b7e87 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2306,24 +2306,21 @@ static void scmi_protocol_version_initialize(struct device *dev,
  *
  * Context: Assumes to be called with @protocols_mtx already acquired.
  * Return: A reference to a freshly allocated and initialized protocol instance
- *	   or ERR_PTR on failure. On failure the @proto reference is at first
- *	   put using @scmi_protocol_put() before releasing all the devres group.
+ *	   or ERR_PTR on failure.
  */
 static struct scmi_protocol_instance *
 scmi_alloc_init_protocol_instance(struct scmi_info *info,
 				  const struct scmi_protocol *proto)
 {
+	const struct scmi_handle *handle = &info->handle;
+	struct scmi_protocol_instance *pi;
 	int ret = -ENOMEM;
 	void *gid;
-	struct scmi_protocol_instance *pi;
-	const struct scmi_handle *handle = &info->handle;
 
 	/* Protocol specific devres group */
 	gid = devres_open_group(handle->dev, NULL, GFP_KERNEL);
-	if (!gid) {
-		scmi_protocol_put(proto);
-		goto out;
-	}
+	if (!gid)
+		return ERR_PTR(ret);
 
 	pi = devm_kzalloc_obj(handle->dev, *pi);
 	if (!pi)
@@ -2378,10 +2375,7 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
 	if (pi->proto->instance_deinit)
 		pi->proto->instance_deinit(&pi->ph);
 clean:
-	/* Take care to put the protocol module's owner before releasing all */
-	scmi_protocol_put(proto);
 	devres_release_group(handle->dev, gid);
-out:
 	return ERR_PTR(ret);
 }
 
@@ -2401,25 +2395,25 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
 static struct scmi_protocol_instance * __must_check
 scmi_get_protocol_instance(const struct scmi_handle *handle, u8 protocol_id)
 {
-	struct scmi_protocol_instance *pi;
 	struct scmi_info *info = handle_to_scmi_info(handle);
+	struct scmi_protocol_instance *pi;
+	const struct scmi_protocol *proto;
 
-	mutex_lock(&info->protocols_mtx);
+	guard(mutex)(&info->protocols_mtx);
 	pi = idr_find(&info->protocols, protocol_id);
-
 	if (pi) {
 		refcount_inc(&pi->users);
-	} else {
-		const struct scmi_protocol *proto;
-
-		/* Fails if protocol not registered on bus */
-		proto = scmi_protocol_get(protocol_id, &info->version);
-		if (proto)
-			pi = scmi_alloc_init_protocol_instance(info, proto);
-		else
-			pi = ERR_PTR(-EPROBE_DEFER);
+		return pi;
 	}
-	mutex_unlock(&info->protocols_mtx);
+
+	/* Fails if protocol not registered on bus */
+	proto = scmi_protocol_get(protocol_id, &info->version);
+	if (!proto)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	pi = scmi_alloc_init_protocol_instance(info, proto);
+	if (IS_ERR(pi))
+		scmi_protocol_put(proto);
 
 	return pi;
 }
@@ -2452,12 +2446,13 @@ void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id)
 	struct scmi_info *info = handle_to_scmi_info(handle);
 	struct scmi_protocol_instance *pi;
 
-	mutex_lock(&info->protocols_mtx);
+	guard(mutex)(&info->protocols_mtx);
 	pi = idr_find(&info->protocols, protocol_id);
 	if (WARN_ON(!pi))
-		goto out;
+		return;
 
 	if (refcount_dec_and_test(&pi->users)) {
+		const struct scmi_protocol *proto = pi->proto;
 		void *gid = pi->gid;
 
 		if (pi->proto->events)
@@ -2468,15 +2463,11 @@ void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id)
 
 		idr_remove(&info->protocols, protocol_id);
 
-		scmi_protocol_put(pi->proto);
-
 		devres_release_group(handle->dev, gid);
+		scmi_protocol_put(proto);
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

