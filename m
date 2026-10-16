Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551264C52FB;
	Fri, 16 Oct 2026 18:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792177114; cv=none; b=AM4kqjDYXeDQk2JyV4hY4XapZ7Rcc+pmdkkx2ba12G11pDhsHr5entYxtjiu/XADbc76KDs3RNnMDmUTl7Qpw+6tbZvSIf+zcv4Dt+DX9z54aXwJKIttjXVCPPMbzgqvfSoZX3bmGuvq1qIKH7LIks9+el+uET7EXo/gFfOtZVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792177114; c=relaxed/simple;
	bh=HvrwDjFUCGDGozuhF5grkKDEqksK7YpEmWAGOSF1nvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F/v/kIwT8r2IUeB2D9N2oXk8rniYpkrQrbqeO1NhcceulkXNb/K+UJLDSvOMDfgOdLEng15QzoFMIftJrJDHdQo6/hODJd/WT7d5y7DrvvDsA9QN+oLvS0nDlQnWVmGaJ6YSLD0OI0KEgr9usHz2VYHhK8HzDDlvv8iaSHqm+uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DfVo+NRT; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DfVo+NRT"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3562A14BF;
	Fri, 16 Oct 2026 11:58:25 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA49D3F7B4;
	Fri, 16 Oct 2026 11:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792177108; bh=HvrwDjFUCGDGozuhF5grkKDEqksK7YpEmWAGOSF1nvs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DfVo+NRTFhpk0X4A9S8b/aQcx047MnQy9iB6F7NQV4JCYrtC8H3fQ+c4CKYtCz90d
	 KhowUDYrKpF5OcHZynYW/QWXj3xPwnuzaJeEop+GuIS9W5AJm/FwNDYomwPDdNpUyq
	 0gUPUGFUoIDvFMh/MUhKp1l5GXrUHkODlc08nDMs=
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
Subject: [PATCH v14 30/32] [RFC] Documentation: Add SCMI System Telemetry documentation
Date: Fri, 16 Oct 2026 19:55:51 +0100
Message-ID: <20261016185553.2794459-31-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261016185553.2794459-1-cristian.marussi@arm.com>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
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

v12 --> v13
 - added to MAINTAINERS files
v6 --> v7
 - removed useless top '..stlm' reference
 - added new IOCTLs, fixed a few grammatical errors
v5 --> v6
 - fixed typos
---
 Documentation/userspace-api/index.rst |   1 +
 Documentation/userspace-api/stlm.rst  | 148 ++++++++++++++++++++++++++
 MAINTAINERS                           |   1 +
 3 files changed, 150 insertions(+)
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
index 000000000000..e30b1d1d19bd
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
+ - SCMI_TLM_EVENT_SUBSCRIBE: Subscribe/unsubscribe to a Telemetry event.
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
diff --git a/MAINTAINERS b/MAINTAINERS
index b336521ae4ce..1b614c35731b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26617,6 +26617,7 @@ L:	arm-scmi@vger.kernel.org
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/firmware/arm,sc[mp]i.yaml
+F	Documentation/userspace-api/stlm.rst
 F:	drivers/clk/clk-sc[mp]i.c
 F:	drivers/cpufreq/sc[mp]i-cpufreq.c
 F:	drivers/firmware/arm_scmi/
-- 
2.54.0

