Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326F136C597
	for <arm-scmi@vger.kernel.org>; Fri, 24 Jul 2026 07:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784877567; cv=none; b=qPnStPC+cXmMaBU0gBIVjqBopa3airdOzq8unHciqdTS/FAsF42xcmFOe1ayzjA8wZ8e1Mns+sRms1aJeqXSFRJm7gpLIJXN5p/0/PM+MXFaaNaxkaYpW6IjsewqCHNCKJkP6aR2NYi4jIEYVv+Mb213vngk0tXzKLBJIoyWfwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784877567; c=relaxed/simple;
	bh=TTQO6xNT4+ZFAJc+p+fBQr7kWhLYOrv86Pelwq77JSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TgMcBv2Q5KdbT7ILTaaqIjxciDhYIs+g/2xVK3xsyIWqcJwl31uEyqSyRTPWBcx5ex2SVhyUWr5TF0xCpGZbbQ1J51GYue2PnGEqm9vUgdb3/9DGR0/jFykZ/DeWTlz//Nvq9m87L9flUmCr17lgM7yYKH+s4tKXyq4OpV6Mfeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=npjA9KyW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PQByLup5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="npjA9KyW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PQByLup5"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lU2A1510144
	for <arm-scmi@vger.kernel.org>; Fri, 24 Jul 2026 07:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nSSKfbrDBA6kV4AouFVgN1sSPJ12hs/Z0PrpD062x9E=; b=npjA9KyWxrODPK/B
	2ZcuckTlwC501EqXnW/9LDzom5vgcQImmEFJvOxPrufqEbeT51iBFz0+Bzxozp3W
	HcXNE5VPB5IuL52g9BKF8pzsGqdCNnQW/YE+AZ+GDO9iZEpvwlmsQ4I+Qi7cPYZd
	JqH6oz+3XTx7d63Z1pPW/kQ5BL7rlOeYf8ziWhPcrGQtF2NkKnoJoob/diBio7y5
	pJ0Cv6SlUW3vom1YBlNvecIQX5O97gQhll+F6562kd5MGv4XZhv0iZbQq9Ai+Nqu
	AiiBa6dWH/LVxYsekp6lWmN0+YlJsbeAo/3eWfnhb2ZSDIS1N1msjZ35125JiW0X
	EKCwiA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkusrsgbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Fri, 24 Jul 2026 07:19:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccd1958e8fso2126575ad.2
        for <arm-scmi@vger.kernel.org>; Fri, 24 Jul 2026 00:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784877564; x=1785482364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nSSKfbrDBA6kV4AouFVgN1sSPJ12hs/Z0PrpD062x9E=;
        b=PQByLup5xpWI0VxnBUySs9FlwEttN9OWJkJbF/LefgLebn7WCwb580ZtYVLMgOnX9Q
         93k1atX9jsT9CtNS/5f/pCxIZLXWVr5WJBjluspiB1V2rZ3KND/xFU107xcppXgqmdSu
         X/OVkMCEgCZ1u1AHOM7wpY4UZQLk0U4nR7tnExuEmkUGG2PeNtwz7ZOzCiqG0GU3haD2
         sM2w2JrAcCL/fUop68+p6HDz4fNaOe4rxa5qLY9n7M33OJmFRePedPWoFIx2Q2d+CWtX
         JrNxkuQFD0PmptNXVDRm/YMrrxwFrdBE6/PULZo3H8xofujoxlLI7Xi2pNTPBim5gg6B
         j7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784877564; x=1785482364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nSSKfbrDBA6kV4AouFVgN1sSPJ12hs/Z0PrpD062x9E=;
        b=LgqpZNbe2YTiNtW0n30kuRFfODy9PpOJ/y4vhOIx87KKOixWrrtJymGN1gEjhw7MfE
         MmQHD3jmijiL5hA0ZHnkL6+yxP9GhHh0UVIhyc2+0Z1WTh1KdKjq7HxSsBkKvZeqMj/w
         Mpbg3NkfirbXUkMmL2Xk4+dD7RnmIUkXO89JL4GvobXW1tt51GYbtHFDgAapip4kDTLU
         ckksnw9njQ8V6LavzgDx9SOoqRklQ2xwq0MZL+5qEcXsAIEv/aUKvnAWoiB/9paUM64t
         Qn0av67HY4n78/GGEpK+M7rIuam4B70gxvT/55+wsH3aBU+LUeth+okz63+DP/+fu6gy
         txXg==
