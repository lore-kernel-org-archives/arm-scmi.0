Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746BD4ACC9E
	for <arm-scmi@vger.kernel.org>; Thu, 17 Sep 2026 22:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789685796; cv=none; b=JEF/xGWZrwtPLlO8BzJhm/IuaEGyJb6BLoTaSi4Vlr76Pv5uQmfiBhDmDndydthrjTUekAHfEnOrzXYw1vp2N/rsrRVFrMrWNbAjOtvfwpzh3k9Vsr61IAxONU6AlvBsWCJiq/EnZe6tRt25+8aHxMw85fPk39QX2NLi1TzzxLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789685796; c=relaxed/simple;
	bh=nSbXNq1OJYe51dl5okOjHM4uLmUxr4IZI624Hov2mXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cIkA7e6ONX8Xkid7Vs6maE+hp5RVEz4o08CSENQKLtst8BZapLTuf8pBVm9F5Wpj8FWjUubKOzffyLWDYZT60cS56gad7aEYMOYfJs4Cluqy52nedIwImIxcTaKJdNQMrCie7n5IERZCR4Ajnm862GfSu02IoWNNn3nz+cBOlyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jZMepdNn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aYiUr0z0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jZMepdNn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aYiUr0z0"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HLFfur3088696
	for <arm-scmi@vger.kernel.org>; Thu, 17 Sep 2026 22:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YxlxRRDVK1vBrWCas79ZIfg+L1LP4XTtHA+rHF5ADps=; b=jZMepdNnQHPlWfp7
	/eD7VWcoFsNazO/PCdEXpvvI+fDrLQsGWRl8KShHMrFPSaQmQixaCEL26H2lzE5d
	66oOXyzAfD+j3tFBwbhzycez3avWc3wZftAQKhJNLc99fwzjK3nENz1QV4dpI397
	OmrYnN7AOJreJWtbP/aCvFlYgnuVf2w5M3TjAZbExgB7NR+cBXyP8ya5HQLEOI3x
	HO5nrnaCNe1SX3PhsVKaUkZc60DUcSCA4+k7Qa8o8owQVDqoxNMqMUBqTKUkvFjQ
	E3ryxk2NJnsjJu6X00vnpKHZ2kobakOk6OKQbqHisbjeGKchj3y/vCHGxYy4eqxh
	44awaQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grnqe8xkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Thu, 17 Sep 2026 22:56:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so386708a91.1
        for <arm-scmi@vger.kernel.org>; Thu, 17 Sep 2026 15:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789685792; x=1790290592; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YxlxRRDVK1vBrWCas79ZIfg+L1LP4XTtHA+rHF5ADps=;
        b=aYiUr0z0LUlCOEWFJWkYXwNAAoheOIrP2dwSntECyrOFHhChCfcaQFXDTgmGddQwdz
         KJDQf5Wj1Y8frwuO06lmGev7Jp+AboN1Se7XVHKxC542nTFQAdcWQ6HFNgug0g//hHR/
         6nVXTOf+24mX1X5ZMmdG6AKvuEjpk8lao494yGXQvHPjVY6KQX30EAj7gPI1KwQXaS4Z
         fKh5cUks9bUwuVfEgqknYmBqZ+4VqkQAEW5iQ1AxkpOQrLaZV8dhVJhQ02NdCdinuLix
         7JETid0ZT3rapsQWJ4mOqmT49it9J2X9eZ4V0MQi+bNx2nMAFed5SpcRpD9tQ4EtojZe
         sZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789685792; x=1790290592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YxlxRRDVK1vBrWCas79ZIfg+L1LP4XTtHA+rHF5ADps=;
        b=btJPXwePcqs8bq9990TDCXzR6mV3Pq+nS1o648ZEM8jDYo1fkOENC0O1k+jvnE7o4C
         QfXsWsIstJqYC+kyGh+3wfCSWO+6U43oQVM+tCODWPprBi3rE8/iQ/H9WZ9PpOkHEBxC
         spOO9x/WgjUcs0/PPxPEnfNYN0+LpU5fABSoCGeuVIJx+9QIDGJLr+2/OHeuL5HJ9rrQ
         LFZUJANQOImE9Xh8WIJDs0zAJiTrgxMfRvBCRRQ2plEVW3c5uqmp54+ZbllbaRW654Fo
         QuKnAerwV5fG77RVssR5bPmxeAG8r3DV2wZLpuQ5Ko0PJCd8BXHlPdSfUyUtL2jiYIjc
         y8Dg==
X-Gm-Message-State: AFuF++nuyVGEjxckYQ7lKv0bSZUVeZCouaKh71aeuryLimmT2P4JvDk8
	PSAsLo8XajfR+zQwxPKmNg6EbircjqJydcGcj7V5xngYvpVjoFSt8/3eyH6POFGLkLlXXXHXqKD
	qmY1ykYVE0gHw4zLQlWdBS0CA/l6LoE//g13fp6slicy3YO8wS7OaTgcaj2MoFw==
