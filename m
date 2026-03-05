Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012024.outbound.protection.outlook.com [52.101.66.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABCE244660;
	Thu,  5 Mar 2026 01:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772675732; cv=fail; b=R2lcHC4i2MJeJSOwFIlhsi4b4V8rnyGqQqVlV+tlh73mtLLNtpQH+P/+tnF6A4rPLrfMGpxZvnpxG5/xIiCcGR3t5jMRQAyuNHwId/YFA+uTFActeJv5l+lBs7OVME9W3rT4z+oDtji1HTetZpoAh1krjxA4CxuA0IJTLKpvkYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772675732; c=relaxed/simple;
	bh=d3V2pB+s7vUp+8ziUrhR92uoWH/Fw/MnFtSa9qFnwrU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=CBLNx7PtwP2E+AyaJ+IAhFo2YGkR0DRdbkX8CzdhI5aSjXy/HpVSrrpBnt2PBTdnn0iENcblRX+aEQed1WAWTyNmTblmhWVwdfRLDfBY2h6rwgWmugTMaXd0PZ7PU3EzZVTDQQEyW+CWh2pGscw3v1/wAjqi4+/LQdSpL7CjWQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qFTRisEA; arc=fail smtp.client-ip=52.101.66.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qFTRisEA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EykGPwejX4GzkpK+0+52SDyogH+uIkNA0eQbXuV5VZTEFeg+0SuwTY097IMqvNGM9KNc94TP2w2hL8pQL84dzXEKsUGqDB8Jfg2603Mu5jMQ6wFKbdj262q9yeqcRe/GtT4EvUJmt4/Nl/rnD7V/DbopnITukyMNQvsMZU2HXUqFcSjaXQ1TLUu/ozGhRjVs0KhsgtTDMQtLTlWt3xCj9OHgJwqv9RmS2ooYotXbDaIP1clSJd+SsMd//Qy5neCQzC5UtItvpQ13mEBjivbVeHTRcybrMwtwbF0ECAj9Aoo4vDF8O0hkclZXr5uEcqs09YHx6UGrzqXPDI/yTR3W+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ncOl7BLLLyzVx0NkRn/Y3WsIOgo1/Vaexwo8cSkMKk=;
 b=c/lglAJlLsl/N7nZl6Q1GvE3yeLONolAxGZBSQdbIBiHMg5D7FYIX/MlUhfv1FEgaH8OvjkJcQmkzvXnpMtypMB8GRLJG6y8cfbb4n+xnl41ejDPTY5SwbTf959s6H/tIf3UdDDU8mYqJdaBtxCbMsAuEgdGjsA2W3mHlIYTNE9o9amkTyy+dMBJ/4pCsZga9dzwioOkxBVP8vhzgcqKydOKpqHiB9jAdCIRuRYBEGjGNPAF/MKcpoke/O5Wsd+r63v/m/MqcLVgjaYIciN6Tj3TswCcYChbySK3hewM4aMZYMjdrt2JIyNZnkDRwSJPL9EFZvR1Yv40e38zS+5Kjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ncOl7BLLLyzVx0NkRn/Y3WsIOgo1/Vaexwo8cSkMKk=;
 b=qFTRisEAvz5PpZoGgydy/Srn1qG6uy7/Wpu1U0y9/Wdxnhcb6qn0fBMu0u8H5hd9nff9wRYNvRRK7B/roRRPQIY/GblmPwHU/0wYg7UnjU1V2nHQlPWSG+18ZrfCVQX/+D4dtFo0jfN8wKG8T15fF1pcWiLSK91wx1upWh6h3giqVedz3j8SqMBu6q9U1Zq9L9a9iVW1jtF5tgoewTwZx0S95gWfrULTLhPj08WK5qTjPGsIv1+LD6n8rpHiC6U4sQc95lfNFyz1lVvEYXG1DBfuOURJyt783d6f1lu03TzLiOaMXPVZatav2NyIaGGrBzZynUlnplLVlTvV+D6sug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by PA4PR04MB7741.eurprd04.prod.outlook.com (2603:10a6:102:c6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 01:55:28 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af%4]) with mapi id 15.20.9654.022; Thu, 5 Mar 2026
 01:55:28 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 05 Mar 2026 09:56:44 +0800
