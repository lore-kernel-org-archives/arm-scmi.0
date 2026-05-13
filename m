Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E557357CF5
	for <arm-scmi@vger.kernel.org>; Wed, 13 May 2026 16:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778690671; cv=none; b=AwI0NRItH5xACwi4luOtCyGEeUcouXgPFflDXRQSM0SpYkjGdHfgB1+/daSpszNwBzRG+qv+nRr4lCuyY5uKuVXJk8oXiLgODC4oUZdj5XnHQIhy8SlsXMFUX4D4bThZa1fbQIqaxMp9BVdtMk5bV5PuxWcm8hnmbeQdAfLtLBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778690671; c=relaxed/simple;
	bh=owGm+6Ms1s9d1BVzLgyFp+un8WuAsYAf6l9Aw77jkfw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iY0NIbB8WdoGS5C8X+M53C0fZQR8DU4yX/VnZ/+LVpFjyf1i2hhFn6Epa4davUXqgqGo6S7aJ8PT+gKPO7wUIAvIrvxxojhsM7BJcsmURwVxWsTDKHuRIrh8S1lS2144axfvA9oNMaCH39Z21H2liR2RG0/efOn8y9XzoCIpL3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=okBjSjsH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CTZ6gkCr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="okBjSjsH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CTZ6gkCr"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEpIbK3474926
	for <arm-scmi@vger.kernel.org>; Wed, 13 May 2026 16:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GxOv3DEpeFsG7lGsUZy6wV
	j3hN4O8w4tkjgP0Pww0/o=; b=okBjSjsHw5BOpXgK5ziJusqTYibbI6kIQpYBmk
	giLoWevafMpybboM+vGfOD8xMjXNy+ZJYLOlAp/kUl+r5c7wWiR9KQdGYb79jycM
	lQNyyEXf7OmwbBPmAY1I+y2lvbbfywFHr1Ab7fVNKgfozyXdCbIIKiSVRydK6EG5
	kyGJsXRxg9Yu1MB4g/QOuLeykYBO6s+qq3CwguXGfoDFzRx3bp8kTSPei/ObVaQs
	WufDZauE0fbf9DThk9H+PV2/DPmFCYv0xumXye7sKq6P+EquzGF3rwkf45D7y87c
	G5VU4h/3Cz6JoKoVgS+WacJW5ycpsfgeF42ZX5KNZfV2JPwQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p419vdh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 13 May 2026 16:44:28 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2fded513994so12306593eec.1
        for <arm-scmi@vger.kernel.org>; Wed, 13 May 2026 09:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778690668; x=1779295468; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GxOv3DEpeFsG7lGsUZy6wVj3hN4O8w4tkjgP0Pww0/o=;
        b=CTZ6gkCrzbh5ifYR2oUEU4HuEga6muudDKPasZIbqkBV70FwP6RfoGvczcfPexp3UX
         cO7lVCr6+9f5IQyNMwguqunTQAccLxUU7xo30qTCs4UZTCArEtxtU3tFbyh02o1KLBlK
         HHgEsSRI49eSTn5hOGcErCU7RJ5uYafyO660aABt/Zmxd8lYCCd+D8WlbWzve/Or560E
         7WVqkZ9MwcRk30ERL7x7nAoMp+ZiadhxaVW8fvts8aeIOoM/d8ZyW0S2+TOJJWyOgNXh
         B/U8lTzu4XOhLvkOzf5mldt4Akuw3M2gP5auNlIsHKqvMRsBEVGRaVeJZ/eqx4kr/VL2
         r7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778690668; x=1779295468;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxOv3DEpeFsG7lGsUZy6wVj3hN4O8w4tkjgP0Pww0/o=;
        b=g7kh90dmJa6+usDf2kJg7qmmmU3qg1LxQcoOS4YzRXtzR5kJlPUEH8FBCMaS52Y77S
         VqxJOg9bwTggfv8T91fYDJTDuY+mOD5KptlzNkMEakjFQzjAdD05wg1vjKicc58qBRI4
         /orebacfwEsdctlM2/ZuZKHWFz2FLJgu0Yl7ymjDQirSxOHIUjlxcZzPvaUcbepsGD1L
         l+ZfrKZNocMHeHdadH+wSW/upJMPQf1jDahDgs5clPPxjQuta304bVKcT0sDJklo+/18
         7of0HIE08npXHvjRcSyVlhNaGWDMycFClqAaoL556Nyrkju9iHvyTj9nZ0pwHKjrSISr
         l2MA==
X-Forwarded-Encrypted: i=1; AFNElJ+92kjL3vFt0l1LeIM5ObRgfNquBM1sVWCTxbGda4KBfZtAWLQdzPRp5lk5ZHj+CqPDEBVmz/6J9g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx0pWWl4xG70iX03I+X/EHXWVFnsx+q+q1TmscBA9KsP6JQmiR
	chgs+eFs7j+1RfuFNI09fMwPJkydAsdgUorzYilTtY2G6jwkuh6m7sHKFp31SC93BUXl4ox62dw
	xqD9gh2+mUu74k5UGmjzqR/0x3aSseknk/YWD4GkwzglhpKJpFQiQkkeCVA8h7g==
