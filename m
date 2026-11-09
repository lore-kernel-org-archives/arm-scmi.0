Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215720;
	b=euy4EUzJnRr4kCr/GkhnTlWlvKCf96tuqaGrkmf/Fau6DC0UQQCpIKn6IqxO12xUjkH/
	 9dgDL28FFpbmP+hGsZrFaEUWJnoQ69bklPeg0PBLGeKQ8Xm/r32DlhjdxvtE1gTiea5+M
	 xLJe4HuEfEC++kdxBVaiCBebraM1eFNmwIS4giANsNbLROwzHA3ZcROSf0wzQkonG26EG
	 3Heh/m92OT5eznCsIAcrH/sFulY+43e++U0JnpWJuvWT4GGxpj0hDq/XgKJg2on7l1po0
	 dJp1HH+RLG3kEc9T4QAww9XO0t0Co6xoUhiiMTsmFFitC0EzJ6q5SEsV28G0/Bt+ikg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215720;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t7R2yoCiAeLQBhB6gJTWyBDgFqLo/L9FrePQ72IrN3c=;
	b=b3i1sm5GmprniDnsOAXL/gl9Dhc21/VO4d7TOQ5OFPyxrzlUDGSIGTxefGqHe3OHhAl3
	 AiU3KOew5d6YehG53iuWHirHj1LEEdIjch8FnzJlpi6Ppdr6fcO969H0bLU1QMgEtU4N3
	 qxx6aMIpWXA1/OIixYH+ejNKoQ/HinNVwrhsHE97Rv5vwBc5npa1Q90+2wZWwA8+dkmoF
	 p90XIPnnySUmcrdF9pdfQkq+7CIUcXIPMyj63eRDmvKfUEg7ZhTXj3v7SYNZhGEU+vwZV
	 /yKLXrgIlS8vuHp170H3F1Odtcx75hkWN28gCPPcSMNqBnS8hPcvdQnLYanixR1iYHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=h33lt1JZ;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BA60606A338;
	Mon,  9 Nov 2026 09:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BA60606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=h33lt1JZ
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C83F7169E;
	Mon,  9 Nov 2026 01:15:15 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7BDAC3F85F;
	Mon,  9 Nov 2026 01:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794215718; bh=hfA0ap4Xo70CAlarCd2qZoILhqj61SvsIL72n1hY+fo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h33lt1JZ/yhNeAGVm7HDNMFh6sw0uDPyDv06QjCmoy5KbpQPNfsuZMfBTEfA97ipl
	 R9bWDv8NTXX0Q2Xs96uve7ouUC0ATxB3G6kncf8uxZV+EysTXscy4Qn9pn6goN4LBB
	 KZlbTFcwEmgFGeLw0Gzxd3lcoT36FP+ppwIdwJFs=
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
Subject: [PATCH v15 07/35] dt-bindings: firmware: arm,scmi: Add support for telemetry protocol
Date: Mon,  9 Nov 2026 09:11:53 +0000
Message-ID: <20261109091221.2532706-8-cristian.marussi@arm.com>
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

