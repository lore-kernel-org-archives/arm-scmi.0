Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011007.outbound.protection.outlook.com [52.101.70.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F9F33C18E;
	Thu,  5 Mar 2026 10:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772705829; cv=fail; b=j3vH5+1oemC0oxEIyg9HeyXbJdOITT0BUXMGY4rPsJhWefcrDsPxQm/t6NeTLFMaxAZKXLynX6yAXvSX3GEaWsAjCk/MUi7BueuKmJEP78l0PMXShSjycUfSKJNnUT7cxp8liLfr0rKgI5GgWfwpFojGrX4/liIONjF1sTUnkOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772705829; c=relaxed/simple;
	bh=XK13qvtyTq+eqUMkdtK5uawI2EUHOIhObPdposT1k40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fWGV4T8W8EeEWeETHVX/ctGcVS7y21rELdDGul8+eOE8apsNpUhJLwIBrxDQ9xBjzZw/bckNHMdWFR89s22L+0rSKKzxIbXM1HQ6fTIUOZ23Wx4jK9vLWMdGwMQTsKGB5cxv63uBRYf/7ysxJePosoBaBXKZIHX6WgBhqfuGV2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mjXvQiFN; arc=fail smtp.client-ip=52.101.70.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mjXvQiFN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wU5TaUy6RyZudYJ5GIPIi8dG6Rw1XFJMIc/dWAdKrdSPKP3hR1R/y7UwMAlsRldPIzZaD1333s7BDatyjHf/K4nxfb/FKjBoYdHX+NOD6aQIVdCe83sbGrN9qrHDeqHnocw18/rWpHHGZclhZ3yNSCZv5S+tM/AT0C3LEhltJIk32B86om63ykNH1B/klkl+VJfWxW2aKpIwe+89KdN3o14IzijBpz/wfR5wOwhIKwm1x6irGmv9aZY5q4oHANGZA1R39cqlKl8nEEiwNtObTP+lbzkKhU2Kx8dr5yUIII6KNYsN3layAnNlwvrbkllfgdaV7KlaYlHy1mbYf5pZkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+1hxziyBDZKX8rnKEDu9pfYqT7qAvp0u0hnPl8L3aIc=;
 b=GQ3SmrJW13Grrz3U5i1uw1wlkQegu0V6XxL6gJKxQqQXGVKJ6KevqW9R1Ps3GaM/b5Sb3uYJLjzAcPkQmnkOrqhHgAM4iC8JVvfSyg5I+u+GSTenM2SJLX/dETuiGSvXDkwkmSMjVsupBFMQp8RjgpPw0yPHOPVLneLbx9STN5NieLl5Qfy3xtuE2Cf24Qx0u8Zwrt3ajO7yuE4x7YScxqR0D4HtGyv+4mRlatBSLygHQ+41SWBuYkjwOgAGBi8h3RVbPGvcgJTO3z5ON6AgZEgrca5DRATMZ74P8QVQV+tgQjdza9vIlsFEwExdPhGYGgLeLXtVS8l/QBzDex0sRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+1hxziyBDZKX8rnKEDu9pfYqT7qAvp0u0hnPl8L3aIc=;
 b=mjXvQiFNO4Pa8gKlL8D4glNe/YadlCu0J6nINeiGMkuduU5wnLdYrusJBtJVHKrJFlBeCBBMQ5B4amZupZLoUbTQKVBS/XnCtg+qUCO6pHWd3j3NjmvormFb8sM6l+0jVP8o/mmRKj6ps3J14AAjWP4i2LBUfvIROkarPaz+yC13DDLgVznJrnpuVlTBzomvXqpqfIfm7CLqoYb8mug8biaA41a1z0mGLh9zPZWXd0PBLRYgLU+2toMJAlGgP45Z98u5fKt9yBSGJTce1UvJHmzxLcL+qQ0mVhq/HidsvwUPxllGDSz521QkzbQFfKiKy69KxPuCEg9EfnTNjQphvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM0PR04MB11877.eurprd04.prod.outlook.com (2603:10a6:20b:6fc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 10:17:04 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 10:17:03 +0000
Date: Thu, 5 Mar 2026 18:18:56 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/2] firmware: arm_scmi: imx: Support getting reset
 reason of MISC protocol
Message-ID: <aalYkDpKS/W3p3m2@shlinux89>
References: <20260305-scmi-imx-reset-v1-0-18de78978ba9@nxp.com>
 <20260305-scmi-imx-reset-v1-1-18de78978ba9@nxp.com>
 <CAEnQRZC4w3qNOJgth=8N-Ri3wFeKc-=VnQXWzr4WR0j6yt7WMQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEnQRZC4w3qNOJgth=8N-Ri3wFeKc-=VnQXWzr4WR0j6yt7WMQ@mail.gmail.com>
X-ClientProxiedBy: SI2P153CA0032.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::23) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM0PR04MB11877:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e18c078-aa94-44ce-2b16-08de7aa0582c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	TiN+otmcg+f5r5Vgnsofdn1p81+d6FjIWg1HGmS5qcskLMr7l7Of7O3PXa9JoqWAPnV4ggFdFXQN37LdIfXvAu8XF3dH0XG/NkD09wjMTdCmj02yySoXparkQRlhr1yJaYN4nsbWXHJuOHRntP7AyRnf/Q+ySgQRaGXmrtroFCGNnjHJ1kwmtUO/+3SROI3Lb/nX42V60iwsBjUhqpBV8n/hkTFhQrBRx4Q3r4QyWJZoamTaz0hnN3YvpxBdvplKAPbN3DrtXR3CkvUjkZZpFuVig6hDyo0+WWauaCxWFnOzcQIXRM1RMoGrsknEpp+YzwjyK4Wp2abg70hPrguYvMFICkUwUyIhXOugkzPVUxH83sCyF1fReRXSsX6fw/p5BYscHoARXFY2Kt0w2egykzUDMM1GoSGArffI5MzfK42nnKFtrcJrNFzSBHfjqeLCshR5TO+bEuUB5CTAOVqYU2Sy+T43vyhi1ahIGQGikrrPDrv5Ee2nsf4Yldy7pwSkOpxBnX3zNWGgA9hFNJdhNJFHUiAlcUQLh1qPVs9Ns2YQ8oFiSig4xMtN9LLcR8JI/8ctHVyr8tbOiRA69VcjtTq0BDxDfQCikYHPhq3RHuajqYNG6zh7Z7ePZFc8TXY4iVgUD/lWBQfAGPT90AxjhTh6jGQepe5S91tQD40LYp0ULGs9zCf6B7ULCYOwAiMRDxRqZng+qbi4RO8kDAnE0C3QR7L95DEBTpnHFoxqfsBa9Yan3KnF6p/xhr8ZNd0wRHuGLDrhzbOetLjM7MPsAUHesxTg/rBomu1FvU8xw0k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REM0NDk5c2pGV0hEbWpxOEhUOFFpL01HbjVkcFpQcFRzTmcrVkd4Y2ZZZWJK?=
 =?utf-8?B?eHZPS2RoeDlXNnMyY0FaRFlqc0N3TXdPMVE1aytFcUhiRUxHL0NjZlNhSWhr?=
 =?utf-8?B?TUkzOTRIaCtKQzBQK2dxbnRmVGxaR1g3MWJZaVB1K1pBZ2FORzJlZVQzYStm?=
 =?utf-8?B?YzdoMXBJTnRJeXdDdTdtZUlZS3BGRTNBc29uWXBlYUY0eTVqMEx4NktKMXly?=
 =?utf-8?B?RnZBc1RubFd6aWVIL3dodUMxbE5iMDdVby9NQ1BQVHRKK2tzQS9NYlMydHRZ?=
 =?utf-8?B?bTFYdlVQOStmZ0YrMTQ5Y2d5OEIxd3M3KzlheTk4aGN3WW95MFkvcWtvSXRi?=
 =?utf-8?B?Kzdla21IdU9yZmFuYXgzU254SWwyZ3RlS0xEOUF1YVc1TDNjc0lUeUdYc1lh?=
 =?utf-8?B?NDRsYmx1cmdlcStlL1l2cEV6MDlFK2hWa0VpNndDL0dTNDI4MW9ZM3lOWm0w?=
 =?utf-8?B?bEF5R2psY1lXTGdBTHZ0UTJVNGtmMjhKS3lyeHpGOEFNdEQ2WkxjUDcvRGRz?=
 =?utf-8?B?T3ZHYUxZTVprdjIrN2FoZTI2Q0NlWGtOUUpXZi9ibGEyQUE2dkR3anJnTFEv?=
 =?utf-8?B?L2VzZGdKUm9xTEtBL1pnajdUUDBzMitGS3hRWlFhVFp1UFdXWGVwSXo1aVZt?=
 =?utf-8?B?OUl6NDBKNFh4NUcvVEx3VjdtMjdydCsyNCt5Wi9Pc2Ivb2dCTDV3T2VBeGRj?=
 =?utf-8?B?NDhNSjAxdVNmWXRPcVZJUCtyNU1POEoyQXpJNGJIZDV6bm9ZbTkrZ3NoZFR5?=
 =?utf-8?B?Y29WeU1wTDZ1V0FTVTMvemJoaFR0RGJkN2IxZm5qeEZwV0dCOGRqQlFxSlps?=
 =?utf-8?B?NndCcDZLRXlwVEs2ejhEc3BnOEE3UkxWRTRYd3ZQZ240azVscitXOHIwblht?=
 =?utf-8?B?c3dWUHVGeFplZG1XNUFRSm8vTFJvUytpbnZQMllRbEVRcm5LajB0YkZhd3JZ?=
 =?utf-8?B?VVZnR09mZENHOFMyRWVBNXU0K3ViaCtudVVPZnZRdHM4NDM2d3RNdW85Mm4x?=
 =?utf-8?B?aGZ5Rll3WWRaaXc4cHkxdWtOTzh0ZGxPSFkzQVZ1NFlocnJLYXV2bTZ3cUQv?=
 =?utf-8?B?QXZ1YjBmTXdleUxFWG0xVUF1K3VWUTJuek1qZy90UjdXUFFHMnFRVmFBdmxj?=
 =?utf-8?B?V1BJQjJ2VnloOWhQOVFZNGVkSGdpZ2t6WHhZbGh4bm9KbVFqTDBLNk14MFND?=
 =?utf-8?B?aDlVTS9yaEpxL09uNGNCZ0d0R2Y3S1RVUHBMa25LS3VBdGx2czgwbVZXSmwr?=
 =?utf-8?B?NjViSSswcW83REpRU0dpYndtSlFKRHlCUmpUWW92UGhGNTNHa0t2RGIzMkZp?=
 =?utf-8?B?cHFyN3ZCWVFhMHhEVGJ1OGZtTVVBK0Rndy9mUm1FeGZTUzJwUEtHQXpGTHR4?=
 =?utf-8?B?YWFiZVBKbUZvRkNnNHFTQjA0N3krbXNSMXVhY3dlaU1ZNmlmcUtweSt1OXRH?=
 =?utf-8?B?bGp6SFNaN0ErWk9CNEpRTnBBaUJabDhKVkJrVGppNTJzdEVUbGRHY04wRkZx?=
 =?utf-8?B?RTVhR2hRWVVOL0JzSE9rNWFJQUZRUGlvVldLblduclhpQ1NQQUhXS2MvZHBF?=
 =?utf-8?B?S1VzK3FNYzhqRnRUMzVrc1BpSERQQ29CL01HRmIwQjlXeEdlMDFDcnZaM2RU?=
 =?utf-8?B?M3Y3UVMwclZwL3FwR1dSbDhLTk1YMHVWUFBrb0RkRnpBSHYwbmhzWnZpa3cz?=
 =?utf-8?B?MFVSSi9aSENJOGVhZGdWbEhPUTllbUFnOGwyVEtITFJ2Q0xmUjRUeVJpVkhH?=
 =?utf-8?B?MkZVeG9PRG5UclFuTGFNNkNSdU1nVTQ5dlBKdXFTZnVuVmhnRWEvQlRWc25z?=
 =?utf-8?B?K0hiVWVOM0FuOVNvK0ZSQlVWaGNhOTlwV3VSdmVmQUlsQVF3R3JDMlVaRElF?=
 =?utf-8?B?dGJpQUcweGVRcFF1d3A5aDFvMmtHcngxdUpEU2lRVHF4cHhTekkrRTJDUjNX?=
 =?utf-8?B?eHZqS1NSb1Foamp1Nm1FdG90YVhXeHZLVGw4WElrblIrdTdRdDhhV1k2eHdL?=
 =?utf-8?B?RHdBclVQemNXbHZUdG1HMVZJQU55OGVrRGlqUEgrUHBlbmpzTDZjZlkwRGpa?=
 =?utf-8?B?SU10Mjh4RzVoSHcwS0JxWEVUS0dNaGd1UFNXd1Q2bkdWa1Vqd1A3dU91TnNl?=
 =?utf-8?B?Yk9lZ2xzcFQrRjBBT0hHYkw1bEEzdUJSRTRURWg0UmJBaWFrcUhJY3crQyt3?=
 =?utf-8?B?ek54VS9Fd0tVN2E0SlJJaDVDMzFvblZjWk50d1NQSFJBSzBGNkVDaGMrQnEx?=
 =?utf-8?B?bnQrT3VYOEkyTVNjczQvaDhna1AwaUUyaFhFa1ovdXJ5bmRCazFtTVpQYU1I?=
 =?utf-8?B?NGI3L2loUGtTamRBQzQ5L1F1VjY0aG84ZjNxTG1ocm11UEJDdVFTQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e18c078-aa94-44ce-2b16-08de7aa0582c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 10:17:02.9842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Q7S/Itb5+SILClnWknn3aAq5PvFBQEsghHoNZlX+sGovRPnoM5D4bIIQJhbC44HNYkl45TPjZBachHgUpHl2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11877

