Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608363;
	b=PlSvs6XvZt5RVuLMxK7w6SA3+iooLGpMeYJL++QsD4p0tzi15t/05rouMsa/B8KKTtSp
	 YzOZluspKWspU46Le3IAn9yhsYMoX8dgRTEXu9XUQmeKH/dfG/Lz/EBLnvIIp4mPIz1Sn
	 0nk3J43fFJUIhf9Bgk0HDWZMwliUi6KNR+BtW4b+lJtgng6YJegPna8vd8HFkOrwDxxkg
	 lmiwynCZFKnW26YsYuiAKxD4R7zVd1dhisltIeQaZlv3jglLRDHd24dkDlq6cy9ISgnWb
	 oAFK/ZD20cFj0zYdQExUoro28BG6N46Yp7ww4ZkhLjnhHhqTmoBnwH8FjY9OqUOKOlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608363;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZDynG6CcpSC2Ch/JVHRB8aRUBh69R6Isda0zHKRpuR4=;
	b=h6KyWskkpP18Z6RmdPNtn2pYxOk7wYr/9+LcmO2QfRblsaia2uh+8O8YvYDdnEfgkhIJ
	 K9C9TD5IDNYl2hmNQesB/sEVzldV8+kprrSKRbQ0iSg9joh16BpUM4I4sYCakogxgWpty
	 rBl5Xa6Elt/+3EqZU+lnGPcgyj3cXeT0BAfxYho6nSR+iWsI9Ed6eJ8JB3WvOFwAMtMh2
	 vCXleAz+fUQzD93PmY2HAUlxldPcJ5GYfN10f6xn01TZdREJeBMBzXNqU66fYH7M6rLkf
	 ymLTeLQCeMdIRyWuIiqhAYqseg/wLPmcQ0YcjmrYuRyMlm26OWRGNOx/pJEWs82t+gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ek0Zm70Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF970606A33E
	for <arm-scmi@vger.kernel.org>; Wed, 25 Nov 2026 12:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ek0Zm70Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2BB81F000CA;
	Wed, 25 Nov 2026 12:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795608362;
	bh=ZDynG6CcpSC2Ch/JVHRB8aRUBh69R6Isda0zHKRpuR4=;
	h=From:To:Cc:Subject:Date;
	b=ek0Zm70YKo5H7ZGGQ6d4zECm1or6lVNKMSeFJ4ua+fjFJuT8VPCB0tc5yuuAxr472
	 HJJtf811IixnXf1W97P3xymqaqg7AWJC0/i1doXa1hl4mzRXbSCQhyyvwx96S/co+k
	 f+0JkCOswUro3IKOeQWujhjbTquRXNAbuxEjFVNUBRAPveO1XYEsyGSmkMy0zQYyqF
	 v+BVmkeWDOFpAZGp10SYtb8rrJIjPLwIjq43xgqGNbhlJxlWZUmyHhhSeAIrvUFD9x
	 w3Fudf50Nd6LTGjS21TQFbgh6DM3B5nGMol8ee24/xsvggROhoWtsdhBlQfxntKp+V
	 hLguZVbw0i/wA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [PATCH] firmware: arm: scmi: Skip ACPI protocols absent from _DSD
Date: Wed, 25 Nov 2026 12:05:52 +0000
Message-ID: <20261125120552.3196455-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
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

ACPI PCC setup iterates the list of known protocols even when firmware
omits a protocol's _DSD property. The missing dedicated channel is then
treated as a reason to reuse the BASE channel, allowing an undescribed
protocol device to be created.

Record successfully parsed protocol properties in the PCC map and add a
transport callback that reports their presence independently of dedicated
channel availability. Skip absent protocols during channel setup and
device creation, while retaining BASE-channel fallback for listed
protocols without an exclusive channel.

Fixes: 4f5f291a5704 ("firmware: arm_scmi: Initialise known ACPI protocol devices and channels")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm/scmi/common.h         |  3 +++
 drivers/firmware/arm/scmi/driver.c         |  6 ++++++
 drivers/firmware/arm/scmi/transports/pcc.c | 18 ++++++++++++++++++
 3 files changed, 27 insertions(+)

