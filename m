Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2069.outbound.protection.outlook.com [40.107.249.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A607D1F429B;
	Tue, 21 Jan 2025 15:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737472145; cv=fail; b=C+XLwsAxssdlEjEfwqpNc5hQrsbTssm6CntRNcJSIa+9IGvZkI3JWia8UwU1PPKAK1Nv4cMUUaMrf9vpfD2dFUdUqVjq2CU9DCYNoGyGkaUGLDMIgNCyX1daMKa2Pj4zfLJEyt/IjKDA922wzpxg+EAY8PuLKVdNv044X+kHGEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737472145; c=relaxed/simple;
	bh=D5N8sM0XcIGJAHlmIbuPX24MHLF/Lw1gFt5AbxcLrXI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=tmvYpycaJkZqerd3/w1V5Z/NBmKnIBNPr7xOceaYxDkWBrnnEMbA3yCb0FnqtmpwBV8PVN2ZEmCawRrvCREvZecKaCH1hb1akkV9MG/P5giP5MZRGQymOwUubco7ORP6bVs12+4FqQ/LvBFe+wGwsllaAObqHeU5S1G+LyL5NSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fdVSprAU; arc=fail smtp.client-ip=40.107.249.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fdVSprAU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DCpHkrH32LrC06CwLFg8YjoKj9OQ85GyqhESVQ2uAaVF+HHmRc+5dltBnEEd+XI53ui1ynCc2rJBIj0QWsHzmRNrzGZQGgNEH9XPIrGSSELpKsihP2d3GMOSAQJE8+RQbPtV6v/Dk10rcLjSHWe6VPq3RkmzQv6e/Y2AdNDQmXNYyJ75EbMfyw2mEoRVTQiI1qrzHJy0Nuc7Ch+5N0CRHy3gXLZh27cODZyHX/H9p+f6X58v/Bsgz7zUgeExyQTlZDum7VQ02URVunPfdM4d37e9eN56xb0rSzh9s2rot30VGxkvlg/sb2HGR5rn43I7Zoo/7QqNGpdDca+9Bghbbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9edP/JrVA+yShP9vIcD/4dxX5YBpcITjaG+fntkc3k=;
 b=IHGh632A/7+2zjpRHbugKHqNoqlm22SVyfMDwcPeTGoP5FCiBle2IgF5J+UsDbGiNnY47ZYZgjSjmZW7ObDdFjHFpBIUnUynPu38MtAl0TG06+/f5buO4FjCdH6MvDOFOKHJ7CDBq9da3qI3TYD6VUthx5vQeDMYELsrKYvJw21Xlie8G3OgXoo7RamdO+hwUhqyrsGBmgv7O45OdZffbTbA41I2xQ408UK5E/TvN4a34ZPlhSeDaCuKNXTkeZFZHSKXTsHSuckXZ8Arwq/2Wr/gCK/yRr/JbxCHanAKiYH6gR81TTHsMQVtWnaTe7oTxc5IKT9umcs2iI9zleLFKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9edP/JrVA+yShP9vIcD/4dxX5YBpcITjaG+fntkc3k=;
 b=fdVSprAU4Wjv53nySBdTQ6Y5sPqXuBrBDckfB8VTT0/yLjrLnczvuq6vMYc2iqlL+RjKZ3qD938Z1hCJc33Xw1HNZuCnis0HjipFje5nYG2o/mmE6QSrFkxf34vFHBmf0pcdWsdB36RlSrN6fGpJvLYklSGyhJg+TT+5KhqRo5BEaCptatV7JB/DcPQq9mk3x8aqu9MDYa+HjUEO0SAj8ECifPxBvrVA93Zs87Hfx11J012x8zG82N6UjK4X8+ziAuIqmbjZ7L2slcfJkAAHuVxkL9Uhbc6QG6TwyuFLrmBr2arbIrncBFxS9NzHunRavC2YRPf4EYIefxfA9LgTKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM7PR04MB6853.eurprd04.prod.outlook.com (2603:10a6:20b:107::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Tue, 21 Jan
 2025 15:09:02 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 15:09:01 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 21 Jan 2025 23:08:12 +0800
Subject: [PATCH 2/5] firmware: arm_scmi: imx: Add i.MX95 CPU Protocol
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-imx-lmm-cpu-v1-2-0eab7e073e4e@nxp.com>
References: <20250121-imx-lmm-cpu-v1-0-0eab7e073e4e@nxp.com>
In-Reply-To: <20250121-imx-lmm-cpu-v1-0-0eab7e073e4e@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737472103; l=10603;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Kis3sr9W8URwEQj+n9s61NGQaShBcfjbC/o6ISml5Ds=;
 b=0RveYEMSiCz43jRP4XSO+cZeHzNmT7xTzkLXccuSQQpRF2zBy13Y+D5onQbR0X+N+OI11jZGr
 jsdap3xQyB5CRLZ0yCpARrEMhA5rZxvazsEwvypALQM6NN6Ll1GXheK
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2PR01CA0045.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM7PR04MB6853:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e16932c-5d3e-4282-b756-08dd3a2d89e4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VHFrSG51ektsUTNadGM0cGZodHU3bUZ0bnRYNncxZ0dMZ1RYR1d0REF2RXRX?=
 =?utf-8?B?UHVHdVd1TXA5MUJtdm00STAvaWtsbGtBbjVqMDJKbHBObnZCbVRUZTE0RFpq?=
 =?utf-8?B?bGJkbHh6VTc1KzVYWnNiTzB5OS9nNitncnB6OUZucmlwZHBteEIzbWlJOUNr?=
 =?utf-8?B?cE82QWNrN3FzYm5NVk1uWVpBQXMzOUNTS3k3WnNnNS9wNmF6elpOZEFyVVhj?=
 =?utf-8?B?ODFWdEhVdlJXUEErVC9yOThQTFRxeTlGd1QzMzlMZGpnM0RyZVd2K0ZKS29V?=
 =?utf-8?B?VjBYQkNXMmorcm1FR2tyZVIzMk8xcXdLbEl6NldHalNiSTV4SnNpb1htWEhD?=
 =?utf-8?B?Y1hHM3RBM3dpSm1ISHkxZ1NMZWF4OHRkdE5uYXlGOWJUSTJ2NS9wWW11cHdM?=
 =?utf-8?B?ckNDQ0twR2NndnU5Y25QdTdpVTZ6WDU3VWZ1eUg2bGpuZkVIYmFuNUNHeWcx?=
 =?utf-8?B?ZnUvdG00cFdjVXAyTzc3MWpCSDZieXY2S3AwczJIVlA0c2pyK09aTXo5Qlht?=
 =?utf-8?B?OXNCNWN5U2hpcWFTcGcxWjE4NnA5RmpYa25BRXhoRjBUYlE1NDBZMmdJZDln?=
 =?utf-8?B?TW5meFNYVktGdmVHc2lSOWlrV0ZDRWR6VS9ZOUZXZE56aFdhT21ZcWxkaUkx?=
 =?utf-8?B?YVI5TnptUjBvc3hmUWFxaWhUTlFKb2M4Uk9sV2YzSHN1Szl0T3dCVXNrRG9n?=
 =?utf-8?B?aERCbnJOeGtoMExLTGFZbVpuOVc1S2V6MWcxd2ZCbXhMbFlnRzVnbks4Szla?=
 =?utf-8?B?RHNLSEVhRnR2MndkZDh4NXI1UVo0aEo2eE9FNWZGTFVKeWRxMjlqZVdUQ3VD?=
 =?utf-8?B?VFh1Y3dYNS8zTWVTd1E0VHlFenJjRnB0aU02a3pEbTdCMlBUL1A5UWFOaEY1?=
 =?utf-8?B?MXRCZG9jNFlnSFR2UFlWYWVEWk5NclRSdUtJQkE0WnlwU3JBM2JiREdBR1Zo?=
 =?utf-8?B?Q0dnWlBzU1lMaUIvVXBtS0szS0xIbHZqU01UZDl2Uk5HWjkveWdhTGg0L0Ix?=
 =?utf-8?B?RzRrTE02VXlkYm9KTXJrV2FFTTcwK2RXSU1aWWV2cDdtd3VmRStGY1ZoR1Vz?=
 =?utf-8?B?c0ZsYXZLTkNFcGpYTHovaUU3S0t5TEFXZ0pic3lVdEFjaWdSSUJzM1l3b0JI?=
 =?utf-8?B?VGZSQXRaQ2ZtK25KdnZFcmh2WmIvZXNaeTkxWHFaVDZjQ1R2WmdyNHJVOFVr?=
 =?utf-8?B?T3U0dGFWQzl4WTUxcTJJekJqQUZDTnBid3hPVGc5M29hM2VUS1VUdjFldWNs?=
 =?utf-8?B?YlRheG13bFNyckNYblYxTGk0U3Z5TkRhM2U3UklpeDVKVklXVkswOXJ4amUy?=
 =?utf-8?B?eDBRdE45dHV5cjBtY0Z0Yk9PYjNLQ3pCVnUyaXI0RGZSMmNHZnVBdDA3WVdv?=
 =?utf-8?B?UlVBeEdEMi95VW83bFhmSTlKWVVZK2piMmFWQi9tSjBMK1F0NzRIY1loWTh6?=
 =?utf-8?B?WmovYytua29nWDAxRWlhV2cxOTVEY3Z4Q0hrMDh2UEtEN3o5elBvY3M3M0tz?=
 =?utf-8?B?REV1L283YjY5cWl3cE40eThPODcyR2JGUjMrOFp1SnNncDRCN0FDVDNQeW1F?=
 =?utf-8?B?dUI0Vmd6MmtYd2Erd2NHeGt2OTlxZmg1b2hOUHRNRXFqUEJXRkhQNk5QQU5K?=
 =?utf-8?B?TkxaME9XdG0vVFUvTjFySGhGcTgrOFVKS3BBa2tLOFpZTUQ5WnJUbm1laC9n?=
 =?utf-8?B?SE1ZUlFhb2lTR0xTQXdWYkVKUkNrVktKeXNVMVlBcHBMZ2szajhjSVppclk3?=
 =?utf-8?B?UXVPREdDRUFZeURtakI3YmM4bC92Wm8reTUrM3NjRE1nUFlRczdvVFR6ZVFT?=
 =?utf-8?B?SlYxdGFMTXd3TTcwVk9QWXlDM0RLRm9hYzR0Nk1JWUxpYWg3RHk2dVpnL25T?=
 =?utf-8?B?a2s3UjBQMHE0SWVFaFE2TTJ5bXN5dXJOaERjQ045TDNyL2tBNytoRCtiZXZr?=
 =?utf-8?Q?++Rtwpa6MOqCukqHEmxdkWwS+r42Cbcv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWRzVmhLVGZPVENoRDNzU1lNRmpKd0Z2NXpnZHVZZ09DY0xPMzFrdnF0Q3Av?=
 =?utf-8?B?alBIeDhaQmRJc3EvSzZJa0x1MGxvSElLZEJYN1pvdm1TVWV2NTNpRjlYc2g3?=
 =?utf-8?B?bm5henk0YUlXWlFmb1JjQUxkSk5TUDlPU3c1dCtYMFF6eVA4blE1Y21OKzE4?=
 =?utf-8?B?ZjF5THdweEs5cUpDVUdqcTRWZFpGOVFXSEUwaTFRdEh4RXJUWGJiMlEvU0Ry?=
 =?utf-8?B?M05MU004OHIzVXFSWUFTRTF0M1VWeGVJS25PVU9DTHFnT2prdXdvSjdvOUh5?=
 =?utf-8?B?UEQ2SHI2SEF4d0ZRK05qdFVRMUR3NDZvbVYycmdEUFlQNnlKM3d6djhTdzFM?=
 =?utf-8?B?MnVHVUhUYmx1MzFKVjhWL29XZXVkOWpFVUJmZHJPazR3aXBaZUhUcTNoTHpZ?=
 =?utf-8?B?NWpnSldPMkd5R0FXV1ZFb0cwQldsSmdkY0lMZHdDZUErekJFT2VMZWV2Q2tq?=
 =?utf-8?B?bGtUM2lSbXVyREd2Zk56bUdnWk1uamhMTjNiOTJiZkY5ZlJlZG5DVTY0OWYx?=
 =?utf-8?B?NCt0d2pGKzNJQnd2UG4rNXhqWTdra2liQU9NVjh5UzJZV0NWWTNnbzNFWVJ1?=
 =?utf-8?B?Q2FmVlNhaVpoTkU0MmE5QXZyMXAxdGt3UEkvMzFRS29RMkN2YzhLQy9LQ1h6?=
 =?utf-8?B?bVRnVWZ5RWVnVUpqQ3ZielUwZWpNWEF0Q3FGREo3em5iZXR1R2VXZTBFZmlX?=
 =?utf-8?B?NXcwTzJrV1FpMkVVSlVOTk43bE5sUlFlY29iYjloMXQwaUhOcUVQWWl4elNx?=
 =?utf-8?B?dGR4WE84bDMzZUpkL0ZsRnZnUEhoMzVwdVVzdzR5eUYxK3V2K0c2emJOTUFz?=
 =?utf-8?B?NGxLTFY3MjBFLzdiY3FzRzlZeHZndHFVTDFCeGlUb2MrMVQ1V0wrcjZiNmtE?=
 =?utf-8?B?UWhCUC83L0lUK29lZjI0OTNIei9tRjRFVjlSNFVLWW9WTzJvMno3QXpWY3RK?=
 =?utf-8?B?cGVZQWNQR2pMbUtKWEtScmdwdjVZKy9SdksrUmp6SXRSWHd3a1ljOXZsdzBz?=
 =?utf-8?B?Q3JDUFNkdGlVOU1KTURBbGpMUDFEQU4yRWJ4NUxyV2dSWUxNNEROaGZDMTNS?=
 =?utf-8?B?WmJVL1gwMG12aUlHbTNzcU9NS2wvWEUzWnl3SmUxbFo5QVA1VXY2MzZ3SWJN?=
 =?utf-8?B?VndqZ0JyL2taSkdNSUZwQXBWQUlPZG5wUWRGTUJoV3JXZW1RZTdwd1VWenV1?=
 =?utf-8?B?L0hFMlFKUU1ONmwrWjdSbVNpMVVGQUtHQVdzcEJlQWFGUWNMTENRNjdmejli?=
 =?utf-8?B?UlZqOWpqcXRaSENCMllFTmh3VzJROHJnaVBZeXVXdm5qOENWbk10WnpZQlhq?=
 =?utf-8?B?ZkVsZFE4N1lFSzdvTzNmdXRwTG91Y2JYcVlLYnpWeUNwS256VlhjbTZnM2hE?=
 =?utf-8?B?NWxUWk4zcGpJUEtZMW9VSERHeVF0Nk4zQlpCNUt2N1A4SkhWRmd2Y3NUWm9q?=
 =?utf-8?B?azYzQVpLYkxGWlA1dmtGbVU5NjhPaUpINkU0OGk4MGR5VnNqZ2lDYkdGOTRI?=
 =?utf-8?B?TFNaU1RlSVcrNk8wdGRZWkcyaS9kNWZJUHdyb0kxNndmNGJzZ2U0L3J0TGV6?=
 =?utf-8?B?S1BheVZYRXNkQXBtR1NRbkJ1dWt6ZE5aeWRjdDBEZkp5UUV3ZDdGV3IrcGxh?=
 =?utf-8?B?YTk0SGM4WGxuVjV5eS9sdDluR2FwdUhPYlJmb243alJwRzZPVGZQdEZtU3dm?=
 =?utf-8?B?blErZ01OcTRTWldMM0lBc2R2dHVIaDF6TkdMc0NmK096RHgxMmRod1hhbGZE?=
 =?utf-8?B?WXkyaEYvbEVQbkhtckJ3ZHhtekxDUlNRN1YzNGNZMmRRdjV4YkpUN2lHRnpI?=
 =?utf-8?B?YloyM2Z3MFBhTU1mL0s2NjE1c2RzRitLMmxhN0VSdE8vR2k0UjdKbG9Mdmhz?=
 =?utf-8?B?WXhLY1lyR3ZkQlY0MWQ3TkNhaWhUY3RKRXJwVUVOT3Z4NDFZSXZ0RTJmWlNW?=
 =?utf-8?B?QWVjRS9MbkxHbmg0ajZZUXZLeTlJYTlHb2d6WE1wWWJJc3hQWEVrOUd3NEIx?=
 =?utf-8?B?K3gzUkNJWWpNL1dYNktSRi9yRVdJNm96cnQ2bFRadFpnMkl1YkQrRVhWZDBL?=
 =?utf-8?B?L1VKMnJrQmNzSWhxM2pYWnJTSFBFK3dBZkhHRzdUeVNNNnVGdzZMT2VOeFVw?=
 =?utf-8?Q?ixZ+pV/cfD4nJuOzHcPCU1Ond?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e16932c-5d3e-4282-b756-08dd3a2d89e4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 15:09:01.8875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ob8P+nQMbJeelvRTW4OGqbOZ8CG10iPu0xBbWE9z7xLXnPKfunUvXxZeH+2icoCLZvrAamHli3rmm7h3CgWrpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6853

From: Peng Fan <peng.fan@nxp.com>

This protocol allows an agent to start, stop a CPU or set reset vector. It
is used to manage auxiliary CPUs in an LM (e.g. additional cores in an AP
cluster).

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/arm_scmi/vendors/imx/Kconfig      |  13 +-
 drivers/firmware/arm_scmi/vendors/imx/Makefile     |   1 +
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c | 283 +++++++++++++++++++++
 include/linux/scmi_imx_protocol.h                  |  10 +
 4 files changed, 306 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/vendors/imx/Kconfig b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
index 1a936fc87d2350e2a21bccd45dfbeebfa3b90286..9070522510e4d3f3d7276a7581f8676006d20f90 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/Kconfig
+++ b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
@@ -12,6 +12,17 @@ config IMX_SCMI_BBM_EXT
 	  To compile this driver as a module, choose M here: the
 	  module will be called imx-sm-bbm.
 
+config IMX_SCMI_CPU_EXT
+	tristate "i.MX SCMI CPU EXTENSION"
+	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
+	default y if ARCH_MXC
+	help
+	  This enables i.MX System CPU Protocol to manage cpu
+	  start, stop and etc.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called imx-sm-cpu.
+
 config IMX_SCMI_LMM_EXT
 	tristate "i.MX SCMI LMM EXTENSION"
 	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
@@ -21,7 +32,7 @@ config IMX_SCMI_LMM_EXT
 	  manage Logical Machines boot, shutdown and etc.
 
 	  To compile this driver as a module, choose M here: the
-	  module will be called imx-sm-lmm.
+	  module will be called imx-sm-cpu.
 
 config IMX_SCMI_MISC_EXT
 	tristate "i.MX SCMI MISC EXTENSION"
diff --git a/drivers/firmware/arm_scmi/vendors/imx/Makefile b/drivers/firmware/arm_scmi/vendors/imx/Makefile
index f39a99ccaf9af757475e8b112d224669444d7ddc..e3a5ea46345c89da1afae25e55698044672b7c28 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/Makefile
+++ b/drivers/firmware/arm_scmi/vendors/imx/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_IMX_SCMI_BBM_EXT) += imx-sm-bbm.o
+obj-$(CONFIG_IMX_SCMI_CPU_EXT) += imx-sm-cpu.o
 obj-$(CONFIG_IMX_SCMI_LMM_EXT) += imx-sm-lmm.o
 obj-$(CONFIG_IMX_SCMI_MISC_EXT) += imx-sm-misc.o
diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c
new file mode 100644
index 0000000000000000000000000000000000000000..e3f294c2cb69a5b5a916d55984f4a63539937d02
--- /dev/null
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c
@@ -0,0 +1,283 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * System control and Management Interface (SCMI) NXP CPU Protocol
+ *
+ * Copyright 2025 NXP
+ */
+
+#include <linux/bits.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/scmi_protocol.h>
+#include <linux/scmi_imx_protocol.h>
+
+#include "../../protocols.h"
+#include "../../notify.h"
+
+#define SCMI_PROTOCOL_SUPPORTED_VERSION		0x10000
+
+enum scmi_imx_cpu_protocol_cmd {
+	SCMI_IMX_CPU_ATTRIBUTES	= 0x3,
+	SCMI_IMX_CPU_START = 0x4,
+	SCMI_IMX_CPU_STOP = 0x5,
+	SCMI_IMX_CPU_RESET_VECTOR_SET = 0x6,
+	SCMI_IMX_CPU_INFO_GET = 0xC,
+};
+
+struct scmi_imx_cpu_info {
+	u32 nr_cpu;
+};
+
+#define SCMI_IMX_CPU_PROTO_ATTR_NUM_CPUS(x)  ((x) & 0xFFFF)
+struct scmi_msg_imx_cpu_protocol_attributes {
+	__le32 attributes;
+};
+
+struct scmi_msg_imx_cpu_attributes_out {
+	__le32 attributes;
+#define	CPU_MAX_NAME	16
+	u8 name[CPU_MAX_NAME];
+};
+
+struct scmi_imx_cpu_reset_vector_set_in {
+	__le32 cpuid;
+#define	CPU_VEC_FLAGS_RESUME	BIT(31)
+#define	CPU_VEC_FLAGS_START	BIT(30)
+#define	CPU_VEC_FLAGS_BOOT	BIT(29)
+	__le32 flags;
+	__le32 resetvectorlow;
+	__le32 resetvectorhigh;
+};
+
+struct scmi_imx_cpu_info_get_out {
+#define	CPU_RUN_MODE_START	0
+#define	CPU_RUN_MODE_HOLD	1
+#define	CPU_RUN_MODE_STOP	2
+#define	CPU_RUN_MODE_SLEEP	3
+	__le32 runmode;
+	__le32 sleepmode;
+	__le32 resetvectorlow;
+	__le32 resetvectorhigh;
+};
+
+static int scmi_imx_cpu_validate_cpuid(const struct scmi_protocol_handle *ph,
+				       u32 cpuid)
+{
+	struct scmi_imx_cpu_info *info = ph->get_priv(ph);
+
+	if (cpuid >= info->nr_cpu)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int scmi_imx_cpu_start(const struct scmi_protocol_handle *ph, u32 cpuid)
+{
+	struct scmi_xfer *t;
+	int ret;
+
+	ret = scmi_imx_cpu_validate_cpuid(ph, cpuid);
+	if (ret)
+		return ret;
+
+	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_CPU_START, sizeof(u32),
+				      0, &t);
+	if (ret)
+		return ret;
+
+	put_unaligned_le32(cpuid, t->tx.buf);
+	ret = ph->xops->do_xfer(ph, t);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_cpu_stop(const struct scmi_protocol_handle *ph, u32 cpuid)
+{
+	struct scmi_xfer *t;
+	int ret;
+
+	ret = scmi_imx_cpu_validate_cpuid(ph, cpuid);
+	if (ret)
+		return ret;
+
+	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_CPU_STOP, sizeof(u32),
+				      0, &t);
+	if (ret)
+		return ret;
+
+	put_unaligned_le32(cpuid, t->tx.buf);
+	ret = ph->xops->do_xfer(ph, t);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_cpu_reset_vector_set(const struct scmi_protocol_handle *ph,
+					 u32 cpuid, u64 vector, bool start,
+					 bool boot, bool resume)
+{
+	struct scmi_imx_cpu_reset_vector_set_in *in;
+	struct scmi_xfer *t;
+	int ret;
+
+	ret = scmi_imx_cpu_validate_cpuid(ph, cpuid);
+	if (ret)
+		return ret;
+
+	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_CPU_RESET_VECTOR_SET, sizeof(*in),
+				      0, &t);
+	if (ret)
+		return ret;
+
+	in = t->tx.buf;
+	in->cpuid = cpu_to_le32(cpuid);
+	in->flags = start ? CPU_VEC_FLAGS_START : 0;
+	in->flags |= boot ? CPU_VEC_FLAGS_BOOT : 0;
+	in->flags |= resume ? CPU_VEC_FLAGS_BOOT : 0;
+	in->resetvectorlow = cpu_to_le32(lower_32_bits(vector));
+	in->resetvectorhigh = cpu_to_le32(upper_32_bits(vector));
+	ret = ph->xops->do_xfer(ph, t);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_cpu_started(const struct scmi_protocol_handle *ph, u32 cpuid,
+				bool *started)
+{
+	struct scmi_imx_cpu_info_get_out *out;
+	struct scmi_xfer *t;
+	int ret;
+
+	*started = false;
+	ret = scmi_imx_cpu_validate_cpuid(ph, cpuid);
+	if (ret)
+		return ret;
+
+	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_CPU_INFO_GET, sizeof(u32),
+				      0, &t);
+	if (ret)
+		return ret;
+
+	put_unaligned_le32(cpuid, t->tx.buf);
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		out = t->rx.buf;
+		if ((out->runmode == CPU_RUN_MODE_START) ||
+		    (out->runmode == CPU_RUN_MODE_SLEEP))
+			*started = true;
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static const struct scmi_imx_cpu_proto_ops scmi_imx_cpu_proto_ops = {
+	.cpu_reset_vector_set = scmi_imx_cpu_reset_vector_set,
+	.cpu_start = scmi_imx_cpu_start,
+	.cpu_started = scmi_imx_cpu_started,
+	.cpu_stop = scmi_imx_cpu_stop,
+};
+
+static int scmi_imx_cpu_protocol_attributes_get(const struct scmi_protocol_handle *ph,
+						struct scmi_imx_cpu_info *info)
+{
+	struct scmi_msg_imx_cpu_protocol_attributes *attr;
+	struct scmi_xfer *t;
+	int ret;
+
+	ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES, 0,
+				      sizeof(*attr), &t);
+	if (ret)
+		return ret;
+
+	attr = t->rx.buf;
+
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		info->nr_cpu = SCMI_IMX_CPU_PROTO_ATTR_NUM_CPUS(attr->attributes);
+		dev_info(ph->dev, "i.MX SM CPU: %d cpus\n",
+			 info->nr_cpu);
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_cpu_attributes_get(const struct scmi_protocol_handle *ph,
+				       u32 cpuid, struct scmi_imx_cpu_info *info)
+{
+	struct scmi_msg_imx_cpu_attributes_out *out;
+	struct scmi_xfer *t;
+	int ret;
+
+	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_CPU_ATTRIBUTES, sizeof(u32), 0, &t);
+	if (ret)
+		return ret;
+
+	put_unaligned_le32(cpuid, t->tx.buf);
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		out = t->rx.buf;
+		dev_info(ph->dev, "i.MX CPU: name: %s\n", out->name);
+	} else {
+		dev_err(ph->dev, "i.MX cpu: Failed to get info of cpu(%u)\n", cpuid);
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+
+static int scmi_imx_cpu_protocol_init(const struct scmi_protocol_handle *ph)
+{
+	struct scmi_imx_cpu_info *info;
+	u32 version;
+	int ret, i;
+
+	ret = ph->xops->version_get(ph, &version);
+	if (ret)
+		return ret;
+
+	dev_info(ph->dev, "NXP SM CPU Protocol Version %d.%d\n",
+		 PROTOCOL_REV_MAJOR(version), PROTOCOL_REV_MINOR(version));
+
+	info = devm_kzalloc(ph->dev, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	ret = scmi_imx_cpu_protocol_attributes_get(ph, info);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < info->nr_cpu; i++) {
+		ret = scmi_imx_cpu_attributes_get(ph, i, info);
+		if (ret)
+			return ret;
+	}
+
+	return ph->set_priv(ph, info, version);
+}
+
+static const struct scmi_protocol scmi_imx_cpu = {
+	.id = SCMI_PROTOCOL_IMX_CPU,
+	.owner = THIS_MODULE,
+	.instance_init = &scmi_imx_cpu_protocol_init,
+	.ops = &scmi_imx_cpu_proto_ops,
+	.supported_version = SCMI_PROTOCOL_SUPPORTED_VERSION,
+	.vendor_id = SCMI_IMX_VENDOR,
+	.sub_vendor_id = SCMI_IMX_SUBVENDOR,
+};
+module_scmi_protocol(scmi_imx_cpu);
+
+MODULE_DESCRIPTION("i.MX SCMI CPU driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/scmi_imx_protocol.h b/include/linux/scmi_imx_protocol.h
index 456559f021696ae51f40ed11e6f85089d430ce71..6521199cdab67c7e751e850def221d89898cd0f2 100644
--- a/include/linux/scmi_imx_protocol.h
+++ b/include/linux/scmi_imx_protocol.h
@@ -16,6 +16,7 @@
 
 #define SCMI_PROTOCOL_IMX_LMM	0x80
 #define	SCMI_PROTOCOL_IMX_BBM	0x81
+#define SCMI_PROTOCOL_IMX_CPU	0x82
 #define	SCMI_PROTOCOL_IMX_MISC	0x84
 
 #define SCMI_IMX_VENDOR		"NXP"
@@ -86,4 +87,13 @@ struct scmi_imx_lmm_proto_ops {
 			    u32 flags);
 };
 
+struct scmi_imx_cpu_proto_ops {
+	int (*cpu_reset_vector_set)(const struct scmi_protocol_handle *ph,
+				    u32 cpuid, u64 vector, bool start,
+				    bool boot, bool resume);
+	int (*cpu_start)(const struct scmi_protocol_handle *ph, u32 cpuid);
+	int (*cpu_started)(const struct scmi_protocol_handle *ph, u32 cpuid,
+			   bool *started);
+	int (*cpu_stop)(const struct scmi_protocol_handle *ph, u32 cpuid);
+};
 #endif

-- 
2.37.1

