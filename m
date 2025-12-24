Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397F831AA8F
	for <arm-scmi@vger.kernel.org>; Wed, 24 Dec 2025 11:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766575370; cv=none; b=aJvkLkEVyT+ycyCwJ/hFt+t7qbqCOPtsGzdZnGaHww9YKxIiaJ2HMgbigXjxR5lmeCui/T2Qjg5XNT6Zh4IIGnWJk+hNpyQUFHGCLLEpl48WYBBS5XpfZ1Fa+epX4hRMTy257oCKdEkvKhCSvGsVL1L24eRYJ8nA/fPkthwRy9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766575370; c=relaxed/simple;
	bh=7egcwkyNwPYxR37Jus5Gv9CwukNyHGGJPyUno6vqjsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RH0DF9BnCpOtQiLMEk1n/2gTsMJw9GOOVXI/9oHYWISsIn5goEAIr3GrC+FrFGG1Wh7lRa5xwKNFsDGUBv+UbY76tLupqkJWeLs9s0tvGL80SeVITo+xZygABTThz0C1kK7pAuMGpjnxbyYftTYLclvj/N3kb4BEAZdum+ueI8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f38reHAG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a+QBeCGk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f38reHAG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a+QBeCGk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BOAXT2V1599723
	for <arm-scmi@vger.kernel.org>; Wed, 24 Dec 2025 11:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jcSKd+jkEh9
	Jv+pXNATWYS+/EEjNGBH7EgZtUP4nEy8=; b=f38reHAGRIFfLQCWezwOLryxWc/
	CusDdx/Uqz+VswmXpFtVU8j1OTVFnMBKHqXV4exPTmq8Hf7nD/8hq2C84yi0mF/v
	W8YhGgh/SkZelfBzWehOzFaNdyQwC20rzteSwoY4cFTSHTtr90skAOqOARPKLcah
	MAwd7uehMnY46KIdjJA8UL1hF+HDPCYMxB2iRYGus5AYxTa42f2l8Zp/5U7IV3Ig
	inL+UMZTf2LmIXT/8hczHCL8lmiiMrqRdsZAhCIrnasn8uea4CgFGtbURef0xgZo
	/XRYLScrAFbtwDb55ckC5Aw/LcL+bRU5qh0FEY5AN8qLlclFL/lIoyvAIfQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8683hekw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 24 Dec 2025 11:22:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed74ab4172so137035811cf.1
        for <arm-scmi@vger.kernel.org>; Wed, 24 Dec 2025 03:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766575367; x=1767180167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jcSKd+jkEh9Jv+pXNATWYS+/EEjNGBH7EgZtUP4nEy8=;
        b=a+QBeCGkDd+HQummNhCm3Tmhut58UG6vDLpbS3w2XXVop0NjCquTG9hvqiH34nnPW0
         bfUha4Wcw4HyeNsBMD1ZCTSQH2Xz3KMWBI6/N+aHDLWIjV4gNIQ+z83u99DopYfEG3If
         3ywNV1dsrG7X/OlBFwK2u/G8nRpadwV+GSnbaOS/pMP/mFC6vPrme+Nq9cpDTQKSrRV3
         HNDPr2iZjVs30TKIVobe5CFxPMWJ/zUCdFTL8wCyXtf1SaQUJf1+upFrzQ3y/mk7PABu
         U5/9c0kk98YAeaAujPYIlK0b4XT9L+Kx+y/czEME3E6hL3KYu0jIOYktw+FcmHDRUsZb
         oyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766575367; x=1767180167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jcSKd+jkEh9Jv+pXNATWYS+/EEjNGBH7EgZtUP4nEy8=;
        b=LqBkyxKYk89T8Fm7IZ+xpiSEp0GSviQp5goA8iWjWp1hDS2hSgunU4DZ1KMyW5iYxY
         1LesVnF8T2h5YYuvQlFvhEeNDBDs7/R13Y1JMrBrJ4Ee4za3zFiphI4CkoynxKlRJ2zB
         GFaJd1mPrl1LdjLnMLd0oGpcUzWMV6YWYpkDY8mBkHlHUrWLMtmM6JEwcjSi8FGzDq9O
         7qO22yb5OgpGMQMNufahhLxQBMe80tbRveDQokKxl5X0cVpKcnHxfSjflyAJvfH5pGbq
         ScD7JKNCu/IYTmSM+1XiGJKL8Lq8bxFCQoBSIRjhUuq9Jnu2GRq4EgV1CnwBwT2m76+J
         Q7aQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDaAAFcp3a8XHVd5XoGANl1tHbpQM/IBR2FcfVckrCW85Y7ESxZmmCo+uWzVrqpebmuvuet4J95Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRjoofAa3CMz6/W6K57YTR8GD2gtEjmDabU2KM6pBfKkiAJR4k
	Tg3B2YP7SgqKUZR/q4sDw32QFjN51uFa+vWmgFRkF8oKPpS+M4XIVLpYZPF0fi2G0/hdoZQs+oS
	TROcAJ7Xsj3kMqFeOO8aBwp9+pn/OFhrBzoCJnY83D3BEq1j9l0Aihd3oPh+SDw==
