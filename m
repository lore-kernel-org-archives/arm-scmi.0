Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66164408630
	for <arm-scmi@vger.kernel.org>; Thu, 20 Aug 2026 19:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787255342; cv=none; b=iHtPPVB1u82Ndf4lTirbFSxfn5ESEM/gmUb0JJdQc4GKxoo6ohfLxQp6FhWNHqWu9Pys9mssfRNqfgI+vIsLj3Fq3vEKRcqL1OEjE4LS2bJdEWGId3ksdr5L6KQxC3UwNnzpPngnJg7NKzsHOR1GpJ0Zbay2aehJCq3cpDk/K0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787255342; c=relaxed/simple;
	bh=4WRilBWhHzZLU8uvO/z39X42z49BUIa3+WWApYbxJ24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p7QGdPzok9i/uUenOXPklI1xZcmLCXDQPyjNDeya/GZsxpYbBgSA/Uzw9UtX32DrP4FgzE15DKiT7cXvV2B9wMNDvXkEy3tsfLWM6DVEfL6LYNm2EVTKLmDVJUJ9sa1w1VE2cOyw6EKOQaf5q3MZgZDKnFZxn80zj9U9jO44qLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cDgaiLCF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N+GT1gvy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cDgaiLCF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N+GT1gvy"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KIJZAC3009939
	for <arm-scmi@vger.kernel.org>; Thu, 20 Aug 2026 19:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=c5VY/KOB4mi
	ZQvykR/E8D9DhRmzVzOzBrO3/MiSseIo=; b=cDgaiLCF1U6QfVNFp8f+3Ueeh38
	InEt1JCa4eRGJny6UkdnXEJduqbZYLnvFt/R7f1JjpPhw+dCn5cwsdyn9DVuZvN5
	MR9Rh2dDKKSWPNk5njY0QlSYqEY4sC42FK4qrG5G1wXoEAdNdGHbqqVW91c2Mh+D
	TkJ3Z5ec90h/HvI/ErXO2xmJRbAkTJKXYD+6+0Nvpryy8oLEH5x0/6yOKFX1sjFw
	OapQzIlmLGUwMhI8298Gu8xvKxwyRvx1g/DFoOeAa8wyToJIcYCcb90gbxe6Do2G
	3TH7HGHYaPnn5AcjlZJwU9lTrkxnKnvSyil5/iVeeEsHGa9vmeqvqSRmntg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x05u2ra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Thu, 20 Aug 2026 19:48:59 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-904ee4473a8so2437106d6.2
        for <arm-scmi@vger.kernel.org>; Thu, 20 Aug 2026 12:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787255339; x=1787860139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c5VY/KOB4miZQvykR/E8D9DhRmzVzOzBrO3/MiSseIo=;
        b=N+GT1gvyTamPYXd7XWJvmrEqtKyCSUBiBq+Fpq9/QMYuYWN52/sukf6B8T7ZAIJjV/
         Ae1SW9Aa8+eSTe1DvQ9LZ1Mfw134u7xhHlwuUy5ZeR4FMejA7ifFOYJGojkgxh1C5L6y
         70yRU22wCuQMnrns5TkJ1MYJUSAbS5WIHlIsOCZtC3Rm0V8VclhFfJuWWXvd0jKoho5Z
         EgvPuI7xYzOmmZIPOjqE2IckOy5jWUjmxs4z+oxztaOb3u40IAj2TwzSdmVZKoX5P5FN
         xpN9vKBNBUt2USfGJNv4byhpFSxa6EfTmK9d45yoacmBioaZI3iJTBnCPMQpenmHWYaE
         qwxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787255339; x=1787860139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c5VY/KOB4miZQvykR/E8D9DhRmzVzOzBrO3/MiSseIo=;
        b=pEwxKzDguZRyeA2dwCUwAUk2Vgi1by+5VgAAJ/ozfMI7QcBycttt2vlrSO1UtDpsk/
         YRZ1ou02NEgmertJzmJNEgxB8panV4qDlaATBR7ekgAbaYY5+xobk8MsDheEWPQXPMhF
         fd/UNyZXRj1FFa4X23lRAP3i8EoEdnwVk8xzV0R8OFLu5HA4PW2GaZaqos88IkxFEGyz
         RV7NxaF885iAK4++npUcsIKAGgF4kICNldQRw97/LCGCAHWPIDf/503qFHFOc2USyQoj
         aS9KEXUQkQN59ttBfycE7cD56T/8mGmatsFNUo69G/f/YU9DvvoxpEv7rz5ctNaKwE/n
         4dkw==
