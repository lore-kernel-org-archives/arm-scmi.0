Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D073AB466
	for <arm-scmi@vger.kernel.org>; Fri, 24 Jul 2026 07:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784877583; cv=none; b=K68KC07ISc1+DMINtwFZjE+EgcfWArvCpWi+fYGMV3rStN2kGyGKu0Ts2tk8DmujhLLoyfNi91PBTeAQxX4m3nFF9z6qPG1bVzAQGHZobDFVlA1LTVtFCJnD68kRV/kiItPx6M3UuJUIk2jnMIguB2IUxjmXN94E9XyjbjCYhTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784877583; c=relaxed/simple;
	bh=Yo9zeGbwbXV4rUNiXUL8lzuk9/G4RJrD++wGm42RLkY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tHcHzXNNWgvVXolTqGnrI06yUgElvlq5FD9Qm2ACfHpd+ohl628OjKSgxz5RVGojiXqpnEJj0XcPCkrm3j6lylF5sr/BlB3fd5iN7NVbkW6CiV7E7DV5Ri6C7vHCNyHckCCUJ6KhAX5crZ7LYUi/q11nyxwTnL31COITxPBY3qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KNjt6WWH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SXuoWpsx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KNjt6WWH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SXuoWpsx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lDNa2137571
	for <arm-scmi@vger.kernel.org>; Fri, 24 Jul 2026 07:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zNUV/8sm81bezTrvcZDm6VKxqfl3WlqL5X0WFl+eir0=; b=KNjt6WWH5tvWXHe7
	unp+sXXcCLjGMuI07DlpqLnEuuZXxTbUeuBRjiFsDdILuuYdT6RQn67fhXiTDbnn
	1aNbWS2ZakqlYwG2BK0QFViz7UIx7V8dMELyVBz9DApu+AWSKN6YynjDr37j90I0
	FkmjaPqC7NzrAqRbzFP/F/PY1ghIyIpf8UGtcDzUdgK3MYkX1Lri0k5OXQGRi5U8
	/Vck3er5tUHatkQMKo0SfbU7fWPIJpMH5dJGg7QQ7m5c0lXDH4xhBHqEvAQGNHu2
	gyeinpp3e1p8LAlj6bhogJ5aqft+nvxtHTtK2zcdg5i5jvbMDxaUsJJ/uOGFJe8M
	PJ78Og==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa1amxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Fri, 24 Jul 2026 07:19:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc88e22f92so3860195ad.1
        for <arm-scmi@vger.kernel.org>; Fri, 24 Jul 2026 00:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784877581; x=1785482381; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zNUV/8sm81bezTrvcZDm6VKxqfl3WlqL5X0WFl+eir0=;
        b=SXuoWpsxcJLLrDUkgFbd++IL9gyMwvNwHa6+x56TNXVh4S0SYG3TftZDbREsG9OM34
         ICNgJUJlKJ4fUporLdCkB9KlNu2/c2N4atVDGmior2tXomQA/snYZajvMpEyIqdJqluB
         XZEGJIrZQ4ifksyQy/uzuCqEbNeSgxfbWjZPWszgDym25kBHW+UQ8Lt9Xx2DAy1cg+OY
         2OyESZAUtp5/g72UEKGC4z5zzPrxsgvtKps3poW/wZfhBfDh2hk+jvXqMVsWtpsH3v1U
         YWCVeyZcFcEioGXD18es/VyHrLFRaPQkoHuyaFtwX429rXbTin2dZ3MeND/+Hpv19QXG
         e0zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784877581; x=1785482381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zNUV/8sm81bezTrvcZDm6VKxqfl3WlqL5X0WFl+eir0=;
        b=bBkU087NNPdQHSl9mtluUR6Ci5HYK2Z+60Tk7qiKuzCvBCEtzHuu9LegWQKYCxD7Ji
         QusHpsFcYxokXKyAPip7FksUfHx1oL5Hig2H7p1MLLlkH+WaQGlWp/kpkygbRXoLLJUT
         vmpFoqHXI+zfEo4bB7MFWMzX8N1KlTgBD+n659Uv54ssc6BCtDKJKL0TcWixUK1X1QVm
         Z2c+CW7SVVxNmIPkj3hu5r1WdhH12FrUiOb+5SMNbDOp+tJSyM4rolanfzaYBkZh8/j5
         aK9lYkMxiUahRkcaU/o5I8yN/9iVhy+OrmWaFRJfKv8DEu+z/j1J6uNQopOt9PHIY2Xc
         UmUA==
