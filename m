Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CAD338595
	for <arm-scmi@vger.kernel.org>; Thu,  7 May 2026 06:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778135027; cv=none; b=kMj5mOM/tyXNfgiSCg01AtXyKtyqety5TzwuvcFWaWwQbjcRVBARqQC5ve3V8WlJRSlxiiB4EUY2mS9I0Jx9GUoIO+upptcCmscWpIbMyJwqeEb1ArwFLPzc1g38qFr7TEZvaKBG1HZB39PHeUkbWAJ4RuJ+acB9FI+r7FRpJpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778135027; c=relaxed/simple;
	bh=UgfBCZ1rMfVTJev0k1z1NyPZBVmzJ4hpyWJ3luahNzI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Oea45vynBlhoXnW20z45S8JSwO7oTUQYF+8IAaKLuoKN2f0nR/TfZod2hQ15LjUeK+/5naVE81k1xX86KVD2vi+6v3aQmp64xbixrgCCQ45GaFdq4eiU6ne6aHMtmmOKP66pcih+9AzS16vdjo0i0Qo1JwYiNUcHEpV7k/aYgdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+GcArRV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L17CyGdX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+GcArRV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L17CyGdX"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475LIFJ1067851
	for <arm-scmi@vger.kernel.org>; Thu, 7 May 2026 06:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9rNAGIYUfdj
	1piWxOjlP8LFzd1d7wyZuV9JLCGPlDQ4=; b=S+GcArRVddDimIfm0VImbZsU8Jh
	BojGaEBTeO+nt1ue0Qo77p3y/UgonoABpbOevp9/nGuz9PW3MF8YD5gHhF3zl6D3
	hTbt6hN3PiAxkOddtM0HDKwxg/OVlFgQ3y+zFUoo+Ir757YYz0cSM3HdaX+Dc4g8
	JPOhe9WYHuv+8ys5rhJJS4AvMG1Nt/DiWN7ecMTuA8YRyDgBD+vIs10wF+mKJfPE
	sLqluSCWDcs9MXVlPhRwAWBCNFi0RtdqP0G5c3astwdk6iv7GGOBmCSmzCNXz636
	djZKA2peeZvhaK0RSj0lQgIs5gf5KcijeJQx9NmYIQFMRCOiydiW/FDeRsQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mh186m1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Thu, 07 May 2026 06:23:44 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-835417ba8c8so275908b3a.0
        for <arm-scmi@vger.kernel.org>; Wed, 06 May 2026 23:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778135023; x=1778739823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rNAGIYUfdj1piWxOjlP8LFzd1d7wyZuV9JLCGPlDQ4=;
        b=L17CyGdXl5oALRBZio+6gdnW45ltkjie6m1tAsCSlJeGR7AmzU4zLK7jwr0VxzldWB
         Vbh6CDDLRTb35mirlagpmKganSckExNvg+Ytj4DkRwMxPiHJpPk7js+zMNOAN5ISGs0J
         fIP7UM8UmfFKHj1X41PRSmp/2gPrmreGWBh8bx3K7+bhJAZiS8cWXpEdkKD8Hw+bL+7U
         tP57DKydrQdrw9smTID9dHkxhWu835mCYmm5b8ZrZnrCa8wIkt2G2od3MhrDtEtmsXj1
         Sl5vcFC6ztND+zLlzArqTB3UQ3WmY38USmfYoBXrpPZ172FE8pS53Hd4ntZ0o6EXfPP1
         /2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778135023; x=1778739823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9rNAGIYUfdj1piWxOjlP8LFzd1d7wyZuV9JLCGPlDQ4=;
        b=nHhQTT2fi/ewxjcr/Q2uifHqVw7/h9ozngjjFQjmZROdrM7CW+C1P8sjKrcJDNtJZF
         88UtHc6OkKKQmG6JBFt4jlsCoWWkyKUnKenIbmf0zRA8+N0vOfJ2SW4OB6ezG274PMcj
         NniPjudSdzhhHyUTmekM9ERMEEHCGVf1HTAO7ifg4YPj9pO0+DqKFlQT2Xnm67OIlHbh
         63By1nyloMq9mseJ9c7duNb5QYk3A21V0G50FNRqLPLht0jJvvFRQSN+ZoFzLzSEoPQf
         e0p96GoO3bAfxTyh02f/N+He2NEO8jxJf24AAgODghCeBQOAi6HbAT7BIjU64VvKU7PK
         dMyg==
