Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADAD3D091A
	for <arm-scmi@vger.kernel.org>; Tue, 16 Jun 2026 18:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781633364; cv=none; b=s/ueMEjy7KvjLbYGWbhWwFgNsQmzNYXDiwNSTeZipokhGh3jw2sdizSgAu97zAp1gaGa7K1pT5yw9UaGP+c8hyWPRSd/dCLke27GZesaZrUhlbxEcpmZgYT9FX8vsRTjqAhPpQBGiKG8Uxym+/4d5ooUivwESLHSzNTWyldgDLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781633364; c=relaxed/simple;
	bh=gSQMryyLHdvcV09dgoClPUfxYxJLHgh4cYOBza3eWEQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uX3L6gjdlR/PuewMAk0yO0gmEWttbmeo+t4tK3JRHOFMXXBe6FalRaS9cH9fieR2kod4yiwT3mePkTPWO00OGOgFTXnDk+E9Lo/hejcD7FRuwa+SpAFT/LmjZcL87EUZxUfZ4WGNjtptRXQt8+KhxXGda6g4+DLCHT93QVzJkm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eSQ6G6EI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CZYF3K1K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eSQ6G6EI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CZYF3K1K"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GH96L13747415
	for <arm-scmi@vger.kernel.org>; Tue, 16 Jun 2026 18:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fAKiKuo+7Xo4tAEEl10qvc
	4jZotTrJ4XmaotDb6MuMw=; b=eSQ6G6EI4RGw4WM19eGumGrwdRiSdRQKs0RRQ6
	BjHW/PyvK1eOHeqj5LrfBfP5+MVLwJjTKKWRJb6YHF0yxrMjzb8hkS5p7E8cUIMw
	J1yZtyrPHbwrDLm0WD8lySaH5mKP3Kl42mrcBxt7xplwJzgncVCWGRKSkAy+MRso
	xLrwhPzZCDqgXB4ugiANvDlWfsjAGEIv/aEWHxL6sh3rtW+Ei/fDNuGvwC4qYxD5
	YN1Jsvzlj/fJFYRBMvvQm9Y1OgFlEs8bgcITsCPQ1ybIG8nkoKmlDHaSjj7HiakQ
	/qDT3RFCE0p12DkzHtEcmBtitpsob+s77AOaOisT48ckAunQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu0a7uep7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 16 Jun 2026 18:09:22 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-13967c19ac6so10733814c88.0
        for <arm-scmi@vger.kernel.org>; Tue, 16 Jun 2026 11:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781633362; x=1782238162; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fAKiKuo+7Xo4tAEEl10qvc4jZotTrJ4XmaotDb6MuMw=;
        b=CZYF3K1KtqOoCYIvPmv4jLG/jKY6Lj7iRiKBlYogwRnFuF+V1ZnK8TKeGMwBTMd3ff
         qPCnCTWzzQw3FJdWVxx+LRBK3y6ndj3xq9CVwt2wtl+GNhNegcoVDo6CJrtqgz5BvP1n
         qk7k0kad8gTnOBYCCEpWjrjpALQpvwST/qOyNmMDZj9xK2C4tkSxW8C9nsFtW+vNe5lq
         azDvKAIpLCumepFXu50HskJMhCoi5QUmjoGrwIeXjOAPD0U0O2y0EN5eK0xK1H/CU6oP
         CNhsSjh5Eu3AxZ2LtBAVXqFCdHJgE2oCbg/5z6604WNPLcF2TtwaE6E7grslXpLiOJwq
         73VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781633362; x=1782238162;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fAKiKuo+7Xo4tAEEl10qvc4jZotTrJ4XmaotDb6MuMw=;
        b=bBqc5vIqA7BQqhN+r5g6G1gQkq0fNIgYw7zM70mTjYi0PAQDZGDDYJo6uM2+0KjW2C
         M0LH6cdDkYFbuCUqLN9BawxupJF1X2Mhy4daDMt/n6gTk3Yzisouo/wcO+uPZb+3lSCd
         AHNY/qC7Waozouj3twIqWgWz2OCVibYe4TbrruhB+HNsIFK59PTy8BbHnHEGqXsKtJ4W
         ViY8ts/cx8A+rYQEW46PKq7U+tqgr4bqvx01HV8vwMa5fcNz7VudEAo1Z1PNkgneczxR
         qPI9X28SWtALxelSHpukTodMkLIGwUVY2ZDyo1u9b+varUQQuLdbJLjHRtiE31PJ4adM
         VWgw==
X-Gm-Message-State: AOJu0YwwUE1hcFd+fxoQorhRidApDZI/qahOkg3YEv00pHMpbA9AhRu1
	e18VGtLb/kZQK3Ay/Z8Sf+nsRG+dgjDOgSZ/ZshN7/kBypoQ7gO6vYy3WPUp7oWIrVFiG8kveGG
	r5KvJIJIqCbVezmNo+tHz/uoCu2RMLiBQf1HjriAxOwWTPEAnS4cia2zOaKFQJQ==
