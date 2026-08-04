Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17C54921B5
	for <arm-scmi@vger.kernel.org>; Tue,  4 Aug 2026 19:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785873506; cv=none; b=rSd9hDQpooxm/AwbHE6jThOuik5fqtdk+FGgG5eBrQOL/veF5dJkSYl6hjw5wpHFzh5Lf7DkAi9Fml/p7Z0AsYOmzdflMqL0ROjZA4grSjhBRUPT9ounyLcfJ/1gSAJdZj+Gafs1jLq+/8Kx41bzFGvR1QQDloNIn81EGki0+2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785873506; c=relaxed/simple;
	bh=d6d0/DeGE3Zxr1kZjE+gOHD96ASmEQ3t8wnWQwXjT/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P/gzld7su7k2r5R534MzqlnDxi0VvZwiSNuEwcqpOoDF74wsfp1cQLpYJfNtanaIMkBbfv7/F1uQOgEZq87VIPVV44eOCKG9jzn1tJoXZ3wG3024hBUZaLI3GYV3Cdq2ZIkVvcRH7gPZyrLethc2pSUPzO6ZWAPsR0dF97sA+no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i83+yZKY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JPssm2RQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i83+yZKY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JPssm2RQ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674JlP3Z644871
	for <arm-scmi@vger.kernel.org>; Tue, 4 Aug 2026 19:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ph0ufNEa96Zz2A1aJhFqvsPdf+v7nzrhZzRMqE9cg4Y=; b=i83+yZKYwRtsQhH0
	QjNbFAVQXm9MSznLIyGZAjKTV08ZKsOgMZdV4VaXOh5Di+Ha8DTIgQ859+l620IA
	kDa9pR5BZU8Vyr5LM8kSZhBUK9p2ItpQI4OGXgVPSrO0RrSR5lNFtCtbBcAGRE4s
	gyHxYI2kfKFDApJZFx3RDZSVmPTzmYQ4z7sXBOh3LhAQlZOpQWwxeZ8CUhhYF67+
	isITaPHdpbWtR1+ESuqNM0Oc4GB9KrlplSvm9gXlVXw8MYpbkR9xHH6TPR8M4TCu
	LU9lZ7dKVNns0ghRcva0hZTJY8ayXOD2/FojToTPOGOOfSWqcR+Ur2QMSOcpv2td
	ewqxdA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fujwsh86h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 04 Aug 2026 19:58:23 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb733fc5024so175660a12.2
        for <arm-scmi@vger.kernel.org>; Tue, 04 Aug 2026 12:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785873503; x=1786478303; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ph0ufNEa96Zz2A1aJhFqvsPdf+v7nzrhZzRMqE9cg4Y=;
        b=JPssm2RQkv7N/h1FoX539m74lKjp8IqS4geur5guQdaUxeRgeAmY1L+kE1lIIRTrI8
         lR2nAV6o5SDc7Me6Cm74XVRh0kOY4RxelGCGFZHJwDTWtw5US5QalbhdMCBhGRuduX0w
         Bvxb81GVJNvDT8w0WXi+lgjz2daYDhGN0PhErDjVmx0bJe98Hv/+z9pL2qV4hnLn2cmY
         8JoUzGi2u/RmKvlYXav/3LuuHdzQ6gT713436yaSxCYsEP9LxRPjZn8GQIiXIfrHs7ZP
         l/U9/8rUWeT5vyRaGo5kOleoDx7ZOh8XDA66kIhAoI0N8qEJpO2j9j73vzwwL5BD09lH
         Juyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785873503; x=1786478303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ph0ufNEa96Zz2A1aJhFqvsPdf+v7nzrhZzRMqE9cg4Y=;
        b=DahBK3x2KWO5ljArvxuGot88XzJk1DQX2hM4svTyg99ZY5vHM8gp+jrC5Cj8QPJn/F
         o4c1+VImL9UV/e1TGujUE/RQjx3QzOeWPSPiPaIaj9sKKfqwnRJBsEeJyR2nTpZHnOI1
         WCKuTJG9R45qCxJOdGxoPIVIfIyFqqCD2IY72SrZAZal3OLPGrrlJzuxXSdRdY0frRRR
         gxeJohtB+5C+rMG5jHcjq3Nx0VTREOIxwaOEHaaKZW71QigoS6/f0xp2r4mQkRTriTJ8
         JvDdbuywuxHtFWCKbGYoZqF1y78TFs4auoD2NoBH8wVNqtXyJBS2mCNrnDqxe2V+5wPW
         d3tw==