X-Forwarded-Encrypted: i=1; AHgh+RrI0UUD+DpVpX4A2a+ytppFV/BjLJa1lh+mFA6TFqXZt141Gf4S0pRGvabvXZm/VmvxpFadpl7XWA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/ZZH2uVIAoLuxVePm8EXFJJ5LdI3bHAHG86tpPNIfhuHCD/MM
	CkedrycESquQ6aC4uvM6wewZvk2HHnoKJXcu7NsOtgdRa04GyAhuSTkbroFh+9xVSn/pASbINUz
	dhGP2ojt+SOLfRc3L/p6uymazW4c5bfVAfQEVjvTC1n/bRcdenjdm86xjwDyJig==
X-Gm-Gg: AR+sD11VXaFmmVE1ezf74yH7SkqdepHLWMC+8PNkZmAigdL7xTxhgZ1VIHOzTYETXxE
	DRbbZAV6ckFn6mYSxOPsb4jKozAkrZbUmnuNtG4P6bRb9nC6iZ39quDD3hvECwDOGVgWIKf5qbe
	hLyHDjXl9WY/ifVLkIqt+jdtJzZv5DxcvmGyZYG5bBgVhQ09nFxyCcaPAlK5VQiR8M8aW/GST/I
	QLHREOssep0hBPG7pbF2Zlyb/c3i2hn7x64yEDNn8dus0+gqFP7t6uoFaZHgcIAFqwHudg8z8Td
	VHG0nX/JOPsMFaNUvZ39iTp93vMJyRVvAJDe/wOzm4Z4zROdFnOHTU6VchNhubGf4LpedUsbE5f
	f2rAKYb59IDRn6p7YgFYVh7FDLWxJWw5pfvvKStNWRXcLeT7bSATBz/f2BwBLqtoDSXUu+xhoqx
	Fmw9EuZr57yplPBfWsyZHfeqGzxn4=
X-Received: by 2002:a17:903:1b07:b0:2c9:e2c1:4fb5 with SMTP id d9443c01a7336-2cfa6c567d6mr78818475ad.22.1784877563188;
        Fri, 24 Jul 2026 00:19:23 -0700 (PDT)
X-Received: by 2002:a17:903:1b07:b0:2c9:e2c1:4fb5 with SMTP id d9443c01a7336-2cfa6c567d6mr78815845ad.22.1784877557972;
        Fri, 24 Jul 2026 00:19:17 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efe3afbsm45993805ad.33.2026.07.24.00.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:19:17 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 12:48:10 +0530
Subject: [PATCH RFC 05/10] PM / devfreq: Add new track_remote flag for
 governors
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-rfc_v8_scmi_memlat-v1-5-cb732bcff1f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784877514; l=3635;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=59NPtGqSBHQF7ZdSEQTKlbhHTzbuDIOFGJTtQD3qeLM=;
 b=/Y1gUkrABenFv0sYOLB9F9uLwyaV7q70opsOpYpYHrxm90y3JRI9nU8of7ERTXbtfg7yeeVa5
 xlFxLBvZvm/BRmgU07gxLL3ol3/t4Nk/JehrI8/G029d4rfFZ378iDR
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX0GLJFVPhS2WV
 m64JfKsNvBuR4sxHIU4RegPX9PwF6qb7teyKxMhw3bDERjohplQ/D2DJh8s+Y3L4HX4gtjbxFsS
 rPTxq+7LWSSEClqEna8kU66SvsQfcV0=
X-Proofpoint-ORIG-GUID: W9BhWdMmbwHjbXE1yNbQOR3QjLBhUsiv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfXygC6KDwf2rRc
 kdIP/KsDkM5r8PczG88m7rUcVr/PPsJRMU3KAu45BVBnCyxSIIDd3u4FE+AMNVCEj6PAzQbdxun
 dyqr2ElU+IVJWuco2InEHUNT05Bquz5YCt4ft8xuvXM+MVcuMXu1V7yWt8tQf1TMLxdpAPBrUwW
 GDdJl02AyW6cviqU7+7G1xaO/WBdlhsui/+IIhR/evyoRjA6gNIdXRlTVLBTQlIpr9fU3uUBSvh
 lCqQtBCfj25Cim1w1JuHPHIdSEroPQZXjp3QVn6/fAYtQYSw+OspqNFyDtufzjYcthuuKHLi1EI
 BzFQWrhVZM3fbYL7izgHnnrNVutyfx0tEYbLBI7LF4aIJY23sx6zfKymSwm5RIA5EllF4VaV0wY
 5XOyezdLqfiAJcYbYsuftO36vt+BAxGRaU5j7WjTYLmwyyzugmDEeVJYrgbrSnEFHEy9fvYfzmF
 xXmxUaoVAPExhjSiooA==
