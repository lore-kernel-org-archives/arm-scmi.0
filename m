Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C884D2EF4
	for <arm-scmi@vger.kernel.org>; Wed, 13 May 2026 16:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778690673; cv=none; b=CrCb9xOsGPqQCkAjUn6msAbygm1BdCMeQA0Q2MD6Q1V0wYIit4Yym7tX3BFHJOkKRgo/qzcL6Viw5PIkarwkTDqL7l7vw564sa86rqG3WB0CGoE8Zz0+P7S6KD6Ag5wSYtz6XZIUCiWR0o/sdeK017r2zgttUiiy3ChAPSFIccM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778690673; c=relaxed/simple;
	bh=hWTJ66ICrMMYPDEetoAigezffDe9LGu5ZAq3+pTYj0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W94xeqqZbjcsv4OQT5QVzxHRJ6k5hxSHsr65H2p8e7hENt+4hkVX6qZstNn0VnBWB+JH04aqDfhqrSoZwV5xnM1PV00ThvTMqM93qdi5TKSUduemBCoPPdglmnfGvEYRlqlKo1eQK78dl6xABJRax7F7aFq3NbzGrNuDFNoomyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WYPu6k/B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HUatXrph; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WYPu6k/B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HUatXrph"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAW7i22338896
	for <arm-scmi@vger.kernel.org>; Wed, 13 May 2026 16:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	znMu0JYE14eDzL4+1yCaxtsir2SCzQ58yUv1qQfzVrM=; b=WYPu6k/BQJNW8oOg
	bK051FHeGpoAigfOiAPGIvuNhcPXe0hQAIseeH7jeNpVOEiS1Mml8cee/9nyGzWs
	IKxTuDNZS45J/rydoe71x+OslrZTel6RCOzG+ENEc7AOAGV2yNPlvAb/4Jzd12Ed
	tDVLRDZ4ij38l1AoPgCyFlxdyfm/m+EVnwapvj1bRiuPue1ErB2uxk/M2HijhONY
	qTfN3altQ+N1146Lx9M02p+EIUIDqJRoFGAVxpRLQ9SCcoBsVFbNtPt8hNSOvQY4
	l+AbNFMikchb7/che9f+lgUe15nslDqkUbTYsD3iEvchcDlvy/sOBRqjQYiJ5htH
	FPyydQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e49vxcfyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 13 May 2026 16:44:30 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bda35eab74so5485499eec.0
        for <arm-scmi@vger.kernel.org>; Wed, 13 May 2026 09:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778690669; x=1779295469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=znMu0JYE14eDzL4+1yCaxtsir2SCzQ58yUv1qQfzVrM=;
        b=HUatXrphAgZ09xx3SWqt2FdCZbB77aQR2mJSyS5P6vdOhQOBHY9v6d+nGboSj2a2BX
         3XtLsGNg7lVdrMV9FrGvZowkcrhXREGaL5MR8PpNYC4Kebw/DU/PV8Wc74we0ub26C7t
         SWxWZR0283t7n8WcxSaHDL/EMS0gb8ogfn9ds1P88IIv8XgbO0/bnflll3lpF44rOp8N
         JUylNPEi0VKo5sytf4DXO1llLfqgRMxtz3EMT7pimr6+6GIP5R2gQEFahL23NylJFgqB
         9ciKR3u7qNQeUCR7IJ6PD5p6xvE75aSMBWxCLlwLHlePukcAYugipluWzsreIBgAbquo
         tVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778690669; x=1779295469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=znMu0JYE14eDzL4+1yCaxtsir2SCzQ58yUv1qQfzVrM=;
        b=EjywyYJSDL7TC1FefD2LWurc8j14J3yxabxYExjqfd4f/Uz4O6bL9+gOfi0TjfYQ7g
         bIOrktrAHgO5gcJXZ1ocedACQiJycae07w2OmN0SmlU50+tOq1vDLiOSEemFNbBO1OcC
         Idf7qohtmQMtUV181Vbgl/TqkjTH5eTRcvNWGlyWt83SdFSNOD8y5FL1elkGGTAkvSTH
         aPU//WI1BybyqbAFx303AWd3WdsMNtIQ8zN0oiCYzi7DWKaNH8TWtfckYfqj21Pm1XSj
         S/bY5dqV71uWO531pPEicZoHHP5Pda5gqb0XRaBJqxNFXNDIY2UeBubF8GYetuWuXRTz
         AV5A==
X-Forwarded-Encrypted: i=1; AFNElJ+YfQrW1kPzqviAMEFqHXbjVEGoznSYAvzuIDa5s7N2XGL/ErGZUN58LJMxdFH+M/cLxzM5glFloQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ80PfsJYl1E7JeMWRHMiJwtvP2ZPPL6NZx7C275xkaBJ6M6GT
	BN/i2ZoqQx/e81oTR/TXk7Eh6sGl0ZejRYqLvratCcblPHj5UEGh6S8WqgaEXPisvPGd8b4nXcE
	Q1ruArkmBvGJLJOc6hJRdpoeVBpSOddAsLsCjbM5h1xrvifmmYGxn211becMrdQ==
