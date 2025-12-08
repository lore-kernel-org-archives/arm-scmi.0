Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36CB2EB5A1
	for <arm-scmi@vger.kernel.org>; Mon,  8 Dec 2025 02:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765159757; cv=none; b=dw/BS/adE3YJ62AETsKsEkqes7rwgrBir6XB3ochLOKVT4/t4UhNNnKaq3bS0w4amus/05FTouhnTE8fF/DMF0B5KY66Lt7TqH/nDiFliOZCwNY0mWBmy/jmd8JaIwvTogVp1r7/OmitjFhLAIXGVbqygQ+aG9fr+MMkVijlvQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765159757; c=relaxed/simple;
	bh=BxRojLwyf+c8qcMEFwrzJjujheqjdTZIXrt0VaiDzxk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GAsJG7FHXS47a5bW+mRLOELtN1GXlraEbHv5GZN4z08xSJmZ6/nROj31IoAw5A+Z9SDkZiuEpRnFCZoWN5MgIEBC5f5fk+QkluQv8Xjy2Y9m8Dk9f5/A0hCLdTCZuBa3dA+PJR2L54KYPE0z3Sp0+4S3/ReoW0ivHoxXrTbs7IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CrKMnw2M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PjN4busd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CrKMnw2M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PjN4busd"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B7NraQq3211935
	for <arm-scmi@vger.kernel.org>; Mon, 8 Dec 2025 02:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dKkJmoXSHwgOEmZ7UP4UhmBBGJtWa5ekgvO
	QqU+FCe0=; b=CrKMnw2MWzHviiH5Z/70yR6Lwzhicg9W1crhk2pR3TcgHN5FRqd
	ckXhQSSpkFlTMcp6N5zLL4r9obYj7DMLGblR2wxJbf0COPZ6403lSxtZm4fLho4f
	LFLhxHbzxfbORBO34T/xaCvSPOah0PmzCvmFch+msAWy6G6umtBPbsBBPpUPpwbA
	1Wdl+RLqPc2V6y3lGfb+Or4N1WpC23ZystWYahEP6HzNxjX8TIE8zOypY5z+KBuE
	bHrT44nmV9vXsMLdp46WrEMh0GndjZrrrsQ54f5xcWPwWkKpTIS2neQL6Aclx00k
	n4YkCwFDueda4YXBD98RN57Wi0RAeNO3tBA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avd8e37u4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Mon, 08 Dec 2025 02:09:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2956f09f382so25220815ad.1
        for <arm-scmi@vger.kernel.org>; Sun, 07 Dec 2025 18:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765159754; x=1765764554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dKkJmoXSHwgOEmZ7UP4UhmBBGJtWa5ekgvOQqU+FCe0=;
        b=PjN4busdUxU1zWfy2nmsLyT7c3EP42zwLoRbMtIA+P+A+BOBih1Fe3UBin9YbvpelI
         SkEzY7pk9pCKhN8NzPZdz4O/HqbCIqLFvTl3PQ6KpL6UfN8DS+FODZIF1sHkoAbx8v3k
         gUsdegMAJR97nAvwchPkTQppCRSHOfmSaN3XxZw7S0pS02nyO7G/9hdhmV5yA9yyQRrX
         RIqGT2e4hltBb0x6u5+lsXKfPCsO+20QK3/KmkIw/uqM1Kd0ZOUpezI259+FnDc5lIsa
         he5Bj4LtgkDgALW6D0kDp9GLPX6Ma0Gy2leqAKcr89Sz8rOP4EYoi6gfe5E7G/IzQJL9
         dgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765159754; x=1765764554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKkJmoXSHwgOEmZ7UP4UhmBBGJtWa5ekgvOQqU+FCe0=;
        b=NrxUoame6goHZd2HbUWaOGXPtF7YPy3QAAhXFLCWJbg20FzP5gZ8f4mVXZ39ibhzOQ
         rf7KpKi+GuOkIiF0NhjPef0aY8Xit85WiBj/GSvHDzHOFVaj7pH+7Nj2/Z+gBOWzCVay
         i+w9hMaNLxtNrK/u3MQKF7mdKoLSkl4z4nceSfzVaJcghbPFqqoiD22JfIfbWITAFmgp
         EijfCoNPg4fpmh6KKiqYUTg0bRjJLE33dP4XLVipY18mbqDwTUhk+H1VINW/sCdSKEDg
         VOqNukAEVWa1loDNGPbeI90K8PZf7MMOv4n5Q3POCu2hXPSNidjS7mMJcexYOxg/QB6m
         +unA==
