Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549931;
	b=0P2wZ5xyeC3wyvSblbOgC4ryFuCezc+rJde2t1HNoDf5SR88Wc176kAiBIAlgW1PSK8P
	 ksuXS9qT3TgJUkPHOZagSwiQLlIG82sWmChBjAjokl5TRop2kti8cbXwq+vQ08DZ/wESa
	 q6dAmcEnDTPNXJd9Fo5hNRyK8JUPnYCsSPWo3b3MxpN29QeVQLd4QQcfEK+N00wzWo9xd
	 SLg2RSN/uSywuYPMa57IpEpoB8XhFdtLnQDiLbt+fTojar7lHj4w4kg2CMxoUPTGGb4iP
	 6y0DpPG7ELSb6r20zEOaDqQsrKntHTQPu/gpYG2K9ZukSLd//TF88gSHwND3JWCDt2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549931;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bqq8tdBHE7PY5lGg3anCtrKLQXzps/O+HDy/opBt6hY=;
	b=KFCG71Os6qkSP6cosm8AD90Jhxn+Wo4rnVf0axGKf48dNXvFpeSiWaGeqXAhVrQP05+o
	 dnFXTt9egRO/bX1De36D38Kppl0K2+CIj3qpXe28SEHmvm2N4RsGxPL+Bw2fzpnyXOANF
	 dWuX7iRdP5/fh1dMWM16gudrz8yBP4OZGksg+dPrnkKWfEE9F3guTOB2togZWeh0bzPMc
	 HV969SUoniPZY/xN+VpnwoFiI77K3PE1c2rNasGYILAAA46FELsjN7kWDyzRdlniF41JD
	 IRlMbDpdxtPd9TXuhSBNCXT5mEDjV9IG3ICZcqgrMGBXZav9i5yZLQmOs8o968Aj5pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=m33JFPdv;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41696606A337;
	Tue, 24 Nov 2026 19:52:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41696606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=m33JFPdv
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DA80497;
	Tue, 24 Nov 2026 11:52:06 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F151C3F763;
	Tue, 24 Nov 2026 11:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795549929; bh=SV9pZMl6M/fxVelvGmHOdqTt7nzTXsoHruNVd0Kxcmo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m33JFPdvrDsvzXYG+p8eSrgvHS6NlsoUtJHUw4+YCSR7fXBMaFInj/F0LDoHiZKIM
	 KZt7F3eksU8P1q07ja9i2r+yvET8UOdenmozNpRofjwXqzr0vVR0G7dzgyvHaz/qpZ
	 LcOC7Rdb4HaiAapnrB9ltxxGoq/NsKnFnpxKTigo=
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
	Cristian Marussi <cristian.marussi@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v17 31/34] docs: ioctl-number: Add SCMI Ioctls
Date: Tue, 24 Nov 2026 19:48:37 +0000
Message-ID: <20261124194841.1147072-32-cristian.marussi@arm.com>
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

Add SCMI Subsystem IOCTLs numbers

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 Documentation/userspace-api/ioctl/ioctl-number.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index dbe462040999..53e970fc750e 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -403,6 +403,7 @@ Code  Seq#    Include File                                             Comments
 0xEC  00-01  linux/platform_data/cros_ec_chardev.h                     ChromeOS EC driver
 0xEE  00-09  uapi/linux/pfrut.h                                        Platform Firmware Runtime Update and Telemetry
 0xEF  00-0F  uapi/linux/ntfs.h                                         NTFS
+0xF1  00-FF  uapi/linux/scmi.h					       ARM SCMI Subsystem
 0xF3  00-3F  drivers/usb/misc/sisusbvga/sisusb.h                       sisfb (in development)
                                                                        <mailto:thomas@winischhofer.net>
 0xF6  all                                                              LTTng Linux Trace Toolkit Next Generation
-- 
2.54.0

