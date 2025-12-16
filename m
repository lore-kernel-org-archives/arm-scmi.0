Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012007.outbound.protection.outlook.com [52.101.66.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A71F23C516;
	Tue, 16 Dec 2025 01:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765847724; cv=fail; b=IfTf5jhASp5KvKv84baskuyYQzm6fKs6gkXF/91ijnzyPD1MJR9ENDh6yBrbjxB8bXYjPyRsNwPzpjpzVmzXgpf+H9nT1WtT8icrrP6tU7YS8fxWNad9R//49zjjlxfMBwhOaQd0+RGMEpYPQXdAKw9GTnULWFM7gUTlhghveJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765847724; c=relaxed/simple;
	bh=69L4iQPmg5u/CwYiJ8G2k1v5TbZNb7WtCDHOR7563Gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HPbqctrohqlSz0CaQbsqdBRcDHLE98Vo0S3hHR7xe83//zQjATFLSrsTrGuXI/Yac9ADk1cgsKLeg82O8If3hiagYNyDBWDPySckp1uPidO3erFPge+/kQ8f0cLVOVmjdoYuAi/ehnOhTxQ/o1J9zWcnyBNhWr53v1hZoVNGjJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GCSmP1oE; arc=fail smtp.client-ip=52.101.66.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GCSmP1oE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p3TrKhyuJQgTl1b18E/u1Ge+lRhuo3xORPgwNtBjEBckwj+uncU2mKcTD050BGhVrxN5+VwiJgw9bgMf9AjrCiqCDQhyk5RXYdrr1mXURH7Q7GLglhtlIUv5l8thLBCuLTuYKsG79PIWOvnNEPXSfxmzCdFehTbn+1XTVnZCZvyGO6JF29KxwJc9N8gs1Cb+TKNLtC1l9qN1kimQjuq5t6kzJ8LC8VMtPYDG1NYZbY0eugJGasr5Ihy7s3tvVu3nzkf850zr7/TTR1XEb8qS1uN2HXBNHhmWInLzTn0XZb01yrCAQs0ROk3aMen5xSI9JlNEu5S58Fl7pzlKoZS0PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z41dYxKwmHODwCD63W+vZTwWBcxzeHeWFa2cp7JzF2U=;
 b=GYq/sXqpV+qoGVrjI/CflByjxRCSaBdv9D2Pa4zVxcSLd3dzyZW48pcBD/ROHjYzCJ9sCz0uiBEvbBemljFPKMA389Zmik/jytJINxZX21u0LgHnQiQI/yWMlhmV5SDnO6Q5ZKQlvWKQ2IhDKGpbMXVmyVOkgctNAcIj6dL4t9k7B5WWccgjawRNBgYtU4vJlATTmss/lMd1z/Ixk30Rco6VMOe1+qKGoAlxFBYKH88HpvIF8YoT/hQIEdkTttD3EjSYGlPVJCvJQwdgfu1UohPPYoPBjVLDo32lpiDHuGez0asBOmPOCH5YToV0JfbIc/Tzsqb/RqShv0HKOmVXYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z41dYxKwmHODwCD63W+vZTwWBcxzeHeWFa2cp7JzF2U=;
 b=GCSmP1oE+mglfqb014WdfdLTr4lsXgtavtImpByZ6hpLEB2W5iQzkhYFwLd5FfhrBi3XocoeCIKe+SyJFX1KtqtOncmhQfBzo5wz9/cKu1TZWObSOkCA+9Z05iij+BhdVP5GZxSaXSmScKpQAtLaFftV6eksjBz/V8Qx5oMUGNLDXsuK9nJPSMayIYVv9ZpNV2MkEtqRPtgA7IbziOf8617/8i2kK2mRc09olm7OUgjDtwYwhNMNOR6ZiRy6uCzKmdEwOd0MBwWPFoNUzOwh2SG0ZVEM/Xgr4p50rr9ZVpbkNoqqecoUiAAUOJCB7nfUcVf036jhcnst5SzyQ/9EeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU6PR04MB11207.eurprd04.prod.outlook.com (2603:10a6:10:5c2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 01:15:18 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 01:15:18 +0000
Date: Tue, 16 Dec 2025 09:16:23 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] firmware: arm_scmi/imx: Support dump syslog
Message-ID: <aUCy5+vAPzDGeux3@shlinux89>
References: <20251029-sm-syslog-v3-v3-0-64e14a6e3f87@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-sm-syslog-v3-v3-0-64e14a6e3f87@nxp.com>
X-ClientProxiedBy: SG2PR04CA0177.apcprd04.prod.outlook.com
 (2603:1096:4:14::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU6PR04MB11207:EE_
X-MS-Office365-Filtering-Correlation-Id: 74ae38dc-a510-40fe-8faf-08de3c4092f6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OjxNIufcmDQFJ5oAee50/hkyK9LOFxVOI7VYv8fYNwBPoJLiUcVty3CEhjnb?=
 =?us-ascii?Q?PGMLZ4b6hircA4A0ZFkbpLz6f3Bxq895c+sTTLQ9yEKzQNbSnnwFOua6aAD4?=
 =?us-ascii?Q?4ro5OKPi0EK12fwolO09tlseub37VCeZfR+Fr42idTOORPCDN1HyPo/LNgUW?=
 =?us-ascii?Q?63bdvCKrBTdD+OpkKW0CgVdGU/THt+vV61GRjEPNtt8fsNHqDEUK+M9klyZS?=
 =?us-ascii?Q?lQqo877ISIx0O06XKIQLbphZ6m2XJ3UDxF08Yyt7wpcae1iR/TReaNJDMUws?=
 =?us-ascii?Q?vZNXiHWzE/NEmVYxxi5djx/vV6oIAP4FEq3VbPGoBSbQGl0hkse9ezaJ/gRk?=
 =?us-ascii?Q?rKFiQ8NgC2MlQkH0jWVWMFySv2PehS76+G763wqZp4CJWX7Sv0dpQAxyl1xY?=
 =?us-ascii?Q?N2Iz5KjtLzanJt7y5uu3NB+6a9sIfwv2d28gmYA3TwWmt+VZnLCbw77pdZDB?=
 =?us-ascii?Q?UIswWv/3QHSzohyJW5aX6UqVdxrYlFtsOg+X98uC4qqmMIAbEnnL0U0sgm2P?=
 =?us-ascii?Q?mq7b1LWGNcWH3S9c3sfBeG6ltM3s9zhBbkxXHhuJymy6ObRiig2Y93FbwfHm?=
 =?us-ascii?Q?QQdWlHJtVg3VGmZhLEyeZStdr2ohRmyse8UTZsOROsV9arLbipT2MGrfuBhH?=
 =?us-ascii?Q?7A1SRSvuvvK+1WGcWOKHB+ioNyv8ljoQ7Ty1mbnxp+1+Rq7jU2x32tDBQeBW?=
 =?us-ascii?Q?HmPafLtrBFU2iLKarVLShqm5fMuFGLgzslAk5ryjfm6jZ2Z7TXFG8KCIvpOZ?=
 =?us-ascii?Q?s+DT3vm/n0Q769m7U11Ul5kLLkMJhesvZ68yRpQtczL3Hi3AiHo4kH1KBpHi?=
 =?us-ascii?Q?5cS4fsoNXkSwEOAbD4oxz2P8QJFEZR9C81UKaV8b0eWDffQJ574TYANWTYmW?=
 =?us-ascii?Q?E+kUGj63BUpc/YFLpq4hnVC4WgCT53hUFX14EZCniZJDGjJpVrc4mdbFfqbZ?=
 =?us-ascii?Q?biCoGds+jX483hUNT8NR7NdcneWD7W0YKthu38sjHbib3UJvTD6+exrUNyX7?=
 =?us-ascii?Q?k+QWMyqwPVEC6Ma4JhpX9N8rq2zGDkSOu6uHC97+YefvGBv1oE7gYV8cW0n7?=
 =?us-ascii?Q?WB34dJChgCyyFqm4XDHmVYQU5u3srpRn51bB9/EpbwDDNWukP1O1r8QsQyRQ?=
 =?us-ascii?Q?9PI8e3+omfpI+BgLj+ONWMSuZggi5Qw4LSX5y4gkpCIqVpaAtDtNBZdt+DnH?=
 =?us-ascii?Q?wWzMnFuJS/B39Pb7emQQ+IKSSDVLiqH8l6qtoDpT5ZcinHrmexPKXvgkILuE?=
 =?us-ascii?Q?LYODN0ZzlUTsmrYc6r0oMbfwLpchhyIKuMuhBwtVAEClqBLO7Dja8Ynk2yr8?=
 =?us-ascii?Q?SNOb+KOAbfy2Pk7Pa2OIb1agHt0evYRgsIn3pn4bZEo2W5AMs6zOkb3P6j9Y?=
 =?us-ascii?Q?Yhwp6i9q0qmv4QXEvZBA8Mgex0p/qnWEoFwFsZRJ2H37coKcY4Op8wFrnUMn?=
 =?us-ascii?Q?Wrtrcf1BKix4W8w1fRSLGroYLPA8I9Kh104wHmNU+wB7jq9IDZOR2qHzX34r?=
 =?us-ascii?Q?c4l31GY7bF/H6NYQOaMxhwYBy9JAfmHz8Zy0Z4O/j8z0V7kFxzyHs/RYiQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1cs4wpKFn2RL61CTFo9SeObjBG9xCMQG08ydVIbLVambaLDt6BsOJkydg3za?=
 =?us-ascii?Q?V0BOQAoi/RT5Xfhy1ppBOTUS/v5xpJ99O08QXJPmRXnKg5s+SMmPIr93pfXK?=
 =?us-ascii?Q?dYdrQjYoHWS65cgtYjBA1skwd+/r5amr5JZzgrRDs9uWz48ioMgyA2iE6pAY?=
 =?us-ascii?Q?QZ/9ZAwzEo20zgUPcH3wArTwQghSJ2XTIkOvt5pZkH6FetkA/YDkJeZcrxST?=
 =?us-ascii?Q?krnt5w/N71vq4pwizfvOv3cKzDcEmN1EYq0Yl4x46LXIHCq+5744X37AEa2S?=
 =?us-ascii?Q?bhWAcWK8Tw7o7eZYbS2o8vgOLTD8ODDEgPnxOqWNgpzxP06REYAJ5zpNOQ3R?=
 =?us-ascii?Q?i3Gcr1LhJkU5TlM4/t+u4AHeh699nwTGR+Z2tytfFSyZBs53GplAH1FJoaNg?=
 =?us-ascii?Q?bDfVJDAhb4J6lr0QKu7GYDcAUo3/8p+rt+/v39cDLs1OoVEVJDb4mYpgGkgR?=
 =?us-ascii?Q?VCiCj2tbKWO5MrBKIBV3wPulLcuXjdx4BtovNwU7u0ULAWepWIWAZ32CyQX+?=
 =?us-ascii?Q?8hVSBf8Lav5artug6eCYqHLcs8V7pzY5BWGc0lis0DH7Jyzzv6rXcXymdQcp?=
 =?us-ascii?Q?uWGLya1QfOPg2iMNyaDbM9AqDJCgce4WkCznpM6BS/yQ70gph6fl9lcbnn4t?=
 =?us-ascii?Q?LeXMWHY0QaonR+adqdb4NwTulo+F0sbv9ZIYUjIqSc4CESjdrUJAoM0PA4zf?=
 =?us-ascii?Q?LckroGQ9hRJdaPwHOyZ1Ah4nWrv4vyB4Zpixa2EcbDipMX5tst2qi7CJpIDs?=
 =?us-ascii?Q?MW/ngTspviNRPRKs2aAZYIgoYcfzVJHlaT/V3Gt+dF0C+AQtXozlOGha2Rlb?=
 =?us-ascii?Q?ZygrA9z2lAMG4TMnabe8yNdOwEEzG1H+0N8pcQ0yBECCEnx2NV+qI4QC7cYv?=
 =?us-ascii?Q?o0Eo0mBbRuF66/hhWjsNGA4vLLB14Y8uKv3xPXerNGhLBqx/Ykw/mg02zkyE?=
 =?us-ascii?Q?Dc6KoOtL8rAsab/AXHxBgtWjO7XeANeO8WHsOK1q+YlBeLuctfYAadJGFrsj?=
 =?us-ascii?Q?pSdSc0+UqkOPEL0gM0QIh4EnpceVRxXk6ZkOTsoOCrKt7YhC1RVa/DujIkNL?=
 =?us-ascii?Q?ePoKqbhrgDI08ZL3WZQOnqBC9mPfzNu5oFB7jw8vz5+oQb5/w4QO0vvTVOm2?=
 =?us-ascii?Q?+dypQBPDj5juOhdduSImYi+4Vrh69divZt44PWxBEOiV37vHzsXCQ6TcmO20?=
 =?us-ascii?Q?2tVNVeXa4eIwHn1tKXrlRSJFivOQMEl4j0zyFSMpd/V+3pvONrD7a/K8SW2B?=
 =?us-ascii?Q?sCT5Eemhz5LTNAXoioSR4YljxAn4wNLXYk+V3WxwCfV90VDAcCgpD3F1rnmE?=
 =?us-ascii?Q?MFiLFPOS7wTGCdJ76OuZ2qZ6PDkiOe5r1i9prXxFNTa4RGF3SUyOxa8F/oDx?=
 =?us-ascii?Q?qgAXTbivlOvHkyan1Iy8QrsVV3wJpxTyUqUJah0Byo+xlFh+kBSw7YDWSNxI?=
 =?us-ascii?Q?KkJJIOo7KBtBz6GifFUT/jsNT29DWKD4ZQVvjByMbn3Pf8QeunvqLFb8JZu7?=
 =?us-ascii?Q?4QSCGOJ2pRV5IGCrQXOKGJpT9VitiomBH1Gjlwn1jLjnwyWlTqmamhQJs4h+?=
 =?us-ascii?Q?6ig/MzPi04ldnoHAZV+aWE+bcVsQ52k8RuAw5nGS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ae38dc-a510-40fe-8faf-08de3c4092f6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 01:15:17.9536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3rrTWPPDuR/Rf8jggHTU9O46pC/qtnNPl7RKi+60VlWg1cDs5ih2zwOIUyTzAv0Vr3pgueIognmrvSlHAdnWtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11207

Hi Sudeep, Cristian

Just checking in - did you get a chance to review this patchset?
Please let me know if you need any additional details or context.

Thanks,
Peng
On Wed, Oct 29, 2025 at 08:07:00PM +0800, Peng Fan wrote:
>This is the patch 5 and 6 from patchset [1] with switching to using raw
>dump, per check with Sudeep and NXP i.MX SM firmware owner
>
>System Manager firmware provides API to dump system log information.
>So add the interface for Linux to retrieve the information.
>
>In patch 1, I drop the two structures compared to patch 5 in [1]:
>struct scmi_imx_misc_sys_sleep_rec
>struct scmi_imx_misc_syslog
>No other changes in this patch.
>
>In patch 2, I switched to use debugfs to do raw dump the syslog, compared
>with patch 6 in [1].
>
>[1] https://lore.kernel.org/arm-scmi/PAXPR04MB845937237E3C1AF5A2ABA8FA880CA@PAXPR04MB8459.eurprd04.prod.outlook.com/T/#m6ed303ac9c584c6e2ab39f89359f3131b
>dfcc9e5
>
>Signed-off-by: Peng Fan <peng.fan@nxp.com>
>---
>Changes in v3:
>- Rebased to next-20251028
>- Drop unused variable to avoid build warning reported by kernel test robot
>- Link to v2: https://lore.kernel.org/arm-scmi/20251011-sm-syslog-v2-1-v2-0-f43a3f6b32e4@nxp.com/
>
>Changes in v2:
>- Rebased to next-20251010
>- Patch 2: Remove the IS_ERR check for debugfs_create_dir per Dan Carpenter
>           Change 'return 0' to 'return devm_add_action_or_reset'
>	   Drop the size check
>	   Include 'linux/sizes.h' to avoid build break
>- Link to v1: https://lore.kernel.org/r/20250910-sm-syslog-v1-0-5b36f8f21da6@nxp.com
>
>---
>Peng Fan (2):
>      firmware: arm_scmi: imx: Support getting syslog of MISC protocol
>      firmware: imx: sm-misc: Dump syslog info
>
> .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 83 ++++++++++++++++++++++
> drivers/firmware/imx/sm-misc.c                     | 37 +++++++++-
> include/linux/scmi_imx_protocol.h                  |  2 +
> 3 files changed, 121 insertions(+), 1 deletion(-)
>---
>base-commit: f7d2388eeec24966fc4d5cf32d706f0514f29ac5
>change-id: 20251029-sm-syslog-v3-0143f85b0ce6
>
>Best regards,
>-- 
>Peng Fan <peng.fan@nxp.com>
>
