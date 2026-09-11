Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC08837C916
	for <arm-scmi@vger.kernel.org>; Fri, 11 Sep 2026 15:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140233; cv=none; b=KUW3hMwe2KHcx9+7vssc3s7ZPomPXDNjALUUiyZm/psh35WaNwyfaN4adZaVxHFtnHsOTrNWqiNx3hznGVLiqxbiKpq6GJU3bXHoA2kTomAkSK6yv1OPvOGVmYVc3zU0sR/X8vjxG7uBVymqKsBflpCQ3RdL3Yz0LqqptTdAZKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140233; c=relaxed/simple;
	bh=IuAWYhrq8iC+CikdHI/e1ECe/txOrhjj6EPDSmygtY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hRmosw2xnEEKlZo6bykst1vSB+7hPUzvFgoTfDy0QqJDFoF08YpoFGAowdNP/m7k5Nf6CIKT++22OR0vXyBRXNKU/SuZFbbQlttEN7Lis9QdwRvV1U8XHLmHRXfkwbmLgYMysSK8iSIccypX9hrFl9VHFwS1AElwQtDvaIbpy0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LhMHT+xB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ebtl2uT9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LhMHT+xB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ebtl2uT9"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmGGQ3780702
	for <arm-scmi@vger.kernel.org>; Fri, 11 Sep 2026 15:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mZj8U1PD25c
	E+8ESg/8vDL8EK7ciOY34ML1dGtbAf+A=; b=LhMHT+xBhFwTdV7bkSdWxz4EoAC
	z7U/u39CJNv7+23UyJYMvjDYMEGHhjYtseSJJci9B0nWGAImnllxhTjT0EANdoKP
	O0D4JBPXRbsyNibsjRLB1PDsU7yNh/QaRMmRbqfRkzOZZ1O1flN8oloWTgobel/R
	IZXEaxIvwmnbmwUbO2FFAb44stsRh+9EwQdAiFTWW4r1lIJOfnYoBLXOcc5Jfz6t
	acExdXWI4GV1osNWm9kSyXrS9jbH72IQhj7vmOCHuTfn55h8fGXsH0rp8Fyf6AfX
	9kEIFFa5/DRPc4fMAv7p4LQVQQ9KeWYmcZyeujF6e8i+L2GmhgV/24R4f1Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmcgfj5rv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Fri, 11 Sep 2026 15:23:49 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-790376c9f8cso212194137.1
        for <arm-scmi@vger.kernel.org>; Fri, 11 Sep 2026 08:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789140229; x=1789745029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mZj8U1PD25cE+8ESg/8vDL8EK7ciOY34ML1dGtbAf+A=;
        b=ebtl2uT9i7AnRFi/Xf5/Kg9p+ykM0SpbjfpGjK1TISQhSX8wqlXj2gWxo6o/T/MYZW
         6i5n6iTYrbrzChUb1UM7Q0P4aS7l8SAH38gM+CoJIx3dltxqBQNbpZKTD0vgoSwk9Pqa
         PXLgsAShMJ10vajMY7hyYUT7KEoLy7yIWPrf7C12c2m1/Vmd99pnrdi2VxpOwrtcWYKz
         8wFGz0/IooQDUSh5tXc9G6m6jRj3W2vMkIrB+yBCVNHwGVdwtsaf3BgzxWP2PpdMuz7q
         mdOxnVVFHReCoZfQJXcQpYiwjEuVu2tsuwTsmWztJI2meSsa5Q3wcfrvGkMH8hEABa+S
         3tiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789140229; x=1789745029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mZj8U1PD25cE+8ESg/8vDL8EK7ciOY34ML1dGtbAf+A=;
        b=IjIfC+wDXkEQY3T/nVlKVSPcmloS2Tg8pYejRc/4RxeqU5+E+1x3+m6GxAdMklDAD4
         FSLkaIMmCCvVLAbrnKEoDgeE12gLIP+V9K4YXHeTxtMunPGMIStWOT8etKoeF5QxMF41
         cUdvEn2QmeAW+vUXpH/WIlP5bJmdnGyHqnvFH3l7TtaxrmpgM9IWJFXTu4/GMUETc8Ve
         EsmTPzI7YWATWEVt956tpOsex9JCPSKMj9XTnZyD3VDdDDqodr3WVcUKMZ3CH3A9GeT6
         XpQjp8G4Kr9pWDL97zLsPUfab17rD+C8P5+gY5kN0a3aTGwtCAvtPAQRXqJ/uF/XddFJ
         4Aig==
X-Forwarded-Encrypted: i=1; AKwUvBzJiXbFQrU3QFEc+fRYCruMQGA5Pw0n5W2Oc5HM6oiywIV3pCR390UXc2BIBQ+iSUVbg+08Ftt6Wg==@vger.kernel.org
X-Gm-Message-State: AFuF++lB1ElMgDhaTe8sephN+06HAGtbLaKYlMZ9iNCgXJTNJ9yuWpHA
	XnhPG5iavroBUXmlM9TgwiOEHm6M/evrNxlRmDmCkQlD9NfYPKxCYuL3wM65gGC7roVlDQV9RQI
	Ret8NUBgN/fMlJbBlqVMka9GbdJHHlklT4nxgHJS2474wW3rnMn9jnLMu0Ehw1w==
