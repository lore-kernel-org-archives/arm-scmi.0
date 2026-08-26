Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7213BFAED
	for <arm-scmi@vger.kernel.org>; Wed, 26 Aug 2026 10:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740068; cv=none; b=BoksQRyOgu8STZMuFfgUoendd2d2d0cQ3O7h2mX/thBhrEG2buYOodTrg159sSKmM1+AKdwnV3AEq2ij8IjecwT5dAfAj+WwFwbChiY4ABy36WKjm3sRgAgF5NJHYpk2Fwk2eAvjg+Uxtj8rqFg9znmgGHV+DaiypsrVz507NQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740068; c=relaxed/simple;
	bh=4WRilBWhHzZLU8uvO/z39X42z49BUIa3+WWApYbxJ24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oTj4eCDq+CXjPUswL1/pUt2qZgPQxh7MCvpd+U2+uui/Egp8n9nMGATCOiXdupxE11eSHkRTmZlI2WlvBQI0rdV30FCqfrpuzx/ZPtlRHqwVRpaN7M877h0QcFIUh3k3tWfurYWs2+lhpeZtBiKOpo9vo+gR1wYlzGbSt6Muomo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f3ToAtLn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hTOhHXwO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f3ToAtLn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hTOhHXwO"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAHB2v518818
	for <arm-scmi@vger.kernel.org>; Wed, 26 Aug 2026 10:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=c5VY/KOB4mi
	ZQvykR/E8D9DhRmzVzOzBrO3/MiSseIo=; b=f3ToAtLnnYAf6zOg5679hxdEAY8
	VinJg18H1mIPlvYvTXCu7/GToxUrtiMSrz0i4hAGa6PGY9m8KC5p1dbA0/DjesFL
	dOCuxSXs+BwIxiv6K8fQJoKEdVI6f7mSCow6kKgymCiMH8ypSKsC/J2p5Ubw9f5k
	YooO9OMs4Yx7uMQmvG4yZcOXYy5Krbjq1qBAdQvdzvx/EpaLWWBLYtJ3zWiU90qA
	u0zX7s+7c6bK4AnHveNHlGMfy+2OO9Cia4QyjUVq5ZOnJNa5t6i2TiTf2TG4bg/t
	J0bJKZvwrSPXWN2foz57MQ5CRpf7vaP41N/vW+g+OdvJeN9kJsxVDTvzTzg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9x2n02xf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 26 Aug 2026 10:27:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfe3fa93bso4754071cf.2
        for <arm-scmi@vger.kernel.org>; Wed, 26 Aug 2026 03:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787740060; x=1788344860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c5VY/KOB4miZQvykR/E8D9DhRmzVzOzBrO3/MiSseIo=;
        b=hTOhHXwOF1hi8+izp9pIArNvDhV9QsotS0KjUZUb5pEDirGopaPVt/YgfZWvuNgjHf
         wB5ftNWkk/i1g9I84nhSOI/9+LrYvuzI8SIT3UQxLSqsFydgtGHsykzxWJ9N8m+mnpU7
         SEZGC/5A7XF+WbQ3P7DJW9H2xzRd6+6rf1tRkjbJjbeCT45UjCrPYx0iX3MHCznj6UIJ
         KVJUVf6Qq0oNOPmg7V0c2H0l15ti7HL4JOsZPvGxWC3ttnyXJX393jopR5L+RYfHBdlV
         bWvzs3KTGdsZa9TNdDM7Li48Q3FkoW1Gdx/ljYxPxaf1olNWGKqn2Vs07g8BWRnj2pPJ
         qqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787740060; x=1788344860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c5VY/KOB4miZQvykR/E8D9DhRmzVzOzBrO3/MiSseIo=;
        b=rJfhA7/5RxrZ2E/IaqzIjL4E5Yl+VqXdPLeqfuAvNtIG96RuxXXSTZzrXWpCMxqd8I
         zIzQ4ZSTeom2mx5qGKBkbauUSVrrFMA0T7XlVpoGGlGGk5glg51R7dYb7JXeVtLg2VSP
         C09zjId+qYcKbTgXg2OBydP9dtpRKI21dJI1LBwa0bRbYt/s1d93LzlY0VlRdiHSrtuG
         vAVvZbExZtmKxo2l5i1oQY8ROlZj7EgvOGhq+YkV2oZBXVVLlgFU6dyIJUjDIKJJ4vuh
         RT8Fm3lNVnvrAvxqjsgi/073G9fw4pgrQD0Ep+z+UQR5GZBPszEFnE4jvqKqQOFy7QGQ
         vw3A==
