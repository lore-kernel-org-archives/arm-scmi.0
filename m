Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D683B8D5C
	for <arm-scmi@vger.kernel.org>; Wed, 26 Aug 2026 10:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740069; cv=none; b=eJ5oRPNcSVqe5vKOyf1Gic4AA3TO0taIOitiRqpTxzy1lZ+Xj4Hd7f3SAUBOqRVZ546xnlTF7aiuFIYnlwQ5o0mbmfZBMBSuZfs8VbgKpn7u73Gv3Gc3nqsfFrPE35GiOaKLSblVeyy68krgV2DQ821R1U+3YQh++9bx/3CmzF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740069; c=relaxed/simple;
	bh=Lf0DV6zqTiNRbRqg0PwFD+T9VOrPKtziLfLRHxcXw+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k4Uh99LCEpo99TEYCSNKgawbcuy5WztSlMJZVMbDeW3Rz2/f5MXnFKMur45Fds40jEsALSF3hLh2iyOsOpJ26Czkhh5lNKdMAT+uQpg/hqji5cNp8yX6mUDOM+iSE4wfZssOJOLMb7OUq529ISDNKbFcthakxdxp2t6fAfC+naM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rc1NaWyI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XSpgFzwp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rc1NaWyI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XSpgFzwp"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAHZeT426089
	for <arm-scmi@vger.kernel.org>; Wed, 26 Aug 2026 10:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gbJ+FmOGmDz
	b9CCf6V3nGKJG3Pm04UC3Lj/S2Ts4X5Q=; b=Rc1NaWyIaY7ZCx9lrwqpQlqjhuG
	Jkt1Edc+sE4suC4XX8di+BV6gXRtEKcWnDl5zOghZIQ3NmzVc5WG+gu8kL7NEKyv
	3+z39tbHV+FRro5ovW9bbzlreg0MhpZj1HkgcJrOZsAEYdIjHnPrbHTwckRidgQ4
	4Sh2VDN72DFdLj9j2O9BIBS+hOTfSKamgMX5jqdYGWpMNY/hr2o8J4AvJLoeKERw
	QGYkeOxZV/7znyLfr6e+lNJBWXMMnOiQYRD8ZSLqdHsF/f42T8PWSfYt1A7G8u5e
	WgN0RBfFdrRUDWfFC3E96RoOCfk4RyeHsircR6JcCSWTtGhTSfmOxEtPfYw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fceudmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 26 Aug 2026 10:27:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52ef04756caso1121091cf.1
        for <arm-scmi@vger.kernel.org>; Wed, 26 Aug 2026 03:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787740061; x=1788344861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gbJ+FmOGmDzb9CCf6V3nGKJG3Pm04UC3Lj/S2Ts4X5Q=;
        b=XSpgFzwpcN1C7C3ry25WKQGoW/ElMLwdjSffVFgMt2PBMbUM6IDEQ3Ry9mopaYh3Of
         a1hOx+2m8o5Su93e5Vr4GmXcPupqtK9oBcm2PG6RN3hZX6d+LNBFUenJ4OJRZhzz8R7W
         rfvyCf0XTjr+oM1LP5ny3qKlU3Cl5H2kz2y9Pxw1ublZqpcMqCIBJwzK4OuIe29iQ/ff
         Y4gg5i/VdiWiD9ZutBkHBPv7GdgcSpm3/qASueuIuMX+GwCmGNS4FhbM0/LWSoMJmRgx
         LG+bWgK595rS3+wsSqp1gZF48P2XA/+B2pNl4OCELEpdSgtCJmceotwJYU2U2Qyqu4+Q
         CMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787740061; x=1788344861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gbJ+FmOGmDzb9CCf6V3nGKJG3Pm04UC3Lj/S2Ts4X5Q=;
        b=T4uVgOChdF+dl6iS0/pYZC4pl/0YtgPg6/RRBaIT31ACu+cBZxZX/ZpldhZZPWF5WR
         1q3lP/ZpXXWZRwGjXQLY84PITe2WTyOBWL3jTtgojQFkjc+DQYSpN2YgGxIAaMS7xsSm
         7jShp8XY4bVifLdPmkDtkulYAFRH9ksVNyBICwBUJpHjKVpp/VuVdJT8yo/Sa2GqsB7N
         3D/j9LODiMYj6s+7ul3CMgdlAn1Mprf8fqLHCuohVOn37I9Xp9bk1alaI5TxsoUhKSj6
         BQhPyGq4+lhua3a7SOQROXKcXy0Ky8fyZWRgM9Ct3J5tvAyc2UlHRorNNTp36v2aC7gw
         cPaw==
X-Forwarded-Encrypted: i=1; AHgh+RrRHIHel0s457YzMYuEpyn+AFr+JQYTXf3Iw6g4sXe6Wa4F5sB1LV3kp/7olBx3VQp5pmkkfuXO/Q==@vger.kernel.org
X-Gm-Message-State: AFuF++noXZFki1yfFZ2m7DVMU32BzX/bM3Zy+LQ5bs6xu7nf8rYalKKV
	PM2WlFVWRDne0MgAY9zK9ds6NweB/YxpgO2i8hiEtz01FK9rsOtm/bODmUojYOWcF+cmQl2RxcQ
	YFp5ep3DV/ETY57oK+yqSJEZjL1JkcFcpLsq3gw0HrAyv6azk/wDAEsEXwvPe5A==
