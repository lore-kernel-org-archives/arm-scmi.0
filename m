Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795304632;
	b=ECxTfKx/2ezvH7J6spZRf3cFGKUxwJ9KJ1f0Q4+clknjE5QqBFj6ZEdHiqaswdThQjL9
	 p2k5hATUXOsxCpHbacyYxPze72Il2dSQTvyI7KSMi7Ud46Ri52eRy5SRwP4G6gr7muScP
	 dbEbeHWc7dzgA9ytClaKdYgcbGjOFuol+olgowPZbmXo9XYL6y191pXVxMJOyMQayBSw+
	 ff1kntOKqxNEA25w2RBRV3yznJ2qiDFnKI8b1sGnYZ3DpZYm7mfGRz9/6/8FO5lhibfmW
	 7yyAz0wv3VvhAlY4yh/LXDgn7Q9sFY3m2aqWH1UqqiWGvYRrx1O9Wx1ODXUioLGnTcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795304632;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t7R2yoCiAeLQBhB6gJTWyBDgFqLo/L9FrePQ72IrN3c=;
	b=0gEI2ezqBIVGD4Uz5rwlI96ZCyaAz5GipRYMMVCzJsZGtaBk/hqnMuxwkm6T2V9yktNe
	 TdqxvhIx1TL9UNUkCSgYkq8WYD6PNPVavCZTHcqh71YdL74Hm9q1Egr06h0gRipG1gFTr
	 mNgSqqJdpRUcDs5Yx3fiOeFar3siloIMsktv/JFMqZyAhHrI0EexNSd0vPn4Rnw7h4CDg
	 OGo+RecZ1/r67qKYWgftdtkUF/ax5ggwgtyZvaliuJMyO/E2N5vaeM/dvggc70c+G9u0U
	 y0DlHe3I9KoKVFsHhRIZf4iYLifZWr5qpQskDr8u+XltFyNQc/657dGRMXTy1tIshzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=BdrPFbed;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3909606A334;
	Sat, 21 Nov 2026 23:43:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3909606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=BdrPFbed
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2336A1575;
	Sat, 21 Nov 2026 15:43:48 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6A3C3F632;
	Sat, 21 Nov 2026 15:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795304631; bh=hfA0ap4Xo70CAlarCd2qZoILhqj61SvsIL72n1hY+fo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BdrPFbedUT68TTWy7vCZmFOcSK2bF9LKpVBKpZahm2E0YYtNnTOGE8A6K0JeJ0Z8v
	 UH4SlT2eWxFNisnOlSYFkBUjcbTUBCLJ4QrrvmJi/eTehXeWt34AMnKoZ9t+jzoW5c
	 L/UBQJmZ8DLdI4k4jCxn8LBM+iIHp3SCp7ycUDHc=
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
Subject: [PATCH v16 08/31] dt-bindings: firmware: arm,scmi: Add support for telemetry protocol
Date: Sat, 21 Nov 2026 23:39:42 +0000
Message-ID: <20261121234005.1525419-9-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261121234005.1525419-1-cristian.marussi@arm.com>
References: <20261121234005.1525419-1-cristian.marussi@arm.com>
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

