Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D0D3D969D
	for <arm-scmi@vger.kernel.org>; Wed, 10 Jun 2026 08:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081583; cv=none; b=DyqiGNI/DoIZsz3/9YdnocMUgaa6G4KaoTXyFUtHW0EIbAfCmEgA9Z+UkBoxFBa1EIp2PnhzQ0TusaF4Pfo47tNnqa+KoGpeslbPy2bmIpuf6c40CPqFw9g+5qunmnpcWA1JFd6hWqrfd2inD3MauAMxkAnkdrmcFCqzCyK8U/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081583; c=relaxed/simple;
	bh=Er+6CpPP1ags03vijO+dnfrgarxZPqsc+RHLcBYp2zM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OAY6/VgKNhc0GKiqXYNyRIgjqjppLatEVTa+6npZvaI41j+JfxEvPJWHqw209pWcpOSnW5MZ0dfx3DAxGo/hJcBRJ/1zgPjcXNU4l1UIdx1P7AUOnZKJvQDjy5PbmyenSSIQjdg49XVPfcRqoq824w1gYNLNtddfHvkZHhl0Glk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I5zLGlEh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E2l0fIqi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I5zLGlEh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E2l0fIqi"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7iFZU567687
	for <arm-scmi@vger.kernel.org>; Wed, 10 Jun 2026 08:53:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QVPq+6JkcreslYPvbFLt1vFStJtpeN3cu1CStIhk9yM=; b=I5zLGlEhNhmMArLo
	xScB9BRdbFxzmPwZiu6nYT4n9EKy8qkBiIl7X2tqvmDQdasx1daFB1a2WsbqIBaz
	E9W6LoJgrWghQoN0uqjzfAKCqSMKGzsh96zMLtNOnOKrmBmjbVv6ry1KjpTVqb+7
	gN8PuVsmcKXrb8LuULVDj0+qB00zK/YJBQMgpmbAlTSytWkf4el4/K1bA2Fmo9Kk
	EXlgZry4ktwTcf4HGpVQcyjBVcG9y7XwO1+ziuYVxA8jen0TECqSjG6AWpM+40RJ
	1ZOZmLNLyHPUqgWQNM5xaMQ/mhRmWi/1F/biFcmJMsFDeNlmqwuWQMvqeSlCgRja
	4ExBbQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3jwtsk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 10 Jun 2026 08:52:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c32f4b1bso67320575ad.2
        for <arm-scmi@vger.kernel.org>; Wed, 10 Jun 2026 01:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081579; x=1781686379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QVPq+6JkcreslYPvbFLt1vFStJtpeN3cu1CStIhk9yM=;
        b=E2l0fIqiqrc6nW9VozZ8GI0mrMjjCmWv4CCCRUKvizFAoxxDz6niuk7dqhU5A3w/cZ
         XVs1cuVqcxPEgLT6pboeH/xCB9IZ19/k6BHKC238F3+JfQbuXW0krVeaxKdoLDjp+x6s
         meyFxSwIxp5wi4zdsbrsPthWQCTlYSB8FvFkeZa3mds7Shh3pwnjPxZ5K8q1ZwZcjUGC
         +zRTUY2/rzmvn1O0Rmrn8g7gAv2g2zHJt6ELQQ1UUzqDxogWz0+is8E25Dj/T8MadZhg
         qzC6oXFYTcozW1r01ZmJElr5IqB8LcnGhd0x7JQ+p3bBfgx6wCG5tfTnNvccgAlnGtAB
         5Kfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081579; x=1781686379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QVPq+6JkcreslYPvbFLt1vFStJtpeN3cu1CStIhk9yM=;
        b=L22ERVjlsLE0VUp5UAhlVo9UK8MV9WAts7v/39qS4/I85Vh8n8fdYPledQHOe+6q5w
         m7xpWbpxGBvVlRGvypi7UcAPa5aWtI1qzUGgjHPKUdwPaLlVJNF6mungM2YsILXGSFPj
         NH1VU7LHUGA9E2Hddu9U7g9Fen5TkFj9Zlqo8mX2mDqEWVSUpxDiUdaU9vd7+uCDuRw1
         c7Njjvh3SsK2V3heITcgVOt/Sb63Wdh4TQqSJtIZpxi3XTOMbAS0EpQh75aO0IvCn9hi
         BZddbp52HdfPgwv38qd7q7r0fg+X4LZfq8DWHtt7du5flNVLwFTq6kY53Vys0VACoAwB
         SOlg==
X-Forwarded-Encrypted: i=1; AFNElJ+uboBewFvpvdQ7UTvmXOEvprWHCPJdTpd6WsF+kJ8g9KBbpqZavSUcuJUlI9ycPlG4jHFvQnAs6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvE0BdHjGWoa4gVqpxPgG+RsjL19Z5QgGGtoi65ucnM81ZNl7D
	i3W7tNIA6dEm82LfOiaa8GaJc3QL6gwHFIsxhYiznaeEu6I2KFQIb3yE+m9vdCPF7/AYTXVdMLH
	V5TNuzWlV/yWYvht9zL0d2PFC60BIqMf1Mq550xwnWDwcCaUygb8vgDHIkRTPEA==
