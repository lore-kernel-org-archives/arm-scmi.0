Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B814C6F10
	for <arm-scmi@vger.kernel.org>; Thu, 27 Aug 2026 17:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853598; cv=none; b=QpPomvJf6dSFAjgj9nnBChElFkKTKy75ZqppxSPqG8kPLS2NWUoEW5K+9D1zuzvZ3GoNa4R8HvrlD44dVTPJqR8grATUwPeMdyMYSH7awcMij6EHvdGOs2vs6d2uUXbyyQT6tSZ7OSUhsod1Y2RmCHWXXG27uKxT3SVGbKgPoQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853598; c=relaxed/simple;
	bh=zHylj+HT+odz16Na0xE7+fHmSFeJfsDp+dwqk6ejkcI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YloetZW4rj6VC6zMqYANpKkm8nvdxseAw4dpznODlshAgbqGPV/9xYSWmmHjJv/2s+7SfjX7tl/VQkOl94m+y1A9IiUpSYuCe9bMK7yhacnzYbdmNDYk9mI/pl3Xbzc9gWMl/N1iHbhc9uKklO6mHNnp820jk74X5oyEM5f/AGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UAtJCKHa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LHFDF4F+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UAtJCKHa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LHFDF4F+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXdAV4178296
	for <arm-scmi@vger.kernel.org>; Thu, 27 Aug 2026 17:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8DOW3HbgGxcyvtK23icwnWTlfQLNr+HRAry9Zia2hG8=; b=UAtJCKHa6Dlsrkq8
	uWFqMs46OBjwNq6g9FnkPBpJl488R5DLKm++C0kjfwVtzxuNlxpaafcQ4VoaRrlS
	mA2d9H2gUf5Nmmvii1ZPx00Q/uDTBX/7plimlKWFBSD7hRZT0RnBRARzsGxx+NeA
	3phMoH8Eo5ANlDVCTuPAFi3giUTGE1hC0mrwT/OSb2+tu8QV1ZxJWroKmhd3nKNt
	hcgpn8nvFAp7iFiPCe2Aa2+PiwVCP4iygoaE5H+a/7pmD6AQg/HaCpxWl/hG4yr+
	E1r76PtkevP0+otO/ir6wSkkN/5nTBK98XFezGZXcF/pqh+uv5uJnuBWozQgDyJw
	MzSJnw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gaphw14tf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Thu, 27 Aug 2026 17:59:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso257130a91.2
        for <arm-scmi@vger.kernel.org>; Thu, 27 Aug 2026 10:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853594; x=1788458394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8DOW3HbgGxcyvtK23icwnWTlfQLNr+HRAry9Zia2hG8=;
        b=LHFDF4F+/GukJhVla5K/mVl0GhcwF17l5byzecDdYybmQNNQw97Zv125v43pcdJPT8
         ye6bwU2PR/JXmVh39Qa8KNhUvqpyVefdCbmzK2m+ytNkR2v3FcXq3Rd9iuUqVW2EmGm6
         c8U33LrJVhrHR9/XQ8QBz4jlPHlR5PY/w/ax/FnyjK7k6PQJF4fdt0IFdjQ0ym5DqcOS
         5cgh0YVO6319Wc0bHmmtf/dQa0UC9FH7qiuTuDEfl/b+VXaUN07hZtqh735XdJraXO2u
         CIHAfdvEU/CULOOHUzHg86+uWDwe+52wZjz59eAsC5nEwE3lbCKf0PtU59dbZp9caKS0
         atMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853594; x=1788458394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8DOW3HbgGxcyvtK23icwnWTlfQLNr+HRAry9Zia2hG8=;
        b=Cms1n/NYjX9qXG3QJXNA5dvemeD047M1S/OqtjjxDN18VDFKIwHPwlSznNWgL6x4G0
         6XgTDn4BM+HSnIP0TYMzZORYm8m/k+9zJJwXrmGJz/iSASNATkyK7x9RxaNZcl0o15mm
         ucGn7g7BsEUMNZbTQvMJpLdNaOMCy4l+XmMdwwdNcxtZ/o8WS67wdjDtVo8waV4noUZn
         eqi0T9wVDOgn1aeskLtpkAGACfJGe7TZodPpZAKfidpELZTtIiJbd9Twm+3P9TUm2dOD
         r1cbRwHp1pmv7ctWikz45VDMX5C5p81GYczIRsIGa6ZWLrlwKkH+yh73rf8kZcWEsmJj
         U8sA==
