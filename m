Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E831932939C
	for <arm-scmi@vger.kernel.org>; Thu,  7 May 2026 06:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778135007; cv=none; b=f1qtCSznbyVnEIMbrqIkMcZJ3PhhBD2UpDGOcwa5cBtMFckdtgEGQmXeDnvHwRevyeL00XdJVdcucl3NJRLaS62JN/gaCdAXaidsPl3G3AL96KlGxPi/PjeoMDRhngrCQRU7nRWoRs7vU8zArIH3Y/YNTzkbSV5z+DAIlDDE6nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778135007; c=relaxed/simple;
	bh=L47y2KuTQaE82CAJC9S6eRIVru6wf2RqgaMOg1n3oLU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t/dAhtyx/5LLS599IwL87tilbNmkaWVa2uX/r4aSIlLJClSDDNV03BhVY8c4Ypg62VATo/3JEaZDHWKvEDfN07IkLXXc4DFRMeAojEGzyQzD6mCdv16W0prJe8OU5j58/VrnFgSbtgNmBQEyo1Ss/srNtkIptO9l3yUTstxH580=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M/ttAb1t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wh/7g74C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M/ttAb1t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wh/7g74C"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64745oLx879573
	for <arm-scmi@vger.kernel.org>; Thu, 7 May 2026 06:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nbCDYI3s3UP
	CGmKd4YHz++jLfH6zEuiFSirImm5jJO8=; b=M/ttAb1tG0koLpwH7pqEOVJC/bA
	sfYfYwDFxxgGDm2L8tHu9on0fvbQ17ZRNRO4/SIrhmHIfaYViLFNhi+6/RPGicKk
	d8NQK+/8+HMeLPFXaKSaCYh0IZGxa5I97Ja0mIAZ2a7ZUQ9OmCW2ERn6NGp6spa9
	QxIzbL3tZqDA7J1HJJ+SNlQqH3Vcez/nxic9aMFGA7A0C7G62sZY7dJwUDpZcEiZ
	ijVeAHYYUW+JUHuq2Wjz6FrDPu3ozhKThGHOifrHDzdzcbyGUo06o3Jc/uOnx8Bc
	VXUsBLoDWLtruC5U0cw0B5EYZeVyJEjSoOcx9/pJ2kvQ56CEH7XoCQzhD0A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kdq0d5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Thu, 07 May 2026 06:23:24 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f6e6a3a76so457523b3a.0
        for <arm-scmi@vger.kernel.org>; Wed, 06 May 2026 23:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778135004; x=1778739804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbCDYI3s3UPCGmKd4YHz++jLfH6zEuiFSirImm5jJO8=;
        b=Wh/7g74CkpPPOL8XYtAHudk80Z2I+vfJtAXJGLO4C+JDehTLPkPcTH8v0/kMts8l3Q
         G63mEx6Lg796firHi/OLtheIIfVPDREZ1ctpmftyobiZ1SctfgL/62+I8Jl2EEKjHqSC
         AxmXZUZkLjUbRcDZIvFUK+QpFEnBNcT9Gwz5+gj1YK453KrokmyUBmskh6+d9vK0LXCg
         OcZTkYq2ogIi8mRBeGstjRQ1riSCUZu9dE0qILxXTRAulLJ0GZdLH0dKcBvR1qY2hBnN
         nXoEEA4UrD9LvVJRsBmmkEZju4qLFEwKrV1RN4dP0ouf40alm+XWc5a0km5xuhGQqZC9
         LfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778135004; x=1778739804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nbCDYI3s3UPCGmKd4YHz++jLfH6zEuiFSirImm5jJO8=;
        b=fFI8I5bOT2BOqU/l/JoiHkB7cINdHXFDF7afobdFEYPuEjROXHRhoAgOvnguoRuhGw
         QKw/ZUqbU4Aa2nwGjzDX1Z9FM4SCfEKjazWVXFvk+Pr+t4GZyi/aN9iAlOJv+wUcq4kA
         bacO+XysORWXpdYgGcwH+yuJoy/Llu7t0j0cnqBZBAn+G/gN33FMlwBRmkvcRdhcnJm6
         eYT8ZAXA8ZkIbuFARl+Y78Sywtqf0I/tsOFmRtLbNhamYJQmhBk91zLFx2v1AflQPj4t
         gTzHZ9MiGQeSypzDC6YwYSoYqRhRcOXDbKrOXDqBRSxSsdg7KJJRwENqOn/LDq2gwD2U
         8JxQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ErS88d0hjY2+lB2yydxtWyecaDe52K/rz3mJFfeLsBoD0aDQnTi6a8cQsMWTFi3ToZv3jr9q7FQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrHhKpJFloAjLqcaT179lJD0PJBdFLBdbOP/DyLGGLMjo5pQgU
	KL13++C4JLLo2obxGQwlvp8PqIVOvXu6iWiwmA2xqk7MZeNTD2AetvcSl14KSxwKHdD5uYFAOU2
	Wnnnada7SjOHlx62i+0yOvy5vUW+S9noIg//kAHq82OG2JDcpM5PBXQtE0ZDxRQ==
