Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EF13A9605
	for <arm-scmi@vger.kernel.org>; Fri, 24 Jul 2026 07:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784877560; cv=none; b=eEgIRZyobYkFrJICaaF+bGwS3H7svYTbVpXwC2tc2/GA8ZxE9IywpefN9yqoauvD4tZAANKHUrcUjTglC4dY0E5ymhKJ5nxZFAgoH9u2kJpJVGw15LYoU/irrrIRcpBmInohgz51A+er/ceefB61hYi3QO6Au/QO0+4KdFRJ5Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784877560; c=relaxed/simple;
	bh=KCWI3HNx7SBSYRM9H+O74KRL98G1L4v3MvETRdT4fww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=txKTDUZguzdGi7MeIdcnyzwvRLKVleTN0l7sc56OZyN5xpi7TQ9o9rG6FM8fEozaK+4eHJKHPuLpOrK3lsZmQVXkn4EC2A/ItIkYxSg1+sUKvAR7oLhuCaKSlgO5NqjKWtdOxA4t1nMfL94ZrrodGJXwWnUWIKcWWeI71mv5opA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=enChIPtp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YEsNfpTm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="enChIPtp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YEsNfpTm"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lDve2275968
	for <arm-scmi@vger.kernel.org>; Fri, 24 Jul 2026 07:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o+cn3qFiodANuon2nIvIKSnIrm4LrxKQ/PH84MmjCzM=; b=enChIPtp/j5fth2d
	abWNbz0T7ekPNvwODwOVFrhDaNFaD41JtFgod2KyVyo7b6hlyO3z1NZNTNHZHKlS
	OgirzJ+3DgAHA9zlJIW/hYERuJ13aX3d6oB/k8DrvTEoPCn6ehsEvnagnkuDT9l2
	ODtxAIumC12a1U3C7K3b2J9+Lb7x8Y7x7nxus5cAURI3cHdn/RjosXBy1lIUfoIR
	2cAZOmZPFqedKdUDVDXAJYxDmsgOT38XwOl07i1ULtXjUMm7YLR5PuFY4EqK2G0z
	VE+r3D/1GdCrj2sTReZ42dCsfv6J7p3vWo6cL2M2DNoQwcwCflu1SVtDW42VqynH
	OvilAg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa0ak54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Fri, 24 Jul 2026 07:19:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccd1958e8fso2125025ad.2
        for <arm-scmi@vger.kernel.org>; Fri, 24 Jul 2026 00:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784877556; x=1785482356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o+cn3qFiodANuon2nIvIKSnIrm4LrxKQ/PH84MmjCzM=;
        b=YEsNfpTmKhDnBoM5r46YmpxF5bi40l5rGS7kjlbh6SasXfKazsF6ae+vlzq3OUcLyd
         8DNmBVd5xGN5Rh3sN1aP99u0N3kyLYNkkN9zXouNtn81XOj+0p26/DJWRUlfQmDXRO0g
         Xg1nyinvTfUjUDC1fvwF/TY5b7xii1Lwm8JXbf227VORO0bZgFv7zNmhOYcw7eGPPXT0
         2mxNJkUU3vBMPiH5nHN3qRJ9fhnlJUK/cQmYs9qRTNLIFzp/D1/T52/jZCxeXy3twldG
         etTnDV5GWs3YCTwDmgt45K3YOSMv+W4S71jV0LDpLrMNBSJ8jCnHQKEaH3/FEGC3C52v
         AZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784877556; x=1785482356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o+cn3qFiodANuon2nIvIKSnIrm4LrxKQ/PH84MmjCzM=;
        b=dIcCQvNf2SPtUAMMxU9G5ZrJO70w2JnZRXa2QDNCjUB8z45OZH7kMOF8Dhd8O7sTwl
         lM9HvizX1iopkw9823YRC5rIj3zA0lzPbfVaMbjhZOykz3rv16ETsBgJ7JX7nmjqTUNu
         ZkdqjsAJ9/0/cwwxtnXIagkOfkGfWEK0YoY1pv7u5JO4K30Pf4foSdthYCsUk0mjiGtm
         4CI9prrVZjxqi6xyZQUnDmWi7I8sWe6tuTcHyJcm3yLjz1mHJZ2L52mAGKNUy1EHi8yv
         IwkTaLFJB1+sKe4oe5Mbevr8eF50Wog/9qp7p8oe7rGzwdVUnzlIr1yjs3Y29ObwgoMn
         J3pQ==