X-Forwarded-Encrypted: i=1; AHgh+Ro09xe3VfssZaHlnXCbkK50t++Yb3TcR0A8xTsA8GiDDUkh1Ab5jKToAlu0hQo+XZ2IkZ7JRUKUGg==@vger.kernel.org
X-Gm-Message-State: AFuF++m+SB08eRFE8yMXhXkzYshq5DXgP/nuQVPbcg56XI1E80bG7W3L
	88N8yT8sBIGO0NrFNdyXTaug/WO82caXwfC9HGCrTTPRveNP7BZwNinqC5aqgbaPJDBTVE0LWu4
	kZZIYforRAAjABbJI/M/IcONff2FCge5ITzhywle8dMzwxsT6djZudecTAzWgRw==
X-Gm-Gg: AR+sD122zyF5JOrs7hlWTfc2mALuHts1ujo3N+LwlzNW5MkPOnkgdelnFNWCZEYffXV
	TrTKu6zQlVuHwsOfJYxCe0iH+efZtoRlj09XsCZd/c35ZVydjnQieI1K1l3EnRycduqGCEhf8EI
	t5v99Y65j7985oMJwCv/xsAgpm4d9wvWRbP7eo5TKzlYV8+uwc4qbUOwp9EvoRQAAdvKxLD/xkg
	MrsiauH6lTy35P0YjiU7c7Pr3uAVOPBAzbFQzi2/YZS1Yg9TReImxBGscz7sdXESxKhp/xCQ0k4
	rljCwydtnzGHUZiNre6l1ywH7qrYK3OyrAM6asiV8xjqF6eI3sahfveebN10kBCWpYdOS0l7PtD
	XLkNYxws5qISBe9FkQZLXBmDTPI5ywx24kw==
X-Received: by 2002:a17:90b:2d82:b0:393:194d:5366 with SMTP id 98e67ed59e1d1-396d0f6f8bfmr1853263a91.10.1787853593472;
        Thu, 27 Aug 2026 10:59:53 -0700 (PDT)
X-Received: by 2002:a17:90b:2d82:b0:393:194d:5366 with SMTP id 98e67ed59e1d1-396d0f6f8bfmr1853160a91.10.1787853592820;
        Thu, 27 Aug 2026 10:59:52 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a905cf38sm27437523c88.12.2026.08.27.10.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:59:52 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:29:20 +0530
Subject: [PATCH v2 3/9] soc: qcom: geni-se: Add helper to set SE clock rate
 via OPP
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-3-091697dbeb02@oss.qualcomm.com>
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853566; l=2911;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=zHylj+HT+odz16Na0xE7+fHmSFeJfsDp+dwqk6ejkcI=;
 b=w7NHm9ePtmCqH/3jPw8yr1znOlCotzsen4mcclKd4jYwSgqnAUCwLzywWanOrvCDjLjvkCNPx
 uioUNiPLBtcBegA9YNEWcnR0C9gm3bYAbB7KKI7C4dmnOjgoYDu3r1+
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: -uftSgDOPSVC_y89OHbjtrP2YV1Fn0oh
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX+2hhqC4iHN14
 +TL1M1MrB0aqwb+XmgXJ77VpFFU/caFDqcWDEV2mpG/ctDyrv/1xki/f6OpZHouMN+tZW5IUkmR
 P7LA1I/EacE8fQ89aSyzkxdhgV8cBh4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX+naRJXf9gd6l
 1ttOKGvyr3uGFjooZlFwZgGBJDBKgdQjEFtMwk9G+wwD6Tv2p5s2NQf/RtdyjfH7iXajpXUJlf5
 Rn09jo4ghORldWIIj1m+IYSoJ6TXAEOodLE3BmxCVnrxZ2tbZLVu3m8Pv9TAq5/JwOorxion6TL
 GteUSQ5c7RpXlM5GuDb1fexRrzmTqtlaemynMaZNtWVa6wguaR4eudgTe7yZP3tfK7r88q5A9Nq
 pqf9HwYCENLKPxQTvoBeROndGn4HpudHkP8X5lZBiLwVQNSLyy5JNgDVpMdgMRtE0VCa67Db2MI
 JLDUUDzzF9iHmOUzBHHpwz0sXzfwaGo2qyShmXfEFOqZTm+bI/e1zSvDaEqBwNGkttRrab4+GSW
 AdYgVsDzR3flBnPQ2StoD8chHnTrCiUpFqX83v224WvPcDM5BiGv1UooT3gbjU6Y6SAocYIZLLX
 gEhllKGonNA6VedVXRQ==
X-Proofpoint-ORIG-GUID: -uftSgDOPSVC_y89OHbjtrP2YV1Fn0oh
X-Authority-Analysis: v=2.4 cv=E8b9Y6dl c=1 sm=1 tr=0 ts=6a907b1a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=590DCAjQX6RtSPayVpcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151

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

Acked-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c  | 22 ++++++++++++++++++++++
 include/linux/soc/qcom/geni-se.h |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 447b9cc6babf..04f58a6f26ff 100644
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