X-Forwarded-Encrypted: i=1; AHgh+Rol9YxuBHAISfxgCLKgNV9lV3ay7Uc5Wlvw57TppQtvQP8FEGjPt63XRyonos+s2gUR4vgB8UHLXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yweu1JspZ/CtTgH7ZwPmgF9fO5dN0u44cM6X6baTIE+bFSJFZoh
	ZuVVKKjBTM6fUAKzxgkGPJQ3bbaRUBH8P6y7VS75qVCf10cp3URDvIgcGBC4xEamv3n63hUC9Er
	dJ8E0FifvtFAqHvl2CTADxcYC5bL6Opb8SViYgr5IOI/Gsm4MLtooGtgkZYFm9A==
X-Gm-Gg: AR+sD13VPkUOUUDCkBw67gdF3SbHuWTBSmQdmpsJAzqSWc02WpxNSELvB1Gc88kgK7e
	kSQa2ZEYufLnbRGvqq65JfPWltReazhDlZc3iuUBrQ+4T8MUe4Ec9xAw3CWqLkQdfSmDpWqLcHS
	OJIItWfLcXyjO3ZIMXNaV0beugpqlSDOqekG8PO4SKUzFjxhaR9Om3J79YZEyGOJ3j8H/4pm0y6
	p8o2rk7ugKuhklw1xSgi9ecx9rT6zWQxuUYicvB0U1/adOuWJj1NjJxKh4MIKBmz7+2V2LuiIED
	HiZSnA9YRLcDpyTo0da9hPHUvEKJ7ZvoSwvwAu2H0YlZ05O89bujMhvDRg9/7bqIjgliQJLM2Bq
	2zOlSneosHlOP
X-Received: by 2002:a05:620a:4014:b0:936:8840:427f with SMTP id af79cd13be357-937395429e3mr52933885a.4.1787255338614;
        Thu, 20 Aug 2026 12:48:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4014:b0:936:8840:427f with SMTP id af79cd13be357-937395429e3mr52930085a.4.1787255338126;
        Thu, 20 Aug 2026 12:48:58 -0700 (PDT)