X-Forwarded-Encrypted: i=1; AHgh+RoCDvMLr7uXtfPUzM0kabMRlHUDFBw7x7k+96T+2kN5UX/9T/W6wgYEkb+Rl7e3mdc09qqDZqnZKQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nzOnNyGSreS5V0v6SF/61AQbHWVlnS7WK6sq7etuFQhrkVD0A+
	emd+jeFIItWe8s0WibPME6k1yDpHCfkjkCJQnkEyvInNP+KV7yjb1IY8y/D1R/WK74nW+2JHwHT
	knGu0GXLoBgP8nc30XEG7KaK+xE1Izqlkr9kOG4H7HOm5cWOLeAhHPBL+FPwF3g==
X-Gm-Gg: AR+sD11R8HoKn0hXrkNfjv6d34K55vUAfUQiUUx0gFh1sZ+rNW7nhLRUgtXIHf9HhQ0
	mzPdSdUII7iCGtuDQvwmqXJyJvb21sumc+InaIYOYHoW4CLigcOjfLGZCseSDwPyofScUakNH5M
	Wb4LJwEtzyHp8hFY46FhyRVox6cgMYmVbPsswjBzgFfcbhQTK5N1fdUXHdlcuDh/5sQmpVuisA/
	XGcVw1fcpsvw/SKPsXejzqEWWTd45OOOL/FnzKwqBeUV0jYfCEhv30xHu7dvNlUzqkR1qcLpnvq
	HlFGSR9K1a8mi2NHfZWdFJkqZkXPOkCktSxi2i0LQCtg0hT7lSK3ho9v0dCFTF9/xWJYTwZxDAP
	GE439Ze6oRRDbEYrp8Yd21DQG7CVrycLyyKHg+ZUl1IxycdNukBFa5UxCq0BpUkftfs0elbvXat
	zIcH3rv2aqwrBdfVA=
X-Received: by 2002:a05:622a:8c1c:b0:52f:4a76:750d with SMTP id d75a77b69052e-52f4a7675d1mr2032181cf.9.1787740059608;
        Wed, 26 Aug 2026 03:27:39 -0700 (PDT)
X-Received: by 2002:a05:622a:8c1c:b0:52f:4a76:750d with SMTP id d75a77b69052e-52f4a7675d1mr2031811cf.9.1787740059146;
        Wed, 26 Aug 2026 03:27:39 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d68d1sm506364966b.11.2026.08.26.03.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:27:38 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] firmware: arm_scmi: Pre-register protocol, name tupples for standard protocols
Date: Wed, 26 Aug 2026 12:27:33 +0200
Message-ID: <20260826102734.31766-3-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826102734.31766-1-johannes.goede@oss.qualcomm.com>
References: <20260826102734.31766-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -4PTkZMuhn1O1sxOX7XhGgzsehQsKSi3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX9XBgv0OvmfQw
 2sn/oXIbP/x8qp07YrI5f2iQ+vK0BiHRmvNaE7wfgR7pE+tu7K+I21LElnwREI2MWKMF4nTu4XB
 cpkQzdqUhrN1Raj6AlO0LeFEdPU47mM=
X-Proofpoint-GUID: -4PTkZMuhn1O1sxOX7XhGgzsehQsKSi3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX9X7kXmAZf1VV
 wjGyPBhTqY8wm5Se0I1hURAglhVhUVTvQsFA/L4ktAY9Br20QDaGqglfT+6tEu/SAQDxzwimXUZ
 qiSl4GcO4xdZcxE28lIqKFv+BQvxnlVXdxJegRQeQGTRS7Csu67hDEYDvyKBvzwsb/FY9H9M5cs
 1FP0ilv5b7t5hVsWngRO39TGza2reoCt7xrpDugpakImgtEpaGP/pmDSpMie9JA9FF54q+XzzuO
 KWkMtsiKXSlmbSSg4Ue+oVQT8PpjkyefwipLqp1Pk6uBNt2fniIQw5hVCL4966RR1JXsHKdzIGC
 mCaAB6X2RdVhaKjDCK6lMEPLJi9kw+4MVlYkEYPB2wXBmKIi5V8O4EGOtmRD834KF2eET8QRecV
 HZjJVt6RBAAuQGEde4W5OwO4e4ljEszRr/AnAJkgxZUuVooA+3g9O6UH87Lrfds9xfhvq1xoe/N
 2vZhH7thLjqTctDUkuQ==
X-Authority-Analysis: v=2.4 cv=PPQ/P/qC c=1 sm=1 tr=0 ts=6a8ebf9c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=bC-a23v3AAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8
 a=VscC1fOeZKh3OTZq1J8A:9 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260087

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

