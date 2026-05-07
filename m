Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4198D3254A8
	for <arm-scmi@vger.kernel.org>; Thu,  7 May 2026 06:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778134995; cv=none; b=e/Tt6lS+e7X1VwNgNZUvux1jPz0to/uhZlXF4sQ8/Wk/GuicQJhrWNZQKvCxHgIKIn0bRLbhaq6DIbW9IJS5yYRg1kqSlYEkhaAaCEryTOyrBYXw7tabReYfiM0BvHQnp/cjfTO3iEhnwP//b1KgNg6QO7VqFilWPhD3L3W2Q24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778134995; c=relaxed/simple;
	bh=TE4I9dLAziE4F6f8zleSD7WBcoGLgMMGcIxpRrGy/4w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HDjRpb5SA690lhop/0ynwUhEEgXODqJbds9tSFD3zIj+v15rZYQpdlgestdGubNZNHmDwxhWMj5aV5TuIBQ/h5Ypw5b489DxYqdqvR3cGioVlf6II2xcU2vA8gO2qHiROMNbRhjfFYRjPFPrdRbRQgPS7whyvhl7LJcvlI3iv/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cKSvLFDa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MF6SnteI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cKSvLFDa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MF6SnteI"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475Lxo0682852
	for <arm-scmi@vger.kernel.org>; Thu, 7 May 2026 06:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4b06huhDhBP
	LgQXsILfi1dnmLMKdgyO1zEklZp2Wyqc=; b=cKSvLFDaeHA5jl47fC2yTYhRLH9
	KVIgCApPKLnuPVk2LTHTfwNPPR7OSTgCILVDh1xSmjDXIX82biexdVdB6PikHYl/
	3TF7VytTY6WF0UwYWRIVIHD3Wd8w42tU6a8oVlooshzOeTw1ock67uders5SyfmQ
	gzPGsIWfXoLTQd+81mn5v79ZziADqbHw1Qzux1ldnvgcpQExUPClsegAiqED0T6p
	A+CKcuV3jJQRNqDQEqFHDKhXcY3czbi6aMNUMGoMLEB0oiBhkDjdHdX3YmZ6CFx8
	mEU4M80BEkNGRaCq3qEOjv6Pd9gkFOLMwPlrylPxbz+CegmcyBcO3BCyLHw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhar6fp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Thu, 07 May 2026 06:23:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fa366fb79so489762b3a.2
        for <arm-scmi@vger.kernel.org>; Wed, 06 May 2026 23:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778134991; x=1778739791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4b06huhDhBPLgQXsILfi1dnmLMKdgyO1zEklZp2Wyqc=;
        b=MF6SnteIzHWaeeNFbBcgvDApQKjghbu+kgySRybPtx1FisHFjMfeNHjcxZUUWLVl2Z
         9sAZLisgnJoagy0VdML4MyuURq1QCrkE3zyjX1oKGRJEYqFyRoNK2UaDjQ69SVvchjSU
         dYmeqgkwajtOj0c7CgCxrjJyOZFQ0rQbXFxJRYoDd67xQOAWospHI+r1agkcK9GJd/DF
         ueYkBvbW0utR/W5NJt71bP3AixMitzwe4ajwGK40Q6poR4WIYPd/xZnaj0Jb8hcI62mx
         T+sZfx1aFzme/eYnpRxy8H0/SGkYF97HVD9b5tMBLgepAl9+S+O0i+xxy9SD7Fry9mny
         MV5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778134991; x=1778739791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4b06huhDhBPLgQXsILfi1dnmLMKdgyO1zEklZp2Wyqc=;
        b=LfXAu8LEWr5FMPAyzUUL5lqQv3qWbeS/4uLxIO5KLY0oPUAYulf00voJ7kRnb0RLMK
         OPD1Q1yCmQX84PAtWbTM8bZj3sx2xKYqDvRyPZGd+RKaMJCDrgKTUD0JOHN2nDkPe0bC
         Uf5qZd/ovVZonRxek7/dE810HnRBg0QXgF7Xdwh6Yv2fHR4kPXycjJwVqYgMeakxCBdV
         hA03cIgcfeb4eHCR3GqGEzdtYnX3X46xAgJbrh7scinch2DBpZ7I+Rp6lM3hDVhJu/0q
         L/C6PC7VK0GxKkIqqwmIwpcEPz08oKrHr6cbHwtogt5WB238VZoIx9csEy+wFBHJ0PTs
         xbcw==