Subject: [PATCH 1/2] firmware: arm_scmi: imx: Support getting reset reason
 of MISC protocol
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-scmi-imx-reset-v1-1-18de78978ba9@nxp.com>
References: <20260305-scmi-imx-reset-v1-0-18de78978ba9@nxp.com>
In-Reply-To: <20260305-scmi-imx-reset-v1-0-18de78978ba9@nxp.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: arm-scmi@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA1PR01CA0163.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::33) To AS8PR04MB8450.eurprd04.prod.outlook.com
 (2603:10a6:20b:346::5)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|PA4PR04MB7741:EE_
X-MS-Office365-Filtering-Correlation-Id: bd255284-7791-4128-59d0-08de7a5a4663
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	5rY83sit2pUrJ8lqP5koFNQC8GRSYXkPPHHik0qC/Abz1vS9IMhHc+qxv08V9AIkkCK+iszQLbLUXpW3ZFhEKfGpjR0z8QcGk/XIlK+GktF63MO6GwRNkxTL7ClOPuk9UZb4sHgFYMOvWF3dErFPlz8RJ1FqeFy+VaI7Gcyp+0CMajyage109D6DMKKv9ZZQz4k1iGGMY/9rbqCkTpa7dTCxzx9EDk5YyIiNHAkIFWsF3+aXUAUaMlS6aQkFFog20B+nhPzb60SA8c6DIGFUjd2Wys74WzByi6yru9qCqeB2QkPDot4LEe/AABJoECIIBSytUbnGl8XRjW+9LFQQvivHLpk+oDrX+KsZe3OwqanF5FIXzZ1EKZhKpDloFdy6RdOFJSW057wRLgMJVkx8UTiCe7N3Fqtv/uY4mulqZYAxp+inKh3b1Vmott6/JLwUDhVJL+xQ/B3/rzM/SqkEqghTh/XiMRzQtw6ZTGr/K2sIWZjLpPNAVa+37CAGg6vwenYC/LmmdX3Z3H1Wjw1JHu70UQTn4aKDeJPRo4Dn9HgsDbD/XXohNK5Js9toI32gx+eVHZEnC1o/yWa8Muwlr8z4mcpvVJaDnfxV5MD9fvojcmsMxsyKBCeZ3RRu8UQlyO2D3OVvINE3OeP71md4PBALV9S2DUECFj9FY21gqCd7m6djAVJ7vXkmzn0Fl25hwg4MePsyFOINadeU8Mw2ndRkxrrdTuHS+2L2bzGcsR0x49nMd3jmypSFFhq9MQbgOl35Z7j/2/LTftZpIjjqdZwWUnGe8t2EWkrVwc8XOak=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjFRM0RCK0d3VXBpZS9lMWJ4SmhpVHI1TXRLQjlVL2xZY01kWWdMU2s4NUYz?=
 =?utf-8?B?dTN0R21SSWlVS1RXK2dKenFwaVAwS293eU0wVmVldEpoSEMwR2RLQlhNMm1S?=
 =?utf-8?B?ektOdmJKNlY3NHdiU1BXdXVHTld3V0ZRSHpRTVNXMTNTd292djJYSk1vbElQ?=
 =?utf-8?B?b01FaTVpbXVmL3kwVzB2TWxrTTRmak93b29uQ01FYmxsd2lnYytJRnhPSVds?=
 =?utf-8?B?eUx3ZU5DMjVocjBWeWthR0tWa1piUG1nU2U2R2tFQUo3NUQ3NVc4WmxCMmxP?=
 =?utf-8?B?RnM5eDIzdGVUTW1TUUo0Tm50ZjcxbEtldWJoc0ZFb1FMbWdGV2Q5SEg3ZWZW?=
 =?utf-8?B?TWRlK2loTkF3RUJYUzI1VStPMHdMd001V1oxd0RVUUNTekxzTXUxRVd1dllN?=
 =?utf-8?B?dU1GM0NVa2lwR2N1RDE2RUQvNktVdml3UVg1SnZTNnBsOEdkeEdLSDVkWW5T?=
 =?utf-8?B?dVJ6NC9TbGJHRnpOQzBvMnpxMWVJYzkzSlVPNDZXbnZHaldQMm5wU1BOMWNl?=
 =?utf-8?B?MHZaUkR5bW5uM2MweUtOdnZ2dENpQmhBS0w4WkEzZVVxSHdQNFVydnUxOVhZ?=
 =?utf-8?B?SThOM1krRmdqb1F3eVY3dnFkZzM2QW85ei8yT3FGaWo3aUp6dWNKc003a3BZ?=
 =?utf-8?B?UnV3UC9nVU5XRXpLelJpbjR6Rk1NNXRtSHBjUUFFbFZtVkRoTjdsZUhYdjJs?=
 =?utf-8?B?YnlSU3YwQ3Erbzk0MGx3NHJzSkxyOExkVklnaVlCYTQxcENZMW9jRWJ0allM?=
 =?utf-8?B?UGg2czRSRWg1Q2MveVYwQVAyRldUVkFtS0lpcFU2b3RuVmtJbFMwVFZiN2l6?=
 =?utf-8?B?NEFsYlZSdjVYWDdsWmVRUFNacytwYzdaREJOVDhsSGNlTHJ3amRSd0dCUTVC?=
 =?utf-8?B?R3d6NmxOc1ViV05BRXoyQzRDTkdqcUJybDd1M2VvLzUrM2tMazdjOThIMUdN?=
 =?utf-8?B?TXBZbW9GUjFndEp5NGhDRU8xQmZvWkt6QWl5d1Z4MFpIeWNodzUraFhLOWJB?=
 =?utf-8?B?VnZSWnFZODR0MXRLTnBEOTNvZzlwZTd2OERBMTZYOXhTZVlEaktaMk9KcEc4?=
 =?utf-8?B?L0dxa2VBOFJIanp5UDRjaEZvL0xBMWR6RFpsZHluUEY5MXprN0hGRzlBWlIr?=
 =?utf-8?B?WFQvZWVLZTlBbGowT1RGdVVXbVN2R1JCbzBCUnh4YngrblNhTVV0Zkoxa2tx?=
 =?utf-8?B?RzNLY2diSkdIM3hvbk50T2l2WHFyWGhna2Z2LzNRT0RPZFVNNXo4TG1oL1Bq?=
 =?utf-8?B?eGNQUkdJU3RtVlViZWppRzBpM1VqWE5uMWxsM0RzYTlXZ3NSZGsyQUt2Z3lX?=
 =?utf-8?B?ZzlQZ3BoM2FHaitMRjlORTJBZHlRQVBTTGd5UmMvTWRuYWlnbUF6OTZ4ODVG?=
 =?utf-8?B?cFpaYlFmVUtiV1F4S2J5dFFhdkZWOXVhcGhEQXpiV2RIaXRaVFBwd1Z4VnZP?=
 =?utf-8?B?WUxxemJBczdqa1FySTlUY1ppelpISHRNMTlpakJKYm1BTFh5RCtEQVgxNXlI?=
 =?utf-8?B?Y0FmMnkybFFOQ044NjBHTm0xM1I2MUdjaSt2UWJHQ0x2Y3R2aVNVY3FJY0Zi?=
 =?utf-8?B?QVZMajZCTXZWUFM2QlphK2ZYTDVBS3U4WVB5TUczVElGVWhUaC9TU2F0T0p5?=
 =?utf-8?B?NVhIb0t2NmNrV2lvbElZUTFGbzZ1Qi9CeGw4MzE1QUZwVUNUOCtMNnhYZGhq?=
 =?utf-8?B?K3N0aW5KSExySlVCVWM5Q2tDZXAyYTVLUXlmQmtpTVhnQTUxdCs3aWdSZWNm?=
 =?utf-8?B?R3hHZG1SeGExM1lveHZMMnhjdjJJejVjZjF3U0RqZ0U5U3YrbTd6R3A3VENU?=
 =?utf-8?B?dUVqbWlsYm55M0oxNzRVT3E0YzU1NlZ2MitZbXZFcWZLZWFCZFNlWHFPam0v?=
 =?utf-8?B?TkdnOVlYYjBLaTE2Y2F0M2dmZUgwYjhqeHF1b3ZzVmREbC9VcHRYVWkxS2h3?=
 =?utf-8?B?Qmc4M3pzZ0U0UHdTeEx4VXlGUWpHMzhnbGh0VXlVM01nZnRSUzNiWHlEaU1R?=
 =?utf-8?B?RW8vdDFvNmFNUjMzalo0bVhrajRWOEJTQU40V1JjTU5QakhYaVVkZDZWb3Bw?=
 =?utf-8?B?MytZYkllUHh3RHBwTXpSRVF5NGdRQ2k0UXZzc216SmR4RjRyUnBxZzFMSTBZ?=
 =?utf-8?B?WW5oMnRqOS9YOUVQbHRTWElGUkZ4eS9GVnhScXk0Y1RVZ1h2YStmRkZzbHBD?=
 =?utf-8?B?ZGhNcksrclo1U1BFTXdXUDVUT3R4Wmx6a3VsVVcrTEdxaUd2MkZtWnVhYXVE?=
 =?utf-8?B?Zk4yWkNlZG1ENEtBSVdwTENYVTU5cElUUEk0NEllVVBiR3pLZ2k5OGMrekNy?=
 =?utf-8?B?S3lrY1Z4VXo1a3ZlR3EyeFVFelE0Yk9TNGZOWGdMa0gxNmxpTmpmQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd255284-7791-4128-59d0-08de7a5a4663
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8450.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 01:55:28.5563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EvG0f1vVPHEW2OGl3lzfgOTjxwhDAXRAVAU8AOZouJxLvqOhEf9oU/+6yh68b2/WJGEG7/EwR+BddYnQooyUww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7741

