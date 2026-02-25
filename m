Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012005.outbound.protection.outlook.com [52.101.66.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC4A33CE91
	for <arm-scmi@vger.kernel.org>; Wed, 25 Feb 2026 09:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772012222; cv=fail; b=V2Cs01kjakHTKupHOoCBXqiojRlqbvyyPc4dq9xLUSCbxpLE+vvR4YzY5ZgExFXuWY4JVsQ+L1ukN72iEIg7jih1RMF1iu+9DWU+ycqaFk1ZVtXlp9R0P/4PM7KoQETlQKZ9FZTYQQ3Om28e14pit84ck7QcuX2kY6fDzgWbgCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772012222; c=relaxed/simple;
	bh=8waqtQ1+e62f+14zaevIRt4c6RQrTiQCCT0cYuRHCTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AKUFNEE/3LasjnaI0u/eaXq26AIu2ygGdW7CVYKuJ2yVQzdeAs2oMEqjs3Jog5bZhaG+uqp1Rks1vDtVREBoVAfdZn8tlrVMAixzt1MIWOIEBTi++0dVWIqnvyXts7ItnQQqKN/p0Aqe3PpLjAliV2XEmf7YxZEu96ee06ij9fU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=G5Qk7+8A; arc=fail smtp.client-ip=52.101.66.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="G5Qk7+8A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hOjgVoPZUMxOe03x7z8pZgeIkT6kAI7v59Mv/tZfpc1ed9UzdkDzEX7OXRXRCTtiRZjBjyBSoItOnMgEKw/sGFUJtDUbypr6XpSO9ICURjy+qhnvmX9rjNS01QqA562FDP4adECHNHIZ2YpTFBoEpSyIRI2JlhDLkQHRtNIdbWhIO5w+98z9BDw0lIR8PIxqpG32o7op5GJyMfIdeunmsyd2vakJszII+tw+4tG4fQgzkWJeGARRxUsgqrnbCq5zp/6rzPwm5IO3qn/QTJ7tf1L90gheFUtsqkiQ4pX5E+1gX34fV4yAcC394peBZO8fqf0XjdXEpGUpJLYb9Bmdeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vJIaTg0H/ulJlmPC7TUEYhG1pzQ7te03NPkIfPsXdI=;
 b=CRXW7XODDbgNxdPkJwBJ1dofeeVztKTILxA4FZ7L7m6XCUbTmZdk52eLZ5J9JCGrNcJPjpCf0ogCvcspsRZ/WPaVOUQXT6zl0WQ+3XF0H88cdJkk2gZ3kvP65M0oo3DZWtFxgXJpCmJKZ5iVQZPX55NNnsIBTLdfvARn3849qL63wAX7S7V2O1WuJE0HWLweAyWcV8IjaHEZ5ZX7cRa1znM5u8AC+DfvfvLvmaVSP33YeYb2Ourh5Zxf/6AGqPTmH2XvmP4EDByam9sTaRvRHMq92HmLqAQnxZCL8ysy9J8t5DqpEYScApb+xSd4gTelpoJCw807SaUk5BanJS4L2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vJIaTg0H/ulJlmPC7TUEYhG1pzQ7te03NPkIfPsXdI=;
 b=G5Qk7+8A+9lBBRzloumxPAepGMdcL2FlRPepRyczNOGI1Rd7jDT2N1LlcdsdpYyzThqvoYhfveqhgxwtzGqb4xiMqygU1WOml1pJzXOgbXpQUFrqcIiIjmSmLQG3z3EpYW2wjMnJrCEaiAvlIDRFrIDIPgCbwc/DUzJ3WAwka15Yh94cj92pqDnMm+UCwPw++gUl7Y33iirTagHdzMG52zTduDPROq4v6V6KJrJF8lnD9fgkWeh/32sbv7q575Jnno2TC/b80bSRTns450Kyzu7JQIznJ/bETSLMJ7VRtyue42tcPV87kOdkOItpfuPDtY3Ej+HmeO4jPejNe5oVhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM8PR04MB7233.eurprd04.prod.outlook.com (2603:10a6:20b:1df::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Wed, 25 Feb
 2026 09:36:58 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 09:36:57 +0000
Date: Wed, 25 Feb 2026 18:52:06 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>, Tom Rini <trini@konsulko.com>,
	Alice Guo <alice.guo@nxp.com>, Ye Li <ye.li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Vinh Nguyen <vinh.nguyen.xz@renesas.com>,
	Valentin Caron <valentin.caron@foss.st.com>, u-boot@lists.denx.de,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>, arm-scmi@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH 1/4] scmi: pinctrl: add pinctrl message IDs
Message-ID: <aZ7UVtJV-tWyP1dd@nxa18884-linux.ap.freescale.net>
References: <cover.1771856828.git.dan.carpenter@linaro.org>
 <62727b8bc822e07ad546d9e9fe4373a372a3f1b9.1771856828.git.dan.carpenter@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62727b8bc822e07ad546d9e9fe4373a372a3f1b9.1771856828.git.dan.carpenter@linaro.org>
X-ClientProxiedBy: SG2PR04CA0208.apcprd04.prod.outlook.com
 (2603:1096:4:187::10) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM8PR04MB7233:EE_
X-MS-Office365-Filtering-Correlation-Id: 31dd5376-067c-4331-31b7-08de74516b64
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|19092799006|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	hzsftknk5D1sD9sftgy2h0Jr5YyrXUKhvyG1XvBos/V6pUxBxuyzLJfWPT3pWfWo8MVBfTRYWFJJHKWokAQiMsCA5ZRazgvBl/WnuGSkTBuWaybtrTk0WW3CnM2Eyc0dfFOnLN031H3jfbiyyjQewZlPaNdEcaLIqRCtvZ3q46014D4OgLOuKRJQ1uxaUFFI0jOZHq/n2DuSY8w4xuqJcBsYLTqp0jna92IgIHlPDvHm38z7+5HOg2BPjRJne4rrk4v1z4oH1ImjTzXHX5i/D/xBPBrSBbQUl4tiT10ZCycCXnhHnon/OaUAUu66d6JPlf4sM3QFBfakVqafADHiTqCrUIpVhbNV90xVrN4MJEC1S+qhSZ7jW37pYbEzmvgct2wqNiGBFGaVK2uZkPrqMMjWE1pu+pB5oZ4XCBS59tio3GxSipeQaggZOPUvUgSOEbXgN9Dbkdt2BvW5+5KhtVZ3RmtwQVQRowJmEUExmcvrlhxam8xwfya1D9uryaQ/HkWJZheDkaqCgY4EoByowz8DNu+mvSuVYiySjhsqYt/ssu7CyIyJPat3Yn7aJ+ILK8j0hoY/rUTHlpdHO9tTz+G/uuJsSaRCMm/U+k7tcwGG/jl9dRAiVxP+kHbz5kaV28h7tFAgbCSr9jUEMiQS4o205z5TA76KyVAOpqopGltOTXIRfJKbnmiXp9Tltdd3rOL9ReEWdyCrLGS5EEdgytrt2+D15UrdRyIHPVHjCbToZYN8voJveGTw/7R9IiJRX23rSsr3TyAG7706O92p+TwjNUJLSy5HrgzfYVDpUFQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1KtR1s1BPDmlCnttnOvMYp6krZKoPxH9lDHZI8FQA0Tn44iFBkeDe7iP2pNY?=
 =?us-ascii?Q?kGYLfUZ3zL0cTYDL67HFXtWEtqwdBpzTjhpeSiPVLP1jjxXWNm5X4HPZCHh0?=
 =?us-ascii?Q?8I6jKEGQacgbxWqOG8TOfPV5DDXXaN209f6KbSm+C30pxdzsdlNdvxJQfdwB?=
 =?us-ascii?Q?sjd6YROn+HhXCDPNfWLCYKG56j49Zga2U0OSJpRpmFINfYNe0pXbdClRRpp9?=
 =?us-ascii?Q?K+WNxgnGeCOHOa/RmusALh5bg0fkCYocJcgqh4p2VFwADPlqkX50xh4zaHwu?=
 =?us-ascii?Q?vcbp3AQAefXfPDjs/js600rdmXG5VMjK49ys9jUJ3SV5iN+Iw5o25jKuBHja?=
 =?us-ascii?Q?ulbz/0hERQkuEUpnBs4QbcZJxbmO4oeOUVO4PqT/0Lc7xbG6F6ohotEvFYuy?=
 =?us-ascii?Q?QRaghXUk5TGSvAFNNpJ7q3U0dDhQZRqijUlv+1wY0LbbOiwxI57sJqFCvgka?=
 =?us-ascii?Q?hLoXi5X5v5mk07H0tQ9klZ3q4JZo83N808kh0+lMr/fjaIAE18rLXxIrz1VE?=
 =?us-ascii?Q?xlMWsDnkyk2KhM/WdpAjM9q3uJw9yOpkpTWPf3oLgAGh92vbZ4/417JIon1g?=
 =?us-ascii?Q?iKWKh4HRxzeyUL5k6af0xzWPuhPsSgon1xeWHdc9j7ibSuztH5EQ/EyEMYJ6?=
 =?us-ascii?Q?bxg9SlAtjOQzW8ymw9mKplktivENBGNpatZKfENqHf3avO7u8U0HBnd214pg?=
 =?us-ascii?Q?hy+UUfc7EaaJ69sVwygxf37GQkpIBlFhIjD02939+KA+JPPbRBxCKWuM75ls?=
 =?us-ascii?Q?qvqvlQZ64mcIdwa27Z0Ij2B4MZZTmDb8Icdtp9lNN/okTL0AHchLIzXqA4Pm?=
 =?us-ascii?Q?ucvtvyOJQ2ZnVSOvKVp3cQNEy5Y0v/ncwl3PTEMJPUYgl+3iG9izcwkNCk/g?=
 =?us-ascii?Q?MFUDGWctu5dnesp+8hGWVdQiMx+Iyx5iZHH0APT0ZOMaG/7drHEjjp73a8II?=
 =?us-ascii?Q?qt7wMhl9g5GzEZbKPnDDSd5KFGc4BLMdD69wzq484Mgj2Z+vPTwKkLu8WlXw?=
 =?us-ascii?Q?RetHGHURJTlb/XKtihI/GJ5OnlWffbzVoA9dENijh771Q6D90pEbeFkTtTpF?=
 =?us-ascii?Q?eYZ+sTFdPUtsXdUTC1yDiXBjyM/8VZpcraI3J/Wj/8y4f8923BRsDwhfe0vP?=
 =?us-ascii?Q?gHECCCCVixX3+KpifuTCWRcb91gx9TY1YfwffJD1ygKUmQhVmdct/rST1u2K?=
 =?us-ascii?Q?aMFBOzD+qSyCRVQnsPoW/ZJOdEtVt5nbXKGJKsUlfNTapUIoq6alQLybg+e7?=
 =?us-ascii?Q?jAlwP1JbVu0BJCvFYjzLJGQ6o4zeJ5YrKwMfVi9rhQBYtMCo97azpsx0IGgB?=
 =?us-ascii?Q?8v3xxQahfhYhFioAGiTlAfd3knwPvpYLyfXQ0oXakqieon8aPQRY9yd89w1J?=
 =?us-ascii?Q?MKzfPPmf5/lmIBj6XtC/ttXPf07209hw49PGZqd5hR/7aAg++226IZ/iEJ5M?=
 =?us-ascii?Q?SfHxIHjA+kARzVnpIjARhmCnKYxPVlKBjquH0AGlCbiHyzM/+3ecPuk04A++?=
 =?us-ascii?Q?qjoxN8CdHWekr+QN/DVgKeXg+iB69wlIvkOj2ngOSQbBf/iJVo6f0/wET0cm?=
 =?us-ascii?Q?ts3BLmBfj+Q4rOHnztslNFPWmGzInjGmHBkE7WKNZ6/CBXUUv0Hyfss1ZZRO?=
 =?us-ascii?Q?5Ndui8LIoEP1Svyf9MJzN59fJOJiafBr5hCCXrYcS0lhcZfQk6quenKTLj5/?=
 =?us-ascii?Q?Nll21EkLmO/H6T1YU3D+Yf11d87lhrlEwDSAvwVbHKgCPx1ddM/LwDNiBGVx?=
 =?us-ascii?Q?HS4t9aAhXA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31dd5376-067c-4331-31b7-08de74516b64
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 09:36:57.8670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CrRe8PUn7BYKwd+1sCqOVkV0N43GGnyzzUn81iV9q43qOtO+NxFUBXbn7eSOuHQ8jG8otG9qPvcu+3BkxiP4JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7233

On Mon, Feb 23, 2026 at 05:33:25PM +0300, Dan Carpenter wrote:
>Add all the pinctrl message IDs.  I renamed SCMI_MSG_PINCTRL_CONFIG_SET
>to SCMI_PINCTRL_SETTINGS_CONFIGURE so the naming matches the spec better.
>
>Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
