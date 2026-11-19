Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102208;
	b=zKGD/UUx+fPCNjSgc5BsM+9HHEtR6qWGRO8Q5XnL+427CQFYS5xhCMoykaQb/gyDr56y
	 VfCiUSbBV/FTcV/0p9QQlRlmxiauoN7IDU6tfVgVExvWQ/VfmZY/9uTpvZOXPFCr03uUi
	 4HBOcbyqBTo6BmpmHYqqxZbnZSg6EH/54PDygd7iT3n030NYENzPZlsnVSYbLgvNjbyNq
	 L8SKopIHpNxb20rATf51wx8ejxQYtz19YPi08njsyc4K8DPrc82aDZGvB//tnd0mREAy0
	 Jl6Ky8eUJGeuKDb5fdWtjjJl8MlFvJNpP82rIkTDsYuY2aulsixz+/tazpWlm7hrSww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102208;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=Sq/o5/RWB2VcNm6g8LKntDR90dLnqjYMKn7vzdDeCwk=;
	b=ba1Rj88Ec++c+R/brhViiP/7Ut9YjaCGUl2yzq9Gw0xl1y5KuNEAXBfiRYlqM+vztSnN
	 J5DpNKS04dz3VitWLUusMamIUJ+lepEht2CAfb2frcKs6P3fK5Z6m9lc59ClkSBND7qD7
	 YF20/wHbMNgTad/mqWikju5QybP9LwJ0GYfySS4TPZYChKh1TtZDCB95E7+P2y3CPiuVv
	 0wwCKyoCo4K7nQ9NFFjPpO8xnxSWDIdB70LI6LWCoTDiyLwksrfIq+OENuh+k96Rczk65
	 rn6orlmGCDaT+/skK/NEW2PZsPybvO4Wt8vdnzP7uQho5cA3wtZ239zp8jJHHAtlx0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jqdbkuR6;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C406606A32C
	for <arm-scmi@vger.kernel.org>; Thu, 19 Nov 2026 15:30:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C406606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jqdbkuR6
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CF75F4E41661
	for <arm-scmi@vger.kernel.org>; Thu, 19 Nov 2026 15:30:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9D94860237;
	Thu, 19 Nov 2026 15:30:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BC6D811BC0CC9;
	Thu, 19 Nov 2026 16:29:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795102200; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Sq/o5/RWB2VcNm6g8LKntDR90dLnqjYMKn7vzdDeCwk=;
	b=jqdbkuR6p/rmsNCYl2BZQiuRlbFj4J+0WxVQZluFvLJjDXiX2xpHJ5JdXfaTBT4gqlirVT
	7vIibrONpkKRJmBAXv5rxFhFdT2MR6t1bV+n/Sl+ZSqYK4y66kPUKo0bC7X0dtF6jRZ75s
	sH3+lg+LUU7iahvColbzp7eizb4xx4Nq6DX/hK7aSmJKIV9sHXXOuDOODOzSevrwkzO3A/
	LdWVE8vAfHTKp9qMAUDna6phRclWchaOBWbu5VoqgedrlabeIhUU9zchtmDVBbCRqOZM6z
	l+LdTxFZxPM0wtiGSOrY/si3/QA+ohjdBypsghmbwFfEs29dNAaHd6Yoa+qGcw==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	George Cherian <gcherian@marvell.com>,
	Sujeet Baranwal <sbaranwal@marvell.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH 1/3] dt-bindings: mailbox: add Marvell MHU
Date: Thu, 19 Nov 2026 16:29:42 +0100
Message-ID: <20261119152944.276763-2-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119152944.276763-1-paul.cercueil@bootlin.com>
References: <20261119152944.276763-1-paul.cercueil@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3

From: George Cherian <gcherian@marvell.com>

Marvell Message Handling Unit is a mailbox controller present in
Marvell OcteonTx and OcteonTX2 SoC family.

Signed-off-by: George Cherian <gcherian@marvell.com>
Co-developed-by: Sujeet Baranwal <sbaranwal@marvell.com>
Signed-off-by: Sujeet Baranwal <sbaranwal@marvell.com>
Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
---
 .../bindings/mailbox/marvell,mhu.yaml         | 60 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/marvell,mhu.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/marvell,mhu.yaml b/Documentation/devicetree/bindings/mailbox/marvell,mhu.yaml
new file mode 100644
index 000000000000..228607165f85
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/marvell,mhu.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/marvell,mhu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Message Handling Unit
+
+maintainers:
+  - Sujeet Baranwal <sbaranwal@marvell.com>
+  - George Cherian <gcherian@marvell.com>
+
+description:
+  The Control-Processors Cluster (CPC) provides Arm-platform specification
+  entities for managing the system. One of the CPC processors is the System
+  Control Processor (SCP). The SCP is responsible, among others, for booting
+  the chip, clock and power initialization, controlling power consumption
+  through DVFS, monitoring temperature sensors and controlling AVS. The SCP,
+  as each XCP, contains mailboxes for software-to-software communications.
+  Mailbox writes cause an interrupt to the local XCP core or to the AP.
+  This driver exposes AP-SCP Message Handling Unit to the system, providing
+  the mailbox communication mechanism to the system, with the intention
+  of plugging into the SCMI framework. It is designed to work with Marvell
+  OcteonTX and OcteonTX2-based platforms.
+  The mailbox has no other usage than SCMI communication. In case of
+  configurations running without SCMI support it should be disabled.
+
+properties:
+  compatible:
+    enum:
+      - marvell,octeontx-mhu
+      - marvell,octeontx2-mhu
+      - marvell,cn10-mhu
+
+  reg:
+    maxItems: 1
+
+  "#mbox-cells":
+    description: Index of the channel
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#mbox-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    ecam {
+        #address-cells = <3>;
+        #size-cells = <2>;
+            mailbox: mailbox@1c,0 {
+                compatible = "marvell,octeontx2-mhu";
+                reg = <0xe000 0x0 0x0 0 0>;
+                #mbox-cells = <1>;
+            };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 65e8a4b5c90b..b592a62a5c56 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15959,6 +15959,12 @@ R:	Vamsi Attunuru <vattunuru@marvell.com>
 S:	Supported
 F:	drivers/pci/hotplug/octep_hp.c
 
+MARVELL MHU MAILBOX DRIVER
+M:	Sujeet Baranwal <sbaranwal@marvell.com>
+M:	George Cherian <gcherian@marvell.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/mailbox/marvell,mhu.yml
+
 MATROX FRAMEBUFFER DRIVER
 L:	linux-fbdev@vger.kernel.org
 S:	Orphan
-- 
2.47.3