X-Forwarded-Encrypted: i=1; AFNElJ83QkdAKvI/FlrOrhwvzD2StvS7zdzE00Dh41Jf3lqtzPSMZUM1AaPQGAabRzgdwJCSrMmE2aSGQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPj3qQs5ozoPRLWvp+hj3ERWzmBuDY55KAllmEPB1ks438Xxf7
	5C7Iz5VoMjJ1qTZoLj90OCi6h/qxjsfyFlqYpensToYEosAwxayOp0RYcOP5TeT7dGtyn3Ljoja
	XXtrTj9uH0PCGLtvRG1FuKhtLSHHnLN8AnsDYJMgiC2S0dlwvZOWYHM2gRgPTTQ==
X-Gm-Gg: AeBDieve0/2Xs67XCorGyJ1tc6Y1CQiw2yNYDRoELl5XiOaO9KCpNVWj5UUNYJrFusJ
	adfwY1VA5JaZZEsAwXeM/HChVw+nZYlyCFtxKCl3uUreURvAY+MtYidk8aMHvpxP8UHoPQNEYB5
	HcZCepze1HhKjmc1/j7UUxXW3hsiEs/vr3S4BaFhNaieiPwQOjBTKJhsrQpPHIq56mBOPGG3rEk
	kdDRiQFXxmmjh+EfUWupea52BuBtimphXrs5JkeKGGVSzvKSwqAyUYf9H46A8HGPHAeAfGtIzpl
	H826V8nKXsE+PPtXJVjzL1Co4WUDJoLJvYPAcTJYHr4M2xvAS5sAdwKsea2WWtlair9ll5X2pjZ
	TjMcBReaP7HQjY+m/Twk5SIZ8jlUyMqJi48w4hxx2hgSACNph0aY2k4Bk3c+SBC6H5XhvL0uZJU
	kIwN44aHnR68eU/HoqklYrFQBCjdTT0VmmMQG5U2CLQE4x+0M=
X-Received: by 2002:a05:6a00:12d2:b0:835:cc47:6fe7 with SMTP id d2e1a72fcca58-83a5dd5c9f0mr6280919b3a.30.1778134991270;
        Wed, 06 May 2026 23:23:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:12d2:b0:835:cc47:6fe7 with SMTP id d2e1a72fcca58-83a5dd5c9f0mr6280877b3a.30.1778134990795;
        Wed, 06 May 2026 23:23:10 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965945101sm7346557b3a.13.2026.05.06.23.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:23:10 -0700 (PDT)
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
Subject: [RFC V6 3/8] PM / devfreq: Add new target_freq attribute flag for governors
Date: Thu,  7 May 2026 11:52:32 +0530
Message-Id: <20260507062237.78051-4-sibi.sankar@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MCBTYWx0ZWRfXwf3kO/MbGnY0
 nwU3lTt2reUwGB5y2yugVxYB4QpBgHLwLG2y8zYDodpoYlzktJQO0LTwRIaQiL7LZsvfbQqcxkP
 pkFZOQtxIr+lh3gOcuEtui2tqys1LXSkkTY04oPcyszU5UF05JoDxdBLBDpRaRfHoADzbNL6xBa
 jsgdSUQY18n9ZQtVRew6Xa6pL2OCwu19H6vbg7JYKsVmmgxIgEYDSvA4isS8mhqvW+QEjkbHScH
 I6XFO3/WhLaLugHb/L7oOs+N/8wEckEEqrCugxH/Npx2T+gVQ34d+ZGuWczW3ErZyxhh2x0IKEU
 dCmE/zN6EQgKj06HeDt5MXoQPh0vwOGa7Qc0cUG+52Gou3Broa6s0cNrOQcsIQ4IZvlEH+3QLBI
 jj4qzJxA5BrSjhamhBD15copf6/RL/uhIGaW4zEnbontI/Uwp5GUUB1wOMaclDYPRw0N6vQwZeU
 8o7+/f+0A8sum3e3w1g==
