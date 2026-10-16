Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04E60547040;
	Fri, 16 Oct 2026 18:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792177017; cv=none; b=KLHIZj0i6PwPWLTj0sCiC0uH8QMBEbTvWkmxZRi5W6l5KMWt+ZUutbOo7qrPfbLOyqw0bufJjUU/Hsev7qtA9vYQacZsdLmAw0agZNI8UA41+TVU6wL6LTIPmllUPcCorw2tPQChNaMFXrm7WGWCMzcEOVVgYfsBJ9amzkSZB1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792177017; c=relaxed/simple;
	bh=hfA0ap4Xo70CAlarCd2qZoILhqj61SvsIL72n1hY+fo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tad2xX8pyqkjJ8KzF6Rrg8ATljLgB9FkdyPky1kjoL+YQ2WfQrjMkR+lZNSS33NQapZEhdRF7bR1q3LaV5V4uotGXk5BqFQ9ToftOvOti617fTIMU6dvArcWxn2iw8QkNprMReW6cXlgrBLsK2vgJXGF4+/5HGbxtpfw9xXGaOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Du6PDgcC; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Du6PDgcC"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3172E16A3;
	Fri, 16 Oct 2026 11:56:52 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E1D13F7B4;
	Fri, 16 Oct 2026 11:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792177015; bh=hfA0ap4Xo70CAlarCd2qZoILhqj61SvsIL72n1hY+fo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Du6PDgcC0MUT4aRpmUmXlg34efz6bUpx7lLfJ3NZ3uHhYlkK+RDO3T5OkrWvxslnv
	 epblL3SqXGmX88wUNwsKEIk1n9k4HzPVYS1IwJeSROC4TCwq8YqBBO1iP+JIrb+9Kq
	 0K9f8mGnMI7/AkYYf8o0S9S5ocSjQ7rK1lyeBMkI=
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
	"Rob Herring (Arm)" <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v14 05/32] dt-bindings: firmware: arm,scmi: Add support for telemetry protocol
Date: Fri, 16 Oct 2026 19:55:26 +0100
Message-ID: <20261016185553.2794459-6-cristian.marussi@arm.com>
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

Add new SCMI v4.0 Telemetry protocol bindings definitions.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v3 --> v4
 - changed protocol number to lowercase 1b
 - fixed misplaced block for protocol 0x1b

Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/firmware/arm,scmi.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
index 6fc44105f1c3..b63543390fd9 100644
--- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
+++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
@@ -324,6 +324,14 @@ properties:
     required:
       - reg
 
+  protocol@1b:
+    $ref: '#/$defs/protocol-node'
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        const: 0x1b
+
 unevaluatedProperties: false
 
 $defs:
-- 
2.54.0

