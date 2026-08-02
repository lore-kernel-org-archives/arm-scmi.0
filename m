Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC3E83BE628;
	Sun,  2 Aug 2026 14:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785682752; cv=none; b=R4SgBjR7Bd8aYZzsri5FW2p56Eo98sB52p7Q+QSOH6zxnvTvwuXdGDKGKl1bCLWU0jjfUUNWRym296TuBef9NeNi+CdEcR0UmnleXt9s4qTxrijGMQb0Lr68twswYc/pajJwCB+I7Wa3bkeo9JnnA2zHsgJVKYmn85eKdaDgeK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785682752; c=relaxed/simple;
	bh=7o12nbUSGkr8GeXTl8NER9Ed7uH1hsLYidJd+805CSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DTK6C+nJkMV6+NQE99imDG5iA5yfd+IAWBgc4qZ3E+/Qf+VmArqdqhQRQi2bMa0XRWnsfBO7RGB7WT7vV1hEnNm3czkt1QhToI2XYdqvab3jr3yWiMdCG9GuUgaMD2ls+RhDigIFOfS1SR63cxcC90nJzL6vP483nhm9dgdjb1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mCX8nHSq; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mCX8nHSq"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F6D2143D;
	Sun,  2 Aug 2026 07:59:05 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 689B93F632;
	Sun,  2 Aug 2026 07:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785682749; bh=7o12nbUSGkr8GeXTl8NER9Ed7uH1hsLYidJd+805CSA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mCX8nHSqk6xn+YZOqVZ99oPxb+VfCcptWVbA1lYOgCN3ExvFZCrBGtWS8IT80HDov
	 EdvUrM1+DPcFAlJhy7Twxd59G00wf0QM98Y7hCw//BF7Cs3pf0D/63TynKayOvXmrd
	 WXVLtKkEh8Otbs2W1cikEi47SZKOflsJgqNoGpMk=
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
Subject: [PATCH v7 22/23] [RFC] Documentation: Add SCMI System Telemetry documentation
Date: Sun,  2 Aug 2026 15:56:17 +0100
Message-ID: <20260802145618.1952804-23-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260802145618.1952804-1-cristian.marussi@arm.com>
References: <20260802145618.1952804-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document ARM SCMI Telemetry IOCTLs interface.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
RFC since it still needs more extensive examples

v6 --> v7
 - removed useless top '..stlm' reference
 - added new IOCTLs, fixed a few grammatical errors
v5 --> v6
 - fixed typos
---
 Documentation/userspace-api/index.rst |   1 +
 Documentation/userspace-api/stlm.rst  | 148 ++++++++++++++++++++++++++
 2 files changed, 149 insertions(+)
 create mode 100644 Documentation/userspace-api/stlm.rst

diff --git a/Documentation/userspace-api/index.rst b/Documentation/userspace-api/index.rst
index a68b1bea57a8..22daa7ebf78e 100644
--- a/Documentation/userspace-api/index.rst
+++ b/Documentation/userspace-api/index.rst
@@ -54,6 +54,7 @@ Devices and I/O
    dcdbas
    vduse
    isapnp
+   stlm
 
 Everything else
 ===============
