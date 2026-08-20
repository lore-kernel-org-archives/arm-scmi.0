Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCA83E7BA0
	for <arm-scmi@vger.kernel.org>; Thu, 20 Aug 2026 19:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787255345; cv=none; b=M1Xr29q4HnjAIQbgvlKHh0OQBKH4mNuQ5qb8V0wL9fYr4zzx7tGD4gxnsMAhIiyGzFdFGcLDht4A7dfFzzuQhzXlbXULCT1ltI4erR6YJTtXhLxKmbSvuhY9RfW2UFDh7RBT4+eidTulvBTWT2PCFgusmbFrgWdkfgWqlKfIoDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787255345; c=relaxed/simple;
	bh=Lf0DV6zqTiNRbRqg0PwFD+T9VOrPKtziLfLRHxcXw+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sGDIxR7SFWyQjgbTkrjZHllaIaOcrD8xFgoUAN0TJnt/V93A+V7CAcDFFEGXhBurrY6CiRjpuNN38KoKNkMG3C2Gg2GZCLnHLZtl1xWaK5YWn5z+QhfaIItgQmTW0sX1i6O2B5Q1VNbrsN3ssZ48VZ1nm2hTMPOZcwBjDDbFUl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C3O/WUVI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=el4JmiiV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C3O/WUVI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="el4JmiiV"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KIJAUE1066028
	for <arm-scmi@vger.kernel.org>; Thu, 20 Aug 2026 19:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gbJ+FmOGmDz
	b9CCf6V3nGKJG3Pm04UC3Lj/S2Ts4X5Q=; b=C3O/WUVIys4ElKd4LJDGfaih8am
	CMM4C5GhUxPMgEVmQHnGmtChtz6W9H1+0BzjPj8WFolQKvn1EyoiTw9luB1CodGd
	cqF5E/RX5CyEyqkKEHkZLzMlQ/s+RBH+rSf+ktOBKxwTRx082kHzxg1ZiCepKQ6d
	7/mM906fhyR9D+f5ql5NNNWsnJzco4NDlUtdCA5vTAHRCElDYMhFuAo0AIPj9BBH
	GXZiTYo0qXri8xXVMWGuXtnwKKJNSruEMUhu3MFFKA57gC1CPCm7FKgdj/eOgBvP
	ihtOAjiCkF46+7wNxCxXWO/BbxnRj1Ala3KN0UBpzdFxL42NGu6Aiq+I/BA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vn8bev1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Thu, 20 Aug 2026 19:49:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e63df032bso152338485a.0
        for <arm-scmi@vger.kernel.org>; Thu, 20 Aug 2026 12:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787255340; x=1787860140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gbJ+FmOGmDzb9CCf6V3nGKJG3Pm04UC3Lj/S2Ts4X5Q=;
        b=el4JmiiVcR7Dm9g7225axHQKX4crpN7NZBAznvEOcgdPhOTmmo0G5PejP5YW6AYa03
         aWzouQbjVbQgSs5q8RkEs7rY+oMwdAxe0MAiFxOwCNkMXvc8Q/CuXrlW75ibPtVzDYG9
         y105Yvh/1/+0it15DNKMtqQbyjC8sk9DMv3xwqDj6MkT0sFHOM44BdWKje32yC3wbGG3
         GJ56Bo7ouM6STF2drQTvbyCzbgdyzSmDkOytecwuL3jCO/oNPsn4mTS+A/nduql2XKT2
         t50dOKX8T5vOhUY1YBHGvb2dPKLvQ1KnNcAgWWdrtfvkq21Tp6ggARfdaPJCPzp0MYl7
         cRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787255340; x=1787860140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gbJ+FmOGmDzb9CCf6V3nGKJG3Pm04UC3Lj/S2Ts4X5Q=;
        b=V2GVw2kcJTaIYg3YJSTNt5I3eVA7wg+cl43jWjGcdqYurDLrtXdUirNymbRQlozOEh
         B79yoYhjFxn8060pvRKu+dmmPS1E9seFRIV/WpRHGS/NWgqUi5SSySSAT1uAFaz27Ryw
         HxACly0fsPxiSbid8hu0FFEETgDqwK+DO5N3qB30WY8+7nhucxsNk5quV1qgqhz3K4op
         PNAHDdfXlNydHO5UV7LzT5yPeLYekIqKeZVW1u/FQ7frGGTQ4ILTONJOUV8Kt0M+aZrY
         mLzYBkSNq/COYP751ztl6js6xK5DeQcQbMhmvRFUwe5hBFR7VZqnqs9W70kzSGmYMlvM
         FKNQ==
