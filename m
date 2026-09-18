Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48ACB3AC0C0
	for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 09:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723799; cv=none; b=R1ucDyAjEY8K++XGYufdWW20vKIpwzqIFJoU/+4ZqqwzH6eTmvC1E4jqFzq3idc00WW0NeeRgF1diM9QsaoPwvqF7tchgGWhVfQuTw5FtQs87IvYAPtJCQg6Nb/MdwVgksvtqanmeh3F/76I2YLJc2bZL2JhwezRY57R+72xWAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723799; c=relaxed/simple;
	bh=bPctaCY2lwvRS0ccVaNiV0/ZxyVwkbmIvtGE9g73VEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L2x8PHHuhdt1emam4UOplQBNwTTjC92BW2/XmqFPpU60QLjAdzB+P3kBUPRbSxL7cBhMQroFcGGlOBuM3WNoT37DxYnY0QrFDl64Ct3QFf06gmGMP9JtK4hE7N8JFPuGidqQeuJGqLELMrqmaXFWHYMLohHZK5JBTDSXUU2HY+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O35s5EVq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H6w0yZkI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O35s5EVq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H6w0yZkI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I5xxBY2660290
	for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 09:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mB/Kwt5G75P
	b96JFouwgftk6m3eSdzzkBsNoPsbIj7o=; b=O35s5EVqUWiIypavIRUAflhtRSn
	hGGlaZa8U4/IMhrZJ3aIQdD/hq8GzK5PVjsUfrHE+cp63bnDsmCJg5pFrew+tSe9
	JwR42dFiE5wRh1/5DJWiMpeWhCWivkJJUgfjhg6wvEKsH5sIIRWTjEsy15GgZ+39
	R0j622vUz7aAa2LgDEWKqKXNUZ3CUgEin8Ad00YSJFzCkwqGbgzne+ia8zzyfKdm
	nFvO3xJT7j8QixjJtWcoa4uuoBxwekuUyUHPvRqyxZjjhLSZ5N9hyS5iavHhqWCv
	PLYJIWZa0fP3OGZdUmozR4LDqUhP/DgwKRO+2h+/rQgqK7CZO4xhY94Z98g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grjttv691-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 09:29:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so99437685a.0
        for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 02:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789723795; x=1790328595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mB/Kwt5G75Pb96JFouwgftk6m3eSdzzkBsNoPsbIj7o=;
        b=H6w0yZkIbQsXtGSdeS7ESJRkq1sFUknd/k7TmigvM4ZL2Zsf8GoNVnhY9lnfpcmXQa
         BccfUIHeKbmrjZgL+gT9BlCXIDhTZfy/qxFAEOMZyh2Ub17KuYWRHKsY5U9NTj9SLujj
         xwZKosNIpwV22SbCbnD8mLk/YV235RqMJkQfu6igm0XyO/c2/MtpgGmLJhXKp04igiZT
         F4AKRnylWuqfkiROTId67aXzrzk5kyoHoocpmG+ZUn3i+mZRhN8GByFJQH4oxTlfRUJO
         zeQiaECa8qab/RvkqO3HI7vPLOeJOFblGISIi7V9TiPRnQdchqT479rByvfHr6YMj1zo
         TGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723795; x=1790328595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mB/Kwt5G75Pb96JFouwgftk6m3eSdzzkBsNoPsbIj7o=;
        b=UNtiCj+G9EVLmJ+JLkmgmy4VfdncNGq5m3R0+bqpuFDXVAoS4SkvDKrqR+JDSEDqco
         DPjBdK5FvhklsB2VnJeSVhErnO0mPqPsnFgA2CJ6uGPE3+zS/9rniIGP/cN2MNSQBHD5
         DDABu4Yqqa7PbZFaFLtEuPhdhfwJjZsuT02FBCqwXB+YNkoPm4O7/4yczqZ60LmjnbuZ
         lD4N6789tnYMcnUrNWYTJGeLHN8eO7WXmzpEbWxJkMZWlgg7qderaY9c7r/zQufyUMO9
         PyBF+J5FCWOvK/jVp3CkfjUALYASUPIkerptnI6p07KJ9keF2W3XO/sHeirAhJEjAqsE
         azHw==
X-Forwarded-Encrypted: i=1; AKwUvBySmx2Ptcas7LL8diWFjru3oh3Vrx8Ftcu/M2Xn3FfeClC4azRV/K2kxUcAUgGA9nJHYbTi+6q9Eg==@vger.kernel.org
X-Gm-Message-State: AFuF++lDK2kIPZqwPiySDS3KHRIhpueMzUwRq9iJTFoaqd85KG9gCMHO
	6Q7NiAjEKp3PBVYcmF5RWSXNgUHqLqCVBl65Qw+Lz994jx3iDVFRA0C4XRL35N35e75b2SmrpHc
	SjXIida8Otbr/IiY5/YVVRZsiot2XqkryEkE0hhHrToCComNc3YiiVVFZobzb3g==