X-Proofpoint-ORIG-GUID: NxRSZ-lZHa7yn2KYfsJ0f37NmWQ8afDz
X-Proofpoint-GUID: NxRSZ-lZHa7yn2KYfsJ0f37NmWQ8afDz
X-Authority-Analysis: v=2.4 cv=ReWgzVtv c=1 sm=1 tr=0 ts=69fc2fcf cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=K3uUPCIpGL4zgFOSzcMA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070060

Introduce the target_freq attribute flag as a pre-cursor to adding support
for devfreq governors who do not explicitly allow for a method to get/set
target frequency.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 drivers/devfreq/devfreq.c                 | 4 ++++
 drivers/devfreq/governor_passive.c        | 1 +
 drivers/devfreq/governor_performance.c    | 1 +
 drivers/devfreq/governor_powersave.c      | 1 +
 drivers/devfreq/governor_simpleondemand.c | 1 +
 drivers/devfreq/governor_userspace.c      | 1 +
 drivers/devfreq/hisi_uncore_freq.c        | 1 +
 drivers/devfreq/tegra30-devfreq.c         | 3 ++-
 include/linux/devfreq-governor.h          | 3 +++
 9 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index e5d3f9cf94dc..85e937e321e8 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -1526,6 +1526,10 @@ static ssize_t target_freq_show(struct device *dev,
 {
 	struct devfreq *df = to_devfreq(dev);
 
+	if (!df->profile || !df->governor ||
+	    !IS_SUPPORTED_ATTR(df->governor->attrs, TARGET_FREQ))
+		return -EINVAL;
+
 	return sprintf(buf, "%lu\n", df->previous_freq);
 }
 static DEVICE_ATTR_RO(target_freq);
diff --git a/drivers/devfreq/governor_passive.c b/drivers/devfreq/governor_passive.c
index d7feecd900f1..b75e4bbee4b1 100644
--- a/drivers/devfreq/governor_passive.c
+++ b/drivers/devfreq/governor_passive.c
@@ -448,6 +448,7 @@ static int devfreq_passive_event_handler(struct devfreq *devfreq,
 
 static struct devfreq_governor devfreq_passive = {
 	.name = DEVFREQ_GOV_PASSIVE,
+	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
 	.flags = DEVFREQ_GOV_FLAG_IMMUTABLE,
 	.get_target_freq = devfreq_passive_get_target_freq,
 	.event_handler = devfreq_passive_event_handler,
diff --git a/drivers/devfreq/governor_performance.c b/drivers/devfreq/governor_performance.c
index fdb22bf512cf..b9ec587f582c 100644
--- a/drivers/devfreq/governor_performance.c
+++ b/drivers/devfreq/governor_performance.c
@@ -37,6 +37,7 @@ static int devfreq_performance_handler(struct devfreq *devfreq,
 
 static struct devfreq_governor devfreq_performance = {
 	.name = DEVFREQ_GOV_PERFORMANCE,
+	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
 	.get_target_freq = devfreq_performance_func,
 	.event_handler = devfreq_performance_handler,
 };
diff --git a/drivers/devfreq/governor_powersave.c b/drivers/devfreq/governor_powersave.c
index ee2d6ec8a512..69eab1d0a7fc 100644
--- a/drivers/devfreq/governor_powersave.c
+++ b/drivers/devfreq/governor_powersave.c
@@ -37,6 +37,7 @@ static int devfreq_powersave_handler(struct devfreq *devfreq,
 
 static struct devfreq_governor devfreq_powersave = {
 	.name = DEVFREQ_GOV_POWERSAVE,
+	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
 	.get_target_freq = devfreq_powersave_func,
 	.event_handler = devfreq_powersave_handler,
 };
diff --git a/drivers/devfreq/governor_simpleondemand.c b/drivers/devfreq/governor_simpleondemand.c
index ac9c5e9e51a4..65ff9d912ef9 100644
--- a/drivers/devfreq/governor_simpleondemand.c
+++ b/drivers/devfreq/governor_simpleondemand.c
@@ -118,6 +118,7 @@ static int devfreq_simple_ondemand_handler(struct devfreq *devfreq,
 static struct devfreq_governor devfreq_simple_ondemand = {
 	.name = DEVFREQ_GOV_SIMPLE_ONDEMAND,
 	.attrs = DEVFREQ_GOV_ATTR_POLLING_INTERVAL
+		| DEVFREQ_GOV_ATTR_TARGET_FREQ
 		| DEVFREQ_GOV_ATTR_TIMER,
 	.get_target_freq = devfreq_simple_ondemand_func,
 	.event_handler = devfreq_simple_ondemand_handler,
diff --git a/drivers/devfreq/governor_userspace.c b/drivers/devfreq/governor_userspace.c
index 3906ebedbae8..d1b765a7b8e5 100644
--- a/drivers/devfreq/governor_userspace.c
+++ b/drivers/devfreq/governor_userspace.c
@@ -135,6 +135,7 @@ static int devfreq_userspace_handler(struct devfreq *devfreq,
 
 static struct devfreq_governor devfreq_userspace = {
 	.name = DEVFREQ_GOV_USERSPACE,
+	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
 	.get_target_freq = devfreq_userspace_func,
 	.event_handler = devfreq_userspace_handler,
 };
diff --git a/drivers/devfreq/hisi_uncore_freq.c b/drivers/devfreq/hisi_uncore_freq.c
index 4d00d813c8ac..0800116e3334 100644
--- a/drivers/devfreq/hisi_uncore_freq.c
+++ b/drivers/devfreq/hisi_uncore_freq.c
@@ -399,6 +399,7 @@ static struct devfreq_governor hisi_platform_governor = {
 	 * Set interrupt_driven to skip the devfreq monitor mechanism, though
 	 * this governor is not interrupt-driven.
 	 */
+	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
 	.flags = DEVFREQ_GOV_FLAG_IRQ_DRIVEN,
 	.get_target_freq = hisi_platform_gov_func,
 	.event_handler = hisi_platform_gov_handler,
diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 401aac6a9f07..fcb278c4a74c 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -776,7 +776,8 @@ static int tegra_governor_event_handler(struct devfreq *devfreq,
 
 static struct devfreq_governor tegra_devfreq_governor = {
 	.name = "tegra_actmon",
-	.attrs = DEVFREQ_GOV_ATTR_POLLING_INTERVAL,
+	.attrs = DEVFREQ_GOV_ATTR_POLLING_INTERVAL
+		| DEVFREQ_GOV_ATTR_TARGET_FREQ,
 	.flags = DEVFREQ_GOV_FLAG_IMMUTABLE
 		| DEVFREQ_GOV_FLAG_IRQ_DRIVEN,
 	.get_target_freq = tegra_governor_get_target,
diff --git a/include/linux/devfreq-governor.h b/include/linux/devfreq-governor.h
index dfdd0160a29f..2853f571dfdf 100644
--- a/include/linux/devfreq-governor.h
+++ b/include/linux/devfreq-governor.h
@@ -43,9 +43,12 @@
  *   : Indicate polling_interval sysfs attribute
  * - DEVFREQ_GOV_ATTR_TIMER
  *   : Indicate timer sysfs attribute
+ * - DEVFREQ_GOV_ATTR_TARGET_FREQ
+ *   : Indicate the target freq sysfs attribute
  */
 #define DEVFREQ_GOV_ATTR_POLLING_INTERVAL		BIT(0)
 #define DEVFREQ_GOV_ATTR_TIMER				BIT(1)
+#define DEVFREQ_GOV_ATTR_TARGET_FREQ			BIT(2)
 
 /**
  * struct devfreq_governor - Devfreq policy governor
-- 
2.34.1