X-Forwarded-Encrypted: i=1; AHgh+RrYoDPBF0bjaDQlLw5b9v0ebxuAj3RlzB+C8ejuwe1YM39SogbyYmE4ePzytDrU9GIu76ta7BpTzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEJ9mqJWyWWkgsBca+0ZftF3To99NTDK1K2xpuoW2lMSIkKT2a
	tf8WlkmpDIF/ebAab8HwFBUtGtaGuCfs5AFS25U0+rL5vDQ/uhthalg6yLq6M0S3LmF2yUVlFeR
	nDnXooBdJySgrgJKO0z6NpeZ/APmPVIO6ehye6fuwBZ2/SvYuo9riNDJXXMH8GQ==
X-Gm-Gg: AR+sD120c2eomJMYOljzzvkKkhwgVG6jlqj1d6s0YTbV9JrQT3SxKSLQTXkOCezNQwd
	M7+6C410NAR8MqR5zFKVe7PzI0djWenwslZI1dQsVq+zQWsxIQQe0mO5UhmAXaKW/ypoUUAbtgu
	1VOkZMI7KBIvLvQw3wKQnEnm5r69aFo3WKuMZi0bBWhSoh4x5jdCFDeoXNPfAY94SyGmYbb5H0N
	epZJGksmQo/7PMPC5mH+CyzpnKaTJgLkwZdSfSmWpCGIMz0a2V6R+ON+wWceUk60R+TefOm60TZ
	/Ny9rp8mnDj4BccHo3iiWApCiCPKIZcXByr4iODtmCnoN3FI1caUb4bEEB0YW9TTx5Iuu82Bsup
	tm8NsHtNf+uHM
X-Received: by 2002:a05:620a:268f:b0:92b:6e09:b0d9 with SMTP id af79cd13be357-9372858eaaemr977537585a.21.1787255340070;
        Thu, 20 Aug 2026 12:49:00 -0700 (PDT)
X-Received: by 2002:a05:620a:268f:b0:92b:6e09:b0d9 with SMTP id af79cd13be357-9372858eaaemr977533285a.21.1787255339638;
        Thu, 20 Aug 2026 12:48:59 -0700 (PDT)
Received: from shalem ([2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2459198ec5sm113433266b.34.2026.08.20.12.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 12:48:58 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] firmware: arm_scmi: Pre-register protocol, name tupples for IMX protocols
Date: Thu, 20 Aug 2026 21:48:50 +0200
Message-ID: <20260820194850.459739-4-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820194850.459739-1-johannes.goede@oss.qualcomm.com>
References: <20260820194850.459739-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE0OSBTYWx0ZWRfX9TMY29SqtWV7
 CoiPi6M2kISznS6CGSTierUiVtotpDuavxrixug2B/h/QwwqGEKahKuYe1UZlinnApyZ3cdfpTd
 mhEfsndZ/2d7fOQXt+hz0H3C/hdMxMS9Xymlt/oc9zub/IYUdFVgPJkYO8ZqYmKlEi9Hov4XtAF
 fCJZQA7GBszSQdoJsvOHoO7N3V9UW7riOY3c9C/TaR5ABrr1ZQ9rA/eOttCWM8+j5cJcKUtlv32
 R2SRp7zheP+C5gQRA3DG70S/iyv6OxkHUoHk4gQJRhZaFk9FuRJ5fuSl7FxVQfanLPXybFZ9VqA
 bl/K4MjcpHzokFeZR2qToIGLlnBzhPBFBlHPesm5KyU+feiJQjIftc8G20nQ2i1ENX/a9PoEsjY
 FUQX9GEPVmTPU4yAOIxy9LQvK/Jierzk9wqntoNU9IoFWqn6TtW7/nlw9Srk90gIkiVCOS9KxkC
 2OzmvXh8kGHUYgCuqlw==
X-Authority-Analysis: v=2.4 cv=KpJ9H2WN c=1 sm=1 tr=0 ts=6a875a2d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=88Q6Yv8u5fullXUEwxUA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE0OSBTYWx0ZWRfX/zTO3rShwev4
 1OALJURqrhxbSiJvVKzZY3eE7ghZodRHABKmtAQhLO3sayXb86FfgVt4A/qtvThIM99N8OCgiMU
 UwMWpOUOsHjE1TV8MKi5FJbjIDFwLJc=
X-Proofpoint-ORIG-GUID: cDOu5HbbEhr0RGV53MTk4dI3cqFr90fz
X-Proofpoint-GUID: cDOu5HbbEhr0RGV53MTk4dI3cqFr90fz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200149

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

