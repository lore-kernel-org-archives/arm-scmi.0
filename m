Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AE14BCAD6
	for <arm-scmi@vger.kernel.org>; Thu, 27 Aug 2026 18:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853630; cv=none; b=E38qmCQPMIPo/U7SfFzKefRdTAnyVRaZHeTqsZdWdbAdiq3LIltoP/FU3oVwmTRj9/9XUyOIJSnkz8jrwRm4gUnSNzH7X+JrmUTy6JUHYEEF13ElDfqHwaPj+OMKbsBE9mrprqcbtETtVz4Nx3h5SxMvEINuWTt6SzI/E54XbHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853630; c=relaxed/simple;
	bh=UFbtM3Wi59vHG7aQiqHHkhJP0XzUIMUsc/8Fo4UwloU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T4xMdZxp0IRHFFTrV4GE4sp0n0acXZ0orhaMM1twBzwmntHNWVbPxWw5DL2aTEQU4WftJwOEKRVcs3tHUZm1yh4d/tB3xttQzMXT/Nmas3rXMlb7Se0h0NP3tYkbYWo/LczVloHZxDmfOQfnb1QkL6TavnLWgyXp+1OEkZvliF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=og+R+JU0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bkae4TtW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="og+R+JU0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bkae4TtW"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXdVV553708
	for <arm-scmi@vger.kernel.org>; Thu, 27 Aug 2026 18:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gOQ6tcmRQHIn01iUxXOVIhspNTiTc1cqfMZOOm1oy+s=; b=og+R+JU0M/Xyh+NY
	il8boC8rRpr2LcJNFgKK3uRjBgXrJCotMPGRzS+MKtXlD/vZfvpsqYTwNZL+n74+
	ZikFJENA/nvVdHFCghsFjUHOYMG/7z1OEn7f8opKvUvY3g3OHMpXFgjTKkB92S4j
	DcuexOthjFH1MABKMS38AvH3ZESEbwesBPWJdh3Kg2eWXTpaZbk9sNzCVlCXHj7E
	e8KvOzxc6zjzbzmYrYzd7Fh+6jT53jFWBAfCrXmhuEr85be9WLgxjicnPaw1bVZW
	+xHpQlVtcJ9N7+6JXpBwLkAJ5fKgJycFGdRzOVgqXtTMZNK5gcLrod9DWUddz/JF
	g0WH3A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gam6fhqj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Thu, 27 Aug 2026 18:00:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so257686a91.1
        for <arm-scmi@vger.kernel.org>; Thu, 27 Aug 2026 11:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853622; x=1788458422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gOQ6tcmRQHIn01iUxXOVIhspNTiTc1cqfMZOOm1oy+s=;
        b=Bkae4TtWpZlXXpR1X9WgOwIUQ5N6V5hc8rzDJFI31/H0T6PjR3edqPkMfm1UplONB/
         6uq13zx0nf1uejA7oud2Oi3/OqGcplEU4P33AAX0Zy52lm4PXzhxCUpPmI1aN75bu7W4
         9bIpPkVwpgLSk7EpxE3tWtIu1izoIcZD9OIpGOo22u3v9byv0PP9P6TUz/HwaJMmGvbf
         Yu9ONW6hh4Ov8FyR2hA45X+J3iD1FTByZZopnH5UN0XmcB7G1n3c+AfJ+u9GHZuniTp3
         SOcveLDfZj9jKMWEltnft5+gm8XkyGfITJ4FpGhUQ0U+AGcq9BNi7MChYLWC3yhblAA1
         vR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853622; x=1788458422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gOQ6tcmRQHIn01iUxXOVIhspNTiTc1cqfMZOOm1oy+s=;
        b=bEHn35Fwf5AqYyebjsrzd2QIkv17VuoU9dzvLXwNm9sjUG40xvg48Ot+YIAGev/Gk1
         iZr0dtd+vge4uXpXrL+y+b8+rPxwwbD5zhHyorQIGyBgSYC98x0ABAbfNiN8/6xGFSFF
         S8QdSR6VkedDUXVKilZTGhlgEIIA6Dhmz6MwXTb3Ct+5o/n098R4UFsHXToxbMhCSdsF
         X8ewvu2s8kHY/Jg2CJ73t2Gt2/HivBoToQ/PcyvLr541FSJOc9+lRUn/Kt4dxV1sTYO1
         +I6vm8+b6r0GmdCjdluv65Yt4pkc4xL91CmFRcS+yaoX+SJBUhxUNqlX8urhsUWJ9XRM
         eZ6g==
