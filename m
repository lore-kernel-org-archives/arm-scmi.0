Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215804;
	b=fPfdDbWkxfVD0go5sKPMh+vyiQeaD4faeKoj4ZXi88sdELlMIFjnY5hz7Rg+TO4WyxPl
	 FwZDmkYKjvf2IFhHN9ObagIGuj4Rcs0HWmr2K8ejHG+ERU4DD171eLGn69V/Zc60E0pbJ
	 kgjkw43DxQNOYU2Oim+D7ikNQ0U7O5rVtzmuLLR70jfB5/CA0xOyMUfe8PFQ2WSULX6xm
	 wPC+Il9u0IejtK0JupGqBuEbJWtvS6dUYkUcviafRneCyxwyZ5GIcQDmBCZr/uaUJQ5md
	 Uo6ruCmEZqyndfOjAMUok7eWOWDgQquddKz5fDslabv5GGQ6jDemklmbr0rosJMpZhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215804;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dUr34OSnIfpub/O8h6wHcTT6QMAyaDpGhf/w2EluVlI=;
	b=IzvP/eZP3dNZMNlkdig+tQ7TTh05L2wEJ1QFzrr5V65MuKsQBQZK0aW/DeMkXQjVgYZI
	 Gp4GtvTNSA6+fzniFKS07JiyFJjZIQM0ueuWNHs/MFELAktJ4ii8VdIBKZP8VeLv40SVg
	 JW0kxzAzOx8L4zpVRRmJ2MtbGv6DqIxOnjO8qXxWzwqf2TBHKMREF5wVi6BqPeOymgz9s
	 u6P4R6SgBbDmYNroEk8eLAKu0d1wZ9lt+Fuy16FUzjK/3DqK7z4qGOKQUBiVZcQwENZe2
	 JR8oSDMr+a8cUDoMYzNFNXzl70iubJdhEs9FtNZiRy6YeX/3lko5SyrGhMyq9jCL2ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="ozDHP/kV";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60BA960A6F45;
	Mon,  9 Nov 2026 09:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60BA960A6F45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ozDHP/kV
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4D1014BF;
	Mon,  9 Nov 2026 01:16:39 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0D393F85F;
	Mon,  9 Nov 2026 01:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794215802; bh=taOCCu5ou/sgYDh6Z57CmVkp9LIDzo16uITYO1gIna4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ozDHP/kVliHaQKQf4b1Q5f4eiHtK1yyKDuOiqEivyKe63LaP759kgL9vSXEAR2kio
	 G/xs43BUCFc8D95YpPCC3FUVKs7wUTpwu4OKeK3/Sa9AfyaVKuWeGSfexR3knoEU43
	 YLsMLfg/WuxBsQDUvpMVbkiP6C+U82ZB3W2CuQgM=
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
Subject: [PATCH v15 33/35] Documentation: Add SCMI System Telemetry documentation
Date: Mon,  9 Nov 2026 09:12:19 +0000
Message-ID: <20261109091221.2532706-34-cristian.marussi@arm.com>
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

Document ARM SCMI Telemetry IOCTLs interface.

