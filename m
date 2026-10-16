Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 235984C52EE;
	Fri, 16 Oct 2026 18:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792177122; cv=none; b=oLngZhxRpvN6sXLImYsIj1zBVDitmVRg6qWE5lyCnnsF9nurWO695YhC7176PJDjPBl/riOJ3VbkLp/N6cHqzK3WYOfjs0mXK4HtHCyrTMePGwkIZ1wyYBIAPwVSf8E1FMfmmO/Ta1mQvAbdDmIDPBfI0ke2dRPWjKdegLWxnWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792177122; c=relaxed/simple;
	bh=SqqFdPr4YAut22m4gutySEmm+8ybDlZqgpX6vwmNdVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cHXz5BMuLd+yaxkGVSV2JeFctH88tyyzpVhAe2DsffAWk7BkTCzKH5xO7TV/VPmGogP9/qtigoBdM6ty9jw8dBd8c8upkGKmPWGr4KEcLwQVzTfHh2kOPuvd069bS/xtrbXNNVtJAXyetC/mmgNcCj3GkORY1+trEsh4X7Za/Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=vEK68kAO; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="vEK68kAO"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5373D1516;
	Fri, 16 Oct 2026 11:58:29 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B430D3F7B4;
	Fri, 16 Oct 2026 11:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792177112; bh=SqqFdPr4YAut22m4gutySEmm+8ybDlZqgpX6vwmNdVE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vEK68kAOPXf8dDf5GxbnDh+Aha9RkkvZNirnmJfo+l23yIGPP4cCk54DSD0XuHTM1
	 GIRa8EwiavaxAybdFYn4qC9enLppx2wZHUWuGOiI3fb6U+r26bbxkgTZDY89qacsO9
	 svfFIt2LW3mxNkOPIVxuGepQM6Q8A9oVy7IqGA00=
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
Subject: [PATCH v14 31/32] [RFC] tools/testing/scmi: Add SCMI Telemetry testing tool
Date: Fri, 16 Oct 2026 19:55:52 +0100
Message-ID: <20261016185553.2794459-32-cristian.marussi@arm.com>
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

Add a testing tool that exercises the SCMI ioctls UAPI interface: as of
now the tool simply queries the initial state of the SCMI Telemetry
subsystem, tries to enable all the existent Data Events and dumps all
the Telemetry data.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v13 -->v14
 - fix mmap/munmap calls
 - add proper NULL checks around failed enumerations
 - harden cmd line parsing and report errors
v12 --> v13
 - misc fixes on alloc/free
 - add single DE dump capability to get info/cfg/data
 - add SHMTIs decoder (by LLM)
 - fix mmap len/offset call to account for bigger pages and offset
 - fixed SPDX header
 - added to MAINTAINERS file
v11 --> v12
 - renamed command helpers
 - reviewed all internal/external error codes handling
 - fixed dump_shmti read loop
 - fixed shmti_check end address calculation
 - fixed batch read boundary checks
 - fixed group indexing
v10 --> v11
 - add query for ALL new 0-sized commands: GET_INTRVS/BULK/SINGLE
v8 --> v9
 - move to new _LIST IOCTLs support based on scmi_tlm_batch container
 - add a "query" command to issue 0-items IOCTLs requests
v7 -> v8
 - add monitor detached option
v6 --> v7
 - added monitor command for events
 - using and exposing DE's UUID/SID/OFFSET
 - use BATCH READ with status
 - use BATCH DE CONFIG GET/SET
 - use new ABI/SCMI feats flags
v5 --> v6
 - carry-on on error if feats NOT supported
 - build BATCH_READ with enumerated values
 - new UAPI naming
 - reworked UUID print
 - added info/shmti interactive cmds
 - added cfg/single/bulk/batch interactive cmds
 - added reset
 - added tlm enable
 - using new GET_ABI_INFO
 - moved DE_READ per-de sampling away from get_state
v4 --> v5
 - changes to adapt to new chardev/IOCTLs ABI
 - change IOCTLs param to avoid flexible arrays
 - added SHMTIs mmap dump
v3 --> v4
 - added generation file support
---
 MAINTAINERS                      |    1 +
 tools/testing/scmi/Makefile      |   25 +
 tools/testing/scmi/stlm.c        | 1635 ++++++++++++++++++++++++++++++
 tools/testing/scmi/stlm_decode.c |  252 +++++
 tools/testing/scmi/stlm_decode.h |    7 +
 5 files changed, 1920 insertions(+)
 create mode 100644 tools/testing/scmi/Makefile
 create mode 100644 tools/testing/scmi/stlm.c
 create mode 100644 tools/testing/scmi/stlm_decode.c
 create mode 100644 tools/testing/scmi/stlm_decode.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 1b614c35731b..77a23536ceb8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26632,6 +26632,7 @@ F:	include/linux/sc[mp]i_protocol.h
 F:	include/trace/events/scmi.h
 F:	include/uapi/linux/scmi.h
 F:	include/uapi/linux/virtio_scmi.h
+F:	tools/testing/scmi/
 
 SYSTEM CONTROL MANAGEMENT INTERFACE (SCMI) i.MX Extension Message Protocol drivers
 M:	Peng Fan <peng.fan@nxp.com>