X-Gm-Gg: AYBFou1+D9zWjeUfaQ7WaLxVbMfilVSuPye3IFDSZX5QoyOPOBDufqKmNgSfdG1Xbuc
	gXVBnroESDs55fV8TJOyRxmcgI7IjFn7QVNWnENzoNPE5dzb8fnDbfwFMPXbTKYenBHN5aJGK70
	zyFWl0fVi53ACnzrUdapN5gFI7NBr4hVWRgdyzTXR5ndJ9/sziXW5+vs872pX1X9kU2PBCxzDuh
	2IRmz6NWLzepfBNVEQrf0ggWDlO4X2lWHBFMtl2IvNl1iIX1zSXN1sfxMCqSnaZCXCJYSCPQLq4
	ByA1xYqfjI18mmfF6fkPcR8CfSvRRPnOJCCQIpHDhFi0nsGOUr7C1t6i7j4JItasM7qwFdZgBcx
	y4zxyKFVOifhSHSrBXU5dzKn2q3F7x/CkDNRI6tBU0RDmi7SuV3zd9Ie8s9rPEB823Xc3yVc9lh
	Jdvy5DengzAyzS1l3TwcYJ/p/7OFbJCDDdTykv
X-Received: by 2002:a05:6102:c8d:b0:793:980a:d1ff with SMTP id ada2fe7eead31-7939829b4d3mr3029887137.3.1789140228749;
        Fri, 11 Sep 2026 08:23:48 -0700 (PDT)
X-Received: by 2002:a05:6102:c8d:b0:793:980a:d1ff with SMTP id ada2fe7eead31-7939829b4d3mr3029791137.3.1789140228322;
        Fri, 11 Sep 2026 08:23:48 -0700 (PDT)
Received: from t14s.space.revspace.nl (2001-1c00-2a07-3a01-8e96-3679-0b9c-de47.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:8e96:3679:b9c:de47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296614323csm94042566b.59.2026.09.11.08.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:23:44 -0700 (PDT)
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
Subject: [PATCH v6 4/4] firmware: arm_scmi: Always create devices for standard protocols
Date: Fri, 11 Sep 2026 17:23:29 +0200
Message-ID: <20260911152329.5822-5-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
References: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfXxBjvzVsIDIRB
 BxeDzpYT+jUWsV1txwmW89XckuulCufPUctROQG5uWsUNg+cLS53FEp5xy7hBa2xK/Nul0c7LuZ
 81N6+y+FKWy5Icbgohz9ei9lyo6LnjZ7+N+fnWXvAuDNukJ7LBx/alKMcdl55rlFPBfNMqgRoa3
 0ND3upXy26it696pOgf+mrszN1yRaRrPkaCHyqmpWLAEJse3TKsd9KZDBtsQkxuaBrdW8z6PoX5
 pf4VtV/pOwKkuA/sqrueNHhNqPEdLxe2OlJTWPHHx77myi1i7sZZoSC/Z1ldMYEgdpsJcr2Ecrd
 er/TniwdqgNLgpjka1w8TJ+hreKAZROJeqoeyM5JUnCF2E7zoXaFVzJ4UVZZ2gIw70tzMEGz7oj
 rQfjSyQx2XwoUoK/qHi6N8WqA/RUsqzj8syqjR7xl9YfEnYMbTGDsWy3kuYBmfP+aWgMbnIWPnL
 GignDFIQrP+B4QCg6kA==
X-Proofpoint-GUID: NnCUxN4sLbITQkkzqj05gHwX84tPb22V
X-Proofpoint-ORIG-GUID: NnCUxN4sLbITQkkzqj05gHwX84tPb22V
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfXypN1rsTN0/ws
 cgEVWTu1YxYKn68dTuMDXXaPGPlTFpkYNREBcfNsSwCk+V+NefOWFwj9CGgi1BEL9hoR81b/iIn
 fOWHd76evvANuo1Esd8/BaUEoiGRdLU=
X-Authority-Analysis: v=2.4 cv=ULtIjyfy c=1 sm=1 tr=0 ts=6aa41d05 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=l971TreVHldC-rsvbM8A:9
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110214

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
Changes in v6:
- Replace the if (!phead) return NULL; early exit with return scmi_dev;
  Since a standard protocol device may have been created at this point.

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
index 651d4ba06574..ea59dcd95b6a 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -511,6 +511,34 @@ _scmi_device_create(struct device_node *np, struct device *parent,
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
@@ -540,22 +568,38 @@ struct scmi_device *scmi_device_create(struct device_node *np,
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