Co-developed-by: Philip Radford <philip.radford@arm.com>
Signed-off-by: Philip Radford <philip.radford@arm.com>
---
 Documentation/userspace-api/index.rst |   1 +
 Documentation/userspace-api/stlm.rst  | 590 ++++++++++++++++++++++++++
 2 files changed, 591 insertions(+)
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
index 000000000000..ea05a10d314f
--- /dev/null
+++ b/Documentation/userspace-api/stlm.rst
@@ -0,0 +1,590 @@
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
+Enumerating DataEvents
+======================
+
+SCMI_TLM_GET_DE_LIST returns the DataEvent descriptors exposed by the
+Telemetery instance. Users can size the request from
+SCMI_TLM_GET_ABI_INFO.num_des or by issuing a zero-sized batch query.
+
+Example
+-------
+
+.. code-block:: c
+
+	int main(int argc, char **argv)
+	{
+		struct scmi_tlm_abi_info abi = {};
+		struct scmi_tlm_batch batch = {};
+		struct scmi_tlm_de_info *des;
+		int fd, ret, i;
+
+		fd = open("/dev/scmi/tlm_0", O_RDONLY | O_CLOEXEC);
+		if (fd < 0)
+			return fd;
+
+		abi.size = sizeof(abi);
+		ret = ioctl(fd, SCMI_TLM_GET_ABI_INFO, &abi);
+		if (ret) {
+			close(fd);
+			return ret;
+		}
+
+		if (!abi.num_des) {
+			close(fd);
+			return ret;
+		}
+
+		des = calloc(abi.num_des, sizeof(*des));
+		if (!des) {
+			close(fd);
+			return -ENOMEM;
+		}
+
+		batch.num_items = abi.num_des;
+		batch.item_sz = sizeof(*des);
+		batch.items = (unsigned long)des;
+
+		ret = ioctl(fd, SCMI_TLM_GET_DE_LIST, &batch);
+		if (ret) {
+			free(des);
+			close(fd);
+			return ret;
+		}
+
+		for (i = 0; i < batch.num_items; i++) {
+			printf("0x%08x: %.*s size:%u type:%u unit:%u", des[i].id, 16,
+				des[i].name, des[i].data_sz, des[i].type, des[i].unit);
+
+			if (des[i].flags & SCMI_TLM_DEINFO_GROUP)
+				printf("group:%u", des[i].grp_id);
+
+			printf("\n");
+		}
+
+		return 0;
+	}
+
+Enumerating Groups
+==================
+
+SCMI_TLM_GET_GRP_LIST returns the groups exposed by the Telemetry Instance.
+Group descriptors report; the group ID, the number of DEs in the group, and
+the number of update intervals supported by the group.
+
+SCMI_TLM_GET_GRP_DESC can then be used to retrieve the DE IDs of a specific
+group.
+
+Example
+-------
+
+.. code-block:: c
+
+	int main(int argc, char **argv)
+	{
+		struct scmi_tlm_abi_info abi = {};
+		struct scmi_tlm_batch batch = {};
+		struct scmi_tlm_grp_info *groups;
+		int fd, ret, i;
+
+		fd = open("/dev/scmi/tlm_0", O_RDONLY | O_CLOEXEC);
+		if (fd < 0)
+			return fd;
+
+		abi.size = sizeof(abi);
+		ret = ioctl(fd, SCMI_TLM_GET_ABI_INFO, &abi);
+
+		if (ret){
+			free(groups);
+			close(fd);
+			return ret;
+		}
+
+		if (!abi.num_groups) {
+			ret = 0;
+			free(groups);
+			close(fd);
+			return ret;
+		}
+
+		groups = calloc(abi.num_groups, sizeof(*groups));
+		if (!groups) {
+			ret = -ENOMEM;
+			free(groups);
+			close(fd);
+		}
+
+		batch.num_items = abi.num_groups;
+		batch.item_sz = sizeof(*groups);
+		batch.items = (unsigned long)groups;
+
+		ret = ioctl(fd, SCMI_TLM_GET_GRP_LIST, &batch);
+		if (ret) {
+			free(groups);
+			close(fd);
+			return ret;
+		}
+
+		for (i = 0; i < batch.num_items; i++) {
+			struct scmi_tlm_grp_desc desc = {};
+			__u32 *de_ids;
+			int j;
+
+			printf("group:%u des:%u intervals:%u\n", groups[i].grp_id,
+				groups[i].num_des, groups[i].num_intervals);
+
+			if (!groups[i].num_des)
+				continue;
+
+			de_ids = calloc(groups[i].num_des, sizeof(*de_ids));
+			if (!de_ids) {
+				ret = -ENOMEM;
+				free(groups);
+				close(fd);
+				return de_ids;
+			}
+
+			desc.grp_id = groups[i].grp_id;
+			desc.num_des = groups[i].num_des;
+			desc.composing_des = (unsigned long)de_ids;
+
+			ret = ioctl(fd, SCMI_TLM_GET_GRP_DESC, &desc);
+			if (ret) {
+				free(de_ids);
+				free(groups);
+				close(fd);
+				return ret;
+			}
+
+			printf("DataEvents:");
+			for (j = 0; j < desc.num_des; j++)
+				printf(" 0x%08x", de_ids[j]);
+			printf("\n");
+
+			free(de_ids);
+		}
+
+		free(groups);
+		close(fd);
+		return 0;
+	}
+
+Enumerating Update Intervals
+============================
+
+SCMI_TLM_GET_INTRVS returns the update intervals supported by the Telemetry
+instance. Userspace can size the request from SCMI_TLM_GET_ABI_INFO.num_intervals
+or by sending a zero-sized query.
+
+The returned intervals may be discrete values, or a range described as
+low/high/step when SCMI_TLM_INTERV_DISCRETE is not  set.
+
+Example
+-------
+
+.. code-block:: c
+
+	int main(int argc, char **argv)
+	{
+		struct scmi_tlm_abi_info abi = {};
+		struct scmi_tlm_intervals ivs = {};
+		struct scmi_tlm_update_interval *intervals;
+		int fd, ret, i;
+
+		fd = open("/dev/scmi/tlm_0", O_RDONLY | O_CLOEXEC);
+		if (fd < 0)
+			return fd;
+
+		abi.size = sizeof(abi);
+		ret = ioctl(fd, SCMI_TLM_GET_ABI_INFO, &abi);
+		if (ret)
+			goto out_fd;
+
+		if (!abi.num_intervals)
+			goto out_fd;
+
+		intervals = calloc(abi.num_intervals, sizeof(*intervals));
+		if (!intervals) {
+			ret = -ENOMEM;
+			goto out_fd;
+		}
+
+		ivs.num_intervals = abi.num_intervals;
+		ivs.intervals = (unsigned long)intervals;
+
+		ret = ioctl(fd, SCMI_TLM_GET_INTRVS, &ivs);
+		if (ret)
+			goto out_free;
+
+		if (ivs.flags & SCMI_TLM_INTERV_DISCRETE) {
+			for (i = 0; i < ivs.num_intervals; i++)
+				printf("interval[%d]: %u * 10^%d seconds\n", i,
+					intervals[i].secs, intervals[i].exp);
+		} else if (ivs.num_intervals >= 3) {
+			printf("low: %u * 10^%d seconds\n",
+				intervals[SCMI_TLM_UPDATE_INTVL_SEGMENT_LOW].secs,
+				intervals[SCMI_TLM_UPDATE_INTVL_SEGMENT_LOW].exp);
+			printf("high: %u * 10^%d seconds\n",
+				intervals[SCMI_TLM_UPDATE_INTVL_SEGMENT_HIGH].secs,
+				intervals[SCMI_TLM_UPDATE_INTVL_SEGMENT_HIGH].exp);
+			printf("step: %u * 10^%d seconds\n",
+				intervals[SCMI_TLM_UPDATE_INTVL_SEGMENT_STEP].secs,
+				intervals[SCMI_TLM_UPDATE_INTVL_SEGMENT_STEP].exp);
+			}
+	out_free:
+		free(intervals);
+	out_fd:
+		close(fd);
+
+		return ret ? 1 : 0;
+	}
+
+Telemetry Instance Configuration
+================================
+
+SCMI_TLM_GET_CFG returns the current Telemetry configuration. SCMI_TLM_SET_CFG
+updates teh enabled state and active update interval for the whole Telemetry
+instance.
+
+The update interval is described as 'secs * 10 ^ exp' seconds. Userspace
+should choose an interval reported by SCMI_TLM_GET_INTRVS.
+
+Example
+-------
+
+.. code-block:: c
+	int main(int argc, char **argv)
+	{
+		struct scmi_tlm_config old_cfg = {};
+		struct scmi_tlm_config new_cfg = {};
+		int fd, ret;
+
+		fd = open("/dev/scmi/tlm_0", O_RDWR | O_CLOEXEC);
+		if (fd < 0)
+			return fd;
+
+		ret = ioctl(fd, SCMI_TLM_GET_CFG, &old_cfg);
+		if (ret) {
+			close(fd);
+			return ret;
+		}
+
+		printf("enabled:%u timestamps:%u interval:%u * 10^%d seconds\n",
+			old_cfg.enable, old_cfg.t_enable,
+			old_cfg.active.secs, old_cfg.active.exp);
+
+		new_cfg.enable = 1;
+		new_cfg.t_enable = old_cfg.t_enable;
+
+		new_cfg.active.secs = 400;
+		new_cfg.active.exp = -3;
+
+		ret = ioctl(fd, SCMI_TLM_SET_CFG, &new_cfg);
+		if (ret) {
+			close(fd);
+			return ret;
+		}
+
+		close(fd)
+
+		return 0;
+	}
+
+Group Configuration
+-------------------
+
+If group configuration is supported, the same ioctls can operate on a group
+by setting SCMI_TLM_CONFIG_GROUP in flags and setting grp_id to a group ID
+discovered with SCMI_TLM_GET_GRP_LIST.
+
+Configuring DataEvents
+======================
+
+SCMI_TLM_GET_DE_CFG returns the configuration of one or more DataEvents.
+SCMI_TLM_SET_DE_CFG updates the enabled state and timestamp state of one or
+more DataEvents.
+
+Both ioctls use struct scmi_tlm_batch with items pointing to an array of
+struct scmi_tlm_de_config. Each entry must contain the DataEvent ID in id.
+Valid IDs can be discovered with SCMI_TLM_GET_DE_LIST.
+
+When a DataEvent is enabled, SCMI_TLM_GET_DE_CFG also reports the SHMTI sid
+and offset where the DataEvent can be found in the shared memory TDCF data,
+together with the UUID associated with that DataEvent.
+
+Note that in the example below, the cfgs[n].id numbers would normally come
+from SCMI_TLM_GET_DE_LIST.
+
+Example
+-------
+
+.. code-block:: c
+
+	int main(int argc, char **argv)
+	{
+		struct scmi_tlm_de_config cfgs[2] = {};
+		struct scmi_tlm_batch batch = {};
+		int fd, ret, i;
+
+		fd = open("/dev/scmi/tlm_0", O_RDWR | O_CLOEXEC);
+		if (fd < 0)
+			return fd;
+
+		cfgs[0].id = 0x00000001;
+		cfgs[1].id = 0x00000002;
+
+		batch.num_items = 2;
+		batch.item_sz = sizeof(cfgs[0]);
+		batch.items = (unsigned long)cfgs;
+
+		ret = ioctl(fd, SCMI_TLM_GET_DE_CFG, &batch);
+		if (ret) {
+			close(fd);
+			return ret;
+		}
+
+		for (i = 0; i < batch.num_items; i++) {
+			printf("DE 0x%08x: enabled:%u timestamps:%u\n",
+				cfgs[i].id, cfgs[i].enable, cfgs[i].t_enable);
+		}
+
+		for (i = 0; i < batch.num_items; i++) {
+			cfgs[i].enable = 1;
+			cfgs[i].e_enable = 1;
+		}
+
+		ret = ioctl(fd, SCMI_TLM_SET_DE_CFG, &batch);
+		if (ret) {
+			close(fd);
+			return ret;
+		}
+
+		ret = ioctl(fd, SCMI_TLM_GET_DE_CFG, &batch);
+		if (ret) {
+			close(fd);
+			return ret;
+		}
+
+		for (i = 0; i < batch.num_items; i++) {
+			printf("DE 0x%08x: enabled:%u timestamps:%u sid:%u offset:%u\n",
+				cfgs[i].id, cfgs[i].enable, cfgs[i].t_enable,
+				cfgs[i].sid, cfgs[i].offset);
+		}
+
+		close(fd);
+		return 0;
+	}
+
+Further Configuration
+=====================
+
+ - SCMI_TLM_RESET: Reset the whole Telemetry configuration server side.
+
+ - SCMI_TLM_EVENT_SUBSCRIBE: Subscribe/unsubscribe to a Telemetry event.
+   Lets userspace ask the kernel to notify it when a generation event happens
+   by siganling the eventfd provided.
+
+Event Notification
+------------------
+
+Example
+=======
+
+ - Subscribe to the Telemetry generation event and wait for a notification
+   throught an eventfd. Event support is optional so this example checks
+   SCMI_TLM_ABI_FEAT_EVENT.
+
+.. code-block:: c
+
+	int main(int argc, char **argv)
+	{
+		struct scmi_tlm_abi_info abi = {};
+		struct scmi_tlm_event evt = {};
+		eventfd_t count;
+		int fd, efd, ret;
+
+		fd = open("/dev/scmi/tlm_0", O_RDWR | O_CLOEXEC);
+		if (fd < 0)
+			return fd;
+
+		abi.size = sizeof(abi);
+		evt.type = SCMI_TLM_EVT_GENERATION;
+
+		ret = ioctl(fd, SCMI_TLM_GET_ABI_INFO, &abi);
+		if (ret)
+			return ret;
+
+		if (!(abi.abi_features & SCMI_TLM_ABI_FEAT_EVENT)) {
+			close(fd);
+			return -EOPNOTSUPP;
+		}
+
+		efd = eventfd(0, EFD_CLOEXEC);
+		if (efd < 0)
+			return efd;
+
+		evt.efd = efd;
+		ret = ioctl(fd, SCMI_TLM_EVENT_SUBSCRIBE, &evt);
+		if (ret)
+			return ret;
+
+		struct pollfd pfd = {
+			.fd = efd,
+			.events = POLLIN,
+		};
+
+		while (1) {
+			ret = poll(&pfd, 1, -1);
+			if (ret < 0)
+				break;
+
+			if (pfd.revents & POLLIN) {
+				ret = eventfd_read(efd, &count);
+				if (ret)
+					break;
+
+				printf("telelmetry generation changed: %llu\n",
+					(unsigned long long)count);
+			}
+		}
+
+		/* Re-issue returned cookie to remove subscription */
+		if (evt.cookie)
+			ioctl(fd, SCMI_TLM_EVENT_SUBSCRIBE, &evt);
+
+		close(efd);
+		close(fd);
+
+		return 0;
+	}
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