X-Forwarded-Encrypted: i=1; AHgh+RriXZfjij4yyhUfvg8QTGLftRiHzQWQOZKLs6eGnnKv+JNdTLy/R+MoAF5M9SC/EleWJ0bix+OzMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyPog3Zq+JUIkDW8VJxexIAM9yAPTj2Msg3Up4WFIaP9oA0HBK
	myAAp6NVybZiLmwuMltqwkuUuB4HnjvOvbZsKYfcfmuZDUb18LabNGHuedxyNSdK6v2uzSNAlnJ
	i3i6Ixzm+vjKwq9EF5Nr8fAiA4cAwCN09CE9KHrl1dfMepek6HgPyaxqv2ZypBw==
X-Gm-Gg: AR+sD117qF6z0TDUxMVAdjDDeeMMn+ptAb6XB+lD3BR4fuOf3p7fD4nTQH0YdLjvT7Z
	em6iM41l34M+vrTlOjY02b6YOm75x4bsnipK/Iy1kQThq6Rm/2vXrwzm76a6+GZMstD0oNZsj8f
	AGDogQD+MataLEtYMKtdSxbqxJhtx8wcvopr97WgJ2KGwW055T9nu2ABR5bk1fUywH6vn6SHGxA
	owZJpyDZ1pAifHNgxZ6gBA2BsDu2yecLZDXJkt2/JwmVNC74I3iiE4hW4l6E1+AfYYXrY6uAhJa
	MY4BtwbuLYJaYxzaWH3+G74h9ZN3bB28uwAvzIalrdEjFLSgcYUFHc2Pt00/aMeXGzmQg1lPMmw
	+3qoHlK3zHq6apc0ZDBRBdcdIzbhttzIL8hXtL0SrVX8juFVF63WFT/1ia+Zd5dcmA5deOpkGDm
	S+yi8wE81UFOhmHrgk3DHgc7xp0HE=
X-Received: by 2002:a17:902:e801:b0:2c9:8f4a:90b with SMTP id d9443c01a7336-2cfa6a54e47mr73353205ad.3.1784877551526;
        Fri, 24 Jul 2026 00:19:11 -0700 (PDT)
X-Received: by 2002:a17:902:e801:b0:2c9:8f4a:90b with SMTP id d9443c01a7336-2cfa6a54e47mr73352855ad.3.1784877550917;
        Fri, 24 Jul 2026 00:19:10 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efe3afbsm45993805ad.33.2026.07.24.00.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:19:10 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 12:48:09 +0530
Subject: [PATCH RFC 04/10] PM / devfreq: Add new target_freq attribute flag
 for governors
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-rfc_v8_scmi_memlat-v1-4-cb732bcff1f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784877514; l=7716;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=9zK8epQvNbuVk1OIit8CUMNNYQlt7Ism/my5pJtwFUk=;
 b=nOAw4COlo3kTot+tWkInoVAG4WMWOoJMrZMVGgHNvYlBa1wuSNNnr7Bt15tb0fp2L8/rUxg/o
 dcNHgIULXzuAkC6FA9umZi+IFucLk0uDWz6TFs4cvfmPfaNyoi36lFN
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-ORIG-GUID: 48OAqb6b1TO5sNA8Xl1Z0fQAaLRdSRAN
X-Proofpoint-GUID: 48OAqb6b1TO5sNA8Xl1Z0fQAaLRdSRAN
X-Authority-Analysis: v=2.4 cv=e/k2j6p/ c=1 sm=1 tr=0 ts=6a6311f5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=hD80L64hAAAA:8 a=WcTcrbn6WVXM4q_icv8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX19hDMiLaFhKE
 oJ4MBT2G5mnFKP4RAKLATarHv1JrlX/ii3QHoB7qErZhXr313zQ0oi62WKq1rJJf4YdasTwHRTO
 IwSXMaTiqmb7+kKGGfCWgruu9zs91ffWxYzdbdBuqcp530JhWBZzsgMkpVTmXGxjL0R//tGKUJl
 EKfpZPx76NqJs8lwNQG3PWqHWbc/GjlsmUGhbkXZjp+Whi1Sn2EnFogVFwFxPXtxQt5qJMNe/dL
 ZJjvS8TO+YudTzrFqbeNxQE57rn40cScO8pjcT+cPM6jiVd7H+X22AN/RCyhvir3Hhv2qktGJRw
 sVTburBSigYZj5wvqMouKmHr9FHEGbMAFyswY9d45JdgaNXqEDLffHtJvWdjfHPqMGv8NMgoRrr
 KQSAUlnBDiKjGT9oSeKjSi40dj1aIJzxrqNDKrON0s0WlD0jB5ew+ZLqY3SQtGoLfvdFdMldJDg
 7cxalrD0z9ibZqCW5ig==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX/Mjgy3XvffG0
 JZYHBBIeASuMlC4jEZnuut+4C7B4Yz6B8+tocvwtVklwLNnGPRG+PkjFqAIP9VIIG3d1TsX6Dg8
 hqErij4tTun+uu0lgoVuYKlhFnj9PbI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240065

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