X-Gm-Gg: AYBFou3ILluPPKFkwl29uCBA0nW8nVzPACshQOQ10RHyek/bV8yRSfo59dbUfohK9eV
	LN+yR1rt4OEaGqrOLLvD5c1HY6B4mf9HflcSCGNEZuaz73QJSb1ry2+HVpXJVeElJw6k0acwLB8
	TPlB/V0jK6gNGXAt5NOC21/+9yGGJbJpa9lmH/lM21z05dyUjfRKCQovXD/ihMO1UjtunFaRCl9
	vRO6/hGpE9PoBtGkZiKOvEojR42FXX0vMt83QtGknSO0BY7XEfjL+1CEHfmUyx0BCD3Z/dHX90y
	fdD4YlFm2X0wpLsKLxkGk17bLi52p6kFlxAuXKFJOAAYy36MyHHngod57uKeug0Dh69Dw3JEvUw
	KGlc/1NlSJSWhpx3hNhYDR1Y9aw0wKJbAdturhxJxWZcvrFLfWf9lLtPpmz3Y/G1EBjs5cSOC5z
	/cXixJnCOS21E=
X-Received: by 2002:a05:620a:2b8c:b0:939:b55a:3c7 with SMTP id af79cd13be357-93bdc7abe05mr214015285a.41.1789723795326;
        Fri, 18 Sep 2026 02:29:55 -0700 (PDT)
X-Received: by 2002:a05:620a:2b8c:b0:939:b55a:3c7 with SMTP id af79cd13be357-93bdc7abe05mr214012585a.41.1789723794867;
        Fri, 18 Sep 2026 02:29:54 -0700 (PDT)
Received: from t14s (2001-1c00-0c32-7800-07d4-cca3-ec08-7ac7.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:7d4:cca3:ec08:7ac7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bbc6bc0sm36796166b.60.2026.09.18.02.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:29:53 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/2] module: add SCMI device table alias support
Date: Fri, 18 Sep 2026 11:29:50 +0200
Message-ID: <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzMSBTYWx0ZWRfX2glDzCrWXVJL
 mzDouKf+PEQIT1XV1+rfvGqZ6UKTLdUhPNvFZwSA6p7Y0WDQIo9WiEgRaPFOpCnQt1686h3rbkx
 j22j8xyEMKXt4DabwbnAiMuHxq9uKp15PlXktTQpFYOCeSoRM2vazvr7jkd3d07uamkmRyuhw2b
 Xu5NLgypZx8e8sNkOwTrJFqXQYpXDm8k3S1m2pFNR0QXbgRK+AuyZFXCt6+fjnR+c+4hloJfUEB
 rBfq+YgszBthuCOI7eEWiCA000CgaSg+sZGJeAN4tIOGeixtsACg6hI+UBLimuQ9kcQS9YjAkc9
 ViWY6XEp7/uLcFHcJHgEOoaP/hxizMglitYYMsQtWYnD5Fk87SQCS/Icn0iZFlTJak83Y4nHfmU
 TR/5/Gx0+ivR2KB018XwV4EhC55n9QsDVc9AIC6Aii5/p2AyA6qwezR5igAbylZEp6UTpjkG8QM
 HAsqJ6K5jbpxpq2f2oQ==
X-Proofpoint-ORIG-GUID: 2gPKn6bn7hoXYejoNDCHwpY5B9l7PRMU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzMSBTYWx0ZWRfX9nOWBe+zjULj
 +wXdNjlidFXTfAes88IE1DXBC48dtM2FQXk1MXuEqRDS89Y2r+IKNHiQ5HPjXpFVLZgE368klM7
 NnHIwLqWmg4EqyTunBFbjs5FSH8R84I=
X-Authority-Analysis: v=2.4 cv=IP2XmQvG c=1 sm=1 tr=0 ts=6aad0494 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=NbjprmzQH6tOvfj-_-IA:9 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 2gPKn6bn7hoXYejoNDCHwpY5B9l7PRMU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180131

From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

SCMI client drivers already describe their bus match data with
MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
SCMI device tables. As a result, SCMI modules do not get generated module
aliases from their id tables.

Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
visible to modpost, add the corresponding generated offsets and teach
file2alias to emit scmi:<protocol>:<name> aliases.