diff --git a/drivers/firmware/arm/scmi/common.h b/drivers/firmware/arm/scmi/common.h
index af5b025ee072..3b1386f289cb 100644
--- a/drivers/firmware/arm/scmi/common.h
+++ b/drivers/firmware/arm/scmi/common.h
@@ -193,6 +193,8 @@ struct scmi_chan_info {
 /**
  * struct scmi_transport_ops - Structure representing a SCMI transport ops
  *
+ * @protocol_available: Optional callback to check if firmware describes a
+ *                      protocol, independently of dedicated channel presence
  * @chan_available: Callback to check if channel is available or not
  * @chan_setup: Callback to allocate and setup a channel
  * @chan_free: Callback to free a channel
@@ -207,6 +209,7 @@ struct scmi_chan_info {
  * @poll_done: Callback to poll transfer status
  */
 struct scmi_transport_ops {
+	bool (*protocol_available)(struct fwnode_handle *fwnode, int prot_id);
 	bool (*chan_available)(struct fwnode_handle *fwnode, int prot_id,
 			       int idx);
 	int (*chan_setup)(struct scmi_chan_info *cinfo, struct device *dev,
diff --git a/drivers/firmware/arm/scmi/driver.c b/drivers/firmware/arm/scmi/driver.c
index b753a02f1358..a971f0a74929 100644
--- a/drivers/firmware/arm/scmi/driver.c
+++ b/drivers/firmware/arm/scmi/driver.c
@@ -2932,6 +2932,9 @@ static int scmi_channels_setup(struct scmi_info *info)
 
 			if (prot_id == SCMI_PROTOCOL_BASE)
 				continue;
+			if (info->desc->ops->protocol_available &&
+			    !info->desc->ops->protocol_available(fwnode, prot_id))
+				continue;
 
 			ret = scmi_txrx_setup(info, fwnode, prot_id);
 			if (ret)
@@ -3455,6 +3458,9 @@ static int scmi_probe(struct platform_device *pdev)
 
 			if (prot_id == SCMI_PROTOCOL_BASE)
 				continue;
+			if (info->desc->ops->protocol_available &&
+			    !info->desc->ops->protocol_available(dev_fwnode(dev), prot_id))
+				continue;
 
 			scmi_device_check_create(dev_fwnode(dev), prot_id,
 						 info, false);
diff --git a/drivers/firmware/arm/scmi/transports/pcc.c b/drivers/firmware/arm/scmi/transports/pcc.c
index 16bf3e3efcfc..47c6c48ede59 100644
--- a/drivers/firmware/arm/scmi/transports/pcc.c
+++ b/drivers/firmware/arm/scmi/transports/pcc.c
@@ -17,6 +17,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/bitmap.h>
 #include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -119,6 +120,7 @@ struct pcc_transport_map {
 	struct fwnode_handle *fwnode;
 	struct device *dev;
 	struct list_head node;
+	DECLARE_BITMAP(protocols, U8_MAX + 1);
 	DECLARE_HASHTABLE(table, ilog2(MAX_PCC_SUBSPACES / 8));
 };
 
@@ -447,6 +449,7 @@ static int acpi_scmi_parse_properties(struct pcc_transport_map *map,
 		if (ret)
 			return ret;
 		transport_found = true;
+		set_bit(SCMI_PROTOCOL_BASE, map->protocols);
 	}
 
 	if (!transport_found)
@@ -470,6 +473,7 @@ static int acpi_scmi_parse_properties(struct pcc_transport_map *map,
 		ret = acpi_scmi_dsd_parse_protocol_package(map, v, prot_id);
 		if (ret)
 			return ret;
+		set_bit(prot_id, map->protocols);
 	}
 
 	return 0;
@@ -672,6 +676,19 @@ pcc_chan_available(struct fwnode_handle *fwnode, int prot_id, int idx)
 	return pcc_get_ss_id(fwnode, prot_id, !idx, NULL) >= 0;
 }
 
+static bool pcc_protocol_available(struct fwnode_handle *fwnode, int prot_id)
+{
+	struct pcc_transport_map *map;
+
+	if (prot_id < 0 || prot_id > U8_MAX)
+		return false;
+
+	guard(mutex)(&pcc_transport_maps_lock);
+	map = pcc_transport_map_find(fwnode);
+
+	return map && test_bit(prot_id, map->protocols);
+}
+
 static void tx_prepare(struct mbox_client *cl, void *m)
 {
 	struct scmi_pcc *smbox = client_to_scmi_pcc(cl);
@@ -839,6 +856,7 @@ static void pcc_fetch_notification(struct scmi_chan_info *cinfo, size_t max_len,
 }
 
 static const struct scmi_transport_ops scmi_pcc_ops = {
+	.protocol_available = pcc_protocol_available,
 	.chan_available = pcc_chan_available,
 	.chan_setup = pcc_chan_setup,
 	.chan_free = pcc_chan_free,

base-commit: 99e55aac0f9cf3bbd9e1f839849997b877fd36f7
-- 
2.43.0
