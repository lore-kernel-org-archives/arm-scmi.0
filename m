Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215797;
	b=d3+L+80R5hnTL5QNA3ciBVFBU88vn3IKhHICaYenncpGEyAj2fz+tZ9Hm0yX0vkgkbKd
	 NlqBgA3FZFAUaCzGN+Ihtmhp542m4I+96/k3iMthl2CXAGN3YsgE1fFXOHgfYePFXW8ef
	 fVbMPQwFf3ObneOg/NV0dY8rz9qiwhOXAW5+oQmjIxtTnDtrFTVLSZjNWcj5Rj1ZMh5kq
	 JJK9QMlimFOFClSIOAtauDmzAdqYVCagyVCp0kK82gN6JJtw6FaIIqrHEEzHpzxBDiiGn
	 GWH3dxGCIvnqBjTbKmZvG5b303W0X+ECsr+HhKFlQPEhZCuvEGvXsQZQKk7W46z3WTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215797;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ybksNdKGZwcUybmuPou+wEJRhGtFCZ9Lfc93sClRt68=;
	b=LH5qp8rSTZ205qr82eYzKQnUnKvy1jyUrbw6/w8weotzHVO0xLWUpnAebgQ34MIxT/A/
	 T9hWJiGGtuSsn45gTQT52VOLtfV7fTYmV6zbdnqQy/LNjN7PWVb5rjEM2JeeQui1qH5b3
	 onQKEcSw2VTyrPZZmOiSS5rRnu8FdCo3fScMx0fSG17bctxhmIETm715OG1iT7cx37BTD
	 nrzCLazn1Hpg/OnVch/rY3maRDKuLRNIKZrsSTXnAVIkyJezz33PgRGSul4k337XBygMd
	 KKcxckcbgbg4dzZdoxyT9o5fOmFI1oj5hSCV2vFyyxSFDlMGZCE6w1xgUXi3COtfW5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Zpl5MBkk;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C002360A5BD2;
	Mon,  9 Nov 2026 09:16:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C002360A5BD2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Zpl5MBkk
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21CA815A1;
	Mon,  9 Nov 2026 01:16:33 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C9873F85F;
	Mon,  9 Nov 2026 01:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794215796; bh=XLIQNLKLqBN+XK89CZJOMck4z1OnlpSdMf9XcQtFphE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zpl5MBkkdUwHlGy2vO236ngwip4+RGSLCsfgNX7kiddzQWkfmTYMxbkmobNvuEbVS
	 LN+191Gbi5/FLsCEM+yTseBwhv/k5hNZT1tkoGaHL9254CV95++B+kv+cCYC4LzRbi
	 XHzf6hxMX5uRLlQ2Ajp6WSQA21sSypFba8vS8uJc=
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
Subject: [PATCH v15 31/35] firmware: arm_scmi: Enable autoloading for System Telemetry driver
Date: Mon,  9 Nov 2026 09:12:17 +0000
Message-ID: <20261109091221.2532706-32-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109091221.2532706-1-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
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