Use the same stable alias format for SCMI device uevents and sysfs
modaliases. The previous string included the instance-specific device
name, which is not useful for matching modules.

Assisted-by: Codex:GPT-5.5
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v7:
- Rebase on top of v7.3-rc3

Changes in v4:
- Drop unused driver_data member from struct scmi_device_id (Uwe)
- Drop device-id/scmi.h include from mod_devicetable.h (Uwe)
- Add device-id/scmi.h to devicetable-offsets.c and file2alias.c (Uwe)

Changes in v3:
- Adjust for ad428f5811bd ("mod_devicetable.h: Split into per subsystem
  headers")
- Add '\n' to modalias_show() output, matching other subsystems' modalias

Changes in v2:
- Drop #include <linux/mod_devicetable.h> from scmi_protocol.h
- Link to v1: https://patch.msgid.link/20260616-scmi-modalias-v1-0-662b8dd52ab2@oss.qualcomm.com
---
 MAINTAINERS                       |  1 +
 drivers/firmware/arm_scmi/bus.c   | 21 ++++++++++-----------
 include/linux/device-id/scmi.h    | 17 +++++++++++++++++
 include/linux/scmi_protocol.h     |  6 +-----
 scripts/mod/devicetable-offsets.c |  5 +++++
 scripts/mod/file2alias.c          | 12 ++++++++++++
 6 files changed, 46 insertions(+), 16 deletions(-)
 create mode 100644 include/linux/device-id/scmi.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c2414447892c..f351ec56a2ec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26604,6 +26604,7 @@ F:	drivers/pmdomain/arm/
 F:	drivers/powercap/arm_scmi_powercap.c
 F:	drivers/regulator/scmi-regulator.c
 F:	drivers/reset/reset-scmi.c
+F:	include/linux/device-id/scmi.h
 F:	include/linux/sc[mp]i_protocol.h
 F:	include/trace/events/scmi.h
 F:	include/uapi/linux/virtio_scmi.h
diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index e060edbe7e83..51de50fbc382 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -12,11 +12,12 @@
 #include <linux/of.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/device.h>
 
 #include "common.h"
 
-#define SCMI_UEVENT_MODALIAS_FMT	"%s:%02x:%s"
+#define SCMI_UEVENT_MODALIAS_FMT	SCMI_MODULE_PREFIX "%02x:%s"
 
 BLOCKING_NOTIFIER_HEAD(scmi_requested_devices_nh);
 EXPORT_SYMBOL_GPL(scmi_requested_devices_nh);
@@ -185,7 +186,7 @@ static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
 	const struct scmi_device_id *entry;
 	int ret;
 
-	for (entry = id_table; entry->name; entry++) {
+	for (entry = id_table; entry->name[0]; entry++) {
 		ret = scmi_protocol_device_request(entry);
 		if (ret)
 			goto err_unrequest;
@@ -205,7 +206,7 @@ scmi_protocol_table_unregister(const struct scmi_device_id *id_table)
 {
 	const struct scmi_device_id *entry;
 
-	for (entry = id_table; entry->name; entry++)
+	for (entry = id_table; entry->name[0]; entry++)
 		scmi_protocol_device_unrequest(entry);
 }
 
@@ -219,10 +220,10 @@ static int __scmi_dev_match_by_id_table(struct scmi_device *scmi_dev,
 					const struct scmi_device_id *id_table,
 					bool skip_transport)
 {
-	if (!id_table || !id_table->name)
+	if (!id_table || !id_table->name[0])
 		return 0;
 
-	for (; id_table->protocol_id && id_table->name; id_table++)
+	for (; id_table->protocol_id && id_table->name[0]; id_table++)
 		if (id_table->protocol_id == scmi_dev->protocol_id &&
 		    !(skip_transport && scmi_device_is_transport(scmi_dev)) &&
 		    !strcmp(id_table->name, scmi_dev->name))
@@ -266,7 +267,7 @@ scmi_child_dev_find_get(struct device *parent, int prot_id, const char *name)
 	struct device *dev;
 
 	id_table[0].protocol_id = prot_id;
-	id_table[0].name = name;
+	strscpy(id_table[0].name, name, sizeof(id_table[0].name));
 
 	dev = device_find_child(parent, &id_table, scmi_match_by_id_table);
 	if (!dev)
@@ -300,8 +301,7 @@ static int scmi_device_uevent(const struct device *dev, struct kobj_uevent_env *
 	const struct scmi_device *scmi_dev = to_scmi_dev(dev);
 
 	return add_uevent_var(env, "MODALIAS=" SCMI_UEVENT_MODALIAS_FMT,
-			      dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
-			      scmi_dev->name);
+			      scmi_dev->protocol_id, scmi_dev->name);
 }
 
 static ssize_t modalias_show(struct device *dev,
@@ -309,9 +309,8 @@ static ssize_t modalias_show(struct device *dev,
 {
 	struct scmi_device *scmi_dev = to_scmi_dev(dev);
 
-	return sysfs_emit(buf, SCMI_UEVENT_MODALIAS_FMT,
-			  dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
-			  scmi_dev->name);
+	return sysfs_emit(buf, SCMI_UEVENT_MODALIAS_FMT "\n",
+			  scmi_dev->protocol_id, scmi_dev->name);
 }
 static DEVICE_ATTR_RO(modalias);
 
diff --git a/include/linux/device-id/scmi.h b/include/linux/device-id/scmi.h
new file mode 100644
index 000000000000..1b4ccfa9dcc5
--- /dev/null
+++ b/include/linux/device-id/scmi.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef LINUX_DEVICE_ID_SCMI_H
+#define LINUX_DEVICE_ID_SCMI_H
+
+#ifdef __KERNEL__
+#include <linux/types.h>
+#endif
+
+#define SCMI_NAME_SIZE		32
+#define SCMI_MODULE_PREFIX	"scmi:"
+
+struct scmi_device_id {
+	__u8 protocol_id;
+	char name[SCMI_NAME_SIZE];
+};
+
+#endif /* ifndef LINUX_DEVICE_ID_SCMI_H */
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 5ab73b1ab9aa..ba53302d95f5 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -9,6 +9,7 @@
 #define _LINUX_SCMI_PROTOCOL_H
 
 #include <linux/bitfield.h>
+#include <linux/device-id/scmi.h>
 #include <linux/device.h>
 #include <linux/notifier.h>
 #include <linux/types.h>
@@ -951,11 +952,6 @@ struct scmi_device {
 
 #define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
 
-struct scmi_device_id {
-	u8 protocol_id;
-	const char *name;
-};
-
 struct scmi_driver {
 	const char *name;
 	int (*probe)(struct scmi_device *sdev);
diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
index b4178c42d08f..91ec3704ee2b 100644
--- a/scripts/mod/devicetable-offsets.c
+++ b/scripts/mod/devicetable-offsets.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #define COMPILE_OFFSETS
+#include <linux/device-id/scmi.h>
 #include <linux/kbuild.h>
 #include <linux/mod_devicetable.h>
 
@@ -144,6 +145,10 @@ int main(void)
 	DEVID(rpmsg_device_id);
 	DEVID_FIELD(rpmsg_device_id, name);
 
+	DEVID(scmi_device_id);
+	DEVID_FIELD(scmi_device_id, protocol_id);
+	DEVID_FIELD(scmi_device_id, name);
+
 	DEVID(i2c_device_id);
 	DEVID_FIELD(i2c_device_id, name);
 
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 8d36c74dec2d..5379b1def07b 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -121,6 +121,7 @@ typedef struct {
 /* Big exception to the "don't include kernel headers into userspace, which
  * even potentially has different endianness and word sizes, since
  * we handle those differences explicitly below */
+#include "../../include/linux/device-id/scmi.h"
 #include "../../include/linux/mod_devicetable.h"
 
 struct devtable {
@@ -852,6 +853,16 @@ static void do_rpmsg_entry(struct module *mod, void *symval)
 	module_alias_printf(mod, false, RPMSG_DEVICE_MODALIAS_FMT, *name);
 }
 
+/* Looks like: scmi:NN:S */
+static void do_scmi_entry(struct module *mod, void *symval)
+{
+	DEF_FIELD(symval, scmi_device_id, protocol_id);
+	DEF_FIELD_ADDR(symval, scmi_device_id, name);
+
+	module_alias_printf(mod, false, SCMI_MODULE_PREFIX "%02x:%s",
+			    protocol_id, *name);
+}
+
 /* Looks like: i2c:S */
 static void do_i2c_entry(struct module *mod, void *symval)
 {
@@ -1491,6 +1502,7 @@ static const struct devtable devtable[] = {
 	{"virtio", SIZE_virtio_device_id, do_virtio_entry},
 	{"vmbus", SIZE_hv_vmbus_device_id, do_vmbus_entry},
 	{"rpmsg", SIZE_rpmsg_device_id, do_rpmsg_entry},
+	{"scmi", SIZE_scmi_device_id, do_scmi_entry},
 	{"i2c", SIZE_i2c_device_id, do_i2c_entry},
 	{"i3c", SIZE_i3c_device_id, do_i3c_entry},
 	{"slim", SIZE_slim_device_id, do_slim_entry},
-- 
2.55.0

