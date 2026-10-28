Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793195117;
	b=qkA2qcg6aLhK2tgieSSKeVruS9QmMGpjgCuGq4hkLJaJNC+S9oX6z5btZvvHnj03Mnvl
	 l1JMfP0x/zNItABY/qI+E9F7qUnygnfA3AvBnxP29vL6FRfF+w1A5MLM4OvlIKhmUwjD7
	 wpSfeOsKxC5zStsEff8llyg5tHdw/Ach1zchXYEeTKrIXTgv+1y1IluHhEGx/3GcXfC8F
	 37NAH0dTlwrf3CeYfa7W31I4CmhXcsd7nznj414zQkM0x5GrGwonRgJ0Aeg3WIbo9b6jx
	 q6npzwEAZPWH3xP4V4UrEg7SwXEoZs3l+/LxSn1wbjtKwgjEzoJD3xCYse2b3ESPxag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195117;
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
	bh=lNe9VIz1JB0ALvrfs6JfodtIkYHiLpzytttO48Majpc=;
	b=JqRlIe4uuyf3G295+9QYDkkAshsnbB5WA1U2xTQFU8Bgib+iCJXvwJErNXnqgzIGADor
	 Eo13aj3x44ENyn2sts8P1gSM9M1R19ULpSQZR9EPIkGWufrUAYjx4Qnc8h1TCM/rfMpOs
	 ZOikQOxwj4MrEsFj8ZEo8z04Qd7EjHenlQj7RH6nxJViMGOQchFFTuvLb/AzaiuAdV2Nc
	 XJz9wUHUBQv3hA3XwKreVHYPZfobC/ILFOX7/pMKJjN0tgx+UUThwdUdGUMvqlrrE+6pw
	 Owq5hvZEpImdeTvirBQXnqANdbLBiK9xzTg8P/qvZ0v5+qZYRYHkGVoA7ClUFD3MSJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=dLaONNId;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.17
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010017.outbound.protection.outlook.com [52.101.84.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35439606A31D
	for <arm-scmi@vger.kernel.org>; Wed, 28 Oct 2026 13:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35439606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=dLaONNId
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hw96dXQapwsOOf2sQcbtq5iKmQMhGUglAuL6S4Tg/lTitmQN/lcubZzqjBWhl6tDnvc7V/kL/Jt8+OhWnpBqdqg2UEyKo1OpMQbjJ1F7dW/WEBAdBTOE8btzRBC7/I2YyvTK4nX3huR3W8cMTkuEHpp3PSNF33MhS/XGafsSCQEgP81D3A6Biwlo/s01IKz1X+42Yy61nC0/mRD1w7aaJB0H1ZHcOcmp0iC1HyQXyO8f4SaPqIDKiJDRenpgex2jRq6v1jRToLwq3F5H8p9ndvAuDnbjbAdtuJK8pRty3kpq0dk0tYAsCuzIkfArsmV9sgMGfMPWnoYBzQK1eQ3j8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNe9VIz1JB0ALvrfs6JfodtIkYHiLpzytttO48Majpc=;
 b=tUB00+fQVe9tO3Qllb+V7GstzoE5GXmIuBvKpqidBVTfW+A2OOc81dIwH1gJ0CZiFVw5wzVzBpD+DzcCExZ8Xp5Rrj8PQPkNpNWGE/X1IwMulADqZTcScj+w7lX724G/6I3a0EP5JofvQ1RTuNuCn0d4/p/Fa6bRlfNfoLqXWwZRNjPCBpEdTSMYQWOuY3DRZ6Ss1ES4dLnVd5QHsA4Rdp+qRq+kEIoF9wQfCcXf6WB08gHlDd6kIoey3hqWXyVErYodl7iw3z3gt1chJc1qZjSL1dB3wo6Imdg/mVz64hjtoz4J8wgVqamYWNqfZh12DFyh09ITcVjpxhmQxJ6jpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNe9VIz1JB0ALvrfs6JfodtIkYHiLpzytttO48Majpc=;
 b=dLaONNIdiQ25add9HaGu0pB8XIx9DvjeHYRfEo4D9afDo8UPE/kzsDBPyqfb19rnmkRFNTP/T360jbUlugXC3P8dKLPhF1ycHyKrHfQmjiYzEH9iiMz7xtPT2UGzJirZLyqs5LCu+3pHAquAN3b3eY1vGo3GHJE3+esyqWhhjnc6vET6F3TzgbvojREkUnWKi6L60VhJzbSazmSd36JgQioNcyfjn14WDPZw/Nv9YL5pkpCMWeveUBQP30ED/Am2XOHq6FUQPGV/fmkJsqdZBtEd5yOebCqj2Rm7dd9gFE6dl4UPdhUsv/Hh4ZLf/FfSQbxQkgD7SEElwMpfT4y5CQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GVXPR04MB9759.eurprd04.prod.outlook.com (2603:10a6:150:111::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.27; Wed, 28 Oct
 2026 13:45:14 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 13:45:13 +0000
Date: Wed, 28 Oct 2026 21:49:58 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	Peng Fan <peng.fan@nxp.com>, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 2/3] firmware: arm_scmi: imx: Validate MISC control
 response size
Message-ID: <auH9hoZhsBqeTHym@shlinux89>
References: <20261028130502.2999676-1-sudeep.holla@kernel.org>
 <20261028130502.2999676-2-sudeep.holla@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028130502.2999676-2-sudeep.holla@kernel.org>
X-ClientProxiedBy: SI2PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:196::14) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GVXPR04MB9759:EE_
X-MS-Office365-Filtering-Correlation-Id: 738d4f68-14e8-4fd1-d604-08df34f9b158
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|19092799006|11063799006|261026140227099003|56012099006|4143699003|3023799007|22082099003|261026121527099003|261009223027099003|10067099003|18002099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	coXjut4tlFPfRJlcjg3fRhjL/vhlaa2SsBmUnBeTewcF2knBe/fRQuzivlvsXchJNlZqUguhsO37D3iom1WovFUI/s+agRGlj2Gn3zjCq/TBrM2L8W6RiZijKz3m3ucPz2k1y9bg4bhLj1YH1WmdWd7InAFHjzsSzAPabFppzpu33ABsTuCmo65eCv6eBp6E1+SquQYhS7y5PfeOVqudqgkCB6SV3yzn2U6ET3dzbCVddd+lxW6zCtz+Izl/DHLYFEgm31T1FPG4SkAeP8ouvEUXs4fjyKmUaqzZ267ikBsFkCV22IKZq47RtzwjJiVCP5jQ+obwyprYGJVot8ih/griuRWqiYxUrwcmERtN+amQ2lurM5nwAAgRxAxGvl1dnHNzQndFSIxF1TXbtbvbahiv7Xv9nkM7g16V0qMj5cjciR41KQOJuB5/Tdhrd7ZNpJ4cEZhcPa7OMIbtOJiailEgDwmJYTSAH11RB6w3WmT+d6qSFw/tcuP1F4gUbj8m9ZtDyTBNokZJri8xRTPwJ/GosiyDEkehK9irRvQ7oHpvT8IzQnelDIv9vOIoSfD8bALSHCxsPMwstTJXta2brKbeAposGk6tOQWwgP+TGJo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(19092799006)(11063799006)(261026140227099003)(56012099006)(4143699003)(3023799007)(22082099003)(261026121527099003)(261009223027099003)(10067099003)(18002099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pR5s2X7xT5MhcKADUiS4y0NP73ORtHeLmk4QMN4rYjkDjyc6KtrO/seVMOS4?=
 =?us-ascii?Q?7zbvrf++6YYIx3WpdmD1E53ug9YLWJk4xR3rLdMV9ZWShTxbMTw9yjLHqXBa?=
 =?us-ascii?Q?QzDSm+Dzd5/Zk9pjZNcKL7D1YqF8F8CvRPXkNR9yT1cHLypiFm8TciVjHtbR?=
 =?us-ascii?Q?kX/j6/s8WgrQKUWjT9Pn9r2YONvGhOEXRlxWGdosM2rDZXIdr9Zb3moILUfq?=
 =?us-ascii?Q?+DnG+0CF7PztMsk/DFeR3Fmh2sU2zuIkHfsPyOcOFJETqtQDD9mRv2dmjEUi?=
 =?us-ascii?Q?gLIJX93M1wPg8KPSxS0XDm3DWhthvIAl92ZxqJItcfJQWcvnM2bSeAg0WCXF?=
 =?us-ascii?Q?RgJrjtssXMFtDfw1LN124EEpPk2W0igeRTnhtZSmf03S+Azv3LlsMFm6Dvap?=
 =?us-ascii?Q?n7JUiJSDVfNs8fssAAbuM0fwa6akhLTr6Ym3i0pm+nypaKIWX0yuteggmAai?=
 =?us-ascii?Q?kP/ENSwYK1p4sWgF4oVrp2IRkaHjp03ZlnGT0HonHuhJt4s/asLIM6cDioui?=
 =?us-ascii?Q?1T+wt5+fEMOfBxnefymMNI3i3yDrIwNH861ZWK0gr5p45cpHQHDrw4fGx654?=
 =?us-ascii?Q?+mby/JGR4sn6x+Yq+nC7LqUCCDZ4oWxl3NRXuYsI4t/I5O1oLKGFwuYVnFrS?=
 =?us-ascii?Q?5OHvY4E2fy7pAZ+gV/WYIcKdKwHmP7AMBp7tvfeEB9/QoxOqr81DfqJFHuUv?=
 =?us-ascii?Q?D4BJDlXfKmYd+rI6JzRYloWqWyHcfIOkpJ9b6h7/HQ1SqPXYZ2JiQIk/EIr4?=
 =?us-ascii?Q?XaJATNVqTvu3zLv+tQVsEkwlBs7yaJQSGhAF66T1JhMdJEz6DrDIum0KoVBn?=
 =?us-ascii?Q?1MtKKPk4CO+4PuYdhY+blGjU0D4bazJMsIzgitmg0brXWrHtuXKRhY2kA+x7?=
 =?us-ascii?Q?AcbZqegxwZd/roFz7T2xMCynGBz0UpvlLjm42LhaCe7uiqtoQpLL87fM6AnE?=
 =?us-ascii?Q?+eD1qXeaOPTNC+KiRUmpS9dWD5S2DzlUVGJdzR+TtrECOhLQfYrl+m3RRh43?=
 =?us-ascii?Q?SOrG84lRkjx2CYsLPbw0tZQ/VhraKWBmA+fOJ681IVgqN0tYLeM7PTZ5IGD5?=
 =?us-ascii?Q?pCVUbdV8040WmKbXVEJtc9ytvtPUdFFKRjQaikrn2oVklBsP23rVWq/FJ4OU?=
 =?us-ascii?Q?X0Mwh3TDcqlH/I7A30WQCYp7iWvuotVbwE4xYE/VO7E3XJ+Zxo+ScVNvzlMj?=
 =?us-ascii?Q?qGdGaXM8mD+Q0hsYdy8e5miKrEL6IbC/8sZuA5q9UgvdGwej/1eLcqR0P6VY?=
 =?us-ascii?Q?4fpZvwJQPC+6wSvQtciioLsGbLz4y6POH4O7kyZOqlO65VlpjrnT+9wo5K2J?=
 =?us-ascii?Q?D6fKz5/TL0JD89/Chg7mbjmWxHTRvhyU/Bb8Vc3ONCcXFulUZii9i6JTav0b?=
 =?us-ascii?Q?ttfmHGdjIsxx8VWeL5DTJO1BwOd4Bv38DxXVTv5Le0I3W8ojW0sQ0GTDdHpg?=
 =?us-ascii?Q?2bajJYNAgkW1elktyOQC3mdY3+iJS102KjoeYFYVhy+or0+mLct+ccGr9QMN?=
 =?us-ascii?Q?DOnolLIFBc/eam7w9FdAFDvN3cHSCRur3a+rlJoUvcuCiEyUEzWymx+u07Hf?=
 =?us-ascii?Q?wfdV3To0uteVRyq+J41BUYmaMcxN4QL9QaH0kVConWlTWoknDtjs2OACRjEZ?=
 =?us-ascii?Q?G5M6jI5rFXdy5OGp7j5ArBCkXgoxJzEThNNuYLEMT9eyt2KcAz/LafHKtwxg?=
 =?us-ascii?Q?Lyd9HsIDQeTw264OmprSAIu/incxW5g6XPyKFksXEllz4t6HkqQsxUliPzdB?=
 =?us-ascii?Q?PHLPfbVgnFkPiiEO6thE+rMmrPFoVw7U+oOV85kvWx5vee6KgKL3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 738d4f68-14e8-4fd1-d604-08df34f9b158
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 13:45:13.9144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cDIjQnFyk+Y31elXSq3Ta2kLFGTTqybG8Ks1SHGdhDSnUPsCunhMsGPYYJ5h9yo6eFx7LlMKGUmRgIxrL+dwtvOtMK53sMziB8mY2vy2mj3IXfi5xI1hZHMBvhM3XJSA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9759

On Wed, Oct 28, 2026 at 01:05:01PM +0000, Sudeep Holla wrote:
>scmi_imx_misc_ctrl_get() uses @num to report the number of
>values returned by firmware, but it did not retain the caller's value
>as the capacity of @val.
>
>A response with more values than the caller allocated was copied into
>@val unchecked. For example, the MQS regmap callback supplies storage
>for one value. Retain the input capacity and reject responses exceeding
>it before copying, then update @num only after a successful copy.
>
>Document the in/out @num contract of the exported helper.
>
>Reported-by: Sashiko <sashiko-bot@kernel.org>
>Closes: https://sashiko.dev/#/bug/linux-6897b44a-57fb-4964-95f8-447d0ce526e4
>Fixes: 61c9f03e22fc ("firmware: arm_scmi: Add initial support for i.MX MISC protocol")
>Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
