Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A00399880
	for <arm-scmi@vger.kernel.org>; Wed, 13 May 2026 17:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778692626; cv=none; b=GBReNR5sJfHtsoKPRxV9Q8zYVLNMEgOVFg5zsXSuH3Yuu9FZrcQ0D+OXru4426mPgQEQQW1LlUK6Rapwptwdccc+Z8h+R8RX7pCMyAxS8Tr9nKdQTC71tVs2drYaqihg7u1t7DoRdVnDOFSZHDSnERkWGrCQp7uOPD6Wps48P/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778692626; c=relaxed/simple;
	bh=fzd/vjb1u/hgb97IIYa6s1ipXIoqKNbwIvaC6OZFVtQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qb0TDiFrNiFCBj6pEWrp1StIzQjicZ78rue0202PaCCkPTGAwo6xo0CqHA91EsQQdk3p7PbBSDHdXh0sgdlGuEMrRYEPGO9SkAWZ0SMm7/+Tr+lYqGgmy7m/uGU1449v2o1ilL1mEPfXmQIY7B7vbsXPdB6NkeTiFG1nlptsp4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=doj8WYW9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VwTg53Ax; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="doj8WYW9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VwTg53Ax"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DCROsR2965200
	for <arm-scmi@vger.kernel.org>; Wed, 13 May 2026 17:17:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Jx1/70KZBMxN87YCAFelMj
	Lwd8H5nC5QRAC82Z/a19E=; b=doj8WYW9nQl1bm4XpaUDKLOxmiewaY7ayXEBEm
	Jmq4WomSg8Bxiawk7NqxRfS3kn3RE4sRIZ70aXSwif/98faBGT313er3vFJu8hVJ
	w875fu7uf6xEKWx/2gqMl0m/CGHaMXM315yVicnMAUUyEmSWrz+nBcscg78yxZ9O
	6DU16hlzV1gDW7KLvRuGNlfX7/caykeble/2hvlgfYWOH2IiwQtaxeSo48ZJbc7K
	2VRpbY6XYjXssA1K7vpNTZw9vM/M5L/BCTx6LNcpqg7ANVRzxp7obSbB2cyGlXfU
	zi6Hf7ky5E43F2EhOWkmkPdi21hQFHDq7ORNEfvuvJmQcxTA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma5ah4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 13 May 2026 17:17:01 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ef62078ee7so9323044eec.0
        for <arm-scmi@vger.kernel.org>; Wed, 13 May 2026 10:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778692621; x=1779297421; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jx1/70KZBMxN87YCAFelMjLwd8H5nC5QRAC82Z/a19E=;
        b=VwTg53AxrwR+Vs4qdgj0ANcI0PDFnwI60Te+TWNSR3YCPjFACnKET0T7fHXca9Q3Zv
         pT276dGKRje86tDNGlVF3YuQxY+t9B54iUrWr3lFWplhh9h610rhv5SO3g3X9E3a870S
         4Pj1URXj5VVTzH+/dFzPqOMxzUzIAGSqtkQmhTMWuEj4C2KV4aEkTTG0vK5ayhq/cTKQ
         3s00F7i6Ynm9bAAvbbZ8zrycfhE13UoYuy0+Zc6aBOVxgS6moql2ejXH0fjmAiCFirN8
         lNHS1hBxtHl8d5E/0KqkkAl7ATbbdUMUubl6oXKvkGk+AryOp305jIJyJG7Jd6mXNLGR
         hMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778692621; x=1779297421;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jx1/70KZBMxN87YCAFelMjLwd8H5nC5QRAC82Z/a19E=;
        b=Kdhqj1x/vo2r3heqIzI7KgWvFBAtIv9UIDZBj407vobopZL8EpzLcAnxaLjIV8XUZf
         6U228vb+GJBk24quPBMWToL51Np3q2VT53cgUi5je0tO9J35lPj/6QR8+4vhXqTlDRUS
         KX9nL3LU12GTAPfpUDucuTj9hvCoU/FL2FWkSZpjNhrvBEZGq0BpORLp63ubJkUUObCz
         i9r/1bRGrreem/WLBvGQfYMoiN0RAo93ZzBolvb3qK68xRWX6I7YslY/2L3SX2bKq2OK
         HLjEcOr9Ow/UzR/vu7sVY58++Og6+YcUXPQhlOiFvStScz1hFc8badC1j2ATQSFbJfcj
         FrHQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Ec863X2bel9WdH1GmF5LHCTGLYmg4zNikti3ujty4ggrEFVFSwzwqynUnbLc4rTJppsimUojiuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvUuNVock6asyCMECFk+wkEMhP8H+LTicO30HQRoflEGtPN6Fr
	71iFxeTauhHh1dPIpE+FAFku+NSEnikX+rCOtCAUcKSD/JBuogW5kECYZ1rWRQ4NASc/yodM6in
	k8uaqqamFsIaNeOGzWUmjHNDjgJqOOUSTka7J+W+GJmo+RHREv/S7h74n3TNN5g==
