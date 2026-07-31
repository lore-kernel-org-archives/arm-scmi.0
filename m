Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A09D42901E
	for <arm-scmi@vger.kernel.org>; Fri, 31 Jul 2026 17:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785520192; cv=none; b=MIlHw3Cb+y58e3sDM0JtovVCRgAJe75D5z4COPHsKsCjlwulo4gk7ivcwpyV8ERiKP1DSWSOSG4eTnl8+eu4+iBycHDCaD+9pnyo7X2AMo/3xzVpi9vmk/DYgu5XOYzcKe4HZFLVQQsztD2ggGNuN104rVvPCug1Kta+xtu9AdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785520192; c=relaxed/simple;
	bh=iGDWxccwZWmudq1xpenMMfuPvCfVFcWc3QiYS03MwXE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=osjyMuKi+EBpckg40BLMsUoLHqrfB/jraDKWwCPJ7vi+5/rhC0AM+S9Gg2kn1uovn2kVvwrKEJ/AE5ivnU7e2FbSPmpBFz/H2X0xzlKQ8aHoG3yZsmkaZBrrqYgHJtsri0RqU5k0RetB2SrvlODVTqX0cZQ46zyXKF4oX5zQcnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Er/f7dqb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IhEPMMge; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Er/f7dqb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IhEPMMge"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFOONA507747
	for <arm-scmi@vger.kernel.org>; Fri, 31 Jul 2026 17:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2jJDQkrGJ2IGcmb+nAQyvEVUSSOFRfBkl2r33zU+RCw=; b=Er/f7dqbYVzezM2B
	oPfEZJgvGdinb6XsGB9zKxbqP0jxpchpMeWienOO/vIe3zw/4z6LzhHkk0lDVPfD
	xnuaWgytOpqdrJzsgjF10EtnvP1Lc/BP1aVcefbGos2OYzw8uOUqYkyMwJLVfyeX
	H9elwknoVevqhCsTCXyEXr/CgyIgE9YcWhX3yfiLGtdzaDyIKtie2th05sHBQnR6
	rcl011xhW26aCVMzweIOtHffJBhB9Yq5T7eJ9AeuDTN6qxQDgf3LHHWU2mIq/Afl
	d8N3wZjmhcisv9y2XH6ozcOKg52hkD3fNucLY2c8NSggQi0Bl9cX3ucGLh8YpqP2
	bRIJFA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru131q1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Fri, 31 Jul 2026 17:49:49 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb4cdf95b5aso2152532a12.1
        for <arm-scmi@vger.kernel.org>; Fri, 31 Jul 2026 10:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785520186; x=1786124986; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2jJDQkrGJ2IGcmb+nAQyvEVUSSOFRfBkl2r33zU+RCw=;
        b=IhEPMMgeaEmeO6jYnZhl4G7LzVeqeoIWSMdttanUrY7RQZRpk+bZlu+fEOzFWr/79e
         hLCtnhV+1ytH+yQmxAqD4IRBBWWD7yEUma5D+URh4SB745Uv6ZdLop/QUWQ6B03iWBmS
         uZm5SRQfPvDiUsEnbVrQxnvEkzp970Dbw7oUZKNwkLIEZYqUeXkAqqUv/KBuXIjeKxGL
         xv99IhSECeehO2insDfh0RwWnzcMxQ5Dp+GaQ8y6UqEkW31CvsqwZVGo3q9jWydZMx4L
         gfvrZ5tTCWiCADB/vfy9H9C5WYt1jtLSg2OJ3yOnnUBPKmmBIh46QB7I+CpKSOH9HKsq
         V6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785520186; x=1786124986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2jJDQkrGJ2IGcmb+nAQyvEVUSSOFRfBkl2r33zU+RCw=;
        b=C9IgJ+JyuqFGJfkc+/yoYl9s4i8tPSPvIZdhnetMXx7M0zWnKikACtMQqHbNmXsLZ0
         cMttg1dGsOK8sGK9eKEZ/+vW2inYOBprxriFqw5yrTdfi6wZuoESdBFsB5sQhzKYoQ1A
         GmgihoWjSL5y/cwnsi9NCZkmuqOwyOXbeMGW7edBNN9yUFJEppLq0ed0WlF/eDZSr3+Q
         iwxVF0cdlhbO/OmSx+VSq0a/XJoC+67MTLYHpacqLQ5RX+CC5RxDoYNSvAf7SLEV78ml
         9pMGsCuaoZgf7LWtSiI1yWZ7VxsqoldaLpRZ3q+HfuhnjCmhRB4d+dsAaHgjIpvS5zFA
         wEzA==