X-Forwarded-Encrypted: i=1; AHgh+RpOLICD7Z1CeiuOeSYHz7LXsByi9B43rhtzfUQD5s9ppp1CM/XypfvM6ejgUeZHk2QeiCeoq9EZJg==@vger.kernel.org
X-Gm-Message-State: AFuF++k4q5Qe1On+XxOMevgekNw3909a76oi9mfNjsrLI2WJoOQG6Um2
	WqB+tXRMPfYaj3E76r5aU8JIIA1kYolxkVIcm1bej+L1PxoR+5nrvw8y/B82/buDdkR1hkfkecS
	uaAxkBDttTNemSuewQtlFMnRvii9kgnFfYNaZbDIfywXbtoSL5QuCWW8njp58fg==
X-Gm-Gg: AR+sD10M2QfsoF+56rJkynNR5J330TscaVs1W7LcJ3DNdKYcPBjBtEuxak865TQ5FTO
	CzAntONX2koJiqbeGL2Q6+cT3SVcl8gC3Nuq313hqU//Zamn39pfyWtGiAzHUGK60E1p7abkcsv
	fv7HfqGfFXbVPBX8/USRLgM5kj8cycT4yQvBt+eTBDnaUD1v6Kj2xH6sxlkx+dyoA2pi0/NKbMq
	GBaVrX8fqaKFEzw5wG4F2JSYHpsdLVGKsMo2M06Ew8rscKl2l3h4Or9FQJWmByl+F2De3hTjdwu
	BPgWkE7uifTmSApornhzEhc58oDwZVNfSZPbdGoZSs+z55w97DE0MGqq0ORXhagT4m1Pntp8N3D
	HSoJyQM9k931H9DNT7cfirgPMvI2hD6veVg==
X-Received: by 2002:a17:90b:2d82:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-396d0f2f709mr1910678a91.11.1787853620686;
        Thu, 27 Aug 2026 11:00:20 -0700 (PDT)
X-Received: by 2002:a17:90b:2d82:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-396d0f2f709mr1910262a91.11.1787853619265;
        Thu, 27 Aug 2026 11:00:19 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a905cf38sm27437523c88.12.2026.08.27.11.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:00:18 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:29:24 +0530
Subject: [PATCH v2 7/9] i2c: qcom-geni: Vote for SE clock rate using OPP
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-7-091697dbeb02@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853566; l=3900;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=UFbtM3Wi59vHG7aQiqHHkhJP0XzUIMUsc/8Fo4UwloU=;
 b=SuK46GH8fU7Buoy8TzORlm6WEiTSHXMtcOF2tPugNtpZDBh4ldOCJthkNf1e+NaN4d1ZK5Edy
 hg5t7jDP88uBZIMEGFemCXKBci5gBezainJ+OKoU0BCFjS0noAt1+I5
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX8pIBt6bEUYJg
 eJr9zkY+XCNlAdFjqANvZtxKcA8bO0pWCjvmQ/IKrl0fK36i8BR34b/r+p41PcbAPZamDCQmz8o
 TnyYV99CV9dOUaM9mbGLDq8lbRM1Bxw=
X-Proofpoint-GUID: 26zJ0mARt_EYMfO765elzNeM7hpULg2I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX6qVgnMkNRRgH
 Y/g2TxbxzC0lJ1PUA87d5/mTYTYar8LTR53IJRRmLyA8R5PAYNs3fYSvgBRZPfntlAeIISevZZr
 sM6P5wjtNiez6+vTkluvvZQXU7EBH54+f4Ocf+LlPcLmVzt2lrAwPkoK64MmB2jIsLQQ+8PzP56
 OqQSLFDFPlQCcxaPRDqTCJfTWvfjW5yDFoLakKP9uFkycGQxwb+dXrhq3VGkHTHZdNW++cBvYRw
 Cs4maFzSMidQwk8hRHhBnvTojvAjGB49+KHdGjDRSyZ2LEiEwArHqfr8qa3JpIN2m/I1nd4w5jx
 KNkcStGVMj36/2YtpM0rSxi61INgLc7ELmh+L4HJfqwIW6Y2K1+6M3NxaUseFj687i9h4rD7bli
 IVePlP/dD2chV5Av9lFRJepIjIrnpHCRVRu3c7hepi8BMNwLHC+Ap6XhmpeSegdClJPBJl6wJao
 x1VSy9hr/X5tRey7BAA==
X-Authority-Analysis: v=2.4 cv=eIgjSnp1 c=1 sm=1 tr=0 ts=6a907b37 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=YnqcSKFZeAXWn-m59-0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 26zJ0mARt_EYMfO765elzNeM7hpULg2I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151

