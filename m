Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3668388392
	for <arm-scmi@vger.kernel.org>; Wed,  2 Sep 2026 18:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788372540; cv=none; b=D0r2cZaNEmphVWFJhX0dry4CgCxtBtqKRxQYYiNvKVqFXw6MR3mlp83umFtEI7GNxQi5BVSxop5EZHxEbfHh0KqVNIhrxigVcYRXrnKOiCcvUD7LSYkmMU9jsJhN2rJxr7c6Zx/vYSi0mAQ2zdlD7XK04B/hF8KZ6CxCtxFiRLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788372540; c=relaxed/simple;
	bh=vs/zkZkBqDGWIJOv/e2m5e2aVz+VFWJKG1MOOWJTS0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jhwai5tFRgdSFbbsvSqm4f55P1t4wHI5hIoPNHX+Z642wKn0/nz8tdZWmlS6s+v3utrqoIUtobA+Cf2tZknFIAjuigMG0mzgfkvz9yJifb0Du7/dflsOyk/X4I6K9JCkLgvfxhirpWijzxrsPOYHkFtDt6+cqEvmDsMslVyUUxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DxS6P7SL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Md8bIJIy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DxS6P7SL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Md8bIJIy"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HsPiL2485892
	for <arm-scmi@vger.kernel.org>; Wed, 2 Sep 2026 18:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bbORKfBAEcY
	HO2qsqE2iCDgdtjeThGNyWZmtJvMyYf4=; b=DxS6P7SLUnmuzeNOqzF+4g/zJxu
	Ce2GUi0lzlVVbLVCYigkJKHMuQZCRp411lPCy3f8HAp4JJ7J74PFJfi5NjXp9peI
	Ryus9hn6rdlRnFw+PdD7Rj7AhOFxeXKLxxpExLLzmdjzoWjz9XHQ66UNquuTn6H/
	1TrFa94LmcwyCA6MDaT9uHssmcMH1IUYYOQk4zU8ZLLmAOe/PpUS8l1UciAcNcer
	I0nMGjUHGfkbk4hxBgKikY2O2uXoRezFF1Iyxpd/3iAEnFAiSICxf0rlswxNkquT
	84rUO5n6Awh4naqesajSsDeG0EpfCHZYzIDCqG1IaIevEX8GGxNNnb/9VUw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjh98hs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 02 Sep 2026 18:08:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939665a1ae6so206737685a.0
        for <arm-scmi@vger.kernel.org>; Wed, 02 Sep 2026 11:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788372537; x=1788977337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bbORKfBAEcYHO2qsqE2iCDgdtjeThGNyWZmtJvMyYf4=;
        b=Md8bIJIyTQuh7aNdFiIvfKXCnZrLtop7r0kkLMY23/EtXlER/8EYMSb+8amEm4IYhA
         kW5AhXx5LH7yKdLbkbjQZrn7r7z1QjS8szMthDFRJ1Z/MJxRVmLeDjEHM47GFigWQ/o6
         AewZjc+4Okv8KD5u7XMtwxJj31rxgO0o/L15GqJfLSDdfPWtuQ1BNH9vmOZMYgNIeSqg
         0RhUhbD53bAQhY0IBJ/YDxts+5x9gduV37iSQabBBCKVPvnqv4WSCydMnf6i/w98O9md
         a7ljYGpVKeruo0ABK4pT5MqeBFqZcENGpTvpBMuRANXw05aKLysJDYAd5hiNLT4gmVjI
         Duww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788372537; x=1788977337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bbORKfBAEcYHO2qsqE2iCDgdtjeThGNyWZmtJvMyYf4=;
        b=SSc+Bw7M/6YxCTqseGDDz+6YQgejTmREAvhHS2t6DKVVn+ZUqLiORbBSiQ/rZvkB2A
         MtJSioWF4JbXw9ZyT+HY4nPdxyMnUVw+5oLQVb5CQ8e3+nl89rQwm2FVq8D4Mcv4iNeQ
         OQt6gIZ8V33QOdl/tjEQiTGX6NGN7AyJYpuQq5qdXXrvUqOnEhOvZ5XuORwQEebLLjQM
         xpJz01K152ZwSS0hyD9xOKhckIyVMqqBFx2q5YHevpiuFh6rArEa1Vk8GytUsLkLE2OU
         A2bTalDzt31l2UsjI++F7/3BSUZtMmaPBHYx+MJ3uv60MOjaoL9Hcp6gNEWPif55bbm1
         g2AQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKUrgjHBauN4EmPLnXczwtlzWeT2NKuNE8nebyf47HkY6c/QXPDydAEGznLC+EIL555m5GjWe15w==@vger.kernel.org
X-Gm-Message-State: AFuF++kVUBYeRwnK4W/eJ7L35T2NB24XjmBjUyJUb+MsaX2BmKfS5i3I
	V/9T52tGOIeNHoXkpOJeH5CMChV+aCYiVeoafDfXQm34Qs03/aaTfRoLKhWU0ueBpuKEQDYt0le
	SDs6SSEUI9y8cclSlQ5c2aGIILQzv+Jpu347iTzDg2t8faV1Ky+a7piW2Oj8emg==
