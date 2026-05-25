Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D84281532
	for <arm-scmi@vger.kernel.org>; Mon, 25 May 2026 20:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779741866; cv=none; b=cR9zGvTq6ueIvl+qYQNEtA4lQ+H61tGK4mNnsUaJvmRjUOtCqk/HEC7CWM4RO9M3Vzhdd5a5IeAC/z7wbyceKNRnFJSvPgvu7EafzPhjOaHrvfX3uJ+TFDDTEGvOF2ftkWE+2P2PzcvGQclfUm0MFeW1Omo9s2+kDWM58Ii3XPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779741866; c=relaxed/simple;
	bh=cKIXVOQlD7u/l+/nPr4RgXq5HB9eDCFqKDI43ZG8ZKw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dqDK727Npu0BeOj/8AAwvDVyd4pUFBCWQ0VNDwx8BxHT38yLDJMshuAFHq9IeFWSgU04V2BUr6R59aMw1uPzqsE9pPIBTlvwtRtpuGPpt6+EYvErJHcz4FnRrBDVs3V6Oahi9PC5mxS0pLv2kyQD8iw2iR23JpgHoKVUDwv0w6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ajBC5xSd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ajBC5xSd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 055621F000E9;
	Mon, 25 May 2026 20:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779741864;
	bh=hi70jsuJNaRnrdjtRjHSlLfTtWECTJLNhN8fQ8AimIU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ajBC5xSdSxB14rtP1XRKd9uzpDzdG0r13Y2xYCbYFmZMLk+UcZ/JSvGi7QM9buH8/
	 TtKlMtU1W1Lco7Td2fgk4/exV5EH+qXrPC9F2lc/3Tkd1L2EPh5V5aP0rF5W0DajCU
	 h9sYORknsN2E8w2fNtzxjc7Jo+DOucwXND/yvzwVYXxCd3R5wZPMOdfKLILoE6l36x
	 xgVRnSw6NLkugDiT1DzM2du4eI7mJKlKC3/nu8uGw3N2+6pp9OaVq+uop8oOMVm6Vn
	 Ci4oapkNcm8njEWptSrWni9L9EaAOQ8GJbzn9BqTOHQjMkvpXyGs7URljB0pkDj0Gq
	 QZ7yyAr/0qPPg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Mon, 25 May 2026 21:42:46 +0100
Subject: [PATCH v2 8/9] firmware: arm_scmi: transport: Add ACPI PCC
 transport
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-acpi_scmi_pcc-v2-8-4f38938d08d8@arm.com>
References: <20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com>
In-Reply-To: <20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

Introduce a new SCMI transport that uses ACPI PCCT (PCC) subspaces via
the Linux PCC mailbox layer. The driver parses ACPI _DSD data to map
protocols to PCC subspace UIDs, supports shared TX/RX channels, and
optionally sets up a P2A channel for notifications.

Key points:
- new CONFIG_ARM_SCMI_TRANSPORT_PCC option
- integration with SCMI core via scmi_desc and transport ops
- response/notification fetch from PCC shared memory header/payload
- ACPI device matching and registration via the ACPI transport macro

This enables SCMI to be exercised over PCC on ACPI platforms.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/common.h            |  11 +
 drivers/firmware/arm_scmi/transports/Kconfig  |  12 +
 drivers/firmware/arm_scmi/transports/Makefile |   2 +
 drivers/firmware/arm_scmi/transports/pcc.c    | 593 ++++++++++++++++++++++++++
 include/linux/scmi_protocol.h                 |   1 +
 5 files changed, 619 insertions(+)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index 347e0da0d9cc..e4b2e1d3e7e7 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -465,6 +465,17 @@ struct scmi_transport_core_operations {
 	const struct scmi_message_operations *msg;
 };
 
