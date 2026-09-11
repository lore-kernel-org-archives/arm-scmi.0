Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C1E377EB2
	for <arm-scmi@vger.kernel.org>; Fri, 11 Sep 2026 15:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140228; cv=none; b=Xgw719T/cgAXDllleI9YwVkfzMo0yt6A/cVqLBcmQeNrRza7JYmqX7ATVldMbLtWK7489VhIoQLYewdf/ITQEORPQoDBLGAN9nFunpa8WQJsILN8POdsNRo+MLYBxc3bHsNSSM0NSVr69JT4kh0esyq6n9s0/8aTbNzPAuD/Uwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140228; c=relaxed/simple;
	bh=cHC+UHnFTXah7PYvHY5YC/sMeyCMkaCll5i3gjNsico=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p3Jtu3QRp8pxd712WRbiJbWXo+J1bCxj1h/5AR5WauadNi156BzrSaBO3Z0q69XgN4PNXuJbtYazESZ3bHYQmnejyS5r2wKQCLXi0eNsHH8eelTPWqqyVGe5FHJKu9+0y6o/+2buZT1Kt2f0+y2o7913V46AiXF1ZOGgeIWtYBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Suq9KY7z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gsVkBiGi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Suq9KY7z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gsVkBiGi"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmFxQ798940
	for <arm-scmi@vger.kernel.org>; Fri, 11 Sep 2026 15:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Urk/tOiIEwK
	LzYvti+etTD7iBNYdIx2xH64rRVioykU=; b=Suq9KY7zVg/VebW6W63FMbrTuJj
	7ap8NNkC4Lsuzv9kMMfAD/4qrM2tl8jxAe/P7CfqHEXFezJMEx93GLLUd4mYXgOP
	MYvLaM3AVLYi3qEn6EHYbpSAoKaKHoydQu5x1EQjM+5m8+FlnmjhShHvXbOb8CeP
	BCMP0JBc4ms6YpO4HoYFpZst5TSnmCXVv0LiCae61u4gTCfHoJo9FzmBcIU1hx6u
	F2hKMEQhv/553GpVDCLEvyMYAhZ6UUsHiQlc1fGGD3vZQQTzfgbaGXGGc/TkaTcO
	QLyW+Io1/xtaBj6k6Vf8sm7/jRYPc4YoowZijbeEXxnHdYIyBdGud2O3D3Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm2q147n6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Fri, 11 Sep 2026 15:23:45 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-790376c9f8cso212174137.1
        for <arm-scmi@vger.kernel.org>; Fri, 11 Sep 2026 08:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789140225; x=1789745025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Urk/tOiIEwKLzYvti+etTD7iBNYdIx2xH64rRVioykU=;
        b=gsVkBiGi8mYQNwwZ79oTRM4+uR821CeYsX6tfGY/+CT+JFASSWnhknPDU6SGt7zhIs
         rzbRMZ2XZt6JmfRbQ+cNVdB61lUuhZkaevur3a3wv+EEYHGKCvkufird7jiPx4W/skTy
         qNga9DnEZnsXYXG5Mlxd6hQQSk2CFIupBIgVA+RvdKMCXxdLbjrG7kIFpxiKD2Itw0l9
         41/GqGl7GmyA8qojmFdTMoLRTT+EFIbM5ADqKpBsIydR40yLTmH4gaqPysfPByq//u0b
         oJ9UPb3u5IUgx3BdpFiuAWwyvHab2L85V1oTGO6QMbnire8tOrvUdlCQxEVmuEnjdrEX
         IJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789140225; x=1789745025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Urk/tOiIEwKLzYvti+etTD7iBNYdIx2xH64rRVioykU=;
        b=gSlGF3nONQuulXDMswAJS7pqu+YJjtWuAW9xnHee3NtDyl+/fQWSmQKkkA1ftjYA3E
         pbsq8ERzHSd6SMKTJZodm8x1usH/S5csVsbebf2go0cj8FYcnBxWE31bHX1uVJh3rrMI
         rbbK57O8Iv6iGJ3JoIDCzr0iP107dZWxLDYjIwZtWmp8QOKfbw7YpDVMllDYI2KBL+De
         K4yq8nJnJ0sPpHJoWhmDawaMGP9t31MJoJmoJG9exYXGG7k+7S9DZeA4c1lsemN/7wGe
         xyOyrN49O3QvEFnYzHPjHcC0FjzQImUcCsafgqZP1w4tAYsC2PPbK8+GaqwxoQuHCcn6
         nmfg==
X-Forwarded-Encrypted: i=1; AKwUvBz6vla2aZF8WaR0z3/WqKF1HzkIFXZu89949K3y5FWgCwBHyvHWrb+qKXl4Qy9zofoB26Qsq1cDmA==@vger.kernel.org
X-Gm-Message-State: AFuF++nA1Px36578zsIMX1beniaHrbXoG59TGdAArc7T0jFJfQski1Dx
	0kW+MTLabH/rWNLP8y04fQXf522LuNxVBKGMYKP2qNzk2MWjlG+oH091VA/He3ePyoMb65RsoF/
	rqDgUJi5W4nmrY9v6N1YeLbxUUtBNwDZi6+jbef2x755ukyaSkV0i4FBSkxd9Tg==
