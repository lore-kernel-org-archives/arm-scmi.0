Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795304691;
	b=Qxf4Si6RIYNGeRIlsVszyPEceUZtLjwtKvkzYoQtIh0nCamROIkntmtTO/0y3NQkod57
	 TLJ3TcmsUMeV1+oHxxdGvlm+iOZOX7FTX77WZz/9kSzDcd67HuUnRjS2qrcbIOL4x4Mrm
	 XTfZX6bFcF1SShGegOC9g/ZjvipPKTI5pLxVmn/bqATkKeNlDVUBg1Kj2ADYR7wE4ZK/Y
	 w4zGrchzpFE8NtlWJm8nNewI0jpcas4IBjs0zKNCfnPwRrQrMOwBTO+dRYjoudtmc1hlX
	 0+LApywUB0RYDBAx/ZatWkJafs3JbQJ57XhaE9pHq/T2NZdypX3CaNoo4uTaR3gObSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795304691;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ybksNdKGZwcUybmuPou+wEJRhGtFCZ9Lfc93sClRt68=;
	b=s0Bah7JN0TAIj5uH31fFyN6ElMod1TDwp0Mb96rfgYHEMd+0dBVtLT25xlW6TxfPSwHA
	 R+A5UdG+j8q7YmqHewM9lNdgOcQd+eqe7bpqFiNQQfjVu0LP70ukJ/QNJAboXwIALIoi/
	 5zRbB+QcjsbPRfDgcL9ilWO3F59D+WuDvmG1XXl7eTnvquPEg+waC9E0R7KLFKZ39Bl98
	 q4CVd/2v00M9DD2Jd1jkpAQZB15NaThl+rpEzJUJZsBwvg57qnur03NcI1F6rmmZ9diKe
	 HuryD5JWocLHSewGBdsEDChY8Wf0DBEYkmHW+947M5vAVIiFzqnWSNHk61Fu/afWmkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Qa8m6wdW;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 410C2606A68B;
	Sat, 21 Nov 2026 23:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 410C2606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Qa8m6wdW
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A016B16F2;
	Sat, 21 Nov 2026 15:44:47 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B5C133F632;
	Sat, 21 Nov 2026 15:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795304690; bh=XLIQNLKLqBN+XK89CZJOMck4z1OnlpSdMf9XcQtFphE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qa8m6wdWbe8jp5e4Nbx42ZUCMtYHu2+k3QJRySv4AuwU5HbKanMM9u5UGnJvFeNEZ
	 2sFGFObLoJM13G+6cOGjZa/S5Bid8LwwjednVKyvohBvzpHKP0xTVJbbU8d1i1o3Aq
	 XPfb7GAju2cjrwL606WjBQWYVZqYjLyZQJp25aPg=
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
Subject: [PATCH v16 27/31] firmware: arm_scmi: Enable autoloading for System Telemetry driver
Date: Sat, 21 Nov 2026 23:40:01 +0000
Message-ID: <20261121234005.1525419-28-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261121234005.1525419-1-cristian.marussi@arm.com>
References: <20261121234005.1525419-1-cristian.marussi@arm.com>
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