X-Gm-Gg: AY/fxX7Qf3rX/JPemEqQhCnZcnzF9TBXk1atx+HbdI3GOXSlbsaRAp8Oe9BEsCE1++p
	Yp55mtYvdlYB3crMPQ0zqPd3jZh4rSbYpNybsf2X2MK8fwQfDBqVf8YfirR7z/Z9Q0aWKDhOkAl
	CsVK9vjwZ2pJ/P/owmcPDpLzLj2Fz5IaCguiJUC5ixTOuwGd7xbsX5KW+dH6TDUCWbwYHivpQW5
	twW1F6M/3R9docAMiHJAR5GlzwAVpy/IgkcrPe7oCOOqiIWT1wNuJCiXdIboBZ7QAJgRl8quw/o
	UBWpmViGJoXbFbIUyOHpNO4V8uEeQwxc+1wBvr5+seq0AForWGtcUN3NfFsbsCm0t5fzRJrDFaS
	DfmOaWLW3bzIi0cdTKXVTeqi0hHF1GpitIPS2oX93l/oCb6D9tkgHJ3PB0IWXjPl+ImFEkQ==
X-Received: by 2002:ac8:5981:0:b0:4ed:bb39:9a60 with SMTP id d75a77b69052e-4f4abd99eecmr254206021cf.40.1766575367362;
        Wed, 24 Dec 2025 03:22:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXk2MlFg1WwJyORFeqArvn3W7h7ibn59i+vAhLb4RFfwFlMM84u21nTU7QY11aHubbdFv1Kw==
X-Received: by 2002:ac8:5981:0:b0:4ed:bb39:9a60 with SMTP id d75a77b69052e-4f4abd99eecmr254205741cf.40.1766575366935;
        Wed, 24 Dec 2025 03:22:46 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64de4798077sm2042514a12.7.2025.12.24.03.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:22:46 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/3] clk: scpi: Simplify with scoped for each OF child loop
