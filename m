Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011064.outbound.protection.outlook.com [52.101.65.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947AF225788;
	Thu,  5 Mar 2026 01:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772675737; cv=fail; b=cTAINq9FteL8Dpq+/bsxtMRSa2I2+uTFK8b9jmjBLluhBqHEeGMz3N8HciXlm1IK6gugefC4UTTIDXFwxc2QPFVOn1dTQAdLGX+YOsaGDGx2IPOJrR35qwJ9izkOO096u7mFZXpMPiF9sef4IscYefjiaY1iB6tfAnb8ZjEyk7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772675737; c=relaxed/simple;
	bh=m4x8PrlWBm3B2mZvl2LGw0GB1loSD/g0XkIXCT4mK0A=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=l8WQkCkDARX6u6Et+sdsFqXINCd4ypcGYyWTQ4hFzbS0sMstT9uqHVJ92xrcfLUdIK1p7GBcS7wm7EavgttR6o3k1Psbw1QKj9sBuZ9Ztg05PI7G/Lwd+J8VSORqxMd/wm1uo0spgF/KhE2PzCeqUwtBDJKzqv7mlVMyrc8BE8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hlVCcfJx; arc=fail smtp.client-ip=52.101.65.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hlVCcfJx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RfNs8tLcVBu4eo25pJoLlsSk2hY2TZj58w1gAi59J9A6ifiRUNXt+47/YjoY6zgsKhq6iawCB+1LeuZlkVeDEmdj2/lCu64cXy6m5VpOCHrssvRbA+zR7zFZdJKCiBj4TL1MVHwKnScIv69TvLesbG6Ho8HgtCTUzxV5TQMKOpfIIQlIA+ahupK7auXh/7frSF/RUl12kJjiSRe7aPWFVXYhLBXyJXCVojOyReJ13AQGdqTYMPHikksJdkB8w8NV+UMKqzxdmcUHT1kB1mwzz5737V3OQLeHhPK4Mh90AeffPWym1ZaSEhrGcX80b+49aWlmG5UTtr+S0Q8k9t8xLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=shkOSYNpfObssNiDJyMlF3QCQk98ijp+qo20htP9ms4=;
 b=yBj89ovHTlJBEHS5albB50QjWO0jy7tXFMbjJJUzkdvWCgZOCfOKMT73qTcxH++K37KeNUfEFA3WG0z9NRzCKed6LWcXhx/juoDgNPVI1yT2zYLcfVen/++eHGgx5ho02mF0OLZe35DGLeOfSkFLvuZHnNKKNCRhUFQebiApgc5WuZPG5+FU/WWXqg98XIPM+wjURO72A/Z7qWIdq3vIsK6dYClmFRVl3dTqln+Ljd6xf7TEwHoD8jbJrGZF2a0jWhnAiH03lcBfqeblDDWmqYYbM/VPqrFsME62sDjzI07LRhAxj61YyREDLsNc/A5DINg9P3wKsMbKnKIEB9VoRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=shkOSYNpfObssNiDJyMlF3QCQk98ijp+qo20htP9ms4=;
 b=hlVCcfJxqcCWT8sHEqau9zEFgx9iXJHoffabYkNHlbStTU7DpROYiaB2JC8CF4j77vr748JSndjeQxvBWgottiGHbOD+g1jsDRVYRvzhTzJh/UeGQxW4jRGAKXaw3MoSZhjC2KZWQ0XPtv8s1Yd2aIWKtNbEL6DjYh5mkM/EZIuKVGKxS64JQ86nyozZdfB1FJYViGsA9uoK69PtWHAZqqzkmYJh23ZghLqJB3jaeBhJmcCFNhH25ldFYjPcp2/jQEUyJLl1d/ZW5MvcXJIAKr0OH51y/NvqCaJkBrrsNkaMYMeWm/vxlnyq6ww3IphiazpKeZHoiMTzNtjEe6Bw+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by PA4PR04MB7741.eurprd04.prod.outlook.com (2603:10a6:102:c6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 01:55:32 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af%4]) with mapi id 15.20.9654.022; Thu, 5 Mar 2026
 01:55:32 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 05 Mar 2026 09:56:45 +0800
