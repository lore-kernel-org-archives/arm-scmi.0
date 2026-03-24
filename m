Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011038.outbound.protection.outlook.com [40.107.130.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA333B2FCE;
	Tue, 24 Mar 2026 06:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774333371; cv=fail; b=OPiEjfpmVMFuAvQzQtX17/B0Vzfl79vG1VZBDWRewCVoVTfKN1yH0xhgOY2A5gNyonASEGEIEm5gmZ4PzcGnemYiEbdGE+JNlYRN8t6S8EBcxH9b9NiYVrgeQUH68Qokfk+d/Blr/jvXVft53aNcPRasvxoXWMnPAHXKdZizCK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774333371; c=relaxed/simple;
	bh=1I+9FmnxUJc4sss/sHExgbdODV57V23XK/Rz9rdlZxE=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=snvM7z2MGOW8j4p7nl1lnMJVwQzxOspTg6tuvFfcvVOUMzfF+cCETsmLTOEUTzBuKB5WZ+iP309YXxoQdCcfI2OLYaNqta52PQW5AdojGRAXCYXfgxCaztXxUfwDyyXSDkXkkydgNaS27lIw7SmjABFgxkikuBkSPctUK11hQFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XNO2QCV9; arc=fail smtp.client-ip=40.107.130.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XNO2QCV9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DCIldM+t7fyFnC2WNmTPS5uaNAhq03KxSapR+SggYTKmOxYAe2XgSTFeS4KDBHpRw1RTYMkIe2wycz9eSSZIYp0gzvz1pLmRNqDVssoxhzaT4vDlFivkEanEtGituNwLB0zb2hViRMRRBf0fwF0w+JeMMtdSgLl/7m9uU7jbqhCBts3QXBJjZYqWXZ3aF0RSKEQL3GA844M7sKQkbfat3Gm9QBISdT1D7EZ7jNR5vR1KXHDlAqpAaxAlrkec0+6TZuhSmJFhvNabXQI0dMypuG1N5XzLRgre7kvN0dfQtSfExePcK8GHqzEcAwyLde7jX7Ixp/EuwJJgo+HPjpdO3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOB0VRoWgA3AtRF+zOk+kjE3JnkjkYPXZ0TEXwyjx+4=;
 b=vDQCm4PBKR0AZqQQo9Y67mp4vvEG5V88eSjrvmdg2xVQO7vmFP/v9bTekE/shPKuHj4n1JWOv5Te8Da2oA0J9rfhv1VCW1ZHDzS0Taf9lxJy11728S4hDynDDxkIg7YbGFyRhlZzKP3FkquQajEDWSzRdkPcQpk58sVgb6pai0Gv7WAbs/JNNJtwil7q6YhQbHyMnQ+SjlDlwE0T1ZGzg4M2Ql9Nyahaheu1azGff3oz+/GYWQQO4r9qsAPiwjb1bHNZbQtmVCZ87oo9TLxDZxFfSrSh3TVo5j1eAUAuVX9ktE/4EEGX8iZJs0xaTkw+j8B9RuooYN7tXNVL+dzN9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QOB0VRoWgA3AtRF+zOk+kjE3JnkjkYPXZ0TEXwyjx+4=;
 b=XNO2QCV9kpR0484KL4W7PLiW91r9dkaDS9g9eptWNkylh+vd8qJ65wC0JSxFb8at7oFWNq5ki+DHFELPYjCTjxqXXB3rFZNee9EMPjhmundE9ay43shOb8lieYRYjBIJFhhYo7xy5+/f1xsOAkhyEplqJL2AOqrGQbyqBSw03zMTTSCojrkLlB0oCL+F+Fy2mhnIzUMoqyO4AKyCLY6yzuisoX4OVzH11bzA4hQ2EblFUs/jwRqbO/fo6+upWHRsT+eKPoUQbBflCu6XJHQ+t+Z4HeWTL2GFarrZAFOjH3AXEdvSYli0Q4dHf4N8yHm9VeVZwXxvtsfIGacffphajw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM8PR04MB8018.eurprd04.prod.outlook.com (2603:10a6:20b:236::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 06:22:20 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 06:22:21 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 24 Mar 2026 14:24:14 +0800
Subject: [PATCH] firmware: arm_scmi: clock: Relax check in
 scmi_clock_protocol_init
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-scmi-clock-fix-v1-v1-1-65c21935824b@nxp.com>
X-B4-Tracking: v=1; b=H4sIAA0uwmkC/x2MSQqAMBDAvlLm7EA3hfoV8aB11MGVFoog/bvFY
 wjJC5ECU4RWvBAoceTrLKAqAX4dzoWQp8KgpW6k0RajPxj9fvkNZ34wKRydqUna2WlroHR3oGL
 +Z9fn/AG9UUr/YwAAAA==
X-Change-ID: 20260324-scmi-clock-fix-v1-b935e04f9243
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: Jacky Bai <ping.bai@nxp.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA5PR01CA0196.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM8PR04MB8018:EE_
X-MS-Office365-Filtering-Correlation-Id: fb71503c-119c-4fef-caa6-08de896db4f5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|376014|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ik/DoDtCC8q0lD/DqQLdXR1rhIV+bjPQidgrb3fSmd+FcNBhEz77JAoBZ/OQJASOEhugKJXOEVvX8qPCFxx71vCgg/gy6FFNDz5RtRw3dt47weSRDi20DfK1coraGXbcJ5BkXCAuzoVEVc2ne9150yrMJltzBP63QYzYLdXwHmCnHpzo0l+0XKAkI/6eIjSMFKUO11wORRj/JBj0uYpOXNNOipCvH2s9Gaqdl6Rd7jdoRWO1lq6eGI/Bntx4/uQg5PLShOBjUg/pV1PXl3qFwQQukqG70TL8PauNMeNZo4ldNSV5msXmNmJTWX0Cgm1t8vtIJkx39E1ioBlaXvA3NOAQKGIgtGflVMOxv1K1+BepRLLI2r3J/jxDYxUJwya2Qh78b1lPrMKpYrXu5Gi3+lMXRusQM+5VT8Cifx93SfMoxWLtobRxi+Cr7bg3Nub2TT5v3Z0OfwOIfa6xVbooP6zRD5B4JACmnyLRE3Sa+A6ffiifRK4gofgy8KQyF879tlKWNIGA4hPuClhCQeh21rvm+fVoL5/t3ztavgHadwO7M8LPQo8OWBQ3oBOB6kLHI3wASvQ/xx7CsfPrOkA+jVC7niHWL9VsltCrZk1L3B+Z5Sg/JojIo9gZMGn7J6k5GKnj4zyB8wN/Z477yy6AvCeyRZJblL/3OJpYzRln/R3DcKYjdswL4Ct/XvgY/7AVEmt4h98nRwAPrkXXheMIveD7FFOlusM5H1EEi6cHa23EqvT9HLkGoLKpu0t3r68Phy685pDoND8h1x08Dke/vdpdCTU3LsOA+JDaNVXd25I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(376014)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDh4VDlBdzBoQWtrZ3ZNaWsrWnFtM3VmUzN6WXRMMXhGak5WbldmM1RoYkVY?=
 =?utf-8?B?c3dRcDBFZjBqalNMREczWGxyN0QxbStySkRFNUxReitHYjNORG9zNXdKakRn?=
 =?utf-8?B?bndOOTJqRUtRNkJVOFlneFVsZWxSb1prZmhINGJXcGQvbC8rcnhRQ0Uzbnhr?=
 =?utf-8?B?clkra2c2VFkxQUtaNVBlZU4zaldqNXcrc2NFUy81cEdLUkpJTy8rczVRSjFY?=
 =?utf-8?B?OU5uTDEwRWV4anN0WGxBYzRiZWNZWjBRTXgyUjdXUUp5dllkSzZrWHRwT2xu?=
 =?utf-8?B?ZnQyYU0rdHJkT0lqL1pYTWJPT0hkcVZ4S21RSlBoSTNvajZDODIzZUszeURP?=
 =?utf-8?B?bysrYjA5MlpQLzJ3Z05BU1BRdGF3cElxQWhmM2NWSmZWQ29NODBHQmtROUVU?=
 =?utf-8?B?N2JxOUkyMGtPQ3pjS2JQWGFKUG5wMDRNZXNQUlFtMitjYjRSTndyb1R1L01Z?=
 =?utf-8?B?R2NZZlZCYXNTS0tWeFJNMkFkSHFZVXR0TVZRWkV6TVpDNnIzUzdlMFpDOWQ2?=
 =?utf-8?B?YmQ4TlMwdnZLNDBndEQvRDVIc1RMUVQ5aGx2amtDV3hRSXN2emxLVnZSVnZL?=
 =?utf-8?B?MjZpMTFCUGo2QlNWd0VIcEdvNzNVWGxWdnYveElha2Eva2tRaGlZNE5lbS9O?=
 =?utf-8?B?b0RrOGY0aFFjU2lGQWdjYjZEMmVvWXZSRGJMT0RxeUtlVnl4SldLajRidEJK?=
 =?utf-8?B?WW04ZFdxYUVtTmIweGZUdGpoOGwxMUJnNDZWWUxQZy9aM3lDMCtuN2duR24y?=
 =?utf-8?B?dmhKQlhJQ0dTN3k0cFNEc2JxMjNlYXdTeXZubmRjVXQ0ZGd6aW5tVDJ1dVA0?=
 =?utf-8?B?S3dpMW5tVVJOeTI1MGdYQXpia3kvUmFsYWtJV3kyMUZEeVlRNHFrei9BMzRs?=
 =?utf-8?B?UWp6Sy8xVFRsRU9XbU01VCs5RWY4OUdGWThaQVFMbVlOQTNTdm9XUVJONGpL?=
 =?utf-8?B?RkhIZDlQeFpTbkxWTUIyd2JXWjh2alhubXk5MTUrMWdCYWJRZE42cGVkNVhZ?=
 =?utf-8?B?TW9MdVhLdEhuUkpEalcyVVVmZDhNeFlUenBoRWRQYmV0dWlLK1dtTDdCbWFP?=
 =?utf-8?B?OGcwd0pxYjdydytKWnNvKzQ3QUl2MXpqQk5PSDNlU1JFb0kxa3ZoYW1aZ0xn?=
 =?utf-8?B?Q3VKZk54dVdrM3ZsN2xPZWlEUTdRZjBzUFpIR1NzL1lqS3ZzRVpTazg4THRD?=
 =?utf-8?B?dlFNMkR3KzJYRmp1TVNuTzd4UjA5SE5FNUMrOC9qaXdwcDJZaGZmTWhSSkcr?=
 =?utf-8?B?UlF0WFZtbms5QXJtS01HcitTeHd2ZnA3TVFCaXdWOEEwdXlvSmZOZFNlNVdw?=
 =?utf-8?B?WG1HTjdVcG5JaXBqZllzdGd5NStIaitucENVZUNwSHlrcjBxeHBUTW9NYUV6?=
 =?utf-8?B?RVRuQWszM0JtbUZ5MjFlK2V5K21BQU5JaXpGUkF4RzZmT0x0OWprR2ZNRGEr?=
 =?utf-8?B?K2xqejdueHcwYm5DTWJRM2FHYzBrVTIwZG44QW5TRzkrWDZhd0hOSHJuTVBO?=
 =?utf-8?B?RHBURWlzWk5DVzI3Wk1mNktnMVNsdUY0OTJlVi9XMDFwVzU4eFBmdWN0cjRO?=
 =?utf-8?B?NUljazBENUc1Ty9VY3B0TzhKV01OS2h6d0FINFR0Slp5emQ2UUY0bGllK2xq?=
 =?utf-8?B?ekVjVU0wbTkzZWNCVVBBNXo5RmdnV1hoeTduL1Vsb0JDT0IzWTJDNXVZUTE3?=
 =?utf-8?B?dWNSSi9jR2hycnhOV1dVeWI3cDVJakZpcTJzbHFxckY1UFVmNXR5Y29qelU2?=
 =?utf-8?B?Z1owd0lqUzlVS1RaRjdpd1JGNG1sTUVaOGpJOWlBSXIxVVljeHVtaGJUemtP?=
 =?utf-8?B?N2lKMFNnUjNROVY3emROa2paSEp0R3poQjltN3o5TUErMWhmelR5aGFMZ2V6?=
 =?utf-8?B?TkUwT2Nrc0kzMzc5UXF1emZZbDA2NWlFTk8zYUhBSmtIcVBGU2s0YytZck1r?=
 =?utf-8?B?cWJja3F0WVQvYXJzWnA4L3hvbWlZWGExQVQ3SXhEZ2dpZENubU00eVFHQlEx?=
 =?utf-8?B?bXQwRU8vb3dhS3hmRy9wckYzWXpFRVQ4RllCT0tKTCtKd0I4amhobGNheWk1?=
 =?utf-8?B?NjFtVnpHSnlhQ0kzWEx0cEhrSHkxV1pYSmR6OE9DcEFWNHZNV0RHbFZsc2lB?=
 =?utf-8?B?ZEUwa20vbGJreTdGazU0S0hMb3E0S2NzckswUElhT1RpMk8xNkhBd09Dbk84?=
 =?utf-8?B?R01CUFRsd2NhbHp4TEI3eW5aNzNRWnkxMkZseDBKa0ZNMkVjMlVwalozSWJw?=
 =?utf-8?B?blhiU0tHNzd6UnF0TVBHaytOaDltZzRWYjM4UGk1NjF2MFIyUjlkbXRpbkEx?=
 =?utf-8?B?MERraGx3aWZWbEt1UXRwS0JIUGlOUnFYVHJza0hOcERuN0hUNVFxZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb71503c-119c-4fef-caa6-08de896db4f5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 06:22:21.5923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q1FGUHrqkrc5m2Nx/XScHqa4IEdnxnPIE28FnSO+ktHlJQDwKpvBdZGiG+9RKlI2J2UqiSfZ8240q7uCWUlDpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8018

From: Peng Fan <peng.fan@nxp.com>

On i.MX95, the SCMI Clock protocol defines several reserved clock IDs that
are not backed by real clock devices
(see arch/arm64/boot/dts/freescale/imx95-clock.h).

For these reserved IDs, the SCMI firmware correctly returns NOT_FOUND in
response to the CLOCK_ATTRIBUTES command. According to the SCMI Clock
specification, NOT_FOUND is expected when a clock_id does not correspond to
a valid clock device.

The recent hardening added in scmi_clock_protocol_init() treats any error
return as fatal, causing SCMI clock probe to fail and preventing i.MX9
platforms from booting.

Relax the check so that -ENOENT is treated as a non-fatal condition.

Fixes: 0d8b0c8068a8f ("firmware: arm_scmi: Harden clock protocol initialization")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/arm_scmi/clock.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index 082fb0db8681aed7fa30ffb915a8c61530fc5c2d..49ceebae53107fb79a8a07d644c5682a6f704d2f 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -1253,8 +1253,11 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
 	for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
 		cinfo->clkds[clkid].id = clkid;
 		ret = scmi_clock_attributes_get(ph, clkid, cinfo);
-		if (ret)
+		if (ret) {
+			if (ret == -ENOENT)
+				continue;
 			return ret;
+		}
 
 		ret = scmi_clock_describe_rates_get(ph, clkid, cinfo);
 		if (ret)

---
base-commit: 09c0f7f1bcdbc3c37a5a760cbec76bf18f278406
change-id: 20260324-scmi-clock-fix-v1-b935e04f9243

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