X-Gm-Gg: AYBFou0RJNhZNywe33C8aITp5kGHHqrXxBzhZya9pfXmQlV+8rs26l2Vk9r7QuUVTnm
	oUUfS26voePKB+wk5lzvb4Zrc7PrlrnXBnao9FUKQqzTMiNxZj2Y9/PMkgyLypfXVXCkzCn0T0O
	3Tz4dEzwqrgulF+wTSn1nM0hdFd+pELBu++wpD/DWDZoSQ3RrFekb646JD+7Oo/sBeooDurmvk+
	km08oB1+sfrs5ioz9JysYyduJlrD1OnRDwDjxSG4S4gVc7/d4nskfQ/ifmWZGOF6R2J6S5mHIAS
	kqRkD9DpfHE9NW7knDYbIbb8kV0woKk9/pbRObnp/dpSl1VaHfDmMzdF6BROvEazrMhPT2tLQ2i
	ybw4VKk6MevWhymlXC4LXq6q2n4faVlJguu6LkdsyXGWkqhxT5Q==
X-Received: by 2002:a17:90b:17c1:b0:39d:f2a1:3a with SMTP id 98e67ed59e1d1-39e54c19b62mr1267906a91.15.1789685791796;
        Thu, 17 Sep 2026 15:56:31 -0700 (PDT)
X-Received: by 2002:a17:90b:17c1:b0:39d:f2a1:3a with SMTP id 98e67ed59e1d1-39e54c19b62mr1267874a91.15.1789685791376;
        Thu, 17 Sep 2026 15:56:31 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5ad25bbsm15812508eec.19.2026.09.17.15.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:56:31 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 15:55:57 -0700
Subject: [PATCH v2 3/3] pinctrl: kconfig: Select generic pinctrl helpers
 for scmi pinctrl
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-scmi-pinctrl-generics-v2-3-3eeee364257f@oss.qualcomm.com>
References: <20260917-scmi-pinctrl-generics-v2-0-3eeee364257f@oss.qualcomm.com>
In-Reply-To: <20260917-scmi-pinctrl-generics-v2-0-3eeee364257f@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Tran <alex.tran@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789685788; l=746;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=nSbXNq1OJYe51dl5okOjHM4uLmUxr4IZI624Hov2mXg=;
 b=qt7oMd5cieO9tBGCHfxsL5Y3SMPcyQewnlHKqaYhCp59AL7QHCz4Kd5e0fL1RsGXRpuU6UHP0
 ksK1xR5Hw9qAFoqa9WBQpYsb+g3biaoLgAEB7r62smDxGFoG6dVpub4
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-ORIG-GUID: yvD7GEdJuQAApQ2LP9ggFgULbN38GdsS
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6aac7020 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=eVtWBnz9pTluID88zzUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: yvD7GEdJuQAApQ2LP9ggFgULbN38GdsS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDMzMCBTYWx0ZWRfX/YN94mw0Sin4
 ro24q7eNa2LjStc2S7+Ks8kMmOfW7Jl76zFDGlr6Xi+ZxFIOQlUhKHaeGgDxle/+RNRUips9NX7
 KghZAPjxCJQaQ1Gooi2H4Gd2WioBDGeek8RI1n2U43zAZFhmefoaBqDrym6ru7soQ5kx6KpWU49
 mw6Vuz7x9L1qXK/VjiPQuKM/KwKU4/XtTrQEP9YnLuAnor6L5vHy7P5pway3SF1VnvOlvaobYFi
 G4T4fa7X1XgsFalriIMLO2EW8MHv7udyDb832GLqdhOc7kVHaMw8MA2DSBNSKcFZyATNEMrGyMd
 Ecodn5vfz3ZODHdWobQLmdzCQSk5p6ftqmVkn0Ovi8fDles9zRaRqFtiZyTo2YRtLn7cB/bCq7o
 XxU6bFvdnBvm8VD/PbJeXdiavGGMMvdnHlJZhlmFS7xPoinczlSp/7Jzk4kKcufZh/AyUnYGQmS
 yIK6WuPB03mQalZMhfg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDMzMCBTYWx0ZWRfX2DTXgUuwwun9
 8vGBkQDxQrZ5+uzyoBnuVtDSAcWzxEfwQkE3DAA6j/cdUuIkwdcX+CxqVQouev2YnBpUIrbBXhG
 U6fj9HHDRuV2is6Fy/roLWL6xxcnKTA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170330

Select the corresponding pinctrl and pinmux generic Kconfig symbols
when PINCTRL_SCMI is enabled.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/pinctrl/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index c2cdd7b2c49b..c93f0bfcd7e9 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -532,6 +532,8 @@ config PINCTRL_SCMI
 	tristate "Pinctrl driver using SCMI protocol interface"
 	depends on ARM_SCMI_PROTOCOL || COMPILE_TEST
 	select PINMUX
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
 	help
 	  This driver provides support for pinctrl which is controlled

-- 
2.43.0

