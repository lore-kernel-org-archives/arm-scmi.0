Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012024.outbound.protection.outlook.com [52.101.66.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7042C246BCD;
	Thu,  5 Mar 2026 01:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772675730; cv=fail; b=eulF3wQJKaRkWAmhZAzRG7y3M3J4o1mAiIg9HM/EGTlsWRJEzfiqdkWrXULdrOc8xj0PnQY8A3yuURkP4O3qb49a7qedwaSUoP43ybdIDFz1WSMVFPSJM+MuDUigAyJ0da2hkh8on7vQAzaOMONCKYwCqpbmhGiLxrEKibcdREI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772675730; c=relaxed/simple;
	bh=M78Ia/BQM681QxaM0y/XtBGU9oNVoNiCulgyV0P/zOs=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=t3W1omduK2I7Eiqyw6abylakD4W0bskFgJqqSMHnYLaVVM/+eLQ8OIwj87KhamfEMTbkykmfjDU8tL1hgYkibYNHAFMWZwj68efBouzO83o+DH4cWp5tE4NZP3kWBQc+cuSiJlWPOB4PeYJxVcmjVLZifRUHHc8Pbm9Jkvx7Reg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ibUjiZQt; arc=fail smtp.client-ip=52.101.66.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ibUjiZQt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMPDpjXxJFbRzrnxofnkvBmsCwCp+Z0MljSYhBYwUu9PPsloqf6vSj+YZua7jsKE6bjk2TkAu7KBoEvrzFss5yqDGn2I9CdbsvBuckxuKIy82MouKEju+H3yrxu/ncgg1eYSGhoBvB1kzva2y9Aso4liZ1kfZbWhqEb1x2HJ38z1jc25WPTeqLR+BcpuJP4oaCgpTE4OwAMWw9f07prcM947byAB8MIhsq9c4HD4nrwbCFHq7d2nVNqlohrbq92lM3+1YNl6Key4jhSgbjIIKOUpDVbVLG1EbfobPLmlfDubNa4LQqEwM2ML1tU/T4euPuIALpmaX6aO80qon7Fbzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ldzyO9MxHuiZ7GXC3oj+RuzHCzSryGNv22Xi3zo4o+g=;
 b=oMikkkPa1y/oR//UGbBXYjEc6PunYkNncMVWl/twkn7UTQC7V7XyRk4l3vJyHx19D8aFwBQezrTPQvvWBBSSCNNHgcKAHOPcCmP6EnayEseJSfjGihixSFbgDrRqNq+WoUuVQsQ0pLqR0BVoaeNzKSvpZaYMsNGAdVccj6IAuzq+4xbimW4p56YO41phtpCj/h8JXBM/7B41B1HQD0F00pII2bAaKycbUtKZLsM2kw0ZK8w41rB9VuWGbV91pv1nw3xuI6QghPF+jAfo7WOvHegyukU6PwLPfzAwuQHwreqqyKLqQ3GW6pJU/4l/6xeJiA7FnZZnLRD3exf0fWu+Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ldzyO9MxHuiZ7GXC3oj+RuzHCzSryGNv22Xi3zo4o+g=;
 b=ibUjiZQtQ+I1qbB9Xh9/epiXD5UEYQ+rt1T0b41Q9DuNf33tzCDmHS+RT0VNj4Uu84yXXZvstQPkjwHL4yGUzdIAqaiWcY2tMRO1l1qHe8aPYWVPjeQ5TyeahYyh5jENQulxyun1DDgRIEDDN517jirvHlJ4iVWQK/0AFKUAARZLYgAlejh+tC6tliy6NRF7MxEcvvRUBo9LYCksLCcE4jnS8aHaWhC/Pz3JKJjFmjhheI8YRSwI7MyGBaE4APhrdoCC3D2mq3cD9R6a6ZUosMNTL/IMTGZ2KvUALg7+HedAoeuoOMJOyV/mimdb7a9hN0X7awfukMn9n3KPMZWSug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by PA4PR04MB7741.eurprd04.prod.outlook.com (2603:10a6:102:c6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 01:55:23 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af%4]) with mapi id 15.20.9654.022; Thu, 5 Mar 2026
 01:55:23 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/2] firmware: arm_scmi: imx: Support getting reset reason
Date: Thu, 05 Mar 2026 09:56:43 +0800
Message-Id: <20260305-scmi-imx-reset-v1-0-18de78978ba9@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANviqGkC/x3MMQqAMAxA0auUzAZiqw5eRRykjZqhVRoRoXh3i
 +Mb/i+gnIUVRlMg8y0qR6poGwN+X9LGKKEaLNmBHDlUHwUlPphZ+cLOha63FMj2Dmp0Zl7l+Yf
 T/L4fE/0NlmAAAAA=