X-Gm-Gg: Acq92OGSaG+k0Isn6kBNN0Cb0ZtJx32GiNM5ubSsjF2VJjpzW5lURk+azj3jO0C/cIy
	bCHKpkgGkft2Vxvn2jJxOuxgIlBvjBgVHslkMF6k+XombKYH741JhEI7omzxl3kYKcKzT9ecmqR
	Q+P5s0B98pG5ljiCtA8QIVvzcQLc84fY8+RM1YwSoAb8PBwyWMXewjThzUAPbDDuKvo7cV1Bm0R
	au3P0H7L2wHfkZZG4yerIxQEWFMAeUgT35Cq9DfeGdqM3Yqf1fYfa9lrBmTW85aSIxSKvbbL4uS
	yPyHDgar6k55TDHUJEDN9mXBXGHAQYByixxhVdUozlqCcPsseuBH2m/162K5dBqQUZbpXU59yrR
	Wa4cJ/4utEgnc5BrjwYXq81PUbfE/qg+TiHXI+ZSvhgwOrhZFyZn+Z+efS3ILM9R8JIxbNlOM6r
	3UW7XiOlyPoERCJV3ziLgoxZtFyUNwn5FOnZuzCbjPo98PHPumYlGQx5BPCTs=
X-Received: by 2002:a17:903:41d2:b0:2c2:1982:5270 with SMTP id d9443c01a7336-2c219825471mr224351695ad.21.1781081579145;
        Wed, 10 Jun 2026 01:52:59 -0700 (PDT)
X-Received: by 2002:a17:903:41d2:b0:2c2:1982:5270 with SMTP id d9443c01a7336-2c219825471mr224351445ad.21.1781081578690;
        Wed, 10 Jun 2026 01:52:58 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8acasm114618175ad.45.2026.06.10.01.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:52:58 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:21:36 +0530
Subject: [PATCH RFC v7 9/9] arm64: dts: qcom: hamoa: Enable
 LLCC/DDR/DDR_QOS DVFS
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-rfc_v7_scmi_memlat-v7-9-f3f68c608f25@oss.qualcomm.com>
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
In-Reply-To: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781081505; l=1003;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=pXpBJ2FMnY6lmbenFJPBDk6Hui+mpMlqsnwiYYUFJmo=;
 b=uT4AQ8s4GwpWbVI++rigQjrmSyRqAQMCzp8wBbLKhIUF3mfkUffjvFW1pE/JgbPI1qyccp7MQ
 4sSndpiP+qnBIfJzgN8ufxlztds4HuRMkws/Lip7QRcUDuuys14yYEs
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-GUID: OjKuZRDcsi1chZnP4GVz_ztE2V3o-YUy
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a2925eb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=8E_iI_7X9U7aA52Mj5gA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfX1dTbyijLLB5O
 hYxSTptmyXoSghVo/tjHNYaTuuMKwgofOOiUhVFDfsngMgsCgxe0O0B81ahtV4+D63mS/kiHApu
 be5gwJzmhoX0a7zk7zl8DS66zNw51Ybxi20PiXjxsNU1aKGAfbVwZp4dO112VVtINd79mhqj/1j
 9ztrXoKR6ARAgCjr//W3Wizwdvjl0w5Pl9TWdgslrKdXVJoCqV8FFhAW4buTjDw7VJuAyPQuGp4
 /w65dAXyW54Bw+r4jzs3Z8fpy66kLFn/i8Pli9PwRJKa3bhax8aPitqFppn5QEKAZxk7SIBZLE4
 fmcsPen7KRkVu7I7oOMKyBy+7jFvLG3CPFu70uc1WnzVdsB4/NStnQd+F+4Fat5y+boK29lHmHR
 UdM02V+JEUaoMx6cC1yEVJEfj6jApgLL+gKsQLtdmn0XGfdsyZCApAyfzNh2WrLBOYOA/25qdsr
 wm5U1JJwqcOXN73TSTA==
X-Proofpoint-ORIG-GUID: OjKuZRDcsi1chZnP4GVz_ztE2V3o-YUy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100083

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

On Qualcomm Hamoa SoCs, the memlat governor and the mechanism for
controlling the LLCC and DDR/DDR_QOS frequencies run on the CPU Control
Processor (CPUCP) and are exposed via the QCOM SCMI Generic Extension
protocol. Add the SCMI vendor protocol node required for the QCOM
SCMI Generic Extension protocol to probe get functional bus dvfs
on Hamoa/Purwa SoCs.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 4ba751a65142..abd3e4bb9372 100644
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