X-Gm-Gg: AYBFou1CQ9u4bSU4QPWEmv6xUMN/mPJUhVGODxgZkZfxe6W6Kk3oEqtXIMmWJ/3wqkh
	1JjnNhGyW3fsNpYTnh38AfB9lMLiU67GWROl7xLj64k0wEnLaqMX/CPnfsT2x372ONunLyw/pgj
	1j04U9R+Ml5kVgBk9YFeWRHTt/53+6vtkkVjUqeuJj+oH80T8isRGRrk+4w+9VteD2t8ZVHTodQ
	zUL6n2bES70ImLPTPNvAaTcgk1LnBUYtzCyMoYk1ms/tX6iAO46XWpqDzDoaA3mJO8wACB+ZF1C
	PquzQEva2irtdkfT+i8AqZvaaxMJs6otXaPykQ4o21xnWEMNwjxhwqFknlNHLV9G0aOZpaVcNbm
	E8fgrpkF337+K4xenl8ki205SRlJrXz+UwVX7wHIp/Yu/5mRK4qnsRSOXemrcg3ydipM/COuxJS
	bKJxlN7qz5elZVVpA=
X-Received: by 2002:a05:620a:28c7:b0:932:ddff:1241 with SMTP id af79cd13be357-93960efc6d7mr820783885a.26.1788372536603;
        Wed, 02 Sep 2026 11:08:56 -0700 (PDT)
X-Received: by 2002:a05:620a:28c7:b0:932:ddff:1241 with SMTP id af79cd13be357-93960efc6d7mr820774185a.26.1788372535857;
        Wed, 02 Sep 2026 11:08:55 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f895d68sm1444041a12.4.2026.09.02.11.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 11:08:54 -0700 (PDT)
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
Subject: [PATCH v5 3/3] firmware: arm_scmi: Always create devices for standard protocols
Date: Wed,  2 Sep 2026 20:08:44 +0200
Message-ID: <20260902180844.41230-4-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902180844.41230-1-johannes.goede@oss.qualcomm.com>
References: <20260902180844.41230-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Sip0FulR5NAsHGNV-lXc-ddn6j8f8Wkb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE2MCBTYWx0ZWRfXyopWeXAALgxo
 qqnqZ0P4aIVIPmN/CH7wpWuwp7puZDyXwMNJpqrQCGz3xcKsoo4xb2b/gk3CxL45yCBxrJeUMDS
 iX44ZiDhgQ0YNDsA6hy9Thkvo1aJY5VT4xp1I4MO9135F0rYZswV6DnoS2sJWKYf06TbG8Qmz9D
 HGO7mlG6VFCX1UaavS7gkPeTZ9rklTFL11TKJHgkAIm8x0zPjHXtKdmorzgmZ0wRzJwCU9kaQup
 g6q/iGoIR08d+AfIPnFLVlQAvO2UkFqKm1n4gK84Isl5DfSupfyRsAo8BxQw0dQHRXX+dGUMG7K
 aEQ3y1N2XBuGbbQLe2VvMhcSjgUnXF7is53wC8gpUtC8S8ZzKS5XlNrBfQdCVnVLCGhAfxqdDcu
 nBq21wHeoZpW35D1abX8l40meh9iFPfzNZl7zykVGiFsygDheXfHWFyJYZDSFbpv3oPEiQfBrqu
 1oSkmkezKBzRFscDDLQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE2MCBTYWx0ZWRfX6K8O8RIlXR0Q
 s3ilTPUvNuaulLuPOpHFylNa6B4u/Jvr+5G/WW69VnzhcMxlyFpinECpW0bcS3jOVC9koSVgp67
 wXNDhnMJKacwjpKyQa2viBXcigxY1O8=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a986639 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=9VS019lR99HtUmLVNGAA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Sip0FulR5NAsHGNV-lXc-ddn6j8f8Wkb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020160

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
Changes in v5:
- This is a new patch in v5 replacing "Pre-register protocol, name tupples
  for standard protocol". Pre-registering requires
  scmi_protocol_device_request() to allow duplicate device-ids, but then if
  the first driver of two with duplicate devce-ids gets unloaded device
  creation for the second driver will fail. Allowing duplicates causes all
  kinds of problems, so this new approach avoids this.
---
 drivers/firmware/arm_scmi/bus.c | 48 +++++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 6f667e4ffeed..10d15da76f19 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -505,6 +505,34 @@ _scmi_device_create(struct device_node *np, struct device *parent,
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
@@ -534,11 +562,25 @@ struct scmi_device *scmi_device_create(struct device_node *np,
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
@@ -549,7 +591,9 @@ struct scmi_device *scmi_device_create(struct device_node *np,
 
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

