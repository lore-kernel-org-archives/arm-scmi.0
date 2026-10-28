Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793195069;
	b=cmiiSd2Qm6muPwy+RyMQcZ0w6UjayTKF9uDw9m/N+Mtc1m2jWmU57KqW+A5h4zSI/5pd
	 S9Sz9F1lZb7l1DAs3oGZVzY0jXRER/Iohnu4n9XWrLZ4Q+zCziweCJwgVqJq/rgSYr+iE
	 CVJ7DvToMvy/RZDh02g6kCBE2V1bqEXgBekweqlBn7Bc+h/hmjnJFgc0pRux1vUbNafXS
	 WZN2MG/RQqJk8ofuPBYf/WN7x9eFgcVrENF7xtChiODsQBRa26h4IkxjjEbcabqZLq/sc
	 8s/XTdLyl9RF3aN8vhKef1BbwrEe0VYi1BL4aJRAFX/r9KYr8V0A7hDIh4oOrGvxzgg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195069;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=vQDpfExC6os9LMjkrFVdlgnsAq4pRoDWhu+W8V6sLpo=;
	b=Zd5jR7WvFmuVNmjis7v6cg338q4M53GxMWs14EWXXZXZEdYaQcbOo/zCuXCAS0sWgb9i
	 7CnauKy1PQ04G5L+SlbFd2OMqClN2uQ/E9PiddFAnzwZAMv+s4Shr4zW5p4Tq8AZNGvE/
	 8vTR7vbCev4gokensZpvo1orM7UYeJVwW04ANEDHzufukLvTAfkIToHI9HfVsG9qNyIdR
	 0NCoWhK9nSc7HpNUdQcAwMcDWI55eZjCDTzzVHV02GPU2NFYciDBO4w5baMU3fJZxovKK
	 nvVsjZSefLAQjQ7p418mt0Qj27JZr5EGgSNLUoqjTxq9L/poyKRj6n5b8qARpfbni1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=nz4w9qz5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.62
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010062.outbound.protection.outlook.com [52.101.84.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3A9606A31C
	for <arm-scmi@vger.kernel.org>; Wed, 28 Oct 2026 13:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE3A9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=nz4w9qz5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y5+RcCSmWLp9HHj/DF2KJYMcyxg++l4N/VsqyffshkyytGF1dKKwlw+W3QEC27ikwYaQykZw9i82AuJ0e4wKOWIA1j6Y2gQnuam0fvisMdsGIA8SY0Chd1yVBsnzAO1qDfN6cR5Kmfg0I0ZHnabdGLtIVp09hYIB8eRahpxQcvqURTzOKkPuALWYLwZW2BpZbsjVBrJbBemaIDRGyKocfhTIH68sTqnBFAEYzd5xCe6h8HNb7oWqzEd25RWPTedRYDfNjx9SZIqwhwfqC9VQvr5SderddQAelP+djtWpioktlAYLDN/X/pBRogRbrLM8YutYxPhgNas7SzmM3tpu8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQDpfExC6os9LMjkrFVdlgnsAq4pRoDWhu+W8V6sLpo=;
 b=nTXt1B9HhBDXfeXIJTUZN7arIZts2denb1r45sahj5F3HTBngEN+Wn12NNR9yQo/yk2sEvNXoHNKG6FZhP8zDy4wD41SXTUInKegDgK3P+2ywq3z1G/hiZm6SRAdtEBIQaBKb8SfgBL/qTAvU3EE2qyfbSQ+IIU/+0DF7Kw+t5/4ZP3dVuXMatqL5g0aQWX7UbUPImR+VCyfgNlWEMNLfPDm9lILa7rclf7+AvUgDR9iTbrWgtoTbeSt44g4S+gWi+M4i1TULI+gGgEfbY4kF22bJww7x6zDwfrmzbJJmj4DeH1OmFb1G9goms1B1fqK9brNc3iHPudysV1BIjdzKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQDpfExC6os9LMjkrFVdlgnsAq4pRoDWhu+W8V6sLpo=;
 b=nz4w9qz5+NGS3TJ4S5LMM/IZxwTtPSntuZQ3nY1DkgSKBTnGIx2QrPznlaJbi64SSqH7RlyB80qyAOQpjqXrl3u3qqOfk8C+W6HBGXJjCR35QsWD0sX9jNAT+v5vA+LukHhDmVkD/vCpWp5SBlKpFi+5ln9p1pch4FWKqNEGGgMmhE0VJP9WpsManvq3cOqfKAt4JXpnZ2rZ71ZmqMwDcRai4cieCjG8bb5aKd/qtkKV8FVIouz03LcHZJ6Iq7nt4s6M3QA2r9lKi1BIDcg2w7JxB50rnc+osFSznPU3HpnaUiYm+eO5WR5JvWQBSiFjXIDXPjQ3v3DbDTejYOfQSQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS4PR04MB9715.eurprd04.prod.outlook.com (2603:10a6:20b:4f9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 13:44:25 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 13:44:25 +0000
Date: Wed, 28 Oct 2026 21:49:09 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	Peng Fan <peng.fan@nxp.com>, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 1/3] firmware: arm_scmi: imx: Track copied syslog words
Message-ID: <auH9VafGSnYCRlUz@shlinux89>
References: <20261028130502.2999676-1-sudeep.holla@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028130502.2999676-1-sudeep.holla@kernel.org>
X-ClientProxiedBy: SI3PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:295::15) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS4PR04MB9715:EE_
X-MS-Office365-Filtering-Correlation-Id: fa52b999-5e0a-4df0-cae2-08df34f99416
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|19092799006|1800799024|376014|261022105027099003|261021121427099003|261009223027099003|261022075727099003|10067099003|56012099006|261026140227099003|6133799003|3023799007|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	qg7BN7cCDynMA0fBlCFXMIVLuPg/lTeUD2382V4DJMcAmVgoVqLH8NkzKqYodz7SQuWpT5ivkqA+BDJ8RLEuWtgIROahXDLvBNUlkpX8NK7yi8/07wQ8TpSMPz4uibHdbcle0tAUfjN3/maqwtAJKmjU1I8nvyIxjNSZMZhyJe+mYk+0XXDPwn3wY7ehzRUKyF+ylZfca0vXdqAR4I4WZsmRyWPJMKASfoLQSCfxVO309TEBzY39JyJDV1XF73fpAK/l7CsoTLTW/tqWMFgERZhbDJIPa9kQHSE6JElbF/+p7edaOrFETX9IkRbsSLtiKP1GgoPGiMBkqDZouW0TVR0GAaINLUE7lasXwGKwYHgLJ6p+GeBHi746yah4HQFpDZJxsjosNb2vj1KUekPIWQXkE+I2EsHqcfrkrNn0SFbdaX784VW67CEgItg1B5oPJOXPHLBoY2VerohuEtmt3y1/mkLJ1NEbaquAOB1/L2zCEj9HD12jIgh37youpnrY6wzAh/uJ7IHY+TpYXNORu32xs0wdu1w7PAlnLcmg5j+pbCAPlTI9FHR58vkofy5/dGbCWA3g+6LzhITtkYK/3LhiEqZmeDMkKfuLGI9It4E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(19092799006)(1800799024)(376014)(261022105027099003)(261021121427099003)(261009223027099003)(261022075727099003)(10067099003)(56012099006)(261026140227099003)(6133799003)(3023799007)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tb40ES7f5SpA5OsH5Wm9U9Dj8F7MRVpYPTEP40brATCF0Ml+UIoDKNJWjXZE?=
 =?us-ascii?Q?TuGZFrFPdb8RmInSWXD4C7gV7qSJltDPTJ30w/TlHgGaQ9Bb9iQ8vfwPRvzh?=
 =?us-ascii?Q?BAtfpHdTNxsLd3URXZOPw/5QZRRSYpWGvugGnSyYSr9PtjoGq28pbG9sU8YO?=
 =?us-ascii?Q?8QfqOWcb13ufG2lkD0/yZZ3xwxzDq9sG2j0sIG/+yrOmia359iAUaNjJN1lh?=
 =?us-ascii?Q?o8JVVN3ZhIc6m8jY0Ay9vwDF2M7bI5wo1IRt25uAvWZJ9aUFPV8I/YP7wd8P?=
 =?us-ascii?Q?f1gYa3ytZtXvDcF3ZjO9rHXrcN1ZbCvio1/K6MOpQVA4JMtNvebRtcjzw/tD?=
 =?us-ascii?Q?6RPTTxOIgryHqRze1OTsSVvKdj3AwK9q66HbdwTc1qoolKYJuxJHeoQU8P+6?=
 =?us-ascii?Q?ZAOJadoPcoTFSy7BVaT98Dxw1gykfdwWXN8/YVKzfLQ9jCJVg3i792X4Jbta?=
 =?us-ascii?Q?gy5z1gTTseOkBc/fVbLR2IyTS3QQfucDHAIogx9oMULtQm4oRq+035rAf3jv?=
 =?us-ascii?Q?z23h/6M8hT0Yf8OBqG96wysXh8PfiN3df8dUxK7M/mvqELkHYMomWVguo7Sp?=
 =?us-ascii?Q?eNIwGcKC2StglVfs6a0bcD2xVp5DUubMftc/frDj/yGztOeNUpuUbKZY1dKX?=
 =?us-ascii?Q?Hl8YaVSdvO2eemlLwLHl/vKroFRzYzip6pGYCNEqRtsJZh7tKkwmk4jpDjjD?=
 =?us-ascii?Q?s2pyDQUvgax1obQe1fSUbdGr5I5HaZJ9CRV6oex9ZRg4T6lmvR6gUxhMvZ8A?=
 =?us-ascii?Q?jxT/+E5bsCUipGZ/fSJv+ZXov/rO3ik07tm0fKlQ9RjSRRqwtWAbWV9/Vj3W?=
 =?us-ascii?Q?jNACTy2+OKjzXoFDZ8RjTFVWTO7okm8sTO1IWkiak84ZxSr2ipMzoVvLelLu?=
 =?us-ascii?Q?HZyyDz+1IZDKYb0npbxNVmN9gsc4NAiKLLq3uU9CtYLxaMcPamMAL1F+jUYm?=
 =?us-ascii?Q?DFdiL+xXh/eUHF0eqrCcND53imchTUC62DXxIXJ2yEwWusmZNS9x6FY24ZGt?=
 =?us-ascii?Q?HNf7+UvQRKcmvzKe05stpcbsW5GXDgufK3u4jxRoCsi9zp//27mAmAVnnZlK?=
 =?us-ascii?Q?Y/DFMkfR12azzX+tyC3U7ZFEIybDI8imnOZUn0BVaNKNSvYDAtNutAuCs07y?=
 =?us-ascii?Q?lnjqi1/w9bzKGEZEaQellHTG0J+hjjf7DiJM0DxEN0puR3/pOeL8tT3xYmk+?=
 =?us-ascii?Q?M5e68EveLgvDI6wRILpvcFATmXNTNNa5HKCyBAaFFz5jUf8v9RyongJcac69?=
 =?us-ascii?Q?TAUtpD6oQviGqEhNmX6FfQMQbFqhSPCzcGsWdfPEVJ0sgKLeX7nqG9yQg8bc?=
 =?us-ascii?Q?FMK9pyeWplmD2/LtxHtAJN1coi2BCDS8bwe8nQ7RTRaQRAqbOGPxNu4cIPbe?=
 =?us-ascii?Q?B02oK2vkIAEwrzff8gBDcerCOW+06MYKOJ67BIbXBgAcJrjoPTbfwT/9sAyX?=
 =?us-ascii?Q?wb8uD+s8CXzPBJP04FJXQiL8Nyd7Gxsd0BNfgiqwonnY/1bECRECtrH5vZmp?=
 =?us-ascii?Q?oa8XNlAGLG4sD+ut91+MyqifZDrXdJocVMPPflCNBQ70aZmaRHirRMHXld1n?=
 =?us-ascii?Q?gXplENwfpzh56PFKHfJ/E644GoIMWWPQIMTYxpVibSJuA1HNEXEt9bkNRo8v?=
 =?us-ascii?Q?InlqHZmyu2YVwoi9fAGLMvM9YunLen9X7IUeHePcxsPQEyY7xznpKpWRWfXK?=
 =?us-ascii?Q?d5crt+ueg2b72Qy9Gi6DQ0VHdDvfJsAjtQYDcYvLxwAy0JhZSdGYBfAny2ru?=
 =?us-ascii?Q?QOmFXJZEFyZ8koJw0s3SRPaFG1VqPT+W+YJfE6WX8Qga9KqC4icL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa52b999-5e0a-4df0-cae2-08df34f99416
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 13:44:25.3512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lOZApV9ZX9xCdg7/1pMXo13nf94QOi24SI64GnVs66EgN+Fypqso6sw/jecLmXknnTzlbaxL04uGGFVdMaF4F7/sbFu6C0O5drTXZN+/u6Xb6hKo3t2c/Ya3n788YcO9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9715

On Wed, Oct 28, 2026 at 01:05:00PM +0000, Sudeep Holla wrote:
>The MISC syslog iterator records the number of returned words plus
>firmware-reported remaining words in the caller's size output.
>
>The debugfs consumer uses that value to dump its fixed-size buffer. A
>malformed or inconsistent response can therefore make it read beyond
>the copied data and allocation.
>
>Return the accumulated number of words copied into the caller's buffer
>instead. The generic iterator bounds this count to the initial buffer
>capacity before processing each response.
>
>Reported-by: Sashiko <sashiko-bot@kernel.org>
>Closes: https://sashiko.dev/#/bug/linux-c3c9437c-ba1a-4db6-837f-cb0950d89018

This should be: https://sashiko.dev/#/bug/linux-67e325a9-473e-450a-a2a0-bf4c0c720624

>Fixes: 4fa62e80c7db ("firmware: arm_scmi: imx: Support getting syslog of MISC protocol")
>Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