X-Gm-Gg: Acq92OGTFIEoLQ8GV++HuSh/OCoLiHOwN8EOGF+lihxc+YPd7nYu2rPlXY9pbydubdP
	Y49jMYneiH5rvG52RgL48HhDGGdcFfqpHuYvNG/3vX9D6TqHFxx6Hy8zK6O945CHdVosLNkqpjS
	GG3uGFk91vLHkQMer3O7m80PkM7aFATRQpdeDtKhJ61pxFr8hLZYRUtNHNBSWxIG1zzp6yLqKri
	z3pBWfDTRZNNEzDYEHTd8cBHMvM5kAFBBZHGUh4mBmq8anAitmsL10gAgBcg1+Ek1TDhRDpXBDV
	QgrDBWILPLrHcUcPNqs3eHn0K9dRY1sAVCNzK10lWnADrozXtf1yyP1JJzzNGGskRkpGFpRlv8S
	d0df6lfoMeU5j/3sBtnylYDfA+MoPWaJGatEQaYD7O0HiI+y6kcqj9BWSvq8gHIqeYhqKZ6k=
X-Received: by 2002:a05:7300:ec08:b0:2e2:4979:eb5 with SMTP id 5a478bee46e88-301181a676emr2698576eec.10.1778692620967;
        Wed, 13 May 2026 10:17:00 -0700 (PDT)
X-Received: by 2002:a05:7300:ec08:b0:2e2:4979:eb5 with SMTP id 5a478bee46e88-301181a676emr2698523eec.10.1778692620213;
        Wed, 13 May 2026 10:17:00 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888d3af4esm23075939eec.25.2026.05.13.10.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:16:59 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Subject: [PATCH v2 0/5] scmi: Log client subsystem entity counts
Date: Wed, 13 May 2026 10:16:53 -0700
Message-Id: <20260513-scmi-client-probe-log-v2-0-36607e9dd540@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAayBGoC/3WNwQ6CMBBEf4X07JJtsSCe/A/DgZYFNgGKLRIN4
 d+txKuXSd4k82YTgTxTENdkE55WDuymCOqUCNvXU0fATWShUOWosYRgRwY7ME0LzN4ZgsF1IIv
 MthfdaJ1nIm5nTy2/Du+9itxzWJx/Hzer/LY/o8z+GFcJCIjmXBhpCLG8uRDSx7MerBvHNIao9
 n3/AH0Dg9vBAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778692618; l=1518;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=fzd/vjb1u/hgb97IIYa6s1ipXIoqKNbwIvaC6OZFVtQ=;
 b=8l/21SLzmvsSoWLwwEfvmbO5Eh+2Zd3kiPyE2vcX82D5ElADwxGzPYS6H11r/GbzbkoITVhZZ
 vXKXed0fUU2Dshw//daOmL2IuIk3EdWjopaoUP7UBGfpOzKvblX1sea
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3NCBTYWx0ZWRfX+rXTwbl74G86
 klwTtGQ9q3pYVMUd1J44jvvHRLnCJi2xlsuHMe76clJ14uGq9MuJgIYfp4j6CqoxF9byaTy/mtc
 sjiuYVDCPIf114iaEsfojxNNxzAyJOPOLfVcMEXbFg+4zPqCbVjx/JiTPvdJad2GBZX8eYBH4tq
 8JvuCJ+4mR2hscpLdkAuU+WGq1NidaHNS++qbz85TbSLTeqllGgmjJajPGj+fxDow3yZVLFTXzR
 JWJvfBI5YQ3zNe7jnC3coTYBDQ7xVSLLiw4oMvNrRfWnW5g1rb5ITI/uVQwcroxLnECcbh9U8h3
 dkglHQocTjSxchHzLWN5tUMDF6mv8t7Cl5oWU8uP3IU4WGozKTCvROuLr6T1w153j1mzgEHIzD2
 XNxD0z9TWAWTVS7/eovaRzMA2uZQBYDfgOXQPkGqL46eOrRLq13KaiUj0lTv7oRKKu+x+m7LRch
 +VaHgictmICVqRBvyRw==
X-Proofpoint-ORIG-GUID: wat7_BM4fadlfPLEHO0u9hycaQ4-x8G0
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a04b20d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0wi9YMwNQcJCIsSnl6QA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: wat7_BM4fadlfPLEHO0u9hycaQ4-x8G0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130174

SCMI client drivers do not consistently log the number of supported
entities discovered from firmware. This information is useful during
debugging because it shows which domains or resources were exposed by
firmware during probe.

Add logging of the number of supported entities to the SCMI cpufreq,
pinctrl, reset, hwmon, and powercap client drivers after a successful
probe. This aligns these drivers with the existing logging in the SCMI
power and performance domain drivers.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
Changes in v2:
- Use dev_dbg instead of dev_info log level
- Link to v1: https://lore.kernel.org/r/20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com

---
Alex Tran (5):
      powercap: arm_scmi_powercap: Log number of powercap domains
      cpufreq: scmi-cpufreq: Log number of perf domains
      hwmon: scmi-hwmon: Log number of sensors
      reset: reset-scmi: Log number of reset domains
      pinctrl: pinctrl-scmi: Log number of pins, groups, functions

 drivers/cpufreq/scmi-cpufreq.c       |  5 ++++-
 drivers/hwmon/scmi-hwmon.c           |  1 +
 drivers/pinctrl/pinctrl-scmi.c       | 11 ++++++++++-
 drivers/powercap/arm_scmi_powercap.c |  1 +
 drivers/reset/reset-scmi.c           |  8 +++++++-
 5 files changed, 23 insertions(+), 3 deletions(-)
---
base-commit: 1bfaee9d3351b9b32a99766bbfb1f5baed60ddef
change-id: 20260509-scmi-client-probe-log-173cf85d5563

Best regards,
-- 
Alex Tran <alex.tran@oss.qualcomm.com>

