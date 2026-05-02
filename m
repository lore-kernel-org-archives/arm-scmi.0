Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011027.outbound.protection.outlook.com [40.107.130.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699D729BDB5;
	Sat,  2 May 2026 04:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777696909; cv=fail; b=FPMztv8QizKZlfyyZRJjxR5BWPdLAP6LgDuqSF89x/Wqhroiak72PnyJczTky7lZcMBmShyf5SjmjklgFwArtk5XLHovyXIvSg8jWTUrJjQXdDYne1qpUuSsjUr71uVytmrQHbP0zU251843PsAjRmV4OO9O6IPK0DpBfkENZik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777696909; c=relaxed/simple;
	bh=5cjCGg0YeLqzPu+MZ6XWl40RUG9fMlu7SHAhv1qmB/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Nd6ZhLwyilzBCoaHfuRTunDtYbR0FWsTkblpbGasOOuq7hVLS69if/iPa0T2/Q6ANsNXr5Zc4vK9Q1xKQvy8Et54KqHT4whBxGGKeQwIhcJxCKW69n1G5q0NEEN2IDVKWZNZnxFjjc+u1SHAxHyr0MGltD6F+pmM4C/XI08XUkM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=X0+3UyN6; arc=fail smtp.client-ip=40.107.130.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="X0+3UyN6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qkdZHLKM91kuiL+KPmY1b6xEgThxPFlBo1nn+HtlrqFpRX/zYExe91APIGUsYEpq2N2h5Bk6ZX5ftA+Os2CsiW5IYgUMhNuagwCtDKsVaSl94hlG8tQJodOGL+JDRDYmEFHpOhrClL50CC7lKZl0euUtHLFfKPzc2Z48UY9Oo3QDrXqe8XqVcmrRt913HILS3GTWJK5H1+TSEJv6SUjP1EBW9CV24hPUGCBGQ9/V/EQF+E0/y19YAtiCRt9T/maXf+J7lP1wMY+Y7jd0e+aEk3XfTfwXH2tpod9XxOWa3Z+YCtNsxmQf5ucHT+dMBG7jdw8laqrAmvKzu2V5L8h6nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5cjCGg0YeLqzPu+MZ6XWl40RUG9fMlu7SHAhv1qmB/E=;
 b=efHjNGyRVb43vJaUqZK+GKdNHBfeTnBPZPxos1o3WN2m7mcARHRkXxJW1ousGP+EQXMA+2LZ79LfWtLekmeR5zVIA5ceueiZyfD1vAKvDHOmxjX/5YSQxPnBRaCLAW73+65BVLW5+369iQaVUzNm0lENmwcsh/KxQIkYHvKYXvy2xsgjTQnY+u1p41mn8Kw7Ew4cNEtnkfwsal79ensRs5psOezK0RdY7KvsPuz9LpOS60vcJ2U5cG63ADctlSwOx+nZUK4xAH8vzDgZe0Hsyjq0Sna9QeuaLUcY+AXKoxzSYVsSXn5HIW+afoUAKTn07k8ijDifzHxGIQVVWyRjGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5cjCGg0YeLqzPu+MZ6XWl40RUG9fMlu7SHAhv1qmB/E=;
 b=X0+3UyN6Fxv7fEamLot23/63YsqKk49vsCy3OC0SyPPnulFch1iE1t0SusdkdOGBThDF7EDgtyZRnxyL6fW0NeB3hlym8yibYumIwXlQqozSyqmn/+MechYY55GdDQP3Nz0z3Ptv5En493RAQmnv4mrSdfumon/RuNFNKf1vePOXvFkHR9VpfBAZfvfZUNGbtvoobJAy6a6He0tEPbPyNpax7LEgRzMDX3G/czp6UF7FcQfUMiBOAxdo+X8FI4bxdsQepSTA43rxaMTon0egfv1FnPPOATehGjofg2Z93kpOYEghh7GNh2IndcsvsAl8HswDF+csIaX4ZIVhkl9HkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU4PR04MB10792.eurprd04.prod.outlook.com (2603:10a6:10:58e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.23; Sat, 2 May
 2026 04:41:44 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.022; Sat, 2 May 2026
 04:41:44 +0000
Date: Sat, 2 May 2026 00:41:37 -0400
From: Frank Li <Frank.li@nxp.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/2] firmware: arm_scmi: imx: Support getting reset
 reason of MISC protocol
Message-ID: <afWAgfmnaLZodRkx@lizhi-Precision-Tower-5810>
References: <20260305-scmi-imx-reset-v1-0-18de78978ba9@nxp.com>
 <20260305-scmi-imx-reset-v1-1-18de78978ba9@nxp.com>
 <20260318-savvy-courageous-mule-b3f9ae@sudeepholla>
 <20260430-private-versatile-jacamar-fd932f@sudeepholla>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430-private-versatile-jacamar-fd932f@sudeepholla>
X-ClientProxiedBy: SA0PR12CA0014.namprd12.prod.outlook.com
 (2603:10b6:806:6f::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU4PR04MB10792:EE_
X-MS-Office365-Filtering-Correlation-Id: ffdd9f9a-9b20-4041-7782-08dea8051cba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|52116014|376014|366016|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	Twqcp+o5BhtFbySTg5WXKXU+ukZON/jIyykj6Lyn/pv9mXx0ryVNvc98LFLG2p4ngcPKhTQLY2+VqiqZ21WuGgBRIugCbn1FVNV0NMzlG3VHTQmsyPMbBJ7mJDYLiRs4S7vCiAO8Idq5QSMtVuIhCVB3PCdhU+wMHpXreXmkq6obk2bsoYvNyyxkClxCUUD0HyJBvuVy7wDFj0y0pdiERFRtik/zhvdjvC3qeRIfbkwyO/MyIwS6ri5CvdT2oleh9GjUy8n9yVHzBRa25BoHVB6fe4ISkf38dBrIso8Rk3BfZ7ru0+rvZUOLu5mUGSNW6UNPPagpKgzhH6hDCLePtU+6nUKeJ3esNzLgLKzWVCz7aoUo0Fa/IWAVLxVUbWUtl9hTuiHera+6Kt4ivTekaDcgPF07Ul/CttylXooRclM6Z92BObzf5KwDcDWsHbmHPx1QxX1cV48J1R7kWh4UDj4KLTaZDa2fvJfCxWmQLjFzwwJhIxK7VyWpKGijKjyCLCA0F7UrF+Jn4q8RNIkNiRlM5w3RCOB5XAT/x15nQF1aXE1prgYoWQKsGqXzqbSwPUCHUlt2/8gmJF6dAO+rzxxBOUA2w048KBkzrxHkGjygR1yV6aN3OhICOTA7hctv8PFeRuKVwZlraiLtlGup0Q6IpH1rEl5Y61tJDse0YXfufDm4jjpvIcdXYLRvkWYW0WBinhj6dcsncbBFUcdQOXFmpj25bwJxbqLFSp1PCV8tfZmNxtyDpPPTYWDqs6qF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(376014)(366016)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k+jxyekkaDfPJPkhStd9suGvoUIQJwaU6XIlYzzrDODGKbAWL0e/nvPnjT3h?=
 =?us-ascii?Q?/zPBR1MzetTUniY+o5ULSEXcCVhpaoEQPF6ITIoHGqwznImKGWR/lH4+loZT?=
 =?us-ascii?Q?svB1OBiFD3L+H5Pj5TFQcKFHUAteITJbqdLN4b4PeA1yFd6wx/+6uvKfov7S?=
 =?us-ascii?Q?pDJSMLwLfdsVqh4ZRjdXorNme+qLmMBEXcFT7kI1ab1lfjt0mLEb3KVO3yoH?=
 =?us-ascii?Q?mGzwKHK5OQB+/YOjUgszhAwIXpls8yXk6akwAT1IiY3P/g1fvkLdQKvgBRCI?=
 =?us-ascii?Q?cRnK2uSklgEkUk/PZWD71MJk+iPlJqhU/zTujlQxvrqQSiWzC2gYOTHGBc7c?=
 =?us-ascii?Q?Hp+DGewYCXrVs9/plKtprRN1GqRJtDjQvHZM0bkh6BelexNG1nOcOsFOfMPY?=
 =?us-ascii?Q?4JiLW+a2vxQz5LFA77HDSBTnmUz1Gda3V2BN1bEJj9g2PLuvM4m93+ykjM9M?=
 =?us-ascii?Q?D9cFoZbO/c7zaIvF6k58BUwGVuVpUJP/k6ncHNVBrGZpeWk9A4DcER4wMMnk?=
 =?us-ascii?Q?Ion3uHrVsJU6Gsi2VCyJdYcuYVtFOExXBuSs1esgYc0DhinVwSpAEo6Hazy3?=
 =?us-ascii?Q?nyk54m96uXHalS10AmvjyaKIPSUWqLpZOnVbie3DJuc+Myn9/nUBWqx1uku9?=
 =?us-ascii?Q?7G35TCBFAN6eAdCUMECG6zrJJXtfwm7pVl7PvlRsU6K6yUQoiSeA+aeo2sxS?=
 =?us-ascii?Q?9q7fqmaX0sYRcu/+0D+LSycCbgke/2/KG1JxSFsgSJ/bCavVp4bSKPYC5AT8?=
 =?us-ascii?Q?0cSZ5xBSTpjz+Wrsm5ASqNfd02CSKAJtWUasZtWwd9wTfdMXRFZ9hX6KttqX?=
 =?us-ascii?Q?7jRcagNXFIkbzjd2QzNRoNkojIvPWKtvTIiEzLHQ/ik3QpFZMx6oc+BFbYoj?=
 =?us-ascii?Q?xmfLy4nqE2v8aGnpCILunpJWvGaJIuxF3GNbO1uwMbIfNWPn6QB95i60czIo?=
 =?us-ascii?Q?hnVlpSS72XHGeupwGGVY5SNZ0n/jyluSyCKVDB79Z9mc0qor9f/VAH9ACbLY?=
 =?us-ascii?Q?6OhYlyyz6d3oq8gnxDtzbCvikdkVjEbISybgKwgDLmYnj2Lh5K3M08Ivff1L?=
 =?us-ascii?Q?smUy52nEJevoOxlV5hb7zW2dC9UQYgjByVG2URYHgOnjmk1GdXWWbrnX+GD0?=
 =?us-ascii?Q?4yGUmYdu6RR97w+/dDzzm8QgWhu1e8YsXlMTjhwXjOUihtSrESZRdh0x4l5/?=
 =?us-ascii?Q?ztJ+rOfORcv+oXUzyrCwOAQKxp2tt6Ocq6nAX+l/qP8FTzivKrq8/7IbcNCY?=
 =?us-ascii?Q?ecSJjqXnP2jwVOmRR2THwLZE6X2ozLm/HdsOhty3vq50KS8/CCm5Rdv5W9h8?=
 =?us-ascii?Q?sm4qjMT1b5Ccc1omIBSLtDhOF2DC96B4hCJMk8GVAnz0TI0m5joKbWOlcJUA?=
 =?us-ascii?Q?Qtm9JoOV+v4i3Owh7zWxXZnBdDaiwV4yjTM3qjWP8Yn4hs+ckOZvFo1dX8zY?=
 =?us-ascii?Q?nSX3hRdXtH116STjrSju+69ht+A8ZNb5j6QOsrWzSWQpEECuusBNzebBKIMy?=
 =?us-ascii?Q?Fd1nPjB5M0dDFPbT8QcwkobhI7kEwpGKapxRHkOMWKW6BLfWrNNfpS/Zrkfr?=
 =?us-ascii?Q?PzmyeAvHpW9ShVB3excyekGGFnXy1bb6cKdavPv77zVdte7gHBHvNZQBt9eD?=
 =?us-ascii?Q?W+H020vmdEOHC+TehUF3X7TfzXR8rQdVgt88XI1hzQvBHCFOt68oxy/HV9yb?=
 =?us-ascii?Q?4nLAFE30i8XdCyJUL+f2yadivNxiogfPC4u+FzVNSXBm/wDC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffdd9f9a-9b20-4041-7782-08dea8051cba
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2026 04:41:44.5093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eTLE11U2kyXrARCjACuQc4x3Ko8U1T2iMgi53riIpObjLbf0/OI8AIUbQuK79FhRotQbi1WASP4/W6PMB+I36Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10792

On Thu, Apr 30, 2026 at 10:13:48AM +0100, Sudeep Holla wrote:
> On Wed, Mar 18, 2026 at 03:25:03PM +0000, Sudeep Holla wrote:
> > On Thu, Mar 05, 2026 at 09:56:44AM +0800, Peng Fan (OSS) wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > MISC protocol supports getting reset reason per Logical Machine or
> > > System. Add the API for user to retrieve the information from System
> > > Manager.
> > >
> >
> > Sorry for missing this earlier. It looks good though my usual rant is that
> > this MISC protocol is becoming never ending dumping ground for all sorts of
> > info you want kernel to dump in dmesg. Anyways, I am not too bothered as it
> > is not any user ABI.
> >
> > If, you plan to ask i.MX maintainers to pick this up,
> >
> > Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
> >
> > If not, I need their ack for 2/2/
> >
>
> I have left it in my -next queue assuming I would get ack if I need to take
> it. But I haven't received any, so not sure if I need to take it or drop it
> assuming it will go via i.MX tree ?

Acked-by: Frank Li <Frank.Li@nxp.com>

>
> --
> Regards,
> Sudeep