Hi Daniel,

Thanks for giving a look.

On Thu, Mar 05, 2026 at 08:52:41AM +0200, Daniel Baluta wrote:
>On Thu, Mar 5, 2026 at 3:55 AM Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>>
>> From: Peng Fan <peng.fan@nxp.com>
>>
>> MISC protocol supports getting reset reason per Logical Machine or
>> System. Add the API for user to retrieve the information from System
>> Manager.
>
>[..]
>
>> +struct scmi_imx_misc_reset_reason_in {
>> +#define MISC_REASON_FLAG_SYSTEM        BIT(0)
>> +       __le32 flags;
>> +};
>> +
>> +struct scmi_imx_misc_reset_reason_out {
>> +       /* Boot reason flags */
>> +#define MISC_BOOT_FLAG_VLD             BIT(31)
>> +#define MISC_BOOT_FLAG_ORG_VLD         BIT(28)
>> +#define MISC_BOOT_FLAG_ORIGIN          GENMASK(27, 24)
>> +#define MISC_BOOT_FLAG_O_SHIFT         24
>> +#define MISC_BOOT_FLAG_ERR_VLD         BIT(23)
>> +#define MISC_BOOT_FLAG_ERR_ID          GENMASK(22, 8)
>> +#define MISC_BOOT_FLAG_E_SHIFT         8
>> +#define MISC_BOOT_FLAG_REASON          GENMASK(7, 0)
>
>I would move this macros outside of the struct. Although the intention
>is good it makes everything hard to read.

I followed arm_scmi coding style, such as
drivers/firmware/arm_scmi/clock.c
drivers/firmware/arm_scmi/perf.c
and etc.

I would not break the rule here.
>
>Just do:
>
>struct scmi_imx_misc_reset_reason_out {
>__le32 b_flags; /* MISC_BOOT_FLAG_* flags */
>__le32 s_flags; /* MISC_SHUTDOWN_FLAG_* flags */
>      /* Array of extended info words */
>       __le32 extinfo[MISC_EXT_INFO_LEN_MAX];
>}
>
>[...]
>
>> +static int scmi_imx_misc_reset_reason(const struct scmi_protocol_handle *ph, bool system,
>> +                                     struct scmi_imx_misc_reset_reason *boot_r,
>> +                                     struct scmi_imx_misc_reset_reason *shut_r,
>> +                                     u32 *extinfo)
>> +{
>> +       struct scmi_imx_misc_reset_reason_in *in;
>> +       struct scmi_imx_misc_reset_reason_out *out;
>> +       struct scmi_xfer *t;
>> +       int ret;
>> +
>> +       ret = ph->xops->xfer_get_init(ph, SCMI_IMX_MISC_RESET_REASON_GET, sizeof(*in),
>> +                                     sizeof(*out), &t);
>> +       if (ret)
>> +               return ret;
>> +
>> +       in = t->tx.buf;
>> +       if (system)
>> +               in->flags = le32_encode_bits(1, MISC_REASON_FLAG_SYSTEM);
>> +       else
>> +               in->flags = cpu_to_le32(0);
>
>What does system = 0 mean? can you directly do in->flags = 0?

If system is false, that means to get LM(logial machine) reset reason.
If system is true, that means to get system reset reason.

grep "cpu_to_le32(0)" ./drivers/firmware/arm_scmi/ -rn

You will see other usage, I just follow same style here.

>
>
>> +
>> +       ret = ph->xops->do_xfer(ph, t);
>
>Is it mandatory to call  ph->xops->xfer_put(ph, t); even if ret ! = 0?
>Because we can get rid of one level of indentation with:

yes, xfer_put is mandatory.

Thanks,
Peng.

>
> ret = ph->xops->do_xfer(ph, t);
> if (ret)
>    return ret;
