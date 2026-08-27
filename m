Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719C34A13AF
	for <arm-scmi@vger.kernel.org>; Thu, 27 Aug 2026 18:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853620; cv=none; b=JtA0xvoShzrRw+Gqv9LoyeEcRB/qYAUUvZrnr9IuxdjnwinIMuR+IdyokaVE247lrnjMrFFKwOnxvT/cA++ZXbUxSiggQOx/G6CdaabPNDBAKPxGNO4LZL3AAxSPwsWPpWMBHQA5jUgWvQNwEZb6nka7FQp+IyoIVG1ZKsPVsWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853620; c=relaxed/simple;
	bh=evZqvwjAfpStMv2Htuq4lxgmNHVsv9xwkVK1wPRutP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IfrmzEOAtf5JSJujAWalOdbtQZHOfqaCct/H4z4DI0SKTV+Kxp5fGKYMUXIWI7gOkhoD1QZeI4iduz8fkdhoL5lwWcR1qbWRfeKfrnIeXf8V53UUE1qAqmHU18WFYMZPGzqnEAC7grnpvlm4Bk4t9K+s3ABhU6eLjUVg4sWEU9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F5VJpukA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QV07Sl76; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F5VJpukA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QV07Sl76"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXeus873745
	for <arm-scmi@vger.kernel.org>; Thu, 27 Aug 2026 18:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qrrfuWLil1sBb6og+uepTDULJhDr423OHDhRzRLmRws=; b=F5VJpukA8nWWoEm6
	KEH7FFOV6rDAeXspvFNaG51xo6w8ZQDOBPHNSX/LrFQsATXjoSxXFSBSGYqmN8ah
	QZ8HF2Tzjeg4lXRIfsPMXGoIJT4yo8UV5ZvfkGtWl0ax2ZlJaWObl+Ei3b2YTNoW
	zqZMnz5tO1JcHJf5cdC+l8zDIJJf6Pm6xTQMMi8ziln2xNGard/TvD8tIZ+P0ogY
	Q6BCwLer7SpDqOaT7NoLTpDAYkdDycnSOm6zgR0+nLhxFCe3TAWEleIsqFWUwNaV
	34RA+5UvTlJYumqVe7IW8oac8Z38UF29rfkkvycGdFTp0wmSQ4WKVGnwP6F+6/3l
	13bmgw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4garn0gjaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Thu, 27 Aug 2026 18:00:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1c057f480so178750a12.0
        for <arm-scmi@vger.kernel.org>; Thu, 27 Aug 2026 11:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853613; x=1788458413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qrrfuWLil1sBb6og+uepTDULJhDr423OHDhRzRLmRws=;
        b=QV07Sl76foRKCnMzIBNnTaQcBBWABQZh6shTwRo57uZcaNBa1VzhBTHSBjc+7EC54j
         8GmPuWF6SCVboVrQBzFhbqiyBuulTLbpe1uw2JsnSGpCtulAubUHsee8Qib9LTKKJ1sQ
         kyiQOzfzzlzhL2+dqaheR0eVtvNNhEFr+lgiv25FKq4fFWf+ibhLf4WFpK7JGsBKRsaS
         0sFMQ9JdwM50Agl1S4w9/0FJEIl8cxBx7yGluf00SLHqyNXb0QkWNQaX6delpP4Nv1yD
         ff7BTXyK58NFD+jPSMYLhoKbiLlc+BjbqCehET1ynUnOEyRGHiwP4+YV/h7BmRLGtmwg
         vK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853613; x=1788458413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qrrfuWLil1sBb6og+uepTDULJhDr423OHDhRzRLmRws=;
        b=Tu8F7hFqwNAHlLBv5ZRwr5XvBLWXj5By6kIzhOJqvOnM8eUS59pePNOJUREXyBtSmt
         tYI/nNzZv02flkTkT+bK3FbR6TlA77b6A/C+5cOA3hL0oJfkruHm/Qqt2NZVcoZUZf7r
         9fS+sOZSxAgZ/dt+Til1VBFIH6yzVHVRpUhuSqp7EAO0LEIQexXtG+qYABy3N8UsW/ne
         uJ7mANlitfwrTK4xMdBcRSNtWO88mw08bH7kMFnh50VT3qWb+Js3bnStIm0NWC3eoBey
         TilQx6KePzNK80Qu7D0FpbBY009gz2eZI7ok9WEn+MApdrGKcBBtHs9nHHLxikHjM24T
         DzEg==
