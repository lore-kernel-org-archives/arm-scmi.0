Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C583ACF18
	for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 09:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723801; cv=none; b=I3CV34a2aBkQJVIfsnjQUjpvlI3EgBrsx2DQfjNQoddZQ5mSz5Finu5wMrjvYV04iq0ADeigf4U5ymRB9GSv/WYzEai5224/soXk3OwQ6/9TnYYNt8r00FBPLa6YdfVMHadESPug3tQmfF6WxlgD3b29SkBmQpyd8Mf18LOv4xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723801; c=relaxed/simple;
	bh=uY6a10tUUeLOvhvoLxhXzCg2bACGOAn9guxhSnZlLwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kojNJvWUos37c7CM0vuvJEEREXQfo/Is+FhrjLN58wThyEUdf8pCFXd9cvsQV+8mqjTlXdl4093fgFf8Ttdhr7Le3gWYSFMSMxqzL2qT5oCIltNZiTzwNLSuWP8iSIoTi75XQwKKlDXLHR4wwrHACv3gRN2tvyDAFsSzlnd7Swk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mCZE6l73; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eh6JzLRW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mCZE6l73";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eh6JzLRW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I5xroa204094
	for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 09:29:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=csYgVbrv8Ts
	eQaIQhbFcx/zPAvB5tHhPbrMBPJ1Wxu4=; b=mCZE6l73Y99dQjjmqPKu2F13UgC
	Q8V6oDKEg/X6rz6xoc1GT1KKWqTXhm0rQJn3veEbxmZHEuLMuYWe34bOeUeKpWBi
	xFIh4CZoFwUhPDjQGhqm9gxoRdxq2xKMrGMzksLWjU9SVxVggquzs8cocmjE3bhI
	4FAVUsIZEoU6MD5QMlRjMkzF5UgHsWJJBiOgbtURNaNSQKxPlCkRfu5JRoMXzO/i
	ME0VzaYGzfEwNdQkKO3ropG/elYyQj3vOrUNuqYZjbueobr6eXHOzIYIzqisMb0l
	KJNLjlLHhN9TIHrd/O5TujJz8/ymATdskrcA4LG8nDAD1Xeju9n+YPZhsgg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grxp2s2r9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 09:29:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91219341db7so11398226d6.1
        for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 02:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789723797; x=1790328597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=csYgVbrv8TseQaIQhbFcx/zPAvB5tHhPbrMBPJ1Wxu4=;
        b=eh6JzLRWUMv7IBe81EhuCqg5N/wbHU2joI7+9JczGjgzjuramBT+zN56LFrDQ5W6BO
         BgT8kinI2TnAFI5Ok8363BO+LLSwDDWOq9CDcvVJwjcVrNLgUEaR6P1gTszhAPWfxPC+
         0UiCNz9IGJrpZ/258QZDkL7jj858JMJc1/hzuqNSdz83GXM8XcXe8GSsXZjUA27n+VlP
         C1xuTAJvHISP18E8I8zXAI5yascsgHNHWMFQNhssXVxmOL9tkFUwYsBTykeAWg/xAtaP
         bjjg9m6vBZPBFBNlnvaDHG1ZGaIWsTsvirFHbgwmITLjqz425RLNZd78w2jzPpjITOsx
         UESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723797; x=1790328597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=csYgVbrv8TseQaIQhbFcx/zPAvB5tHhPbrMBPJ1Wxu4=;
        b=S5CkQ/bcuJjno/G/4ScbY03DyRUk8bG1mlBpQTvSM0NJWkMQ+Z2gOMuVrIcgv+LeiE
         u4CVVwyQE4oW+jyCFfyE/oj7PoVGhz/BJOl4HNIARxj/tQgObAOswq/FotDW/vVskoJf
         Ijp/4OfhUSANsGuGHhhAzm+CppAKrIU2BCKQLQIg/nqC2jNN6Qmf503F6TpJm0+B1dDi
         t52jrqTret1mFEyhucymrQb+NPmTE/8o+OV+Iox4NvPjCVX233nnd6fQz6Yqbi3Pok5F
         QYl4wYXX250mi4vDtNHBPl4zdC3KyqKmxtqCJcEjfTCmUv3jfc6XGBuH6i0YXe2I6CEH
         Y69A==