X-Gm-Gg: AeBDiesWmgMXNK3uvZhQgegRr3+3lF7w7zf7eYESbatGGepc/qnwIE2pHcpZ1kf0MKL
	O671XueVFXI3sHOQdAcrDYTJ3zRfy0uah4EXgo40Faw3s4WF85V794zppjLP1eGPFtCodG67o0P
	FQ0hypaerEM3hjVrsy6p83X7thcG3cFScPmjsBwfJSX+JhSMccbejJe9ENp8AB2R2UsgbqRfzDI
	F+DAeeo+PceVPJ1t9f80dW5NGkESKVNKi3KUd3/tGQMvlnyl/HqldnMtf1KQTHNjjdVoK4xJB1J
	sVfNEh36gUigfln4bOGKSszfsA4gwfqdV2Sga4ZNlVcS+bJ7CnUaRoQOArEuYwCfWzQMMZb3ewL
	dn88/7t17oqr4Xb1Sch1+94TZUQP1n5aXJvILP4WeV0fvqXI1ZLhumEZjSfBaEXnnicaz0rWuIW
	hsPwz7oyVxQVSZ0thl6fn9M+sMhsOnErLTjdxe7RPKCSpNRis=
X-Received: by 2002:a05:6a00:3918:b0:82f:7bec:2050 with SMTP id d2e1a72fcca58-83a5e550f4fmr6139003b3a.39.1778135003788;
        Wed, 06 May 2026 23:23:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:3918:b0:82f:7bec:2050 with SMTP id d2e1a72fcca58-83a5e550f4fmr6138963b3a.39.1778135003284;
        Wed, 06 May 2026 23:23:23 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965945101sm7346557b3a.13.2026.05.06.23.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:23:22 -0700 (PDT)
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
Subject: [RFC V6 5/8] PM / devfreq: Add a governor for tracking remote device frequencies
Date: Thu,  7 May 2026 11:52:34 +0530
Message-Id: <20260507062237.78051-6-sibi.sankar@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=P6IKQCAu c=1 sm=1 tr=0 ts=69fc2fdc cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=4aD_1Snzd4jiIFQuHjIA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: ZVM4G3TTqvsP9gtMbUp8qMRWKLoX-Bgs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MCBTYWx0ZWRfXwkkjO4ogPhyg
 sRaD4wCG7t09i00ixY6PS2IVu4vw/tF+YTnR77AZhyGS8+etxOG+xNE0xCm2Esga2SdObdPiYXO
 hnDw5tQcr4ddeH961feOKs6Nc3egb2sW+cynq+urcnVDnRSZI/Pfq+7DBhHnZDEEvp81Ax1PfvW
 YAhqHC6uiQMiQR5OdwTnqr+A1KWk/XV+gW06J+bdCUX8WM+PDMI7hGtVU7UCWzjrQmsT+XKtguI
 Kz0IvOnvyVzzT0b9yRLQVEfjhVWiOLQOhJMRFXiAnecLbaCYMhurXI1qn0A2c69kya7sCEoGi0s
 FIwzAwJB5Z4cQ2YvJIKYGoo8FsPO9NhaC23nEEyDpKYdQmnhCFufS/dvb5iSOO4yJdtaGHEWvWm
 a4nWiHWhbGa1HvTEY7ohgnr9OTJZRtjxaVPhzl22madfjpJsbeXEtqWPJJJDj2TDMiPNFDuMkMS
 lAWlaxKwe8IHubT6rpQ==
X-Proofpoint-GUID: ZVM4G3TTqvsP9gtMbUp8qMRWKLoX-Bgs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070060

On SoCs, where the governor and the mechanism to control the frequency for
devices like caches is hosted on the System Control Processor (SCP), there
exists a need track the frequency changes in a reliable way and provide
ways to tweaking parameters on the remote governor.

To address this introduce the new remote devfreq governor that provides for
a way to track the frequency changes on remote devices. It uses the newly
introduced target_freq attribute flag and track_remote flag to achieve
this.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 drivers/devfreq/Kconfig           |  8 ++++
 drivers/devfreq/Makefile          |  1 +
 drivers/devfreq/governor_remote.c | 80 +++++++++++++++++++++++++++++++
 include/linux/devfreq.h           |  1 +
 4 files changed, 90 insertions(+)
 create mode 100644 drivers/devfreq/governor_remote.c

diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
index c999c4a1e567..2caa87554914 100644
--- a/drivers/devfreq/Kconfig
+++ b/drivers/devfreq/Kconfig
@@ -56,6 +56,14 @@ config DEVFREQ_GOV_POWERSAVE
 	  the DEVFREQ framework returns the lowest frequency available
 	  at any time.
 
+config DEVFREQ_GOV_REMOTE
+	tristate "Remote"
+	help
+	  A simple governor to track the frequency of devices whose
+	  dvfs control lies outside the kernel. This governor acts
+	  as an observer and provides for ways to track frequency and
+	  set/get information related to the remote dvfs device.
+
 config DEVFREQ_GOV_USERSPACE
 	tristate "Userspace"
 	help
diff --git a/drivers/devfreq/Makefile b/drivers/devfreq/Makefile
index 404179d79a9d..cde57c8cda76 100644
--- a/drivers/devfreq/Makefile
+++ b/drivers/devfreq/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_PM_DEVFREQ_EVENT)	+= devfreq-event.o
 obj-$(CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND)	+= governor_simpleondemand.o
 obj-$(CONFIG_DEVFREQ_GOV_PERFORMANCE)	+= governor_performance.o
 obj-$(CONFIG_DEVFREQ_GOV_POWERSAVE)	+= governor_powersave.o
+obj-$(CONFIG_DEVFREQ_GOV_REMOTE)	+= governor_remote.o
 obj-$(CONFIG_DEVFREQ_GOV_USERSPACE)	+= governor_userspace.o
 obj-$(CONFIG_DEVFREQ_GOV_PASSIVE)	+= governor_passive.o
 
diff --git a/drivers/devfreq/governor_remote.c b/drivers/devfreq/governor_remote.c
new file mode 100644
index 000000000000..6bff3cdaf1e5
--- /dev/null
+++ b/drivers/devfreq/governor_remote.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/errno.h>
+#include <linux/module.h>
+#include <linux/devfreq.h>
+#include <linux/devfreq-governor.h>
+
+static int devfreq_remote_track_func(struct devfreq *devfreq, unsigned long *freq)
+{
+	unsigned long cur_freq = 0;
+
+	if (devfreq->profile->get_cur_freq)
+		devfreq->profile->get_cur_freq(devfreq->dev.parent, &cur_freq);
+
+	*freq = cur_freq;
+
+	return 0;
+}
+
+static int devfreq_remote_track_handler(struct devfreq *devfreq, unsigned int event, void *data)
+{
+	switch (event) {
+	case DEVFREQ_GOV_START:
+		devfreq_monitor_start(devfreq);
+		break;
+
+	case DEVFREQ_GOV_STOP:
+		devfreq_monitor_stop(devfreq);
+		break;
+
+	case DEVFREQ_GOV_UPDATE_INTERVAL:
+		devfreq_update_interval(devfreq, (unsigned int *)data);
+		break;
+
+	case DEVFREQ_GOV_SUSPEND:
+		devfreq_monitor_suspend(devfreq);
+		break;
+
+	case DEVFREQ_GOV_RESUME:
+		devfreq_monitor_resume(devfreq);
+		break;
+
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static struct devfreq_governor devfreq_remote_track = {
+	.name = DEVFREQ_GOV_REMOTE,
+	.attrs = DEVFREQ_GOV_ATTR_POLLING_INTERVAL
+		| DEVFREQ_GOV_ATTR_TIMER,
+	.flags = DEVFREQ_GOV_FLAG_IMMUTABLE
+		| DEVFREQ_GOV_FLAG_TRACK_REMOTE,
+	.get_target_freq = devfreq_remote_track_func,
+	.event_handler = devfreq_remote_track_handler,
+};
+
+static int __init devfreq_remote_track_init(void)
+{
+	return devfreq_add_governor(&devfreq_remote_track);
+}
+subsys_initcall(devfreq_remote_track_init);
+
+static void __exit devfreq_remote_track_exit(void)
+{
+	int ret;
+
+	ret = devfreq_remove_governor(&devfreq_remote_track);
+	if (ret)
+		pr_err("%s: failed remove governor %d\n", __func__, ret);
+}
+module_exit(devfreq_remote_track_exit);
+
+MODULE_DESCRIPTION("DEVFREQ Remote Tracking governor");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/devfreq.h b/include/linux/devfreq.h
index dc1075dc3446..4d50cf230950 100644
--- a/include/linux/devfreq.h
+++ b/include/linux/devfreq.h
@@ -21,6 +21,7 @@
 #define DEVFREQ_GOV_POWERSAVE		"powersave"
 #define DEVFREQ_GOV_USERSPACE		"userspace"
 #define DEVFREQ_GOV_PASSIVE		"passive"
+#define DEVFREQ_GOV_REMOTE		"remote"
 
 /* DEVFREQ notifier interface */
 #define DEVFREQ_TRANSITION_NOTIFIER	(0)
-- 
2.34.1

