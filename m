Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 176BA3BCD14;
	Sun,  2 Aug 2026 14:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785682661; cv=none; b=Uyxq+q5GRmqi2qhxZKgG9irK8jBbbnAsGwNODpqgc2mhyBIkHixp2bgqAwQERIjZmEFQ62LblDjwmRhlMJwXUvK/bRn0nNNvdr0GX9GzTziab+WXM7hgZ9ISxb9l0d5YnYLE7Mpv3uAQRBz/G3w0n+Sq4/sExPYzXUkztDo6wPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785682661; c=relaxed/simple;
	bh=9vZoBgzFE2THNFE8s+a0rg1bPJg4MV54NAwQFcIi1xY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qAZPQDzMONB1BIhAppOSXPXOt/t/OhrTGFirfbbUm21171C2wopg6IGo7yNA3re4nDsgNH0G3KnCsRlHEIBfcTLDTS4b1Q2p5A+oEU8gKl0yAnaCiW1rKGBkhVNJYuLgwsDQzSCmkJzWyIB8Ontt0JF8g2nJ+hpVbeK2ByT8CXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iYL4y/j5; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iYL4y/j5"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C6A1143D;
	Sun,  2 Aug 2026 07:57:35 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C27053F632;
	Sun,  2 Aug 2026 07:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785682659; bh=9vZoBgzFE2THNFE8s+a0rg1bPJg4MV54NAwQFcIi1xY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iYL4y/j5ORHJzlc+xS312E/V+qHSA07A02PkxU/CDlx7EOwFl3nzC0Bqv9Gz6ttHB
	 zMHUwuQib5wm8YY+PosdcTkG+/b16fR09G+YcY2TIX6EHRlnSAvQI5U8dcY6JybWyN
	 GI8jRo/fX4bfWDfo85EY+nfwsWNpmHbjDlk3oUcE=
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
	"Rob Herring (Arm)" <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v7 04/23] dt-bindings: firmware: arm,scmi: Add support for telemetry protocol
Date: Sun,  2 Aug 2026 15:55:59 +0100
Message-ID: <20260802145618.1952804-5-cristian.marussi@arm.com>
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
index d06cca9273c4..be733f8d60a0 100644
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