diff --git a/tools/testing/scmi/Makefile b/tools/testing/scmi/Makefile
new file mode 100644
index 000000000000..2d4f4e630a1b
--- /dev/null
+++ b/tools/testing/scmi/Makefile
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+CC?=$(CROSS_COMPILE)gcc
+OBJS = stlm.o stlm_decode.o
+
+CFLAGS=-Wall -static -std=gnu11 -I ../../../include/uapi/
+ifneq ($(DEBUG), )
+	CFLAGS+=-O0 -g -ggdb
+else
+	CFLAGS+=-static
+endif
+
+all: stlm
+
+stlm: $(OBJS)
+	$(CC) $(CFLAGS) $^ -o $@
+
+%.o: %.c
+	$(CC) $(CFLAGS) -c $<
+
+clean:
+	rm -f *.o
+	rm -f stlm
+
+.PHONY: clean
diff --git a/tools/testing/scmi/stlm.c b/tools/testing/scmi/stlm.c
new file mode 100644
index 000000000000..6498babf6eb8
--- /dev/null
+++ b/tools/testing/scmi/stlm.c
@@ -0,0 +1,1635 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SCMI Telemetry Test Tool
+ *
+ * Copyright (C) 2026 ARM Ltd.
+ */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <limits.h>
+#include <poll.h>
+#include <signal.h>
+#include <stdbool.h>
+#include <stddef.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/eventfd.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+#include <sys/signalfd.h>
+
+#include <unistd.h>
+
+#include <linux/scmi.h>
+
+#include "stlm_decode.h"
+
+#define IOCTL_ERR_STR(_ioctl)	"IOCTL:" #_ioctl
+#define MIN_TDCF_SZ_V1		24
+
+#define USAGE_STRING \
+	"\t[OPTIONS]\n" \
+	"\t -i <instance_path>\t\tUse this device instance path. Default: /dev/scmi/tlm_0\n" \
+	"\t[COMMANDS]\n" \
+	"\t info [full] - Display summarized (or full) configuration and information data\n" \
+	"\t query - Query ALL possible IOCTLs for resources (item=0)\n" \
+	"\t uuids - UUIDs dump\n" \
+	"\t monitor [detach] - Monitor Generation counter\n" \
+	"\t shmti [check][dump <sid>][decode <sid>] - SHMTI operations\n" \
+	"\t\t check - Sanity check of all SHMTis\n" \
+	"\t\t dump [<sid>] - Binary dump of <sid> or all SHMTI areas\n" \
+	"\t\t decode [<sid>] - Line-by-line decode of <sid> or all SHMTI areas\n" \
+	"\t des [<de_id>] - Display detailed DEs info, config and data\n" \
+	"\t groups - Display detailed GROUPS info and config data\n" \
+	"\t cfg [SUB-COMMANDS] - Configure Telemetry\n" \
+	"\t\t tlm on|off - Enable or disable Telemetry as a whole\n" \
+	"\t\t update <msecs> - Set global update interval\n" \
+	"\t\t all_des [[on|off]:[on|off]] - Enable or disable ALL DEs with or wout TS\n" \
+	"\t\t de [<de_id> [[on|off]:[on|off]]] - Get/Set configuration of one or ALL de\n" \
+	"\t\t group [<grp_id>] [[on|off]:[on|off]:[<update_msecs>]] - Get/Set GROUP configuration\n" \
+	"\t single - Perform a single sample read\n" \
+	"\t bulk - Perform a bulk read\n" \
+	"\t batch <de_id> [de_id [de_id]... ] - Perform a batch read of the DE IDs listed in input\n" \
+	"\t reset - Perform a Telemetry subsytem reset platform-side\n"
+
+struct tlm_de {
+	struct scmi_tlm_de_info *info;
+	struct scmi_tlm_de_config cfg;
+	struct scmi_tlm_de_sample sample;
+};
+
+struct tlm_group {
+	int fd;
+	struct scmi_tlm_grp_info *info;
+	struct scmi_tlm_grp_desc *desc;
+	struct scmi_tlm_intervals *ivs;
+};
+
+struct tlm_state {
+	int fd;
+	const char *path;
+	struct scmi_tlm_abi_info info;
+	struct scmi_tlm_config cfg;
+	struct scmi_tlm_intervals *ivs;
+	struct scmi_tlm_batch *shmtis;
+	unsigned int num_des;
+	struct tlm_de *des;
+	unsigned int num_groups;
+	struct tlm_group *grps;
+};
+
+struct parsed_args {
+	const char *instance;
+	const char *cmd;
+	unsigned int cnt;
+	char **opts;
+};
+
+static const char *argv0;
+
+static inline void dump_des(struct tlm_state *st, uint32_t *de_id)
+{
+	fprintf(stdout, "\n+ %s #%d DEs:\n",
+		!de_id ? "Found" : "Lookup",
+		!de_id ? st->num_des : 1);
+
+	for (int i = 0; i < st->num_des; i++) {
+		if (de_id && st->des[i].info->id != *de_id)
+			continue;
+
+		fprintf(stdout, "\t[0x%08X][%s]\n",
+			st->des[i].info->id, st->des[i].info->name);
+		fprintf(stdout, "\t\tGRP_ID:0x%08X  SZ:%u  TYPE:%u  UNIT:%u  UNIT_EXP:%d  TS_RATE:%d\n",
+			st->des[i].info->grp_id, st->des[i].info->data_sz,
+			st->des[i].info->type, st->des[i].info->unit,
+			st->des[i].info->unit_exp, st->des[i].info->ts_rate);
+		fprintf(stdout, "\t\tINST_ID:%u  COMPO_ID:%u  COMPO_TYPE:%u  PERSIST:%u\n\n",
+			st->des[i].info->instance_id, st->des[i].info->compo_instance_id,
+			st->des[i].info->compo_type, st->des[i].info->persistent);
+	}
+	fprintf(stdout, "\n");
+
+	for (int i = 0; i < st->num_des; i++) {
+		struct tlm_de *de = &st->des[i];
+
+		if (de_id && de->info->id != *de_id)
+			continue;
+
+		/* Collect fresh sample */
+		if (de->cfg.enable) {
+			int ret;
+
+			de->sample.id = de->info->id;
+			ret = ioctl(st->fd, SCMI_TLM_DE_READ, &de->sample);
+			if (ret)
+				perror(IOCTL_ERR_STR(SCMI_TLM_DE_READ));
+		}
+
+		fprintf(stdout, "\t[0x%08X][%s]\t\t%s %s\n\t\t-->> TS:%16llu %016llX\n",
+			de->info->id, de->info->name,
+			de->cfg.enable ? "ON" : "OFF",
+			de->cfg.t_enable ? "/TS_ON " : "/TS_OFF",
+			de->sample.tstamp, de->sample.val);
+	}
+	fprintf(stdout, "\n");
+}
+
+static inline void usage(const char *program_name)
+{
+	printf("Usage: %s [OPTIONS] [CMD [CMD_OPTS]...]\n", program_name);
+	printf("%s", USAGE_STRING);
+}
+
+static int cmd_unknown(const char *cmd)
+{
+	fprintf(stderr, "Unknown command '%s'\n", cmd);
+	usage(argv0);
+
+	return EXIT_FAILURE;
+}
+
+static inline int cmd_dump_des(struct tlm_state *st, struct parsed_args *args)
+{
+	uint32_t id, *de = NULL;
+
+	if (args && args->cnt) {
+		id = strtoul(args->opts[0], NULL, 0);
+		if (id == ULONG_MAX || errno == EINVAL) {
+			fprintf(stderr, "\n+ BAD DE_ID: %s\n", args->opts[0]);
+			return 0;
+		}
+
+		de = &id;
+	}
+
+	dump_des(st, de);
+
+	return 0;
+}
+
+static inline int cmd_dump_groups(struct tlm_state *st)
+{
+	fprintf(stdout, "\n+ Found %d GRPs: ", st->num_groups);
+	for (int i = 0; i < st->num_groups; i++) {
+		struct scmi_tlm_update_interval *grp_intrvs;
+		struct tlm_group *grp = &st->grps[i];
+		uint32_t *composing_des;
+
+		fprintf(stdout, "\n\tGRP_ID:%d  DES#:%d  INTRVS#:%d %s\n",
+			grp->info->grp_id, grp->info->num_des,
+			grp->info->num_intervals,
+			!grp->ivs ? "(---)" :
+			((grp->ivs->flags & SCMI_TLM_INTERV_DISCRETE) ? "(DISCRETE)" : ""));
+
+		fprintf(stdout, "\tGRP Intervals:\n");
+		if (grp->ivs) {
+			grp_intrvs = (struct scmi_tlm_update_interval *)grp->ivs->intervals;
+			for (int j = 0; j < grp->ivs->num_intervals; j++)
+				fprintf(stdout, "\t[%d]::%u,%d\n", j,
+					grp_intrvs[j].secs, grp_intrvs[j].exp);
+		}
+
+		composing_des = (uint32_t *)grp->desc->composing_des;
+		fprintf(stdout, "\tCOMPOSING_DES:");
+		for (int j = 0; j < grp->desc->num_des; j++)
+			fprintf(stdout, "0x%08X ", composing_des[j]);
+		fprintf(stdout, "\n");
+	}
+
+	return 0;
+}
+
+static void print_uuid(const char *prefix, void *arg)
+{
+	unsigned char *uuid = arg;
+
+	fprintf(stdout, "%s", prefix);
+	for (int i = 0; i < SCMI_TLM_DE_IMPL_UUID_SZ; i++) {
+		fprintf(stdout, "%02X", uuid[i]);
+		switch (i) {
+		case 3:
+		case 5:
+		case 7:
+		case 9:
+			fprintf(stdout, "%c", '-');
+			break;
+		case 15:
+			fprintf(stdout, "%c", '\n');
+			break;
+		}
+	}
+}
+
+static inline int cmd_dump_state(struct tlm_state *st, struct parsed_args *args)
+{
+	struct scmi_tlm_update_interval *intervals;
+	struct scmi_tlm_shmti_info *shinfo;
+
+	fprintf(stdout, "- SYSTEM TELEMETRY @instance: %s\n\n", st->path);
+	fprintf(stdout, "+ ABI Version: %u\n", st->info.abi_version);
+	fprintf(stdout, "+ ABI Features: 0x%04X\n", st->info.abi_features);
+	fprintf(stdout, "\t (RESET:%u",
+		!!(st->info.abi_features & SCMI_TLM_ABI_FEAT_RESET));
+	fprintf(stdout, " EVENT:%u",
+		!!(st->info.abi_features & SCMI_TLM_ABI_FEAT_EVENT));
+	fprintf(stdout, " UUID_LIST:%u",
+		!!(st->info.abi_features & SCMI_TLM_ABI_FEAT_UUID_LIST));
+	fprintf(stdout, " BATCH_STATE:%u",
+		!!(st->info.abi_features & SCMI_TLM_ABI_FEAT_BATCH_STATE));
+	fprintf(stdout, " BATCHED_CFG:%u",
+		!!(st->info.abi_features & SCMI_TLM_ABI_FEAT_BATCHED_CFG));
+	fprintf(stdout, " DE_TRACKING:%u)\n",
+		!!(st->info.abi_features & SCMI_TLM_ABI_FEAT_DE_TRACKING));
+	fprintf(stdout, "+ SCMI Features: 0x%04X\n", st->info.features);
+	fprintf(stdout, "\t (RESET:%u",
+		!!(st->info.features & SCMI_TLM_SCMI_SUPPORT_RESET));
+	fprintf(stdout, " SINGLE_SAMPLE:%u",
+		!!(st->info.features & SCMI_TLM_SCMI_SUPPORT_SINGLE_SAMPLE));
+	fprintf(stdout, " GROUP_CONFIG:%u",
+		!!(st->info.features & SCMI_TLM_SCMI_SUPPORT_GROUP_CONFIG));
+	fprintf(stdout, " UPDATE_NOTIFICATIONS:%u)\n",
+		!!(st->info.features & SCMI_TLM_SCMI_SUPPORT_UPDATE_NOTIFICATION));
+	fprintf(stdout, "+ DEs#: %d\n", st->info.num_des);
+	fprintf(stdout, "+ GRPS#: %d\n", st->info.num_groups);
+	fprintf(stdout, "+ INTRV#: %d %s\n", st->info.num_intervals,
+		(st->ivs->flags & SCMI_TLM_INTERV_DISCRETE) ? "(DISCRETE)" : "");
+	fprintf(stdout, "+ SHMTIS#: %d\n", st->info.num_shmtis);
+
+	print_uuid("+ Primary UUID: ", &st->info.primary_de_impl_version[0]);
+	fprintf(stdout, "\n+ TLM_ENABLED: %d\n", st->cfg.enable);
+	fprintf(stdout, "+ CURRENT_UPDATE_INTERVAL: %u,%d\n",
+		st->cfg.active.secs, st->cfg.active.exp);
+
+	fprintf(stdout, "\n+ Found #%u Global Update Intervals\n",
+		st->ivs->num_intervals);
+	intervals = (struct scmi_tlm_update_interval *)st->ivs->intervals;
+	for (int i = 0; i < st->ivs->num_intervals; i++)
+		fprintf(stdout, "\t[%d]::%u,%d\n", i,
+			intervals[i].secs, intervals[i].exp);
+
+	fprintf(stdout, "\n+ Found #%u SHMTI areas\n",
+		st->shmtis ? st->shmtis->num_items : 0);
+	if (st->shmtis) {
+		shinfo = (struct scmi_tlm_shmti_info *)st->shmtis->items;
+		for (int i = 0; i < st->shmtis->num_items; i++)
+			fprintf(stdout, "\t[%d]:: FD:%u  LEN:%u\n",
+				shinfo[i].sid, shinfo[i].fd, shinfo[i].len);
+	}
+
+	if (st->info.num_des != st->num_des) {
+		fprintf(stdout, "\n++++++ DES NOT FULLY_ENUMERATED ++++++\n");
+		fprintf(stdout, "+++ DECLARED:%u  ENUMERATED:%u +++\n",
+			st->info.num_des, st->num_des);
+	}
+
+	if (args && args->cnt && args->opts &&
+	    !strncmp(args->opts[0], "full", strlen(args->opts[0]))) {
+		cmd_dump_des(st, NULL);
+		cmd_dump_groups(st);
+	}
+
+	return 0;
+}
+
+static int discover_base_info(int fd, struct scmi_tlm_abi_info *info)
+{
+	int ret;
+
+	info->size = sizeof(*info);
+	ret = ioctl(fd, SCMI_TLM_GET_ABI_INFO, info);
+	if (ret < 0) {
+		perror(IOCTL_ERR_STR(SCMI_TLM_GET_ABI_INFO));
+		return -errno;
+	}
+
+	return 0;
+}
+
+static int
+query_items(int fd, unsigned long ioctl_op, size_t item_sz, const char *tag)
+{
+	struct scmi_tlm_batch query = {};
+	int ret;
+
+	query.item_sz = item_sz;
+	ret = ioctl(fd, ioctl_op, &query);
+	if (ret < 0) {
+		perror(tag);
+		return -errno;
+	}
+
+	fprintf(stdout, "--- [QUERY]:[%s] -> NUM_ITEMS:%u\n",
+		tag, query.num_items);
+
+	return 0;
+}
+
+static inline struct scmi_tlm_batch *
+batch_buffer_alloc(int num_items, size_t item_sz, bool need_status)
+{
+	struct scmi_tlm_batch *batch;
+	size_t batch_sz, all_items_sz;
+	void *items;
+
+	batch_sz = sizeof(*batch);
+	batch = malloc(batch_sz);
+	if (!batch)
+		return NULL;
+
+	bzero(batch, batch_sz);
+	batch->num_items = num_items;
+
+	batch->item_sz = item_sz;
+	all_items_sz = batch->num_items * batch->item_sz;
+	items = malloc(all_items_sz);
+	if (!items) {
+		free(batch);
+		return NULL;
+	}
+
+	bzero(items, all_items_sz);
+	batch->items = (uint64_t)items;
+
+	if (need_status) {
+		int *states;
+		size_t states_sz = sizeof(*states) * batch->num_items;
+
+		states = malloc(states_sz);
+		if (!states) {
+			free(items);
+			free(batch);
+			return NULL;
+		}
+
+		bzero(states, states_sz);
+		batch->states = (uint64_t)states;
+	}
+
+	return batch;
+}
+
+static struct scmi_tlm_batch *scmi_get_des_list(int fd, int num_des)
+{
+	struct scmi_tlm_de_info *dei;
+	struct scmi_tlm_batch *batch;
+	int ret;
+
+	batch = batch_buffer_alloc(num_des, sizeof(*dei), false);
+	if (!batch)
+		return NULL;
+
+	ret = ioctl(fd, SCMI_TLM_GET_DE_LIST, batch);
+	if (ret) {
+		perror(IOCTL_ERR_STR(SCMI_TLM_GET_DE_LIST));
+		free(batch);
+		return NULL;
+	}
+
+	return batch;
+}
+
+static struct tlm_de *enumerate_des(struct tlm_state *st)
+{
+	struct scmi_tlm_batch *des_batch;
+	struct tlm_de *des;
+	int num_items;
+
+	des_batch = scmi_get_des_list(st->fd, st->info.num_des);
+	if (!des_batch)
+		return NULL;
+
+	num_items = des_batch->num_items;
+	des = malloc(sizeof(*des) * num_items);
+	if (!des) {
+		free(des_batch);
+		return NULL;
+	}
+
+	bzero(des, sizeof(*des) * num_items);
+
+	for (int i = 0; i < num_items; i++) {
+		struct tlm_de *de = &des[i];
+		struct scmi_tlm_batch batch = {};
+		int ret;
+
+		de->info = &(((struct scmi_tlm_de_info *)des_batch->items)[i]);
+		de->cfg.id = de->info->id;
+
+		batch.num_items = 1;
+		batch.item_sz = sizeof(de->cfg);
+		batch.items = (uint64_t)&de->cfg;
+
+		ret = ioctl(st->fd, SCMI_TLM_GET_DE_CFG, &batch);
+		if (ret) {
+			perror(IOCTL_ERR_STR(SCMI_TLM_GET_DE_CFG));
+			free(des);
+			free(des_batch);
+			return NULL;
+		}
+	}
+
+	/* On failure st->num_des remains zero */
+	st->num_des = num_items;
+
+	return des;
+}
+
+static int get_current_config(int fd, struct scmi_tlm_config *cfg)
+{
+	int ret;
+
+	ret = ioctl(fd, SCMI_TLM_GET_CFG, cfg);
+	if (ret < 0) {
+		perror(IOCTL_ERR_STR(SCMI_TLM_GET_CFG));
+		return -errno;
+	}
+
+	return 0;
+}
+
+static struct scmi_tlm_batch *scmi_get_grps_list(int fd, int num_groups)
+{
+	struct scmi_tlm_batch *batch;
+	int ret;
+
+	batch = batch_buffer_alloc(num_groups, sizeof(struct scmi_tlm_grp_info),
+				   false);
+	if (!batch)
+		return NULL;
+
+	ret = ioctl(fd, SCMI_TLM_GET_GRP_LIST, batch);
+	if (ret) {
+		perror(IOCTL_ERR_STR(SCMI_TLM_GET_GRP_LIST));
+		free(batch);
+		return NULL;
+	}
+
+	return batch;
+}
+
+static struct scmi_tlm_intervals *
+enumerate_intervals(int fd, int num_intervals, unsigned int *grp_id)
+{
+	struct scmi_tlm_update_interval *intervs;
+	struct scmi_tlm_intervals *ivs;
+	size_t sz, i_sz;
+	int ret;
+
+	sz = sizeof(*ivs);
+	ivs = malloc(sz);
+	if (!ivs)
+		return NULL;
+
+	bzero(ivs, sz);
+
+	i_sz = sizeof(*intervs) * num_intervals;
+	intervs = malloc(i_sz);
+	if (!intervs) {
+		free(ivs);
+		return NULL;
+	}
+
+	bzero(intervs, i_sz);
+
+	ivs->num_intervals = num_intervals;
+	ivs->intervals = (uint64_t)intervs;
+	if (grp_id) {
+		ivs->grp_id = *grp_id;
+		ivs->flags = SCMI_TLM_INTERV_GROUP;
+	}
+
+	ret = ioctl(fd, SCMI_TLM_GET_INTRVS, ivs);
+	if (ret < 0) {
+		perror(IOCTL_ERR_STR(SCMI_TLM_GET_INTRVS));
+		free(ivs);
+		free(intervs);
+		return NULL;
+	}
+
+	return ivs;
+}
+
+static struct scmi_tlm_batch *enumerate_shmtis(struct tlm_state *st)
+{
+	struct scmi_tlm_batch *batch;
+	int ret;
+
+	batch = batch_buffer_alloc(st->info.num_shmtis,
+				   sizeof(struct scmi_tlm_shmti_info), false);
+	if (!batch)
+		return NULL;
+
+	ret = ioctl(st->fd, SCMI_TLM_GET_SHMTI_LIST, batch);
+	if (ret < 0) {
+		perror(IOCTL_ERR_STR(SCMI_TLM_GET_SHMTI_LIST));
+		free(batch);
+		return NULL;
+	}
+
+	return batch;
+}
+
+static struct tlm_group *enumerate_groups(struct tlm_state *st)
+{
+	struct scmi_tlm_batch *grps_batch;
+	struct tlm_group *grps;
+	int num_items;
+
+	grps_batch = scmi_get_grps_list(st->fd, st->info.num_groups);
+	if (!grps_batch)
+		return NULL;
+
+	num_items = grps_batch->num_items;
+	grps = malloc(sizeof(*grps) * num_items);
+	if (!grps) {
+		free(grps_batch);
+		return NULL;
+	}
+
+	bzero(grps, sizeof(*grps) * num_items);
+	for (int i = 0; i < num_items; i++) {
+		struct tlm_group *grp = &grps[i];
+		size_t size, composing_sz;
+		uint32_t *composing_des;
+		int ret;
+
+		grp->info = &(((struct scmi_tlm_grp_info *)grps_batch->items)[i]);
+		size = sizeof(*grp->desc);
+		grp->desc = malloc(size);
+		if (!grp->desc) {
+			free(grps);
+			free(grps_batch);
+			return NULL;
+		}
+
+		bzero(grp->desc, size);
+		composing_sz = sizeof(uint32_t) * grp->info->num_des;
+		composing_des = malloc(composing_sz);
+		if (!composing_des) {
+			free(grp->desc);
+			free(grps);
+			free(grps_batch);
+			return NULL;
+		}
+
+		grp->desc->grp_id = grp->info->grp_id;
+		grp->desc->num_des = grp->info->num_des;
+		grp->desc->composing_des = (uint64_t)composing_des;
+		ret = ioctl(st->fd, SCMI_TLM_GET_GRP_DESC, grp->desc);
+		if (ret < 0) {
+			perror(IOCTL_ERR_STR(SCMI_TLM_GET_GRP_DESC));
+			free(composing_des);
+			free(grp->desc);
+			free(grps);
+			free(grps_batch);
+			return NULL;
+		}
+
+		grp->ivs = enumerate_intervals(st->fd, grp->info->num_intervals,
+					       &grp->info->grp_id);
+	}
+
+	/* On failure st->num_groups remains zero */
+	st->num_groups = num_items;
+
+	return grps;
+}
+
+static int gather_tlm_state(struct tlm_state *st)
+{
+	int ret;
+
+	ret = discover_base_info(st->fd, &st->info);
+	if (ret)
+		return ret;
+
+	st->ivs = enumerate_intervals(st->fd, st->info.num_intervals, NULL);
+	if (!st->ivs) {
+		fprintf(stderr, "Failed to enumerate Global Intervals. Abort.\n");
+		return -1;
+	}
+
+	ret = get_current_config(st->fd, &st->cfg);
+	if (ret)
+		return ret;
+
+	if (st->info.num_des) {
+		st->des = enumerate_des(st);
+		if (!st->des)
+			fprintf(stderr, "Failed to enumerate DES\n");
+	}
+
+	if (st->info.num_groups) {
+		st->grps = enumerate_groups(st);
+		if (!st->grps)
+			fprintf(stderr, "Failed to enumerate GROUPS\n");
+	}
+
+	if (st->info.num_shmtis) {
+		st->shmtis = enumerate_shmtis(st);
+		if (!st->shmtis)
+			fprintf(stderr, "Failed to enumerate SHMTIS\n");
+	}
+
+	return 0;
+}
+
+static struct tlm_state *open_session(const char *path)
+{
+	struct tlm_state *st;
+
+	st = malloc(sizeof(*st));
+	if (!st)
+		return NULL;
+
+	bzero(st, sizeof(*st));
+	st->fd = open(path, O_RDWR);
+	if (st->fd < 0) {
+		perror("open");
+		free(st);
+		return NULL;
+	}
+
+	st->path = path;
+
+	return st;
+}
+
+static ssize_t tdcf_dump(const void *tdcf, size_t len)
+{
+	ssize_t read_bytes = 0;
+
+	do {
+		ssize_t bytes;
+
+		bytes = write(1, tdcf + read_bytes, len - read_bytes);
+		if (bytes < 0) {
+			read_bytes = -1;
+			break;
+		}
+		read_bytes += bytes;
+	} while (read_bytes < len);
+
+	return read_bytes;
+}
+
+static int dump_shmti(struct scmi_tlm_shmti_info *shmti, bool decode)
+{
+	ssize_t read_bytes = 0;
+	void *tdcf;
+	unsigned int len;
+
+	if (shmti->len < MIN_TDCF_SZ_V1) {
+		fprintf(stderr,
+			"Skipping malformed SHMTI - SID:%u  LEN:%u  OFFSET:%u\n",
+			shmti->sid, shmti->len, shmti->offset);
+			return -1;
+	}
+
+	len = shmti->len + shmti->offset;
+	tdcf = mmap(NULL, len, PROT_READ, MAP_SHARED, shmti->fd, 0);
+	if (tdcf == MAP_FAILED) {
+		fprintf(stderr, "%s\n", strerror(errno));
+		return -1;
+	}
+
+	if (decode)
+		read_bytes = tdcf_decode(tdcf + shmti->offset, shmti->len);
+	else
+		read_bytes = tdcf_dump(tdcf + shmti->offset, shmti->len);
+
+	munmap(tdcf, len);
+
+	return read_bytes;
+}
+
+static int shmti_dump(struct tlm_state *st, struct parsed_args *args, bool decode)
+{
+	struct scmi_tlm_shmti_info *shmti;
+	unsigned long first, last;
+
+	if (!st->shmtis || !st->shmtis->num_items)
+		return 0;
+
+	if (args->cnt > 1) {
+		first = last = strtoul(args->opts[1], NULL, 0);
+		if (first == ULONG_MAX || errno == EINVAL ||
+		    first >= st->shmtis->num_items) {
+			fprintf(stderr, "Invalid SHMTI ID: %lu\n", first);
+			return -1;
+		}
+	} else {
+		first = 0;
+		last = st->shmtis->num_items - 1;
+	}
+
+	for (int sid = first; sid <= last; sid++) {
+		int ret;
+
+		shmti = &(((struct scmi_tlm_shmti_info *)(st->shmtis->items))[sid]);
+		fprintf(stderr, "\nBinary %s of SHMTI[%u] LEN:%u\n",
+			decode ? "DECODE" : "DUMP", shmti->sid, shmti->len);
+
+		ret = dump_shmti(shmti, decode);
+		if (!ret)
+			fprintf(stderr, "...FAILED DUMP of SHMTI[%u] !!!\n", sid);
+	}
+
+	return 0;
+}
+
+static int shmti_check(struct tlm_state *st, struct parsed_args *args)
+{
+	struct scmi_tlm_shmti_info *shmtis;
+
+	if (!st->shmtis)
+		return 0;
+
+	shmtis = (struct scmi_tlm_shmti_info *)st->shmtis->items;
+
+	fprintf(stdout, "\n- SHMTI mmap SANITY CHECK -\n-------------------\n");
+
+	for (int i = 0; i < st->shmtis->num_items; i++) {
+		unsigned long *start, *end;
+		unsigned int len;
+		void *tdcf;
+		char *buf;
+
+		if (shmtis[i].len < MIN_TDCF_SZ_V1) {
+			fprintf(stdout,
+				"Skipping malformed SHMTI[%u] - SID:%u  LEN:%u  OFFSET:%u\n",
+				i, shmtis[i].sid, shmtis[i].len, shmtis[i].offset);
+			continue;
+		}
+
+		fprintf(stdout, "Mapping SHMTI[%u] - SID:%u  LEN:%u  FD:%u  OFFS:%u\n",
+			i, shmtis[i].sid, shmtis[i].len, shmtis[i].fd, shmtis[i].offset);
+
+		len = shmtis[i].len + shmtis[i].offset;
+		tdcf = mmap(NULL, len, PROT_READ, MAP_SHARED, shmtis[i].fd, 0);
+		if (tdcf == MAP_FAILED) {
+			fprintf(stderr, "%s\n", strerror(errno));
+			return -1;
+		}
+
+		start = tdcf + shmtis[i].offset;
+		end = (void *)start + shmtis[i].len;
+
+		fprintf(stdout, "-----------------------------------------------------\n");
+		fprintf(stdout, "Mapped SHMTI - SID:%u  %u@%p\n",
+			shmtis[i].sid, shmtis[i].offset, tdcf);
+
+		buf = (char *)start;
+		for (int j = 0; j < 4; j++)
+			fprintf(stdout, "%c ", buf[j]);
+
+		fprintf(stdout, " ===> ");
+
+		buf = ((char *)end) - 4;
+		for (int j = 0 ; j < 4; j++)
+			fprintf(stdout, "%c ", buf[j]);
+		fprintf(stdout, "\n-----------------------------------------------------\n");
+
+		munmap(tdcf, len);
+	}
+
+	return 0;
+}
+
+static int cmd_shmti_ops(struct tlm_state *st, struct parsed_args *args)
+{
+	if (!args->cnt || !args->opts)
+		return cmd_unknown("_");
+
+	if (!strncmp(args->opts[0], "dump", strlen(args->opts[0])))
+		return shmti_dump(st, args, false);
+	if (!strncmp(args->opts[0], "check", strlen(args->opts[0])))
+		return shmti_check(st, args);
+	if (!strncmp(args->opts[0], "decode", strlen(args->opts[0])))
+		return shmti_dump(st, args, true);
+
+	return cmd_unknown(args->opts[0]);
+}
+
+static int parse_options(int argc, char **argv, struct parsed_args *args)
+{
+	int opt = 0;
+
+	/* Set defaults */
+	args->instance = "/dev/scmi/tlm_0";
+	while ((opt = getopt(argc, argv, "i:h")) != -1) {
+		switch (opt) {
+		case 'i':
+			args->instance = optarg;
+			break;
+		case 'h':
+		default:
+			return -EINVAL;
+		}
+	}
+
+	if (optind <= argc) {
+		if (optind < argc - 1) {
+			args->cnt = argc - 1 - optind;
+			args->opts = malloc(sizeof(*args->opts) * args->cnt);
+			if (!args->opts)
+				return -1;
+		}
+
+		args->cmd = argv[optind];
+		for (int i = 0, j = optind + 1; j < argc; i++, j++)
+			args->opts[i] = argv[j];
+	}
+
+	return 0;
+}
+
+static inline struct scmi_tlm_data_read *bulk_buffer_alloc(struct tlm_state *st)
+{
+	struct scmi_tlm_de_sample *samples;
+	struct scmi_tlm_data_read *bulk;
+	size_t bulk_sz, samples_sz;
+
+	bulk_sz = sizeof(*bulk);
+	bulk = malloc(bulk_sz);
+	if (!bulk)
+		return NULL;
+
+	bzero(bulk, bulk_sz);
+	samples_sz = st->info.num_des * sizeof(*samples);
+	samples = malloc(samples_sz);
+	if (!samples) {
+		free(bulk);
+		return NULL;
+	}
+
+	bzero(samples, samples_sz);
+	bulk->samples = (uint64_t)samples;
+	bulk->num_samples = st->info.num_des;
+
+	return bulk;
+}
+
+static int cmd_single_read(struct tlm_state *st)
+{
+	struct scmi_tlm_de_sample *samples;
+	struct scmi_tlm_data_read *bulk;
+	int ret;
+
+	bulk = bulk_buffer_alloc(st);
+	if (!bulk)
+		return -1;
+
+	ret = ioctl(st->fd, SCMI_TLM_SINGLE_READ, bulk);
+	if (ret < 0) {
+		perror(IOCTL_ERR_STR(SCMI_TLM_SINGLE_READ));
+		return -errno;
+	}
+
+	fprintf(stdout, "\n- Single ASYNC read -\n-------------------\n");
+	samples = (struct scmi_tlm_de_sample *)bulk->samples;
+	for (int i = 0; i < bulk->num_samples; i++)
+		fprintf(stdout, "0x%08X %016llu %016llX\n",
+			samples[i].id, samples[i].tstamp, samples[i].val);
+
+	return 0;
+}
+
+static int cmd_bulk_read(struct tlm_state *st)
+{
+	struct scmi_tlm_de_sample *samples;
+	struct scmi_tlm_data_read *bulk;
+	int ret;
+
+	bulk = bulk_buffer_alloc(st);
+	if (!bulk)
+		return -1;
+
+	ret = ioctl(st->fd, SCMI_TLM_BULK_READ, bulk);
+	if (ret < 0) {
+		perror(IOCTL_ERR_STR(SCMI_TLM_BULK_READ));
+		return -errno;
+	}
+
+	fprintf(stdout, "\n- BULK read -\n-------------------\n");
+	samples = (struct scmi_tlm_de_sample *)bulk->samples;
+	for (int i = 0; i < bulk->num_samples; i++)
+		fprintf(stdout, "0x%08X %016llu %016llX\n",
+			samples[i].id, samples[i].tstamp, samples[i].val);
+
+	return 0;
+}
+
+static int cmd_tlm_reset(struct tlm_state *st)
+{
+	int ret;
+
+	ret = ioctl(st->fd, SCMI_TLM_RESET);
+	if (ret < 0) {
+		perror(IOCTL_ERR_STR(SCMI_TLM_RESET));
+		return -errno;
+	}
+
+	fprintf(stdout, "\n--- TLM RESET ISSUED\n");
+
+	return 0;
+}
+
+static int cmd_batch_read(struct tlm_state *st, struct parsed_args *args)
+{
+	struct scmi_tlm_de_sample *samples;
+	struct scmi_tlm_batch *batch;
+	int ret;
+
+	if (!args->opts || !args->cnt)
+		return -EINVAL;
+
+	if (args->cnt > st->info.num_des)
+		return -ENOSPC;
+
+	/* Allocate for full size with status */
+	batch = batch_buffer_alloc(st->info.num_des, sizeof(*samples), true);
+	if (!batch)
+		return -1;
+
+	samples = (struct scmi_tlm_de_sample *)batch->items;
+	batch->num_items = args->cnt;
+	for (int i = 0; i < batch->num_items; i++) {
+		unsigned long val;
+
+		val = strtoul(args->opts[i], NULL, 0);
+		if (val == ULONG_MAX || errno == EINVAL)
+			continue;
+
+		samples[i].id = (unsigned int)val;
+	}
+
+	ret = ioctl(st->fd, SCMI_TLM_BATCH_READ, batch);
+	if (ret < 0) {
+		perror(IOCTL_ERR_STR(SCMI_TLM_BATCH_READ));
+		return -errno;
+	}
+
+	fprintf(stdout, "\n- BATCH read -\n-------------------\n");
+	for (int i = 0; i < batch->num_items; i++)
+		fprintf(stdout, "STATUS[%d] => 0x%08X %016llu %016llX\n",
+			((uint32_t *)batch->states)[i],
+			samples[i].id, samples[i].tstamp, samples[i].val);
+
+	return 0;
+}
+
+/*
+ * <ena>:<t_ena>[:<update_msecs>]
+ */
+static void
+parse_item_cfg(char *str, bool *ena, bool *t_ena, unsigned int *update)
+{
+	char *tok;
+
+	if (!ena)
+		return;
+
+	*ena = false;
+	tok = strtok(str, ":");
+	if (tok)
+		*ena = strncmp(tok, "on", strlen(tok)) == 0;
+
+	if (!t_ena)
+		return;
+
+	*t_ena = false;
+	tok = strtok(NULL, ":");
+	if (tok)
+		*t_ena = strncmp(tok, "on", strlen(tok)) == 0;
+
+	if (!update)
+		return;
+
+	tok = strtok(NULL, ":");
+	if (tok) {
+		unsigned long val;
+
+		val = strtoul(tok, NULL, 0);
+		if (val == ULONG_MAX || errno == EINVAL)
+			return;
+
+		*update = (unsigned int)val;
+	}
+}
+
+static int configure_all_des(struct tlm_state *st, struct parsed_args *args)
+{
+	struct scmi_tlm_de_config de_cfg = {};
+	bool ena, t_ena;
+	int ret;
+
+	if (!args->opts)
+		return -1;
+
+	ret = ioctl(st->fd, SCMI_TLM_GET_ALL_CFG, &de_cfg);
+	if (ret < 0) {
+		perror(IOCTL_ERR_STR(SCMI_TLM_GET_ALL_CFG));
+		return -errno;
+	}
+
+	fprintf(stdout, "--- [GET] ALL DEs ON:%d  T_ON:%d\n",
+		de_cfg.enable, de_cfg.t_enable);
+
+	if (args->cnt < 2)
+		return 0;
+
+	parse_item_cfg(args->opts[1], &ena, &t_ena, NULL);
+	de_cfg.enable = !!ena;
+	de_cfg.t_enable = !!t_ena;
+
+	fprintf(stdout, "--- [SET] ALL DEs ON:%d  T_ON:%d\n",
+		de_cfg.enable, de_cfg.t_enable);
+
+	ret = ioctl(st->fd, SCMI_TLM_SET_ALL_CFG, &de_cfg);
+	if (ret < 0) {
+		perror(IOCTL_ERR_STR(SCMI_TLM_SET_ALL_CFG));
+		return -errno;
+	}
+
+	return 0;
+}
+
+static int de_config_batch_get(struct tlm_state *st, struct scmi_tlm_batch *batch)
+{
+	int ret;
+
+	/* Get current config */
+	ret = ioctl(st->fd, SCMI_TLM_GET_DE_CFG, batch);
+	if (ret < 0) {
+		perror(IOCTL_ERR_STR(SCMI_TLM_GET_DE_CFG));
+		return -errno;
+	}
+
+	return 0;
+}
+
+static int configure_de(struct tlm_state *st, struct parsed_args *args)
+{
+	struct scmi_tlm_de_config *de_cfg;
+	struct scmi_tlm_batch *batch;
+	bool ena, t_ena;
+	unsigned long val;
+	int ret, *states;
+
+	if (!args->opts)
+		return -1;
+
+	if (args->cnt < 2) {
+		/*
+		 * Bail-out to avoid issuing a query-0 which is not what
+		 * intended here
+		 */
+		if (!st->num_des)
+			return 0;
+
+		batch = batch_buffer_alloc(st->num_des, sizeof(*de_cfg), true);
+		if (!batch)
+			return -1;
+
+		/* Dump all DE configs */
+		de_cfg = (struct scmi_tlm_de_config *)batch->items;
+		for (int i = 0; i < st->num_des; i++)
+			de_cfg[i].id = st->des[i].info->id;
+
+		ret = de_config_batch_get(st, batch);
+		if (ret)
+			return ret;
+
+		states = (int *)batch->states;
+		for (int i = 0; i < batch->num_items; i++) {
+			fprintf(stdout,
+				"--- [GET] STATUS[%d] -> DE:0x%08X  ON:%d  T_ON:%d  SID:%u  OFFS:%u",
+				states[i], de_cfg[i].id, de_cfg[i].enable,
+				de_cfg[i].t_enable, de_cfg[i].sid, de_cfg[i].offset);
+				print_uuid("  UUID: ", &de_cfg[i].uuid[0]);
+				fprintf(stdout, "\n");
+		}
+
+		return 0;
+	}
+
+	/*Dump one DE config */
+	batch = batch_buffer_alloc(1, sizeof(*de_cfg), true);
+	if (!batch)
+		return -1;
+
+	states = (int *)batch->states;
+	de_cfg = (struct scmi_tlm_de_config *)batch->items;
+	val = strtoul(args->opts[1], NULL, 0);
+	if (val == ULONG_MAX || errno == EINVAL)
+		return -1;
+
+	de_cfg[0].id = (unsigned int)val;
+	ret = de_config_batch_get(st, batch);
+	if (ret)
+		return ret;
+
+	fprintf(stdout, "--- [GET] STATUS[%d] -> DE:0x%08X  ON:%d  T_ON:%d  SID:%u  OFFS:%u",
+		states[0], de_cfg[0].id, de_cfg[0].enable,
+		de_cfg[0].t_enable, de_cfg[0].sid, de_cfg[0].offset);
+	print_uuid("  UUID: ", &de_cfg[0].uuid[0]);
+	fprintf(stdout, "\n");
+
+	if (args->cnt < 3)
+		return 0;
+
+	/* Configure one DE */
+	parse_item_cfg(args->opts[2], &ena, &t_ena, NULL);
+	de_cfg[0].enable = !!ena;
+	de_cfg[0].t_enable = !!t_ena;
+
+	ret = ioctl(st->fd, SCMI_TLM_SET_DE_CFG, batch);
+	if (ret < 0) {
+		perror(IOCTL_ERR_STR(SCMI_TLM_SET_DE_CFG));
+		return -errno;
+	}
+
+	fprintf(stdout, "--- [SET] STATUS[%d] -> DE:0x%08X  ON:%d  T_ON:%d  SID:%u  OFFS:%u",
+		states[0], de_cfg[0].id, de_cfg[0].enable,
+		de_cfg[0].t_enable, de_cfg[0].sid, de_cfg[0].offset);
+	print_uuid("  UUID: ", &de_cfg[0].uuid[0]);
+	fprintf(stdout, "\n");
+
+	return 0;
+}
+
+static int grp_config_get(struct tlm_state *st, struct scmi_tlm_config *cfg)
+{
+	int ret;
+
+	/* Get current config */
+	ret = ioctl(st->fd, SCMI_TLM_GET_CFG, cfg);
+	if (ret < 0) {
+		perror(IOCTL_ERR_STR(SCMI_TLM_GET_CFG));
+		return -errno;
+	}
+
+	return 0;
+}
+
+static int configure_group(struct tlm_state *st, struct parsed_args *args)
+{
+	struct scmi_tlm_config cfg = {};
+	bool ena, t_ena;
+	unsigned long val;
+	int ret;
+
+	if (!args->opts)
+		return -1;
+
+	if (args->cnt < 2) {
+		/* Dump all GRPS configs */
+		for (int i = 0; i < st->num_groups; i++) {
+			cfg.grp_id = st->grps[i].info->grp_id;
+			cfg.active.exp = -3;
+			cfg.flags = SCMI_TLM_CONFIG_GROUP;
+			ret = grp_config_get(st, &cfg);
+			if (!ret)
+				fprintf(stdout,
+					"--- [GET] -> GROUP:0x%08X  ON:%d  T_ON:%d  INTRV:%u,%d\n",
+					cfg.grp_id, cfg.enable, cfg.t_enable,
+					cfg.active.secs, cfg.active.exp);
+		}
+
+		return 0;
+	}
+
+	/*Dump one GROUP config */
+	val = strtoul(args->opts[1], NULL, 0);
+	if (val == ULONG_MAX || errno == EINVAL)
+		return -1;
+
+	cfg.grp_id = (unsigned int)val;
+	cfg.flags = SCMI_TLM_CONFIG_GROUP;
+	cfg.active.exp = -3;
+	ret = grp_config_get(st, &cfg);
+	if (ret)
+		return ret;
+
+	fprintf(stdout, "--- [GET] -> GROUP:0x%08X  ON:%d  T_ON:%d  INTRV:%u,%d\n",
+		cfg.grp_id, cfg.enable, cfg.t_enable, cfg.active.secs, cfg.active.exp);
+
+	if (args->cnt < 3)
+		return 0;
+
+	/* Configure one GROUP */
+	parse_item_cfg(args->opts[2], &ena, &t_ena, &cfg.active.secs);
+	cfg.enable = !!ena;
+	cfg.t_enable = !!t_ena;
+
+	fprintf(stdout, "--- [SET] -> GROUP:0x%08X  ON:%d  T_ON:%d  INTRV:%u,%d\n",
+		cfg.grp_id, cfg.enable, cfg.t_enable,
+		cfg.active.secs, cfg.active.exp);
+
+	ret = ioctl(st->fd, SCMI_TLM_SET_CFG, &cfg);
+	if (ret < 0) {
+		perror(IOCTL_ERR_STR(SCMI_TLM_SET_CFG));
+		return -errno;
+	}
+
+	return 0;
+}
+
+static int configure_telemetry(struct tlm_state *st, struct parsed_args *args)
+{
+	struct scmi_tlm_config cfg = st->cfg;
+	bool val;
+	int ret;
+
+	if (args->cnt < 2 || !args->opts)
+		return -1;
+
+	val = strncmp(args->opts[1], "on", strlen(args->opts[1])) == 0;
+
+	cfg.enable = !!val;
+	cfg.flags = 0;
+
+	fprintf(stdout, "\n---%sabling Telemetry\n", val ? "En" : "Dis");
+	ret = ioctl(st->fd, SCMI_TLM_SET_CFG, &cfg);
+	if (ret < 0) {
+		perror(IOCTL_ERR_STR(SCMI_TLM_SET_CFG));
+		return -errno;
+	}
+
+	return 0;
+}
+
+static int configure_update(struct tlm_state *st, struct parsed_args *args)
+{
+	struct scmi_tlm_config cfg = st->cfg;
+	unsigned long val;
+	int ret;
+
+	if (args->cnt < 2 || !args->opts)
+		return -1;
+
+	val = strtoul(args->opts[1], NULL, 0);
+	if (val == ULONG_MAX || errno == EINVAL)
+		return -1;
+
+	cfg.flags = 0;
+	if (!val) {
+		cfg.enable = val;
+		fprintf(stdout, "\n---Disabling Telemetry\n");
+	} else {
+		cfg.enable = !!val;
+		cfg.active.secs = val;
+		cfg.active.exp = -3;
+		fprintf(stdout, "\n--- Setting update interval to %lu\n", val);
+	}
+
+	ret = ioctl(st->fd, SCMI_TLM_SET_CFG, &cfg);
+	if (ret < 0) {
+		perror(IOCTL_ERR_STR(SCMI_TLM_SET_CFG));
+		return -errno;
+	}
+
+	return 0;
+}
+
+static int cmd_configure(struct tlm_state *st, struct parsed_args *args)
+{
+	if (!args->cnt || !args->opts)
+		return cmd_unknown("_");
+
+	if (!strncmp(args->opts[0], "all_des", strlen(args->opts[0])))
+		return configure_all_des(st, args);
+	if (!strncmp(args->opts[0], "tlm", strlen(args->opts[0])))
+		return configure_telemetry(st, args);
+	if (!strncmp(args->opts[0], "update", strlen(args->opts[0])))
+		return configure_update(st, args);
+	if (!strncmp(args->opts[0], "de", strlen(args->opts[0])))
+		return configure_de(st, args);
+	if (!strncmp(args->opts[0], "group", strlen(args->opts[0])))
+		return configure_group(st, args);
+
+	return cmd_unknown(args->opts[0]);
+}
+
+static inline int cmd_full_scan_and_dump(struct tlm_state *st)
+{
+	cmd_dump_state(st, NULL);
+	cmd_dump_des(st, NULL);
+	cmd_dump_groups(st);
+
+	return 0;
+}
+
+static int cmd_uuids(struct tlm_state *st, struct parsed_args *args)
+{
+	struct scmi_tlm_batch batch = {};
+	struct scmi_tlm_uuid *uuids;
+	size_t u_sz;
+	int ret;
+
+	batch.item_sz = sizeof(*uuids);
+	/* Get size at first */
+	ret = ioctl(st->fd, SCMI_TLM_GET_UUID_LIST, &batch);
+	if (ret < 0) {
+		perror(IOCTL_ERR_STR(SCMI_TLM_GET_UUID_LIST));
+		return -errno;
+	}
+
+	u_sz = sizeof(*uuids) * batch.num_items;
+	uuids = malloc(u_sz);
+	if (!uuids)
+		return -ENOMEM;
+
+	bzero(uuids, u_sz);
+	batch.items = (uint64_t)uuids;
+	ret = ioctl(st->fd, SCMI_TLM_GET_UUID_LIST, &batch);
+	if (ret < 0) {
+		perror(IOCTL_ERR_STR(SCMI_TLM_GET_UUID_LIST));
+		return -errno;
+	}
+
+	fprintf(stdout, "--- [GET] -> NUM_UUIDS: %u\n", batch.num_items);
+	for (int i = 0; i < batch.num_items; i++) {
+		print_uuid("  UUID: ",
+			   &(((struct scmi_tlm_uuid *)(batch.items))[i]));
+		fprintf(stdout, "\n");
+	}
+
+	return 0;
+}
+
+static int cmd_monitor(struct tlm_state *st, struct parsed_args *args)
+{
+	struct scmi_tlm_event evt = {};
+	struct pollfd fds[2];
+	sigset_t mask;
+	int ret, efd, sfd;
+
+	efd = eventfd(0, EFD_CLOEXEC);
+	if (efd < 0)
+		return -errno;
+
+	sigemptyset(&mask);
+	sigaddset(&mask, SIGINT);
+	sigaddset(&mask, SIGQUIT);
+	ret = sigprocmask(SIG_BLOCK, &mask, NULL);
+	if (ret < 0) {
+		close(efd);
+		return -errno;
+	}
+
+	sfd = signalfd(-1, &mask, 0);
+	if (sfd < 0) {
+		close(efd);
+		return -errno;
+	}
+
+	fds[0].fd = sfd;
+	fds[0].events = POLLIN;
+
+	evt.type = SCMI_TLM_EVT_GENERATION;
+	evt.efd = efd;
+	fprintf(stdout, "==>> Registering for events of type %u\n", evt.type);
+	ret = ioctl(st->fd, SCMI_TLM_EVENT_SUBSCRIBE, &evt);
+	if (ret < 0) {
+		perror(IOCTL_ERR_STR(SCMI_TLM_EVENT_SUBSCRIBE));
+		return -errno;
+	}
+
+	fds[1].fd = evt.efd;
+	fds[1].events = POLLIN;
+
+	if (args->cnt) {
+		fprintf(stdout, "==>> Closing FD on TLM device...\n");
+		close(st->fd);
+	}
+
+	fprintf(stdout, "==>> Waiting for events of type %u on cookie:%u\n",
+		evt.type, evt.cookie);
+	while (1) {
+		ret = poll(fds, 2, -1);
+		if (ret < 0)
+			return ret;
+
+		/* Break on SIGINT */
+		if (fds[0].revents & POLLIN) {
+			struct signalfd_siginfo  fdsi;
+
+			read(fds[0].fd, &fdsi, sizeof(fdsi));
+			if (fdsi.ssi_signo == SIGINT)
+				fprintf(stderr, "Got SIGINT\n");
+			else
+				fprintf(stderr, "Got signal\n");
+			break;
+		}
+
+		if (fds[1].revents & POLLIN) {
+			uint64_t val = 0;
+
+			read(fds[1].fd, &val, sizeof(val));
+			fprintf(stdout, "==>> EVENT READ on EFD:%d - VAL:%lu!\n",
+				evt.efd, val);
+		}
+	}
+
+	if (!args->cnt) {
+		fprintf(stdout, "==>> DE-Registering for events of type %u on cookie:%u\n",
+			evt.type, evt.cookie);
+		ret = ioctl(st->fd, SCMI_TLM_EVENT_SUBSCRIBE, &evt);
+		if (ret < 0) {
+			perror(IOCTL_ERR_STR(SCMI_TLM_EVENT_SUBSCRIBE));
+			return -errno;
+		}
+	}
+
+	close(sfd);
+	close(efd);
+
+	return 0;
+}
+
+static int query_intervals(struct tlm_state *st)
+{
+	struct scmi_tlm_intervals tlm_ivs = {};
+	int ret;
+
+	/* Global interval */
+	ret = ioctl(st->fd, SCMI_TLM_GET_INTRVS, &tlm_ivs);
+	if (ret < 0) {
+		perror("SCMI_TLM_GET_INTRVS");
+		return -errno;
+	}
+
+	fprintf(stdout, "--- [QUERY]:[SCMI_TLM_GET_INTRVS] -> NUM_ITEMS:%u\n",
+		tlm_ivs.num_intervals);
+
+	for (int i = 0; i < st->num_groups; i++) {
+		struct scmi_tlm_intervals tlm_ivs = {};
+
+		tlm_ivs.grp_id = st->grps[i].info->grp_id;
+		tlm_ivs.flags = SCMI_TLM_INTERV_GROUP;
+		ret = ioctl(st->fd, SCMI_TLM_GET_INTRVS, &tlm_ivs);
+		if (ret < 0) {
+			perror("SCMI_TLM_GET_INTRVS");
+			return -errno;
+		}
+
+		fprintf(stdout,
+			"--- [QUERY][GRP%u]:[SCMI_TLM_GET_INTRVS] -> NUM_ITEMS:%u\n",
+			tlm_ivs.grp_id, tlm_ivs.num_intervals);
+	}
+
+	return 0;
+}
+
+static int query_samples(struct tlm_state *st, unsigned long ioctl_op,
+			 const char *tag)
+{
+	struct scmi_tlm_data_read data = {};
+	int ret;
+
+	/* Global interval */
+	ret = ioctl(st->fd, ioctl_op, &data);
+	if (ret < 0) {
+		perror(tag);
+		return -errno;
+	}
+
+	fprintf(stdout, "--- [QUERY]:[%s] -> NUM_ITEMS:%u\n",
+		tag, data.num_samples);
+
+	for (int i = 0; i < st->num_groups; i++) {
+		struct scmi_tlm_data_read data = {};
+
+		data.grp_id = st->grps[i].info->grp_id;
+		data.flags = SCMI_TLM_READ_GROUP;
+		ret = ioctl(st->fd, ioctl_op, &data);
+		if (ret < 0) {
+			perror(tag);
+			return -errno;
+		}
+
+		fprintf(stdout,
+			"--- [QUERY][GRP%u]:[%s] -> NUM_ITEMS:%u\n",
+			data.grp_id, tag, data.num_samples);
+	}
+
+	return 0;
+}
+
+static int cmd_query_ioctls(struct tlm_state *st)
+{
+	int ret;
+
+	ret = query_items(st->fd, SCMI_TLM_GET_DE_LIST,
+			  sizeof(struct scmi_tlm_de_info),
+			  "SCMI_TLM_GET_DE_LIST");
+	if (ret)
+		return ret;
+
+	ret = query_items(st->fd, SCMI_TLM_GET_GRP_LIST,
+			  sizeof(struct scmi_tlm_grp_info),
+			  "SCMI_TLM_GET_GRP_LIST");
+	if (ret)
+		return ret;
+
+	ret = query_items(st->fd, SCMI_TLM_GET_SHMTI_LIST,
+			  sizeof(struct scmi_tlm_shmti_info),
+			  "SCMI_TLM_GET_SHMTI_LIST");
+	if (ret)
+		return ret;
+
+	ret = query_items(st->fd, SCMI_TLM_GET_UUID_LIST,
+			  sizeof(struct scmi_tlm_uuid),
+			  "SCMI_TLM_GET_UUID_LIST");
+	if (ret)
+		return ret;
+
+	ret = query_items(st->fd, SCMI_TLM_GET_DE_CFG,
+			  sizeof(struct scmi_tlm_de_config),
+			  "SCMI_TLM_GET_DE_CFG");
+	if (ret)
+		return ret;
+
+	ret = query_items(st->fd, SCMI_TLM_SET_DE_CFG,
+			  sizeof(struct scmi_tlm_de_config),
+			  "SCMI_TLM_SET_DE_CFG");
+	if (ret)
+		return ret;
+
+	ret = query_items(st->fd, SCMI_TLM_BATCH_READ,
+			  sizeof(struct scmi_tlm_de_sample),
+			  "SCMI_TLM_BATCH_READ");
+	if (ret)
+		return ret;
+
+	ret = query_intervals(st);
+	if (ret)
+		return ret;
+
+	ret = query_samples(st, SCMI_TLM_BULK_READ, "SCMI_TLM_BULK_READ");
+	if (ret)
+		return ret;
+
+	ret = query_samples(st, SCMI_TLM_SINGLE_READ, "SCMI_TLM_SINGLE_READ");
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+int main(int argc, char **argv)
+{
+	struct parsed_args args = {};
+	struct tlm_state *st;
+	int ret;
+
+	argv0 = argv[0];
+
+	ret = parse_options(argc, argv, &args);
+	if (ret < 0) {
+		usage(argv0);
+		return EXIT_FAILURE;
+	}
+
+	st = open_session(args.instance);
+	if (!st)
+		return EXIT_FAILURE;
+
+	ret = gather_tlm_state(st);
+	if (ret)
+		return EXIT_FAILURE;
+
+	if (!args.cmd)
+		return cmd_full_scan_and_dump(st);
+	else if (!strncmp(args.cmd, "info", strlen(args.cmd)))
+		return cmd_dump_state(st, &args);
+	else if (!strncmp(args.cmd, "uuids", strlen(args.cmd)))
+		return cmd_uuids(st, &args);
+	else if (!strncmp(args.cmd, "monitor", strlen(args.cmd)))
+		return cmd_monitor(st, &args);
+	else if (!strncmp(args.cmd, "shmti", strlen(args.cmd)))
+		return cmd_shmti_ops(st, &args);
+	else if (!strncmp(args.cmd, "des", strlen(args.cmd)))
+		return cmd_dump_des(st, &args);
+	else if (!strncmp(args.cmd, "groups", strlen(args.cmd)))
+		return cmd_dump_groups(st);
+	else if (!strncmp(args.cmd, "cfg", strlen(args.cmd)))
+		return cmd_configure(st, &args);
+	else if (!strncmp(args.cmd, "single", strlen(args.cmd)))
+		return cmd_single_read(st);
+	else if (!strncmp(args.cmd, "bulk", strlen(args.cmd)))
+		return cmd_bulk_read(st);
+	else if (!strncmp(args.cmd, "batch", strlen(args.cmd)))
+		return cmd_batch_read(st, &args);
+	else if (!strncmp(args.cmd, "reset", strlen(args.cmd)))
+		return cmd_tlm_reset(st);
+	else if (!strncmp(args.cmd, "query", strlen(args.cmd)))
+		return cmd_query_ioctls(st);
+
+	return cmd_unknown(args.cmd);
+}
diff --git a/tools/testing/scmi/stlm_decode.c b/tools/testing/scmi/stlm_decode.c
new file mode 100644
index 000000000000..186964710184
--- /dev/null
+++ b/tools/testing/scmi/stlm_decode.c
@@ -0,0 +1,252 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SCMI Telemetry Test Tool Decoder
+ *
+ * Copyright (C) 2026 ARM Ltd.
+ */
+
+/*
+ * Userspace decoder for a snapshot of an SCMI v4.0 Telemetry SHMTI area
+ * (TDCF format). libc only, no alignment or endianness assumptions on the
+ * host or on the snapshot buffer.
+ *
+ * Layout (all fields little-endian, except the UUID line payload):
+ *
+ *   Prologue  (16 bytes)
+ *     +0   u32 signature      0x5442474E ("TBGN" as a LE-decoded u32)
+ *     +4   u32 match seq      LSB set => platform update in progress
+ *     +8   u32 num_qwords     payload size in 64-bit units
+ *     +12  u32 hdr meta       [7:0] TDCF revision
+ *   Payload   (num_qwords * 8 bytes of lines, each 2 or 3 qwords)
+ *     +0   u32 meta           [7:4] line type: 0 DATA, 1 BLK_TS, 2 UUID
+ *                             [3] USE_BLK_TS  [2] HAS_LINE_EXT
+ *                             [1] TS_VALID    [0] DATA_INVALID
+ *     +4   u32 id             DATA: DE id    BLK_TS: clock rate
+ *     +8   DATA : u64 value    BLK_TS: u64 timestamp   UUID: 16 bytes
+ *     +16  u64 line timestamp (only when HAS_LINE_EXT; UUID lines: part
+ *          of the 16 bytes above, HAS_LINE_EXT is mandatory for them)
+ *   Epilogue  (last 8 bytes of the SHMTI)
+ *     +0   u32 match seq      must equal the prologue one
+ *     +4   u32 signature      0x54454E44 ("TEND" as a LE-decoded u32)
+ *
+ * Line length: 16 bytes, or 24 bytes when HAS_LINE_EXT is set.
+ *
+ * Returns 0 on success, -EINVAL on bad size/signature, -EOVERFLOW/-EPROTO
+ * on malformed payload, -EAGAIN if the snapshot looks torn (odd start
+ * sequence or start/end sequence mismatch): the content is still decoded.
+ */
+#include <errno.h>
+#include <inttypes.h>
+#include <stddef.h>
+#include <stdint.h>
+#include <stdio.h>
+
+#define TDCF_SIG_BEGIN		0x5442474Eu
+#define TDCF_SIG_END		0x54454E44u
+#define TDCF_PRLG_SZ		16u
+#define TDCF_EPLG_SZ		8u
+#define TDCF_MIN_SZ		(TDCF_PRLG_SZ + TDCF_EPLG_SZ)
+
+#define TDCF_LINE_DATA		0u
+#define TDCF_LINE_BLK_TS	1u
+#define TDCF_LINE_UUID		2u
+
+#define TDCF_META_TYPE(m)	(((m) >> 4) & 0xfu)
+#define TDCF_META_USE_BLK_TS	(1u << 3)
+#define TDCF_META_HAS_EXT	(1u << 2)
+#define TDCF_META_TS_VALID	(1u << 1)
+#define TDCF_META_INVALID	(1u << 0)
+
+#define TDCF_LINE_SZ		16u
+#define TDCF_LINE_EXT_SZ	24u
+
+static uint32_t tdcf_le32(const uint8_t *p)
+{
+	return (uint32_t)p[0] | ((uint32_t)p[1] << 8) |
+	       ((uint32_t)p[2] << 16) | ((uint32_t)p[3] << 24);
+}
+
+static uint64_t tdcf_le64(const uint8_t *p)
+{
+	return ((uint64_t)tdcf_le32(p + 4) << 32) | tdcf_le32(p);
+}
+
+static void tdcf_flags(uint32_t m, char out[16])
+{
+	snprintf(out, 16, "%c%c%c%c",
+		 (m & TDCF_META_USE_BLK_TS) ? 'B' : '-',
+		 (m & TDCF_META_HAS_EXT) ? 'E' : '-',
+		 (m & TDCF_META_TS_VALID) ? 'T' : '-',
+		 (m & TDCF_META_INVALID) ? 'I' : '-');
+}
+
+/* UUID bytes are in memory order, i.e. 4 x BE dwords: no swapping needed */
+static void tdcf_uuid_str(const uint8_t *u, char out[40])
+{
+	snprintf(out, 40,
+		 "%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-"
+		 "%02x%02x%02x%02x%02x%02x",
+		 u[0], u[1], u[2], u[3], u[4], u[5], u[6], u[7],
+		 u[8], u[9], u[10], u[11], u[12], u[13], u[14], u[15]);
+}
+
+int tdcf_decode(const void *buf, size_t len)
+{
+	const uint8_t *b = buf;
+	uint32_t sig_s, mseq_s, nq, hdr, mseq_e, sig_e;
+	size_t off = TDCF_PRLG_SZ, end, left;
+	/* Payload starts at 16, so offset 0 can safely mean "none" */
+	size_t bts_off = 0, uuid_off = 0;
+	uint64_t bts_ts = 0;
+	uint32_t bts_rate = 0;
+	int torn = 0;
+
+	if (!b || len < TDCF_MIN_SZ) {
+		fprintf(stderr, "TDCF: buffer too small (%zu bytes)\n", len);
+		return -EINVAL;
+	}
+
+	end = len - TDCF_EPLG_SZ;	/* payload lives in [off, end) */
+
+	sig_s  = tdcf_le32(b);
+	mseq_s = tdcf_le32(b + 4);
+	nq     = tdcf_le32(b + 8);
+	hdr    = tdcf_le32(b + 12);
+	mseq_e = tdcf_le32(b + end);
+	sig_e  = tdcf_le32(b + end + 4);
+
+	if (sig_s != TDCF_SIG_BEGIN || sig_e != TDCF_SIG_END) {
+		fprintf(stderr,
+			"TDCF: bad signature START:0x%08" PRIx32
+			" (exp 0x%08x) END:0x%08" PRIx32 " (exp 0x%08x)\n",
+			sig_s, TDCF_SIG_BEGIN, sig_e, TDCF_SIG_END);
+		return -EINVAL;
+	}
+
+	printf("PRLG  @0x0000 sig=TBGN mseq=0x%08" PRIx32 " qwords=%" PRIu32
+	       " rev=%" PRIu32 " hdr_meta=0x%08" PRIx32 "\n",
+	       mseq_s, nq, hdr & 0xffu, hdr);
+
+	if (mseq_s & 1u) {
+		fprintf(stderr, "TDCF: odd start sequence: update in progress\n");
+		torn = 1;
+	}
+	if (mseq_s != mseq_e) {
+		fprintf(stderr,
+			"TDCF: sequence mismatch start:0x%08" PRIx32
+			" end:0x%08" PRIx32 "\n", mseq_s, mseq_e);
+		torn = 1;
+	}
+
+	left = nq;
+	while (left) {
+		const uint8_t *p = b + off;
+		char fl[16], us[40];
+		uint32_t meta, id;
+		size_t lb;
+
+		if (end - off < 4) {
+			fprintf(stderr, "TDCF: line @0x%zx overflows SHMTI\n", off);
+			return -EOVERFLOW;
+		}
+
+		meta = tdcf_le32(p);
+		lb = (meta & TDCF_META_HAS_EXT) ? TDCF_LINE_EXT_SZ : TDCF_LINE_SZ;
+		if (end - off < lb) {
+			fprintf(stderr, "TDCF: line @0x%zx overflows SHMTI\n", off);
+			return -EOVERFLOW;
+		}
+		if (left < lb / 8) {
+			fprintf(stderr,
+				"TDCF: line @0x%zx exceeds prologue num_qwords\n",
+				off);
+			return -EPROTO;
+		}
+
+		id = tdcf_le32(p + 4);
+		tdcf_flags(meta, fl);
+		printf("LINE  @0x%04zx %-6s [%s] ", off,
+		       TDCF_META_TYPE(meta) == TDCF_LINE_DATA ? "DATA" :
+		       TDCF_META_TYPE(meta) == TDCF_LINE_BLK_TS ? "BLK_TS" :
+		       TDCF_META_TYPE(meta) == TDCF_LINE_UUID ? "UUID" : "???",
+		       fl);
+
+		if (meta & TDCF_META_INVALID) {
+			/* Disabled/unused slot: not an error */
+			printf("id=0x%08" PRIx32 " <invalid/unused>\n", id);
+			goto next;
+		}
+
+		switch (TDCF_META_TYPE(meta)) {
+		case TDCF_LINE_DATA: {
+			uint64_t val = tdcf_le64(p + 8);
+
+			printf("id=0x%08" PRIx32 " val=0x%016" PRIx64
+			       " (%" PRIu64 ") ", id, val, val);
+
+			if (meta & TDCF_META_USE_BLK_TS) {
+				if (bts_off)
+					printf("ts=0x%016" PRIx64
+					       " (blk@0x%zx rate=%" PRIu32 ")",
+					       bts_ts, bts_off, bts_rate);
+				else
+					printf("ts=<USE_BLK_TS without preceding BLK_TS>");
+			} else if (meta & TDCF_META_TS_VALID) {
+				if (meta & TDCF_META_HAS_EXT)
+					printf("ts=0x%016" PRIx64 " (line)",
+					       tdcf_le64(p + 16));
+				else
+					printf("ts=<TS_VALID without EXT: malformed>");
+			} else if (meta & TDCF_META_HAS_EXT) {
+				printf("ts=invalid");
+			} else {
+				printf("ts=none");
+			}
+
+			if (uuid_off)
+				printf(" uuid=line@0x%zx", uuid_off);
+			else
+				printf(" uuid=primary");
+			printf("\n");
+			break;
+		}
+		case TDCF_LINE_BLK_TS:
+			if (meta & (TDCF_META_USE_BLK_TS | TDCF_META_HAS_EXT |
+				    TDCF_META_TS_VALID)) {
+				printf("rate=%" PRIu32 " <malformed, ignored>\n", id);
+				break;
+			}
+			bts_off = off;
+			bts_rate = id;
+			bts_ts = tdcf_le64(p + 8);
+			printf("rate=%" PRIu32 "%s ts=0x%016" PRIx64
+			       " (%" PRIu64 ")\n", bts_rate,
+			       bts_rate ? "" : " (0: protocol default)",
+			       bts_ts, bts_ts);
+			break;
+		case TDCF_LINE_UUID:
+			if ((meta & (TDCF_META_TS_VALID | TDCF_META_USE_BLK_TS)) ||
+			    !(meta & TDCF_META_HAS_EXT)) {
+				printf("<malformed, ignored>\n");
+				break;
+			}
+			uuid_off = off;
+			tdcf_uuid_str(p + 8, us);
+			printf("id=0x%08" PRIx32 " %s\n", id, us);
+			break;
+		default:
+			printf("id=0x%08" PRIx32 " <unknown line type %u, skipped>\n",
+			       id, TDCF_META_TYPE(meta));
+			break;
+		}
+next:
+		off += lb;
+		left -= lb / 8;
+	}
+
+	if (end > off)
+		printf("PAD   @0x%04zx %zu unused payload bytes\n", off, end - off);
+	printf("EPLG  @0x%04zx mseq=0x%08" PRIx32 " sig=TEND\n", end, mseq_e);
+
+	return torn ? -EAGAIN : len;
+}
diff --git a/tools/testing/scmi/stlm_decode.h b/tools/testing/scmi/stlm_decode.h
new file mode 100644
index 000000000000..740d1528d1f4
--- /dev/null
+++ b/tools/testing/scmi/stlm_decode.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __STLM_DECODE_H
+#define __STLM_DECODE_H
+
+int tdcf_decode(const void *buf, size_t len);
+
+#endif
-- 
2.54.0

