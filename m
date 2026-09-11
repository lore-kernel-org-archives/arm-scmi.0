Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6206537B014
	for <arm-scmi@vger.kernel.org>; Fri, 11 Sep 2026 15:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140223; cv=none; b=Gld2Hi0wiBbZfF/3SX6uylNu9q/Y0ULD/r5EhiRrfIB4J6i2kMMLy2e1dGmyaWUElmc3qQgDnIsbxZkuLpytkLMoNbslntLhoRFbLanhg6UI11tchIYbKPqG7VgTwQ5qowuqNOik5NBn2jnQ8mMocJe+yZu7U8oReAd2cLLyHBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140223; c=relaxed/simple;
	bh=fOozqXRREZdVE1IpU1zeudvT0HR4HrTNyPKFTzqIpmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q25wm79eIHyoxbmWkQ+2hHEdGziY/65N6wZNajOzGPqe/a0J0fo2qxQIMqKy7LSAhdnbts8KSCHm5MAjEPNwZH/5JBPln67tZGJYtF2DBD97ZPFOPdHKcNhnjGFGv9FybiI3leCx+Ax6sxh4k4RXiZ38JE5DmToWw85mPx2GEYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dp4kRRQp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cbuXTZ+4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dp4kRRQp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cbuXTZ+4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmKvK3780843
	for <arm-scmi@vger.kernel.org>; Fri, 11 Sep 2026 15:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g5ESSTcnZuT
	5ralQyPBxo3SGry0UvUcfoIReYTVE9Ig=; b=Dp4kRRQpf311WuUvZyTt1GXXi8G
	mQYJJF0dlzq5DsvMj5qcT8+2XoHzzdBcsvCTXIZycX1tPeuDr4fJwTrinWI+XCIS
	RZr9KMknF8zabRu1Z99rhRnOTBmnz+oGP3KkyHZ/x/7Zkp/P/UnBfrcxzuo8rRxS
	AYpK2/Xy0wzFGf0g/R79AgTuzeqTejBhWQo53tpIEBFMzeeLvKLYRq+pN/aM+N/y
	Rh7oNoGRbqeQPF7851HTH+/1Hbt0SxLjaX2xCcry4jhnQpsiJR0/LIXHo9rO0VF0
	5rigtLFxh9aHI/uR1xm1pDcI2KT+d9BFbPNeCGMghN2kgL8UZSAg7Qt34eQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmcgfj5re-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Fri, 11 Sep 2026 15:23:41 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78bb7517525so245239137.3
        for <arm-scmi@vger.kernel.org>; Fri, 11 Sep 2026 08:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789140221; x=1789745021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g5ESSTcnZuT5ralQyPBxo3SGry0UvUcfoIReYTVE9Ig=;
        b=cbuXTZ+4WkyBb4ynOOSGwOfliiEZM/KTP26BW0R/sYoQJx1RBTdZe44NqKNuhDinR1
         IohOxOvQG0Rn2IyNeC3U2rYsjCxE+r90+IChi/vseS0uyou3Z0IT4QHE51odPsPEw97/
         w1ycaCv3o0RB1gftggrWFpAmZW6fUTlY6FSpXKWmTpAr47ZK1ECJJDSBzd7cNUULnlkE
         ukN1MF/Re/QAwYHJB/nYK5x0EOxj45ceeWFHy2kDNbT87v9Vo5mfYYh8RHJvXay0aPA2
         3ZXua2SMV7heJEbX9RzQ2wzD2DuHWEgll8w0bOcOwF9oouYhDrPgTggkefGqv3zcp5rL
         QJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789140221; x=1789745021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g5ESSTcnZuT5ralQyPBxo3SGry0UvUcfoIReYTVE9Ig=;
        b=mgvQvPFEPtX+cSM9/yD1dHskZRY5ei9qDuTBC84bW7nijIZA+HzHcLJ1TFoSPIb2uc
         c2e5unrnQtspTM7io19WYtkt2g1KDZzNhmmYz+ciyxVL1Y400NWPV4UL9Q1VloZJstQ0
         uSiYidG2af0QHzA0Rz5cde1RCi+wIj8gEDSRMNkFTWZDPzHzsMZkpfwgZWADoM/nMhyP
         SDeIF5hCwRc3ViXqF0OTte5wdqWbbbk3arJS04f17WvSh1eRxc03Rdv30odGb5CWUFM6
         EYOX54xNVl3rQ8gU6Pxfeglg0bO9DjBjqZ+Nm4UJ5vUY9qfnxI7My+KKQoLCwVF9oLR6
         hCYA==
