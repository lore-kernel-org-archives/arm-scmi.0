Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EE63A2E2B
	for <arm-scmi@vger.kernel.org>; Wed, 13 May 2026 17:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778692628; cv=none; b=YJ+uXvq5p41aCRX8SqUpK90p7MfanROkYaAfhWCuG/0XZ/kHXzGwc5wOzGA9W7JKnJbCm0iVsaLpDACPr89gIUZ4U2BVAk6AhXArDyoL8z2SAn7A3V8faOTNxx3d+AAi+2WzL87cnRXIMgKn9ecrYzeLdLJ9GP9D9Gi4jaxcjgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778692628; c=relaxed/simple;
	bh=0S9j7FnuPmvobUdGBBFR9mVHs/17xvy4ykl0MOW3i40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OTFtVHk/fuXZRiSFg8ix2d1h3TygPSSeECfxL6ZF2EX2KYSrZWD40jz3tGYRlaDDzQDZ3Jr9v2yeeMPHRQEuskOZeqt1Rzvlje0+PjIQSAmgEbIdcyruDty6sJHgULSKIadoKkHI6h+uJtGN2J1vTSdqqgIKnpA2KGXg88QIplk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VMOkt2T9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lj/pDm3H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VMOkt2T9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lj/pDm3H"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DH6gR82321285
	for <arm-scmi@vger.kernel.org>; Wed, 13 May 2026 17:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	190VP7a6BX04bhOypgQFXVE0wD1qu0burap4lRbcsRA=; b=VMOkt2T9AWzpX/2Y
	F/0z2gwP2iT2SjyvYZZnopLNFEkatb0HUTS0i2TJ3SS/XVVm8ylYwyikwvNWmdtR
	pBtKt1XUQX78PU8nqKLx2hlQRLjlGMqisFwMluN+w1PwEQ2J9VIajCTEuo8fGb8R
	6t688mBRG2gx5CEmb3Flxe/HpLxerOA7kXdFzaT2hSaq0CYPPkgKKBY5FZ8lT/Y/
	xN2BS22YiuFHSZxmRvTIzWiQHB6wgCizbMc2ERJWAYtg/tlMc/Dk4NqickDgHngF
	sWDoPAuEXN/ATNjDb0RC+6To/zH+0DhTSIyyCgEXTyEnOIT/e4wEgBMxjfh+0+2D
	ghaocA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hgub52v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 13 May 2026 17:17:03 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2f485961555so18611279eec.1
        for <arm-scmi@vger.kernel.org>; Wed, 13 May 2026 10:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778692623; x=1779297423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=190VP7a6BX04bhOypgQFXVE0wD1qu0burap4lRbcsRA=;
        b=Lj/pDm3HXgd8cyU98UvswQq8ieq2X5x1dAZnZabhaiLhdL0zsY3GiAhKK3X4hIFTQE
         UpiL3ujIY3Lku9vFXtL2qts2dODBIn4S/dOkWwI90etjAVTus/Ky7Ohb4kPD16E8R7PO
         Gf1JzyfnaWuIxxHBIuxShyRISP4FTGoOWbMQFTRgJYX8EzOUQ90RuhDV55ohzqpf1BDi
         XGQkbndhasGLyYopfBOdn6ZOHfiJPfgObeJIRFvO6U/9oCBSly5deDNLpSEc7rY2sNKT
         WyG+Gv5UpPzr1vefRlqnFfXS/62MuxS2E19YE9SQIhxUn/u5qulLjvIbawRGxfCdt4fi
         RUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778692623; x=1779297423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=190VP7a6BX04bhOypgQFXVE0wD1qu0burap4lRbcsRA=;
        b=nF9T+0le3eCgw3kJgDfVc9+RwIGI8zRJEGRFScFABIdRombSzLRaXJFcEuRrtSX9ro
         vTPRMHaX48BDtivNnhnIZEU3JWi+zQvQeLYz6L5HZ+GwvdhAfV71QHU835sMzLOSR521
         8j58Uvfece3aBqU4ZkKExeyMw64wtmpRX3LfwFvPwwfkaWfUVkTgGgrxd4zzZgDmXYYO
         B0EcbntWLUy8o9YSMBoIdgGI3tGR39uX5Hwik7Zn3jbkNQLniGOxo1ji2tUwqraaJLGF
         TuNvfkojSM2Qbcp85Ftmux+YKTva/LLrFK5kF5SbKo0mGkXQe6/QsiDePcTtVEZs19e3
         keVw==
X-Forwarded-Encrypted: i=1; AFNElJ9AXGHDcNAUC0kZua4SsWHzbfsFZyYGPBVAXuFQ9tHRhyeqFhmFjwLWt4dz9cN8UIED+CBiaAqOVw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9+fRFflnUN1Dbuhy5F5FOEgl0WfclZyuurV8EempaX5ud2Zp7
	AXkbfYcznXaHCbjlVcgDSdt0gnRdhzLxDUQWuAEGhnbqItpGLnJ6DusJgphrDvjle2tLLuw7LAO
	A2OPCbpirfsYGXWdOtfSdQHjybkU2rpsVUF8QPMXKFNwqfAxjTO8ANvleeWTJBQ==