X-Gm-Gg: Acq92OGUhiyfvr5at5Nj16GbvOzUF8PrhRe/guZxo/iixqsYsr+wHDNxIa9f4/PrbeC
	Uct5Oc41uMYwFY+5UTfmWQjMcDdVUd9Hp8K55d2dcKV7qpd+ZmjOy/SXu80j3P0Nojeq83djLZP
	DWH5tls1QHGkFJp0/bRClDWGWmC3pT1QlIwps8QqzcfscIYQQGcunDMfMCZUo2Vsioo9seghcC8
	YDHvFZUJqr33rL3ldq9JZBnzpuUJsqTr4MzPRa4sKnIKB1mOobjT5B7qWLidBk76z6S7lBiMHl7
	5pOcAIB67E+v80OqSDJO3SfUrIK7PkzMTvMDD9HVHWyz1bg/F57J3hTxeAgM4T6GP8iigLdwCPj
	Y7U/WccVFGWjdW2KK6lZ8th6Mj1ktDPb1juTvaHqY1LAl4fHkJXEK1ntDeVt4CKE=
X-Received: by 2002:a05:7022:2228:b0:139:7bac:db41 with SMTP id a92af1059eb24-1398f69ed04mr25449c88.28.1781633362196;
        Tue, 16 Jun 2026 11:09:22 -0700 (PDT)
X-Received: by 2002:a05:7022:2228:b0:139:7bac:db41 with SMTP id a92af1059eb24-1398f69ed04mr25432c88.28.1781633361714;
        Tue, 16 Jun 2026 11:09:21 -0700 (PDT)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b916b2bsm13747124c88.6.2026.06.16.11.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 11:09:21 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH 0/2] firmware: arm_scmi: Ensure automatic module loading
Date: Tue, 16 Jun 2026 18:09:14 +0000
Message-Id: <20260616-scmi-modalias-v1-0-662b8dd52ab2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEqRMWoC/yXMQQ6DIBBA0auYWUsCo7LoVYwLhKGOETWMbUyMd
 y9tl2/x/wVCmUngUV2Q6c3C21pg6gr85NYnKQ7FgBqttsYq8YlV2oJb2InSscEWzRjaDqE0e6b
 I5+/XD3/La5zJH98J3PcHRd5bKnEAAAA=
X-Change-ID: 20260616-scmi-modalias-0f32421bd452
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781633360; l=1190;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=gSQMryyLHdvcV09dgoClPUfxYxJLHgh4cYOBza3eWEQ=;
 b=hF93igeEPPEEj+VjMuQ/oRz7Gv5WUFbaGYz6EcAFAMGMdz2f+wcZBl7zZGwazwjqTJy2yhDFx
 MXSW0mgkrRxDx2fXqHBhray2y2xzXr9Z6MwzY44vUQpYGYsQZEcrnSQ
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE4NiBTYWx0ZWRfX2o9JxgYPOMk+
 c2FW5vrXQjty0nmkQTBuo63rYRj3kUg1xt0Ag7UOZDQc9wEEHjgCXPJ0UgQoA5OUX1i8JZOx+nB
 nVec3ohGnveDF0qVxbyC/VKXgJgaggaRX7Qhh0NgwCZcnxr0a4e1qGmC0h4EKzhgd0Ttc6L5ZQl
 l0tgJB087YIXn00WMHVkPrIQSosvHAevL+/GxjQUb2mXUe+uJSLbrbBT6HgaclP+aMTFJVi66XN
 GsJtSXF7eJHPn6jdADeV9GTS7SqftIVd0cSDJKlG/xk4XtKVPc+rmWzEn5CQbXzDfxloy+LZkMB
 xsfmehWUCWNbig1wJqwtTTeqmykLqjcwjMBkdzqF6UkN8MO70ZN1boVXMAKEaRkHiUdcrTyjbnk
 mLZRrjjBVfo79YC6/g9FDz/J8cFT0HS/TaAb+TAhCkwc0vGznxf/lvApmH7j6Xbaxa2Q8rsol6z
 FSjlqObsVeDBNbN4RoA==
X-Authority-Analysis: v=2.4 cv=JKALdcKb c=1 sm=1 tr=0 ts=6a319152 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=8yBAbjwBbfdicugfQZEA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: NMP-UhWd4TVt7aRDzb8l2l5xYFKKUUBd
X-Proofpoint-GUID: NMP-UhWd4TVt7aRDzb8l2l5xYFKKUUBd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE4NiBTYWx0ZWRfX2IEylSdBggxl
 o9nR6l8yQLobMfr+w/YhqoPOJfHjSCRb8PyYUJGxc9NDh4kc4nCaU4oFzod2Ve/vZqc0Ny3zN6b
 asp1rM1YLlM0pLbIfq2xBm7Mu23BMaQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1011 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160186

SCMI drivers such as the Arm SCMI CPUfreq driver are allowed to built as
modules, but they are then not automatically loaded. Rework the SCMI
device table alias support to make modpost consume the information from
MODULE_DEVICE_TABLE(scmi, ...) and allow drivers to be loaded based on
this information, if known. Also add a protocol-based alias to also
trigger driver loading when only the SCMI protocol id is known.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Bjorn Andersson (2):
      module: add SCMI device table alias support
      firmware: arm_scmi: request modules for discovered protocols

 drivers/firmware/arm_scmi/bus.c    | 19 +++++++++----------
 drivers/firmware/arm_scmi/driver.c |  2 ++
 include/linux/mod_devicetable.h    | 12 ++++++++++++
 include/linux/scmi_protocol.h      |  6 +-----
 scripts/mod/devicetable-offsets.c  |  4 ++++
 scripts/mod/file2alias.c           | 13 +++++++++++++
 6 files changed, 41 insertions(+), 15 deletions(-)
---
base-commit: 8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
change-id: 20260616-scmi-modalias-0f32421bd452

Best regards,
--  
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

