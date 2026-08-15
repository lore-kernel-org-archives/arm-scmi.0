Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3723A4F3B;
	Sat, 15 Aug 2026 23:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786836473; cv=none; b=mW89aq/wIDryn6hGQ8BhUfq9814oW1vmmeDE2LvFwOqTvVBXHz2ZgkBevYyELyePiOYkn+bJfLOEnK9sX5JjbPtnkXB/hEDKXHZu8TsW9xsn/TRtbNpnJuk06cII4b0xZMt5IIEhia2cYmT4LDW8PZl5DlXm7BLxuPJNSqRfg44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786836473; c=relaxed/simple;
	bh=bvMviIfKEGzHTG5YbfSdzmfVamzDlLAFr2QG9qhfrcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JOJHmtrl7URPtjoZLzmqW1h00lBz7lnPV2IBprZypkmDAn3Uy6f13GWOVxQoRj6NpJHT0ja9CWZ69zJBYZrvNwFNMdvKW96Y0Rhlcy7lnexi04RNx4Z42lwd6m/khR8WbMV3BPw/KDgoWgGdy7UkCi8m1inohpS3X8wrrzerdmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YCNlC0Ca; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YCNlC0Ca"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0061E1596;
	Sat, 15 Aug 2026 16:27:46 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D7063F673;
	Sat, 15 Aug 2026 16:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786836469; bh=bvMviIfKEGzHTG5YbfSdzmfVamzDlLAFr2QG9qhfrcE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YCNlC0CasBeMb0CeZKMOpOhwckW2yEReJQ8+Angjh5P8CWNxGhdPlFlmTW63FLzW7
	 KXsSUb9s0BuEodbZHXpJwg3WSm0TysEfjVqzvbeF3y13qOqfDIhs8x2kv7zSoLOKLu
	 5Eaz+JqphZjn8C0vOa9+/FJtPWWi/xpJFLZytW0k=
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
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v10 20/24] uapi: Add ARM SCMI Telemetry definitions
Date: Sun, 16 Aug 2026 00:26:00 +0100
Message-ID: <20260815232604.3730754-21-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260815232604.3730754-1-cristian.marussi@arm.com>
References: <20260815232604.3730754-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a number of structures and ioctls definitions used by the ARM
SCMI Telemetry protocol.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v8 --> v9
 - Simplified ABI related to _LIST IOCTL, substituting all custom
   container structures in favour of the usage of scmi_tlm_batch,
   i.e. dropping:
   - scmi_tlm_des_list
   - scmi_tlm_uuid_list
   - scmi_tlm_grps_list
   - scmi_tlm_shmtis_list
 - Updated related _LIST documentation
v7 --> v8
 - Fixes for some Sashiko issues on v7
  - fix typos and wrong struct reference in SCMI_TLM_BATCH_READ
  - move a couple of IOCTL to be _IOW
  - add a few more comments on usage and behaviour of BATCH ops
v6 --> v7
 - added per-DE UUID/SID/OFFS
 - IOCTL EVENTS: generation counter
 - generic BATCH support (scmi_tlm_batch)
 - BATCH READ with perf-DE status
 - BATCH DE GET/SET CONFIG
 - added reserved fields for grow
 - added more ABI features flags
 - better Doxygen desciption for IN/OUT params
v5 --> v6
 - Fixed interval exp to be __s32 as documented
 - Using a more unique name for IOCTL MAGIC define
 - Renamed a few IOCTLs to be consistent
 - redefine primary UUID as an array of u8
 - add GET_ABI_INFO to gather ABI version and instance info
 - add RESET support
 - fixed typos in kdoc
v4 --> v5
 - Added more structure padding
 - Removed frowned upon flexible array in favour of u64 pointers to external
   userspace provided buffer
 - Added UAPI support to access SHMTIs from userspace
 - Cleaned up Doxygen
v2 --> v3
 - Change tstamp_exp tp ts_rate
 - renamed num -> num_intervals in scmi_tlm_interval
 - added padding in scmi_tlm_de_sample to avoid packing issues on 32bit
v1 --> v2
 - Added proper __counted_by marks
 - Fixed a few dox comments
 - Renamed reserved[] fields to pad[]