Date: Wed, 24 Dec 2025 12:22:41 +0100
Message-ID: <20251224112239.83735-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251224112239.83735-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224112239.83735-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1071; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=7egcwkyNwPYxR37Jus5Gv9CwukNyHGGJPyUno6vqjsY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS80AY64mdKfCs0Ce2qW9/YvaJnV9fNYZneYmI
 4QoyhCD9KeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvNAAAKCRDBN2bmhouD
 1/WED/9utbqaTmq0XaHHxHeW8MXpfe3OuGiBgZeRSPMQp+PrnpEUURFjOohgTfc6eW14rKD78U6
 XOvImOVzz75zyzGO78uu9nsN+QJkyCAwGberuACdsCq3RpbS+6FW9KS83biY38xBEqUeAEBDBIP
 N9Fd6BAax5Nq/qaGRkZRGl7LQzNPyTyB3e8aZs28pJNiW8ccbZZ6F0VvE+9O3pSfA7joZIUaSjC
 Cw2IHki6l169/9FLSpLLoSwGslJ6cwhRZJUlic/BHBgWruhmmztQT47F+zj4ZzLo9Q8HFE7krYk
 bkh92iAN8OLyq+lnOG/CqxQr+GIeLi40AZP1z1bOjopM3z4eRTgPJBL/0XENNJPFCf9nwlVKWnK
 5Ox+v2kaiUralco05QxoogHafJqn9BVuG5L0m7bd3YZGSvDjdXf/+I2LYOOsM4TL1Np4cZw8Ryq
 tJYNLkkj/tGT+yNwXFU7PO6r/YAU9b2DSJ/sCCspL+QkSMLN6DjA7a5eMjprTV/PvKv6Cu8ZHh6
 gVHGi9nAOZodfa/oPyBIuoxKUsJr9IVpSVnKA/NcrFTOFY6ZAbeC4qFgqwZDsGtrm6OpUgWGHXY
 jxnECp1d6//VnlBN4YUve+hz5d0+2DbnPolQfsOFVu+RUFvEu8rppKrYT/jdRdHYhu+u14ECPfN 8SVh6EqGGL8IYvQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DJMxZhzpAew-EKask5wCSpPKHJnayM0k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5OCBTYWx0ZWRfX40yWjI2uZ5Kk
 Bm5mYkqZpotvkk2ZCfVC85TlGFvWtlU7TQHaTOOK4ljDFz9ogymb7TT0sUbc21q5Y68GInI1cPr
 mzmYvIFXANvvSrFxgswb49pWMwgLm0Y83nVA5S+niIA60iFivqRUGtAoaw2GXjh4oARm6yUhRCq
 qiK5jMQj7h9JssWcmmjQlTf4WZ5ra3YYS5y030ChHUSziWqCAL9xu67+hD+GjTFD4CNP3pBTqbn
 v8dJyLM0gLC/6fKl6evjmRYMVQI0nmCaH285nGo7e+DuQ6cCIWKktrXE8DAGbKLV3ED3y0heOF9
 o/2oTkRJginceOd1tEgS7494vQYJnESfHHZNTmWklAHT1sQXre2/OokJuMLa6YnkypB4KgrNwam
 lq58kntldQrilmjeCV6ZBmcgL4J93/rc5AdB3shxZWZaAqO+BQ3AY/+en2pHTWxWFbemhebGiwT
 UTxHIbYXS3B0VALO6Pw==
X-Authority-Analysis: v=2.4 cv=HqV72kTS c=1 sm=1 tr=0 ts=694bcd08 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kVq6N5mEIK0mURhpU1kA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: DJMxZhzpAew-EKask5wCSpPKHJnayM0k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240098

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/clk-scpi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-scpi.c b/drivers/clk/clk-scpi.c
index 0b592de7bdb2..7806569cd0d5 100644
--- a/drivers/clk/clk-scpi.c
+++ b/drivers/clk/clk-scpi.c
@@ -265,20 +265,19 @@ static int scpi_clocks_probe(struct platform_device *pdev)
 {
 	int ret;
 	struct device *dev = &pdev->dev;
-	struct device_node *child, *np = dev->of_node;
+	struct device_node *np = dev->of_node;
 	const struct of_device_id *match;
 
 	if (!get_scpi_ops())
 		return -ENXIO;
 
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		match = of_match_node(scpi_clk_match, child);
 		if (!match)
 			continue;
 		ret = scpi_clk_add(dev, child, match);
 		if (ret) {
 			scpi_clocks_remove(pdev);
-			of_node_put(child);
 			return ret;
 		}
 
-- 
2.51.0

