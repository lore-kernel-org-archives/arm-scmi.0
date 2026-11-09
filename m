Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215800;
	b=eNn0C9TUSiq1yZRJ63nl8IC7tnBBGOnyE8hEq6chgaCyN79Usk/Uun2TQC1csmGKbKEg
	 5UHZrrBBCFY5Sti+UC/gGxjvC59FOojr45RirJMrz1FOtrJtWtSmFmVwGSoT0jAiIHicI
	 QR3lP3hVzkqUiGy8I+FkzkztH/8LDcJfNU+4zWg2H8Ewj8ljnRBGMLWKGdDvFmbQ9L5Ns
	 eqPGW99euyAc0u/BVVfv+ZxkO7RSH4iKgyPjaVNxj886hL83NBfT9yXzmd7OKH6SDFZMe
	 l83Vw1L6F1pyhg39/X7jkolmKwUteQP+dEAFfbaTmlkXmkQJw9zwW0EP2zTOOlgos9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215800;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bqq8tdBHE7PY5lGg3anCtrKLQXzps/O+HDy/opBt6hY=;
	b=euN2c+klKr1cjXGvEn1xnv18XIp3kYYcBaTjSsXd3lUE4xcHwNGngd4g/k1D28EHAvzE
	 0t7sgJrbpOY26THPl+xPA80h/hCf1gEgO0IBC1da4DJdI4A1ZKGKQzOaCwFFsRBx4pNm+
	 c5mwuufpW484Ns/iasoqziXQTA/XqNhy7qSfJMRL9npC8tYDHoV1P9KiVaAh7UyjlHpmC
	 9iM51NyKl7ZhysqPCnyduzEFKQqB2k47En30C7/fW6wgbXnUrPAJ0rrfrAPKyNKZpdGrM
	 vC6TrYnuwLkNh16BzpTF6yPvFWs2cexMWxwXm0j26aEJdBiThSnVVqGwjttU3YizIwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YAEMxVh2;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04ACB6083608;
	Mon,  9 Nov 2026 09:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04ACB6083608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YAEMxVh2
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7CFBF1691;
	Mon,  9 Nov 2026 01:16:36 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 635CF3F85F;
	Mon,  9 Nov 2026 01:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794215799; bh=SV9pZMl6M/fxVelvGmHOdqTt7nzTXsoHruNVd0Kxcmo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YAEMxVh2PjjTzP9w4DY666QvdD+BDqu1XXu7xplFG/1fdePK85wY3y1xbbN76a020
	 NZYhvKz1QN8P6mgTd6X53vQEt+NTnvf+pMD9OBKmCOUvXEMQ2gY+fKk7aAclKb+cXf
	 AbGtnSEe8BiYMTC6TnRYd/+fw8MbvVR8E3OvcPlY=
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
Subject: [PATCH v15 32/35] docs: ioctl-number: Add SCMI Ioctls
Date: Mon,  9 Nov 2026 09:12:18 +0000
Message-ID: <20261109091221.2532706-33-cristian.marussi@arm.com>
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

