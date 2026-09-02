Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA91D387364
	for <arm-scmi@vger.kernel.org>; Wed,  2 Sep 2026 18:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788372538; cv=none; b=B0o6+n0WA6xLPAOBuYgjKAGNoeNR2U3EGHNP/cWtbZtoA9eGabI0sNE+t27fLossOk0+T+jPT1CgQYBOORVcb9HAe8woHnB/gUB1gm2tuYlO32kY7YqnbwUWAuIcXLjjh5TNE36Y8qFaqOX1BlrXd8aiPBiDCacvzdFoRjk03Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788372538; c=relaxed/simple;
	bh=qqYzxrvaW33GugN1wfMmttWK+is/52VK42xgNKdCyJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LyOWQx9x8heeuLSHxxhwnoZoNzz6sShhhlYVvB8aQdfxQ5hHimyCIiY+rCCcM11oM2B5PNP4oRTe/9OqzRKjCt0a0WBpv32abiprxYyQd1c/tHaEGZ9WASYU1f3D4hTfLBIERevYHVDO2VuEyhykmo+2xe0iTX3pTiQtyazob1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=llUct4c5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NPyvYJBk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="llUct4c5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NPyvYJBk"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hqsrb2209536
	for <arm-scmi@vger.kernel.org>; Wed, 2 Sep 2026 18:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8/6R5LUyWsU
	dJmgkPC8R28H+x4JiDbGyxUBi1wvYWmg=; b=llUct4c580shIcDg73MLmvRVJL3
	rYZ5pZ9DZzYgOKGXpvVH51WqQKdKZGK0PGjK9aV8Hr1J3M2iqjaQLjf2LDMvlBPL
	hGv4+zlqEgaLeoNRQZNR7JIwSs9oQY5MuTyqhkp/X4yGCaDWUxWBssoBt9vrMFl2
	oqayeEXnypFPbNivWamumxlt7OdkxXSXtATWmzYewVhTVTXHt+A25SKtlpDQbpcf
	Ym7HOMI6Hyyef9p04dBmlKhMLPacd8l6gHKILQZWe4yWuE9Mai44qxXUUg1A4UYG
	7YqV04PHb9ztuflJhayzP1qtYP19J4Lyx9oGNlqz4sapzGCUBxi2DPgp+Gw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5rnq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 02 Sep 2026 18:08:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ef13b61bcso326976585a.1
        for <arm-scmi@vger.kernel.org>; Wed, 02 Sep 2026 11:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788372535; x=1788977335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8/6R5LUyWsUdJmgkPC8R28H+x4JiDbGyxUBi1wvYWmg=;
        b=NPyvYJBkGL5OuFDA35gSYGzmpj4bP9u0QwejJ561++FChQber7HDGvHZU2KGSX9AAH
         j3Kx4Q/4GZGL4PpBvTdZ9GyzP66cRMooRjKJMqPctkpXBMhIMW/TiTE2+852yyhh0mAE
         RYASD5XyawjPtrLD4Suxp6sBY7lhwEhGpJjIPsjcxpKzOiffPS2J6yjR0eKyTS0tBPCj
         8bcTGIm5GcgPdSpftj12fRDZtYxRPLGCTO4fDFAKs4N4z3gOhctLVOqVAzvFwI7nOojA
         3q1GOkXDbFUFSCXdKswKwbvWhGa/oFUtioIRMF3SGs9Oc0TCHEPe+oBGrAEAzxBAuo+Q
         bM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788372535; x=1788977335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8/6R5LUyWsUdJmgkPC8R28H+x4JiDbGyxUBi1wvYWmg=;
        b=Jd4ukd4ymJQqrf5J7/tpbTOiFXxYKIfj6sg72SW1TqAk7tef/OHcqsfMx4Zh4aOKlU
         a62fUzgLJkv4bfPVNBhMFII5WlO7cXdU9EudiYz6UJc8A0NnSbHddOqrgtGrbYWMgcUz
         2zAFNIRnlwhrj7Md7yb92SUPemeD3zE4NUYIbQR3Gss0Ap1gLA3oNiUi0XSGDX6+xAPD
         zTlD4tC9+OkqM5UiP5Y17reGwEddLYbESh4PS/FkWgCFPpfQ7AxTWwwRfhrI2RBHNeMp
         f4VVTQmX2xXIHjnSKCDkgFCJvEp+Ae9t/j2GojTowT4yjAMmxLldutkvh776CBouzlah
         XVag==
X-Forwarded-Encrypted: i=1; AKwUvBxSiGlDg1B23cyEJwjzF++jK7/eUgeYgYuoDKBv+d7FQnnMzPOKRbRkypzwRl6AT43x1LJTXe1wlQ==@vger.kernel.org
X-Gm-Message-State: AFuF++md76poooi3Lv8V4PiBDduD0wq7UYUFgT2zp69/KG1/fTsl44+l
	ah0SLUmm1u1CsAISBf8x7u61G92M6Fyow/AfeQruqO83NllosOUfxnWVUO0KR9A0w6YAKqOh5Nu
	htpU/YyihqJ0p1GM+j4G9CdNgXabGczBejvK4iXO9JNXu5FTy2Ik/wd9CgUFfnA==