---
 MAINTAINERS               |   1 +
 include/uapi/linux/scmi.h | 474 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 475 insertions(+)
 create mode 100644 include/uapi/linux/scmi.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 8014b9f8253e..a3d62c38f4fb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26311,6 +26311,7 @@ F:	drivers/regulator/scmi-regulator.c
 F:	drivers/reset/reset-scmi.c
 F:	include/linux/sc[mp]i_protocol.h
 F:	include/trace/events/scmi.h
+F:	include/uapi/linux/scmi.h
 F:	include/uapi/linux/virtio_scmi.h
 
 SYSTEM CONTROL MANAGEMENT INTERFACE (SCMI) i.MX Extension Message Protocol drivers
diff --git a/include/uapi/linux/scmi.h b/include/uapi/linux/scmi.h
new file mode 100644
index 000000000000..10eece02e4d9
--- /dev/null
+++ b/include/uapi/linux/scmi.h
@@ -0,0 +1,474 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Copyright (C) 2026 ARM Ltd.
+ */
+#ifndef _UAPI_LINUX_SCMI_H
+#define _UAPI_LINUX_SCMI_H
+
+/*
+ * Userspace interface SCMI Telemetry
+ */
+
+#include <linux/ioctl.h>
+#include <linux/types.h>
+
+#define SCMI_TLM_ABI_VERSION_V1			1
+#define SCMI_TLM_CURRENT_ABI_VERSION		SCMI_TLM_ABI_VERSION_V1
+#define SCMI_TLM_DE_IMPL_UUID_SZ		16
+
+#define SCMI_TLM_SHMTI_ID_INVALID		0xFFFFFFFF
+
+/**
+ * struct scmi_tlm_abi_info - Basic information on the ABI/instance
+ *
+ * SCMI Telemetry characteristics like number of DEs, Groups, Intervals and
+ * SHMTIs are statically determined by the platform and do not change within
+ * one boot/session; they are reported here so that they can be used to properly
+ * size the requests on other IOCTLs, without having to discover dynamically
+ * those sizes by issuing a zero-sized IOCTL request at first.
+ *
+ * @size: sizeof this structure - IN
+ * @abi_version: ABI Version - OUT
+ * @abi_features: ABI capabilities bitmap - OUT
+ * @primary_de_impl_version: SCMI Telemetry DE implementation revision - OUT
+ * @num_des: Number of defined DEs - OUT
+ * @num_groups: Number of defined DEs groups - OUT
+ * @num_intervals: Number of available update intervals (instance-level) - OUT
+ * @num_shmtis: Number of discovered SHMTI areas - OUT
+ * @features: Instance specific SCMI feature-support bitmap - OUT
+ * @reserved: Some room for future expansion without the need to resize.
+ *	      Must be zero.
+ *
+ * Used by:
+ *	RW - SCMI_TLM_GET_ABI_INFO
+ */
+struct scmi_tlm_abi_info {
+	__u32 size;
+	__u32 abi_version;
+	__u32 abi_features;
+#define SCMI_TLM_ABI_FEAT_RESET				(1 << 0)
+#define SCMI_TLM_ABI_FEAT_EVENT				(1 << 1)
+#define SCMI_TLM_ABI_FEAT_UUID_LIST			(1 << 2)
+#define SCMI_TLM_ABI_FEAT_BATCH_STATE			(1 << 3)
+#define SCMI_TLM_ABI_FEAT_BATCHED_CFG			(1 << 4)
+#define SCMI_TLM_ABI_FEAT_DE_TRACKING			(1 << 5)
+	__u8 primary_de_impl_version[SCMI_TLM_DE_IMPL_UUID_SZ];
+	__u32 num_des;
+	__u32 num_groups;
+	__u32 num_intervals;
+	__u32 num_shmtis;
+	__u32 features;
+#define SCMI_TLM_SCMI_SUPPORT_RESET			(1 << 0)
+#define SCMI_TLM_SCMI_SUPPORT_SINGLE_SAMPLE		(1 << 1)
+#define SCMI_TLM_SCMI_SUPPORT_GROUP_CONFIG		(1 << 2)
+#define SCMI_TLM_SCMI_SUPPORT_UPDATE_NOTIFICATION	(1 << 3)
+	__u64 reserved;
+};
+
+/**
+ * struct scmi_tlm_update_interval  - Update interval descriptor
+ *
+ * @secs: integer representing seconds - OUT
+ * @exp: signed integer representing the base 10 exponent used as a multiplier
+ *	 with @secs to represent the interval - OUT
+ *
+ * The resulting update interval is calculated as: <secs> * 10 ^ <exp>
+ */
+struct scmi_tlm_update_interval {
+	__u32 secs;
+	__s32 exp;
+};
+
+/**
+ * struct scmi_tlm_config  - Whole instance or group configuration
+ *
+ * @enable: Get/Set Telemetry enabled state for the whole instance or the
+ *	    group specified in @grp_id - IN/OUT
+ * @t_enable: Get/Set timestamp state for the group specified in @grp_id - IN/OUT
+ * @flags: Bitmask to represent special characteristics - IN
+ * @pad: Padding fields to enforce alignment
+ * @grp_id: Identifier of the target group upon which this configuration will
+ *	    be applied: ignored if not marked as a group in @flags - IN/OUT
+ * @active: Get/Set currently active update interval for the whole instance
+ *	    or the group specified in @grp_id - IN/OUT
+ * @reserved: Some room for future expansion. Must be zero.
+ *
+ * Used by:
+ *	RW - SCMI_TLM_GET_CFG
+ *	WO - SCMI_TLM_SET_CFG
+ */
+struct scmi_tlm_config {
+	__u8 enable;
+	__u8 t_enable;
+	__u8 flags;
+#define SCMI_TLM_CONFIG_GROUP		(1 << 0)
+#define SCMI_TLM_CONFIG_FLAGS		(SCMI_TLM_CONFIG_GROUP)
+#define SCMI_TLM_CONFIG_IS_GROUP(f)	((f) & SCMI_TLM_CONFIG_GROUP)
+	__u8 pad;
+	__u32 grp_id;
+	struct scmi_tlm_update_interval active;
+	__u64 reserved;
+};
+
+/**
+ * struct scmi_tlm_intervals  - Update intervals descriptor
+ *
+ * @grp_id: Identifier of the target group upon which this configuration
+ *	    will be applied: ignored if not marked as a group in @flags - IN
+ * @flags: Bitmask to represent special characteristics. When the interval
+ *	   is NOT marked as SCMI_TLM_INTERV_DISCRETE, @intervals will
+ *	   contain a triplet: min/max/step - OUT
+ * @pad: Padding fields to enforce alignment
+ * @num_intervals: Number of entries of @intervals. On input this represents the
+ *		   size of @intervals, while on output carries the effective
+ *		   number of entries filled-in - IN/OUT
+ * @pad2: Padding fields to enforce alignment
+ * @reserved: Some room for future expansion. Must be zero.
+ * @intervals: A pointer to an array of struct scmi_tlm_update_interval - IN/OUT
+ *
+ * Used by:
+ *	RW - SCMI_TLM_GET_INTRVS
+ */
+struct scmi_tlm_intervals {
+	__u32 grp_id;
+	__u8 flags;
+#define SCMI_TLM_INTERV_GROUP		(1 << 0)
+#define SCMI_TLM_INTERV_DISCRETE	(1 << 1)
+#define SCMI_TLM_INTERV_FLAGS					\
+	(SCMI_TLM_INTERV_GROUP | SCMI_TLM_INTERV_DISCRETE)
+#define SCMI_TLM_INTERV_IS_GROUP(f)	((f) & SCMI_TLM_INTERV_GROUP)
+	__u8 pad[3];
+	__u32 num_intervals;
+	__u32 pad2;
+	__u64 reserved;
+#define SCMI_TLM_UPDATE_INTVL_SEGMENT_LOW	0
+#define SCMI_TLM_UPDATE_INTVL_SEGMENT_HIGH	1
+#define SCMI_TLM_UPDATE_INTVL_SEGMENT_STEP	2
+	__u64 intervals;
+};
+
+/**
+ * struct scmi_tlm_de_config  - DE configuration
+ *
+ * This descriptor is used directly by the aggregate SCMI_TLM_GET_ALL_CFG and
+ * SCMI_TLM_SET_ALL_CFG IOCTLs, or embedded into an @scmi_tlm_batch request for
+ * SCMI_TLM_GET_DE_CFG and SCMI_TLM_SET_DE_CFG IOCTLs.
+ *
+ * @id: Identifier of the DE, ignored by SCMI_TLM_GET/SET_ALL_CFG - IN
+ * @enable: Get/Set the enabled state of this single DE or the cumulative ALL
+ *	    state - IN/OUT
+ * @t_enable: Get/Set the timestamp state of this single DE (if supported) or
+ *	      the cumulative ALL state - IN/OUT
+ * @sid: An integer representing the SHMTI ID that contains this DE. Valid
+ *	 ONLY when the related DE is enabled - OUT
+ * @offset: An integer representing the offset in the SHMTI @sid that identifies
+ *	    the start of the TDCF DataLine containing this DE.
+ *	    Valid ONLY when the related DE is enabled - OUT
+ * @pad: Padding fields to enforce alignment
+ * @uuid: An array containing the UUID, in BigEndian format, associated to
+ *	  this DE. Valid ONLY when the related DE is enabled: this UUID can
+ *	  be the primary UUID or one of the secondary UUIDs if any exist.
+ *	  Note that this UUID/DE association is permanent within the same
+ *	  boot/session - OUT
+ * @reserved: Some room for future expansion. Must be zero.
+ *
+ * Used by:
+ *	RW - SCMI_TLM_GET_ALL_CFG
+ *	RW - SCMI_TLM_SET_ALL_CFG
+ *	RW - SCMI_TLM_GET_DE_CFG (within a BATCH)
+ *	RW - SCMI_TLM_SET_DE_CFG (within a BATCH)
+ */
+struct scmi_tlm_de_config {
+	__u32 id;
+	__u32 enable;
+	__u32 t_enable;
+	__u32 sid;
+	__u32 offset;
+	__u32 pad;
+	__u8 uuid[SCMI_TLM_DE_IMPL_UUID_SZ];
+	__u64 reserved;
+};
+
+/**
+ * struct scmi_tlm_de_info  - DataEvent Descriptor
+ *
+ * @id: DE identifier - IN/OUT
+ * @grp_id: Identifier of the group which this DE belongs to; valid only if
+ *	    this DE is marked as belonging to a group in @flags - IN/OUT
+ * @data_sz: DE data size in bytes - OUT
+ * @type: DE type - OUT
+ * @unit: DE unit of measurements - OUT
+ * @unit_exp: Power-of-10 multiplier for DE unit - OUT
+ * @ts_rate: Clock rate in kHz used to generate the DE timestamp - OUT
+ * @instance_id: DE instance ID - OUT
+ * @compo_instance_id: DE component instance ID - OUT
+ * @compo_type: Type of component which is associated to this DE - OUT
+ * @persistent: Data value for this DE survives reboot (non-cold ones) - OUT
+ * @flags: Bitmask to represent special characteristics - IN
+ * @pad: Padding fields to enforce alignment
+ * @pad2: Padding fields to enforce alignment
+ * @name: Name of this DE - OUT
+ * @reserved: Some room for future expansion. Must be zero.
+ *
+ * Used to get the full description of a DE: it reflects DE Descriptors
+ * definitions in SCMI V4.0 specification at 3.12.4.6.
+ *
+ * Used by:
+ *	RW - SCMI_TLM_GET_DE_INFO
+ *	RW - SCMI_TLM_GET_DE_LIST (within a BATCH)
+ */
+struct scmi_tlm_de_info {
+	__u32 id;
+	__u32 grp_id;
+	__u32 data_sz;
+	__u32 type;
+	__u32 unit;
+	__s32 unit_exp;
+	__u32 ts_rate;
+	__u32 instance_id;
+	__u32 compo_instance_id;
+	__u32 compo_type;
+	__u8 persistent;
+	__u8 flags;
+#define SCMI_TLM_DEINFO_GROUP		(1 << 0)
+#define SCMI_TLM_DEINFO_FLAGS		(SCMI_TLM_DEINFO_GROUP)
+#define SCMI_TLM_DEINFO_HAS_GROUP(f)	((f) & SCMI_TLM_DEINFO_GROUP)
+	__u8 pad[2];
+	__u32 pad2;
+	__u8 name[16];
+	__u64 reserved;
+};
+
+/**
+ * struct scmi_tlm_de_sample - A DataEvent reading
+ *
+ * @id: DE identifier - IN
+ * @pad: Padding fields to enforce alignment.
+ * @tstamp: DE reading timestamp (0 if timestamp NOT supported) - OUT
+ * @val: Reading of the DE data value - OUT
+ *
+ * Used by:
+ *	RW - SCMI_TLM_DE_READ
+ */
+struct scmi_tlm_de_sample {
+	__u32 id;
+	__u32 pad;
+	__u64 tstamp;
+	__u64 val;
+};
+
+/**
+ * struct scmi_tlm_data_read - Bulk read of a number of DataEvents
+ *
+ * @grp_id: Optional group ID number, ignored if not marked as a group request
+ *	    in @flags and not supported by SCMI_TLM_BATCH_READ - IN
+ * @flags: Bitmask to represent special characteristics - IN
+ * @pad: Padding fields to enforce alignment
+ * @pad2: Padding fields to enforce alignment
+ * @num_samples: Number of entries in @samples. In input represents the size of
+ *		 @samples, while in output carries the effective number of items
+ *		 filled-in  - IN/OUT
+ * @samples: A reference to an array of struct scmi_tlm_de_sample containing
+ *	     an entry for each DE - IN/OUT
+ *
+ * Used by:
+ *	RW - SCMI_TLM_SINGLE_READ
+ *	RW - SCMI_TLM_BULK_READ
+ */
+struct scmi_tlm_data_read {
+	__u32 grp_id;
+	__u8 flags;
+#define SCMI_TLM_READ_GROUP		(1 << 0)
+#define SCMI_TLM_READ_FLAGS		(SCMI_TLM_READ_GROUP)
+#define SCMI_TLM_READ_IS_GROUP(f)	((f) & SCMI_TLM_READ_GROUP)
+	__u8 pad[3];
+	__u32 pad2;
+	__u32 num_samples;
+	__u64 samples;
+};
+
+/**
+ * struct scmi_tlm_batch  - A wrapper structure for BATCH operations
+ *
+ * This structure is used as an opaque container for a set of objects of the
+ * same kind: it is used by a number of different IOCTLs and it is up to the
+ * specific IOCTL implementation to enforce a proper upper-bound on
+ * @num_items.
+ *
+ * The @states field is optional and when it is NULL it is up to the specific
+ * IOCTL implementation to decide which policy to enforce in case of failures
+ * in the middle of the batch processing: as of now each BATCHED IOCTLs fails
+ * as a whole as soon as one of the batched requests fails, without any kind
+ * of roll-back of the successful requests.
+ *
+ * When this container structure is used as parameter for one the _LIST
+ * IOCTLs listed below, @states is ignored in any case, and the @num_items
+ * field can be set to zero in input to query the system about the maximum
+ * number of available resources.
+ * Note that this idiomatic query-style is made available as an alternative
+ * usage pattern, but all of those total resources information are usually
+ * statically defined within the same session/boot and available by other
+ * means (IOCTLs).
+ *
+ * The field @item_sz MUST match the expected payload size for the specific
+ * IOCTL and it is supposed to be meaningfully set ALSO when @num_items is
+ * zero.
+ *
+ * @num_items: Number of items in @items and @states - IN/OUT
+ * @item_sz: Size of a single item contained in @items - IN
+ * @reserved: Some room for future expansion. Must be zero.
+ * @states: An optional  reference to an arrays of s32 items representing the
+ *	    outcome of the requests for each single item in @items: these are
+ *	    ordered in the same order as the @items. - OUT
+ * @items: A reference to an array of batched requests - IN/OUT
+ *
+ * Used by:
+ *	RW - SCMI_TLM_BATCH_READ
+ *	RW - SCMI_TLM_GET_DE_CFG
+ *	RW - SCMI_TLM_SET_DE_CFG
+ *	RW - SCMI_TLM_GET_DE_LIST
+ *	RW - SCMI_TLM_GET_UUID_LIST
+ *	RW - SCMI_TLM_GET_GRP_LIST
+ *	RW - SCMI_TLM_GET_SHMTI_LIST
+ *
+ */
+struct scmi_tlm_batch {
+	__u32 num_items;
+	__u32 item_sz;
+	__u64 reserved;
+	__u64 states;
+	__u64 items;
+};
+
+/**
+ * struct scmi_tlm_grp_info  - Group info descriptor
+ *
+ * @grp_id: Group ID number - IN
+ * @num_des: Number of DEs part of this group - OUT
+ * @num_intervals: Number of update intervals supported. Zero if group does not
+ *		   support per-group update interval configuration. - OUT
+ * @pad: Padding fields to enforce alignment
+ * @reserved: Some room for future expansion. Must be zero.
+ *
+ * Used by:
+ *	RW - SCMI_TLM_GET_GRP_INFO
+ *	RW - SCMI_TLM_GET_GRP_LIST (within a BATCH)
+ */
+struct scmi_tlm_grp_info {
+	__u32 grp_id;
+	__u32 num_des;
+	__u32 num_intervals;
+	__u32 pad;
+	__u64 reserved;
+};
+
+/**
+ * struct scmi_tlm_grp_desc  - Group descriptor
+ *
+ * @grp_id: Group ID number - IN
+ * @num_des: Number of DEs composing this group. In input represents the size
+ *	      of @composing_des, while in output carries the effective number
+ *	      of items filled-in - IN/OUT
+ * @composing_des: A reference to an array of __u32 elements containing the
+ *		   DataEvent IDs composing this group. - IN/OUT
+ * @reserved: Some room for future expansion. Must be zero.
+ *
+ * Used by:
+ *	RW - SCMI_TLM_GET_GRP_DESC
+ */
+struct scmi_tlm_grp_desc {
+	__u32 grp_id;
+	__u32 num_des;
+	__u64 composing_des;
+	__u64 reserved;
+};
+
+/**
+ * struct scmi_tlm_shmti_info  - SHMTI descriptor
+ *
+ * @sid: SHMTI ID - IN
+ * @fd: Associated opened file descriptor to use for mmap - OUT
+ * @len: Size of the SHMTI to be used with mmap on this SHMTI - OUT
+ * @offset: Offset in the mmap where the specified SHMTI start - OUT
+ * @reserved: Some room for future expansion. Must be zero.
+ *
+ * Used by:
+ *	RW - SCMI_TLM_GET_SHMTI_LIST (within a BATCH)
+ */
+struct scmi_tlm_shmti_info {
+	__u32 sid;
+	__u32 fd;
+	__u32 len;
+	__u32 offset;
+	__u64 reserved;
+};
+
+/**
+ * struct scmi_tlm_uuid  - UUID descriptor
+ *
+ * @bytes: An array of bytes containing the UUID in BigEndian order as
+ *	  per RFC 9562. - OUT
+ *
+ * Used by:
+ *	RW - SCMI_TLM_GET_UUID_LIST (within a BATCH)
+ */
+struct scmi_tlm_uuid {
+	__u8 bytes[SCMI_TLM_DE_IMPL_UUID_SZ];
+};
+
+/**
+ * struct scmi_tlm_event  - Event descriptor
+ *
+ * @type: Type of Telemetry event to subscribe/unsubscribe - IN
+ * @efd: An integer representing an open eventfd file descriptor, which will
+ *	 be used to signal the subscribed event. - IN
+ * @cookie: An integer used to represent a subscrition request: ONLY positive
+ *          values represents valid subscription.
+ *          On a new subscription this must be set to zero in input, to signify
+ *          that a new request is being made: if the subscription was
+ *          successful a positive integer is returned.
+ *          When, instead, @cookie is set to a positive integer in input, it
+ *          is interpreted as a reference to an existing subscription to be
+ *          cancelled.
+ * @pad: Padding fields to enforce alignment
+ * @reserved: Some room for future expansion. Must be zero.
+ *
+ * Used by:
+ *	SCMI_TLM_EVENT_SUBSCRIBE
+ */
+struct scmi_tlm_event {
+#define SCMI_TLM_EVT_GENERATION		0x0U
+#define SCMI_TLM_EVT_LAST		(SCMI_TLM_EVT_GENERATION)
+	__u32 type;
+	__u32 efd;
+	__u32 cookie;
+	__u32 pad;
+	__u64 reserved;
+};
+
+#define SCMI_TLM_IOCTL_MAGIC 0xF1
+
+#define SCMI_TLM_GET_ABI_INFO	_IOWR(SCMI_TLM_IOCTL_MAGIC, 0x00, struct scmi_tlm_abi_info)
+#define SCMI_TLM_GET_CFG	_IOWR(SCMI_TLM_IOCTL_MAGIC, 0x01, struct scmi_tlm_config)
+#define SCMI_TLM_SET_CFG	_IOW(SCMI_TLM_IOCTL_MAGIC, 0x02, struct scmi_tlm_config)
+#define SCMI_TLM_GET_INTRVS	_IOWR(SCMI_TLM_IOCTL_MAGIC, 0x03, struct scmi_tlm_intervals)
+#define SCMI_TLM_GET_DE_CFG	_IOWR(SCMI_TLM_IOCTL_MAGIC, 0x04, struct scmi_tlm_batch)
+#define SCMI_TLM_SET_DE_CFG	_IOWR(SCMI_TLM_IOCTL_MAGIC, 0x05, struct scmi_tlm_batch)
+#define SCMI_TLM_GET_DE_INFO	_IOWR(SCMI_TLM_IOCTL_MAGIC, 0x06, struct scmi_tlm_de_info)
+#define SCMI_TLM_GET_DE_LIST	_IOWR(SCMI_TLM_IOCTL_MAGIC, 0x07, struct scmi_tlm_batch)
+#define SCMI_TLM_DE_READ	_IOWR(SCMI_TLM_IOCTL_MAGIC, 0x08, struct scmi_tlm_de_sample)
+#define SCMI_TLM_GET_ALL_CFG	_IOWR(SCMI_TLM_IOCTL_MAGIC, 0x09, struct scmi_tlm_de_config)
+#define SCMI_TLM_SET_ALL_CFG	_IOW(SCMI_TLM_IOCTL_MAGIC, 0x0A, struct scmi_tlm_de_config)
+#define SCMI_TLM_GET_GRP_LIST	_IOWR(SCMI_TLM_IOCTL_MAGIC, 0x0B, struct scmi_tlm_batch)
+#define SCMI_TLM_GET_GRP_INFO	_IOWR(SCMI_TLM_IOCTL_MAGIC, 0x0C, struct scmi_tlm_grp_info)
+#define SCMI_TLM_GET_GRP_DESC	_IOWR(SCMI_TLM_IOCTL_MAGIC, 0x0D, struct scmi_tlm_grp_desc)
+#define SCMI_TLM_SINGLE_READ	_IOWR(SCMI_TLM_IOCTL_MAGIC, 0x0E, struct scmi_tlm_data_read)
+#define SCMI_TLM_BULK_READ	_IOWR(SCMI_TLM_IOCTL_MAGIC, 0x0F, struct scmi_tlm_data_read)
+#define SCMI_TLM_BATCH_READ	_IOWR(SCMI_TLM_IOCTL_MAGIC, 0x10, struct scmi_tlm_batch)
+#define SCMI_TLM_GET_SHMTI_LIST	_IOWR(SCMI_TLM_IOCTL_MAGIC, 0x11, struct scmi_tlm_batch)
+#define SCMI_TLM_RESET		_IO(SCMI_TLM_IOCTL_MAGIC,   0x12)
+#define SCMI_TLM_GET_UUID_LIST	_IOWR(SCMI_TLM_IOCTL_MAGIC, 0x13, struct scmi_tlm_batch)
+#define SCMI_TLM_EVENT_SUBSCRIBE	\
+	_IOWR(SCMI_TLM_IOCTL_MAGIC, 0x14, struct scmi_tlm_event)
+
+#endif /* _UAPI_LINUX_SCMI_H */
-- 
2.54.0

