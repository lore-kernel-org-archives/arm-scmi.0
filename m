Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABC84963B3
	for <arm-scmi@vger.kernel.org>; Tue,  4 Aug 2026 19:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785873499; cv=none; b=jvtk+d5ZgpLRcqVmIl3REVhPlg5+nd3QHUo8TLKUEes/yxNUPsM8o5VKUiEYW5x5Ce+U0UD6s2K1us1MSaAdem4ugyQkYgopBSJtZsUgdC1BtEDkhf7pxy4NoVYlIILCgpcWz76mgUGwTlVNU7AHxdOFsHbdf5mHM8zYpPFugk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785873499; c=relaxed/simple;
	bh=UR6FvUCG9wiIxYQw8cvvDSDDNjru80zRCyZU01bYBCw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XA33GCoFl52Vtqsfx7LGtBNxNVU6dWlyeE5ogXoqe7hgPSS7qwbo9cXxr+V5q5SrVgJHt/lM2jdhBW0OcxFvSwP6/ZpbqSW6KcFysP8Hc1AxvMD26xXygDmtthGI5JXa0PEdpcaqYPCfoKmTU8CUK8h9FSEB2tQZDNppMduBm8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AJ3a1LHq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SzWgiDbh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AJ3a1LHq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SzWgiDbh"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674JljQ4701802
	for <arm-scmi@vger.kernel.org>; Tue, 4 Aug 2026 19:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w+XWmxT7eNaCD3koYFfdeQEWbiqGVC+iSdEy/StCBV0=; b=AJ3a1LHqvqMH2AEV
	cJST6teVy2ObXRTHNeR4D5w8tl3fxr+R1Wm14RMOCnGSaWXlp0T+JRRynCg6k7eh
	FpTWWwlRokQPR4vrJUVfLCgY9/hto2ezeICQnHtzFzFwYJ/k2abjd+uHbDwwv2SI
	a7hoFwDW80UKdLYGY1PATGcT+955o41MR/pUK9zg4pPzHsXlcvV1kO910yQU9qWT
	jS2KjOQ5XHX0VEvnTwLdSy3dXK6zTk60K34pCJtAZ5J5m9Zt2CXqqbMk/oBV4APv
	2zUQGC3FMxJYZBaM5qZ2BUMu0/j+KHX+5ALEMoTj4OLUU2C6hKkEK3RQFEH9jIr1
	hsnELg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum3n8t3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 04 Aug 2026 19:58:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cf1c86963bso13566885ad.0
        for <arm-scmi@vger.kernel.org>; Tue, 04 Aug 2026 12:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785873496; x=1786478296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w+XWmxT7eNaCD3koYFfdeQEWbiqGVC+iSdEy/StCBV0=;
        b=SzWgiDbhiqryExhPWEVs3i9Q7r01Ec6pVA1dijAajJjYt1/76cWbOknzTpyJV4jsqe
         8lJruLKeGD3BsW+ZWl0CBjiazVJ5GQ/KUYeaJFgRDKiaHPX0c4imPAyUX41FpIYj84tc
         /FWzHR2DHMvoudHRRYZTAkfnYGjyOT3ASB2lVEQZWtuQJdXYn9VS4vKUj8i/HvG+4vUR
         q6Nk55CMO8EBM75I5ngoCeWNHIf+2VKh8eSdh8ldOVVx5nXyXw2jR78bE8q9eMQ7mJ+M
         bpiDIl50zn47XIo4J8FFrJ0w7WYNd0WFGIBRpkxnrxdwsbyExp0UMsrwXTl0bY8H/38p
         tP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785873496; x=1786478296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w+XWmxT7eNaCD3koYFfdeQEWbiqGVC+iSdEy/StCBV0=;
        b=n4281X7JTtju65p4P7OQsgqfwP7Q+9OY2x7U2uikogVdTVASF7vtXA0IqQocP5Y5Hk
         NfqEQMm8sNYu1OwWMDghdq8Hgiw6a9TbDcdt2JCz3ryEgnNxAysaOHjEB+7RIcz2QJWU
         cHWoxlS3gvOCFRB9J8tS33Njp2jF6cxOCMNigSok+lVuH3PjKzTGGLDUaKdys/Mo4UPV
         3z6sPW43MNv7o2DSZc1Vu2iWARr8M6WxSCOxqzrCXFEZAQz/w4A+V0W6apKILdFEDKG6
         XbYe0Y1BLy6q3T6Frc5QvFx2Kmn/r1NTCaXXlWQufIsDktBcnxajbtGRJCCUZZ2rfy/7
         h2CQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq4+g6Bh1rZcDY26zLoYdOLODEcWpeduynYKwwN1DYti3LcOzsVNWqqIYW3LKD5uywHirHaaeF5rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjdEcRpaiNnFqgLctD/PbBwmn/wAX0ZSk/QM91R6HWUmXYESH5
	cYKx6PigwBDo5X2rBsR4IP9MWu6+SK8jOiNSL7dANlr+yAi9QS6iVOboD7ixanHHbIkWh1I9Cmu
	LbiGl7rjlTzV+ZC0EPFGIIzzC75GizEcUELP+wqi81YzIz3w0EiaJ1Y7mAGyoTA==
