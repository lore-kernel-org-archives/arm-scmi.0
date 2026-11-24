Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549835;
	b=ibHubjds23YnldBL2HvKtd7nLJPtT6Gj3Y2NKkO3QbPs2H7B0Sgu8X3mX3135tEVwgm2
	 w9doAZXNOGJtUun1wVFrS7bLROm6wtycrAtkLbgqZaA6F2xrwQHLwXVRuL68mjxbmDmUK
	 lvciX3uCY/mQweDmwLY5kxbSPKBPC/KD7xEiUfI0N/ybJw/3f4zd4cne5/EZyi+HRDROF
	 HzuS4pdm2uDWH+qTBf80ZeP0lOWH2Ha2KZQRyk4/cRuKYlxnKpYlSEiMqKHwDFwAzFGgI
	 8T4MAw7cG8hvgIZNXoANPFLEl9fypznodZ0htm8miYBCotYIaCLXhiXkbiPgDquUEiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549835;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t7R2yoCiAeLQBhB6gJTWyBDgFqLo/L9FrePQ72IrN3c=;
	b=yh7A5llF6+CBVAEpKH5VgKarK2D8qvhzFLO3KDuiEI5KzrgIGtbQ4Dwyn0kC1BBXUc1Q
	 7poQR1Wtm0JGsL5zLcI/nolQcDfE0hzbm6cPODAex/WmBV8R4VzWEAllt7wHDAtqJk3/P
	 5F/fmjqjSehBsZvfdTF+32V6sFFIJuyxop3qNa/Z7lHimr0faekLvDi8wlCAcX03ktZfe
	 P1KpGwUk9CHQAL8fKYOrrA8QGQfdA7E/cejYw9nMnefPXEl2MfstE+K3aYjah29YeQzSI
	 tTCWo9OSZG2rY91gyk0XtaN7Zaq2yVb31OnKIPedw0PyWdCip8zt9/eh0MQ7DGsRFoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=aG9NYjTD;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF249606A326;
	Tue, 24 Nov 2026 19:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF249606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=aG9NYjTD
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3635A339;
	Tue, 24 Nov 2026 11:50:31 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B09F33F763;
	Tue, 24 Nov 2026 11:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795549834; bh=hfA0ap4Xo70CAlarCd2qZoILhqj61SvsIL72n1hY+fo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aG9NYjTDaxxLrPnCnjpM217wgQMIfUEv+KcorF53RPv1F/3mdMmhGYt0w1XmACW7c
	 NI7J7dBOq+l6KO3SS0DdIPPi8l4ja0P17QbJkS+o8dzeuckE/QQONj3K2picf0Q3d1
	 hN0sYK3AtJ0TXLi3VybQA7rnJdDvn/a2HQ8qoZLg=
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
Subject: [PATCH v17 09/34] dt-bindings: firmware: arm,scmi: Add support for telemetry protocol
Date: Tue, 24 Nov 2026 19:48:15 +0000
Message-ID: <20261124194841.1147072-10-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124194841.1147072-1-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
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

