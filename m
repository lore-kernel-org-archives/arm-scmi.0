Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549908;
	b=exE9oxV/u0/0FUSS5cC27Ta00iqYnh8Z2geyYigrO1y0fawhxGc9+Fr2bNz1kQzb/wkT
	 FCwA/nUHMgrz7RgkVTyzF/x7TxBB2ugCPHK1UXf+Xf65JjaobhZMXM/wUqgoCmt81xntg
	 VcJ8SNnuePOtW9w59ViO+3DCm9bWLWrbwZjiYr+zT+DQz5EG1O2zDvR1fE23i2/BIk/Ky
	 CbFt4Ifabr6YS86Nn3kMp05Ue53QghHzxu5Uj1qh/FqtfJ34tMFd5o7Y/gl5oEcUs4a5A
	 5OQS4rIsITuXwGuibxtc9/FFc9ZZL4RK0E7nVots0dNdJQnFtMls7l9qgZZ7KvJKnkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549908;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UXv2USDLjxCmkBT7t673t/L9uechNCEsT7mnauJfqOk=;
	b=fEReXu3eV5vB3GAmCfvg27U/3Yp0zHia4ouNGzPYakE49+a6nhCvTKDOb6rf66VEEqcN
	 HZmvQvu7BhHqGzDkz5mbNNa9t7FpZHTUOVhUMPQK+Lsi+EpmfMz9NnYQXhztEr6HviE9y
	 mXX+nvhH2eRH9kAaiqEuDJ+Jyi81AIKraqpsPb6TF28QQd27Ey5s5w4NIA9I/DO22LuLW
	 nlGHlbdHuxj2ufQAo3aVrE/twpmS3I00NP2SQm7R04pwrwvJ0medtDqZtrf5wQYAhhqba
	 4urUsUQOB4x0yxptiVfl6E9b3m6BYpwqYcqt1MoskoO3Zfpy7/jYIgW4Wq64KLakCkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=I3cIDB4u;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C3E606A680;
	Tue, 24 Nov 2026 19:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6C3E606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=I3cIDB4u
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57986175A;
	Tue, 24 Nov 2026 11:51:44 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B4A33F763;
	Tue, 24 Nov 2026 11:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795549907; bh=jI3f070raLj7/k00GZw1QBRqUT86GTz73dk4UnjUdbY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I3cIDB4uhWiMlavHBp1Nyxq3mpjquLNcxo5Re1sIqaB5STCBAdqUeBWj6zBUV+y+z
	 UZu37heUAP1DJPKAwwhvkkp94NmcT5SKLgdDwHkxPw9UzUxHe0229qhG6AV4pZC4td
	 bi0APtjRbKsvgJXG6aClLawOQh2P1lyu8wMAPOwo=
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
Subject: [PATCH v17 26/34] firmware: arm_scmi: Add Telemetry debugfs ABI documentation
Date: Tue, 24 Nov 2026 19:48:32 +0000
Message-ID: <20261124194841.1147072-27-cristian.marussi@arm.com>
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