X-Change-ID: 20260303-scmi-imx-reset-43d4520d0253
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
X-MS-Office365-Filtering-Correlation-Id: b74ff545-4400-4168-1990-08de7a5a438b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	ydwaVR0o0KOqD8qqBuJ4Ff83Llo06mLyGRgP0LGPD93H1s/V7sdzxS5eapomKgG+0QueqScHW5LApW6k20jX15uLiZoH4CBGwwdA/MawTxY8WjlOtcDvT6pcu6NYRNDxAXGG1cN0Cl6+gIAuCYan5VW2EZXxOjqpKhCEFKyxQYzMfLi9RjfnC1Jou/3e6GSDgY5Qzibg7MYdAVSKusB+QK9MK+VlAt1hcWcYi48EFJwTSJYJkhfMlVGEKFyHLOD71jkSBXpPmCG9ou+I1j9MCb/fFvmCVEKZ5dFpmbyS+TNrPLLQFgO6K7Ugfw2YbMQ9mxobq7r54U7Gvepf7LrykvGmL1VIoEhDfjCiV87PfetlPTn4FTNtLNvkDLFAsVAN52JJyh6e8g64EB7KcqQVWgXKspqZgXzQEh+yjUbTCaVAtb1sjvN0ME38d3by0B7Y6iqJxm/Gur1JVlI+JmtDArorASEsZot/Rirn+7sMgmlEI8+eKdHpWM/tAKq8LuiRzW5ghrivRx288UsjEGmxnhKl4xxsEJMnT+p5jJ9YLV1+n2xMnl+huDoUJkRMFGbqPyOn31gYyzP/HoKWRmmD773IjxFP+3Jxom+5WXdkTDmKHEJBcD2Mpq/jxXTz/SecLRzemgGz5T6N+zV8meSmAetAf0a4U9YI7dVEuilB9FPJvXdlUPwC7q/U5JcSUDMad7ZyOaZPdBv9mBk6TDrXq8TJIRn0atgrVLOxJ75mdIWNCV1cY6b3hA8SLyYlgRFq3DMi371CKcOB9iahvn6INUWSbzEUDJ4SQBSZ5uTzev4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGRwN1JacWdhZCs2L3E2N0s0c0QyN3lGaTRzOU9ZKzJKT2lGYWVINThEOVpD?=
 =?utf-8?B?Z0hOS1lidU5zeFhYVTZpc3RRY0JkS0sxV0xSZnQxYjZ4ZkYreUh4UzRXVUg4?=
 =?utf-8?B?UVU2YnJYZERJaTB2MEdWdk01emdyb1RuZDRMdzY3Q0ZkUE5wbE9JUmRwaW5L?=
 =?utf-8?B?SXc5bFEwR2VZSXlBQkVHQ2RiL2xHUnk1bk5ydGg2OE1nNEY0MGpTRklGelo1?=
 =?utf-8?B?K2twRm0vMU1SVEgvcmZTd212U29aQzFVcXlST2gxQ05wYkRtWlRScW9yM2k5?=
 =?utf-8?B?SlRiV3ovZVBmajZOUDEzNys2SUthYjRQWjF5OVhhKzVpRlM4bklFTnZvVTcv?=
 =?utf-8?B?cXpjRlZpZ1g4dkJNQnV5Z3A4eGhPUU82WkdYMW41UnN5L1RVekQ3RmtlQjli?=
 =?utf-8?B?aDE0U0QyZ3lKWjNkTEpGZ3B5VlZON3RBeFZ2MEYrampyRnc1MHZ3V0JaUjAr?=
 =?utf-8?B?MDBwVVRHelNKY0tkWFlYN1hvWkFFN3p3aGlZdENVMzEvWnJyZDlyWlJ3QXoz?=
 =?utf-8?B?dG4reGg3ZURTMHVyUEZON1p2azBHZVN4N0NxRk5lQ2RNZ3pyY2NUM0cyUmJS?=
 =?utf-8?B?cmduV1JXeE5oQzBMOEowR204a2pYeC9yLyt0VUdtUkJjaTNybnFlRnRmNmph?=
 =?utf-8?B?aVBtdHRrY2c5MWRmcWp4cjU3eDB6eE1oYXUwQTRLMUVldFZ4Z20xRjVVVExG?=
 =?utf-8?B?Y0pPMForb2Y1K2FoOVFsaGlraS9ZZkYwMFRMdVY3cDNUQ29TZGs0U0Jmb29V?=
 =?utf-8?B?Mkhobzg4NEdqVzZwdUtyT0NFckloWlVhOHJLaVFXbldoS1lRZDNJdkdMeWU0?=
 =?utf-8?B?WXRvZ3N3L2cwSmpkVnZDU1c1Y2pWMWlqc2tZcjNPVTU4cm5yS1BRUUFDV2xR?=
 =?utf-8?B?T2hmZFFOeC9vUTUray94d1FzOGRUZFFSWWt5anBZYnZ2UXRtYUgxd2s3YzNC?=
 =?utf-8?B?NjFxRmY4bVMrK0g0cWc3NVZZUnlEckpUaUdIQ1hhZkNEZi9QemMxZTdKM1dJ?=
 =?utf-8?B?QXpPZzJHTnQ5L29qWVNjaERsTnQxNjVUekc4WmJDQVBBMXV5S2FLbjZnSWRT?=
 =?utf-8?B?SlpaWlI0TDBBRjJmUG03bWNZVmdNTFppK1RneHJtRTRoejgwK0ZueTkxTSt6?=
 =?utf-8?B?alRPYk9FZmNOZHNNYm1CazhrdGFnU2FESXNHeTNDMGVNT1JXNVMvWDBkd2M3?=
 =?utf-8?B?NkYrZnczYWJReS93RkVTZGxIbjRTYnh5ZXkzQWhnRmh0YS9iWXNHQjlJaGow?=
 =?utf-8?B?Sk5uT3ZDQTBHVVNqYng3S0tPSkdWTUo4ZFhBOGFkemx4Sm4zakhTa0pwS0ho?=
 =?utf-8?B?ajc2ell0SGZ5Q3lnaXpGK0ZCUm5DeTBmRHJ3dkY3NndDdUF3TWJiaGo3U1FX?=
 =?utf-8?B?QWwxN28rbHg5M0liaWJaWlowZ1RsSy9oYU0ybXRZa3lzMEtzMkp0cEUzQUtN?=
 =?utf-8?B?RFRqazNHNUxFL0xrZ21aSEJQNlAyemYrNUxrU3d0TlRZVyt0QkZWS1Uxd0NV?=
 =?utf-8?B?TkFlc2hGTnBjdy9LekRrN29ab0NHclB1T05LTnJsTG91QXJQRmJXcnJyU0Qy?=
 =?utf-8?B?TjRmN0FuQkFiVXlFWmlGRDZlaCtHUWRIMHBDNkVtTjlTUzZkWllmZ0s1ZjFj?=
 =?utf-8?B?QVI2NmIvY1ViY1o5d3k0SlhGSDdRVlpaUWw5aEN1SHNiUVpHcEdzbFR4TUE4?=
 =?utf-8?B?Zm92QlcvdnlmalZUamNsSVRlQ0tCV1lYK0xsTm53MUorWEswQy8wUW5FcHFi?=
 =?utf-8?B?cTc1SE81c3VQMkIxWVNoTkRpTjloYkp1Z3JUVzNXYWR1K0Q5Y0R3RjZEcks5?=
 =?utf-8?B?SXV3anYxUWd5Q0hRamE5Mk1OajRlTUpoQ3F1SlBZZ2NzS0JwUHVuS0ZhWVhK?=
 =?utf-8?B?Y3dKcTB4d0ZlS0dVdmVLMzE0T2trbUFIbFBZTmlxTGJhVGhET1Zaamw2OWtw?=
 =?utf-8?B?ZkZkTTRtTDQvdk5pUnN0aHhYcXlIcWl0eHNCdnZpWFgrYUFWK1YvY3NLeW9G?=
 =?utf-8?B?eE9wRVRPN2FWRFExdnlkMEVBeWYrM3VYZDdhNmJsa1BOY0M1c1dHMldNQ25G?=
 =?utf-8?B?RVpLL2xJcGM1UEY3Rm1kU3djYjdNVzhSR1NjSnQvQ1RIa0gwWUxubWp2ODJi?=
 =?utf-8?B?N2FDb3ByamtSbEtGeXI0VUNWem5RSGpLWVBxUVhaampSakVMcEtCMVVQZi9I?=
 =?utf-8?B?ZXMwRG9HMEVJNHRYMzJlTmt2Y1RYR21pU1RmUzk5TzNUcitRditiRmJnaXVk?=
 =?utf-8?B?dWxXWWQ4SkFKdzBmV0lsT09ta2w1YUxQbWdnWFd2RDRZdnFEN0RkNXBQTGJp?=
 =?utf-8?B?eW9VdUd1S1QyTTltN3VVNEJXWTBHVlVKR0RkSFI2NnA1Sm84eW81dz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b74ff545-4400-4168-1990-08de7a5a438b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8450.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 01:55:23.7570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 88JgRfH4uwqOFGsTrHcCjyeYghufUPnj5Z0SbT3wa2025AcXYYbB5ViV+FlPcwnARUShGWjQk4YSG3LJkBvA+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7741

i.MX SCMI MISC protocol supports getting reset reason per Logical Machine
or System. Add the API for user to retrieve the information from System
Manager.

Documentation: drivers/firmware/arm_scmi/vendors/imx/imx95.rst +1542

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (2):
      firmware: arm_scmi: imx: Support getting reset reason of MISC protocol
      firmware: imx: sm-misc: Print boot/shutdown reasons

 .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 86 ++++++++++++++++++++++
 drivers/firmware/imx/sm-misc.c                     | 73 ++++++++++++++++++
 include/linux/scmi_imx_protocol.h                  | 14 ++++
 3 files changed, 173 insertions(+)
---
base-commit: d517cb8cea012f43b069617fc8179b45404f8018
change-id: 20260303-scmi-imx-reset-43d4520d0253

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