Subject: [PATCH 2/2] firmware: imx: sm-misc: Print boot/shutdown reasons
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-scmi-imx-reset-v1-2-18de78978ba9@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 74f1ca51-2615-41ba-8d9c-08de7a5a4914
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	bX2MEg9zLLy1U5Jqg82bxtM2EoRzfvyooVVP4NY+WTOJx1ZuelnuGhGwfAr56TZlnorRThZfQQaihXtVUuOAt8DeGnVJlyB4AQQ8R518g3EEf3Qhn2peomjItowduInKs05dkT5YsZ1LuYVWviFoiboIpYOFJlyvau8yrohRpi6hDahBCZqU5uFjZhQ5UeVIoU4H4l+36auk2lNrGn1i+oRUyvtTTlAGLbvNCSsfdQDPSQCnPEZOvvUSFEySIyrAGyObVk9q30w8y45e5UUA2X+KrjMgbDKfTNMtMTu7q0MeoDAW6UV3oO8HjuvVxSajejxwrXp+VdNrfdFwlCFKcZYWpkOruFNaP+OJYvxbIRcAkm5FF7Go5zQ+qjk1TzwE4VMEGcWAD/9Me3vk9ylpCWpHnkKt4hT/VoYmDdrLFtLAwU3BwRyfGNMFlcBBGjgARQQxKNVsRb9ZC9hchWgwhqdOQTXVI9y8i1+SRKBsY76qhXB586ad2/fmFU+G29eJodFMvAlmjFCCr3693D55K+/R8PNXQ0z8xxd/OcLaUQdUvB6GMvdtFC/1OnqIpFsGnm4bOcXzl5qHNfx0vY5Kzdcq/m4aB/Zu8VU3N6LYFxe76PCioVp0cEblX5ElLfV7CtbrsowI4E1iyELupSm6HD6/qWH71TIJoLIgpzl6srk1k9o9qitKzSehRWSrVAx/XhkF8nhRa+w0pwgiPzvkzcpXL2Oq+90n4ZL1feQvMDa7qNYe/zmJOqi0Pp8u9lPNYkyfvAJWZWlB4xXrMS+fAsBLnbsaFGQw0rKtkqnHN2k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2hpQWcxekhPVDQzNTEwdXd4V0dtWE5SWnNKUzZsUE9jL0RUbDFUVTJVVzJM?=
 =?utf-8?B?aTF5alpZQkEzTTd1YytQQmNFTlFYWU1mblNBelRVVXdHZytKeXRzVkpwR0ov?=
 =?utf-8?B?OEthYWlSRHNpN1ZJUTBNY0s2UGFjbFpEN09OblJhcG1CTzIwaWRLV1MxTUNC?=
 =?utf-8?B?OW83UFkwLzh4WmNpRGUyS0JDejA1N0U1eEwrSmcvZ0V3akZ2Z1d5TnZTTUEv?=
 =?utf-8?B?MC9YS1U5YlF1N3owZFVSTGNWT2w2QjVtODNVRExRcTFXYTdYRU9KM0VDUTJa?=
 =?utf-8?B?ZWFJaEg4Q3NJY0JWaFZHNnp1RDluZVdVZmkwTUdlQjhBNmFVMXBXNUVOeEJi?=
 =?utf-8?B?ZWZwQWJHeG1ONW5BU3MrN0lnMkFKbmFDbDJTZzhjN0VKRXA5ZGplRWY0c1lY?=
 =?utf-8?B?VUFEQ1p1OEQyeVlHK0ZpMnZvemQrVEhBVHdGREN5ZmQvVXliVHFpRVBMT3dJ?=
 =?utf-8?B?aVRQZnQxWUd2SWF4cG96UjlVd1ZUVVBjRUZLcW5RdEIvbWFmMytFemxLQ3dE?=
 =?utf-8?B?K0xsczdlc1RsWkkvWk5YdE9BSjQ5aVFxM1VkV1U1bGIwVFFPaTlhbWxKbHNq?=
 =?utf-8?B?enhEOW1ibVhOSzFVWW10ZTgvdldhM3VFVHpNblNjTTJXUlgvWENBNU1wSzNI?=
 =?utf-8?B?YVlOWERKeUFIdFI1Q2FWTVBuTUVoMVFLbDR0RGhVUk5HV0RETjh5UUVpMkhq?=
 =?utf-8?B?QlZITmFSbTdBM1hIYkJ6TVFZVUk0dlY5KzJGOWpUOWZrNHFueng5aUxMSUlY?=
 =?utf-8?B?Vkh3dUh3YnBKY21UM3BZOENJOHlhTm9renlTaHNWdzUwaDBoR0RlVVZiK3p3?=
 =?utf-8?B?dUFnOEd5NmUyY0tWcmc2OW9kQmZHTm03Zy96a0VLT0N0TjREZm1GWVB5VXc0?=
 =?utf-8?B?MWNvMkZXNlVPWmdVeS9Sc2o5SjFDQUIrazdxTyt1L29ydzVIVDBrMGIrSVdH?=
 =?utf-8?B?dDFvQ3Bqc3FVTjROWG91UXlDUWRoanZsS2l0L0NUbGpCaXN2QzAxZkxSVCtn?=
 =?utf-8?B?SEV5czdIYloxVS9Dd1lqNHZnNmdZZlZDL2tRaitHYmU4eEFuYkVDM3JxTVkr?=
 =?utf-8?B?VXF3cTdmYituRC96YWFjdWZweEJJYnlhTW1vMVQzd3BwZTJjVi9iTEErME5m?=
 =?utf-8?B?RnNCeDl6RWpNNFJQY1dwWEFuSEdlZ2U4OVJMcEFndENkcWlsRVR3Qk1EMERu?=
 =?utf-8?B?V0FPNFJFeURYalA5aFlRTGVmaFh4OXlTclNKUk04MzFRcHVnN0t5ZHZzd3d0?=
 =?utf-8?B?SUtma1JPQWsvby9sbTlRSi9ybkk1SW4zWVNzekU5NlQ0RGpMY1JoNnRHT2NL?=
 =?utf-8?B?T0h3dDJ6VnVlRi8reDcwc1poZXNGMlYwQ3g0TzVaKzNIWGZBSW9SWS9UN1VN?=
 =?utf-8?B?d0ZxblZRVUpNQ2hqSXFLQkNucFhvSm1UVUdWbERFTlFVZi8zL3hoTnFWWnpw?=
 =?utf-8?B?c2x4RVhOT3liNnFhSmozeVZXL2w2K29rTm9VVFBJKzdnekkrcmRLOGFEVDJ6?=
 =?utf-8?B?THpCclJITExnZTNqL0FPTjI3NWQwa3ZkVEVObm1idUF0L0lQeHY4cURQaXY3?=
 =?utf-8?B?UGdaRHZQdERhVjdpRkpyRGtVdkdrSW5POW1zYzI2d3UwSGVQeXBzaVFoUmxU?=
 =?utf-8?B?QU1nZDhZLzc4c2FzbzhjT3NuKzlIRi9FZUNpWlBQc05NMVF4ZXM4aGtHbW96?=
 =?utf-8?B?eUtFVG9hcTZmdCt4eGhuUFJVTnRiNC85Z0Q3dnprUXhHbnhnWk1PbjM1d3k1?=
 =?utf-8?B?NXJWTFZQaS9oZGdnRTVYYm5kVnI4UkdkNFNaT0xDbU14UVJvZHBpcUdxT0dy?=
 =?utf-8?B?WlZvVFQyQThRbmU4S2FDM2h4OFRETXZWUEZUNk5uM1hDYlJBNG50QTA3NDhx?=
 =?utf-8?B?TzB4K2QrbjdMV1hVYnJMMnlrbkE3N3h5bFlTSTlJa3lNNXdySldaRjJLTVhB?=
 =?utf-8?B?bEhLMmFDVTJJYUFscFpCYVhkci91c0t3d2RUeXdHKytyL2tFbk1kalRVcW5r?=
 =?utf-8?B?SE5yM2xuK3hkSWZaNWhkV2xpNHF1U2JkMmI4VWV1RDk1bnhhaGhzN2NEdmx4?=
 =?utf-8?B?OWlSUkJvY241ZVZndlRGOHgzMk0ydjB3K1AwcHY1cUU3dU9rbVdKd3lFUi93?=
 =?utf-8?B?QVQvc0xETWVheGVYem5NZElOMmpsa0RWRGVZd1BTekcwc1kzMjhkb2g1Y1RX?=
 =?utf-8?B?RjhJWS8zVVZ3VmxieXZRRGRSM2F1N3dJaExKaDlCbjdra2IvbzdBS29XRnVm?=
 =?utf-8?B?MktmZmpPUGJvWVYrVGxHa3hPZSt3eU13ZUFKaE15a3U2V1hZWWlNZ3Iwd2RQ?=
 =?utf-8?B?cVE2RnI3d2cvTnFiV2NMc3Q1djd5cldSbTR4czBQRTVlYTVhVTdlQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f1ca51-2615-41ba-8d9c-08de7a5a4914
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8450.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 01:55:32.8484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SsRgiQkynZUlvHCEIURdwVHVvLZLm2puwa7I6dCjuhyop4CgmRn2XvbBx9x8FuOZJHVhu+VetjkQ/+zHX5yn/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7741