X-Forwarded-Encrypted: i=1; AJvYcCVlqRgMqsKUaK/Lm8yx432AD91jIGU+Ta44T3N+WKb1mRstue0rABS7UdAFewVE5U7GLqtj0djHfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVDhpz2g9gAMDmd5a3s0ndOEjxFaUtCTK9kbOzTtq9BZ64Gaq3
	iCT8EKi9GlNqHfNDLNvAijwx8KZfjFNuJIDmDVlBOwS1bnqN9b8XGf3nNmww/bFgwsinoQmG0x7
	aS9kbG97hk6pl/2I8HC0E3OZRgo01GA3UYh0pyputfDIGH7aT5f0+FWyIAlrALQ==
X-Gm-Gg: ASbGncuYnKmf/VwV6UAeyIUFfE5+XfMajS3U1+wle0LwTGHRSeX7TwtO91a2Fs6bq5S
	Vsa3zxC0IZFx5nFBJqpWi8HJyCwv2wdbmCm+9EVdN3axitu3jvHWYWgDMQ79uESrqimCVEWPszl
	OlFVgae1JMnL8vyL/loir8fgX/pFwWIr9escyDLkFelxWa70J2TNPdwLCQNISdMziAYSQwBTtPh
	iIvsRIIk3eebE6DB2DE14oAwFilXw6QDCeQsUmye1CY9HPCaoJjks1AouGyUjI+EO9juXSb4rJR
	dk8BsnaV8mEhrZsaV0ftjocF1O4J6tmtX3tx2drqrLiZfAVZ6sotO6Vja9/xzHj0lkWcpjCwjVU
	L7cMjZOMRuflgkmVSJxPMRvfD//irCX3IQeJLeDT7Jf4iRZ01WVboAcuH
X-Received: by 2002:a17:903:1746:b0:295:592f:9496 with SMTP id d9443c01a7336-29df42a1e4fmr44650825ad.20.1765159754449;
        Sun, 07 Dec 2025 18:09:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2HiKEGWVVMYF/13s6eSajPU59gNFCAfNUhHZX1potan5zoYXxppuI8gWLZg9/BuxTdDqlYg==
X-Received: by 2002:a17:903:1746:b0:295:592f:9496 with SMTP id d9443c01a7336-29df42a1e4fmr44650605ad.20.1765159753782;
        Sun, 07 Dec 2025 18:09:13 -0800 (PST)
