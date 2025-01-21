Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2043.outbound.protection.outlook.com [40.107.105.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6FB1F4E3F;
	Tue, 21 Jan 2025 15:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737472153; cv=fail; b=euWe8pMeYYytFD9kCBTIsvh6KD7SDfXcCglWWG6Gw71Tq5onfNFq3repT1PbYyDOsERWzkJf+iz44dS2Jkh9bK6wHaKAJcrXWWHebssH0P/1l87xDmVQPDd7XurHSB9N8OI0w/RThQJTKHGJSCfj724ey6ER9kUtcWCqxBUts+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737472153; c=relaxed/simple;
	bh=A8KFcxznUzISUtFjoYmFx7YIHgoPfid1nIeygdqZpVQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=AplgSHPq7rP+zTuo3in3Zb+0SZy0pp8aRPmWSNeJ/vdCwdtODrcWw62T7SIlwz3NVtoVp05f3OjHIoFwaAeIKeQ2kaaF5J5+A6D+FX3GvdjR9AEBjBHiFOXqGMpPGKh6ANEF+xIAWyoeRX7qIM9Gsh0kgviN6ghI78rrMcxmLhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=m4wIXf4x; arc=fail smtp.client-ip=40.107.105.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="m4wIXf4x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVmbk8n5rPV9vL5jnhhJ/GTjhu8Xr4KNNDlA0aHUVzCJ+aoZgvGh0loFawnCMRb4IgyMsHHMavSq6XmxGhhZBi98HKLPI++kGy0v31k+hlHYorXWybwfxKk/jd5NGOBlzvmBKj6daizFXmOVI0JoUjela0+CBLBZQvSxg//M4stZ6YUpeOrSnyHh3Xrb+w3yHbfK/CDtml1nMVjk/Ve0b4HvYpqxKJvjQbzfJDZb5eF9Fj49pdfVYKPq3wsOa54BzjVH71AVxe5kJkrrOsVC4DWkKU6Yo9ajv4Ouu3S6ofYauhgU/pKdk6Pz7otsaIQLuwTj2qgQAslc9r/T6v8YNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZ9i91hY2wdGGFd9lr+67VFRbzslwITiBU0BdhRV27E=;
 b=gzyad7Su0ALH5lAd51IfDVM6dJImDyJDXIkdvJGLrPzc1qwenlYEQX6N+CqHbaBxJFbRGxc5xwkoqmyQQcgB7qGzVNQGpMbG7xDjCGKgCX07IJ4iEiCiOwa3cHhbeKhA0WGF9SKjbxtruglfloI/KRVXhLsHDsBQAy0nTy3cMdF+pCkDIRlGJZsVeVQDpLEzJ5WqoqTc2HFpUI+8XRdG+yudvVwd+fBFN9l9boGMK/Ygft/6T2u6g/1R+NszBSoT1f4lhzmUMutJaAMmsyoBH5ejh3LqFlSFl7QaJiWaanldpnjV8UcbcG/UWyiC+U3m6jgNgSHRIgnMMHZDmYH+MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZ9i91hY2wdGGFd9lr+67VFRbzslwITiBU0BdhRV27E=;
 b=m4wIXf4x4i1YFca6jO0QBeXrVxz9Ai0SszbmTR/UsxuQn4EMVreHE7SBXd7AemiWmvN4v01kWP9mZnfToC9lcvZ3ykCmC2oGct+nSo7lJlqU5grOA13yeEeXXje75cSLDdhcjlnnblIkTGtEQiUMumfwYjxWkKIchJDqOhNtAZ0z1129On/MIQXpkvCQ0HAXOXXdU9iUORS8FaBIL6ADUbK2L+kLbB2u181fleyJ6PmZLxQjwagT9YiCYxphhA1bhPazOaGvJMaylT8lwIW6gyEFUKnpcbKd9aI1KylhHX59zb78+/2ycssa/qUpRjKeXSjCOWpwx8FbgfYU0Rm3EQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM8PR04MB7891.eurprd04.prod.outlook.com (2603:10a6:20b:237::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Tue, 21 Jan
 2025 15:09:08 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 15:09:08 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 21 Jan 2025 23:08:14 +0800
Subject: [PATCH 4/5] firmware: imx: Add i.MX95 SCMI LMM driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-imx-lmm-cpu-v1-4-0eab7e073e4e@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737472103; l=5418;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=H6PR1jfOvK3fWF4PM3Fm2KdY/Tt/8Cu8Eu3BQO8068s=;
 b=MCUwL7blskEQ105XVPvW+EbZ1ICwwg76wHkdgfsY20SPhG84GwPxwUmnJZylOTeyQgmpxrAsJ
 fkqCPo64A+bCcsWDzn/M90k3Ynca3hjIaBaMP8QsiB/mTfvgYfy4Rns
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
X-MS-Office365-Filtering-Correlation-Id: 6b09fcfd-9adc-4144-defe-08dd3a2d8dfd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVc0UFRIQmhvYW9qUXY4cHFhSkdEQ0hVOTk2SkZoT3hMa2prRjVVeUpmdDJw?=
 =?utf-8?B?eFhoSHc1amJ4cjNkQXpYNldvZHJQbS8zZFdDYXlKLzdSTWNIV3puWjFuemVn?=
 =?utf-8?B?a2Q3MDNFRFFIeXJSdFlibjNsNDZGV2lnUjhsemdKZ0F5RW5uOGY4OWFONlRo?=
 =?utf-8?B?N1pyaGpXSG51b0FxUmdBTWZQb0xiazBHUzVNYldQU3lBQ0h5OHl3UGhKQmdN?=
 =?utf-8?B?MUJvWVREVldkTno3dGtabHFWbXBoMXhsdVVFTHBwa0lDWmt2bm5hRFpzVmEw?=
 =?utf-8?B?dm9rZWRxTUVxS1JoOFprM1VaSlFEWTM3c2RYa29IU0c2V09oc28zNklOQzhY?=
 =?utf-8?B?clpVUnZYalMyRW56b3lEeC9NdWFObFJ4MkdvZ3FYdmdBajNEUkxCb3haSEhY?=
 =?utf-8?B?YXRXeUM0U3BYZXRLY3JYYVB3MGJLbFV6a2RkQWNhcnVSbWdtQ3dMekErT1NM?=
 =?utf-8?B?UkVzdVFXN1BDYjlDc1dXL2YrYlRaaC8wOEEyZTVRTE85VXV3aytYZ0dQcDlS?=
 =?utf-8?B?eXo0WnhCVnUrdC9MaTB4MjlmSmkwcUwzb0NNTTBuSkRLcVJvTDVYU2lEbmlP?=
 =?utf-8?B?eTk1b3QwNUNlQmw3aUpCd0E0azNaY2NJRkVuNTdDbVQxYlpCeE5yNWxOc0xz?=
 =?utf-8?B?blczaFNBZVY5dGRwUWdJTFM5eTZuZDdDTUV1cmR1alQxNU54LzcyZmJvNkF1?=
 =?utf-8?B?UVNiQUt1MTFnOHQyQXNJSzFwR0RQbzM5R1BleldJbWJ3SldkYjIvY2tta21p?=
 =?utf-8?B?dXBnMDdvSVlNTStMcXZTZUVyRVVaSlNiZ2h3bzJvS1RZdElneUJJTGpYdVcr?=
 =?utf-8?B?VTZlN2VaQkVRWmFnRzErbmc4dVdYV3ExMHdiK3J2M1NJQzlZa2NoN2kzemdz?=
 =?utf-8?B?cm1tNytobHgraU9wcG43clA2QjVVdGo4ZHBnc0ErZXl3a2xSVjExQ1hkcWpX?=
 =?utf-8?B?aktPeW5wZ1JGUStPZ1VVaWJsSXRIM1N2RDBlRkdPWjJmYzloRGIxM2l5aUdy?=
 =?utf-8?B?b05GK2UvS2VuMFp6TFFHbG41NURVNlcxOHVQNlFhWnlwWGxtcDlIcDF4SGI3?=
 =?utf-8?B?OURwdmZqZ1k5S0FIdFp0Vlo5TTZ0YnBPVmZTelRCdmlCSEdLdWF6ZkU0c2RP?=
 =?utf-8?B?Ry9zMHVadDM1OE11OGt1RFZwQ2w1KzlMa05oTTExMWk5TDBPekg5cDFQbjYr?=
 =?utf-8?B?UGZSeGE5Q3VTTXYwTGFtRTNFRVRGMEZRKzNnTUdVVjJIY2lPdTQ1L1NoZFFT?=
 =?utf-8?B?dGMwZ3F0NHZ1VjU5MEh3MjhmbkZWdTlVZ0NPWS9HSW53SGhCY1p0bTVjVDBn?=
 =?utf-8?B?dW1yZmQzNFhabTFlSDRRZk5PQW83NUxNYkUzL0owNW9keSt5Qk9zM0RzSHJL?=
 =?utf-8?B?WHVmZGZoVUYwTVA1WWhna0xNMW5GV29rcXBxZGRtTFUxaXM1dmRDampnUUpL?=
 =?utf-8?B?ZmdSaWRka01EWjliUnJPL3ZVa1pHVzBwdlFEOHF1YWtmT2JuRzhaNkhzbElx?=
 =?utf-8?B?NEdhdzVVdHZ6V0YzcjBiV1JxaFdDSG5OS1VtLzArOFFvWXo5enF3Q0EvQUFh?=
 =?utf-8?B?bUNieVRiWW5KU3lIVTBLV3E0QVd3NDFWL2VQTTRLS0FSTjRkekNuV1FpWmJv?=
 =?utf-8?B?Y1lZNWx0LzA0ZTF1M3BRSWtRUTlKcHFMZjUvRkFlNjR4MlhRb2U5elI3YkJa?=
 =?utf-8?B?REI3UnBwc2RBVWd2T3EwQ3ZvdHlrdVNpSXcxdTREUXZWNVMyc3ZDQ0xNa2M0?=
 =?utf-8?B?S2dUZUlXY3pwYnFYY3J0RGlwRGcwTTREMkllUEpOTVhZcGlnOHAxT040VDRO?=
 =?utf-8?B?MHNiOGxXTGt6MWw0eXJGQit1cHR4N3BCOEVMQ21uSUFsYWhPeEFOOHJhN0NJ?=
 =?utf-8?B?WVdrT2tZaGwrS1UxL3dnanh2VmUySEh5dUg1a2l4TVlmQUdDaE1ic2g4dnZa?=
 =?utf-8?Q?4UqqDPRNfxTcljT2Wak/YOL7Rw0C9HWJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2xwa2JDNHNFdHArWStnYlJva0JtUktUYVpwdVp5UFByZmhXMnlsODUwR0JY?=
 =?utf-8?B?d3RLL1l2QXBFWVJrTnpBQ1VSTGZWSlJ0WG41OG9kazRndldldXFJb1d4ams4?=
 =?utf-8?B?Y1Fmem40UGRVQ0JvUFNTRVpvQWEyWjZCTkNQT05CRE5JeVRxTDQ0K2NkdEJ2?=
 =?utf-8?B?QW4zK1Z2V2pkWUs4MVROQk55VStabW1VOEdSaWZ1WnRadnl6dU1zVXhWZXJ3?=
 =?utf-8?B?QmVaVUhsalRvZlVLSmwvZklEVTBNdmRtVC8rcHJFYWdoV2xCMjAvdzFPcXM4?=
 =?utf-8?B?eEg1T3VkK09yODZVL2thMU1UQWRZVE1Td2pBbU9mc29TTDJPN3lxWVdUVm95?=
 =?utf-8?B?SVByUXVlcmwzVWo4YjcycWtxQWxzb1BobDkzUm5HQ1VXa0hZMis3UTVEdVFu?=
 =?utf-8?B?c2NFTVhybkczemsyeDBhOTlQMWVHMFdOUXp6NnZwVmlzMVB1SkxXc1k2U0F0?=
 =?utf-8?B?RVM2UW1tdXNVbHdNTGExN01tSytLVVFYL21qZ0hkM1Q0L25kTTFvL0xuVVBk?=
 =?utf-8?B?QUZrKy9IOEN2bEs2SEtBTHpFYXMxZHkvdnBWKy9KZ3VSa0xXV281VTVvN0pm?=
 =?utf-8?B?MkM0eEtDVzhubm9FRUVjMC9PMTN0alRLaHUvTVFyc3M2c2Z4eEJnbkRHZm92?=
 =?utf-8?B?TkRBNENMb1pQZENSVURtMC9EUHNnU0d0T2grWjQ1Vk0xbXVpMDh2R2dSTzJo?=
 =?utf-8?B?WjVDSDV1VHNWb3k4SysvYUtMeFhnOTI1NnhQVDl6VEMzWk5STmNpNExnWnBF?=
 =?utf-8?B?emIyUyszOWZIc0xSeDRmWDBkN3YxSUUxVlZEL3FVdjZqcXNpclhHMjhNeXlh?=
 =?utf-8?B?SldqK2h3K3JrTzVaQVlIRGxUU1BRMXBhWGxqbHgwdUNVc2diTUFPa2F6WmlP?=
 =?utf-8?B?dFVFd2RiY1dCVHEwSDVYbllKMDI5c0RwUlEwczBZTlBPZnpFd0xvaURHL1Zi?=
 =?utf-8?B?clNYTThwK1JqeFFEcE5UTHdJSllLUWZmUW80Qy9ZYmFxV2tiTXlkRFVhcjFk?=
 =?utf-8?B?Vm0xRytJYW51ejNkakFKeVlsQ1hFYk1HQmc2YjRaZWZ0UVBMOHNBOC9KYlR0?=
 =?utf-8?B?Y1JpakdqbHZpdmRsZUtGZFhFcnlscm1qdTVwM3JBNmxxNEtoUVlRVHY5UWRh?=
 =?utf-8?B?b2o3T2pYTEhEUDJvcTgyWHJCK0drQkxCUlY5TE9Lc0htNEFGRFoxZUVQajhn?=
 =?utf-8?B?N0t6S3dlWWRsbDFaNS84Vy81M2pJMWhqaXpKMXMxbklRcmx6anJId3lmOE0y?=
 =?utf-8?B?MlQxUmVILzJDeXFzUUo4S0hoQU5qc21zL1FNNG5vaVc4ZDh2Z3NiWkJwN21M?=
 =?utf-8?B?S1pjbzM0a2RqS010am5TWjJTakVqck14eDdOWjFKOTlWTUxURHlyQzJzTUQ4?=
 =?utf-8?B?WmhXZ3MyVDluLzB3RUM4cXI5cmV3ajY0bjQ1ZzJ3bTBPUEw0Ni9McDVCOGVy?=
 =?utf-8?B?RmNKN1EyQ01obDl6VkJZSXRHZS80ZFVESWlMQlB5dzJDM2FROWRDTUcxQ1R0?=
 =?utf-8?B?RERkem1SKzhWaTlFMDhLUlEzZE4relVuOTYzRmhUbFJFeW82elBxS2QwNUlP?=
 =?utf-8?B?QllIK1FjQWE4b0djRnl5dk9JU0x1Y2R3MHZQYUlXUTFObjlMSlpaWlNTSWRM?=
 =?utf-8?B?UmtLWmZob3lBK3FtTFFnS01UTlIxZElpc1ZZOXU3NmZiNHhQak51ZGVXTTk1?=
 =?utf-8?B?dXNQZFhEQUt2WHY0RUg1M2tUZTBnQVJRekw0ZGI3R21Mano2dHdTUFl3OVBK?=
 =?utf-8?B?VGU3bTR6YUhRKzJ0dE0ySEp6LzY1S3YzM01vWFp6amdIUVZUSzNNYUtSdE9Q?=
 =?utf-8?B?dmtuT2IvaWNhcGdoMjhVM0MydWphZ1c0Q21pTExqSEYxSWFCTERrTTFmVlJH?=
 =?utf-8?B?NDJjcXNsWVBtYXZLcUJveEpqRGVIZ2hJTFYrUUFHRW5IcDZtZ05WWE1NNGwy?=
 =?utf-8?B?MFl2QS8vU2RjazFDQlpwRWFkQTkvbWdjdU1UaGRTQ0QzMDFwQUYyTnI2emtG?=
 =?utf-8?B?SHRVVFdkTFgyM0JyMytYN2dvdE1GNlV1OVRjNGx5T1NSWVhKeFFrUlZiQ2k3?=
 =?utf-8?B?S2lvbGxTOW9IckxpVDErMkN2Y05meXUvYkc5cjRHYjRYcGtBcVJlSE4yeTlT?=
 =?utf-8?Q?8U7i1IVG5ZDeOZz6DiDOIgbon?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b09fcfd-9adc-4144-defe-08dd3a2d8dfd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 15:09:08.8208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aAvS3lEoPyJLLnysl9qArsyf70evdcrZR4NeegnBu9vtauae1cyLPVT07+w6TVKOFNQNoz74hfwDgM0itJT+jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7891

From: Peng Fan <peng.fan@nxp.com>

The i.MX95 System manager exports SCMI LMM protocol for linux to manage
Logical Machines. The driver is to use the LMM Protocol interface to
boot, shutdown a LM.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/imx/Kconfig    | 11 +++++
 drivers/firmware/imx/Makefile   |  1 +
 drivers/firmware/imx/sm-lmm.c   | 89 +++++++++++++++++++++++++++++++++++++++++
 include/linux/firmware/imx/sm.h | 27 +++++++++++++
 4 files changed, 128 insertions(+)

diff --git a/drivers/firmware/imx/Kconfig b/drivers/firmware/imx/Kconfig
index 907cd149c40a8b5f1b14c53e1c315ff4a28f32ac..c3e344d6ecc645df1f0e3ee8078934c47f347fd7 100644
--- a/drivers/firmware/imx/Kconfig
+++ b/drivers/firmware/imx/Kconfig
@@ -23,6 +23,17 @@ config IMX_SCU
 	  This driver manages the IPC interface between host CPU and the
 	  SCU firmware running on M4.
 
+config IMX_SCMI_LMM_DRV
+	tristate "IMX SCMI LMM Protocol driver"
+	depends on IMX_SCMI_LMM_EXT || COMPILE_TEST
+	default y if ARCH_MXC
+	help
+	  The System Controller Management Interface firmware (SCMI FW) is
+	  a low-level system function which runs on a dedicated Cortex-M
+	  core that could provide Logical Machine management features.
+
+	  This driver can also be built as a module.
+
 config IMX_SCMI_MISC_DRV
 	tristate "IMX SCMI MISC Protocol driver"
 	default y if ARCH_MXC
diff --git a/drivers/firmware/imx/Makefile b/drivers/firmware/imx/Makefile
index 8d046c341be878bb6dd1e6277992ff66ae90e292..7762855d2a771169d4f1867d27e0d51be7c9ad03 100644
--- a/drivers/firmware/imx/Makefile
+++ b/drivers/firmware/imx/Makefile
@@ -2,3 +2,4 @@
 obj-$(CONFIG_IMX_DSP)		+= imx-dsp.o
 obj-$(CONFIG_IMX_SCU)		+= imx-scu.o misc.o imx-scu-irq.o rm.o imx-scu-soc.o
 obj-${CONFIG_IMX_SCMI_MISC_DRV}	+= sm-misc.o
+obj-${CONFIG_IMX_SCMI_LMM_DRV}	+= sm-lmm.o
diff --git a/drivers/firmware/imx/sm-lmm.c b/drivers/firmware/imx/sm-lmm.c
new file mode 100644
index 0000000000000000000000000000000000000000..91a504e7f0d99089d3c2250a7918fb2fe99e991d
--- /dev/null
+++ b/drivers/firmware/imx/sm-lmm.c
@@ -0,0 +1,89 @@
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
+static const struct scmi_imx_lmm_proto_ops *imx_lmm_ops;
+static struct scmi_protocol_handle *ph;
+
+int scmi_imx_lmm_boot(u32 lmid)
+{
+	if (!ph)
+		return -EPROBE_DEFER;
+
+	return imx_lmm_ops->lmm_boot(ph, lmid);
+};
+EXPORT_SYMBOL(scmi_imx_lmm_boot);
+
+int scmi_imx_lmm_info(u32 lmid, struct scmi_imx_lmm_info *info)
+{
+	if (!ph)
+		return -EPROBE_DEFER;
+
+	if (!info)
+		return -EINVAL;
+
+	return imx_lmm_ops->lmm_info(ph, lmid, info);
+};
+EXPORT_SYMBOL(scmi_imx_lmm_info);
+
+int scmi_imx_lmm_power_on(u32 lmid)
+{
+	if (!ph)
+		return -EPROBE_DEFER;
+
+	return imx_lmm_ops->lmm_power_on(ph, lmid);
+};
+EXPORT_SYMBOL(scmi_imx_lmm_power_on);
+
+int scmi_imx_lmm_shutdown(u32 lmid, u32 flags)
+{
+	if (!ph)
+		return -EPROBE_DEFER;
+
+	return imx_lmm_ops->lmm_shutdown(ph, lmid, flags);
+};
+EXPORT_SYMBOL(scmi_imx_lmm_shutdown);
+
+static int scmi_imx_lmm_probe(struct scmi_device *sdev)
+{
+	const struct scmi_handle *handle = sdev->handle;
+
+	if (!handle)
+		return -ENODEV;
+
+	if (imx_lmm_ops) {
+		dev_err(&sdev->dev, "lmm already initialized\n");
+		return -EEXIST;
+	}
+
+	imx_lmm_ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_IMX_LMM, &ph);
+	if (IS_ERR(imx_lmm_ops))
+		return PTR_ERR(imx_lmm_ops);
+
+	return 0;
+}
+
+static const struct scmi_device_id scmi_id_table[] = {
+	{ SCMI_PROTOCOL_IMX_LMM, "imx-lmm" },
+	{ },
+};
+MODULE_DEVICE_TABLE(scmi, scmi_id_table);
+
+static struct scmi_driver scmi_imx_lmm_driver = {
+	.name = "scmi-imx-lmm",
+	.probe = scmi_imx_lmm_probe,
+	.id_table = scmi_id_table,
+};
+module_scmi_driver(scmi_imx_lmm_driver);
+
+MODULE_AUTHOR("Peng Fan <peng.fan@nxp.com>");
+MODULE_DESCRIPTION("IMX SM LMM driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/firmware/imx/sm.h b/include/linux/firmware/imx/sm.h
index 9b85a3f028d1b0a5287b453eb3ad8412a363fe6c..1e58ffaa81acd757d9e6a992a2f2df663681c08a 100644
--- a/include/linux/firmware/imx/sm.h
+++ b/include/linux/firmware/imx/sm.h
@@ -8,6 +8,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/errno.h>
+#include <linux/scmi_imx_protocol.h>
 #include <linux/types.h>
 
 #define SCMI_IMX_CTRL_PDM_CLK_SEL	0	/* AON PDM clock sel */
@@ -20,4 +21,30 @@
 int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val);
 int scmi_imx_misc_ctrl_set(u32 id, u32 val);
 
+#if IS_ENABLED(CONFIG_IMX_SCMI_LMM_DRV) || IS_ENABLED(CONFIG_COMPILE_TEST)
+int scmi_imx_lmm_boot(u32 lmid);
+int scmi_imx_lmm_info(u32 lmid, struct scmi_imx_lmm_info *info);
+int scmi_imx_lmm_power_on(u32 lmid);
+int scmi_imx_lmm_shutdown(u32 lmid, u32 flags);
+#else
+static inline int scmi_imx_lmm_boot(u32 lmid)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int scmi_imx_lmm_info(u32 lmid, struct scmi_imx_lmm_info *info)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int scmi_imx_lmm_power_on(u32 lmid)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int scmi_imx_lmm_shutdown(u32 lmid, u32 flags)
+{
+	return -EOPNOTSUPP;
+}
+#endif
 #endif

-- 
2.37.1