X-Forwarded-Encrypted: i=1; AHgh+RpZPCLQNfm87L0vsePG+6FUTqI6SprqmjDM/o2ygkwcSTlXeCb92C7jed7+HTdUJGp6fcJrAPBcOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUb5zygEOSrxdV6iAG1NkuZG4F1ly28PCZoXkUKwe0DL4BgklL
	zqxvcPA7zT15pek8NXnSFa81Rs/09bSU57/hjumWPn010A85HuQ00xaFYWtdlaPnCmpO83Mv+kl
	QnUCZe4awsOAk+MpNy+LhonBYmxoHBMh/m+n/zXqdI8/n/CWPUf5hTSbrVxhZBA==
X-Gm-Gg: AR+sD10L7nd9bObGlTHOfSN9cJBAfhYJQv5iPwsxfoOW5uB6CY186kZSOXVsssoU+O8
	vJNxmqKdpvb2YjLBEZO4yYDoM1ok1tI0yEf21yfD8uTtSYXPo3IP/3AdcIX36mCwcc02qHGXPvS
	m4gwSFmIfjqbbN/LoP9DxcRv2YRUyBfTrq6qqz+S7plyUGmyEAIsfUBTRu225LQG5pnWh+a+Uhw
	50kVMFG95khgfa+TiejAsPkDLCBRT2YPJm2JEXHoyw9qPIAMbtIg4p/q0leoMiu5SobctmjRvvM
	pGt7PvFu/lZskNXok/1CWeuboJRGpc+D6+xt/f2WuEG/7OpKpcghrtc1YveYXRswMqN/O7K0uRX
	yxZcedYLzDJDLjgQAGD/mmoNOxsp7a6W9vetD44YUJTL/rU+vL9GR+W943Ge4zFmgtWfRsHKPu4
	sHtiiQHgw5buXHgc9K/zF12wRQnFA=
X-Received: by 2002:a17:902:e850:b0:2c9:9a19:df with SMTP id d9443c01a7336-2cfa71dc761mr69959915ad.18.1784877580470;
        Fri, 24 Jul 2026 00:19:40 -0700 (PDT)
X-Received: by 2002:a17:902:e850:b0:2c9:9a19:df with SMTP id d9443c01a7336-2cfa71dc761mr69959385ad.18.1784877579885;
        Fri, 24 Jul 2026 00:19:39 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efe3afbsm45993805ad.33.2026.07.24.00.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:19:39 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 12:48:13 +0530