The target_freq sysfs attribute exposes a governor's predicted next
target frequency. Not every devfreq governor has a meaningful value
to report there; some merely observe an externally-driven device.

Add a DEVFREQ_GOV_ATTR_TARGET_FREQ attribute flag that governors with
a meaningful target frequency must opt in to. Gate the existing
target_freq sysfs read on the flag and return -EINVAL when the active
governor does not advertise it.

Tag all in-tree governors so visible behaviour stays unchanged for
in-tree users. Out-of-tree governors that drive frequency updates
and want to keep target_freq readable need to set the new flag.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Co-developed-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 Documentation/ABI/testing/sysfs-class-devfreq | 8 ++++++++
 drivers/devfreq/devfreq.c                     | 6 ++++++
 drivers/devfreq/governor_passive.c            | 1 +
 drivers/devfreq/governor_performance.c        | 1 +
 drivers/devfreq/governor_powersave.c          | 1 +
 drivers/devfreq/governor_simpleondemand.c     | 1 +
 drivers/devfreq/governor_userspace.c          | 1 +
 drivers/devfreq/hisi_uncore_freq.c            | 1 +
 drivers/devfreq/tegra30-devfreq.c             | 3 ++-
 include/linux/devfreq-governor.h              | 3 +++
 10 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-class-devfreq b/Documentation/ABI/testing/sysfs-class-devfreq
index df8ba88b9f6a..5be9940a5853 100644
--- a/Documentation/ABI/testing/sysfs-class-devfreq
+++ b/Documentation/ABI/testing/sysfs-class-devfreq
@@ -37,6 +37,14 @@ Description:
 		The /sys/class/devfreq/.../target_freq shows the next governor
 		predicted target frequency of the corresponding devfreq object.
 
+		Reading this attribute returns -EINVAL when the active
+		governor does not advertise DEVFREQ_GOV_ATTR_TARGET_FREQ.
+		All in-tree governors that drive frequency transitions tag
+		this attribute, so existing in-tree behaviour is unchanged.
+		Out-of-tree governors that previously relied on the
+		unconditional read of df->previous_freq must opt in by
+		setting DEVFREQ_GOV_ATTR_TARGET_FREQ in their attrs field.
+
 What:		/sys/class/devfreq/.../trans_stat
 Date:		October 2012
 Contact:	MyungJoo Ham <myungjoo.ham@samsung.com>
diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index f08fc6966eae..2f27a239e34a 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -1530,6 +1530,12 @@ static ssize_t target_freq_show(struct device *dev,
 {
 	struct devfreq *df = to_devfreq(dev);
 
+	guard(mutex)(&devfreq_list_lock);
+
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
index e1f64b723082..5a2d7e011ad1 100644
--- a/drivers/devfreq/hisi_uncore_freq.c
+++ b/drivers/devfreq/hisi_uncore_freq.c
@@ -398,6 +398,7 @@ static struct devfreq_governor hisi_platform_governor = {
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

