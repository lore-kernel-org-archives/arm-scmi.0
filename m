Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012054.outbound.protection.outlook.com [52.101.53.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E90F40098D;
	Thu,  1 Oct 2026 11:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790855185; cv=fail; b=luchH3vPda2tu1WuMDQlnrVgLB3COqso1DNDAg0YBaGXSXbHiatSJVKnKW6e1JWTNOV0pBk+GwuwmOnrdncPuhKvM7rWoDpS6phXTMUJPXCVIAX91nNXqE9up6Www32Jv9gL4QoV5SzyiBE6KVvcvbWZLglvR3qGSf5OsD0/9iA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790855185; c=relaxed/simple;
	bh=uR4/EPRfCVwVypSQdrp5TbChAZyTlwfUppADG/zcRUY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HEi4NLdHXQB0o5P+qoMY+SI+kfeBaAdKhEjD2FGX+f5/iRepjyG2ASJxEhTA3NSW6ofu0XFQRjGJqd469gyrdSsjfbAEzDY/x57cPN0kUrUw0c1fUSzDS7zOMuV0+GaRzFroiaY9kRlVPj2jSxYtYIQtHczWmoEO1Dm9E1lTQ2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=htk+SQpg; arc=fail smtp.client-ip=52.101.53.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="htk+SQpg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I6quLST24kNYFs8Fo0UXc96mxGDp4ZLP9Y2ZIH1nv1L2LHY6avt7iu3VpGmzlAAkOgrchs8YsabalMJ1zT6zuxcm4+Q0tIsSiJkelQq4T/GDJ2TopmwQZkLkYE9w1u0bP8KsAS2wG3xLJUrLLq/YyYl8Dlbo2/LHa3vTwkOWAAjavfb3OdQi8zeLwXeZT2PZ/O6gGjkea2/sPX3WxdzgzvRpiqT6KNS62qSf1RoS8ShcfSsshjZU+D5QITkFnjHVAAyxnr2PxrfV9UINPqRfOcih9qGLQt3L+AheqGG+D4rQpxvCkmbZWQWVW5sO4RsY3BPj7j/Qo5Xd1kvDdfh4Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kt21uMI+R9GMSQ+IrBnMuifSzGlYFV0cCRsYEFNHMEg=;
 b=OgKQz5544pEAYaBPnTi30QW2VlVm7ymmuCpiHc+v8jWdzvG9Ww0C1SxAXqeGzKsnzuSrkVV0DD/mOyAUCv3n4bvTgoIv6rbiHwZe3Fq5jb1x6fwK8n7W0rVdwiLgc2l4kjQqFjsrkd6ZV5LV027RpNmOpNeSUSNMjKs623ILexml8Ubd2VoU5XoyvP7G1JvMO7KhuwRgeCoE5FeUrAVuERmcEzIHJ1R/DaCcB+rOpBTUbmP2R2JznAW3i3JofRYrEs4ll9SU4TOlVlwDWKEITHOHZ9aV3nCyhmfvYWdpDMIPDXsdpRo05omgRqG0M0B8fTIYgq8+kDZtIA0gMAT4TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kt21uMI+R9GMSQ+IrBnMuifSzGlYFV0cCRsYEFNHMEg=;
 b=htk+SQpgbpzi2eGUXMxX5FrYdi/wxsoEdEopQjD4OY+AzV+2aAeqyIpJMoJKwJIHlnRug5PfB0v4UdG1tw9MW65qdGBefobvAr64Po8tIznMcb74Xu8+O2kg5zNJWtPKyWWCkv1zNzbM24Sdq+bfvCkiR8n+0mZPQKdQ7fQCNjU=
Received: from PH7P220CA0057.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::20)
 by CH3PR12MB7714.namprd12.prod.outlook.com (2603:10b6:610:14e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Thu, 1 Oct
 2026 11:46:06 +0000
Received: from SA2PEPF00003F67.namprd04.prod.outlook.com
 (2603:10b6:510:32b:cafe::3) by PH7P220CA0057.outlook.office365.com
 (2603:10b6:510:32b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.17 via Frontend Transport; Thu, 1
 Oct 2026 11:46:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003F67.mail.protection.outlook.com (10.167.248.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 11:46:05 +0000
Received: from xsjarunbala50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 1 Oct
 2026 06:46:02 -0500
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: <sudeep.holla@kernel.org>, <cristian.marussi@arm.com>
CC: <arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Jay Buddhabhatti
	<jay.buddhabhatti@amd.com>
Subject: [RFC PATCH] firmware: arm_scmi: skip empty CLOCK_DESCRIBE_RATES replies
Date: Thu, 1 Oct 2026 04:45:38 -0700
Message-ID: <20261001114538.671755-1-jay.buddhabhatti@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F67:EE_|CH3PR12MB7714:EE_
X-MS-Office365-Filtering-Correlation-Id: 7caca1b4-264b-4707-49e5-08df1fb193c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|376014|36860700016|30052699003|11063799006|56012099006|10067099003|18002099003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info:
	3qh4QtXFUWCgFYpmTkfL8+WJQmBSJ4w+tqW52eF3kE68JjLpKqsf93De1WCiuSvS5yXvCWW9AhUxcNKEpYXsXnXQnfKqFNguI6W+rN3qBElCv6FVhRmhY6uKWMiEmSclL/9913X1H4l3Au1Wov6WPCXOkesdbNna+koPodcX3x4iIyJMCVRu+h0j5CvBoCUPKfb0CKhWQdMRYCi8m3hkDBWYHAx6OOVq5kqpcqlps8PnXSijVDnm3BVcBCta7+3szKKUBEtDG5kjVqrzePWLaJBMEx2SXspM4dwBpetVM4vrEF6K7ukeMAOJTDOs5VnwWHp978SMY5vriNQe4XQR/jKJGqNY9Mdm5Zuz6+CTEsU7wq4YCuTRvZ2SGOF5Apiz4N6CONlVVqMc2qB1N4vZVqYJ1BZY8vgJzLEnvVj/K4W1uCYBOKPYf9whNPtJexOx9a40dNNv5BtiCpq5hYMtEMo2wcVZvgBeQAH5t3IC0RcXLqG1ExOoUFHZ3Xt1Thoxp+d0dtDf5YAM7OKiucvTIKEiB/5wJHQxHqj16QvcnrN35jGR3BLjobg5SDFisjwgs0aRakUwQrJfmryvPcMDQ7O0m9dEtny81Oz24g2PqhMrKydkjRRzCMII3TEHsyxF7EIDrf5NpodJd2IAHO2CuDvXPRWtf4YJAKqingO1IvHuRJ3nYs78JVJa22rXXcOESoP5cYWbW3lNCuxMTxnpVA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(376014)(36860700016)(30052699003)(11063799006)(56012099006)(10067099003)(18002099003)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7/jcrErYd62yKRKB21lrLw1TK7YSKtGw5rxUC4uaUMdCCa3Oikl0bKnah5uyL56qzJJTGjV1kIFlHWv4id1JtJmJewjEBbJI8vDYpAgXZM2VBeCv2SsdPz5UO1scZv48sN/bCJdbSvP/a0q3Q/UAybRWb6Z0gNBFBguFC0N8YDJ0bKCbGKyf0nRnszCvWaZHisqdVCe3dWEWq9/yW4nnDFrY0OKkmrGBYeoaYeWECMNf/HzimDU4siCr6FAL+msoeoElyUBRg/x5hzjP+rIWHi9IubHdh9hYaBgu2aWNiHsrSIAEKX4+RkKEXowsunqrcOsEuB5goHo0WNRkcoBCvcRKOID4+URa8qJvqXgqwKbS9tznpa5nffvgZ1YxXt46eRhx8ekBZysgfzEnntPBEA0CVQp1aTLm23+b1m8bt8ol6gSqVQJewasv1wwaDlLw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 11:46:05.8062
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7caca1b4-264b-4707-49e5-08df1fb193c4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F67.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7714

Some platforms advertise reserved or uninstantiated clock IDs that still
succeed CLOCK_DESCRIBE_RATES with zero rates. After dynamic rate
allocation, kcalloc(0) returns ZERO_SIZE_PTR and protocol init then
dereferences rates[0], which panics.

Do not allocate or index the rate array when the firmware reports an
empty list, so unused IDs are skipped instead of taking down the SCMI
clock provider.

Fixes: 62ba967595e0 ("firmware: arm_scmi: Make clock rates allocation dynamic")
Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
---
The SCMI server is the source of this zero rate and successful response
and it should be fixed in SCMI server. This defensive check in Linux is
still useful because firmware responses must be validated before
de-referencing dynamically allocated data, The panic is a Linux
regression introduced by dynamic rate allocation; previous fixed array
tolerated the same response and other SCMI implementations could return
the same unexpected response.
---
 drivers/firmware/arm_scmi/clock.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index 0278705d809e..8934a95527e2 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -8,6 +8,7 @@
 #include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/limits.h>
+#include <linux/slab.h>
 #include <linux/sort.h>
 
 #include "protocols.h"
@@ -484,6 +485,13 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
 	if (!st->max_resources) {
 		unsigned int tot_rates = st->num_returned + st->num_remaining;
 
+		/*
+		 * Unused/reserved clock IDs return 0 rates. kmalloc(0)
+		 * returns ZERO_SIZE_PTR and must not be dereferenced.
+		 */
+		if (!tot_rates)
+			return 0;
+
 		p->clkd->r.rates = devm_kcalloc(p->dev, tot_rates,
 						sizeof(*p->clkd->r.rates), GFP_KERNEL);
 		if (!p->clkd->r.rates)
@@ -505,6 +513,9 @@ iter_clk_describe_process_response(const struct scmi_protocol_handle *ph,
 	struct scmi_clk_ipriv *p = priv;
 	const struct scmi_msg_resp_clock_describe_rates *r = response;
 
+	if (ZERO_OR_NULL_PTR(p->clkd->r.rates))
+		return -EPROTO;
+
 	p->clkd->r.rates[p->clkd->r.num_rates] = RATE_TO_U64(r->rate[st->loop_idx]);
 
 	/* Count only effectively discovered rates */
@@ -622,6 +633,13 @@ scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph,
 	if (ret)
 		return ret;
 
+	/*
+	 * Some platforms expose reserved clock IDs with an empty
+	 * CLOCK_DESCRIBE_RATES reply. Do not dereference rates[].
+	 */
+	if (!clkd->r.num_rates || ZERO_OR_NULL_PTR(clkd->r.rates))
+		return 0;
+
 	clkd->info.min_rate = clkd->r.rates[RATE_MIN];
 	if (!clkd->r.rate_discrete) {
 		clkd->info.max_rate = clkd->r.rates[RATE_MAX];
-- 
2.34.1

