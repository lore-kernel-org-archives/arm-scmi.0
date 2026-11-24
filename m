Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549925;
	b=UqLSQZHsc4s0PLRz8oqRhsol56pVuEa6S5H3/lmcyd9frWviHLW1c7Ia56zcux7yUP/f
	 RGBx3MdDJPX9nr9WDodBV3ZdpzTD1D6BLre4HkPDdhLK0ClNBGW3Z10hZOeJHM9mHvVWo
	 vw32YJsii/HpXwLcA4wlYcmNssM10j//y8Vt3XKr9et88mAZ1WwNRpsdWHyS+eBUmVjR2
	 yU4dX2z7kOvuocTRA9tNE+wf1aFQZ4C6Wom483GaQyNF+sF4X+GUs/WAdRVYqQNVczoML
	 ZgL40nGJKxKhksM9ltMav6VSgCiHDoJEprnzxmQ/G2dHvD3bFPzNx2uRDq1I3B7rK+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549925;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ybksNdKGZwcUybmuPou+wEJRhGtFCZ9Lfc93sClRt68=;
	b=HshVEPlbIgUV3xlJVkIxr4v12F1X9+YC3BRTQy1yryj8VddwTnAr8R4KABVLcGxj2kvG
	 x6MlVJG0+7Uj3l28LidZkiBIbUKzDRRSQ9ZBBsnQ/TxiExyydA+OLQ7riMt9TgW3ulN27
	 ZvQSokmt9cQ9b+q1EnQHwlJKpQx4loO6XXzpYgY2xZfGrnH0csrNu92KOhORo2o0m7GNH
	 LnVnV6Vnu9fQHcEEjzQOOOlpd3ezHW1Niq+3+D9SCtI5icfpAAQyZCAtSipo3xF2wq0R1
	 UpweVS5m1dkzpO+1iI9XUVMi429sbl60TKts1NPpGOwSu8j4b4TUQ4YkLkLn4D+tXnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=VBgSAggH;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48526606A680;
	Tue, 24 Nov 2026 19:52:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48526606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=VBgSAggH
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEC76339;
	Tue, 24 Nov 2026 11:52:01 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A99E43F763;
	Tue, 24 Nov 2026 11:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795549924; bh=XLIQNLKLqBN+XK89CZJOMck4z1OnlpSdMf9XcQtFphE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VBgSAggHfPI2Dqmn1tjf2m3OWUFy1/nb2gtx3pvHPhanxFp76cMcjbPiM8zLRAZ/I
	 YSgUHg2DczYD2ilMmO5Ro+ODXVaf3hUnOtoKxsJLr4j0qi6iqvcB3yfZ215ZyZ05tx
	 CWI/t50X0XN7XEWjVUtaJ4Dm031NDIBOQ7WRgaQ4=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	d-gole@ti.com,
	jonathan.cameron@oss.qualcomm.com,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	david@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v17 30/34] firmware: arm_scmi: Enable autoloading for System Telemetry driver
Date: Tue, 24 Nov 2026 19:48:36 +0000
Message-ID: <20261124194841.1147072-31-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124194841.1147072-1-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the SCMI System Telemetry driver and related protocols to the list of
standard protocols whosw devices are created automatically, so enabling
module autoloading.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/bus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 25197197db8e..32002fd9d843 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -546,6 +546,7 @@ static const struct scmi_device_id scmi_std_id_table[] = {
 	{ SCMI_PROTOCOL_POWERCAP, "powercap" },
 	{ SCMI_PROTOCOL_PINCTRL, "pinctrl" },
 	{ SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },
+	{ SCMI_PROTOCOL_TELEMETRY, "telemetry" },
 	{ },
 };
 
-- 
2.54.0