From: Peng Fan <peng.fan@nxp.com>

MISC protocol supports getting reset reason per Logical Machine or
System. Add the API for user to retrieve the information from System
Manager.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 86 ++++++++++++++++++++++
 include/linux/scmi_imx_protocol.h                  | 14 ++++
 2 files changed, 100 insertions(+)

diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
index 0ada753367efe5cbcb8124ea46c05736c49f1ab8..637973fb45e6508c200211708358299cf7cbe3f1 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
@@ -27,6 +27,7 @@ enum scmi_imx_misc_protocol_cmd {
 	SCMI_IMX_MISC_CTRL_GET	= 0x4,
 	SCMI_IMX_MISC_DISCOVER_BUILD_INFO = 0x6,
 	SCMI_IMX_MISC_CTRL_NOTIFY = 0x8,
+	SCMI_IMX_MISC_RESET_REASON_GET = 0xA,
 	SCMI_IMX_MISC_CFG_INFO_GET = 0xC,
 	SCMI_IMX_MISC_SYSLOG_GET = 0xD,
 	SCMI_IMX_MISC_BOARD_INFO = 0xE,
@@ -89,6 +90,37 @@ struct scmi_imx_misc_cfg_info_out {
 	u8 cfgname[MISC_MAX_CFGNAME];
 };
 
+struct scmi_imx_misc_reset_reason_in {
+#define MISC_REASON_FLAG_SYSTEM	BIT(0)
+	__le32 flags;
+};
+
+struct scmi_imx_misc_reset_reason_out {
+	/* Boot reason flags */
+#define MISC_BOOT_FLAG_VLD		BIT(31)
+#define MISC_BOOT_FLAG_ORG_VLD		BIT(28)
+#define MISC_BOOT_FLAG_ORIGIN		GENMASK(27, 24)
+#define MISC_BOOT_FLAG_O_SHIFT		24
+#define MISC_BOOT_FLAG_ERR_VLD		BIT(23)
+#define MISC_BOOT_FLAG_ERR_ID		GENMASK(22, 8)
+#define MISC_BOOT_FLAG_E_SHIFT		8
+#define MISC_BOOT_FLAG_REASON		GENMASK(7, 0)
+	__le32 b_flags;
+	/* Shutdown reason flags */
+#define MISC_SHUTDOWN_FLAG_VLD		BIT(31)
+#define MISC_SHUTDOWN_FLAG_EXT_LEN	GENMASK(30, 29)
+#define MISC_SHUTDOWN_FLAG_ORG_VLD	BIT(28)
+#define MISC_SHUTDOWN_FLAG_ORIGIN	GENMASK(27, 24)
+#define MISC_SHUTDOWN_FLAG_O_SHIFT	24
+#define MISC_SHUTDOWN_FLAG_ERR_VLD	BIT(23)
+#define MISC_SHUTDOWN_FLAG_ERR_ID	GENMASK(22, 8)
+#define MISC_SHUTDOWN_FLAG_E_SHIFT	8
+#define MISC_SHUTDOWN_FLAG_REASON	GENMASK(7, 0)
+	__le32 s_flags;
+	/* Array of extended info words */
+	__le32 extinfo[MISC_EXT_INFO_LEN_MAX];
+};
+
 struct scmi_imx_misc_syslog_in {
 	__le32 flags;
 	__le32 index;
@@ -452,11 +484,65 @@ static int scmi_imx_misc_syslog_get(const struct scmi_protocol_handle *ph, u16 *
 	return ph->hops->iter_response_run(iter);
 }
 
+static int scmi_imx_misc_reset_reason(const struct scmi_protocol_handle *ph, bool system,
+				      struct scmi_imx_misc_reset_reason *boot_r,
+				      struct scmi_imx_misc_reset_reason *shut_r,
+				      u32 *extinfo)
+{
+	struct scmi_imx_misc_reset_reason_in *in;
+	struct scmi_imx_misc_reset_reason_out *out;
+	struct scmi_xfer *t;
+	int ret;
+
+	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_MISC_RESET_REASON_GET, sizeof(*in),
+				      sizeof(*out), &t);
+	if (ret)
+		return ret;
+
+	in = t->tx.buf;
+	if (system)
+		in->flags = le32_encode_bits(1, MISC_REASON_FLAG_SYSTEM);
+	else
+		in->flags = cpu_to_le32(0);
+
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		out = t->rx.buf;
+		if (boot_r) {
+			boot_r->valid = le32_get_bits(out->b_flags, MISC_BOOT_FLAG_VLD);
+			boot_r->orig_valid = le32_get_bits(out->b_flags, MISC_BOOT_FLAG_ORG_VLD);
+			boot_r->err_valid = le32_get_bits(out->b_flags, MISC_BOOT_FLAG_ERR_VLD);
+			boot_r->reason = le32_get_bits(out->b_flags, MISC_BOOT_FLAG_REASON);
+			boot_r->origin = le32_get_bits(out->b_flags, MISC_BOOT_FLAG_ORIGIN);
+			boot_r->errid = le32_get_bits(out->b_flags, MISC_BOOT_FLAG_ERR_ID);
+		}
+
+		if (shut_r) {
+			shut_r->valid = le32_get_bits(out->s_flags, MISC_SHUTDOWN_FLAG_VLD);
+			shut_r->orig_valid = le32_get_bits(out->s_flags,
+							   MISC_SHUTDOWN_FLAG_ORG_VLD);
+			shut_r->err_valid = le32_get_bits(out->s_flags,
+							  MISC_SHUTDOWN_FLAG_ERR_VLD);
+			shut_r->reason = le32_get_bits(out->s_flags, MISC_SHUTDOWN_FLAG_REASON);
+			shut_r->origin = le32_get_bits(out->s_flags, MISC_SHUTDOWN_FLAG_ORIGIN);
+			shut_r->errid = le32_get_bits(out->s_flags, MISC_SHUTDOWN_FLAG_ERR_ID);
+		}
+
+		if (extinfo)
+			memcpy_from_le32(extinfo, out->extinfo, MISC_EXT_INFO_LEN_MAX);
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
 static const struct scmi_imx_misc_proto_ops scmi_imx_misc_proto_ops = {
 	.misc_ctrl_set = scmi_imx_misc_ctrl_set,
 	.misc_ctrl_get = scmi_imx_misc_ctrl_get,
 	.misc_ctrl_req_notify = scmi_imx_misc_ctrl_notify,
 	.misc_syslog = scmi_imx_misc_syslog_get,
+	.misc_reset_reason = scmi_imx_misc_reset_reason,
 };
 
 static int scmi_imx_misc_protocol_init(const struct scmi_protocol_handle *ph)
diff --git a/include/linux/scmi_imx_protocol.h b/include/linux/scmi_imx_protocol.h
index 2407d7693b6ba1303e07629e45e2a7eaaa906fd3..ab867463c08cc297e063aa1dc4189132a5ddb61a 100644
--- a/include/linux/scmi_imx_protocol.h
+++ b/include/linux/scmi_imx_protocol.h
@@ -52,6 +52,17 @@ struct scmi_imx_misc_ctrl_notify_report {
 	unsigned int		flags;
 };
 
+
+#define MISC_EXT_INFO_LEN_MAX	4
+struct scmi_imx_misc_reset_reason {
+	bool valid:1;
+	bool orig_valid:1;
+	bool err_valid:1;
+	u32 reason;
+	u32 origin;
+	u32 errid;
+};
+
 struct scmi_imx_misc_proto_ops {
 	int (*misc_ctrl_set)(const struct scmi_protocol_handle *ph, u32 id,
 			     u32 num, u32 *val);
@@ -61,6 +72,9 @@ struct scmi_imx_misc_proto_ops {
 				    u32 ctrl_id, u32 evt_id, u32 flags);
 	int (*misc_syslog)(const struct scmi_protocol_handle *ph, u16 *size,
 			   void *array);
+	int (*misc_reset_reason)(const struct scmi_protocol_handle *ph,
+				 bool system, struct scmi_imx_misc_reset_reason *boot_r,
+				 struct scmi_imx_misc_reset_reason *shut_r, u32 *extinfo);
 };
 
 /* See LMM_ATTRIBUTES in imx95.rst */

-- 
2.37.1