X-Authority-Analysis: v=2.4 cv=PtejqQM3 c=1 sm=1 tr=0 ts=6a6311fc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=_Sn8c3TY04LLovrI2V0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: W9BhWdMmbwHjbXE1yNbQOR3QjLBhUsiv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240065

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Some devfreq governors need to track frequency changes performed on remote
devices rather than driving the frequency updates themselves. In such
cases, the device's frequency is already updated by an external entity and
devfreq only needs to keep its transition statistics and notifier
subscribers in sync.

Add a new DEVFREQ_GOV_FLAG_TRACK_REMOTE governor flag. When set,
devfreq_set_target() skips the profile->target() update sequence but still
emits the DEVFREQ_PRECHANGE/DEVFREQ_POSTCHANGE notification pair and the
devfreq_frequency trace event, so transition-notifier subscribers (passive
governor, devfreq cooling, etc.) and tracing observe the remote frequency
change exactly as they would on the normal path, and the transition
statistics are refreshed.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Co-developed-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 drivers/devfreq/devfreq.c        | 21 +++++++++++++++++++++
 include/linux/devfreq-governor.h |  5 +++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index 2f27a239e34a..71c6ced9e4e1 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -348,6 +348,26 @@ static int devfreq_set_target(struct devfreq *devfreq, unsigned long new_freq,
 	unsigned long cur_freq;
 	int err = 0;
 
+	/*
+	 * When a remote agent (e.g. firmware) owns the frequency, skip the
+	 * local profile->target() call. Still emit the PRECHANGE/POSTCHANGE
+	 * pair and the trace event so that transition-notifier subscribers
+	 * (passive governor, devfreq cooling, etc.) and tracing observe the
+	 * frequency change exactly as they would on the normal path.
+	 */
+	if (devfreq->governor &&
+	    IS_SUPPORTED_FLAG(devfreq->governor->flags, TRACK_REMOTE)) {
+		freqs.old = devfreq->previous_freq;
+		freqs.new = new_freq;
+		devfreq_notify_transition(devfreq, &freqs, DEVFREQ_PRECHANGE);
+
+		if (trace_devfreq_frequency_enabled() && new_freq != freqs.old)
+			trace_devfreq_frequency(devfreq, new_freq, freqs.old);
+
+		devfreq_notify_transition(devfreq, &freqs, DEVFREQ_POSTCHANGE);
+		goto update_status;
+	}
+
 	if (devfreq->profile->get_cur_freq)
 		devfreq->profile->get_cur_freq(devfreq->dev.parent, &cur_freq);
 	else
@@ -375,6 +395,7 @@ static int devfreq_set_target(struct devfreq *devfreq, unsigned long new_freq,
 	freqs.new = new_freq;
 	devfreq_notify_transition(devfreq, &freqs, DEVFREQ_POSTCHANGE);
 
+update_status:
 	if (devfreq_update_status(devfreq, new_freq))
 		dev_warn(&devfreq->dev,
 			 "Couldn't update frequency transition information.\n");
diff --git a/include/linux/devfreq-governor.h b/include/linux/devfreq-governor.h
index 2853f571dfdf..e4f7b6cb07bc 100644
--- a/include/linux/devfreq-governor.h
+++ b/include/linux/devfreq-governor.h
@@ -33,9 +33,14 @@
  *   : This governor is never changeable to other governors.
  * - DEVFREQ_GOV_FLAG_IRQ_DRIVEN
  *   : The devfreq won't schedule the work for this governor.
+ * - DEVFREQ_GOV_FLAG_TRACK_REMOTE
+ *   : The governor only tracks frequency changes performed by a remote
+ *     agent (e.g. firmware); devfreq skips the local profile->target()
+ *     call and just keeps its statistics and notifiers in sync.
  */
 #define DEVFREQ_GOV_FLAG_IMMUTABLE			BIT(0)
 #define DEVFREQ_GOV_FLAG_IRQ_DRIVEN			BIT(1)
+#define DEVFREQ_GOV_FLAG_TRACK_REMOTE			BIT(2)
 
 /*
  * Definition of governor attribute flags except for common sysfs attributes

-- 
2.34.1