X-Forwarded-Encrypted: i=1; AFNElJ8J//8PIUg8UWdJ3AfmeZU/4L6dEhluaaywAMsz9adQzzZWTynW/2/YvtQNxI1h5XXzzaoFRFbQpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMvp9QQzepSd/1xLCiGGya75VtPTNMBHzwSxSOn2dY0rhE26Zn
	71qeyfQIFH4PJAkrq6YYJYhklcDV682bIqJUMBqce2y+pbLOghTPAzHdhlM+TyvJOkU8r9o8E1B
	vHfnM+dUeqB5npu/RGiAMfNuFG6ov+B1RIRVM8GjOAui0tR6YKiIWCX6qFF2gsw==
X-Gm-Gg: AeBDievhzqcmAcpLTxblMvIkuuqFriYT5o9RW6cWlMNnoOePxzzCectSwXBqEoxd1gr
	Igr/VvGv1+/+2gXWUrkIJMrnYk7Q2VxUl8KR62eyHHFxNDSuGEdpyL7rsXmOdL/ZRxXoydId137
	jru2EkvZQTY/vtR2hRq7G/dGQQLHUkY/tBeWZB18Si34cWb23ztt22NGoawhldKxfW/2RoGEVGD
	qCEZpiNuKwkMmEiAelT4nLGg3z2FdgAxe8+18n8jw0r4pAMrshtpSwZvOQiza0HsVgipnllsZz2
	QOE8RWuu+gPQSkZfIESBsjTnCO44MIUM8vd9sn43fyaM6NrIy+5qpTWWlbF1Cu8OUS7gHxzZ0+Z
	oWtis+OeB32q5Nty1nYOLS1D6STgAWdkmQ2M0XhGxrHHlHtkiZAOyhWj1BpAGq9rrUkEouBQgCT
	NoNe5pEzdgIUU7b017ITSwHy2AjD8FKXhtbyZ2hOk1qPL4F7Bf56q79K2YQA==
X-Received: by 2002:a05:6a00:460e:b0:82a:7dfd:9757 with SMTP id d2e1a72fcca58-83a5b2d3078mr6499166b3a.4.1778135023535;
        Wed, 06 May 2026 23:23:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:460e:b0:82a:7dfd:9757 with SMTP id d2e1a72fcca58-83a5b2d3078mr6499131b3a.4.1778135023021;
        Wed, 06 May 2026 23:23:43 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965945101sm7346557b3a.13.2026.05.06.23.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:23:42 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: cristian.marussi@arm.com, sudeep.holla@kernel.org, cw00.choi@samsung.com,
        kyungmin.park@samsung.com, myungjoo.ham@samsung.com,
        konradybcio@kernel.org, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        jonathanh@nvidia.com, thierry.reding@kernel.org, digetx@gmail.com,
        conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Subject: [RFC V6 8/8] arm64: dts: qcom: hamoa: Enable LLCC/DDR/DDR_QOS dvfs
Date: Thu,  7 May 2026 11:52:37 +0530
Message-Id: <20260507062237.78051-9-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
References: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1ixXaraclq2q7aIaLNdLvcJLZs78jdce
X-Proofpoint-ORIG-GUID: 1ixXaraclq2q7aIaLNdLvcJLZs78jdce
X-Authority-Analysis: v=2.4 cv=P9gKQCAu c=1 sm=1 tr=0 ts=69fc2ff0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=gKi3Cb3mJvt5RuhTHbAA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MCBTYWx0ZWRfX5EjuznebVj3N
 YX3yAExfYeSvgiVv/M5PdP81kh/Lrh2phD7Xu4xmAb9Bdozsl4wSbYYn9adyZRBU2bVL9km8S1P
 CVMaixIPRyu7BhQu3jK/iHd/LqrVBN8jYXcaR6/VtTQtxM6VC8KfJXyOBhijxUZLXH7KLfpNi6y
 OZY6QVTxbIicyjXa4c2rAsf8AYwbVN/6frOphYk0ymIXISG1yzdpM6TUPMPjrklQHDk74pBmQ1/
 kRIZpYrNKdp/gyd8/T8xLA/Fz5ExIyua25yk5JmeplLOzgTEfcVoAbMG4eya5memiXJ7p8MQc07
 wN5bZzitbuui6AWr8HWCKkNTrRim4egHniHk7wh1yFL8jcR92zQxdu8Vz5VQUAoBW52s+vKyfCu
 jyAL9q0SG/Lv7BiMj0xTGW915vbCJf/3dgSeLvlbnMaOATxAnO1cTgu2F+NUCSWTVZfwXS9dZMK
 MyNxyjZMETh5NZUek3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070060

On Qualcomm Hamoa SoCs, the memlat governor and the mechanism
to control the LLCC and DDR/DDR_QOS is hosted on the CPU Control
Processor (CPUCP). Enable the nodes required to get QCOM SCMI
Generic Extension protocol to probe on Hamoa and Purwa SoCs.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 051dee076416..a2d5c9db984d 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -338,6 +338,10 @@ scmi_dvfs: protocol@13 {
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