X-Gm-Gg: AYBFou11EysZap+6aM8PR42/LRgcWr7GKFgFy0KSTNDHK+yb+CzUQoIdSq3fVrUeHlX
	2COfjE9zxjUvjLbAfuBbmK8k/V03wDngiyuvlTH7nlSHsHa8Qjt+JtpnEGrKGNcfP6YuHmSl4L5
	h4W70aJJOpwpxmoa28kqrWb78FUoWDIx+3E0CevP/RwYxa2KyBh7wZFfzTppkXfiSNRajVX910M
	QZ8EWoRhDq5w7VWW6GuUj+f3NxgPcu6hxO56ybJ/txXCk4Gf8GBLOzldSdAJkOgz7d8zWRRScW8
	irDFEbCv36L/K/Q64+rul4G8LOZbTQyAWEG15xVo8VHG/qyvwU10LKf18SQ0WiWQPMQZg8m4L+2
	xNevhcgZ22zsGVSSAFEG7YKvCwvgF1hoiP4qsqv3QshYhhW2mikHFA31wyApEYtCWAcu06citYB
	kv5WZnD2DqiTQSBU4=
X-Received: by 2002:a05:620a:711b:b0:937:27fb:96f8 with SMTP id af79cd13be357-93960fe4a2bmr717702985a.41.1788372534532;
        Wed, 02 Sep 2026 11:08:54 -0700 (PDT)
X-Received: by 2002:a05:620a:711b:b0:937:27fb:96f8 with SMTP id af79cd13be357-93960fe4a2bmr717694085a.41.1788372533835;
        Wed, 02 Sep 2026 11:08:53 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f895d68sm1444041a12.4.2026.09.02.11.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 11:08:52 -0700 (PDT)
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
Subject: [PATCH v5 2/3] firmware: arm_scmi: Fix scmi_protocol_table_register() error handling
Date: Wed,  2 Sep 2026 20:08:43 +0200
Message-ID: <20260902180844.41230-3-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902180844.41230-1-johannes.goede@oss.qualcomm.com>
References: <20260902180844.41230-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a986637 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=mtY6ubt43vOedHXxatAA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: R2BIPnvSb0R26Kk4kgOKxeUNCVFawe_0
X-Proofpoint-ORIG-GUID: R2BIPnvSb0R26Kk4kgOKxeUNCVFawe_0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE2MCBTYWx0ZWRfX7tBp0CqEXTsD
 D1QsmCpRN+CX3WurPhyktTJ9W3Yf3IQ5lJL8lrrg76ZpQupoDzM7moQsQcf/0zUvUM0xB3mEIu1
 j22wV2ma8Y66MoE9QBUd/8QqXPrO/WZHeH+kN6cnjhQXjySgS9/UBJo5oNc9rfG01qcQuXo2gee
 4fq3F9xG7LSGA+jZ5OuEsWtANQ5i2TUQ/Vo8KBc8E44HlsOUPYNbqteeHJBper9KvxBrmGfO3zA
 xghsFpxvPnTdgWHY1EJWlcbY1eBdAIs/DxVbQWDHoEefhPLA1NnWjdZkg8+Aq/gMf6TeATbnlqc
 L4zgMzcWrFhNoxzcMw/gCK9QCg9L4EGjuIvVB/FAighKVTYbLtsw8w+pFcFtzGY/x3pytFteeU4
 sPhs284YmmsSVqruy77S/T2t9NRUzSAmmxRP1XerJddADyCJEkqX/HZyaAg+51GIGAzeqgon3yQ
 bQzLwBZbpT9XxYOAWUA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE2MCBTYWx0ZWRfXy7dU0S2w5X50
 OrO5nEADs3ESetbDfL2TFu/TvS7KgAe0UmtkkZ/E0h5zGvqEPallgL5IbeCWfiBbKQm/4sfTII0
 cEo26n9KHz+N7D+Nch8+Gb9hqQWYkLU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020160

scmi_protocol_table_register() stops at the first failure to request
one of the scmi_device_id-s into scmi_requested_devices, but it leaves any
previously successfully requested device-ids in place.

Unrequest any successfully requested device-ids on error to fix this.

The code manually unrequests these rather then calling
scmi_protocol_table_unregister() because one way this can fail is because
of duplicate device-ids and in that case the original device-id must not
be unrequested.

This also moves scmi_protocol_table_register() to below
scmi_protocol_device_unrequest() since it now calls that local function.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v5:
- New patch in v5 of this series
---
 drivers/firmware/arm_scmi/bus.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index d12d5de15a1a..6f667e4ffeed 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -137,17 +137,6 @@ static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
 	return ret;
 }
 
-static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
-{
-	int ret = 0;
-	const struct scmi_device_id *entry;
-
-	for (entry = id_table; entry->name[0] && ret == 0; entry++)
-		ret = scmi_protocol_device_request(entry);
-
-	return ret;
-}
-
 /**
  * scmi_protocol_device_unrequest  - Helper to unrequest a device
  *
@@ -193,6 +182,25 @@ static void scmi_protocol_device_unrequest(const struct scmi_device_id *id_table
 	mutex_unlock(&scmi_requested_devices_mtx);
 }
 
+static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
+{
+	int i, ret;
+
+	for (i = 0; id_table[i].name[0]; i++) {
+		ret = scmi_protocol_device_request(&id_table[i]);
+		if (ret)
+			goto error;
+	}
+
+	return 0;
+
+error:
+	while (--i >= 0)
+		scmi_protocol_device_unrequest(&id_table[i]);
+
+	return ret;
+}
+
 static void
 scmi_protocol_table_unregister(const struct scmi_device_id *id_table)
 {
-- 
2.55.0