X-Forwarded-Encrypted: i=1; AHgh+Rp/R9yMlDL4AGUv6Jw6khoglE5u9wkrO41SWG6QLMKlN2ZRABeIXHR3820TtLK+7iTE89NancjBgA==@vger.kernel.org
X-Gm-Message-State: AFuF++m9FYXXVtLKvM6GQhetEo0yIhxh+NUIieGkUadf+PZUG3QWuPph
	5NLLvCzvZKayLi/zhG5MXHrltajoN2Hpc0A8oWQlwmJ47Y/BzYp45papt/ZZCfANYR8p0FH8Sez
	+0di1XJEKLeRmV/I+J4uuyX+M2/LTuhjgysmqlj6IrEcJS5rqHLt2m6U5jAF0DA==
X-Gm-Gg: AR+sD11Fvf1R5jD5ATKgayF8OzcqdJuaTMfK1dCBj/950rEKjx3bXRCp725lqjNkGzM
	w1PnUetQMOCibySJtXYLXMcbNRUlHTm+wr2Y2iK/Vs38iOEUA6hiMTcj3RlJxlnA0Y+5SAnFVUE
	3hFwzNZdVfh/QeXF5TbarSv0ZbzbnTL6/3EL/AGvK9SsZ4DvoCFV0lFcx8l6X+78th43UCxGKNr
	vwf2BHvZZsNvH8yZ6fW9JoGE3gTRBgnP9s1Lj3PwnLUj8j5aqh+y7PLB0WY4Tvt5jm8dCT0rtHl
	mBo8QHzMZ4mDSKGaLAhvdwv7viMqJsThVFhx5+lhU8PqDrBp55hC7YvOgRVzNQHuWykLuEcUC+/
	iFcUiSqumwzXo3YN5OwlhO3cbwR2XrG9hcQ==
X-Received: by 2002:a05:6a20:b7a7:b0:3be:b0b3:3962 with SMTP id adf61e73a8af0-3d268ef9e07mr1288875637.9.1787853613276;
        Thu, 27 Aug 2026 11:00:13 -0700 (PDT)
X-Received: by 2002:a05:6a20:b7a7:b0:3be:b0b3:3962 with SMTP id adf61e73a8af0-3d268ef9e07mr1288711637.9.1787853612629;
        Thu, 27 Aug 2026 11:00:12 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a905cf38sm27437523c88.12.2026.08.27.11.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:00:12 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:29:23 +0530
Subject: [PATCH v2 6/9] spi: qcom-geni: Use geni_se_set_rate() for setting
 source clock frequency
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-6-091697dbeb02@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853566; l=3796;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=evZqvwjAfpStMv2Htuq4lxgmNHVsv9xwkVK1wPRutP8=;
 b=KdFxbJvcWSl6qfONQjLStiRv61vbIt8Jhb3N1xzP3igF569m4oAAYDp2Y2j3vj6Twd3akqVQ1
 UdZupTNLSC5Dxck/9WtwyVDWsi+sPQM65ZnK2Nmh/sQYq1pYpFEOFqc
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX4829cB7571pE
 rGRaNWry6Xj2I9UIiQNlnc5xb4qz9lFP4AfNEWuIPYCmh7lkN1lvwaAHGiF/IOqaB73WPBjDjCQ
 TjdvJ0mwLEE9ROXGj8qQzMBZrxldTVyqnoEQIzq8XbAC/Uggj4xpitvQMAiL6xpVIWu7ieuzrgn
 Nk6QmrLhWbvLx1NcqUSZqiIpqgRNxWZNvzH1XnbD7LFzhBVXIqvRyG2Beg5jal9ck2/Z1e0khsF
 2savPxd+raoY9H2YgBnYBOHYN23BxQ7kVa8ALyGeTzLHcsw1X/nbCK+L3M1xbcNov8s+Chaz/UV
 XZxtq6BLZugo4bNwrXUfzYc3d0h2Saxyd+T9AsLRowFCG/5v6tmkHf1j+Od3xEYrs7sF4O98wzj
 o8pJBbts5k7TmAUhODLqpWOdqO8i/89fCxBIi1l4EpEBCJE3NwMMnZrUUDx2YV4b/Lt9S37qYm4
 UHB4iFPUYVcL3bN3TYA==
