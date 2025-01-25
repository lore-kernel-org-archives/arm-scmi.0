Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013063.outbound.protection.outlook.com [52.101.67.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F497171D2;
	Sat, 25 Jan 2025 01:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737766810; cv=fail; b=DnzYX/HjRl37aT+FIWZkHdZB4yIeUAj1UGC2fYMoF9gXeb1UapytNDyxSN+VrFiM3ghtIgpWK7Jdw6rco2t2TnjI0dDnlf0/a5TxqRomqqTeELKm0GJQNk5OveAER3oub3yAXdRNZCjUynszxBl28WzWF8cJ5V0/uA/jEzkbyw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737766810; c=relaxed/simple;
	bh=rK9UdBRpMcj5F+7/LRJjAP6LqNowDlFNbXEPtu5nRwk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=stPTEN73RH5Z44U5CmFiwVDSj8ZeSFhqwDqKkWL09WCzSvkWqg3RkG7PiPt0JHPiRR5Wck+DZpNCNR9SxKD3EpE3WaZtHPnvaGpbVXH0jJeRkfIxtgWIGeM3bKin8/L72bVgeqjaBrvAEugUSK/sVx4QcGxhyEsWohIulb7/fr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FGW+1sml; arc=fail smtp.client-ip=52.101.67.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FGW+1sml"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oQIXU6BK5XJpxsIrM+31F3p/2FYwyiU06YhOAA8TT867F7kGn6v/Xted7jKzxe1BIVOzky9mftOwlI7rXXXZx6qWY4SaTxDsYWyh0yBrHGK8pSXOMcsQooUqr0wzXLGM2zE8vSEreJG/9ffkxhInWFfSxZT7326xs1D/66uGo4hVmfQBgl1czG/0XWhYiH98ceyK3k9PjygfAYuAI2JB/1GpHinpQ5B86Oit2bqCGSqX8V46CQsq96OwH+4R+maFRFBSoclh51H6Yv/3ym2CIUgA9CUVSv8k1ZP2I6AMDlxKSGkV40S+KE8SxbcW/jhjVNChvTHmTe7uapKR2FdNvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rK9UdBRpMcj5F+7/LRJjAP6LqNowDlFNbXEPtu5nRwk=;
 b=K6Jps5KWZye0XwYrDGVTJNmXdQ97g1lmVWvg/0ldQnQ4UQu3crTufIZE2zVUdBMFnTi0Qu34ZYsvZVnqQfyut/WYBIfiq8g+wtpVMVdzL01JSVRVyK9IpgZ7wUgbkYBeWiDUg6PFuqe0iWiHK7fSPAr78rlmtvA1AUxw3xeutwAGWe4sE3fmVRZkxlU/8+hQ9RI5oeYu9rHqdg/63FUydCBuc/Q5+LDg/i2dYwnqOSFKawCpnF8HcuexLB1ErewvJO526PoI2dDU/s5DIVmY7JETI9XsxWNZYxVTr3q6N3bUkLuF3wAIKFVhHgJYPevSWBsyQGKZK6fl1wyX4R1AIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rK9UdBRpMcj5F+7/LRJjAP6LqNowDlFNbXEPtu5nRwk=;
 b=FGW+1smlUPo6p/WZwMxpxVZN7l4PV8zHck73DXw3irrAj4Rv7kWvrJvKA9h2d2/5RRUef8V3mXYqsKaUB29RtcN4Q5zNBefBhKve/qRZH7kyfXRJaX+e5x5V2TrWNE6OkrM1/gw7YtXtblK0oBVaGwncTaxblA0mG2A1/CmYW9rfcfhKtvqDcTP0RswfZ2eS4zkA7Wc55NUmg0e1t7YhJfZqZ2xOvdJyiCkwon8oeTL0p0yTOLH8GL9Of4Cnoj8JrwvaXVfvigWYh5Kf0ib5RPMSM64Wp4HuH8MjQGLyKbX3sy0j2k80MEOQgjgggSkeuIgdIttgWLX3MJdMoh/xng==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB7991.eurprd04.prod.outlook.com (2603:10a6:20b:289::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.20; Sat, 25 Jan
 2025 01:00:05 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8377.009; Sat, 25 Jan 2025
 01:00:05 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Sudeep Holla
	<sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [PATCH 0/5] firmware: scmi/imx: Add i.MX95 LMM/CPU Protocol
Thread-Topic: [PATCH 0/5] firmware: scmi/imx: Add i.MX95 LMM/CPU Protocol
Thread-Index: AQHbbBZjcHLLf8FX10So5eTusHGTcbMmr7wg
Date: Sat, 25 Jan 2025 01:00:05 +0000
Message-ID:
 <PAXPR04MB8459AE8FDBEA8B1E979A36D888E22@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250121-imx-lmm-cpu-v1-0-0eab7e073e4e@nxp.com>
In-Reply-To: <20250121-imx-lmm-cpu-v1-0-0eab7e073e4e@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AS8PR04MB7991:EE_
x-ms-office365-filtering-correlation-id: 17991939-eb66-4bef-6c80-08dd3cdb9b1b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eFk0YmtmWEpxWEg5a3U5Z3ZNelMydWZreExyaUpTYlV1NWxOdkIycHdlclZ4?=
 =?utf-8?B?eXpjblBUa3ZOYXE0SjY1SjRpaThua0VaREx1bnFlMDRTNHlBOUxjMWp6ZWZO?=
 =?utf-8?B?S2JXdUE2bjkxN3VDaDdkTUNpKzRIYUE5d3EydG1CWUFhK3h1RGtycFdPd3NE?=
 =?utf-8?B?Qm15blpOVXRmZ2Y5ME9rRld6a3U2RitibjhxOEkxNm9hOEpiZzROOXRHSjA4?=
 =?utf-8?B?Qm4rVmgyeFRha1VRZ3FBOFFPZ2U1ZHhUMFV3VnBLdHYrYUxteHAyTXpYL2FJ?=
 =?utf-8?B?ODdONDhnbnRPSUN1bE9RSWFWaUV4UWhUTTRmazU5ZkVkaXgzdklkaXU0bG5F?=
 =?utf-8?B?WC81V1BoMXY1TnZ6MVU2bzZHb1FFcDFKYWg5bjEzOGt5VnN0ZXFrNEVFM0FX?=
 =?utf-8?B?aXQ1U25zY3M3WG91T2dWQjZTVTBkdFJMMzkzdE1ySk1QTmNzcmc4azcwdUh4?=
 =?utf-8?B?eGE3T1FGTm4xSHFINDZXeDg0N28rRDdLZjkvU212K094VzYzRHVnRk5yTFhK?=
 =?utf-8?B?RlRBTmlYMlJLeU5HVDg5Y1p1TEJBb0tlMjA5VzJMcDVCQ2pET1dMbjcxUlNq?=
 =?utf-8?B?Zm92K2ZUdGV5UENlaUZ6SkNOTjZBUEZHT1FNWjA3SWQ3N0ZXNERXUFpLZ0hO?=
 =?utf-8?B?SmpWOEorRjF2RnMxYnNFbitKUVVJNXNSUVVLT0xYZjhCNDVjSjVUYVpIS2hZ?=
 =?utf-8?B?bXhoL1J1bFNBaGgwU3craUhJbE9ySXM3b2VmRTl1K3o1dnBOemExNVRNNDhX?=
 =?utf-8?B?RGZGa3JJOXBoeWRJQlAxem1kV081cktFa3dPSDZWWGtMYUI5SHB0aE8vRktk?=
 =?utf-8?B?MzFsU2ZubU8xQjRDYVpNOWZqUjZoU2wweWtUN3Ntb2RlL2RtL1MrRWt5V2FQ?=
 =?utf-8?B?bnNETGpSeFRUY0VSTW9hZlVVN1ZzcG9HZ01OZmhjb3NQYUIzRkpBOUI3WU5K?=
 =?utf-8?B?L0t6NEZPZ1lXWWJXUVRpcm9BNkxvakxWd293ZzJYTWdoYlc1UzA3RXR4cTBY?=
 =?utf-8?B?YjRvSCtHWkZ2eWhVSjVTSW82bUJPL0hVV0dCMzFYMDNqRWlRRGt5OFVudlBP?=
 =?utf-8?B?dUxKV2xZeThoamNzVHpFaGdRc29iOXJ4YVBoUEFCN3JoazhKeHVoOHV0ck5Q?=
 =?utf-8?B?cGMwTHFqQkYxczNWcVU1K3h6RjQ0Umc4dUljUFo2bFUybXBPSG5QSXEybkYz?=
 =?utf-8?B?c21sYUFVRlBjTDduOUpvM0l5eUVYaC9FQy9IYnZWc05CaTltbzQ0RWZxTkky?=
 =?utf-8?B?cDVRdkE5d2pOejh1eE85dlVYZ0lOZ0pjMlBOMUlLNWlBOTJjM0VVZENjZ3pr?=
 =?utf-8?B?aHBBWmhOR0kvdVdUaHpWdWZVU1B2OHhxTnRYZzA3YUdNLzk4VVYxc1hpcHlY?=
 =?utf-8?B?VXNWL0ZtVlVrUytKend5eE9Ub0tDWkUyKzBHVW9aTm1BZ0svenFXZFBWVFNP?=
 =?utf-8?B?SDdDdXVKS0FNZkxENTN4OTdLTWU5Y2d0VDZ6Nm5HWXNXRHgzbnlwbFZCTTRn?=
 =?utf-8?B?b01iV1JxR0dBMnA1NFZkamtGcGpYUG12cVZsUlNkTHJMUGdMZjVsQkR0dGRy?=
 =?utf-8?B?TVU5b1F3VG1OUms2b3JNRW9Gck1aU21sUTRzdkQ1OG14Wjc1dldtdGZFaXhS?=
 =?utf-8?B?S3hkUVgyUUFnKzY4RFZsOVBZS1NnWFFvR3BPOUw4S2o0eFQzTWhGdTMwbExT?=
 =?utf-8?B?SncxSUhyYVdtTnJKWU1oU20rczBBbEdoWm1Ub2Z5Q3hNSkJ1U3V5VnVnR0M0?=
 =?utf-8?B?UmE3aHZ5cmwzS1dSRDJ2RnpiSVJ4RXhJeGQyanVTUXU4NlZ4SzZpcW5XUDVx?=
 =?utf-8?B?MnlMM0M5czZXWmVVckVuVXVwN3M1NVJLam5WcHBkODlXZ2pFdHl1OGdKVTlx?=
 =?utf-8?B?Q3YwbmwyUVJiTTkxdzRXT3dUOENHQ2k0dVArMGRZS2N2a29tRk5CanVQcVpP?=
 =?utf-8?Q?xff3XfqBXya1x2qJ+6Ep4+3CO197Yn+y?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aWJRTzVhOXo3UllzV2VBMHFXbklud1RIRFl0WFJiNnF4YTN1Y2hla2xmbFhi?=
 =?utf-8?B?U2Y0RDJJM3UxNEx1N0hyN29YL0hHRGpzTzFENVJEUktkbjVxVHdTYTJpYzdT?=
 =?utf-8?B?S1hSYnBlckd3SUlLWWozaVBnUC8wZUFyc2pzNGlzZVhOQWRsRnc2RFF0RVdL?=
 =?utf-8?B?UWRHQUg3MklybGJ1RVp6VENFbCtrNDR4ck41WHpMWlk1cjh3QitCcFlSVmZo?=
 =?utf-8?B?c2ZMc1ZSZm5MUmpub3o2L3AwRVB1NmN0UXZEMUZNMWxWclNNRFFRajhQMGVY?=
 =?utf-8?B?R3BSWkpYYUUwY1FYbVRvVTJmcFUyUTlYL3lrUzZacUNxODRMcnkrSFFGNjlh?=
 =?utf-8?B?YVMxOU93T2o2aVJsVWtqOFNVZE9nd1JFRFJJTzRNUVpCL0liVEJTRG5DUCtR?=
 =?utf-8?B?aERUeHJyNCtlRFdMRlRBMUJxdFN5TUc3V1R4d1YwNjlqaWgwNlQ0aUZ5a0NS?=
 =?utf-8?B?U3hIL25YSVdGeVlyd3IwQ0NuRVJFUk03Q0tDdkZzcyt3c1VSdUdLUnBZRHU4?=
 =?utf-8?B?OUtLWlFUc0YxMVduTEFtbUliV0xzZmFyTjFiV2tYcDQzTEswRmhkdnZGOFM0?=
 =?utf-8?B?SFFVaU9nalF0TktuaXg5REJtMG5lVWErczJwcUxFSW5DakFKL2VBdnF1NDF3?=
 =?utf-8?B?RzVBT1FGcTJxQ2FKZ2xpN3QwY0gwckZlSkFHNjcxWU55U2dQVXhpMWVyY0Fo?=
 =?utf-8?B?bEpEUkswMEo5R1MzUkJlRTlYL0RJMGRlWnhSV3F6MXRKSnBQNXBRNVdob2lY?=
 =?utf-8?B?NDRZeUEzZEdyUU5lcTAvUW9ka2ZiQ0dLY2FyZE9FUmFnQ3ZKR2RhOENHUXpn?=
 =?utf-8?B?dWhlSHV1Sk50TkhOZ1dxU2JXTEdBM1hKeHFBOEQwenVVd0JsSXlPcXZqNmFX?=
 =?utf-8?B?TXkzaXFQa2gvbmo5cnlPUk9GU0tTRk91TUJsQXM1MUh0bFd0aExwMWJGNW5u?=
 =?utf-8?B?VUpyTGlFdmdkdnRXMThEUkxwSVBOclpGVlRCaG53ZG11UDV4Y2dwcjYwdDFZ?=
 =?utf-8?B?UVRSNG44M0R3NlA1NEN4MFBiK0o4Q3kyZk80dythZjZrQWl2QTRJWmJnemdz?=
 =?utf-8?B?UnQyc0lreVRVU2oralhRWEF4YkRNSlJ1bEp5S2JrTlYrdzdQSnZRVTVCNnds?=
 =?utf-8?B?alVHNGZXdXBwU1d4VTB3VjFaa1BsR3RoMXU2N3pkNGNsWXVjQjh0SlNlV2sx?=
 =?utf-8?B?UWdBcitoRFppMUJtVGlHelZYL05KRnJIZkpFeGpFUmNyem53RU9PbFluNDhx?=
 =?utf-8?B?VmU4eUttb1l3eXlFaDVnVW43QjUxWkkvMmJwZVhCMk4reWVCWHo1UVYzdWxS?=
 =?utf-8?B?c3pkd1BPQStpNHVpa3c1eUZWZ2ZYMXRsR3pKa05IdE1ZWWJ6Qm5iZkRrc3dY?=
 =?utf-8?B?eXVRcE5kWitzUlMyZVpRZ1FFOU1hRG5uOXBiYWM0ZHBWb3djRi9XeTlMa3FN?=
 =?utf-8?B?ZE8xSlR5anF3VWd2OW9xbm5rR3RwVVZ6anlyNDRkNGN3NHQ2TW5UMkpJSmlm?=
 =?utf-8?B?U25FNUhERGd0WFBNWm1tbXpWM2ZjcnV0UkZsVEpXc1ZSZXFhY1lyV0U5b1or?=
 =?utf-8?B?SisxeWRTK21VQWZ2Q2NmOEpFa2U5T1kyaFRoaUM0dTlKQzNyNmNLOXIxem9T?=
 =?utf-8?B?bFRqNFZRYWFqcWRYNEdaZ1d2V0NON2N5QVlxTHBUejNaWnNrK1F1QXh2RWVO?=
 =?utf-8?B?ZWN5b3ROcnpNNTEvelcyUFFvZDVYZ1h6TnNYMlFMVlVmSlZDTm53cUJwRnYw?=
 =?utf-8?B?a0ZiZm1JTVcvbm82YzlHVGVJOXRHY240Snc1bzBHTmtQd0p1NVpJK1lFT0U4?=
 =?utf-8?B?SkFybndKQ29zUXdway85ODkxZllsSFRpYUVlV1VqVVdrdGtldFZvL29PS0du?=
 =?utf-8?B?dmY4MEt0bVpRQ3FxY3dIeVRQUmdKQVZCSFZqVHBJL05zVXdjUEs1eEVpRWJ1?=
 =?utf-8?B?K0RaanJ0bldVMVg3SC9sMnZRR3JkOEQ4T05IeXdUYTNDeW5hTlVEZzk0MHk4?=
 =?utf-8?B?QWdFSElFSUppczNsa2RaeEsrWWx1QWNWWGM0NnU5RWlBU1BCQTQzMUNwMVZ3?=
 =?utf-8?B?SkpCMS9hN0xhOHJISmdUSGFxcW5SVWVETmhxdDZ4MC80V2w5dmEwa2ZRZ2dO?=
 =?utf-8?Q?AkRw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17991939-eb66-4bef-6c80-08dd3cdb9b1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2025 01:00:05.3706
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TUomKm/QhEmwdskHG8esYfGlFF5uzXR1vc1nnv3bqmuNO6PNO3BcHSjdf64O7e1ltZFZHM0DR4iY08NzU3+aYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7991

PiBTdWJqZWN0OiBbUEFUQ0ggMC81XSBmaXJtd2FyZTogc2NtaS9pbXg6IEFkZCBpLk1YOTUgTE1N
L0NQVQ0KPiBQcm90b2NvbA0KDQpKdXN0IGxldCB5b3Uga25vdywgb3VyIFNNIGhhcyBhIG5ldyBJ
RCBMTU1fUkVTRVRfVkVDVE9SX1NFVA0KaW4gTlhQIGRldiBicmFuY2gsIHRoYXQgSSBvdmVybG9v
a2VkIHdoZW4gSSBkZXZlbG9wZWQgdGhpcyBwYXRjaA0Kc2V0IHVzaW5nIG1hc3RlciBicmFuY2gu
DQoNCkkgd2lsbCBpbmNsdWRlIGl0IGluIHYyIGxhdGVyLg0KDQpUaGFua3MsDQpQZW5nLg0KDQo+
IA0KPiBpLk1YOTUgU3lzdGVtIE1hbmFnZXIoU00pIGltcGxlbWVudHMgTG9naWNhbCBNYWNoaW5l
DQo+IE1hbmFnZW1lbnQoTE1NKSBhbmQgQ1BVIHByb3RvY29sIHRvIG1hbmFnZSBMb2dpY2FsIE1h
Y2hpbmUoTE0pDQo+IGFuZCBDUFVzKGVnLCBNNykuDQo+IA0KPiBUbyBtYW5hZ2UgTTcgaW4gYSBz
ZXBhcmF0ZSBMTSBvciBpbiBzYW1lIExNIGFzIExpbnV4IGl0c2VsZi4gTE1NDQo+IEFQSXMgYW5k
IENQVSBBUElzIGFyZSBuZWVkZWQuDQo+IA0KPiBXaGVuIE03IGlzIGluIExNICdsbS1tNycsIGFu
ZCB0aGlzIExNIGlzIG1hbmFnYWJsZSBieSAnbGludXgtbG0nLA0KPiBsaW51eCBjb3VsZCB1c2Ug
TE1NX0JPT1QsIExNTV9TSFVURE9XTiBhbmQgZXRjIHRvIG1hbmFnZQ0KPiAnbG0tbTcnLg0KPiAN
Cj4gSWYgaW4gc2FtZSBMTSwgdXNlIENQVV9TVEFSVCwgQ1BVX1NUT1AsIENQVV9SRVNFVF9WRUNU
T1JfU0VUDQo+IGFuZCBldGMgdG8gbWFuYWdlIE03Lg0KPiANCj4gQm90aCBMTU0vQ1BVIEFQSXMg
d2lsbCBiZSB1c2VkIGJ5IHJlbW90ZXByb2MgZHJpdmVyLiBUaGUNCj4gcmVtb3RlcHJvYyBwYXRj
aHNldCB3aWxsIGJlIHBvc3RlZCBvdXQgYWZ0ZXIgdGhpcyBwYXRjaHNldCBnZXRzDQo+IHJldmll
d2VkIG9yIGluIGdvb2Qgc2hhcGUgcGVyIE1haXRhaW5lcidzIHZpZXcuDQo+IA0KPiBCdWlsZCBw
YXNzIHdpdGggQ09NUElMRV9URVNUDQo+IFRlc3RlZCB3aXRoIHJlbW90ZXByb2Mgb24gaS5NWDk1
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4NCj4gLS0t
DQo+IFBlbmcgRmFuICg1KToNCj4gICAgICAgZmlybXdhcmU6IGFybV9zY21pOiBpbXg6IEFkZCBp
Lk1YOTUgTE1NIHByb3RvY29sDQo+ICAgICAgIGZpcm13YXJlOiBhcm1fc2NtaTogaW14OiBBZGQg
aS5NWDk1IENQVSBQcm90b2NvbA0KPiAgICAgICBmaXJtd2FyZTogYXJtX3NjbWk6IGlteDogQWRk
IExNTSBhbmQgQ1BVIGRvY3VtZW50YXRpb24NCj4gICAgICAgZmlybXdhcmU6IGlteDogQWRkIGku
TVg5NSBTQ01JIExNTSBkcml2ZXINCj4gICAgICAgZmlybXdhcmU6IGlteDogQWRkIGkuTVg5NSBT
Q01JIENQVSBkcml2ZXINCj4gDQo+ICBkcml2ZXJzL2Zpcm13YXJlL2FybV9zY21pL3ZlbmRvcnMv
aW14L0tjb25maWcgICAgICB8ICAyMiArDQo+ICBkcml2ZXJzL2Zpcm13YXJlL2FybV9zY21pL3Zl
bmRvcnMvaW14L01ha2VmaWxlICAgICB8ICAgMiArDQo+ICBkcml2ZXJzL2Zpcm13YXJlL2FybV9z
Y21pL3ZlbmRvcnMvaW14L2lteC1zbS1jcHUuYyB8IDI4Mw0KPiArKysrKysrKysgIGRyaXZlcnMv
ZmlybXdhcmUvYXJtX3NjbWkvdmVuZG9ycy9pbXgvaW14LXNtLWxtbS5jIHwNCj4gMjM1ICsrKysr
KysNCj4gIGRyaXZlcnMvZmlybXdhcmUvYXJtX3NjbWkvdmVuZG9ycy9pbXgvaW14OTUucnN0ICAg
IHwgNjkyDQo+ICsrKysrKysrKysrKysrKysrKysrKw0KPiAgZHJpdmVycy9maXJtd2FyZS9pbXgv
S2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgfCAgMjIgKw0KPiAgZHJpdmVycy9maXJtd2Fy
ZS9pbXgvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKw0KPiAgZHJpdmVycy9m
aXJtd2FyZS9pbXgvc20tY3B1LmMgICAgICAgICAgICAgICAgICAgICAgfCAgOTEgKysrDQo+ICBk
cml2ZXJzL2Zpcm13YXJlL2lteC9zbS1sbW0uYyAgICAgICAgICAgICAgICAgICAgICB8ICA4OSAr
KysNCj4gIGluY2x1ZGUvbGludXgvZmlybXdhcmUvaW14L3NtLmggICAgICAgICAgICAgICAgICAg
IHwgIDU2ICsrDQo+ICBpbmNsdWRlL2xpbnV4L3NjbWlfaW14X3Byb3RvY29sLmggICAgICAgICAg
ICAgICAgICB8ICAzOSArKw0KPiAgMTEgZmlsZXMgY2hhbmdlZCwgMTUzMyBpbnNlcnRpb25zKCsp
DQo+IC0tLQ0KPiBiYXNlLWNvbW1pdDogMDkwN2U3ZmIzNTc1NjQ2NGFhMzRjMzVkNmFiYjAyOTk4
NDE4MTY0Yg0KPiBjaGFuZ2UtaWQ6IDIwMjUwMTIwLWlteC1sbW0tY3B1LTQxOGRhYWEyNTdlMg0K
PiANCj4gQmVzdCByZWdhcmRzLA0KPiAtLQ0KPiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4N
Cg0K