X-Gm-Message-State: AOJu0YxVLMBnTpAfr+6SGfetv+E3Sjek9IjhXPzLRtamV1KRwKHLCk5g
	yfzJsNSn/m86CuGiduDPXPCb7MaZu2onroWrs1yjqDWHU1kf8Ug6Mws8AYT1b2PKtzaXIF3lsWd
	R91U4J5JroukAAPGtzhRktxNwIB+tloecHiwuDomS65h2AgN1ih0A8erQlWiRdhdxpuCvBQ==
X-Gm-Gg: AR+sD108OFEmqKecvTaUvtAgt98fPvy46vKE7OlwXD+2GIwvnNMobYsDcledDdLpSDS
	kHwbUzC9g8hMTkD3V2ObYCAN+oxIuiywKFzkO+Gy8TMTOzCsFEkRXXy4ukHc7jYZwyBj3aJ4pL6
	ZZOD65C0vzYm41wNm0vST7d33G+9H+z3HBOjvDWxt9LWTaR66WAEARHy8VG29AbK0770B0dkRSd
	kKinwH8h86iH4zR7QhGcBFmXc2B8ZkUCeVwWzK6e4GubfZPiMp6r9LPWI51YKTK5FuHLacsRcu3
	JXjlT/eOviuGKEHKAh41maBL+qWe/f883mP7n0g8VoF/IZJQJYoDad3x+M4tyX24T0MjZEzjrYB
	skCDuv2Y1u4YPqf7B4E/QUMcdtMevJdoFfHkxH8E+9mrgb3t36Q==
X-Received: by 2002:a05:6a20:d612:b0:3bf:6c08:2844 with SMTP id adf61e73a8af0-3c92a8af382mr649384637.51.1785520185564;
        Fri, 31 Jul 2026 10:49:45 -0700 (PDT)
X-Received: by 2002:a05:6a20:d612:b0:3bf:6c08:2844 with SMTP id adf61e73a8af0-3c92a8af382mr649360637.51.1785520185197;
        Fri, 31 Jul 2026 10:49:45 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18e114sm15115660eec.28.2026.07.31.10.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 10:49:44 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 10:49:33 -0700
Subject: [PATCH 2/2] pinctrl: scmi: Replace pinctrl ops get group info with
 generics
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-scmi-pinctrl-generics-v1-2-8affd2b79a6b@oss.qualcomm.com>
References: <20260731-scmi-pinctrl-generics-v1-0-8affd2b79a6b@oss.qualcomm.com>
In-Reply-To: <20260731-scmi-pinctrl-generics-v1-0-8affd2b79a6b@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Tran <alex.tran@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785520175; l=3552;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=iGDWxccwZWmudq1xpenMMfuPvCfVFcWc3QiYS03MwXE=;
 b=ZVwlOkyO7IIa1eFn7j7UkMM2thZNnkjqKQpmlzHvVM5QJP13QMbu1wjFBawKwoRejru3rrIp8
 GqR2Z0pfIk/AyY7UdivrejV7vTPCyjqdlQRNTt941QICosw8IwGxWPF
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEzNiBTYWx0ZWRfX72+NEg/PN/Us
 9Tgxd5wrp+sUskhLmLzIH1hBZdYtU+01P9ZognKGz9b31tD3LuVfLI8hRXzTGhxE2qlX9Mr7ZWs
 BO+zsu89W8DiFg6bl9sHbozzmqHOMP0=
X-Proofpoint-GUID: 4TFba57BlG1iGvqDYTgGbAUfUXyooE2h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEzNiBTYWx0ZWRfX5Dm/dr6Y31L9
 9vpFE4zFeSORYGQP7jEYSF6AitV9xozJf2bSMQBkmUHxmf+bjoIqyLYbevYyiXds+ZNJrJRSJIs
 gy7c9e/PL2KGwqHp2+26c7dmUO9aEvZpQE4wRXn20lcOYQuapokA8ekyJhC1vIJa4UTW9QLienh
 2GX0a4dj4qgCtbK2B3hU34iPFzZdg0KqX+HFRc8sqNMy526rBQARKaXR0DSeAWclk+9Qs46aW7+
 e4GycDkVMgrbx4G7VAz+CFIGiOeOBFuOyy6pDfmkxRtq/ysVC+uUOdgyULrqJ2+bUVCu+zV0I1X
 /9eibbiOiI4dUoXZdMY3e3D2cezvFu3JcHvtqOj+zA3oLM03j9uynWAN2tzMqfkiO84gjwdR0X4
 5Kqn0TjOHZr4TX0XTyQv4S2TeMNrkTbMlj9OVlofGYwG6yMDEOqm2zPEKfwwTuZlUEVDyMCc+uO
 wNpTzmqk50c9UDF07nw==