X-Forwarded-Encrypted: i=1; AKwUvBx4X/rrcqWOHacN0WSc4s6IeMfjkXMqF1nZsBKCzkR+nCUpcojuj+HvoFYGwt6xxn8w+GuvDuSgDA==@vger.kernel.org
X-Gm-Message-State: AFuF++m5EivoiU/dmfAP0NpOh3B3dKXRRUuPQtXxDoeGLJ5mHkHs4D1r
	0YeLUoFc3y+rK4R2K4yf5h2CLdoMTP2bXbY6Yy3dBZYIgUhhq8RlRNAqPmA2S70FreFEeccAUN0
	fnlCHlSvMtfPdBzWmEp2Xww/blOph2FrGnI3bqzxYsZS9fN7P4bugfYIJjk2eAw==
X-Gm-Gg: AYBFou04vm8//1ZK2ipX+odlsvNJdBDNvzP9dGlEANOJ25X+XVKxuV2lmHVxo3Xb+bE
	laAZzMaq7TBnlmIqJ7JMAifzwWYA0QB6zh/HsH3snRdgt+ePJ8FR4OR6RBl6cjEbZFvKic5a8xL
	Zvp7RqEnoJcwLVOdmiEv10+1kpI2gS/SAwzph+Fte5bLKrzXQozUMTzxSX/OeIwsYVSsqTGDWIy
	4IkkLBVM2tdXPBVbFA+8bMOBz0bFzY91DtADwnbf4R5NwmyTAJByt53F+wKifTChtoPjaz/NbLr
	me6eK3rXJwZyq/c5ACeVqwij7gg6BhbGTayi35PxafHVnXWNHi+umvmCsNUSUYeo9ZdEUThjsed
	LobzfFl742uhDHywBrd3rW6TWvUm0NHs5vf59cWcBv2VyIRWRo0hKtKJaUWMUrbNYjV++y8DXMA
	plrPNq/37dVfk=
X-Received: by 2002:a05:620a:268d:b0:934:ab73:ac53 with SMTP id af79cd13be357-93bdc475a1fmr222769485a.0.1789723796734;
        Fri, 18 Sep 2026 02:29:56 -0700 (PDT)
X-Received: by 2002:a05:620a:268d:b0:934:ab73:ac53 with SMTP id af79cd13be357-93bdc475a1fmr222767585a.0.1789723796258;
        Fri, 18 Sep 2026 02:29:56 -0700 (PDT)
Received: from t14s (2001-1c00-0c32-7800-07d4-cca3-ec08-7ac7.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:7d4:cca3:ec08:7ac7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bbc6bc0sm36796166b.60.2026.09.18.02.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:29:55 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/2] firmware: arm_scmi: Always create devices for standard protocols
Date: Fri, 18 Sep 2026 11:29:51 +0200
Message-ID: <20260918092951.5656-3-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzMSBTYWx0ZWRfX8ZcpqCIbaVwC
 8YJVicyQzPQ58zpU32/fphHpYMdX/oIDIam4XDu9YH0Em6r0ALBMbpzcL6wkUS2lHiQNXolpizb
 nReQWex4HCLE5jnXJBmxIWJ7xsOEt68=
X-Proofpoint-GUID: b6GrCmpGEQMgpqR7UOufEF8rHDt3aonX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzMSBTYWx0ZWRfXwGPHuXjFHuCx
 YZbK6sAHEQIyPdXkRHrW4hgpCssqv0ubdpmfkQMfgGdgN9Lw/p6RRzhj6q3hjrAuaaHYpM9j1Bh
 V0/Tu47//ANMPgUrabMgMicN5Uz1u21X8lNb/e7/xQMs0db8JlKOWTcbnrwvlLQnAglROpMyvG/
 FTulMFkYGew1VLwVhfXtBOeL5vJgiaVCPi5DlclKd2iCjb3nDRsi6VqogmjTDIE92gCy09dgRjp
 47o0VwLwGHNgVP8veAM0qK6gMrQPyWdGz3exk+bQPp1SbmF4WaH5F49dLoa9wAi2xFeQwSr8Z+J
 1EJHCE1x/vsvQa1xXx0TLGRx0hldspYpCOXzPbQeMAoibLXLxNPDTqQ0PZbtL8IM9E9/vdz1Rle
 EwctaO9euuMNNLY92/XCMJ845/rX8aLq9hsjdVg70etTQWv2Xq0x+N9Wne5hf8y55cji6d0IoKE
 AAfLTf+1Uis6xGgIuSw==
X-Proofpoint-ORIG-GUID: b6GrCmpGEQMgpqR7UOufEF8rHDt3aonX
X-Authority-Analysis: v=2.4 cv=cNF1IVeN c=1 sm=1 tr=0 ts=6aad0495 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=l971TreVHldC-rsvbM8A:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180131