X-Gm-Gg: AYBFou0W4g2f1SdxhrQ3bupxPLk9J0jaGb/YVZX1sbeJedRfZLDKXiis6Y27/ESCSlv
	n3njTBsXsxMC4YEx8vIosO38mG06rQsEK55e43L6A3ry8Lo5QP2EZ1C354L/Q5ILjzEeWBAC8iN
	Ul9RclBg/O0Szb5ox9Iu/JrXy7YamcfGFokd73h5Ht8h2OJHHaBOQx043jZrIDtSpllIpET2FIb
	zdvRzKu3reVc4ZigPEq3/psN6ZeKqXA2FnaD8JozNfgFxUgTLEmyf0K6+UjdzuU1yScapzwGEFa
	Qme7sLkZ1fJJ+s+u+F4wVGkY3qLF1QzwPpOLFC2IM2o7Pjn3v0GmBa5vW0BKSWoiu8KOAXN42ci
	FHRAeKXZeBb9E+qLO5Wr7xtPguKgR6jb7JuyXKNKVfW8eEHOPwQOWW5G/+Ir6GI57zpYS7f+4Dp
	96IqCyaVSq3yjIMV/BP14yBRrdQhYsRcMTm1+a
X-Received: by 2002:a05:6102:a191:20b0:786:724a:4e94 with SMTP id ada2fe7eead31-792aa571236mr4941221137.11.1789140224557;
        Fri, 11 Sep 2026 08:23:44 -0700 (PDT)
X-Received: by 2002:a05:6102:a191:20b0:786:724a:4e94 with SMTP id ada2fe7eead31-792aa571236mr4941110137.11.1789140224027;
        Fri, 11 Sep 2026 08:23:44 -0700 (PDT)
Received: from t14s.space.revspace.nl (2001-1c00-2a07-3a01-8e96-3679-0b9c-de47.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:8e96:3679:b9c:de47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296614323csm94042566b.59.2026.09.11.08.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:23:40 -0700 (PDT)
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
Subject: [PATCH v6 3/4] firmware: arm_scmi: Fix scmi_protocol_device_unrequest() race
Date: Fri, 11 Sep 2026 17:23:28 +0200
Message-ID: <20260911152329.5822-4-johannes.goede@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=d6lgWhjE c=1 sm=1 tr=0 ts=6aa41d01 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=EzzhlMzFHTv8R9URApkA:9
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfX1Q/seldfpYJt
 W0/JoeIdtglEruIP4yl5gYRP98WPI06rbfFtP6T2cSIexCTv+LAwwrxeF8RnGcEE7+yQndjEYLZ
 hdPttlYDkxNjb/j1Q5npAAZsR9GYrniDhU8iDOITFJcV57SKw/f8UG1Kixxx/q2L28ak4kI5xDX
 tzJWV44oRF5YHmiwDsIveWzh0zPKQW4Chfjks73s1vlh9xIq8xP1PSQ9my9WCxiugQgqG3e+N6I
 ZUxC+KxmH43ifYCKM8ica9oeSXFp0n60Bo0aBzgDyBTYp3HS6W7ZlX/zijD+ON+JjLte4+Zzs1F
 zIHJfoVIUgJfg8ayxUJRXPoaHJuq2mIhHDg/hVCWJuVPwpebuLkypVXfZ5kZu5DqHwFV8wpoltZ
 MLFkwU+/isfS5QxHtDH7BAXeJ6yq5/JycgtCMRxY0SEGkmzBA21lnB3ML1/dnvtqFkocZCD8eeZ
 poZ0FI3L/wBht9jhuKA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfX0nPoGm9pubdZ
 Ajsi752NpBP4zYN479HsLti+JDuv+ax8+VWF9XMWH5xsdFoA4OSIldmVjewE7qtAhmQ1kJOjCRw
 3JhSDRM6+NesSP2Sf4DgHhoD0mzX1Zo=
X-Proofpoint-GUID: R4EBUiyMxcssXqvkG6wuuNs28nvDfWZg
X-Proofpoint-ORIG-GUID: R4EBUiyMxcssXqvkG6wuuNs28nvDfWZg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110214

scmi_protocol_device_unrequest() unlocks scmi_requested_devices_mtx during
the notifier call. During this window phead might have been deleted by
another racing scmi_protocol_device_unrequest().

Re-acquire phead before cleaning it up to avoid this potential double
free problem.

Fixes: d3cd7c525fd2 ("firmware: arm_scmi: Refactor protocol device creation")
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v6:
- New patch in v6 of this series (Suggested by local Shashiko run on v5)
---
 drivers/firmware/arm_scmi/bus.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 6f667e4ffeed..651d4ba06574 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -173,7 +173,13 @@ static void scmi_protocol_device_unrequest(const struct scmi_device_id *id_table
 			}
 		}
 
-		if (list_empty(phead)) {
+		/*
+		 * Since scmi_requested_devices_mtx is unlocked during
+		 * the notifier call phead might have been deleted by another
+		 * racing scmi_protocol_device_unrequest(), re-acquire it here.
+		 */
+		phead = idr_find(&scmi_requested_devices, id_table->protocol_id);
+		if (phead && list_empty(phead)) {
 			idr_remove(&scmi_requested_devices,
 				   id_table->protocol_id);
 			kfree(phead);
-- 
2.55.0