X-Proofpoint-ORIG-GUID: 4TFba57BlG1iGvqDYTgGbAUfUXyooE2h
X-Authority-Analysis: v=2.4 cv=CYI4Irrl c=1 sm=1 tr=0 ts=6a6ce03d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=p54jq0OH07X71X_IsjoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310136

During probe, populate the pinctrl device with group info
so that the generic callbacks can be used to fetch group
count, name, and pins.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 78 +++++++++++++++++++++++-------------------
 1 file changed, 42 insertions(+), 36 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 3461c5712613..032b23fa17e0 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -40,43 +40,10 @@ struct scmi_pinctrl {
 	struct pinctrl_desc pctl_desc;
 };
 
-static int pinctrl_scmi_get_groups_count(struct pinctrl_dev *pctldev)
-{
-	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
-
-	return pinctrl_ops->count_get(pmx->ph, GROUP_TYPE);
-}
-
-static const char *pinctrl_scmi_get_group_name(struct pinctrl_dev *pctldev,
-					       unsigned int selector)
-{
-	int ret;
-	const char *name;
-	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
-
-	ret = pinctrl_ops->name_get(pmx->ph, selector, GROUP_TYPE, &name);
-	if (ret) {
-		dev_err(pmx->dev, "get name failed with err %d", ret);
-		return NULL;
-	}
-
-	return name;
-}
-
-static int pinctrl_scmi_get_group_pins(struct pinctrl_dev *pctldev,
-				       unsigned int selector,
-				       const unsigned int **pins,
-				       unsigned int *num_pins)
-{
-	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
-
-	return pinctrl_ops->group_pins_get(pmx->ph, selector, pins, num_pins);
-}
-
 static const struct pinctrl_ops pinctrl_scmi_pinctrl_ops = {
-	.get_groups_count = pinctrl_scmi_get_groups_count,
-	.get_group_name = pinctrl_scmi_get_group_name,
-	.get_group_pins = pinctrl_scmi_get_group_pins,
+	.get_groups_count = pinctrl_generic_get_group_count,
+	.get_group_name = pinctrl_generic_get_group_name,
+	.get_group_pins = pinctrl_generic_get_group_pins,
 #ifdef CONFIG_OF
 	.dt_node_to_map = pinconf_generic_dt_node_to_map_all,
 	.dt_free_map = pinconf_generic_dt_free_map,
@@ -454,6 +421,41 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx,
 	return 0;
 }
 
+static int pinctrl_scmi_get_groups(struct scmi_pinctrl *pmx,
+				   struct pinctrl_dev *pctldev)
+{
+	unsigned int nr_groups, nr_pins, i;
+	const unsigned int *pins;
+	unsigned int *pins_cpy;
+	const char *gname;
+	int ret;
+
+	nr_groups = pinctrl_ops->count_get(pmx->ph, GROUP_TYPE);
+
+	for (i = 0; i < nr_groups; i++) {
+		ret = pinctrl_ops->name_get(pmx->ph, i, GROUP_TYPE, &gname);
+		if (ret)
+			return ret;
+
+		ret = pinctrl_ops->group_pins_get(pmx->ph, i, &pins,
+						  &nr_pins);
+		if (ret)
+			return ret;
+
+		pins_cpy = devm_kmemdup(pmx->dev, pins,
+						 nr_pins * sizeof(*pins), GFP_KERNEL);
+		if (!pins_cpy)
+			return -ENOMEM;
+
+		ret = pinctrl_generic_add_group(pctldev, gname, pins_cpy,
+						nr_pins, NULL);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int pinctrl_scmi_get_pins(struct scmi_pinctrl *pmx,
 				 struct pinctrl_desc *desc)
 {
@@ -538,6 +540,10 @@ static int scmi_pinctrl_probe(struct scmi_device *sdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to register pinctrl\n");
 
+	ret = pinctrl_scmi_get_groups(pmx, pmx->pctldev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register groups\n");
+
 	ret = pinctrl_scmi_get_functions(pmx, pmx->pctldev);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to register functions\n");

-- 
2.43.0