X-Gm-Gg: AR+sD12sBdUFpFHkGKxJbIhvdTWWLKUY8Xqe4tV75vNxnNBA5TcZou73mL/urwsnd7d
	OnUdzvcXI9GhtDrV87LpUc33FNRaJgKJcElfZnGMsX38SgjqCpQTIjx4IHIYxbxmGgmVuCMugLA
	DD/N/HCTnop3/gaL1BDN2tNeX54vI9m6Zm0w+k/WsoYP6PJV2hnXo9hvWe7Q8RCM8pg0plF379T
	+knv/oBc/G0/qx0yh4FsFeCe0imtwONxZwmPZqeoQ6GIoQ+6mMSkxsEOX3NURYXBcuetm0YKSJI
	dNbCgdE9TNXPHhcf9FqQPjfjngd/fmbOuZrnDe/JJooT/2Y1GnkHIFlAGiZd31DxjMF9fnRlvvO
	QiB3F2OolPsLQbYPcq2j8vI5kYuYMCzwuNQ==
X-Received: by 2002:a17:903:2f08:b0:2cf:af20:4254 with SMTP id d9443c01a7336-2d08aa6a8dbmr51283545ad.10.1785873495890;
        Tue, 04 Aug 2026 12:58:15 -0700 (PDT)
X-Received: by 2002:a17:903:2f08:b0:2cf:af20:4254 with SMTP id d9443c01a7336-2d08aa6a8dbmr51283035ad.10.1785873495337;
        Tue, 04 Aug 2026 12:58:15 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867a68fdsm12316636eec.25.2026.08.04.12.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:58:14 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Wed, 05 Aug 2026 01:27:40 +0530
Subject: [PATCH 2/7] soc: qcom: geni-se: Populate clk_perf_tbl with SE
 source clock frequencies from perf OPP table
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-2-61171ab1cdce@oss.qualcomm.com>
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785873474; l=3331;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=UR6FvUCG9wiIxYQw8cvvDSDDNjru80zRCyZU01bYBCw=;
 b=zCRV0gVWHh5o+YZQvkkCfEDSjn1uTYmzgCLGq+SjASOfb1R0TN9zaAE0CGFOXEH3023I67L36
 TwCE1G7vFovB3Vy816ThYh8RWXdBbzVqn34a4d8uNp3d6Fq67UZmunp
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-ORIG-GUID: 9xHffDMju90cbU_oulz_ASt1A_k9KTAN
X-Authority-Analysis: v=2.4 cv=EvjiaycA c=1 sm=1 tr=0 ts=6a724458 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=CVJBOM8IPza3kUTEG1YA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 9xHffDMju90cbU_oulz_ASt1A_k9KTAN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE2MSBTYWx0ZWRfX39C4J4g7VVjf
 RsNiyVctnAKSmAW5U7NIQ+X7rrh6c/rx+5sMy+X+heVGq2DVwP2mCcUP8qUqIOf6qrzkGZyV80q
 F0fvt1E/ooQ+b8Y+8rn0YdvXIOjlMak=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE2MSBTYWx0ZWRfX0jGRTu34RPF0
 SV/Qlq9FySLMAtDCH0A3oMzDXEx/5KvebIhvakMumT0I2g9WwEnSX7FxViiN1y8cgsSGHB0fMz7
 wd7aRvm6cUQBvs8MO+CMLsrX18UVmE9YIeVWfXsGZRJGKJUwA6+aBcW+wkcUWUX9pn4pkld+m1T
 QdUvyWiabbO1GNAfUoz4P6417g+dwA/ipkpb8cOvn6oeVuMJE9nlfRPZKSdVkiBhIlMlolqlhiC
 0tciODqWILfYQSrOOWT52v4xxyF9PYbP7b6MGgj4l7NyLirhFDNWffPCYcy01R6wOuraIOurOwM
 5W6FT4ayM0mStxxztpUm0VmCxFIP8Hw615Prhje602CZzoyByhLVjB/YrSpxbTgn9a69AxrytYN
 HLHYiyNHL76LrW3PzRqZQ20W76JHQIbM6EXZ9jFH35ljUDEDEauNQC6+lkFZKBIqzROKdYiwvP0
 +a/5T9y6JesfWkeiAJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1011
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040161