From: Peng Fan <peng.fan@nxp.com>

Add reset reason string table for i.MX95 and introduce a helper
(scmi_imx_misc_get_reason) to query and print both system and LM
(Logical Machine) reset reasons via the SCMI MISC protocol.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/imx/sm-misc.c | 73 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/firmware/imx/sm-misc.c b/drivers/firmware/imx/sm-misc.c
index 0a8ada329c9de3c1627da241bf142fa91a8085d7..16b5ff833d21274403a4c55abe2fa1f49fce3e73 100644
--- a/drivers/firmware/imx/sm-misc.c
+++ b/drivers/firmware/imx/sm-misc.c
@@ -18,6 +18,29 @@ static const struct scmi_imx_misc_proto_ops *imx_misc_ctrl_ops;
 static struct scmi_protocol_handle *ph;
 struct notifier_block scmi_imx_misc_ctrl_nb;
 
+static const char * const rst_imx95[] = {
+	"cm33_lockup", "cm33_swreq", "cm7_lockup", "cm7_swreq", "fccu",
+	"jtag_sw", "ele", "tempsense", "wdog1", "wdog2", "wdog3", "wdog4",
+	"wdog5", "jtag", "cm33_exc", "bbm", "sw", "sm_err", "fusa_sreco",
+	"pmic", "unused", "unused", "unused", "unused", "unused", "unused",
+	"unused", "unused", "unused", "unused", "unused", "por",
+};
+
+static const char * const rst_imx94[] = {
+	"cm33_lockup", "cm33_swreq", "cm70_lockup", "cm70_swreq", "fccu",
+	"jtag_sw", "ele", "tempsense", "wdog1", "wdog2", "wdog3", "wdog4",
+	"wdog5", "jtag", "wdog6", "wdog7", "wdog8", "wo_netc", "cm33s_lockup",
+	"cm33s_swreq", "cm71_lockup", "cm71_swreq", "cm33_exc", "bbm", "sw",
+	"sm_err", "fusa_sreco", "pmic", "unused", "unused", "unused", "por",
+};
+
+static const struct of_device_id allowlist[] = {
+	{ .compatible = "fsl,imx952", .data = rst_imx95 },
+	{ .compatible = "fsl,imx95", .data = rst_imx95 },
+	{ .compatible = "fsl,imx94", .data = rst_imx94 },
+	{ /* Sentinel */ }
+};
+
 int scmi_imx_misc_ctrl_set(u32 id, u32 val)
 {
 	if (!ph)
@@ -75,6 +98,54 @@ static void scmi_imx_misc_put(void *p)
 	debugfs_remove((struct dentry *)p);
 }
 