X-Forwarded-Encrypted: i=1; AHgh+Rq1hpN7g5cQcwZd2fWwSYvJ3U+vmX36uTTQ96+9SEJcbIal7jVYuXxkJgMvJAy1um0vGB+bMhLqtw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt57nlwjES2lyG10VB96YGAfUx/bVW+OC/7BEbBgUdinEqVK1b
	YgySjHYyQhiiIYQCKLLrQaYZ2oBJLACMCthZ/Gt/e8zCvWbO6pLkrRb74T5Y3PNYxe+FMAYxSDt
	nNBsdswPPP1gLrdmRz5XEJtGbcwICJmWBZxB4DWCx5SEYYaGVSojdyzoGrdWDAQ==
X-Gm-Gg: AR+sD13X6d/bjzm/Xkog7H9isH1/UBc4nk4QD+upZRhzB15LY78FxgMRvIaHls+MMCe
	cTfvHRgUPFUPZQzpyudjudv5oYo0H6AqJtcLT0hHNsHqqkeJFRFnUvShUhepm74p/k5qQr5tiEr
	m/mzr43WCT6gpGNJvF00NVFHM7C0+C7QNlIRx1RPFPDB51sNGb7dGE9N1SY2pgrTnQncyXqBfj8
	nMq3yWDYUIKNy004zfFk/FqGZn2wcHGR7gnVIG6pWizb+KnhJBXmnskWPWj5JTWeBMHt5pvBB+5
	MKa/5/V/D8zYDxuaEVMRupgUdI2VgcsP45ahzA7iKIT1QQb7Mw6iaCSmIj7eAys4j89xfFbGhSD
	kIQBcrGYpgMaBI1VdxS+IX4Cg42Bu8K9cmA==
X-Received: by 2002:a05:6a21:600f:b0:3b4:5c70:ca3e with SMTP id adf61e73a8af0-3cb85ea36femr1324146637.25.1785873502868;
        Tue, 04 Aug 2026 12:58:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:600f:b0:3b4:5c70:ca3e with SMTP id adf61e73a8af0-3cb85ea36femr1324103637.25.1785873502336;
        Tue, 04 Aug 2026 12:58:22 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867a68fdsm12316636eec.25.2026.08.04.12.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:58:22 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Wed, 05 Aug 2026 01:27:41 +0530
Subject: [PATCH 3/7] soc: qcom: geni-se: Add helper to set SE clock rate
 via OPP
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-3-61171ab1cdce@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785873474; l=2843;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=d6d0/DeGE3Zxr1kZjE+gOHD96ASmEQ3t8wnWQwXjT/c=;
 b=RNrRH08KNhEECkTRpUjvpqBA4QDpuU4MFOR6NphuoK9WIbOI536zxIc00Xcl0m1Hi+lonCG0I
 v4CxIsNyDFKDd/zjHIjDqf9hTbWXzLaUKKnFt4oaNgaCk3pvXrRwR0q
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: HrBuj8Bdi_5IRlcZvwwx9b3QEzPjUUa9
X-Proofpoint-ORIG-GUID: HrBuj8Bdi_5IRlcZvwwx9b3QEzPjUUa9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE2MSBTYWx0ZWRfX0/+P7ALvpbSy
 0xRnGBtV2mRsXe+HnJ6A28ukDs2EbW37b8uwdw55M8zfZYlItbBb28fIWFSiyVKdJZjCEQwQztZ
 mij4RAudL/K6dejdA1+ZvA3Vh2Th1uc=