X-Gm-Gg: Acq92OG17ltFUVUGWxwmEirI/TJJzG+lqDvnEreIB15vl6eYrLkTLwE6eRsuwb6x4Xd
	R0yx0/t7km7hoERgOGAYBMwKkpS+jZPM6qSJyuDys+yVcF2lgVyCOnOkfrMvW8iiGQ680S6rM5r
	i9NK14UEdisNeD5tQ/d+bTSInrp1tksU5jf2yslHl/i/a04PTjvB3H+y7Mumm42zOX5+NRZROsS
	/O40p8tw04qudWy2yJCMmyvybBAQQtUTupHZKmBVEeIQbFGoxn3vBUCdiR4P3F9ZyMUp2qG0EJ5
	7FQGa1Wntm4WOspp4BD7nUqZdiqnbHTd1XzXYBfq1Vhq2RDKoBNzMKPHhgXAGXMEdA7Zdt0xaRt
	Jp8Jrb4tsJJ8NX6gsrNwS1yHk+4PSjJvDNBrNUL3xSpuNXWaJtYMC7FxgDO/k2m+fFI7p63Y=
X-Received: by 2002:a05:7300:a504:b0:2d9:7bc4:9578 with SMTP id 5a478bee46e88-30155e304dbmr1975302eec.28.1778690667509;
        Wed, 13 May 2026 09:44:27 -0700 (PDT)
X-Received: by 2002:a05:7300:a504:b0:2d9:7bc4:9578 with SMTP id 5a478bee46e88-30155e304dbmr1975276eec.28.1778690666940;
        Wed, 13 May 2026 09:44:26 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8864c37basm22570076eec.13.2026.05.13.09.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 09:44:26 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Subject: [PATCH 0/5] scmi: Log client subsystem entity counts
Date: Wed, 13 May 2026 09:44:18 -0700
Message-Id: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGOqBGoC/x3MTQqAIBBA4avErBuwQvu5SrQoHWugNDQiCO+et
 PwW770QKTBFGIoXAt0c2buMqixAb7NbCdlkQy1qJaToMeqDUe9M7sIz+IVw9ytWbaNtJ42UqoH
 cnoEsP/93nFL6AFz84YxnAAAA
To: Jyoti Bhayana <jbhayana@google.com>, Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hwmon@vger.kernel.org, Alex Tran <alex.tran@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778690665; l=1343;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=owGm+6Ms1s9d1BVzLgyFp+un8WuAsYAf6l9Aw77jkfw=;
 b=W/Xp+gageC3TE/YpgFXFLe+pQ267y6ZmcjgpS00EQKpFmnevoEgeH6XSr277h756bxENsa6q3
 0CHZJDNRK41CRyitjcc/SiRtRARtb3XvVyWqFikd3hYiupPgngaWxsP
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Authority-Analysis: v=2.4 cv=df+wG3Xe c=1 sm=1 tr=0 ts=6a04aa6c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=0wi9YMwNQcJCIsSnl6QA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE2OSBTYWx0ZWRfX+U2pqEM3ioBU
 AUH+zPt1HiyvS8hjRKibVmVOc/AGtcwMEGudJmaN870Rs6q9dU2oydaSnN8JhqyrpJS7XWWq7ey
 RGDQ9hW8h+XUwDxwNGNW+xTYQd1lccOd9oW5a6vvNoe8bv0oc8nzY1//jsX+5JwAk/9wBHCa4i0
 +Kdp7b6vcd2NQosbzhAnlGZO4ff2QH54BDknBOdibdXMJFoxznFz9Ubm/fJPBRd4aY99bOYNuH5
 I1xmUtJtQhujGsoxsX1TCwMe+qo/d8R06n8DYb/YqTm2A+sOCv1CEQ7Lcx+yHKQtPz7ipN67Uif
 A8U0Y/P073hk43wECd5rNTsBLwn9fX5lM04C2vXOgtczKflL9x8UxSwoaRCdO7RjwDc/xfTlG9B
 NXzgL192xcBlLrDiT0h3BoPXvMhmk6Dcw6YjqWv2hxBaq0r2vCkK4SknZXluN8B5sQ/Nd55RkmY
 PmOZhOoUKbtQ9d+3fbg==
X-Proofpoint-GUID: xD1WsUJqwYhkJnfMZxZ4bm_3HXc661BF
X-Proofpoint-ORIG-GUID: xD1WsUJqwYhkJnfMZxZ4bm_3HXc661BF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1011
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130169

SCMI client drivers do not consistently log the number of supported
entities discovered from firmware. This information is useful during
debugging because it shows which domains or resources were exposed by
firmware during probe.

Add logging of the number of supported entities to the SCMI cpufreq,
pinctrl, reset, hwmon, and powercap client drivers after a successful
probe. This aligns these drivers with the existing logging in the SCMI
power and performance domain drivers.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
Alex Tran (5):
      powercap: arm_scmi_powercap: Log number of powercap domains
      cpufreq: scmi-cpufreq: Log number of perf domains
      hwmon: scmi-hwmon: Log number of sensors
      reset: reset-scmi: Log number of reset domains
      pinctrl: pinctrl-scmi: Log number of pins, groups, functions

 drivers/cpufreq/scmi-cpufreq.c       |  5 ++++-
 drivers/hwmon/scmi-hwmon.c           |  1 +
 drivers/pinctrl/pinctrl-scmi.c       | 11 ++++++++++-
 drivers/powercap/arm_scmi_powercap.c |  1 +
 drivers/reset/reset-scmi.c           |  8 +++++++-
 5 files changed, 23 insertions(+), 3 deletions(-)
---
base-commit: 1bfaee9d3351b9b32a99766bbfb1f5baed60ddef
change-id: 20260509-scmi-client-probe-log-173cf85d5563

Best regards,
-- 
Alex Tran <alex.tran@oss.qualcomm.com>