+static int scmi_imx_misc_get_reason(struct scmi_device *sdev)
+{
+	struct scmi_imx_misc_reset_reason boot, shutdown;
+	const char **rst;
+	bool system = true;
+	int ret;
+
+	if (!of_machine_device_match(allowlist))
+		return 0;
+
+	rst = (const char **)of_machine_get_match_data(allowlist);
+
+	ret = imx_misc_ctrl_ops->misc_reset_reason(ph, system, &boot, &shutdown, NULL);
+	if (!ret) {
+		if (boot.valid)
+			dev_info(&sdev->dev, "%s Boot reason: %s, origin: %d, errid: %d\n",
+				 system ? "SYS" : "LM", rst[boot.reason],
+				 boot.orig_valid ? boot.origin : -1,
+				 boot.err_valid ? boot.errid : -1);
+		if (shutdown.valid)
+			dev_info(&sdev->dev, "%s shutdown reason: %s, origin: %d, errid: %d\n",
+				 system ? "SYS" : "LM", rst[shutdown.reason],
+				 shutdown.orig_valid ? shutdown.origin : -1,
+				 shutdown.err_valid ? shutdown.errid : -1);
+	} else {
+		dev_err(&sdev->dev, "Failed to get system reset reason: %d\n", ret);
+	}
+
+	system = false;
+	ret = imx_misc_ctrl_ops->misc_reset_reason(ph, system, &boot, &shutdown, NULL);
+	if (!ret) {
+		if (boot.valid)
+			dev_info(&sdev->dev, "%s Boot reason: %s, origin: %d, errid: %d\n",
+				 system ? "SYS" : "LM", rst[boot.reason],
+				 boot.orig_valid ? boot.origin : -1,
+				 boot.err_valid ? boot.errid : -1);
+		if (shutdown.valid)
+			dev_info(&sdev->dev, "%s shutdown reason: %s, origin: %d, errid: %d\n",
+				 system ? "SYS" : "LM", rst[shutdown.reason],
+				 shutdown.orig_valid ? shutdown.origin : -1,
+				 shutdown.err_valid ? shutdown.errid : -1);
+	} else {
+		dev_err(&sdev->dev, "Failed to get lm reset reason: %d\n", ret);
+	}
+
+	return 0;
+}
+
 static int scmi_imx_misc_ctrl_probe(struct scmi_device *sdev)
 {
 	const struct scmi_handle *handle = sdev->handle;
@@ -133,6 +204,8 @@ static int scmi_imx_misc_ctrl_probe(struct scmi_device *sdev)
 	scmi_imx_dentry = debugfs_create_dir("scmi_imx", NULL);
 	debugfs_create_file("syslog", 0444, scmi_imx_dentry, &sdev->dev, &syslog_fops);
 
+	scmi_imx_misc_get_reason(sdev);
+
 	return devm_add_action_or_reset(&sdev->dev, scmi_imx_misc_put, scmi_imx_dentry);
 }
 

-- 
2.37.1

