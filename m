Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0E33ADBA4
	for <arm-scmi@vger.kernel.org>; Fri, 24 Jul 2026 07:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784877592; cv=none; b=LxOlSZbWrxdXN05Cd2ICUByptTXhr3RVJHioq2rg6wok42432+lixkqy2jh2FrS9Ig/wimo+OUlHZFC9TwbraAK/Jp9k3+SSSYQiEyCrm+vxM3vZWFcTV/0lf30Pgy9ndFzbST9kb2rS2vbbqNoSHg0OBzZjBSpIwQYzyjXOGgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784877592; c=relaxed/simple;
	bh=wZDWaODCyzp7t+O12ZO+CiytzMHhYNjkW2d/5Umhqnc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NI+qBWQhnbG5qwbSsYaI2cJEuOtPQl/89F33BWwKH5fpVX+NIRqP83BC0nftxAVIWyexmP9Z+93EbsTturLFeqBVRQmUpRRzHk6haGezfsC3qswdE8THa4VExnNMxbWbyUeBIT1KVFLtKpVkD6VkfTTIgeUWeb+H9D88k3dt9NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SRfReoF3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GYFNx3OV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SRfReoF3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GYFNx3OV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lh3e1992557
	for <arm-scmi@vger.kernel.org>; Fri, 24 Jul 2026 07:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	85c6fMwpf5j2iCdGRa9j4fuKaRpGB/lUr0+dZdRrE2s=; b=SRfReoF3mUtI5cLQ
	iPa1Rfmx16lH4+oLCZeIV0lGWOxyE6tIQVHkKpCPQXUCzkD/zdTgTqbfSTlHOkXc
	Ss4E3udo89bT2J1Yn4NNVJs72qofDVhIpC5xoDYT3GonXUzZelCynprqMEg414tk
	HbsrwjIZFhBLJaFUgee9nc/uwLm+hngYoczJDGbQzTYvTEUepKY0fXLCKv4pWEzF
	8kuQoXKADivj9b2CSh6704160BqH6mdmUwZzk1poOWGybNxGb0nFZrlE6i6NEsQN
	WFoy9QEBwJpDxEjKw+F43/jjw0v6Ypzx6t3L+g0E2SbGU+YHfbPPYRrNvdBDOBOf
	1NPkKw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0p50mfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Fri, 24 Jul 2026 07:19:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc6dd43737so3047385ad.2
        for <arm-scmi@vger.kernel.org>; Fri, 24 Jul 2026 00:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784877588; x=1785482388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=85c6fMwpf5j2iCdGRa9j4fuKaRpGB/lUr0+dZdRrE2s=;
        b=GYFNx3OVufoJmbsM/V7NOjuOIG7Yy9R/taAR7Wb6P2TAVDfTwq+V5qSaacKGeLFcGN
         B3zBZV3rcpHzBb6gDtN1Opp3HUXIe4dXgpmQiT/uAH7rGGvBDZxElCvyD2uONOgFmh0V
         ArmCVv5yEr1340mvmS+Zpv5H5rW9tzt+5x4eYupGoP5c2x3nYoOw//5CGML/ro+YVXgm
         dp/WViP9FqBNe4VdK6fScUc6eutYB1ReYIBvsSXHx7n3J7YN5v6mt6e1cbFcn1R3Fqcz
         0nA3L3e0Xfa2UBaWX4tKtVFnIbj0dQ9ZRRtq/52Bf6v3ZY1mvzw6PC17Dp2XJmtluzTi
         ekRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784877588; x=1785482388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=85c6fMwpf5j2iCdGRa9j4fuKaRpGB/lUr0+dZdRrE2s=;
        b=sqkEwdkpdZhafT9+G3fySSU3ZAmnYj3CeNUuj29MZnd4NEKHwpzhkw4sBzo6Hdlq8E
         ndNEEqc8PEvqr0CyHUCUp+FeVf4wZg4utDjFY4rhJJUzULDqDcLixYA+lsRFn9icqsNb
         R72tkei2CK7NlJJP+NY2UovAB1VtoEBlWLrjG7AaujamleLsu+ghL3AjX4RxL2Y2sC94
         ceiAVnqpxckJbSRD9+rnn7ju+DtZdKvvqDDB7qi1zfGsr1ddQ5i9x1cR3nPOocCHETuW
         JCMwc1ARPGkxzQEd25Jd5uhzMFllhMzHrg0Rtlo5q2CGc7TD87oEUP+O6rU0y3bI/RNL
         wUuA==
X-Forwarded-Encrypted: i=1; AHgh+RocLNRUAu+06wDzb0oumPpQNZARO6vn1kWx148RUSleoXLtOX7JTz1mdylYhE8EvQRO5XaqxbOZEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8LA+4gls1H6PloEeoiqKXFY7idNB0/3FZT1E+XWroYF0vFixD
	+b7W0BTybx1EMo2aLZdFBo4Dy68Yeofc3s+1Cj/ATnOds/f20ehpTR/qLiEov/ieD3ZgsjrfleG
	Pj/eHoP7sJSGkq8X80EH9WR6GI+iZaLopnKzopBOWtFv4YH/vwQ1nrHVhLVLvJw==
