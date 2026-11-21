Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795304695;
	b=wTppnz3ySVcZ1STc7UBoNAxfd1LjV3ehM+Eug+QunkZLATXeJHkJFBtT8oHwIYe6QU0P
	 W58Job+530AlJRov8Gj3X23ZD5aFr46TP9n4r2KK6lAzjKpadeYxK+gjNfmCICnr6XZzt
	 DNXSXVu7+o64oIxhz5S8RuHoVRVPQbnwY7glATPdU0qhZzs5EADuj4up1PJPBgOONWwj/
	 uxaQi/P1Ek7Ld5Q10kSXJZFpPYE7cnAYqUQrxhQlEPQZ6f0GlOogPzeHou2B+E1L4P5Vl
	 AFSt1zIDhfFxLNmxMOxEjYYvcT/iprfjrdSr2RD33U1136X/1cNAmHu/b84ubtuKFGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795304695;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bqq8tdBHE7PY5lGg3anCtrKLQXzps/O+HDy/opBt6hY=;
	b=ySuGAu2dygUoK46aWHgHITDVV8/8LsmA/yV/nfmAAYZsuvaE08w8SnRQ2eDrPAEWsTFA
	 qQartI/m4MMr4WSYMbxlEvdmjg03ilw6IF+WsG8mBXl7gm7X8AM1GlwcELQi5MktqjzZ3
	 Ph78k7guD0XbEUYN+WA+hEilAmMwQQAHla5f6cYtyXVxRa+MlGDw3ol+HjPbEdXRY52+M
	 Ny+cMcdAfLER3OvVG9Z/ySspXyw9SNHI2916GDTbRxa2yk9Qnn64lt6Ip7Hrauub4dEGI
	 15qw/1+kYCWk8UZIX33h76oFevMYZLC5/9t3O9fCR3WK8k0g+SgxkbxC16V5HURiWZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="KzBHSe/X";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8684B606A682;
	Sat, 21 Nov 2026 23:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8684B606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=KzBHSe/X
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF36D1758;
	Sat, 21 Nov 2026 15:44:50 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D1D5C3F632;
	Sat, 21 Nov 2026 15:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795304693; bh=SV9pZMl6M/fxVelvGmHOdqTt7nzTXsoHruNVd0Kxcmo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KzBHSe/XhNtnIfHPS6w345as4YhfsREt0GbOD1D/xXpv7o2ebdmLAvqr1/qblIO8a
	 5xWbJ57q+vg2M7vjEwXvUtCB++8CFMHC6H5BoyY0D6VQo3fi/vwCov3emWw1ACreRS
	 wnsP1Jwin3KDz0jzko7dwDOnWaeaPQkTLGMR8HPI=
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
Subject: [PATCH v16 28/31] docs: ioctl-number: Add SCMI Ioctls
Date: Sat, 21 Nov 2026 23:40:02 +0000
Message-ID: <20261121234005.1525419-29-cristian.marussi@arm.com>
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

