Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DEFD3EE1FD;
	Sun, 20 Sep 2026 09:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789896107; cv=none; b=TfAk5myMsqhphnSvhxmu6dEVvFQWXBbCgZO1HQXFUH+8/aszde/OhTKZnNQpL6VcYhr9WISiIeh7ibxRO/hyL/CJ9y2hsFghNgCuTgEC8OC413l3y87TBTR95sdonUGotuk4uhKCytADL/8QmZ/iWVcmCk+O8VJUkadUwhk4zfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789896107; c=relaxed/simple;
	bh=KpUnK9nTZ9MsjB64snnJysKC48S25Nf2oKGr+4tdw/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YEOuymbIMIveyE20KdOQXOuz6XbPOWsAk7YraHUu+sb9UpCYCxfob15DRFVxqNmwIwGVcbUHWoXo7wEzdhfhLPaWiL9zco1wSsrgXJwA7L9zT4x5ww2HbURxLEc1gHzZCj7P3NI0jtSxA1390EW4WcGeSYvqGk8r2X8q0fBpjEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=kVau/WDn; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="kVau/WDn"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6ECA21CE0;
	Sun, 20 Sep 2026 02:21:41 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B5A243F59E;
	Sun, 20 Sep 2026 02:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789896105; bh=KpUnK9nTZ9MsjB64snnJysKC48S25Nf2oKGr+4tdw/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kVau/WDnpjMz3xoAP2wRLiAFXpSlebj0Q1sjWx24eYjJv821CL8YqT6q3QUNwkL/j
	 s95UoEBw4/SEq/drGyKfSaUqXjUSOewzQ8lm7c3jsNsMzPEL5KlTFurCgECtvgXKGA
	 aGYUQObU4wcnscFNY76162qmTPtOwmbPBlk/SqmA=
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
	jic23@kernel.org,
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
Subject: [PATCH v12 22/25] docs: ioctl-number: Add SCMI Ioctls
Date: Sun, 20 Sep 2026 10:19:25 +0100
Message-ID: <20260920091928.2014972-23-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260920091928.2014972-1-cristian.marussi@arm.com>
References: <20260920091928.2014972-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
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
index 2fc53093752d..3a89b2065674 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -401,6 +401,7 @@ Code  Seq#    Include File                                             Comments
 0xE5  00-3F  linux/fuse.h
 0xEC  00-01  drivers/platform/chrome/cros_ec_dev.h                     ChromeOS EC driver
 0xEE  00-09  uapi/linux/pfrut.h                                        Platform Firmware Runtime Update and Telemetry
+0xF1  00-FF  uapi/linux/scmi.h					       ARM SCMI Subsystem
 0xF3  00-3F  drivers/usb/misc/sisusbvga/sisusb.h                       sisfb (in development)
                                                                        <mailto:thomas@winischhofer.net>
 0xF6  all                                                              LTTng Linux Trace Toolkit Next Generation
-- 
2.54.0

