Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 524403E51F0;
	Sun, 20 Sep 2026 09:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789896024; cv=none; b=M8FXWeBkkjwZw0/YT2xXWI8jtUWS0tqNyBELyrxaSUSL0XkLxsbRERedwwKmkVca0V0hnEVwDEe/kkxYfgdptB0NfCV8wqbFh4Er/GFsLSxqjT4VcI2eUSBUGFzdzpVxuX8upBcp/GHWFphlDjrySdrk21v1YdySL++84iaYeks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789896024; c=relaxed/simple;
	bh=P0MSY/kDk0ow8kuKtSYBKr3uG3KhXyWBVbPVVFEhnOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N6wpQdMbKKVdmLQ7LT/AhDC06pb1PEYqzo0tJh22vWWXpTV+3AMG364cllyyTrYjlIim65Hjym6O5qYgXWZfa1xIq6xLxihbbczIf70hQYnAE8asYlq6mw5Nn8JEWD/9SFfKM2bK6VuXlmpedw4ffTmYsD58UmVsYHqPVu+2rXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=UR4Q4NZh; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="UR4Q4NZh"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F27D01691;
	Sun, 20 Sep 2026 02:20:09 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A2BB3F59E;
	Sun, 20 Sep 2026 02:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789896013; bh=P0MSY/kDk0ow8kuKtSYBKr3uG3KhXyWBVbPVVFEhnOA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UR4Q4NZhWn2Y2X904sw0onb09M6CGkumJqWgR8OczUv47NmVBLiDqglp+iX5rosWF
	 epwGOz8Wj14Cc1twhNUeHYPr6y7AD9SMT0l/yUZkMvo9Zy0xw36jEP2rW3ZqwEkUMT
	 fes5YkW9Jhzu8qHfuZrvdRwkRrBfKyl4YU+YLOVE=
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
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [PATCH v12 01/25] firmware: arm_scmi: Add new SCMIv4.0 error codes definitions
Date: Sun, 20 Sep 2026 10:19:04 +0100
Message-ID: <20260920091928.2014972-2-cristian.marussi@arm.com>
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

SCMIv4.0 introduces a couple of new possible protocol error codes: add
the needed definitions and mappings to Linux error values.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v4 --> v5
 - map SCMI_ERR_IN_USE to EBUSY as natural
---
 drivers/firmware/arm_scmi/common.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index fe8c22cfb9f7..6f89ba96493d 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -48,6 +48,8 @@ enum scmi_error_codes {
 	SCMI_ERR_GENERIC = -8,	/* Generic Error */
 	SCMI_ERR_HARDWARE = -9,	/* Hardware Error */
 	SCMI_ERR_PROTOCOL = -10,/* Protocol Error */
+	SCMI_ERR_IN_USE = -11,  /* In Use Error */
+	SCMI_ERR_PARTIAL = -12, /* Partial Error */
 };
 
 static const int scmi_linux_errmap[] = {
@@ -63,6 +65,8 @@ static const int scmi_linux_errmap[] = {
 	-EIO,			/* SCMI_ERR_GENERIC */
 	-EREMOTEIO,		/* SCMI_ERR_HARDWARE */
 	-EPROTO,		/* SCMI_ERR_PROTOCOL */
+	-EBUSY,			/* SCMI_ERR_IN_USE */
+	-EINVAL,		/* SCMI_ERR_PARTIAL */
 };
 
 static inline int scmi_to_linux_errno(int errno)
-- 
2.54.0