Received: from quoll (fs98a57d9d.tkyc007.ap.nuro.jp. [152.165.125.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeae2552sm105933945ad.88.2025.12.07.18.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 18:09:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Simon Trimmer <simont@opensource.cirrus.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] firmware: arm_scmi: Fix confusing cleanup.h syntax
Date: Mon,  8 Dec 2025 03:09:08 +0100
Message-ID: <20251208020907.5476-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1659; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=BxRojLwyf+c8qcMEFwrzJjujheqjdTZIXrt0VaiDzxk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpNjND2zygvphvTpli5om48fSGCk0RVRokty/wP
 rTcOKsAWfGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaTYzQwAKCRDBN2bmhouD
 13MuD/4wIBFhZBId+jjIeUCLxWleeQsPONBAJTz4zbOsefTT3TYRj/jI63obIrdDTsJ6jaUVlhT
 Wnm09FF4DU20F/hMIe2mcH0RnNnaCMFTt1ObO4Wr3xnCeecMq9tflJYcsvSw4M5njjI/Sz3Sl1G
 KJ3up0mQl38YRxhXyJJ0O9Cvh/nujhuV2oGDI9ABbw9dzDje6HmYNGhmXuge+I28nOasLBTR/UX
 mVOU4c+80Mu9+hF3+iI4N0xoiwLtugwipolcvPRuiaBXImzWbdEvzfm+Y5U2Q7NeaUTDAUw8De6
 ZP5yQnt0C03gmgU+2LFmXt3Su2N3COmTtVjjG7LBy1Yztc/F0NCgWvccENiYkm9p9vyJpYEZqmG
 A8UBNYWLGX9y46pbQ7r5ALzQr4nNRXTjQ0ZAKLI2NWKMiTyU9Y9mp/I8VFy2ts7umzQ0Vi6b6eu
 mtzJsTjFt00zVO1sLaQ3v9in/b5CT3+QkZ95lwc4TzSfvWwqYSh9OS47mMNgdiR9DgmtL3dISNp
 0V1f3h2VckPuo4tTnmAKOf2XkUe3ifQkL5NpTPCRNa5s4mmpslfreItl8sO6zvheuvTTcFN48Uy
 esVdmNfP2mIxlZwcD/x0uTryl/rvjUKEUeAgrgy1eGU7n7DX2Cx/uu+Ijc56/8QMA2Pj0sVXTp3 EJy0BDWi1/fPeQQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDAxNiBTYWx0ZWRfX0FXAv5hWsWUk
 308CLsHWfapD4ekhZTwbwdi8vPPC2a2587SflVosTT4WZw5BAI+7ekZznAQlwpSioFrdus4dhiV
 stIf2Xh4CeinIw3TdW3MHNtXv8ZVBPcBLgg0U+cBWcIjskqFtsqmOBbLn7/acK4Xtt8zYY4cIkY
 WSgmWben9FkGUOHsEf57wTfPtCiJZR40e5myWOHbmg3jugSeWAYjai6R1H9TQSfUvmvKErtIEd3
 ClLI3hwn7JqZRrDYjMWFMiNrk56UBHNbPHcyDs3Ue1jKUrzNekBvSyT/O/blTcBU8GPeoyMCfXC
 PrEMPHbVyWY9U7E/ofD9usJPYQbuOck0hYcHFjR14NqdK1C8WV0Z3eZFj8u7NfkQM02ratOufBx
 v7FCrcLsx3CAHlva0PPcSAmBjnUZDw==
X-Authority-Analysis: v=2.4 cv=BqaQAIX5 c=1 sm=1 tr=0 ts=6936334b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=vTE1kzb4AqIx7XBf0Bkr0A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=U79RhWn09M75MijRk9YA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: DZX9IjG9mdg3eNOeaCTHF1MhUv91mgCO
X-Proofpoint-ORIG-GUID: DZX9IjG9mdg3eNOeaCTHF1MhUv91mgCO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 phishscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080016

Initializing automatic __free variables to NULL without need (e.g.
branches with different allocations), followed by actual allocation is
in contrary to explicit coding rules guiding cleanup.h:

"Given that the "__free(...) = NULL" pattern for variables defined at
the top of the function poses this potential interdependency problem the
recommendation is to always define and assign variables in one statement
and not group variable definitions at the top of the function when
__free() is used."

Code does not have a bug, but is less readable and uses discouraged
coding practice, so fix that by moving declaration to the place of
assignment.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/firmware/arm_scmi/quirks.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/arm_scmi/quirks.c
index 03848283c2a0..4fb09bb8c6b3 100644
--- a/drivers/firmware/arm_scmi/quirks.c
+++ b/drivers/firmware/arm_scmi/quirks.c
@@ -218,7 +218,7 @@ static unsigned int scmi_quirk_signature(const char *vend, const char *sub_vend)
 
 static int scmi_quirk_range_parse(struct scmi_quirk *quirk)
 {
-	const char *last, *first __free(kfree) = NULL;
+	const char *last;
 	size_t len;
 	char *sep;
 	int ret;
@@ -229,7 +229,8 @@ static int scmi_quirk_range_parse(struct scmi_quirk *quirk)
 	if (!len)
 		return 0;
 
-	first = kmemdup(quirk->impl_ver_range, len + 1, GFP_KERNEL);
+	const char *first __free(kfree) = kmemdup(quirk->impl_ver_range, len + 1,
+						  GFP_KERNEL);
 	if (!first)
 		return -ENOMEM;
 
-- 
2.51.0

