Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795304678;
	b=2Zn8QWrwq066Ex8C2wZPAJWNSEC7C9KxnZuqRM3pyNA/EjiX+wIet3zQ6CCD6b+pxlIZ
	 JXiO+ildgIQgWSTX3P7p5w0940Uc4lEXCwcOMe88TaxuOjtu0rlU5yngkFnijGVaItPdn
	 01DkV651ZouMkbOREiZ8jDFrPjAg/rsWBfkk5rwFMDjOHxxIMYdD6rtjKVqsyUf6elO0C
	 ii4Si/O8a/Pj2x1opNjK8y6rbG9m6YAuJEEt1nTDlPhdbv40Ouu3fwy0HaIAeBebb5Ada
	 knEZb41AzrOdklZgMpQi19TvUCpGHbRnsiE8PAAX0ZNgUBvyE76ZD12Bj9y2fTdV9kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795304678;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UXv2USDLjxCmkBT7t673t/L9uechNCEsT7mnauJfqOk=;
	b=hvGSdnATGTGMXepeHbxjWv6XeNvw1dNzM6b48URboO5aNV9MyhKB+PT2cL8R7ur94Rnd
	 WIKVZAM61gjvqtSzf1oiwNC2KtL/NxsgAnZY33FGD6mAMLfSk2DwBMej3va8MLJ+JyCDn
	 1f8qqxh+20NWkQLMPuyiQVCjgp/baIiSiVgZalqLoq5dEQmgHD6qIyLL9z255+EZhQfTy
	 hr1uaRH1o6oDnqTDcN+A5QpSiJHatEFQHGyBqD8N6Q6Cy6ZVH6kBEuiPPdTRO3GM9Filp
	 Wf8yYFwFqos6Z9FIDIt+PVmja4h2rbbHx4kqJ+N9wzzPSPIOdHd5Mz7WRU1EKVBXNqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=GG0qy4bR;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D5A1606A6A5;
	Sat, 21 Nov 2026 23:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D5A1606A6A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=GG0qy4bR
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E80B176B;
	Sat, 21 Nov 2026 15:44:35 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F96E3F632;
	Sat, 21 Nov 2026 15:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795304678; bh=jI3f070raLj7/k00GZw1QBRqUT86GTz73dk4UnjUdbY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GG0qy4bR4J3mMbCO5QmC4XLLLwXuy5kkvLJaDsROFV68mOnswmQmp6B4K9lA7qITB
	 SR9mXXsxvVy4ko35NQfSn8oYH9W1NTDYlzh9Wv3ji7xYZcrk4GJefIs9hjr3rpgBoW
	 +boVd+sPL+ngxXBPkltixrNgDakBKYKVslWOOkvI=
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
Subject: [PATCH v16 23/31] firmware: arm_scmi: Add Telemetry debugfs ABI documentation
Date: Sat, 21 Nov 2026 23:39:57 +0000
Message-ID: <20261121234005.1525419-24-cristian.marussi@arm.com>
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

Add description of the debugfs SCMI Telemetry protocol ABI.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v15 --> v16
 - fix Kernel version/date
v5 --> v6
 - fixed typos
---
 Documentation/ABI/testing/debugfs-scmi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/ABI/testing/debugfs-scmi b/Documentation/ABI/testing/debugfs-scmi
index ee7179ab2edf..b3e09142fa08 100644
--- a/Documentation/ABI/testing/debugfs-scmi
+++ b/Documentation/ABI/testing/debugfs-scmi
@@ -68,3 +68,25 @@ Description:	Max number of concurrently allowed in-flight SCMI messages for
 		the currently configured SCMI transport for instance <n> on the
 		RX channels.
 Users:		Debugging, any userspace test suite
+
+What:		/sys/kernel/debug/scmi/<n>/protocols/0x<m>/
+Date:		Feb 2027
+KernelVersion:	7.5
+Contact:	cristian.marussi@arm.com
+Description:	A subdirectory grouping debug entries related to protocol <m>
+		for instance <n>. Each protocol owns and defines the subtree
+		of entries rooted under this directory.
+Users:		Debugging, any userspace test suite
+
+What:		/sys/kernel/debug/scmi/<n>/protocols/0x1B/shmtis/<m>
+Date:		Feb 2027
+KernelVersion:	7.5
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