X-Authority-Analysis: v=2.4 cv=Lu6iDHdc c=1 sm=1 tr=0 ts=6a72445f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=590DCAjQX6RtSPayVpcA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE2MSBTYWx0ZWRfX52XmwFvKItOp
 KwOjcvAnAMo5DYPmr+yZk9CuybVIulTyqGwTfDDFdyCV+hPnu0Cgeq9iRBDzHgBLbt7RdtSSQK2
 KDWC11x0CPUtx1244JRXkn0QgWs3xi1xYcj5PLAp4DCyKU2inFU38krNiA11V2PcgpHfQi0guzt
 FuAuYBp2SVh2PwUjaG8TCtscjnvfubIjRxkUtlg+G0MnLMa31KmeG+cO7J/M/IRmr42PAZduPA9
 dSB4hlUpO9uHxqBSZf7z72a1gxVZ39j/H9BieMn6XbfqAt2JWQv0f6zfZHzGp98PT/JPl9BYsAe
 fX6rTdVYCQ0TKGsvol3hgekuwGddLofKXaZ9/5VB/VwCaBxkC1PPCSBSQL3S5XW+ES41cJAal10
 dcxGkxvs8AQJxfmcoqyQ4RXvupZE9DLLuasHt7arQTk31GBlt9NwfXl5TrZQ/WHXRbEkHkmfjvO
 b9e8Pk26WOnEYbAaUmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1011 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040161

GENI protocol drivers need a common way to scale the SE source clock
through the OPP framework. However, the device that owns the OPP table
differs depending on how the SE resources are managed. For Linux clock
managed platforms, the OPP table is associated with the SE device,
whereas on firmware-managed platforms it is associated with the
performance power-domain device. This requires protocol drivers to be
aware of the underlying resource management model when requesting
frequency changes.

Introduce geni_se_set_rate(), a common helper that abstracts this
difference and applies the requested frequency through the appropriate
device. The helper automatically selects the performance-domain device
when power domains are attached and falls back to the SE device
otherwise.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c  | 22 ++++++++++++++++++++++
 include/linux/soc/qcom/geni-se.h |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index a88bd092b87e..12d7cbc84d60 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1149,6 +1149,28 @@ int geni_se_set_perf_opp(struct geni_se *se, unsigned long clk_freq)
 }
 EXPORT_SYMBOL_GPL(geni_se_set_perf_opp);
 
+/**
+ * geni_se_set_rate() - Set the SE source clock rate via the OPP framework.
+ * @se: Pointer to the struct geni_se instance.
+ * @freq: The source clock frequency to set.
+ *
+ * Applies the given frequency through dev_pm_opp_set_rate(), targeting the
+ * perf domain device when the SE has power domains attached (firmware
+ * managed path), or se->dev otherwise (Linux clock managed path).
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int geni_se_set_rate(struct geni_se *se, unsigned long freq)
+{
+	struct device *perf_dev = se->dev;
+
+	if (se->pd_list && se->pd_list->pd_devs[DOMAIN_IDX_PERF])
+		perf_dev = se->pd_list->pd_devs[DOMAIN_IDX_PERF];
+
+	return se->has_opp ? dev_pm_opp_set_rate(perf_dev, freq) : 0;
+}
+EXPORT_SYMBOL_GPL(geni_se_set_rate);
+
 /**
  * geni_se_domain_attach() - Attach power domains to a GENI SE device.
  * @se: Pointer to the geni_se structure representing the GENI SE device.
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index 29a53bbc0dd4..3b411cba9339 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -596,5 +596,7 @@ int geni_se_domain_attach(struct geni_se *se);
 int geni_se_set_perf_level(struct geni_se *se, unsigned long level);
 
 int geni_se_set_perf_opp(struct geni_se *se, unsigned long clk_freq);
+
+int geni_se_set_rate(struct geni_se *se, unsigned long freq);
 #endif
 #endif

-- 
2.34.1