Protocol driver module auto-loading requires the devices to already be
created for udev to get the necessary uevents based on which udev loads
modules. But SCMI devices are only created after their { protocol, name }
device-id has been added to the requested-devices list which is done from
scmi_driver_register().

This creates a circular dependency where device creation is waiting for
the driver to register and loading the module with the driver is waiting
for the device to be created.

Add a list of standard protocol device-ids and always create devices for
these without relying on these being added to the requested-devices list.

This removes the circular dependency, fixing module auto-loading.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v7:
- Rebase on top of v7.3-rc3

Changes in v6:
- Replace the if (!phead) return NULL; early exit with return scmi_dev;
  Since a standard protocol device may have been created at this point
  (Shashiko).

Changes in v5:
- This is a new patch in v5 replacing "Pre-register protocol, name tupples
  for standard protocol". Pre-registering requires
  scmi_protocol_device_request() to allow duplicate device-ids, but then if
  the first driver of two with duplicate devce-ids gets unloaded device
  creation for the second driver will fail. Allowing duplicates causes all
  kinds of problems, so this new approach avoids this.
---
 drivers/firmware/arm_scmi/bus.c | 50 +++++++++++++++++++++++++++++++--
 1 file changed, 47 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 51de50fbc382..31365d59b98a 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -533,6 +533,34 @@ _scmi_device_create(struct device_node *np, struct device *parent,
 	return sdev;
 }
 
+/* Standard protocols table */
+static const struct scmi_device_id scmi_std_id_table[] = {
+	{ SCMI_PROTOCOL_POWER, "genpd" },
+	{ SCMI_PROTOCOL_SYSTEM, "syspower" },
+	{ SCMI_PROTOCOL_PERF, "perf" },
+	{ SCMI_PROTOCOL_PERF, "cpufreq" },
+	{ SCMI_PROTOCOL_CLOCK, "clocks" },
+	{ SCMI_PROTOCOL_SENSOR, "hwmon" },
+	{ SCMI_PROTOCOL_SENSOR, "iiodev" },
+	{ SCMI_PROTOCOL_RESET, "reset" },
+	{ SCMI_PROTOCOL_VOLTAGE, "regulator" },
+	{ SCMI_PROTOCOL_POWERCAP, "powercap" },
+	{ SCMI_PROTOCOL_PINCTRL, "pinctrl" },
+	{ SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },
+	{ },
+};
+
+static bool scmi_device_id_in_std_id_table(const struct scmi_device_id *id)
+{
+	for (int i = 0; scmi_std_id_table[i].name[0]; i++) {
+		if (scmi_std_id_table[i].protocol_id == id->protocol_id &&
+		    !strcmp(scmi_std_id_table[i].name, id->name))
+			return true;
+	}
+
+	return false;
+}
+
 /**
  * scmi_device_create  - A method to create one or more SCMI devices
  *
@@ -562,22 +590,38 @@ struct scmi_device *scmi_device_create(struct device_node *np,
 {
 	struct list_head *phead;
 	struct scmi_requested_dev *rdev;
-	struct scmi_device *scmi_dev = NULL;
+	struct scmi_device *sdev, *scmi_dev = NULL;
 
 	if (name)
 		return _scmi_device_create(np, parent, protocol, name);
 
+	/*
+	 * Always create devices for standard protocols, even if the device-ids
+	 * have not been registered into scmi_requested_devices yet. This allows
+	 * auto-loading of SCMI protocol driver modules for standard protocols.
+	 */
+	for (int i = 0; scmi_std_id_table[i].name[0]; i++) {
+		if (scmi_std_id_table[i].protocol_id != protocol)
+			continue;
+
+		sdev = _scmi_device_create(np, parent, protocol, scmi_std_id_table[i].name);
+		if (sdev)
+			scmi_dev = sdev;
+	}
+
 	mutex_lock(&scmi_requested_devices_mtx);
 	phead = idr_find(&scmi_requested_devices, protocol);
 	/* Nothing to do. */
 	if (!phead) {
 		mutex_unlock(&scmi_requested_devices_mtx);
-		return NULL;
+		return scmi_dev;
 	}
 
 	/* Walk the list of requested devices for protocol and create them */
 	list_for_each_entry(rdev, phead, node) {
-		struct scmi_device *sdev;
+		/* Standard proto matches already have their dev created above */
+		if (scmi_device_id_in_std_id_table(rdev->id_table))
+			continue;
 
 		sdev = _scmi_device_create(np, parent,
 					   rdev->id_table->protocol_id,
-- 
2.55.0