X-Proofpoint-GUID: qATfM2VZf88BYc9D1ftQ_V8CosJFLdJ7
X-Authority-Analysis: v=2.4 cv=C+3ZDwP+ c=1 sm=1 tr=0 ts=6a907b2e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=V8jFpX-JU2fdHFI84kkA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: qATfM2VZf88BYc9D1ftQ_V8CosJFLdJ7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX46PwU98BBYvA
 0qaw2l8gCcK+uw8TOQLf+8G3wf1y9KNa+UPcnuGtXLQ1VUl+Bbvflsa7YyCAUhLYawMhi7mzElb
 ksODu4SkCcPnmWXt7o6afLDPmcUVeLg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151

On the SA8255P platform there is no Linux clock handler for the SE
source clock, so the driver has no way to look up the source clock
index and divider needed to fill the GSI CONFIG0 TRE for a requested
transfer frequency. To work around this, firmware instead exposes the
SE HW supported source clock frequencies as OPPs on the perf domain
device.

geni_se_domain_attach() now populates clk_perf_tbl from
the performance-domain OPP table, allowing firmware-managed
platforms to use geni_se_clk_freq_match().

Use geni_se_set_rate() instead of dev_pm_opp_set_rate()
so clock programming is handled centrally by the GENI core,
independent of the underlying clock-control mechanism.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 6566975eb24f..03ce9eff9c24 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -15,7 +15,6 @@
 #include <linux/log2.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/soc/qcom/geni-se.h>
@@ -82,7 +81,6 @@
 
 struct geni_spi_desc {
 	int (*resources_init)(struct geni_se *se);
-	int (*set_rate)(struct geni_se *se, unsigned long clk_freq);
 	int (*power_on)(struct geni_se *se);
 	int (*power_off)(struct geni_se *se);
 };
@@ -150,9 +148,9 @@ static int get_spi_clk_cfg(unsigned int speed_hz,
 
 	dev_dbg(mas->dev, "req %u=>%u sclk %lu, idx %d, div %d\n", speed_hz,
 				actual_hz, sclk_freq, *clk_idx, *clk_div);
-	ret = dev_pm_opp_set_rate(mas->dev, sclk_freq);
+	ret = geni_se_set_rate(&mas->se, sclk_freq);
 	if (ret)
-		dev_err(mas->dev, "dev_pm_opp_set_rate failed %d\n", ret);
+		dev_err(mas->dev, "geni_se_set_rate failed %d\n", ret);
 	else
 		mas->cur_sclk_hz = sclk_freq;
 
@@ -847,7 +845,7 @@ static int setup_se_xfer(struct spi_transfer *xfer,
 	}
 
 	/* Speed and bits per word can be overridden per transfer */
-	ret = mas->dev_data->set_rate(&mas->se, xfer->speed_hz);
+	ret = geni_spi_set_clock_and_bw(&mas->se, xfer->speed_hz);
 	if (ret)
 		return ret;
 
@@ -1161,9 +1159,14 @@ static int __maybe_unused spi_geni_runtime_suspend(struct device *dev)
 {
 	struct spi_controller *spi = dev_get_drvdata(dev);
 	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
+	int ret;
+
+	ret = mas->dev_data->power_off ?
+	      mas->dev_data->power_off(&mas->se) : 0;
+	if (ret)
+		return ret;
 
-	return mas->dev_data->power_off ?
-	       mas->dev_data->power_off(&mas->se) : 0;
+	return geni_se_set_rate(&mas->se, 0);
 }
 
 static int __maybe_unused spi_geni_runtime_resume(struct device *dev)
@@ -1178,10 +1181,7 @@ static int __maybe_unused spi_geni_runtime_resume(struct device *dev)
 			return ret;
 	}
 
-	if (mas->se.has_opp)
-		return dev_pm_opp_set_rate(mas->dev, mas->cur_sclk_hz);
-
-	return 0;
+	return geni_se_set_rate(&mas->se, mas->cur_sclk_hz);
 }
 
 static int __maybe_unused spi_geni_suspend(struct device *dev)
@@ -1224,14 +1224,12 @@ static const struct dev_pm_ops spi_geni_pm_ops = {
 
 static const struct geni_spi_desc geni_spi = {
 	.resources_init = geni_se_resources_init,
-	.set_rate = geni_spi_set_clock_and_bw,
 	.power_on = geni_se_resources_activate,
 	.power_off = geni_se_resources_deactivate,
 };
 
 static const struct geni_spi_desc sa8255p_geni_spi = {
 	.resources_init = geni_se_domain_attach,
-	.set_rate = geni_se_set_perf_opp,
 };
 
 static const struct of_device_id spi_geni_dt_match[] = {

-- 
2.34.1