Received: from shalem ([2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2459198ec5sm113433266b.34.2026.08.20.12.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 12:48:56 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] firmware: arm_scmi: Pre-register protocol, name tupples for standard protocols
Date: Thu, 20 Aug 2026 21:48:49 +0200
Message-ID: <20260820194850.459739-3-johannes.goede@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 2e8Aig1aIEi9nktsFW48aQTic_c3_f0C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE0OSBTYWx0ZWRfX1JjGypW9tKp1
 OxPd5IJEJbejsN5QDIN7p+XhiEQH54oh2C8vbwF8NsetfcKHZCJ2MDB9WWchbDyxcgS4vtvDMU3
 s8B3ovIp+h8/+9ZfPEWoXCEbLTfCQIAt3cAgd0S86TKCIfOATOR/OXBkqaDy9EEX5g6yTXtrj2x
 /gIyNEDcAWzUkSih5zqo7X+hCndEtJEtuZWkXBZFSx8Jg25bIavQbMU1OCahJkIK44egFBkwcby
 +TWLV0ZiS0O8G+7rJJHth1A8bx4NV0kXeP9an85OPqNNoHza3eYTZvXrgNby7hSjDooobmDqA4N
 z0Tajj0MI0Uez14W1FKfaKR7eiVttxsrEfrr1SY4BXMIx9MfwhuGOjJKJKvnl80duh/7BXB8POt
 UZl9NOhU75InKWkLkvxdzVeyI2PUUq5193gCLPQmYYMfFjzbzW6zGMpIa1MBcvgH8vSq0T1t3TF
 0Y2ffjNk1cQe8o2I0Lg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE0OSBTYWx0ZWRfX8t7hRFWnnLzk
 ECnndu1w9Cx92FVoJMJxt57l2EA5XTnIhs2vFlDKBYHAPcQWMJ9YAaNYfL5VoFsZzP6vhKXbXnr
 DVFzojSlV6pqVd4iZS8V5aZ4/6c6jJM=
X-Authority-Analysis: v=2.4 cv=VfPH+lp9 c=1 sm=1 tr=0 ts=6a875a2b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=bC-a23v3AAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8
 a=VscC1fOeZKh3OTZq1J8A:9 a=iYH6xdkBrDN1Jqds4HTS:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 2e8Aig1aIEi9nktsFW48aQTic_c3_f0C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200149

From: Cristian Marussi <cristian.marussi@arm.com>

Driver module auto-loading requires the devices to already be created for
udev to get the necessary uevents based on which udev auto-loads modules.
But SCMI devices are only created after their { protocol, name } tupples
have been registered which is done from scmi_driver_register().

This creates a circular dependency where device creation is waiting for
the driver to register and loading the module with the driver is waiting
for the device to be created.

Pre-register the tupples for standard protocols to break this circular
dependency.

Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v3:
- Drop adding of a bus uevent function this is already done
- Update comments and commit message with a better explanation of why
- Link to v1/RFC: https://patch.msgid.link/20250203100154.140877-2-cristian.marussi@arm.com
---
 drivers/firmware/arm_scmi/bus.c | 47 ++++++++++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index d12d5de15a1a..111727904a89 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -77,12 +77,13 @@ static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
 	if (phead) {
 		head = phead;
 		list_for_each_entry(rdev, head, node) {
+			/* pr_debug() because dups are expected for std protocols */
 			if (!strcmp(rdev->id_table->name, id_table->name)) {
-				pr_err("Ignoring duplicate request [%d] %s\n",
-				       rdev->id_table->protocol_id,
-				       rdev->id_table->name);
-				ret = -EINVAL;
-				goto out;
+				pr_debug("Device already requested [%d] %s\n",
+					 rdev->id_table->protocol_id,
+					 rdev->id_table->name);
+				mutex_unlock(&scmi_requested_devices_mtx);
+				return 0;
 			}
 		}
 	}
@@ -579,17 +580,49 @@ static void scmi_devices_unregister(void)
 	bus_for_each_dev(&scmi_bus_type, NULL, NULL, __scmi_devices_unregister);
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
 static int __init scmi_bus_init(void)
 {
 	int retval;
 
 	retval = bus_register(&scmi_bus_type);
-	if (retval)
+	if (retval) {
 		pr_err("SCMI protocol bus register failed (%d)\n", retval);
+		return retval;
+	}
+
+	/*
+	 * Driver module auto-loading requires the devices to already be created
+	 * for udev to get the necessary uevents. But the devices are only
+	 * created after their { protocol, name } tupples have been registered
+	 * which is done from scmi_driver_register(). Pre-register the tupples
+	 * for known (in tree) drivers to break this circular dependency.
+	 */
+	retval = scmi_protocol_table_register(scmi_std_id_table);
+	if (retval) {
+		bus_unregister(&scmi_bus_type);
+		return retval;
+	}
 
 	pr_info("SCMI protocol bus registered\n");
 
-	return retval;
+	return 0;
 }
 subsys_initcall(scmi_bus_init);
 
-- 
2.55.0