diff --git a/Documentation/userspace-api/stlm.rst b/Documentation/userspace-api/stlm.rst
new file mode 100644
index 000000000000..a574d392c79e
--- /dev/null
+++ b/Documentation/userspace-api/stlm.rst
@@ -0,0 +1,148 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=======================================
+STLM - ARM SCMI Telemetry Userspace API
+=======================================
+
+.. contents::
+
+Overview
+========
+
+ARM SCMI is a System and Configuration Management protocol, based on a
+client-server model, that defines a number of messages that allows a
+client/agent like Linux to discover, configure and make use of services
+provided by the server/platform firmware.
+
+SCMI v4.0 [1] introduced support for System Telemetry, through which an
+agent can dynamically enumerate, configure and collect Telemetry Data
+Events (DE) exposed by the platform.
+
+The SCMI System Telemetry driver exposes one or more dedicated devices,
+named as tlm_<N>, grouped under /dev/scmi/, one for each discovered SCMI
+instance.
+
+An IOCTL based interface is defined in order to enumerate, configure and
+read telemetry data, as succinctly described in the following.
+
+For more details on the uAPI, please see include/uapi/linux/scmi.h
+
+Resources Enumeration
+=====================
+
+ - SCMI_TLM_GET_ABI_INFO: Gather ABI versioning detail and basic SCMI
+   Telemetry features like number of resources and supported features.
+
+ - SCMI_TLM_GET_INTRVS: Enumerate available update intervals.
+
+ - SCMI_TLM_GET_DE_INFO: Retrieve DataEvent description.
+
+ - SCMI_TLM_GET_DE_LIST: Retrieve the list of all the existent DataEvent
+   descriptors.
+
+ - SCMI_TLM_GET_GRP_LIST: Gather a list of descriptors for all defined Groups.
+
+ - SCMI_TLM_GET_GRP_INFO: Gather information for a specific Group.
+
+ - SCMI_TLM_GET_GRP_DESC: Gather detailed group composition information for
+   the specified Group.
+
+ - SCMI_TLM_GET_UUID_LIST: Gather a list of descriptors for all the SCMI
+   Telemetry UUIDs defined on this system.
+
+Configuration
+=============
+
+ - SCMI_TLM_GET_CFG / SCMI_TLM_SET_CFG: Get or set the whole instance, or a
+   specific group, configuration.
+
+ - SCMI_TLM_GET_DE_CFG / SCMI_TLM_SET_DE_CFG: Get or set the configuration
+   of a specific DataEvent.
+
+ - SCMI_TLM_GET_ALL_CFG / SCMI_TLM_SET_ALL_CFG: Get or set the cumulative
+   configuration of ALL the DataEvents defined on the platform.
+
+ - SCMI_TLM_RESET: Reset the whole Telemetry configuration server side.
+
+ - SCMI_TLM_EVENT_REGISTER: Subscribe/unsubscribe to a Telemetry event.
+
+Data Collection
+===============
+
+ - SCMI_TLM_DE_READ: Report the last updated sample for the specified
+   DataEvent.
+
+ - SCMI_TLM_BULK_READ: Report the last samples for all the currently enabled
+   DataEvents.
+
+ - SCMI_TLM_BATCH_READ: Report the last samples for the DataEvents IDs
+   specified within the samples input params.
+
+ - SCMI_TLM_SINGLE_READ: Trigger an immediate platform-side DataEvent
+   update and report the collected samples.
+
+Memory Mapped Raw Access
+------------------------
+
+ - SCMI_TLM_GET_SHMTI_LIST: Gather a list of open file descriptors, one for
+   each SHMTI memory area defined for this instance, that can be used to
+   memory-map such areas in the calling process address space so as to be
+   able to directly access the SCMI Telemetry SHMTI areas shared by the
+   platform firmware, and parse the TDCF format.
+   The SCMI Telemetry TDCF format is defined in the specification at [1].
+
+
+Example
+=======
+
+.. code-block:: c
+
+	int main(int argc, char **argv)
+	{
+		struct scmi_tlm_de_config des_cfg = {};
+		struct scmi_tlm_config cfg = {};
+		struct scmi_tlm_de_sample samples[3] = {};
+		struct scmi_tlm_data_read data = {};
+		int fd, ret;
+
+		fd = open("/dev/scmi/tlm_0", O_RDWR);
+		if (fd < 0)
+			return fd;
+
+		/* Enable ALL Data Events with timestamps*/
+		des_cfg.enable = 1;
+		des_cfg.t_enable = 1;
+		ret = ioctl(fd, SCMI_TLM_SET_ALL_CFG, &des_cfg);
+		if (ret)
+			return ret;
+
+		/* Enable Telemetry as a whole, set a 400ms update interval */
+		cfg.enable = 1;
+		cfg.active.secs = 400;
+		cfg.active.exp = -3;
+
+		ret = ioctl(fd, SCMI_TLM_SET_CFG, &cfg);
+		if (ret)
+			return ret;
+
+		/* Read a selection of DEs */
+		samples[0].id = 0xA001;
+		samples[1].id = 0x0002;
+		samples[2].id = 0x1010;
+		data.num_samples = 3;
+		data.samples = (unsigned long)samples;
+
+		ret = ioctl(fd, SCMI_TLM_BATCH_READ, &data);
+		if (ret)
+			return ret;
+
+		for (int i = 0; i < 3; i++)
+			fprintf(stdout, "%llu: 0x%08X -> %llu\n",
+					samples[i].tstamp, samples[i].id, samples[i].val);
+
+		return 0;
+	}
+
+References
+==========
+[1]: https://developer.arm.com/documentation/den0056/latest/
-- 
2.54.0

