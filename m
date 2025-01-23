Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2081.outbound.protection.outlook.com [40.107.249.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6F614D6E1;
	Thu, 23 Jan 2025 06:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737614143; cv=fail; b=QUo5j3Kd/yYAzmqkDzgbPlT1b44RXfoJ1au5fzO7K38Mt/PZt0gufV7WgzRogWqw4ng3IGXykjF/qAgJDz6R+lcB1bpm94M30b5xS9QYix4YmutCybkbyAIzFk4/Y1N/HMDff5JETlsYNLJqM757NfRkXv6aigaXE8PLQNeyosw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737614143; c=relaxed/simple;
	bh=i2LyePHRVM3yIX78jG/p+tEduGonp0EFyPU6G80yK8U=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=T7tKcSZFrgJ4SLJ7z47Ip8m8YGYG7HrC6rg99BgyWT0hDqxLFNfKqYZmU9BTxHE2t8pFbTF5mOcXOvFxU9qvvS3qqodd9ijQX2CVVrpSiFV+qTup3IaqnAgUz8Gfnd9B1U2Fewfx5gId36WLSsFqZwLVt2IcC9jyQQkMbFSjtYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=C8k94Ptg; arc=fail smtp.client-ip=40.107.249.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="C8k94Ptg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A5L2389+tfgsRfSBSAbwDCJke02f8wikPCucvEtR1L2ENZ4XomxTVwoS1QiO4iLBRMuf8719EMVQ3WBR0hI64UNmC4cWUUNBNaXHN/3LDFTdL/3nY/zoPEVywwEUgXg/NuWsJya4QgcRCpFub6JZSDK9KeAvVM4mGE6TNd0DjBXe/3yXGWIQFaeY5msTGYw/T34A4y94JUMD/+L/4mz9ydkxSXBt6GcgoJXLQT5Gg8tPBi4PeLD3515b+IDbJM0KzdQMXi/DF/7izGd+SE5k+r342wUnA3edm1w70kAI6RPIFJ6fLG4NFHPBu4+9aT/CRoVMl1ZMniz1Hc79YgvAGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJygqezG0RMsGGD08WuyFcl/Hlb4ZIuQvruuOozymjo=;
 b=F/Y7iNq1/oWz7kvHOTuPOr9NFgkNC/65bV2xYljKKYyZv1lbLa/0Ebo8xKLoDosfBOSzVgZv94irJTc1wgsv2lvkF0kIkC6uCs4R4c9FiZ7dUws86y047VEuKU5Z1M683lGDgunLGD7n2phoqb3lHJohqbCewtD9lVK3Qdc7jkghjy+glSSZQnM6cpnDXUcHsR+SfTScHz2BDXOfEJaBwY1wi2EbtKVzeL2hfQJ0xe4yvovaRO6fYZPtbirO+S1mvyc9c9wx0loH76esEmcRZRIXeD8zjheXcWeoHVraqx8/1J1UKL/4TbtsCubU2CfgOAUGYddJNknlhdEAVRjyzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJygqezG0RMsGGD08WuyFcl/Hlb4ZIuQvruuOozymjo=;
 b=C8k94PtgoPNLjIRvA7aby1vHPQ4w/B3t3LdHGvEkLGvDdMKGwcwwilfGHIgzX/0O7frCStcxokJu0ZFul7uxaOR6DzWuSVBQmaN4yy2Tg5xFZa67QR07vl9HjbEANPtUFA7MKShf8gk+ePPBs02cYmFEDVdyGX8AXyTN8X/P9H+bz1fmp7XuPz10y6Yj8d9VklmjCETKWj1/IoZlYdgQy5lle34xMdqSdwl4nvpezs/p32mDV/Otj8i4Cs64F5gAQDSfD7HkPiWrRsOd2+Aw+hRAC4xU/Oh1WWIcSqk123mQBZpd1GFeW8AnAGDxcp+0OatBFxscptGdbhQMTtTYCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB9426.eurprd04.prod.outlook.com (2603:10a6:10:36a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Thu, 23 Jan
 2025 06:35:37 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 06:35:37 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: sudeep.holla@arm.com,
	cristian.marussi@arm.com
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Jason Liu <jason.hui.liu@nxp.com>
Subject: [PATCH] firmware: arm_scmi: imx: Correct tx size of scmi_imx_misc_ctrl_set
Date: Thu, 23 Jan 2025 14:34:41 +0800
Message-Id: <20250123063441.392555-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB9426:EE_
X-MS-Office365-Filtering-Correlation-Id: 39ea46a0-7f81-417b-3bb9-08dd3b7824bb
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OF7cUX9VDybKZlhrEzSbjXHl4dYLmU0fOZ3dB5SNTsaIb/zhyTc0fhX7Kp+9?=
 =?us-ascii?Q?/QjOhFwwwH3uHGFUBFVSRakk4Un07oUtMfaV/P3LsxfL0NsWonsvHz6wBBk5?=
 =?us-ascii?Q?mWYTuVEX6waMEtDnS4NpFM/F0ggPtdksqJOOF6L1tzOKq1iUjsHgg9ApiYgF?=
 =?us-ascii?Q?ajxpVhZDmpAMMyIXdT7DahkC9d9cgTjjhoTCK4n5fvPSIcg2/I5zTyEL062p?=
 =?us-ascii?Q?lKNDmZUa+/bq9OOZhoF4NommB6yw6OdEYbuHnwAwklVmbTdtY+fLRxDfO0/7?=
 =?us-ascii?Q?mF//Fc2vgwckYt56uPsaZ1YgyUubjs6lCtQL9aIPC0l2OysQqMaJwXKf3kWl?=
 =?us-ascii?Q?0P77h4s4N+LahB7hHocxb2yyq0vzIGvsrck/haxqBbtu0xWBmHRw7A035BdP?=
 =?us-ascii?Q?JTMVczaigrcAzp4qaiTLKdly3WIIiO8zBqNoTg/qSpRBZqmuxVFWEgoL9ni/?=
 =?us-ascii?Q?JTLakOAJhK/68JOTJqAUQ5Tr6fQHS8JAOnQu6l1ewVYuabafJ9UbUTiHmwuS?=
 =?us-ascii?Q?Q6mdwbXlJan8fZ24ZqBzBauR9m9ukuKjKAVxweKi0pYMY83ZZ840UufQyTau?=
 =?us-ascii?Q?eYJWYYQh7piG+7VY/+Af0b1GJSQw+/iQBtTl9BjYSiJ0rAG92jLpAwWWRwO7?=
 =?us-ascii?Q?oMCoQIOOp+BQ74G1vX7r1KEiGYVpSHFCB3/xbXgPMs4yPCfbzRwfPUBNS1qZ?=
 =?us-ascii?Q?/516g246kqx4DSpT/0LrpPXbNHHaMLjxxP+qtE17bU5UVZVFNx7Jt7ZVzmUm?=
 =?us-ascii?Q?agamC34nztos3236eYDBhJia+5pUFGb1cN+h7JwhX18VuM1B3EIKYWvfJhGf?=
 =?us-ascii?Q?e1U7I0ol2+rhXK4yMRR8cr0Jaj8Xm87+3julVO/u72bK2FO6fAM4oHvIwlnf?=
 =?us-ascii?Q?T7orKEKG53A/S0qSFjKT5BrLopiXWsuaL0hKcGlVBK9l2X8u9glx3SV0PKbR?=
 =?us-ascii?Q?AtJh4b+6G0PlmJNskPFb/FoG8otV00hiSggMy8s7KnzwbAzNYjXod5ilcVbr?=
 =?us-ascii?Q?zgRihUaD2CpVfaUjEKFagujGd28FRYDMRnQNe6gi2ycMCCxvD7Hi07bwDv13?=
 =?us-ascii?Q?IAltw/KE/FSyfFeLkeFp4YSzjVPzhYsH1dTfVDJHhhj56G/HEr6KTT5HojdI?=
 =?us-ascii?Q?UfapFLOswf4OTceObkcrXgz4AG6ksDAdxJYvoaYmH5/VGf1Mfw70aLMGJvlI?=
 =?us-ascii?Q?eS6WpS3OhoPomzZFcMZ9RvUv7HNq7XtANKtNKz+4qfh2cjKV2fY7E5j7tzOG?=
 =?us-ascii?Q?nGxZSpry7t44ev1+WKMXbKBHw/uOQK1Woykr1z529D6mwdkBdlwO8cjZdX40?=
 =?us-ascii?Q?YvvxFeRKGi46HS+M7zaxy30VKbLsEtixmc4IKYTFCBTVhodbV1bV8alhU5Z/?=
 =?us-ascii?Q?CaQFkAHbloIvLXm2L7h2C/tbGvGQrqTqr3lBE/WWA363cwETaXxMSNGwMWMH?=
 =?us-ascii?Q?KJNnqdn/u+j1H9GQrOP2ilU/EaHSviJ+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eRo05a+RH7LOkWBuKa8MBcpoH/bjTu6xUMOw5Borm8TNzZw5ACgrrP+i5yV4?=
 =?us-ascii?Q?mPEd5FGG/MPKNeL4oTFGxKlkNvm5mev6kNK3//MBPvbN9ApDKiqIOrDIieJ3?=
 =?us-ascii?Q?SuDyauRlX1ccTJA0hPQ97nEoPg1qLUE2MxJWS0ehszdW5J6CIwoUWq4BowSU?=
 =?us-ascii?Q?INv7bcabA3qCim8R2NdXd37uqcJ/QNxJUlL3zEE5bYfnONKskf2l2P4u9mnt?=
 =?us-ascii?Q?M9ske3z06ZgKm3rh0rR3tL9Sz+3+Ab9bigHJt8o8Mz4RAWR+69/ZLX0C9YQt?=
 =?us-ascii?Q?743aMlUWRWTvTPr94vex5iOepg4Zi2feDhrqQWT7Ye6L+x6EKwWnuDjeNAAu?=
 =?us-ascii?Q?QLKjDx4bKkXvAKY7nie3e7l/1lAPR7tp1x0NB5dGDUf8/rssHBDRPloeyvE3?=
 =?us-ascii?Q?TseDs27Uc6RwHQM/h9Tzb5g/L1Gq9L2Oe+6TdZkMDIkkr3jy46msWfIjwW4J?=
 =?us-ascii?Q?tCpY5Ucpr087SGbueLXvBmqm8ellf9h8fvfXVd4M6bAcN2Ha35qZa848mpns?=
 =?us-ascii?Q?h02edfDipJ8cDCx79SsuHZ4K4necB6+ONdi3TivTR1WhrEyDasC0KcWiU4Bi?=
 =?us-ascii?Q?uYZ56imNk0K+oY9Or8QfIKr+/cX3O/fZEzLx7/HbES/rJA5W1jIIbSStiw2q?=
 =?us-ascii?Q?c3GuMcRvTT7HFePpFeIq12X3UoWWVobXwKuwHoay3Fkvchrke3Xz65XdznVz?=
 =?us-ascii?Q?vesCmTLEoEUozOKubdQWXK1RODtPxBjt5v92p9qPIdJM8E/8DcLVKqFb1O3V?=
 =?us-ascii?Q?mrfkbRqEEQEEbRhVXRq/QR6JTJYs7umHFwalINarhoO+dvSyA93iqvo0j3Fc?=
 =?us-ascii?Q?PaDZt7AasaR1yDyZaFjc298V5kjMhC/Qx/UGTSGVuXavKRG2S6rliUlPdSPs?=
 =?us-ascii?Q?sbMM/+PSU+RgKRQZnSD4Ei/dtUEczZa8hZMrwOaL2DJ4JAtYAYZjfFTOWHfU?=
 =?us-ascii?Q?iLrlVioUHrERlsqYuYdtmv0C1owzKTER1hJQ8HaFCzn6S/6AtA7MpIclG5PL?=
 =?us-ascii?Q?lOU7uBTY1dIHTQy8u0FME3uSIKcyjHzJCG/99QSKysr+7Kf/mt6ll5EMjo+t?=
 =?us-ascii?Q?l9J8Dld1+i8lZvhzOm+1X/CiGXCgQh147tno/wR8LTQEPHehTJTJyiRJlyuu?=
 =?us-ascii?Q?TrxBmdSfJ49flcNxg63Tb2x73iPxZohyS2yiq6fl3QwqyvyP2COn/xxWG+xf?=
 =?us-ascii?Q?KpZRqb1JQGgstnVD27Iaw3cF3kHJ8epYiXM4EsweEAShn8KSfd5NBWH3Zm+U?=
 =?us-ascii?Q?27GShQk/hbyGnWNR6oBwv6v9tS3aXIkcA+Jn948WHXvowvf4VuJcBTAG3KGu?=
 =?us-ascii?Q?sMguDNgflABNNZhNDQ/iiiBnRNUE3QyNp7P3cZG7jr5qf+QMibb/8CekmzBM?=
 =?us-ascii?Q?e9cefsvwz9BclQfYrRGlmlkvCu1eC4vfYpt1tEpCpJFX/Er2sqZWO8ucKufH?=
 =?us-ascii?Q?tkkjSv9TSm1bY9ZcYlnidJZN5yoP7/BiuVVOTLaTzVsWn0C8utFoQe4KSJG/?=
 =?us-ascii?Q?4pyXs1u3xk5kWYI8dAwI8fzply5GmSQXW1vlENaPu2Oq0gDmS6shOiWz2Y4t?=
 =?us-ascii?Q?jjnQl2qtYfvQkmzCQFiWAoodUytjWpElFQmgMGir?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ea46a0-7f81-417b-3bb9-08dd3b7824bb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 06:35:36.9912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bmrmAUwTyzAWWqWT3pSbkD0Enix8S3tWQnMh2VW0lrmq/+O24lYvf4yI7FjPR6p8tVP6cXEJlGegNi0QvOib5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9426

From: Peng Fan <peng.fan@nxp.com>

'struct scmi_imx_misc_ctrl_set_in' has a zero length array in the end,
so sizeof will not count 'value[]', and txsize is smaller than actual
size for tx,and SCMI firmware will take this protocol error.

Fix this by enlarge the txsize with 'num * 4' to count in the size of
data.

Fixes: 61c9f03e22fc ("firmware: arm_scmi: Add initial support for i.MX MISC protocol")
Reviewed-by: Jacky Bai <ping.bai@nxp.com>
Tested-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Jason Liu <jason.hui.liu@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V1:
 Patch is cherry-picked from downstream, so tags are kept.

 drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
index 83b69fc4fba5..fe770d7fdde6 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
@@ -254,7 +254,7 @@ static int scmi_imx_misc_ctrl_set(const struct scmi_protocol_handle *ph,
 	if (num > max_num)
 		return -EINVAL;
 
-	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_MISC_CTRL_SET, sizeof(*in),
+	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_MISC_CTRL_SET, sizeof(*in) + num * 4,
 				      0, &t);
 	if (ret)
 		return ret;
-- 
2.37.1

