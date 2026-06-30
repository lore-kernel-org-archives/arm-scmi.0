Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534AA37A498
	for <arm-scmi@vger.kernel.org>; Tue, 30 Jun 2026 09:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782810400; cv=none; b=HoEApk4Df54/YJPI/gM5SBWN/Ok3sDKWHCESB1SgmI0+4qv3XPGV4zXJjGCAQ1+z38bq3cuL7e8Z1WxwnnAzYZKZC/vgYRQii5Ww7DR0dTD7mLJ/41zOp/MWBULLlEjYE2W2leEXnVYkYqMAgUz/D03wPT7pHqyYSPQhkrRp2aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782810400; c=relaxed/simple;
	bh=CWpXj6W0XmOYedGt/bZf3XbK9P07dETIWaQFMqWyF2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QCcs1gYkM9eOBS2MiuHx2WzeCdAeIQ3XBixjaco5cODWTNziQTkKpQ0ixlqBtiE24qpjNEjcX+TQr1oO4kH32s/x6zUU342TVte8bj+YnZyxiK24g2aHDCaPAB4wVy1Ch1J2PDdXlpkv0Dd+bCmzIowTvZ7anrjIara5LcgSlvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NNpw9I+I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NNpw9I+I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 552271F000E9;
	Tue, 30 Jun 2026 09:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782810399;
	bh=YwHMq7p19d3jSouCHJ4j3qBlM/4kJJ+u5pW4Si9872U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NNpw9I+IpgyIaUQbk+igml7ADndDvf01cu8zzYVrXIUM5MuHsQkycbOMGrMX8klrV
	 rChgd8/xaZe5No4BzxhGev//jPuEbgLeM1lqs/1v3ZSIbfZWr4NDW3tiiswo7HezT9
	 DB2XoJI6dMREXxydB5LXV0to3BTgkcaylkKFO8MlPZhkpUzgOi1NDkD5u+4Ih0hhMq
	 x7Am4sWTT9avHKurboNZ3iUzj6aAIieN+7ItCwxQvUP0wsu79ZZP2u+5DsqJGPCVQW
	 XgqUGXya1DYisq17mfEn69ApcuJ/oysWJ5t0unL4AagTjgsnFhZjprGy9ll5isvFIr
	 EZ3zxSesFMcVw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 30 Jun 2026 10:05:58 +0100
Subject: [PATCH 2/9] firmware: arm_scmi: Fix transport device teardown
 lookup
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-scmi_core_fixes-v1-2-f932c1e51992@kernel.org>
References: <20260630-scmi_core_fixes-v1-0-f932c1e51992@kernel.org>
In-Reply-To: <20260630-scmi_core_fixes-v1-0-f932c1e51992@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, Sashiko <sashiko-bot@kernel.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.15.2

SCMI transport devices are deliberately excluded from normal SCMI bus
matching so protocol drivers cannot bind to the internal transport
children. However, scmi_device_destroy() uses the same protocol/name
lookup to find devices that must be unregistered during channel teardown.

Split the match helper so driver matching still skips transport devices,
while explicit child lookup can find them for teardown. Use a shared
transport-device name prefix macro for both matching and name generation.

Since transport-device names are derived from direction and protocol ID,
reject duplicate protocol channel setup before creating or finding a
transport device. This prevents malformed firmware with duplicate
protocol child nodes from reusing an existing transport device and then
destroying it when the duplicate IDR insertion fails.

Fixes: 9593804c44c2 ("firmware: arm_scmi: Exclude transport devices from bus matching")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/bus.c    | 22 +++++++++++++++++-----
 drivers/firmware/arm_scmi/common.h |  2 ++
 drivers/firmware/arm_scmi/driver.c |  5 ++++-
 3 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index f643a1f0e282..d4beefa4234f 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -201,21 +201,33 @@ scmi_protocol_table_unregister(const struct scmi_device_id *id_table)
 		scmi_protocol_device_unrequest(entry);
 }
 
-static int scmi_dev_match_by_id_table(struct scmi_device *scmi_dev,
-				      const struct scmi_device_id *id_table)
+static bool scmi_device_is_transport(const struct scmi_device *scmi_dev)
+{
+	return !strncmp(scmi_dev->name, SCMI_TRANSPORT_DEVNAME_PREFIX,
+			strlen(SCMI_TRANSPORT_DEVNAME_PREFIX));
+}
+
+static int __scmi_dev_match_by_id_table(struct scmi_device *scmi_dev,
+					const struct scmi_device_id *id_table,
+					bool skip_transport)
 {
 	if (!id_table || !id_table->name)
 		return 0;
 
-	/* Always skip transport devices from matching */
 	for (; id_table->protocol_id && id_table->name; id_table++)
 		if (id_table->protocol_id == scmi_dev->protocol_id &&
-		    strncmp(scmi_dev->name, "__scmi_transport_device", 23) &&
+		    !(skip_transport && scmi_device_is_transport(scmi_dev)) &&
 		    !strcmp(id_table->name, scmi_dev->name))
 			return 1;
 	return 0;
 }
 
+static int scmi_dev_match_by_id_table(struct scmi_device *scmi_dev,
+				      const struct scmi_device_id *id_table)
+{
+	return __scmi_dev_match_by_id_table(scmi_dev, id_table, true);
+}
+
 static int scmi_dev_match_id(struct scmi_device *scmi_dev,
 			     const struct scmi_driver *scmi_drv)
 {
@@ -235,7 +247,7 @@ static int scmi_match_by_id_table(struct device *dev, const void *data)
 	struct scmi_device *scmi_dev = to_scmi_dev(dev);
 	const struct scmi_device_id *id_table = data;
 
-	return scmi_dev_match_by_id_table(scmi_dev, id_table);
+	return __scmi_dev_match_by_id_table(scmi_dev, id_table, false);
 }
 
 static struct scmi_device *scmi_child_dev_find(struct device *parent,
diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index b9723c105fc1..fe8c22cfb9f7 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -34,6 +34,8 @@
 
 #define SCMI_SHMEM_MAX_PAYLOAD_SIZE	104
 
+#define SCMI_TRANSPORT_DEVNAME_PREFIX	"__scmi_transport_device"
+
 enum scmi_error_codes {
 	SCMI_SUCCESS = 0,	/* Success */
 	SCMI_ERR_SUPPORT = -1,	/* Not supported */
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index b9245238e293..b9ba566fc759 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2751,6 +2751,9 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 	idx = tx ? 0 : 1;
 	idr = tx ? &info->tx_idr : &info->rx_idr;
 
+	if (idr_find(idr, prot_id))
+		return -EEXIST;
+
 	if (!info->desc->ops->chan_available(of_node, idx)) {
 		cinfo = idr_find(idr, SCMI_PROTOCOL_BASE);
 		if (unlikely(!cinfo)) /* Possible only if platform has no Rx */
@@ -2768,7 +2771,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 	cinfo->no_completion_irq = info->desc->no_completion_irq;
 
 	/* Create a unique name for this transport device */
-	snprintf(name, 32, "__scmi_transport_device_%s_%02X",
+	snprintf(name, sizeof(name), SCMI_TRANSPORT_DEVNAME_PREFIX "_%s_%02X",
 		 idx ? "rx" : "tx", prot_id);
 	/* Create a uniquely named, dedicated transport device for this chan */
 	tdev = scmi_device_create(of_node, info->dev, prot_id, name);

-- 
2.43.0