X-Gm-Gg: AR+sD12PBtJmLbfrpru1HzJ7NqD/Bvz1sWTsr1AfZDyHwMpLyKtdH3i0Ay6qMC9iv1g
	uGh5q0T2ULsfLKMZrzKlXeul6ZTq06VuVk/c0fknaG2fQhIQPYGUlrLCw1Gh5ASAMdo8lv+EOl6
	8oCqGFvjc3J52hLq5oA5zRUCxYDdHM7lvjWYRf3YtTguRa2PUHYFwdvJLebbh4FzqnUt41srKrJ
	Fa2Lvj8Iu8chZtn9PxmiANvsVGjoz4sic22jARXvCO7Gw/UZfyeemABF5RIKc1xBNlq/Rft1qNl
	3KDmJrXixb3nkexrbyhn68etd2tmhrh0uXRdusuVmkQH9J6jGKzzTjdsfYGOQj7R741UftXWrbv
	QqWiQ9EvB2MZqrHACfLLNrN4UBVdMbo06HIPDCW5Ofv7qH+gnAwEesSJml8dRCEKusokHMEyyjX
	nV/ZJb2wGHyM4i1jg=
X-Received: by 2002:ac8:5f10:0:b0:52d:6afd:7db5 with SMTP id d75a77b69052e-52e4230c933mr43890941cf.25.1787740061245;
        Wed, 26 Aug 2026 03:27:41 -0700 (PDT)
X-Received: by 2002:ac8:5f10:0:b0:52d:6afd:7db5 with SMTP id d75a77b69052e-52e4230c933mr43890631cf.25.1787740060761;
        Wed, 26 Aug 2026 03:27:40 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d68d1sm506364966b.11.2026.08.26.03.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:27:39 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] firmware: arm_scmi: Pre-register protocol, name tupples for IMX protocols
Date: Wed, 26 Aug 2026 12:27:34 +0200
Message-ID: <20260826102734.31766-4-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826102734.31766-1-johannes.goede@oss.qualcomm.com>
References: <20260826102734.31766-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a8AAM0SF c=1 sm=1 tr=0 ts=6a8ebf9d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=88Q6Yv8u5fullXUEwxUA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX//RJxsXDEa+O
 2lEXc39RBXzu6h9BBbVtAq6OAVRAb4FOigTgpIdBYCwgVT/kpf5G/BgbCKq5KxR6nE65zTNAw6t
 PEV/z/purLs7s9WcbrKESV1f+MAJukg=
X-Proofpoint-ORIG-GUID: Tec0KGIkgvNLdwJi0flNF5VgB1zIrSFT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX1EjOZtihwioa
 /INKklNtK8zkPTAnHLa7QS3rXrzf3fsfqAe4gX8PKBl6mhw8/hO7Dnf6IwJtQORhk6Z0SEbmFJk
 TbO9NE+yNqmsLBQZTzLDx06oB9le4D6xmJPttc8OabJr6Nojmq/HV6JljZAF3hWRsP+nDF44Zfn
 UGVZNAVziXUGcyWF0x9ElfHn5CcggDW+81kVfrXCnYNDr0Um+SLIu+aNJz61p5BX/SFawVTt1D+
 RPfUoLJyaHCrMEzwGl/Ec67WvMmxu4ofNOsZx5wQua94mqKxriTxfWltr5hlU3C3/YzD64TFULI
 7hr9Cs9UUjwhnHohK7N2YZEkuWeyB5lYmc8L1s7O86/dDem0svRe6fUSYzn0D2GVruzB09nFDKI
 H4wc9s161yVY5OjgagygaaCmdwSZEJDNUA6bjCbQEP3eopmxTBg7KbHUfNpyP9Qaflo2sd0UovT
 vFmCgtVSYD6myEsRoSw==
X-Proofpoint-GUID: Tec0KGIkgvNLdwJi0flNF5VgB1zIrSFT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260087

There are in tree drivers for various IMX vendor protocols, also
pre-register the { protocol, name } tupples for these to make module
auto-loading work for these in tree drivers.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v3:
- New patch in v3 of this patch-set
---
 drivers/firmware/arm_scmi/bus.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 111727904a89..9f5740dc606f 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/device.h>
+#include <linux/scmi_imx_protocol.h>
 
 #include "common.h"
 
@@ -580,8 +581,8 @@ static void scmi_devices_unregister(void)
 	bus_for_each_dev(&scmi_bus_type, NULL, NULL, __scmi_devices_unregister);
 }
 
-/* Standard protocols table */
 static const struct scmi_device_id scmi_std_id_table[] = {
+	/* Standard protocols */
 	{ SCMI_PROTOCOL_POWER, "genpd" },
 	{ SCMI_PROTOCOL_SYSTEM, "syspower" },
 	{ SCMI_PROTOCOL_PERF, "perf" },
@@ -594,6 +595,12 @@ static const struct scmi_device_id scmi_std_id_table[] = {
 	{ SCMI_PROTOCOL_POWERCAP, "powercap" },
 	{ SCMI_PROTOCOL_PINCTRL, "pinctrl" },
 	{ SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },
+	/* Vendor protocols with in tree drivers */
+	{ SCMI_PROTOCOL_IMX_BBM, "imx-bbm-key" },
+	{ SCMI_PROTOCOL_IMX_BBM, "imx-bbm-rtc" },
+	{ SCMI_PROTOCOL_IMX_CPU, "imx-cpu" },
+	{ SCMI_PROTOCOL_IMX_LMM, "imx-lmm" },
+	{ SCMI_PROTOCOL_IMX_MISC, "imx-misc-ctrl" },
 	{ },
 };
 
-- 
2.55.0