The I2C driver currently assumes a fixed source clock selection and always
programs SE_GENI_CLK_SEL to 0, which is not sufficient when the controller
needs to switch between different source clocks.

Add the source clock index and frequency to the I2C clock map entries and
use them while configuring the controller. Request the required
source clock rate through dev_pm_opp_set_rate() and program SE_GENI_CLK_SEL
with the matching source index.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 35 +++++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 658636c1ee0e..a3b7609e3cf9 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/soc/qcom/geni-se.h>
 #include <linux/spinlock.h>
@@ -165,8 +166,13 @@ struct geni_i2c_clk_fld {
 	u8	t_high_cnt;
 	u8	t_low_cnt;
 	u8	t_cycle_cnt;
+	u8	src_indx;
+	u32	src_clk_freq;
 };
 
+#define CLK_19P2MHZ	(19200 * HZ_PER_KHZ)
+#define CLK_32MHZ	(32 * HZ_PER_MHZ)
+
 /*
  * Hardware uses the underlying formula to calculate time periods of
  * SCL clock cycle. Firmware uses some additional cycles excluded from the
@@ -180,17 +186,17 @@ struct geni_i2c_clk_fld {
  * source_clock = 19.2 MHz
  */
 static const struct geni_i2c_clk_fld geni_i2c_clk_map_19p2mhz[] = {
-	{ I2C_MAX_STANDARD_MODE_FREQ, 7, 10, 12, 26 },
-	{ I2C_MAX_FAST_MODE_FREQ, 2,  5, 11, 22 },
-	{ I2C_MAX_FAST_MODE_PLUS_FREQ, 1, 2,  8, 18 },
+	{ I2C_MAX_STANDARD_MODE_FREQ, 7, 10, 12, 26, 0, CLK_19P2MHZ },
+	{ I2C_MAX_FAST_MODE_FREQ, 2,  5, 11, 22, 0, CLK_19P2MHZ },
+	{ I2C_MAX_FAST_MODE_PLUS_FREQ, 1, 2,  8, 18, 0, CLK_19P2MHZ },
 	{}
 };
 
 /* source_clock = 32 MHz */
 static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
-	{ I2C_MAX_STANDARD_MODE_FREQ, 8, 14, 18, 38 },
-	{ I2C_MAX_FAST_MODE_FREQ, 4,  3, 9, 19 },
-	{ I2C_MAX_FAST_MODE_PLUS_FREQ, 2, 3, 5, 15 },
+	{ I2C_MAX_STANDARD_MODE_FREQ, 8, 14, 18, 38, 1, CLK_32MHZ },
+	{ I2C_MAX_FAST_MODE_FREQ, 4,  3, 9, 19, 1, CLK_32MHZ },
+	{ I2C_MAX_FAST_MODE_PLUS_FREQ, 2, 3, 5, 15, 1, CLK_32MHZ },
 	{}
 };
 
@@ -198,7 +204,7 @@ static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
 {
 	const struct geni_i2c_clk_fld *itr;
 
-	if (clk_get_rate(gi2c->se.clk) == 32 * HZ_PER_MHZ)
+	if (clk_get_rate(gi2c->se.clk) == CLK_32MHZ)
 		itr = geni_i2c_clk_map_32mhz;
 	else
 		itr = geni_i2c_clk_map_19p2mhz;
@@ -218,8 +224,13 @@ static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
 	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
 	u32 val;
+	int ret;
+
+	ret = dev_pm_opp_set_rate(se->dev, itr->src_clk_freq);
+	if (ret)
+		return ret;
 
-	writel_relaxed(0, gi2c->se.base + SE_GENI_CLK_SEL);
+	writel_relaxed(itr->src_indx, gi2c->se.base + SE_GENI_CLK_SEL);
 
 	val = (itr->clk_div << CLK_DIV_SHFT) | SER_CLK_EN;
 	writel_relaxed(val, gi2c->se.base + GENI_SER_M_CLK_CFG);
@@ -1228,6 +1239,8 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 		}
 	}
 
+	dev_pm_opp_set_rate(dev, 0);
+
 	return 0;
 }
 
@@ -1236,6 +1249,12 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
 	int ret = 0;
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
+	if (gi2c->clk_fld && gi2c->clk_fld->src_clk_freq) {
+		ret = dev_pm_opp_set_rate(dev, gi2c->clk_fld->src_clk_freq);
+		if (ret)
+			return ret;
+	}
+
 	if (gi2c->dev_data->power_on) {
 		ret = gi2c->dev_data->power_on(&gi2c->se);
 		if (ret)

-- 
2.34.1

