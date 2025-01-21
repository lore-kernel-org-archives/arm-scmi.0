Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2043.outbound.protection.outlook.com [40.107.105.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353191F4E3A;
	Tue, 21 Jan 2025 15:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737472156; cv=fail; b=bl8Tw30EiykXLmUAHW1KLhdbPy0wSNyzTUa3yfiRN6Hmj2vQ8clFkWXpbcv0rX2rXDnw8N31QKJPQkizjQwYpt207ZwpKA2jnJbBjElJ5xqTB7EuYbi50Dt83KhX3V2PedCn2RhKRKLYaAACYGHAoyzkQ8LctT610X4OXNLlyuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737472156; c=relaxed/simple;
	bh=zFM5EZlhecv3PEUXzYkgnc2uhCHaDA+0hhH4EngkZCE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=q2feywdhcqa+ysIXxgxkH497Memvl50ckGl1H7hq8ES+F9b40jH4qKas7kzZxsWmblO24ZLiois7RdVRTbrQcHX27L36hEMExZny8UIXlCalJLd+IbPPpUzVlUcnz1R5CTlVgaiy/+vrtc/Qj+EEGGLFrFEON9kE4RbC019Ta80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nqrFbHHV; arc=fail smtp.client-ip=40.107.105.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nqrFbHHV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v3SdggGsVrDOonn8opsUfI1wFoubg2qDdbqXsX27hDzSeRzGfPesrIv5KC2hqT4fiZ3trpw5/qDskND4NaZpkcuGJX/o1dkXgvGMCqGX4uSOYNHV1Zv5GvgJuARDqFZbEk9o4i5OPFYp/hHQLbtKYoDxUhMxtwWM676w6Gn1H4/Z/Wj5zVCPszb0kY7NSqY+ZAqUB7psQsEye13IZbTbahmc9p1rCfnPCd1sDUVflG67q7XcWQH3L0zKht5hDHar5k1DdifBWOkA6wjz3pZrjcuPaqZLWQnxv6CCmjzDjJRZ/vKMpAOfsM2dEarq008EZodA1tcG6AxToGtwM47kdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wjc0oQ/xhCGWnB7fIEBzQc2hN9xjk1NDtcDqPN1XjRM=;
 b=KY7OIfymePJEVt+niu6sJ8SoUuji4qR2u3I0pNgzO2kxcDJrbCTWltZeT3IX6T67qPm0boQ5zoPOeiqrL1GdvvvMyExQrwmcmt1DXCe6A2wFkweXfabXUojpVa5hK9nClWTEwJ46/q8e8se2ZxyLX5NfZ9FaiL+cNf6Db8CqopxAvKDpoUex8R1JfCX5D63C3vrNIwtzRgKeEz4bXAOJLlq+eS+n9APk8+HadTyiBWqvs8K8MSuo1vDJOjYxWDz+/htWRGdvHuYAaq/TEw7/2F1RA6Og37x6C/3R3tZRFv+BW3t4hyGvxgpDdb+r3y3PA2+6cjIzDQ1brlrzs2/4/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wjc0oQ/xhCGWnB7fIEBzQc2hN9xjk1NDtcDqPN1XjRM=;
 b=nqrFbHHVHYiJkYrCHZLys2bHbCAjIE9/YeZlqLmCjze61Wi7jTDKvDz/E3BSquyvW0oIrxepUdPhRN6fn3YZb+Fp3gDpiTphUMMbk2q/9G/bmf7Vy05/vPXtlNdsQzqkUDcEznqYsuWnvK9nCxjegrpau+eYsttIFLX3LpCkQAyrRLtntKXCNch8WyMmrw2HDhKExt6UkjJjdqn7keET1g7DBJzAkjkfSuTMfs5m/sovGTYgC+ezMnRg8/stH4akeDkK+tOYbjZi9oTEwYj+FKinoVjYn17HkkvQVP7eblUrqVAbxgdb8K9br7JbB898BX8GJNBN3T42cX09li6VDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM8PR04MB7891.eurprd04.prod.outlook.com (2603:10a6:20b:237::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Tue, 21 Jan
 2025 15:09:12 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 15:09:12 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 21 Jan 2025 23:08:15 +0800
Subject: [PATCH 5/5] firmware: imx: Add i.MX95 SCMI CPU driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-imx-lmm-cpu-v1-5-0eab7e073e4e@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737472103; l=5658;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=LE4iOrB9OtD+h22ygNfRqzjPFijIpsANyO5ImCS2MNw=;
 b=Ril7/DStIucNVCnAZszERCRMF/7uSJdcvF/ThHhms1ALU0ZvDiSwnI2fy+SgQmAysQYBdlPMw
 UE1j0WPGyKNCiKd9gan2MhsfPNfpf5rdUYOGbkhj9YnGJ/P624cR1zZ
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM8PR04MB7891:EE_
X-MS-Office365-Filtering-Correlation-Id: fe12ba85-3a79-4476-7f45-08dd3a2d9008
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YTZpNGxxdXBhVDl0enk3dHp0Y3JUaEVhYTZmc0pFWkxCRmZ3MVliZ2pHTTBJ?=
 =?utf-8?B?OExrMDRqajFJdmkweG4rTE9SSGRSRkJaYkt1enVqOE83ZXJudVhja25XSy9i?=
 =?utf-8?B?WFR0SE1jQUx4M0VJclgrWEZIeElkVE12NjdnaVJSd1BZYUZOUjdkQlNDb1ky?=
 =?utf-8?B?K1RMc0ZoSUg2S2pEMXZidTE5a0Q0UFhPZ3kwNG0zOHg2TWdpdngrZ0RUSU51?=
 =?utf-8?B?dSs0T0daSFlNSlVpYnEwMU1xKzJrVXhlbmQrNkUrYjBpNFEyaURaMFgyNDBz?=
 =?utf-8?B?T3VheDdDaU5Pa3hyb3h3T3JTRzR6TVZWRTVrRXVCN1NJRjhIazdTYzJxQU10?=
 =?utf-8?B?U241WS91M1pZVFM3V2o0VGVEVFNzRkczY3ZWb3RwUDhLVW1pNzBMYnU3M21a?=
 =?utf-8?B?eldqaTZJdnFyVzF0Nzd1cnRmWG56ZU0rRUpiWHl2emMxeFNHSEpncHFhaDYx?=
 =?utf-8?B?T3JZSzR5bkRyWVBtSXdldU1mbzN4aUdzSVhGUEtDTGZLS09mc21GWUJOazQr?=
 =?utf-8?B?eWlQUE03ekY0NHFnZjZSV0dkMEY4bS9Tak9MaG1FQ2lQR2FRS2VUb2lmY05a?=
 =?utf-8?B?dFNSNGRLcEN2M1BWSVpENTZoK0dkdXdOeUFlWGdVK0tEdWprTU8wV2tKSUVD?=
 =?utf-8?B?SlNlUUhWdGd4VGh3U1kzcitYbzBSQ25mMVhTS2paN1AyNDNaVUpQR25OSk5v?=
 =?utf-8?B?bXM3cklGSWxkb2JIUmNaYWJLT0xkVEltTjdSWktFUXZzdGtLaC96dElWc00r?=
 =?utf-8?B?dHQxNFJja2pmOVRGajNVejBwYVJ6cFh6Slp5aXlreUNqZ1d4cFJ1VE9vdWpx?=
 =?utf-8?B?SFN6WUUxUzRSd1B5d0pHelpINDNyUjFCMEJhNzRLbU05c0R3a1pRK3FZcnlM?=
 =?utf-8?B?M3hRY2FHTEMzNE81YjdDdzhtaHFpRUJDKzlJcTY3WmNGYS9xQ0Fxb3dwUkhh?=
 =?utf-8?B?TTVyYXNLcW5mL3Rvc3V6S1FOd01tVTNnNEdtY3g3SGkvZFZ4Uk1qaXdWcHpH?=
 =?utf-8?B?MndSS0xFMk8rZzZtUytTdld5RVpPYkMzVXNOQVlndFRqdFpNWlpxNGdydlZN?=
 =?utf-8?B?RWUvWElXa1JMdFY2Ui9NeU5PbitGazR4VzdHdWU0NmwvWGhCZ2FiTDBxdnNJ?=
 =?utf-8?B?dWhLaHNGTGxkenRteWwvd2haVjlBb3Fzb1V1Smk5WkpQVkpLWmJLOWpkQXJS?=
 =?utf-8?B?Um5NRVBGTE9KYVJHMlg4UTJWV0lHd1NhSDgzU3RNSlVCS0c2eFlMYy9PUXZr?=
 =?utf-8?B?WEZmaTc4L1RPMVQvclFueHB3cHV4VGJ5TWFkN0w1L2VpVDAzckdpUXVkdjVa?=
 =?utf-8?B?SXdnUkx5V0plajRvbFN5Y1FiRkNXYWJ0S3QxZ08va2VxbWVySUViWWdna1o3?=
 =?utf-8?B?R0NMMXNlcWM5L0lNUmI3TzJNZnZUdFhCOUh5RFExL1NYdTVrSTlsc0Fqd2Nr?=
 =?utf-8?B?bGJaVzRQNkxvdWJTNGtmNmtmSmI1NE5tc3RhZnRlZTRrbDFGaEN1SkpJNjAv?=
 =?utf-8?B?T3YxcHo2TDdGelo3Q0dac1laLyszWmxhR2t3WDJyd3FFOFI0MUFidDJzRWNn?=
 =?utf-8?B?Q1gwd3RuLzBvenZuNEVBbFRONEthQURQZW1lajlGdXp2blB4bWYxQ0Y1Vm0v?=
 =?utf-8?B?VTBQYkc0V3pHNTlXWjBMMGdxVFFKK0hFVy8yNFlVdTJKRmN6cDd6czZKZ3Zu?=
 =?utf-8?B?bGJTLzNvVEx0MFZOcy81WStXT1ZEVkV3Rk1kV2pyaGFSaUtGeEpPVUhMQkx5?=
 =?utf-8?B?Q2dyTTh4UDJDWTViczhMdlhQRlZNYjRBbUk2WTJubHZiLzBuUWZ6UDBEQnl5?=
 =?utf-8?B?bE5FR1NBNGtDOXRGTm1XZDdlaWdEb0VMUVpEdWtLSXJmdmJUTFRUVTQ5RTdO?=
 =?utf-8?B?dEFEQ0g1R1RRMFkzQTg2MGpmOGwrZm1FYUN3OHZON201Y1VkNlEzZy9wbDVD?=
 =?utf-8?Q?fmF+Bh6lS30XRgzgbs+sQeX1fr7+n+Ca?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUR3d1o0RDBIeUh1OFY3ZERzYVFQZkJpMG5Ca1dpMDVrS1dINXowSzRNYlF6?=
 =?utf-8?B?V01hN1c0M1NBa0s1TUY5RGt4MHpSYXBmR21kbzNpYW15K0l1L1BpNzFYUHN0?=
 =?utf-8?B?MmJpelU3akhDMk1rbEZVTG9JZXIwR2RDaXloekV3UXRyVWx1Tm1FMktCc25C?=
 =?utf-8?B?ZzRYek1mWk1YOWtyZjBDSHA4VWZDWGxsL3I5OFFHS0dMTkZkbXNsT3RIV3Qv?=
 =?utf-8?B?LzFXVWFtTmx3SWxBVWNDa3BWTlk4OUNCcU43eXFtcmFGSEZlSzVJNE9FQ1JG?=
 =?utf-8?B?eDcrbk43V2dOdFY4T1NoWEtrcXRKTGVQSjdzUDF3eGEwck5QZHduVVljZ3ZK?=
 =?utf-8?B?SkQ2c2RvYzY3QjdlbExpZy9XVlJpTWlvSnpkQ3pJMFZGeTROQ1Z2VEpzOUZS?=
 =?utf-8?B?c1c3MWwxeXhURE5ZMnNITFdSaFdQMVRsZlY0YUlWL3VxWkQyRkxNeDhKL09y?=
 =?utf-8?B?RWlWSi9aR1VlMzFNRkJOd29RTUw4bEZqaHE0ck8vc3VadU5SQmJzODlCV3dJ?=
 =?utf-8?B?dGRsUVFJeDV3cWVqeXJLMFpxbFRpUllyTWt2TzFsY3YxaDdGMGtOODhTaUlB?=
 =?utf-8?B?WnVTSGZXZVVJM2JYTk40ZG9RMTliSzcxaVZBSUhhUjlLMlg2UXZ6Qm5Ball6?=
 =?utf-8?B?RkVpWHhYSFJnWnVWK0J6TVgzREVWdktNV3psMUx6YUFOMFJFVnRoV2VjVWcv?=
 =?utf-8?B?QjUyMW0waWtheGFzelJ1b01VSTUwemx5eUpPUTFGTXlLQjVzL2c0WVZmTW1W?=
 =?utf-8?B?VVpMRURWZG1hSWRvMVhOdFRQWGFYNTVaL0RtVEtEQmx2RWFaRFJLcHduOFBU?=
 =?utf-8?B?Y0VHQTdBZGxQUGdIbHpCSlN1Ulc2SUZUYXlTMllaRk5JdDVoNU81U1lHQ2pR?=
 =?utf-8?B?dE5OcUtZeFZXbGw3aVNGbmpCdnJ1SHB1bVl2SlowN0RlWGVjYW1tZW1jUmdj?=
 =?utf-8?B?R25WdzdpMlBqRUo2UnJkbFUxeS9KTjMyRGtoUmhDNEtPajJzVlZWZmM5REdF?=
 =?utf-8?B?Uk0xN0VEWlJkSldiWlBhN3EvK2l5NzJtOENLWjBiblI0OHo4UmZLMW9yem41?=
 =?utf-8?B?NkxVblJjZHMxSHhYYzd1bkVIb0FlVmNPUEp0eWs2eTBVNWVLYnlualdmaDdl?=
 =?utf-8?B?b1JvVHlnV3J4cHRzUWFiUElua3o1UU85bk5yRjNRWXdOT21XQVdiVmczM0s1?=
 =?utf-8?B?aHBPZ2VkSnhzTmxlQW1oRXRNR1BaZTRGcEFyK0x5b05nUkFSM0xYTTBKaXRH?=
 =?utf-8?B?MkxOUGtnbXhwb1ZvS1c3Rzd6c1hINXBLUWNvSVNDN2tCcERhMEU1My9KQjUx?=
 =?utf-8?B?b1pQZk8wbUxoR2tTaUJjbmpDbmlOQmFJQ2pxc3lwUisrYUpZU3dKTGkyMVFR?=
 =?utf-8?B?Y05LRDdPQThlMUJHZUFuZklhZmlNTEpGTTNkakhwcW80WWpRbWdZZUpsMWxI?=
 =?utf-8?B?eG0vK1VuYURjZ1lzdW5YdVNXYU1GdVluWGpKUzdHeXltVGpVc2Q3cnZjZ1p6?=
 =?utf-8?B?UWJ4MjFKMzkwbnlsaVZRUHJWeWxtdGIrWjN4Um5OOUovK0tCb0hjLzFwVlJM?=
 =?utf-8?B?NWRHOXd3SXJsd0pkeUp4Nm9odXAvV3NmWHU2OXV1SUFQcW1IMURrblp1eCs1?=
 =?utf-8?B?RWxSdUx4Zjc4Z3lwYUpkM2EySTR0aHIyeTUxVnlQc2M4MFJ4SW1DWVNud0dE?=
 =?utf-8?B?c29sV0ZpaDRCRXM4WmxhRWRzZ2l1SU9ZVE9odmJqY1p0VDIzdldYOTUrU3pG?=
 =?utf-8?B?WVZFKzhERXUwdXhVL2E5aFhGSG5wZW5lRkdlYkVRYWt2VlBvMTJiWkE0Nkxy?=
 =?utf-8?B?UjdGMTF4ejZRallQeFFrNGZFMzBxdHdSTjdod0c5alc5cTF4Q1EzL3FOby9s?=
 =?utf-8?B?ZFAvdS9ZaVZ3YXRwTUFZWlJBa1Rqb1luZE5HemZSQ3NQTTBmaGFwdVduT0tO?=
 =?utf-8?B?eTdIbWxzeXhEL3gycURlZFlrOVpOamM3QldiWGdReG5GUlpEczhpaDlhYUNK?=
 =?utf-8?B?MElxQzQvRzF6STBtaS9UbEJTOUZkdTJjcHdHNnpqRlRVTWxFeWlib1luelQr?=
 =?utf-8?B?M3l1TVJ6SFRXbEZJeVVqK29kNG4zeHI5bGtheXJLMm5TMkJsaHN3VHNNcXll?=
 =?utf-8?Q?kUlj+m0UD2WmASdUVawe5VUd6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe12ba85-3a79-4476-7f45-08dd3a2d9008
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 15:09:12.1986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nlMF+YVa4VX0ExoIU2CIaxWwLdRWufRY57QDrMh5iSZmIRCsNlwHa7OG9T6j1g5KRr62lpz9jkGiF6mFQTf5Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7891

From: Peng Fan <peng.fan@nxp.com>

The i.MX95 System manager exports SCMI CPU protocol for linux to manage
cpu cores. The driver is to use the cpu Protocol interface to
start, stop a cpu cores (eg, M7).

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/imx/Kconfig    | 11 +++++
 drivers/firmware/imx/Makefile   |  1 +
 drivers/firmware/imx/sm-cpu.c   | 91 +++++++++++++++++++++++++++++++++++++++++
 include/linux/firmware/imx/sm.h | 29 +++++++++++++
 4 files changed, 132 insertions(+)

diff --git a/drivers/firmware/imx/Kconfig b/drivers/firmware/imx/Kconfig
index c3e344d6ecc645df1f0e3ee8078934c47f347fd7..91c753921dffbe16ced8c10565d44c15b66b2797 100644
--- a/drivers/firmware/imx/Kconfig
+++ b/drivers/firmware/imx/Kconfig
@@ -23,6 +23,17 @@ config IMX_SCU
 	  This driver manages the IPC interface between host CPU and the
 	  SCU firmware running on M4.
 
+config IMX_SCMI_CPU_DRV
+	tristate "IMX SCMI CPU Protocol driver"
+	depends on IMX_SCMI_CPU_EXT || COMPILE_TEST
+	default y if ARCH_MXC
+	help
+	  The System Controller Management Interface firmware (SCMI FW) is
+	  a low-level system function which runs on a dedicated Cortex-M
+	  core that could provide cpu management features.
+
+	  This driver can also be built as a module.
+
 config IMX_SCMI_LMM_DRV
 	tristate "IMX SCMI LMM Protocol driver"
 	depends on IMX_SCMI_LMM_EXT || COMPILE_TEST
diff --git a/drivers/firmware/imx/Makefile b/drivers/firmware/imx/Makefile
index 7762855d2a771169d4f1867d27e0d51be7c9ad03..3bbaffa6e3478112638ed031375602389f18ef09 100644
--- a/drivers/firmware/imx/Makefile
+++ b/drivers/firmware/imx/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_IMX_DSP)		+= imx-dsp.o
 obj-$(CONFIG_IMX_SCU)		+= imx-scu.o misc.o imx-scu-irq.o rm.o imx-scu-soc.o
+obj-${CONFIG_IMX_SCMI_CPU_DRV}	+= sm-cpu.o
 obj-${CONFIG_IMX_SCMI_MISC_DRV}	+= sm-misc.o
 obj-${CONFIG_IMX_SCMI_LMM_DRV}	+= sm-lmm.o
diff --git a/drivers/firmware/imx/sm-cpu.c b/drivers/firmware/imx/sm-cpu.c
new file mode 100644
index 0000000000000000000000000000000000000000..1ce694a34b22843db5c1697ecb33c0479edb2ed9
--- /dev/null
+++ b/drivers/firmware/imx/sm-cpu.c
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/firmware/imx/sm.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/scmi_protocol.h>
+#include <linux/scmi_imx_protocol.h>
+
+static const struct scmi_imx_cpu_proto_ops *imx_cpu_ops;
+static struct scmi_protocol_handle *ph;
+
+int scmi_imx_cpu_reset_vector_set(u32 cpuid, u64 vector, bool start, bool boot,
+				  bool resume)
+{
+	if (!ph)
+		return -EPROBE_DEFER;
+
+	return imx_cpu_ops->cpu_reset_vector_set(ph, cpuid, vector, start,
+						 boot, resume);
+}
+EXPORT_SYMBOL(scmi_imx_cpu_reset_vector_set);
+
+int scmi_imx_cpu_start(u32 cpuid)
+{
+	if (!ph)
+		return -EPROBE_DEFER;
+
+	return imx_cpu_ops->cpu_start(ph, cpuid);
+};
+EXPORT_SYMBOL(scmi_imx_cpu_start);
+
+int scmi_imx_cpu_started(u32 cpuid, bool *started)
+{
+	if (!ph)
+		return -EPROBE_DEFER;
+
+	if (!started)
+		return -EINVAL;
+
+	return imx_cpu_ops->cpu_started(ph, cpuid, started);
+};
+EXPORT_SYMBOL(scmi_imx_cpu_started);
+
+int scmi_imx_cpu_stop(u32 cpuid)
+{
+	if (!ph)
+		return -EPROBE_DEFER;
+
+	return imx_cpu_ops->cpu_stop(ph, cpuid);
+};
+EXPORT_SYMBOL(scmi_imx_cpu_stop);
+
+static int scmi_imx_cpu_probe(struct scmi_device *sdev)
+{
+	const struct scmi_handle *handle = sdev->handle;
+
+	if (!handle)
+		return -ENODEV;
+
+	if (imx_cpu_ops) {
+		dev_err(&sdev->dev, "sm cpu already initialized\n");
+		return -EEXIST;
+	}
+
+	imx_cpu_ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_IMX_CPU, &ph);
+	if (IS_ERR(imx_cpu_ops))
+		return PTR_ERR(imx_cpu_ops);
+
+	return 0;
+}
+
+static const struct scmi_device_id scmi_id_table[] = {
+	{ SCMI_PROTOCOL_IMX_CPU, "imx-cpu" },
+	{ },
+};
+MODULE_DEVICE_TABLE(scmi, scmi_id_table);
+
+static struct scmi_driver scmi_imx_cpu_driver = {
+	.name = "scmi-imx-cpu",
+	.probe = scmi_imx_cpu_probe,
+	.id_table = scmi_id_table,
+};
+module_scmi_driver(scmi_imx_cpu_driver);
+
+MODULE_AUTHOR("Peng Fan <peng.fan@nxp.com>");
+MODULE_DESCRIPTION("IMX SM CPU driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/firmware/imx/sm.h b/include/linux/firmware/imx/sm.h
index 1e58ffaa81acd757d9e6a992a2f2df663681c08a..d12d5323cf842343e5d470b2aac01a9e4e269c30 100644
--- a/include/linux/firmware/imx/sm.h
+++ b/include/linux/firmware/imx/sm.h
@@ -21,6 +21,35 @@
 int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val);
 int scmi_imx_misc_ctrl_set(u32 id, u32 val);
 
+#if IS_ENABLED(CONFIG_IMX_SCMI_CPU_DRV) || IS_ENABLED(CONFIG_COMPILE_TEST)
+int scmi_imx_cpu_start(u32 cpuid);
+int scmi_imx_cpu_started(u32 cpuid, bool *started);
+int scmi_imx_cpu_stop(u32 cpuid);
+int scmi_imx_cpu_reset_vector_set(u32 cpuid, u64 vector, bool start, bool boot,
+				  bool resume);
+#else
+static inline int scmi_imx_cpu_start(u32 cpuid)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int scmi_imx_cpu_started(u32 cpuid, bool *started)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int scmi_imx_cpu_stop(u32 cpuid)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int scmi_imx_cpu_reset_vector_set(u32 cpuid, u64 vector,
+						bool start, bool boot, bool resume)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
 #if IS_ENABLED(CONFIG_IMX_SCMI_LMM_DRV) || IS_ENABLED(CONFIG_COMPILE_TEST)
 int scmi_imx_lmm_boot(u32 lmid);
 int scmi_imx_lmm_info(u32 lmid, struct scmi_imx_lmm_info *info);

-- 
2.37.1