X-Forwarded-Encrypted: i=1; AKwUvBz3ttE+X60eo85F7gYKu5AnF5cpkSwVeOfo9ihdRSeGqIFkTHPBc8j4PDILdaHILZeK6VCaq5ITnA==@vger.kernel.org
X-Gm-Message-State: AFuF++mrbdPCfUPSF53m6aD46IS5qorY+nmPo4QqGUDqeD0V+MC42iIp
	xQLm0jzu6SlG1XX3yCuromFDc6lUxKdyUkd8z96M+j5+Ut0E6MjuQVQB/h1ntAN6iCJwJyzYwfg
	Yd9ixXFXPb5QZ7IfndVVajUrnRdR5VABOSxRmRLybkZ8KCypVb7Ar6G8Vapt/fA==
X-Gm-Gg: AYBFou2boO5zgbsMg4EbHhngrOD9kMRDTIbp/XPIPzwMMxHVEHbzFzNmmdnuwo+gEkm
	eArzJceWR8uxCaQIa/Ox4lh8e6Zpr3CmMG0uXxMm/RYTS+zV7syq0ttLD/d61jCpxtrEa7mz0aE
	qFbzGICrpwHl/aC2fTYcq6/5hx2zdeoxtRDtzrJGyFIAlFGi9lS1rHyWwjyKIxQpoD6xJMMZsf8
	ZinS2pIgKrhmnwtUdQqnC/erP85Etz4BMgsIRW+yvi9duGHFQMFPYrUm5J11Cj82iXRgaX0TbWh
	zqru0ZiE6XOlRMJyEWlrVBne5WSveAvgqU+Dp6CLf4wSkZZmNB+Sfmbwa+FztTXu762mLTJx4uN
	hOD69PK6XcSzE68GdQK8dfPSZK6WZZDU+El18dZtxBiiFY7dFqKPAu6/wA2GQ2H2LnPucwl+8IU
	r8H19z8DsC11Thk/wxYd4k9GxkxM3cJGUHU2Ys
X-Received: by 2002:a05:6102:1953:b0:78f:7135:b4ff with SMTP id ada2fe7eead31-792a52b9d3fmr5324916137.2.1789140220609;
        Fri, 11 Sep 2026 08:23:40 -0700 (PDT)
X-Received: by 2002:a05:6102:1953:b0:78f:7135:b4ff with SMTP id ada2fe7eead31-792a52b9d3fmr5324849137.2.1789140220237;
        Fri, 11 Sep 2026 08:23:40 -0700 (PDT)
Received: from t14s.space.revspace.nl (2001-1c00-2a07-3a01-8e96-3679-0b9c-de47.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:8e96:3679:b9c:de47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296614323csm94042566b.59.2026.09.11.08.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:23:36 -0700 (PDT)
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
Subject: [PATCH v6 2/4] firmware: arm_scmi: Fix scmi_protocol_table_register() error handling
Date: Fri, 11 Sep 2026 17:23:27 +0200
Message-ID: <20260911152329.5822-3-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
References: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfX9vH44TpVyjdw
 nlwVE0UANQlD1IwvgZOTU1uP/7acZNVPAiwjlX66mD2e60O/HHwOgTYczEeNfiUTwS8yX1wjmzo
 rfnllunOEzvrWKrLKlLJ7rlDYgXPuQHsNZRTnXVhtCCjowdicZvUVYB2cuzFSev7eh+zU08u0NS
 TCKtRVgzmeHt6bKdqhC5gvhgQIDdYjyB4zm8LEg/fK4VwLjBkU/7hhi+VNdCfFFoE711WHhhocY
 xyVWL41ragJktZmrpOPCy0GMw6736/CczyJVWDQyNWJwlHFvEDPlvdHnmU7YR3QQQVQWShT5gbM
 Hqin38+DhDXl4Dzzd2jmumTJJ8cGm2kTRoq1InoW8uY/YF6B4LDe4gQSt9viqFt+WU1Y/OwWB7P
 cjZKAcmtRQIk7BJ3v/fgTe3GUWO7JH5TqsJQUT7eh+RlxMx5zBO28TOSTWIh+8Nj3zV/U7hDvvA
 1I1cXG1Ze6pLk04Aplw==
X-Proofpoint-GUID: duOz3zurodOb8NkvKWW0Hlyj4S6cqlKM
X-Proofpoint-ORIG-GUID: duOz3zurodOb8NkvKWW0Hlyj4S6cqlKM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfX7siQW3q2BFsb
 cVxItzR8iwNa6GJQuY2srDJAW7Lmjj94O6MGxWGpE5Wa5aEva38DVGwLgqbf9vPaWjRnIJ7VG9v
 VSi/rylZOHiANZR9guANNYMvaDFauxc=
X-Authority-Analysis: v=2.4 cv=ULtIjyfy c=1 sm=1 tr=0 ts=6aa41cfd cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=mtY6ubt43vOedHXxatAA:9
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110214

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

Fixes: 2858f6e5f064 ("firmware: arm_scmi: Add multiple protocols registration support")
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v6:
- Add Fixes tag

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

