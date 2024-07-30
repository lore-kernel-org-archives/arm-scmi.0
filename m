Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BABA1A2C3D;
	Tue, 30 Jul 2024 14:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722350882; cv=none; b=SAyykfVGERofLTQECI4LmfJAcI/SFnUC8DTvgSIDvRTiS9j62zljo9gHnImlZw1RbIbmScy3jyiUzBAKH7zoTCyFGo+ibaonhZ5sFbR48YtimcxSRgjuPvQUW/wq3menDZZMY2B2S+tpymtrrxEJY1+o1w6bJ72wtdGAHFxO000=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722350882; c=relaxed/simple;
	bh=r9EWGC0sIAIRiDN+Z7UHs0WD0LCi6bKRK2M5DHWDROE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HcnBxZQU4pgnWBXqNgROC+JdbT97iim1EjK/B5FYNRHqQ+mxUfV6q4VO2wsIjx8VPxGVIx3rwZAsuWSYjetgbf9FCn7YzihruHxs0gbNj1CBLVvsRxulfOadNjuihjmd6x+czvTdEwSHD+NGx7PkMtLZz/y1kvW7O+NPOkZigR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73BEA1007;
	Tue, 30 Jul 2024 07:48:25 -0700 (PDT)
Received: from pluto.guestnet.cambridge.arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D67013F766;
	Tue, 30 Jul 2024 07:47:56 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	quic_nkela@quicinc.com,
	dan.carpenter@linaro.org,
	souvik.chakravarty@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v1 2/6] dt-bindings: firmware: arm,scmi: Introduce property max-rx-timeout-ms
Date: Tue, 30 Jul 2024 15:47:03 +0100
Message-ID: <20240730144707.1647025-3-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240730144707.1647025-1-cristian.marussi@arm.com>
References: <20240730144707.1647025-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peng Fan <peng.fan@nxp.com>

System Controller Management Interface(SCMI) firmwares might have different
designs depending on the platform: the maximum receive channel timeout
value might vary depending on the specific underlying hardware and firmware
design choices.

Introduce the general property max-rx-timeout-ms property to describe the
transport needs of a specific platform design.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
[Cristian: reworded commit message, s/mailbox/transport in description]
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 Documentation/devicetree/bindings/firmware/arm,scmi.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
index 4d823f3b1f0e..7c9fa07e2ff2 100644
--- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
+++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
@@ -121,6 +121,13 @@ properties:
       atomic mode of operation, even if requested.
     default: 0
 
+  max-rx-timeout-ms:
+    description:
+      An optional time value, expressed in milliseconds, representing the
+      transport maximum timeout value for the receive channel. The value should
+      be a non-zero value if set.
+    minimum: 1
+
   arm,smc-id:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-- 
2.45.2