X-Gm-Gg: AR+sD10asGUb7MrVZtpYIs/2k4CpzyuPUnZaRT0C0TmoUowAvH0m/BuG7XIG9VHxBXi
	mp7gZV9LUXJOk9oFWe8thrh2d8FQ9yRFXX5zvuXQE5cG/ONpcsCUbcmhKlsTGcfl91C9wR+G9kZ
	G+QIE2Om9dVIbM+jei7Y6wppPzEHGkZ/G+rlGy4PAya0yRXjrOFw2vCYjQt52gZcyL74RFrscGq
	XfdT7wuBUvqbVd4qngE3kLFLWGkptPZJ9gRwEBflH/5K4a0WF2SfDUDBYkE1C61DRKtmCtajaxW
	8Gm9tfgOXaEN97UDbhPMcUhOwi+68AecePitI4G5BGU9/Boc92USWMWoS45XBDkj1SMzB8IkZcM
	s/bhVffKtNad3rh525232RvlhtBf2qdcVvZf3dc+OtCZ2/DDiS6Rukt+oObDr3v71oicmHrE4DR
	dyN5PA6tua37BXjW6UawZxPeqdcJw=
X-Received: by 2002:a17:902:f693:b0:2cc:d192:50b5 with SMTP id d9443c01a7336-2cfa75078dbmr74555305ad.34.1784877587401;
        Fri, 24 Jul 2026 00:19:47 -0700 (PDT)
X-Received: by 2002:a17:902:f693:b0:2cc:d192:50b5 with SMTP id d9443c01a7336-2cfa75078dbmr74555095ad.34.1784877586957;
        Fri, 24 Jul 2026 00:19:46 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efe3afbsm45993805ad.33.2026.07.24.00.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:19:46 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 12:48:14 +0530
Subject: [PATCH RFC 09/10] arm64: dts: qcom: hamoa: Enable LLCC/DDR/DDR_QOS
 DVFS
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-rfc_v8_scmi_memlat-v1-9-cb732bcff1f4@oss.qualcomm.com>
References: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
In-Reply-To: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784877514; l=1007;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=8tKdt4fKJhT/tYsqDka1HLDRza+yiVyfZcS7BTSC5l0=;
 b=ElL7bMtCXym3FQCEHsNOAZ7OqHreyEim7+hA/4Ik410F2ff4uLS6Ygqlqda19xM3CYybnTvEV
 WCJ5kWpaYhwCMF/CKunvlKt6HUtpNwDIoAQtQGMSPWQdpDEw01Z8B8w
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Authority-Analysis: v=2.4 cv=Pq6jqQM3 c=1 sm=1 tr=0 ts=6a631215 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=8E_iI_7X9U7aA52Mj5gA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 0ogOT6WhWN4djy8zTr07zKR5WaDDbNSp
X-Proofpoint-ORIG-GUID: 0ogOT6WhWN4djy8zTr07zKR5WaDDbNSp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX/vxfUDLfz3Nl
 EakINMgsO6U4I29Ruw4/svo0bkZ94ZQAxNEehqZ8KzSR4NR032uGB5j1pGgC39IOX3ZVcwGTnck
 nZ6v9TOH+4/93Zx0WKuol6IMyMQRIsI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX07/W9Cz5mfoy
 T900m35gb6uO0gU+5k7WIvFXta9wYnLUFF88NChzlzhcuQ4uJA4KU8wCFVjyV8fCOO9qskdqDyw
 Qr4nqAxMHtsQnDRyFPKMls+c/nh0EqGkfPzLahJ8/chBLyA2SDu4Iebe88FsCYw308RFHqEHYqC
 i1GENOggGxBFDvdfz0VUNeqa+ejQWhvzUk+wF2ZiA7e0qOjv6fMF5H1fCIz/5yT5Hls+r7XITdh
 3LAeHVDpKweWdOe+Sqi/JYwq03sxGiWLydKG4UlhVPxpuLsXOCgcL11fJ89VtDD/tFPAcGp2LFz
 Wc3Jy+v3rYRSiCVeJmgNMQETuqUdZw72bEh1Yaz2WKg9JHuTdoehjK5KyMMaSnbdeShg/hOmJGL
 EZoE37wcCmregSiPH0ScBeKz2hafnGS0Uqsk8B67kTWYJbvThalKk6BQqmS1G8D7vMfz0eArX0k
 YipXvsNuJTkDmLrZcyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240065

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

On Qualcomm Hamoa SoCs, the memlat governor and the mechanism for
controlling the LLCC and DDR/DDR_QOS frequencies run on the CPU Control
Processor (CPUCP) and are exposed via the QCOM SCMI Generic Extension
protocol. Add the SCMI vendor protocol node required for the QCOM
SCMI Generic Extension protocol to probe and get functional bus DVFS
on Hamoa/Purwa SoCs.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 09527dcf9576..e9e75c4c4da6 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -340,6 +340,10 @@ scmi_dvfs: protocol@13 {
 				reg = <0x13>;
 				#power-domain-cells = <1>;
 			};
+
+			scmi_vendor: protocol@80 {
+				reg = <0x80>;
+			};
 		};
 	};
 

-- 
2.34.1

