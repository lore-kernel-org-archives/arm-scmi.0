Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25927415F28;
	Sun,  4 Oct 2026 08:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791100992; cv=none; b=JY47mC/JGrj4OuwdwWti3L6oRds7HipDIlV3dF09Q2detvEe7UGq92PxfRSnDom2ChVFSxl9Awz/ITeOGXaYYPYIPXSNLAlCoIG7r8J2x7W45T21pzmOzCHEAgv5djmbaGRMuLuBesFFi37Dp35KnCHXRBSpASdOS2j3wTiRcMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791100992; c=relaxed/simple;
	bh=w7L8DbnoCEuyvO8JUAes+aM9b0PjMj4j60HnlNcmEQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n0fKy7gkQnJTXhM+kgGZdCWFkwhB39qc4h19cKy2SZ9yxX2CZnpP621GsrXnvSfp71S6o7De07hDgV2XzFvP3ZplGULf+JGmaz/sThyUSgiG8py2IPZhXuTaWxkS90WAgYSto7SGzhPqA4rmixpGaFsMOV1sO0mJE27H01/YsAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mJtTWW74; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mJtTWW74"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 142291691;
	Sun,  4 Oct 2026 01:03:07 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EDFC73F763;
	Sun,  4 Oct 2026 01:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791100990; bh=w7L8DbnoCEuyvO8JUAes+aM9b0PjMj4j60HnlNcmEQg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mJtTWW74I0ZCqmZII5w3+5oB6CmwWHsAtB40mKIgF0PuaGgcenyHSUCmXP4BlcDMT
	 FbrkdXwXTg1ktujFh4jKAn+TgfFNsBLRn0NJ73BBevBFr5eH7i+KUj5fTkjc15kSt1
	 59iY6ZYUWR6bAqWawbiR0O6IL7bQUwS/IxTL41bw=
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
Subject: [PATCH v13 17/25] firmware: arm_scmi: Add Telemetry debugfs ABI documentation
Date: Sun,  4 Oct 2026 09:00:58 +0100
Message-ID: <20261004080106.3355393-18-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261004080106.3355393-1-cristian.marussi@arm.com>
References: <20261004080106.3355393-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add description of the debugfs SCMI Telemetry protocol ABI.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v5 --> v6
 - fixed typos
---
 Documentation/ABI/testing/debugfs-scmi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/ABI/testing/debugfs-scmi b/Documentation/ABI/testing/debugfs-scmi
index ee7179ab2edf..edbbe360321d 100644
--- a/Documentation/ABI/testing/debugfs-scmi
+++ b/Documentation/ABI/testing/debugfs-scmi
@@ -68,3 +68,25 @@ Description:	Max number of concurrently allowed in-flight SCMI messages for
 		the currently configured SCMI transport for instance <n> on the
 		RX channels.
 Users:		Debugging, any userspace test suite
+
+What:		/sys/kernel/debug/scmi/<n>/protocols/0x<m>/
+Date:		Nov 2026
+KernelVersion:	7.3
+Contact:	cristian.marussi@arm.com
+Description:	A subdirectory grouping debug entries related to protocol <m>
+		for instance <n>. Each protocol owns and defines the subtree
+		of entries rooted under this directory.
+Users:		Debugging, any userspace test suite
+
+What:		/sys/kernel/debug/scmi/<n>/protocols/0x1B/shmtis/<m>
+Date:		Nov 2026
+KernelVersion:	7.3
+Contact:	cristian.marussi@arm.com
+Description:	A set of RO files exposed by the Telemetry protocol (0x1B) in
+		order to dump the latest snapshot of each SHMTI memory area in
+		binary format: each file is named by its SHMTI id.
+		File is seekable and a seek to position zero on an open file
+		causes the SHMTI snapshot to be refreshed; file timestamps are
+		updated after each snapshot.
+		This directory reports SHMTIs for instance <n>.
+Users:		Debugging, any userspace test suite
-- 
2.54.0