Subject: [PATCH RFC 08/10] arm64: dts: qcom: glymur: Enable
 LLCC/DDR/DDR_QOS DVFS
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-rfc_v8_scmi_memlat-v1-8-cb732bcff1f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784877514; l=2333;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=aJgvkeU1hYS46AIZM4QP3B9a00RqrtIO/xjx76HW+fg=;
 b=hyNDpepWQq8DZW50Hf0XKBhuQW9YP8x4gP2ntWFWx1ni2fW0+zMs1ZDdZWb3Acb5szBESdj+M
 y7/hPXttUVHB9YFZsF5+60PtQo990FpWQysl1rMZga50QkgkPksdsW+
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-ORIG-GUID: 7N4Ox3Zd_0tATq5I1eNeEJYYZeJaoM0o
X-Authority-Analysis: v=2.4 cv=L4wtheT8 c=1 sm=1 tr=0 ts=6a63120d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-olaiSHPbsRiaquSn4UA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX7A+Y8mXcCQyV
 yvXFStcdpNaqr+/dsQWL2oaq2OETvWYOKZRsi3DESS5UXPqIlrYESAWEOwBMxLvg6+SaehI7pGG
 +NEt5akognbAmXpmGxj8L/2UiuFkSMVyuBgKSDiguFNE7PCg3NKEpU+4Ar4/nptFt1BqmOt05Ph
 YqI5nEgWLOxL2xAC4IbFeP8gNvTsTE9agiqU+3wPS23TPl2xqMTfR5R2CRR73lJFS4mdKJDDGmn
 5nAM/eS8U7NWmc9l8JOFQEu+eNPDq6R4pG8bd30e2EUOq8Mz2w5mjxcpfKSmolko3QuemRoI3QD
 a+6q/pFNju6KyqfzDWSAJBxEQDmn9FxAW9b3v/bMJIXBZDSMUxVzFa1nJnfL4D+la6VVglYg+JY
 gYhfJF8nTbNyliNsVFqPGIpOqkOAIah3QtBSN4tpyzBmNKW1XIWR3MRWY/7OyrGefDeRLT2GKs3
 1r91BzCBAYobq08ZbRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX+PDjXlZbH27C
 fGUaP81jEcG/yUQ3SIRFM+zKK6w16qe3nPwYH3OWCKhGJ5gc7CBpqfXwD7wcWANmaDjvNzY0Ctm
 2PuiwoXlLTXuagRFPCnE0vEJ57TAM2Q=
X-Proofpoint-GUID: 7N4Ox3Zd_0tATq5I1eNeEJYYZeJaoM0o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240065

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

On Qualcomm Glymur SoCs, the memlat governor and the mechanism for
controlling the LLCC and DDR/DDR_QOS frequencies run on the CPU Control
Processor (CPUCP). Add the CPUCP mailbox and SCMI nodes required for the
QCOM SCMI Generic Extension protocol to probe and get functional bus DVFS
on Glymur/Mahua SoCs.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 41 ++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f32af66a3f1c..32ac471e6727 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -420,6 +420,20 @@ scmi_perf: protocol@13 {
 				#power-domain-cells = <1>;
 			};
 		};
+
+		cpucp_scmi: scmi-1 {
+			compatible = "arm,scmi";
+			mboxes = <&cpucp_mbox 0>, <&cpucp_mbox 2>;
+			mbox-names = "tx", "rx";
+			shmem = <&cpucp_scp_lpri0>, <&cpucp_scp_lpri1>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			scmi_vendor: protocol@80 {
+				reg = <0x80>;
+			};
+		};
 	};
 
 	clk_virt: interconnect-0 {
@@ -7658,6 +7672,13 @@ pdp0_mbox: mailbox@17610000 {
 			#mbox-cells = <1>;
 		};
 
+		cpucp_mbox: mailbox@17620000 {
+			compatible = "qcom,glymur-cpucp-mbox", "qcom,x1e80100-cpucp-mbox";
+			reg = <0x0 0x17620000 0 0x8000>, <0 0x18830000 0 0x8000>;
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <1>;
+		};
+
 		timer@17810000 {
 			compatible = "arm,armv7-timer-mem";
 			reg = <0x0 0x17810000 0x0 0x1000>;
@@ -7842,6 +7863,26 @@ rpmhpd_opp_turbo_l1: opp-416 {
 			};
 		};
 
+		cpucp_sram: sram@18b4e000 {
+			compatible = "mmio-sram";
+			reg = <0x0 0x18b4e000 0x0 0x400>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x0 0x18b4e000 0x400>;
+
+			cpucp_scp_lpri0: scp-sram-section@0 {
+				compatible = "arm,scmi-shmem";
+				reg = <0x0 0x200>;
+			};
+
+			cpucp_scp_lpri1: scp-sram-section@200 {
+				compatible = "arm,scmi-shmem";
+				reg = <0x200 0x200>;
+			};
+		};
+
 		nsi_noc: interconnect@1d600000 {
 			compatible = "qcom,glymur-nsinoc";
 			reg = <0x0 0x1d600000 0x0 0x14080>;

-- 
2.34.1