X-Gm-Gg: Acq92OHUjubBsYrMadsg1iGbJuLxUgd6FIxdAvVeOZNibyIBGhhhlweIhj/RoknOZ9r
	WAs4po1EDFegASqVk571sDOOOFsI/wB3PIfNllXVqwu5B+FoEYyj6a18pzFIn63vi9E9fW1t7Jj
	8G6V9U46ROBWjJT0kijhH30v/fWWlxtrU2Z2Q89kUZF45KpLHjdZWqsEcW4nN3M4ic/x6No/Bxl
	hPz7jYNKg2eLSh8s+Flt8WrBbP61Bee3EjFc1L2/+FDNcZ8wPTKHWav8Xz+QJSi202EVovDQz7W
	y+zCeZRL53wkKkylBO2d11wKYudOp72yGno6feC2woiHGt2olzorbmugHl2Zowf9FYwsu7LM5AQ
	L6i8sQsp6fzqY+a1xPrVNsMyWHrkldY6Q6pGlkBbshZC4/WkzrYMD3IqjDEyXfsn4XcWxu68=
X-Received: by 2002:a05:7300:5412:b0:2e2:3381:2fba with SMTP id 5a478bee46e88-30117faa7d3mr2658710eec.3.1778692622826;
        Wed, 13 May 2026 10:17:02 -0700 (PDT)
X-Received: by 2002:a05:7300:5412:b0:2e2:3381:2fba with SMTP id 5a478bee46e88-30117faa7d3mr2658689eec.3.1778692622307;
        Wed, 13 May 2026 10:17:02 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888d3af4esm23075939eec.25.2026.05.13.10.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:17:01 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Wed, 13 May 2026 10:16:55 -0700
Subject: [PATCH v2 2/5] cpufreq: scmi-cpufreq: Log number of perf domains
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-scmi-client-probe-log-v2-2-36607e9dd540@oss.qualcomm.com>
References: <20260513-scmi-client-probe-log-v2-0-36607e9dd540@oss.qualcomm.com>
In-Reply-To: <20260513-scmi-client-probe-log-v2-0-36607e9dd540@oss.qualcomm.com>
To: Jyoti Bhayana <jbhayana@google.com>, Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hwmon@vger.kernel.org, Alex Tran <alex.tran@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778692619; l=1077;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=0S9j7FnuPmvobUdGBBFR9mVHs/17xvy4ykl0MOW3i40=;
 b=6Vkg+4M4BEnG6+g6RMd6yk54y+a4e0RE4C47kciBZY24QjJKcU53CSueAMfPjK/6gchvjoe7K
 ef6MGhi5WiFCrvQ6v3lz3OSYvxZkL0evl1cDqxLdE15iihLXDW/VqpK
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a04b20f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=xQYt0fwn8ryh7dGzGRYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: A8f39mvfpf_NWTCD_E4Nl-Sx357G0gd7
X-Proofpoint-ORIG-GUID: A8f39mvfpf_NWTCD_E4Nl-Sx357G0gd7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3NCBTYWx0ZWRfX8G1SBWua7Kr5
 97B+cWChfxlStr8wf4atxyH2MRiK39M4zgu9oQZ7M4ySyodCoGevHG+hTS2dDLORBWUSGtqt1p5
 eDzB39QEdlKgPWYFsUVrmRB1u4RaQixycpPd2PT72/3bk7RUq+bhRztfMt0GhN+UVlSrsf4/djq
 0TrwITHUhUJJu128NVjVb1XxXWZm2ifpyq7R2+A/0lDPfEaBhpBiieI3wL5a8KgiD+npCo/RZWQ
 0nWY4KTS8DIuJ2vKsYogbHomceLUrqN3wnBHFiH3P6l6YbiTnMUJEtqKzjduv0lieHVkNJ3MiAu
 m+1z8HVMCkrC5flA8kXR2jSvbygRo1daRNnKXvj9Rv67++m0TR22ezUi/FjrBPDwz5QX364oYpi
 VU02LOGTN8jBQkGgl8AYv6R+Xa5q76AN/Q0dL5xxJVz6fylDtK2C+xR3TeKdRWukJEs1J/5NAHI
 jEP5h3fMlSXVhsq3wPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130174

The SCMI cpufreq driver does not currently log the number of performance
domains discovered from firmware. This information is useful for
confirming the firmware exposed performance domains during debugging.

Log the domain count after a successful probe to align with the existing
SCMI client driver logging pattern.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/cpufreq/scmi-cpufreq.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
index 4edb4f7a8aa9..f4cf59d862c6 100644
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -468,9 +468,12 @@ static int scmi_cpufreq_probe(struct scmi_device *sdev)
 	if (ret) {
 		dev_err(dev, "%s: registering cpufreq failed, err: %d\n",
 			__func__, ret);
+		return ret;
 	}
 
-	return ret;
+	dev_dbg(dev, "Initialized %d performance domains\n",
+		 perf_ops->num_domains_get(ph));
+	return 0;
 }
 
 static void scmi_cpufreq_remove(struct scmi_device *sdev)

-- 
2.43.0

