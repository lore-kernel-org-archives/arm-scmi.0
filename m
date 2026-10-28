Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793195195;
	b=SJsZ2lu22AGVO4ACnEwjBfg7QVTKIUIxdcFiK00uljxf2r8IdUokVWCFDAgCuoAjAyWq
	 qH5sHdVP3udTvR9g3PwF5mkksTsYTiH4wQavqWXvK94+5AhG5SBY3UjHZD9q40UJPdl6r
	 9IeIrW0+brfTRh14bBMHF3vsa18bf/2KAnJXuyk2Bu7KNVtLqPkBytzr4TWbD0EK/tvUU
	 wNsjzvh91bD2vvtQOPn2TXlm/mmMNoW2La9/GQswTQDV0FAXAAmvjR2RwcMbR1wNX4tSv
	 5xlneJLwB5D+bTyL3/hJVAq8d6AgQ7ECZgBJ2t/exV82u81NwIuCjKrcDQJbeV0BIAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195195;
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
	bh=eKBUi7RFaOg2hHsjyvlmBRlIYgf8lZjCgwFgF7q0rDc=;
	b=O0E9VhmXsgrGpBoEK14UwfHdCH8XDfAN3CfpiZEFL/RyyrEN8pNruhE6HyGxOQ/IxYVU
	 hd42RtKccXjTVEZ6CrZgBwcq7HmWmEyMUVR6CLnVPQeDdtRvV44P11J8s/8bDK3hjyX2t
	 GO8KPMUux7e7WUphhwkqESs0mOUiWzdyVp4K2bFy4uFJ683iQ3XwmCewIkFaj48PwtlMV
	 an8bXoiHaFA7aDUYDbKiTC1zKpem+8RMhkuJ/D/hSqswejFA+HGy7teeqONChhq4jxWKz
	 ASeI3Q/9U7h+mcYjOAUQueuF947juSOjZVU/VkLTxYrjPgb/xnULHe5K14k2WVHUmBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=O0BBsZIO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.70
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011070.outbound.protection.outlook.com [52.101.70.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC96606A31D
	for <arm-scmi@vger.kernel.org>; Wed, 28 Oct 2026 13:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACC96606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=O0BBsZIO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nYugVd8N6+bXS9rNzExMMKvHk2V2Zp6dk8dMn79ClM53zm9fg5G0hgs2Zq+CHOnvWDriBjun6OYnJgHf3UI7PyqcEfyQh7qFyA8GRRo6Lav0JyLqr0nGR+8VR6V5x/K2Y0bpkIaY+QhnUYzPUY2H3iy4jLm5cYYGdSW/TkcoI0Vza5RZHYOVi7blEloFBT/UHz4foFJvmeqTPZiDG60vwQFsQMxHMJyj1CELTC6vkZxfFt6NGwnWex77ob5CDZ4qiFUWmRssnE+S8OAm27MMyTwRPQwfeMAZ0ZO6wdHiIKzhwEJiOXhwSmPbmzwWHwd9utlBD9o/o273DRSLS5KFtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKBUi7RFaOg2hHsjyvlmBRlIYgf8lZjCgwFgF7q0rDc=;
 b=PJ9TgSUZD7kBEj+1mXcWhwLxp+0VSNxm4Y0kutOYBWuarhq4T7LXtegqe8FIQKgFVIIevpHleS6uZKGZ9k+KlxKgtjD7JRRqnmV59zBrPH86YnCi7x5tFgssYQ5tYGGhggQrpcQcPQRMH1SEomV5X9yKEpjpHLaS5cdCwVBF6vk+L6hUo1d2WESUbIy9AhymSfRVTA19EN1DtvsUsygcxJOSKYUtXhaDC4imZMWRplIcAGxtgo7MyWYQveMeBAZHmerq2Bc/nldzvpBDbeKzt7jsWXrCaKgY60OhXXieehB42BJOAPHz36+inJNLT6TbVA9QON2DlnQ4/+RAezevOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKBUi7RFaOg2hHsjyvlmBRlIYgf8lZjCgwFgF7q0rDc=;
 b=O0BBsZIOvNjnkyd+qBSOznZXTRr1aALy+wyGJ7uFsPwfdaiwmmN0Qogk78vOKnX7UW+RBwduWElB6d73oZcQzPwejfRPDzWg9GEhSVdjSwLG/33YSF6MG8lWEV5uuwok64JJUmIGOoic8zXP/3Ge5MR0ALx7tB+OMLf1PbyYYl5FOQvXK15zbdiIiJmgKOKHBe/vZpfCOAkvaChBI0AKhbb/2gSY/OYKCECOSlCOqa5VvMeBxt18F+WvRr3Xws4TtcAHEy4juj0LxO+JiDYk8hZsMPCYnNE9gAL6dEASZ7qbCfxRNA8VY8U1G0T8XuohVbbzk23PN3YOk2E2rrGBiw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by BR0PR04MB218214.eurprd04.prod.outlook.com (2603:10a6:2c8:2c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 13:46:31 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 13:46:31 +0000
Date: Wed, 28 Oct 2026 21:51:17 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	Peng Fan <peng.fan@nxp.com>, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 3/3] firmware: arm_scmi: Unregister notifier on enable
 failure
Message-ID: <auH91R48Tg9Uxgyi@shlinux89>
References: <20261028130502.2999676-1-sudeep.holla@kernel.org>
 <20261028130502.2999676-2-sudeep.holla@kernel.org>
 <20261028130502.2999676-3-sudeep.holla@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028130502.2999676-3-sudeep.holla@kernel.org>
X-ClientProxiedBy: SI2PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:4:195::17) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|BR0PR04MB218214:EE_
X-MS-Office365-Filtering-Correlation-Id: cba6674b-5cc5-4460-4492-08df34f9dfa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|19092799006|4143699003|11063799006|56012099006|261022105027099003|261009223027099003|261026140227099003|261021123027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NEFpTDuZtpHieu82BFn9ZWP9QH8rSQf8HxrfODS/XBrYXX04ubpU/5WZ/UDXKZkQ/8/opPXT9WAGZHcVD4Qm97TzPUljxoMtdVjPTByCxzGATcg0ZXufDR0orAVsctpcuvzYgxcrsGpiI5+YRxgNjvq0L954xcrIqhyu3e6zXMqwq8XW4vR7RDDZA7FVRfGvQMl4M8rgt3pI+y/RZd1P92I6Ui9pCX6YprpQde5QiQ6DBkn0TiJ5IuRMWePBfeU72KyMcdedp4pI52EqJd80cxTNH8ZvbKDCJw2Vk3XdJ3xY6TfffNH0UK/jzUMDmAk4s/csWD1f0TwzhC1k+S97nU4HE18b6VJWwB7AmjTdgvI8nPMbTHFp6HyQzY1+sY80PWp5wOSvAkx6nJ6AJoP9910kjFhsnMVvyCYjdtOmhTSvG2b3bL5mLP8QAln6bWc7Y87h3eoBQ1x8cTJyUEADv3v/UBIJDn8bW2tIC9foMFr7xbSM3U37UEBb5sNWeN/nmXi7aaZHRsJeZRFueWWTF+dSjnIc3wfP4bosZIzOABEIUcG0I8m90geuGZ1FNZD7Xn1WM/ORIMk7eRZl15ncVo1GZAz0l3uHJIT6RycsDPk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(19092799006)(4143699003)(11063799006)(56012099006)(261022105027099003)(261009223027099003)(261026140227099003)(261021123027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mqXWDqEHqkswOyOyRujnmqYLHU8/0NLeIHlfuLqDhgDzbJrAgPUqQtEkwnJY?=
 =?us-ascii?Q?DlCT11gQofLgUbE6RZGBxo4q/vqlIvcKZ8YjPUnGEx9BEp34IkfO8Blyv49U?=
 =?us-ascii?Q?5VSnum4ZJ+Vs15QYeCzcpHBM3PBXhgc7kZjc8Sz46SQCjJkC1uB4mfuKN1KH?=
 =?us-ascii?Q?+Qv3eH9u8WfsweQVZGBipmwmbtvg2rtfXlcXfdY+8lgFnuXQSSEMKIxG6LnY?=
 =?us-ascii?Q?b8GF+YzE04Xcq05XgFfdi5XTWNhEm5wKlhXAyXtwHsyYYlwizDTfw32VvLj3?=
 =?us-ascii?Q?PFCfE+p6Sxf8ReAub+PkmjQ8+BkGraniF7f3trvXqy/kVUe+VwrtKnkT3yAp?=
 =?us-ascii?Q?lSWYPHOqtjj5upsRww2X+MTuh2cKHQejXxLDObrm6mMSdGUHgGHnlgBkcAYX?=
 =?us-ascii?Q?O5f0ED0kspkIBB4UE+3JasGqsfc+qyQCVlSCN8uAwEiigrVQ18Cb4l9suFpY?=
 =?us-ascii?Q?PYTsxiYehcY0roDpp0NwE5mjb1oMnTc0IcPMUWnOQstoYcd+bivFK43iwAzF?=
 =?us-ascii?Q?qRb5kyIVSQYaGjRjRgwVlnT4Vbvk4LHXONJKqbA/NgHd0fZAocV6gF+o9c5Q?=
 =?us-ascii?Q?97IRbFvdPIB8WrypjRUqB1Fbp55/MEmxCkSX1HzgpNuouetQzRbfUeAEJ28A?=
 =?us-ascii?Q?p1YDuVvsRXEzgvLU36IAOz9VqIBiahQgii2NtxgeFDjB1JyttDp/hEE0x1pR?=
 =?us-ascii?Q?h8FSjoBeqz7pNBJqPWnBIBsXT4p6rgZGwO4ps1AMDZgoXBQ2nBmH48JoSA20?=
 =?us-ascii?Q?gZNKBOBcUaSgHDnK7+MBaTAL4hGJvbwQ0sLXN7zsOHh6Gxgpeid5wzcCxOfq?=
 =?us-ascii?Q?aRgm0uiMfx1+CE3B3Epb0SG+CX5hr+NimEUTmtw6TMVPjknhh3lD6t84wJhu?=
 =?us-ascii?Q?Qc8baHT++FYAJWO+mhhwL/zojYP6n/WUFtjVYITtmoKKRILyoS6YOh2kw31b?=
 =?us-ascii?Q?2ZKpRRlXbXnOKoS8kOuksy2FlwcKuuMY2+NQokgotIlCTY+MD4FgN+cEKECa?=
 =?us-ascii?Q?W1D6JjRvoeHretBqhibzd4C6qr3g5rGyREV6NpbZgvr1tFeOLojmzHCzSzzN?=
 =?us-ascii?Q?UPbPRqArjDIqKw0s38PDbQlfQVJe0UD8cpCH+1IBxNi6Jy/uoMshVXy34EJk?=
 =?us-ascii?Q?a2LBC0z4Da11qnamS8c91HyqzxzOkApqo/1waTDctpfiZE1o1rL2Ge0vgjbB?=
 =?us-ascii?Q?EF2KCZ1QVqDx7Z78w8LiXo4jN6rqSTXnY7HLwjIQ5ZsGXE4of5rVTo9RJh7x?=
 =?us-ascii?Q?5rSiIN9A/gNuPJ6fVJV1ysUwMcG7vKqRaPvjkCYijNIzqyAbS4uO8Fi/2z/0?=
 =?us-ascii?Q?cY14M87eaHx0bPx6Ky0hFKxJLPuj9B2xaHNKai1IbzHN1i1y9UBg2chElnzE?=
 =?us-ascii?Q?rxzPGindcvssw820S/hWMBlB3wDgNNo3hlvI6XPVZ3Dh3PaRTJtQsSS7c7Ep?=
 =?us-ascii?Q?G0AcKcFtrVJ//41B+bNKx3iZwzz4N/HxBlsvJmxUmq9IPSuJAu3fXSixz2lX?=
 =?us-ascii?Q?wLeG6u3yBdYeGEDj0edqgzARMUh+Iem/QgFAoWPpdgAJi7TtIb3pcbFFqhzP?=
 =?us-ascii?Q?OUFJhw8+XhtTrnso37I7ywKBMQLt/zNMNU0OHUzcYmdOHKHNsz3LXdTAfWmf?=
 =?us-ascii?Q?+gcpRgvyztPTvk/iG+YUq1ABAbn4NK+hAVyRUjVeDq2bXnGd77G+WJcrmrmm?=
 =?us-ascii?Q?0/ZLEMfUeKf+RRnh/tYW/XTgjQdXtDQBSOH35XbMXMRQTVpYjHy2XAvDRMh4?=
 =?us-ascii?Q?HqeQMU1Sk3wgJ11Q3rrDAAEjN7m3CQxF0DvXYv49YU8Y6nDYzof/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cba6674b-5cc5-4460-4492-08df34f9dfa2
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 13:46:31.5408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dTbY/xxZ/FV64G6txblnSKFEsQhJrdkABDUGpJV5sg9tORyFbw6c66SnUA+mrWh8UCud5OlMnF/aChzGm3S2TYHY6VRPBQ7oboFTVWPgiv8Vi6DuFnzhyJHKM4G/iy28
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB218214

On Wed, Oct 28, 2026 at 01:05:02PM +0000, Sudeep Holla wrote:
>scmi_notifier_register() adds the caller's notifier block before
>enabling the corresponding event at the platform.
>
>If enablement fails, the caller receives an error and can free its
>notifier block. A concurrent registration can retain and later enable
>the handler, leaving the failed caller's block in its notification
>chain. Event delivery can then dereference the freed block.
>
>Remove the notifier block before dropping the handler reference when
>event enablement fails.
>
>Reported-by: Sashiko <sashiko-bot@kernel.org>
>Closes: https://sashiko.dev/#/bug/linux-c3c9437c-ba1a-4db6-837f-cb0950d89018
>Fixes: e7c215f358a3 ("firmware: arm_scmi: Add notification callbacks-registration")
>Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