+struct scmi_dsd_info {
+	u32 protocol_id;
+	const char *const property_name;
+};
+
+static struct scmi_dsd_info scmi_dsd_info_list[] = {
+	{ SCMI_PROTOCOL_BASE, "arm-arml0001-transport-pcc"},
+	{ SCMI_PROTOCOL_POWERCAP, "arm-arml0001-protocol-pcap"},
+	{ SCMI_PROTOCOL_TELEMETRY, "arm-arml0001-protocol-telemetry"},
+};
+
 /**
  * struct scmi_transport  - A structure representing a configured transport
  *
diff --git a/drivers/firmware/arm_scmi/transports/Kconfig b/drivers/firmware/arm_scmi/transports/Kconfig
index 57eccf316e26..4936078f279f 100644
--- a/drivers/firmware/arm_scmi/transports/Kconfig
+++ b/drivers/firmware/arm_scmi/transports/Kconfig
@@ -77,6 +77,18 @@ config ARM_SCMI_TRANSPORT_OPTEE
 	  This driver can also be built as a module. If so, the module
 	  will be called scmi_transport_optee.
 
+config ARM_SCMI_TRANSPORT_PCC
+	tristate "SCMI transport based on ACPI PCC"
+	depends on PCC
+	select ARM_SCMI_HAVE_TRANSPORT
+	help
+	  Enable ACPI PCC mailbox based transport for SCMI.
+
+	  If you want the ARM SCMI PROTOCOL stack to include support for a
+	  transport based on mailboxes, answer Y.
+	  This driver can also be built as a module. If so, the module
+	  will be called scmi_transport_pcc.
+
 config ARM_SCMI_TRANSPORT_VIRTIO
 	tristate "SCMI transport based on VirtIO"
 	depends on VIRTIO
diff --git a/drivers/firmware/arm_scmi/transports/Makefile b/drivers/firmware/arm_scmi/transports/Makefile
index 3ba3d3bee151..e7c4b8de6251 100644
--- a/drivers/firmware/arm_scmi/transports/Makefile
+++ b/drivers/firmware/arm_scmi/transports/Makefile
@@ -7,6 +7,8 @@ scmi_transport_mailbox-objs := mailbox.o
 obj-$(CONFIG_ARM_SCMI_TRANSPORT_MAILBOX) += scmi_transport_mailbox.o
 scmi_transport_optee-objs := optee.o
 obj-$(CONFIG_ARM_SCMI_TRANSPORT_OPTEE) += scmi_transport_optee.o
+scmi_transport_pcc-objs := pcc.o
+obj-$(CONFIG_ARM_SCMI_TRANSPORT_PCC) += scmi_transport_pcc.o
 scmi_transport_virtio-objs := virtio.o
 obj-$(CONFIG_ARM_SCMI_TRANSPORT_VIRTIO) += scmi_transport_virtio.o
 
diff --git a/drivers/firmware/arm_scmi/transports/pcc.c b/drivers/firmware/arm_scmi/transports/pcc.c
new file mode 100644
index 000000000000..aaebd1530370
--- /dev/null
+++ b/drivers/firmware/arm_scmi/transports/pcc.c
@@ -0,0 +1,593 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * System Control and Management Interface (SCMI) Message ACPI PCC
+ * Transport Driver
+ *
+ * This transport uses ACPI PCC (PCCT Type 3/4) subspaces via the Linux
+ * PCC mailbox controller to exchange SCMI messages over the standard
+ * SCMI Shared Memory Transport (SMT) layout.
+ *
+ * PCC subspace selection is conveyed via ACPI SCMI namespace device.
+ *
+ * Copyright (C) 2025
+ */
+
+#include <linux/acpi.h>
+#include <linux/err.h>
+#include <linux/device.h>
+#include <linux/hashtable.h>
+#include <linux/io.h>
+#include <linux/limits.h>
+#include <linux/mailbox_client.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <acpi/pcc.h>
+
+#include "../common.h"
+
+#define SCMI_SHMEM_FLAG_INTR_ENABLED		BIT(0)
+#define SCMI_TRANSPORT_PACKAGE_MAX_VERSION	(1)
+#define SCMI_PROTOCOL_PACKAGE_MAX_VERSION	(1)
+#define SCMI_TRANSPORT_SHARED_CHANNEL		BIT_ULL(0)
+#define SCMI_TRANSPORT_P2A_CHANNEL		BIT_ULL(1)
+#define SCMI_TRANSPORT_FLAGS_MASK		(SCMI_TRANSPORT_SHARED_CHANNEL | \
+					 SCMI_TRANSPORT_P2A_CHANNEL)
+
+/*
+ * SCMI specification requires all parameters, message headers, return
+ * arguments or any protocol data to be expressed in little endian
+ * format only.
+ */
+struct pcc_shared_mem {
+	struct acpi_pcct_ext_pcc_shared_memory header;
+	u8 msg_payload[];
+};
+
+/**
+ * struct scmi_pcc - Structure representing a SCMI mailbox transport
+ *
+ * @cl: Mailbox Client
+ * @pchan: Transmit/Receive PCC/mailbox channel
+ * @cinfo: SCMI channel info
+ * @shmem: Transmit/Receive shared memory area
+ */
+struct scmi_pcc {
+	struct mbox_client cl;
+	struct pcc_mbox_chan *pchan;
+	struct scmi_chan_info *cinfo;
+};
+
+struct pcc_transport {
+	u32 uid;
+	u32 pcc_ss_id;
+	u32 protocol_id;
+	u32 flags;
+	struct hlist_node hnode;
+};
+
+/* Not all MAX_PCC_SUBSPACES will be used for SCMI, keeping it at 16 for now */
+static DECLARE_HASHTABLE(pcc_id_hash, ilog2(MAX_PCC_SUBSPACES / 8));
+
+#define client_to_scmi_pcc(c) container_of(c, struct scmi_pcc, cl)
+
+static struct scmi_transport_core_operations *core;
+
+static void acpi_scmi_clear_transport_hash(void)
+{
+	struct pcc_transport *p;
+	struct hlist_node *tmp;
+	int idx;
+
+	hash_for_each_safe(pcc_id_hash, idx, tmp, p, hnode) {
+		hash_del(&p->hnode);
+		kfree(p);
+	}
+}
+
+static int acpi_scmi_dsd_parse_transport_package(const union acpi_object *obj)
+{
+	unsigned int revision, pkg_cnt;
+	unsigned int common_a2p = 0, common_p2a = 0;
+	int idx;
+
+	if (obj->type != ACPI_TYPE_PACKAGE || obj->package.count < 2)
+		return -EINVAL;
+	if (obj->package.elements[0].type != ACPI_TYPE_INTEGER ||
+	    obj->package.elements[1].type != ACPI_TYPE_INTEGER)
+		return -EINVAL;
+
+	revision = obj->package.elements[0].integer.value;
+	pkg_cnt = obj->package.elements[1].integer.value;
+
+	if (revision != SCMI_TRANSPORT_PACKAGE_MAX_VERSION)
+		return -EINVAL;
+	if (obj->package.count != pkg_cnt + 2)
+		return -EINVAL;
+
+	for (idx = 0; idx < pkg_cnt; idx++) {
+		union acpi_object *pack = &obj->package.elements[idx + 2];
+		struct pcc_transport *p, *tmp;
+		u64 flags;
+		u32 uid;
+
+		if (pack->type != ACPI_TYPE_PACKAGE || pack->package.count != 3) {
+			pr_info("Invalid transport properties pkg %d\n", idx);
+			return -EINVAL;
+		}
+		if (pack->package.elements[0].type != ACPI_TYPE_INTEGER ||
+		    pack->package.elements[1].type != ACPI_TYPE_INTEGER ||
+		    pack->package.elements[2].type != ACPI_TYPE_INTEGER)
+			return -EINVAL;
+		if (pack->package.elements[0].integer.value > U32_MAX ||
+		    pack->package.elements[1].integer.value > U32_MAX)
+			return -EINVAL;
+
+		flags = pack->package.elements[2].integer.value;
+		if (flags & ~SCMI_TRANSPORT_FLAGS_MASK)
+			return -EINVAL;
+
+		uid = pack->package.elements[1].integer.value;
+		hash_for_each_possible(pcc_id_hash, tmp, hnode, uid) {
+			if (tmp->uid == uid) {
+				pr_info("Duplicate UID %d\n", uid);
+				return -EEXIST;
+			}
+		}
+
+		p = kzalloc(sizeof(*p), GFP_KERNEL);
+		if (!p)
+			return -ENOMEM;
+
+		p->uid = uid;
+		p->pcc_ss_id = pack->package.elements[0].integer.value;
+		p->flags = flags;
+		if (p->flags & SCMI_TRANSPORT_SHARED_CHANNEL) {
+			p->protocol_id = SCMI_PROTOCOL_BASE;
+			if (p->flags & SCMI_TRANSPORT_P2A_CHANNEL)
+				common_p2a++;
+			else
+				common_a2p++;
+		}
+
+		hash_add(pcc_id_hash, &p->hnode, uid);
+	}
+
+	if (common_a2p != 1 || common_p2a > 1)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int acpi_scmi_dsd_parse_protocol_subpackage(const union acpi_object *obj,
+						   int prot_id)
+{
+	bool found, tx_found = false, rx_found = false;
+	u32 uid;
+	int idx, ret = 0;
+	struct pcc_transport *p;
+	unsigned int pkg_cnt = obj->package.count;
+
+	if (pkg_cnt > 2) {
+		pr_warn("Only 2 channels: one Tx and one Rx needed\n");
+		return -EINVAL;
+	}
+
+	for (idx = 0; idx < pkg_cnt; idx++) {
+		union acpi_object *pack = &obj->package.elements[idx];
+		u64 flags;
+
+		if (pack->type != ACPI_TYPE_PACKAGE || pack->package.count != 2)
+			return -EINVAL;
+		if (pack->package.elements[0].type != ACPI_TYPE_INTEGER ||
+		    pack->package.elements[1].type != ACPI_TYPE_INTEGER)
+			return -EINVAL;
+		if (pack->package.elements[0].integer.value > U32_MAX)
+			return -EINVAL;
+
+		flags = pack->package.elements[1].integer.value;
+		if (flags)
+			return -EINVAL;
+
+		uid = pack->package.elements[0].integer.value;
+		found = false;
+		hash_for_each_possible(pcc_id_hash, p, hnode, uid) {
+			if (p->uid != uid)
+				continue;
+
+			found = true;
+			if (p->flags & SCMI_TRANSPORT_SHARED_CHANNEL) {
+				pr_info("Invalid! %d channel is shared\n",
+					p->pcc_ss_id);
+				ret = -EINVAL;
+				break;
+			}
+			if (p->flags & SCMI_TRANSPORT_P2A_CHANNEL) {
+				if (rx_found)
+					return -EINVAL;
+				rx_found = true;
+			} else {
+				if (tx_found)
+					return -EINVAL;
+				tx_found = true;
+			}
+			p->protocol_id = prot_id;
+			break;
+		}
+
+		if (ret)
+			return ret;
+		if (!found)
+			return -ENOENT;
+	}
+
+	return ret;
+}
+
+static int
+acpi_scmi_dsd_parse_protocol_package(const union acpi_object *obj, int prot_id)
+{
+	unsigned int revision;
+	union acpi_object *pack;
+	int ret;
+
+	if (obj->type != ACPI_TYPE_PACKAGE || obj->package.count != 3)
+		return -EINVAL;
+	if (obj->package.elements[0].type != ACPI_TYPE_INTEGER)
+		return -EINVAL;
+
+	revision = obj->package.elements[0].integer.value;
+	pack = &obj->package.elements[1];
+
+	if (revision != SCMI_PROTOCOL_PACKAGE_MAX_VERSION)
+		return -EINVAL;
+
+	if (pack->type != ACPI_TYPE_PACKAGE) {
+		pr_info("Invalid protocol transport package\n");
+		return -EINVAL;
+	}
+
+	/* Empty protocol specific transport package allowed */
+	if (pack->package.count != 0) {
+		ret = acpi_scmi_dsd_parse_protocol_subpackage(pack, prot_id);
+		if (ret)
+			return ret;
+	}
+
+	pack = &obj->package.elements[2];
+	if (pack->type != ACPI_TYPE_PACKAGE) {
+		pr_info("Invalid protocol transport association package\n");
+		return -EINVAL;
+	}
+
+	if (pack->package.count != 0) {
+		pr_info("Non-empty association package not supported\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/* ACPI SCMI _DSD UUID: "84a2d1c6-86b6-4199-8dac-9c17449d5e03" */
+static const guid_t acpi_scmi_uuid = GUID_INIT(0x84a2d1c6, 0x86b6, 0x4199,
+					       0x8d, 0xac, 0x9c, 0x17,
+					       0x44, 0x9d, 0x5e, 0x03);
+
+static int acpi_scmi_lookup_protocol_id(const char *name)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(scmi_dsd_info_list); i++) {
+		if (!strcmp(name, scmi_dsd_info_list[i].property_name))
+			return scmi_dsd_info_list[i].protocol_id;
+	}
+	return -ENOENT;
+}
+
+static int acpi_scmi_parse_properties(const union acpi_object *properties)
+{
+	int i;
+
+	if (properties->type != ACPI_TYPE_PACKAGE)
+		return -EINVAL;
+
+	for (i = 0; i < properties->package.count; i++) {
+		const union acpi_object *property;
+		const union acpi_object *k, *v;
+		int prot_id, ret;
+
+		property = &properties->package.elements[i];
+		if (property->type != ACPI_TYPE_PACKAGE ||
+		    property->package.count != 2)
+			return -EINVAL;
+
+		k = &property->package.elements[0];
+		v = &property->package.elements[1];
+
+		if (k->type != ACPI_TYPE_STRING || !k->string.pointer)
+			return -EINVAL;
+		if (v->type != ACPI_TYPE_PACKAGE)
+			return -EINVAL;
+
+		prot_id = acpi_scmi_lookup_protocol_id(k->string.pointer);
+		if (prot_id < 0)
+			return -EINVAL;
+
+		/*
+		 * We validate structure inside the dedicated parsing functions.
+		 * They return proper errors and avoid double-validation.
+		 */
+		if (prot_id == SCMI_PROTOCOL_BASE)
+			ret = acpi_scmi_dsd_parse_transport_package(v);
+		else
+			ret = acpi_scmi_dsd_parse_protocol_package(v, prot_id);
+
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
+static int acpi_scmi_parse_dsd(struct acpi_device *adev)
+{
+	struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *desc;
+	acpi_status status;
+	int i, ret = -ENOENT;
+
+	if (!adev->handle)
+		return -EINVAL;
+
+	status = acpi_evaluate_object_typed(adev->handle, "_DSD", NULL, &buf,
+					    ACPI_TYPE_PACKAGE);
+	if (ACPI_FAILURE(status))
+		return -EINVAL;
+
+	desc = buf.pointer;
+	if (desc->package.count % 2)
+		goto out_free_inval;
+
+	/* Look for the device properties GUID. */
+	for (i = 0; i < desc->package.count; i += 2) {
+		const union acpi_object *guid;
+		const union acpi_object *properties;
+
+		guid = &desc->package.elements[i];
+		properties = &desc->package.elements[i + 1];
+
+		/*
+		 * The first element must be a GUID and the second one must be
+		 * a package.
+		 */
+		if (guid->type != ACPI_TYPE_BUFFER ||
+		    guid->buffer.length != UUID_SIZE ||
+		    properties->type != ACPI_TYPE_PACKAGE)
+			continue;
+
+		if (!guid_equal((guid_t *)guid->buffer.pointer,
+				&acpi_scmi_uuid))
+			continue;
+
+		ret = acpi_scmi_parse_properties(properties);
+		goto out_free;
+	}
+
+out_free:
+	ACPI_FREE(buf.pointer);
+	return ret;
+out_free_inval:
+	ret = -EINVAL;
+	goto out_free;
+}
+
+static int acpi_scmi_namespace_device_parse(struct fwnode_handle *fwnode)
+{
+	struct acpi_device *adev = to_acpi_device_node(fwnode);
+	int ret;
+
+	acpi_scmi_clear_transport_hash();
+	hash_init(pcc_id_hash);
+
+	ret = acpi_scmi_parse_dsd(adev);
+	if (ret)
+		acpi_scmi_clear_transport_hash();
+
+	return ret;
+}
+
+static int pcc_get_ss_id(u32 prot_id, bool tx)
+{
+	struct pcc_transport *p;
+	int idx;
+
+	hash_for_each(pcc_id_hash, idx, p, hnode) {
+		if (p->protocol_id != prot_id)
+			continue;
+
+		if ((!tx && (p->flags & SCMI_TRANSPORT_P2A_CHANNEL)) ||
+		    (tx && !(p->flags & SCMI_TRANSPORT_P2A_CHANNEL)))
+			return p->pcc_ss_id;
+	}
+
+	return -ENOENT;
+}
+
+static bool
+pcc_chan_available(struct fwnode_handle *fwnode, int prot_id, int idx)
+{
+	/*
+	 * Parse the ACPI SCMI namespace device on each Tx-channel lookup and
+	 * reuse the resulting mapping for the matching Rx lookup. Defer full
+	 * validation until pcc_chan_setup() for simplicity.
+	 */
+	if (!idx && acpi_scmi_namespace_device_parse(fwnode))
+		return false;
+
+	if (pcc_get_ss_id(prot_id, idx ? false : true) < 0)
+		return false;
+
+	return true;
+}
+
+static void tx_prepare(struct mbox_client *cl, void *m)
+{
+	struct scmi_pcc *smbox = client_to_scmi_pcc(cl);
+	struct pcc_shared_mem __iomem *shmem = smbox->pchan->shmem;
+	struct scmi_xfer *xfer = m;
+
+	/*
+	 * PCC take cares not to call tx_prepare until last transmit is done
+	 * Mark channel busy + clear error, request platform IRQ if available
+	 */
+	if (smbox->pchan->mchan->mbox->txdone_irq)
+		iowrite32(SCMI_SHMEM_FLAG_INTR_ENABLED, &shmem->header.flags);
+	iowrite32(sizeof(shmem->header.command) + xfer->tx.len,
+		  &shmem->header.length);
+	iowrite32(pack_scmi_header(&xfer->hdr), &shmem->header.command);
+	if (xfer->tx.buf)
+		memcpy_toio(shmem->msg_payload, xfer->tx.buf, xfer->tx.len);
+}
+
+static void rx_callback(struct mbox_client *cl, void *m)
+{
+	struct scmi_pcc *smbox = client_to_scmi_pcc(cl);
+	struct pcc_shared_mem __iomem *shmem = smbox->pchan->shmem;
+
+	core->rx_callback(smbox->cinfo, ioread32(&shmem->header.command), NULL);
+}
+
+static int pcc_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
+			  bool tx)
+{
+	const char *desc = tx ? "Tx" : "Rx";
+	struct device *cdev = cinfo->dev;
+	struct scmi_pcc *smbox;
+	int ret, ss_id;
+	struct mbox_client *cl;
+
+	smbox = devm_kzalloc(dev, sizeof(*smbox), GFP_KERNEL);
+	if (!smbox)
+		return -ENOMEM;
+
+	cl = &smbox->cl;
+	cl->dev = cdev;
+	cl->tx_prepare = tx ? tx_prepare : NULL;
+	cl->rx_callback = rx_callback;
+	cl->tx_block = false;
+
+	ss_id = pcc_get_ss_id(cinfo->id, tx);
+	if (ss_id < 0)
+		return ss_id;
+
+	smbox->pchan = pcc_mbox_request_channel(cl, ss_id);
+	if (IS_ERR(smbox->pchan)) {
+		ret = PTR_ERR(smbox->pchan);
+		if (ret != -EPROBE_DEFER)
+			dev_err(cdev,
+				"failed to request SCMI %s mailbox\n", desc);
+		return ret;
+	}
+
+	cinfo->transport_info = smbox;
+	smbox->cinfo = cinfo;
+
+	return 0;
+}
+
+static int pcc_chan_free(int id, void *p, void *data)
+{
+	struct scmi_chan_info *cinfo = p;
+	struct scmi_pcc *smbox = cinfo->transport_info;
+
+	if (smbox && !IS_ERR(smbox->pchan)) {
+		pcc_mbox_free_channel(smbox->pchan);
+		cinfo->transport_info = NULL;
+		smbox->pchan = NULL;
+		smbox->cinfo = NULL;
+	}
+
+	return 0;
+}
+
+static int
+pcc_send_message(struct scmi_chan_info *cinfo, struct scmi_xfer *xfer)
+{
+	struct scmi_pcc *smbox = cinfo->transport_info;
+	int ret;
+
+	/*
+	 * The mailbox layer has its own queue. However the mailbox queue
+	 * confuses the per message SCMI timeouts since the clock starts when
+	 * the message is submitted into the mailbox queue. So when multiple
+	 * messages are queued up the clock starts on all messages instead of
+	 * only the one inflight.
+	 */
+	ret = mbox_send_message(smbox->pchan->mchan, xfer);
+	/* mbox_send_message returns non-negative value on success */
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static void pcc_fetch_response(struct scmi_chan_info *cinfo,
+			       struct scmi_xfer *xfer)
+{
+	struct scmi_pcc *smbox = cinfo->transport_info;
+	struct pcc_shared_mem __iomem *shmem = smbox->pchan->shmem;
+	size_t len = ioread32(&shmem->header.length);
+
+	xfer->hdr.status = ioread32(shmem->msg_payload);
+	/* Skip the length of header and status in shmem area i.e 8 bytes */
+	xfer->rx.len = min_t(size_t, xfer->rx.len, len > 8 ? len - 8 : 0);
+
+	/* Take a copy to the rx buffer.. */
+	memcpy_fromio(xfer->rx.buf, shmem->msg_payload + 4, xfer->rx.len);
+}
+
+static void pcc_fetch_notification(struct scmi_chan_info *cinfo, size_t max_len,
+				   struct scmi_xfer *xfer)
+{
+	struct scmi_pcc *smbox = cinfo->transport_info;
+	struct pcc_shared_mem __iomem *shmem = smbox->pchan->shmem;
+	size_t len = ioread32(&shmem->header.length);
+
+	/* Skip only the length of header in shmem area i.e 4 bytes */
+	xfer->rx.len = min_t(size_t, max_len, len > 4 ? len - 4 : 0);
+
+	/* Take a copy to the rx buffer.. */
+	memcpy_fromio(xfer->rx.buf, shmem->msg_payload, xfer->rx.len);
+}
+
+static const struct scmi_transport_ops scmi_pcc_ops = {
+	.chan_available = pcc_chan_available,
+	.chan_setup = pcc_chan_setup,
+	.chan_free = pcc_chan_free,
+	.send_message = pcc_send_message,
+	.fetch_response = pcc_fetch_response,
+	.fetch_notification = pcc_fetch_notification,
+};
+
+static struct scmi_desc scmi_pcc_desc = {
+	.ops = &scmi_pcc_ops,
+	.max_rx_timeout_ms = 30,	/* We may increase this if required */
+	.max_msg = 20,		/* Limited by MBOX_TX_QUEUE_LEN */
+	.max_msg_size = SCMI_SHMEM_MAX_PAYLOAD_SIZE,
+};
+
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id scmi_acpi_ids[] = {
+	{ "ARML0001", 0 },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(acpi, scmi_acpi_ids);
+#endif
+
+DEFINE_SCMI_ACPI_TRANSPORT_DRIVER(scmi_pcc, scmi_pcc_driver,
+				  scmi_pcc_desc, scmi_acpi_ids, core);
+module_platform_driver(scmi_pcc_driver);
+
+MODULE_AUTHOR("Sudeep Holla <sudeep.holla@kernel.org>");
+MODULE_DESCRIPTION("SCMI ACPI PCC Transport driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index aafaac1496b0..d4ab8d918ee9 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -926,6 +926,7 @@ enum scmi_std_protocol {
 	SCMI_PROTOCOL_VOLTAGE = 0x17,
 	SCMI_PROTOCOL_POWERCAP = 0x18,
 	SCMI_PROTOCOL_PINCTRL = 0x19,
+	SCMI_PROTOCOL_TELEMETRY = 0x1B,
 };
 
 enum scmi_system_events {

-- 
2.43.0