Currently, on the SA8255P platform, protocol drivers attached via
geni_se_domain_attach() treat each OPP on the perf domain as directly
corresponding to a protocol value such as a baudrate or requested
frequency, and simply request that OPP via
geni_se_set_perf_level()/geni_se_set_perf_opp(). This does not allow
computing a source clock and divider combination for a protocol
requested frequency, unlike the Linux clock managed path which derives
this from se->clk_perf_tbl via geni_se_clk_freq_match(), and then
applies the matched source clock frequency with dev_pm_opp_set_rate().

Change this by treating the OPP table exposed on the perf domain
device as representing the actual SE HW supported source clock
frequencies, the same role clk_perf_tbl plays for the Linux clock
managed path. Populate se->clk_perf_tbl and se->num_clk_levels by
iterating over this OPP table in geni_se_domain_attach(), so that
protocol drivers on the firmware managed (SA8255P) path can also use
geni_se_clk_freq_match() to pick the closest supported source clock
frequency and calculate the required divider, and apply it with
dev_pm_opp_set_rate() the same way as it is done for the Linux clock
managed path, instead of relying on a direct frequency/baudrate-to-
perf-level mapping.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 873bfbd6b2b7..a88bd092b87e 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1155,7 +1155,8 @@ EXPORT_SYMBOL_GPL(geni_se_set_perf_opp);
  *
  * This function attaches the power domains ("power" and "perf") required
  * in the SCMI auto-VM environment to the GENI Serial Engine device. It
- * initializes se->pd_list with the attached domains.
+ * initializes se->pd_list with the attached domains, and populates
+ * se->clk_perf_tbl from the OPP table of the "perf" domain device.
  *
  * Return: 0 on success, or a negative error code on failure.
  */
@@ -1166,7 +1167,12 @@ int geni_se_domain_attach(struct geni_se *se)
 		.pd_names = (const char*[]) { "power", "perf" },
 		.num_pd_names = 2,
 	};
+	struct device *perf_dev;
+	struct dev_pm_opp *opp;
+	unsigned int level;
+	int num_opps;
 	int ret;
+	int i;
 
 	ret = devm_pm_domain_attach_list(se->dev,
 					 &pd_data, &se->pd_list);
@@ -1175,6 +1181,29 @@ int geni_se_domain_attach(struct geni_se *se)
 	else if (ret < 0)
 		return ret;
 
+	perf_dev = se->pd_list->pd_devs[DOMAIN_IDX_PERF];
+
+	num_opps = dev_pm_opp_get_opp_count(perf_dev);
+	if (num_opps <= 0)
+		return num_opps < 0 ? num_opps : -ENODEV;
+
+	se->clk_perf_tbl = devm_kcalloc(se->dev, num_opps,
+					sizeof(*se->clk_perf_tbl),
+					GFP_KERNEL);
+	if (!se->clk_perf_tbl)
+		return -ENOMEM;
+
+	for (i = 0, level = 0; i < num_opps; i++, level++) {
+		opp = dev_pm_opp_find_level_ceil(perf_dev, &level);
+		if (IS_ERR(opp))
+			return PTR_ERR(opp);
+
+		se->clk_perf_tbl[i] = level;
+		dev_pm_opp_put(opp);
+	}
+	se->num_clk_levels = num_opps;
+	se->has_opp = true;
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(geni_se_domain_attach);

-- 
2.34.1