X-Gm-Gg: Acq92OHyzBLncwUEDXnl2srP+jdwPTaXR52HDlm8c5oQ2NR+T/49Do7+lcrKyN7KpV6
	7FRyKEeyax1th85FHf27Evi0Or3zypGfN+WD+UUSPcv3/dOLf0+HOTze30UIUPU+CCamPxKt2ea
	3y/vhEG55k3ZhWnRAhzuLktt9qph6qcrfBspIajj7KCiNh29+7YHnIrVkF66WiGn7on2fdXWRey
	vJfwzMYVfVt7EW1qPCD2bobdT7DhvmCPGTPpCCns1UFayZ3i+E+OvStEOZ2Be2dzah/YcTaM/R3
	t27wERsF3IJTY4z59e5bwsYK/Hu0R6DEla4Y4bxgN/rUn3SY7DSPn1Fdrk9NTHs7NsAIqYKmZNu
	Kkhhy6UjTWpjwgYzdr0/qvMHnilYUiqPRgBtcJjwbaN1vK40dPHpkkAGw55RS7GvGt1CG19U=
X-Received: by 2002:a05:7301:1294:b0:2ea:ea7:480e with SMTP id 5a478bee46e88-3025fc493admr144429eec.10.1778690669469;
        Wed, 13 May 2026 09:44:29 -0700 (PDT)
X-Received: by 2002:a05:7301:1294:b0:2ea:ea7:480e with SMTP id 5a478bee46e88-3025fc493admr144398eec.10.1778690668884;
        Wed, 13 May 2026 09:44:28 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8864c37basm22570076eec.13.2026.05.13.09.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 09:44:28 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Wed, 13 May 2026 09:44:20 -0700
Subject: [PATCH 2/5] cpufreq: scmi-cpufreq: Log number of perf domains
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-scmi-client-probe-log-v1-2-00b47b1be009@oss.qualcomm.com>
References: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
In-Reply-To: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778690665; l=1078;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=hWTJ66ICrMMYPDEetoAigezffDe9LGu5ZAq3+pTYj0U=;
 b=dKt2ltOsglRwirWV/VFgytLio3t+0trY/M1zjyG4lzrU8COWFCdYDtyNysYCuSfhoFQEYkG72
 wGdFMM1kbfEAUr+QPv0OImnPdu41r/pDiZbC4NCgA6VLy0lrdZgwyx2
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-ORIG-GUID: IsISpk3HMTsfdbedyirm5V8efZ6t_QE2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE2OSBTYWx0ZWRfX2M06s/iLj9sH
 Zxw0OhFck99lLVdUlly19Z375nltBXXCWo63kYBMc2fmc8+rlzDIdZdcAUzXSq4qoSODzQE21RP
 vaRyIBPE2o/HGUXAbpAdoEVzsCoNz7k9xjJB13zLB7gQHpgC9yvSVfaybP1+5i8tqAQ8p9wmmuH
 oXd6wyCP+bkkPRTLHTKT3jt2yR5Zs6tjcVbWM+aSNVApr6XcH2pxG9qFIlsgFhdjxEMTAcHzz3j
 vmaU59/S8xxiveykEdj1nMitnWG4i5JXagW/pl950rmzM73c/+I4+thxaw4U8M4ZKpVTSyS1HPR
 bEqrf9EmtXXNMbLeLOpZRH3F8ZiO/fPr/SFqgGbU+7bc26UPM9ieue2ogynyWo0tJKvfgHxyQIC
 j9A3kO2DIuKXfHHQSdlcT5yK13EMOJYkrvGsl/7yjMom9zLayanBHC86Z1KSUXAvulgbfNja+1z
 f8cyVGWUvvBkerUYRmQ==
X-Proofpoint-GUID: IsISpk3HMTsfdbedyirm5V8efZ6t_QE2
X-Authority-Analysis: v=2.4 cv=A8Fc+aWG c=1 sm=1 tr=0 ts=6a04aa6e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=xQYt0fwn8ryh7dGzGRYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130169

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
index 4edb4f7a8aa9..d5c33eea2477 100644
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -468,9 +468,12 @@ static int scmi_cpufreq_probe(struct scmi_device *sdev)
 	if (ret) {
 		dev_err(dev, "%s: registering cpufreq failed, err: %d\n",
 			__func__, ret);
+		return ret;
 	}
 
-	return ret;
+	dev_info(dev, "Initialized %d performance domains\n",
+		 perf_ops->num_domains_get(ph));
+	return 0;
 }
 
 static void scmi_cpufreq_remove(struct scmi_device *sdev)

-- 
2.43.0

