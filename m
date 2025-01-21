Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2069.outbound.protection.outlook.com [40.107.249.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FE41F4288;
	Tue, 21 Jan 2025 15:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737472143; cv=fail; b=uA7Kh86BvQryjvAMF0SksbbuXbVw6qLClPhiCOVg5bHHavVpnIiDbbhS883cPUExb4jyURtU1SjYcXhNR8l8wWkWA18pk3Y4V/8bAUvX+ASycVQcaQvHav8tmGMy7D63evMxVb26YRLtDzHx27WYwu6e5e63TA9C3aiAkWFiN8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737472143; c=relaxed/simple;
	bh=w4R9UMOdk5kPMASY79OCtlw8Xo3C5+4PM2wRK4t+hWM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=CGRFO004TXBLNsvmrSm2+eoObibNj06ykXyCyUpAuqFgguueWrQqUfPHO/s9A7XTmqKb4KoS4GDMXgEfDtKeN1vT95WWC3QK5RarA0AsfwWH9cm9C92Crmx7aaJMkkwRO/GTvKatQ+vKwGj9flW3KoMV+qg5QzXLhB0Z5A2et30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qf92HbgU; arc=fail smtp.client-ip=40.107.249.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qf92HbgU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=evHDAmcq5YUdwM3t7Q0fYYv5CdD+s6gmbENqjiY/NDyDGNMLd4J85252g6Trxg5bQnw7z0QJ3M302wZaVjwuE72KAmcNIGPC52jMHyzPohR+KhucyGRGKGeUYVIerY7otf3Z2K5gVW4w0LOZxeyXM8+D+nVl6KVPvlk/3wCsRw/a25rcJ4wX6hZzrIUHy3D5JznFfLwmNQvIKUVetOWlhi+xG2KhhGQc4VQGzsSs5VO5OSRwu7HutFU7Z+l5kuqpYSnyxO9llZbJNlBkc5CZes8c8b5gHEluoSTJIpbf5gZlbd8azYBx38VGQ4ysyYevDO1UKJ6pzXuHxoDw94Fztw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0ARC/RmMaxo8ILmen/egoAknRkBKuQNt2UgoWny2e0=;
 b=GMM6ohMdhC+zdb2eUToJ8MRahWIdnEfihFoiROA7xQe35aoUzzfBDDKabjQX+A/Dh7J9uvLQWoOaDi6qauS49FtPvXwx3r274gd4dhxzJ0shNkDNj8eOJFJUlMtMXrahLBa6CXZlJsizVw75jza7c3NTGfGK2fYk2CkHvjp9JJftuapJEAUZSat1hmUHKpcZOmFIOfHwWnQgp4jeQCYcR1VcEeBiktYyByZK4lV7BO3YBiTD7hkbWsdym+lI3fHCgn8v1sSmQJmBVGgpDn1THHk9E6+QJhCXIFBK4+v4w4fRkYzKVQjhYc91hcxbcmI9FREbMlXO9TRp8zqktVFFEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0ARC/RmMaxo8ILmen/egoAknRkBKuQNt2UgoWny2e0=;
 b=qf92HbgUh6773EF6spW0hjhyD+aqNLKUxMa851r0jP3LvAnl4zvsJjiAwiuxomWSDgr+5Ft2OCkIU7IiP9bg9eZ3nQTAI/op5tnA4IC20F+40ouX8HxCvhiYL5yNH370hei2zhVxbnxvJzUVfgvJlCUk4xk6DXFOalBu30BAymEW2cVUpNHWNrhosemoHwtyusN4yjG2jExL/DuRmoItNt3koHeU2opU9Gexp4obtgkGgkZ7fxEuaIRcKH0vB+Zif1Vs3QsyF6hDh0slajvT9YTomlY7K6smSTt9YT3yqveN75wqJ36JGC6VwJDyuQOCC3P/aWC9XrMB9sPLZ7qfAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM7PR04MB6853.eurprd04.prod.outlook.com (2603:10a6:20b:107::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Tue, 21 Jan
 2025 15:08:58 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 15:08:58 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 21 Jan 2025 23:08:11 +0800
Subject: [PATCH 1/5] firmware: arm_scmi: imx: Add i.MX95 LMM protocol
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-imx-lmm-cpu-v1-1-0eab7e073e4e@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737472103; l=9570;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=3VXrTHu1D4IdJfg6JFOee0D8LNmoa9UQv759Ph+nEo0=;
 b=sJ353smbiuenU1Xdfe5BlRH9eg9yS3af1RHhBTBU5F0ChPzlhoXgdCV0uFIB5CdNcXEqLQ+UU
 C64moMhnOG6CYizcBAp7xg7uX7O9zLN/TWlkfqfmdGieRpGbgnSJDlU
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
X-MS-Office365-Filtering-Correlation-Id: 0e3a68d6-d74e-421b-1331-08dd3a2d87dc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V0Y0dTdGNmNYSXdMczhpeUNoUnRhd25CM3pyRXRxU2RCNWlxUkNnSFdJekd5?=
 =?utf-8?B?TzFlUUZ1SU9oYzJwS0xUQmR3U21ud3J1Z1EwK0RGVUo4bnNTeE54TzFWYm91?=
 =?utf-8?B?azVMazMzTnZmdjJpcEVBSk5PeWhTWDJ1bnpYbTU3dHBXQ0ExZWZBbWVqQisw?=
 =?utf-8?B?OUhsSWIwUjZtdkYrUWNnaENrSUlha3ZOU2o5UExXWnZ5dTNhOEVHL3NReHF0?=
 =?utf-8?B?VzJrL2gxY0U3WjNiMkZoRUFvdGFEd1Z6ZkNLSnhqRFNNVXJpZmk2M2pLSEU2?=
 =?utf-8?B?Q1RQRjh3OVNsTnhCTStaQmR1SWJOU3ZUeVVHUktVdG0zZGpOMW5Pa3pMQ0Nw?=
 =?utf-8?B?SEwyajN1MTRNaGJRY3pjNjUrNGllZFVRMExrbHlTOE1sMTlGNmpKUGk5U2lu?=
 =?utf-8?B?SkUrSW5NRHBmRVBkZ04zaDgxK3pGMG1aMzhaUjJRdVhGTWJMQndzRVhpT3FZ?=
 =?utf-8?B?VE03WUFDUGtNcDNSVXUrZ2xiYWw0LzVyNG1ndVZYcGMxU2x3aHVxWjBBMHBY?=
 =?utf-8?B?dlhua1lPcmw4emJCNUdtY1ZGZXo3Nm1lY0VBOWI3R1JVY1J5VFl4L3JpVzBP?=
 =?utf-8?B?dGlRNVZqSmZCMWJ0RkNuWU5QTnpMSWxXR20zMjhDOG9wdjIxUW13RlM1MlB4?=
 =?utf-8?B?YWlGT0dLV0FnbnMyRHBXTUdrQ0txc3pkd3hsTFFrMUg3UXoyUk9ZUjFCYXQx?=
 =?utf-8?B?b2FVMjlMMTMzRis0cG9lNVlMdHVWWDRSTWdhaVNIdlpWc3lwUCtzQU5mdXVu?=
 =?utf-8?B?MjdML1NlYzhjUXFIVG41Vm90eDgycFN2WlNYdHdic0lGbGtTMFY1cCtBa2tP?=
 =?utf-8?B?M3VmVyt2aVo2cEZPcEZ0VXFYWmpsSzZLa21PVHJFb3JaSVh2ZUlncFZ4REZj?=
 =?utf-8?B?NGZsNk9EUEZCYldYQ2llTi9DcTFaQytQWFRpTEhPS1pBUTlYeWh2RWRyRm5k?=
 =?utf-8?B?L1REZjlaV0JOcDRaeHZqR3ZxQ0VmYk9xL3hrSHo2YlRNNERrdEdMSHNWZ3FY?=
 =?utf-8?B?ZXc2MHV3Q09YeVNubHlEMWg1TDIrdlBxQXNyMnJMMFdmRXNwdXd4SHIwbEJV?=
 =?utf-8?B?dFhndDE3bkhzUHBWZmR3SUloVTc4RlNMZEZRV2pqaGFBYStwRDMxS2xXUG9M?=
 =?utf-8?B?ak82SmttMTVUVHFpVWJocEdJbllPSzRlM3p4a1c3VVUxb3pBR1JrMnIxbmNa?=
 =?utf-8?B?b2c3V2l2TFVkRFBVdlF2U01UYU9Fc2hyUUhycG1QaTFFV2NYQzhaODc1WVNm?=
 =?utf-8?B?RFNsZjBjOStvM2F4TGFuc2tGMkJyV0huQ0RwMllCbTk3U0tjYXd6WHJDVG5m?=
 =?utf-8?B?RTdyRjd0VXZZNEZmVitBZ3FqMjhESzhtZUxUdTZvenB2MElpL0dHek8zUEUr?=
 =?utf-8?B?RUloejU5bzVmaHA1b2hKWnVEZkduL01qUHBBYmFFb2V5WGdybjBVUjF4Uy80?=
 =?utf-8?B?ejE5OUxPU1ZzWWQxTm5yL1J6TGhjVFpYa0lWRTVrV3gzaTVrNW1pUWVhcUNk?=
 =?utf-8?B?MnB0a3NkYWF4N3p1ZzZlWlRNRW5Qb1hsUHMzZFZBZGpsajJXREZUTDNFKy9N?=
 =?utf-8?B?VHZvT0tqKzU3MlZleVpMMVY5cjVXdTZxMVltbVpZbVdoQzQ1anJCNXA5emZO?=
 =?utf-8?B?REFlVUdod0J1R2FKNVJFWVMzSG9CTmlPL0xlcVFDNThUc09QbnFzVWY1TlRm?=
 =?utf-8?B?UmkwQnFOeGxyQlFEbzFoY3BKcmxTMkQ2QjVHQlpMMUQvTDg4MmpYY21FSThB?=
 =?utf-8?B?b21CR1RDOW5yWmc5UDlWWUpwQ0ZHWkhsalZML05Td2NCbkRTSDQvSXMzRVN6?=
 =?utf-8?B?MzhONloyb2F5OVZVTEc3QWZpTFlpTy8zd0IxUVNjNldEQUF3YzQ5Q2R6YjJq?=
 =?utf-8?B?WUNrSjN5WEtnRFM4QnEvbERBcytFQnVZWjVBN0o3ekNJZ3JObUNjODZyMUtk?=
 =?utf-8?Q?+5Wyvr6qF0rdb5gWnF8eznWSxoVY7WKT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUxjTG8xQjJlc1hkOTRicXpObXplMmZuVjh3YlFXRnVvM2ZuWWM0YkJVSGsx?=
 =?utf-8?B?VlJ3VVo3dVNsdlVTRVpuR2t2ODE0VzFSaStYQjJQVDBSUkhlSFVBZlRocitm?=
 =?utf-8?B?K2NVS0Z5UllvM1dMVHFlVnRVUFdBOVFMZS8wQVBGQTlsOFNZbEpVTVh5Nzhv?=
 =?utf-8?B?eW8rbHdwVldCZDg3ZHpJZkZIZFZXa3YwYVBwT1lRUUNRZXkyL2ptNDc1U0py?=
 =?utf-8?B?TmdmVDZuZ29BRDk2b0kzRzBqNUVuaCt4N01hZkZsRkhXQVpjWDVJb0JWMVhx?=
 =?utf-8?B?R2hKSkpmbE1TVy9EMlhhUlhVNmRGbGI3OXU0NWRWU1U0aFFXeEJtU05nNmFN?=
 =?utf-8?B?WVliSytJVlVzVDR5MXpybzBGaCtLUVZDUHFVRXFrbGxWV01DZ0xMYnhmSWh6?=
 =?utf-8?B?eWVJcHFNNThYU0loazZvNFg3cXcrVTFXbDBiZStndVBmQ1RHSkpJZThuQnFn?=
 =?utf-8?B?a1dsL2tUb3lFWHY4dFJZVEJDNzhFT2F3L1JNTFdkbXpVeVo2d2g0Qkx0TmU3?=
 =?utf-8?B?UG55cTg5MFZ0VzQvN29XMmRLZTloRFQrQk9hN0FxRkpHQVoyUjNBMnF4L3A5?=
 =?utf-8?B?YVpSeHptbWh2b1YvN1JvdHg0NCtSOWhSODJLc1VlbmFyM3lzNmx2VjhJODV1?=
 =?utf-8?B?RzZidnkwejJ1UWlmSXhvM09ZcnkyTFdRU0N5M0k5Y3FRWDZDang1WkdjRmtw?=
 =?utf-8?B?OHQyazBLcklXSzJMajFCK1h6Vm1RcmlIYkZKUmlxRkJVL2pVZjFIY0d2RVRI?=
 =?utf-8?B?bExHWE1xeXFGMCtIWGxra2g1T0Q0RExkK1JJOE1tSDBlbkJ1VklqKzVJVGRT?=
 =?utf-8?B?OUluT0lMWFZBL2tMNnZyejJCS2gyVVNCVlFYemZ4MzRPcGZoLzI0VmVkYXJZ?=
 =?utf-8?B?dnUwMFJ0dk00d1Vkb0VCUXR4T3pqNkoxYlRoWW9xcGk0c3FqdzBwNC9abjJh?=
 =?utf-8?B?UTdnVys4TmlmRk16MWZDcVNNM3BlWGo5b3BoSUVkMi9VMDhOV1lLamRDMjE2?=
 =?utf-8?B?aVdHTTN5dDBEdlFqSXk2L00xK1JDOWVwZ0FyZlFGdWRWUHkxOXhpeW4vQkhu?=
 =?utf-8?B?ZnVrMGdNVHFCcFpxOFB1S1NFZVN0UUpjMDJaaHM1bm9VZUREdHdwM1kwMjh4?=
 =?utf-8?B?MEZCMU9WNHJQUE9VS3V4N3dxMFF3ZFMvS1FFbWJPL3BqRldNWTNWQlZmdS8r?=
 =?utf-8?B?enNhN1dWeXZPVTRGMUFSZ2FhWXA2Vk80czcyRkExck1BcmdaTXZyeDlBWTZI?=
 =?utf-8?B?UDdMaDVpQW5GSURzMWtaWUp4RUxqdExFWlpnaWdEWTRvVGROWlRuUE1KTkZa?=
 =?utf-8?B?STBjaXB1bGdPN042L1BWVGtDb3o3ZFRtc3Y0cFJab09iaFVEaHR2dDJLa3JR?=
 =?utf-8?B?ZVJwZEVwaHFLSENzWkR1MHFqbDkyaUZESHlTcVJiUk03NWtxdTRoVzQ4M3lH?=
 =?utf-8?B?V2Nib2xDditTdktwaUNJRW1keUVIUXQyN0M1Y0F2VTdSRHMrck9RNnVLcU52?=
 =?utf-8?B?SXdvbzFlUyswejdRYk5CcTFjbGpmd2RWbHJ3alhJZFY5QU9zQWdqTXdxTGxl?=
 =?utf-8?B?MzBnT3V5TEU1K2NxdmtnZWJmdjBtSGFLZ3BSbkE2R2szNDVYL2tLYTd2bGpR?=
 =?utf-8?B?RnIrdnJqa0pFUWpCZ0dEbk5aZzBOMmtkSmNGbytZSUdtOU1oSlk5ZHphYWpx?=
 =?utf-8?B?dTVBYTdxS05jcnB3Zld3NW1KT3dkTTdRWC9GNzJRaDV6Y1hhbUtpTFppYTZR?=
 =?utf-8?B?OFhvVTZoTFJZajZidlRETlk4M2srcS8zNnYxdFBNMXpKcTJCR21ET0cvT1BZ?=
 =?utf-8?B?cEFYSVhjcnRxdHAxYXhyNkFrdXZua0ZBaURWZldaOW80Y2EyUmMzTE5sLzBG?=
 =?utf-8?B?Vk04V2JtUVRGUmJqZ0Zxc2FTQ0FIbkJhOVlzZmI0SXBLMHV2TTZZU3phaUxQ?=
 =?utf-8?B?bUU2dTBUbDJod3JUeVFuNGltTEV0bmhBVkkxem1ZLzNkL2RXekdRZUNrNzE4?=
 =?utf-8?B?VDlJZlJaUjVqSDZaRHhzbGZxSlZhQUY4QVordDlzSlNzQ0JLdUN3OWJ0ZkEw?=
 =?utf-8?B?VTA1aXJ1cDFEbVJWQ1FjRE1kTWRXVDE0SWlGNnNhbnA2ZS8zSTdnYUlETE0y?=
 =?utf-8?Q?QtkR4M+ZCI8VCshXv/fIDKMF4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e3a68d6-d74e-421b-1331-08dd3a2d87dc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 15:08:58.5643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0QCqyICgt2rW97iSrf9VnGZrqrCnIPRq0z5aUsA8HGUkr6mWbzkpptuZBdNWWCgpy9s+b037WiCbhVXXqoDgJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6853

From: Peng Fan <peng.fan@nxp.com>

Add Logical Machine Management(LMM) protocol which is intended for boot,
shutdown, and reset of other logical machines (LM). It is usually used to
allow one LM to manager another used as an offload or accelerator engine.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/arm_scmi/vendors/imx/Kconfig      |  11 +
 drivers/firmware/arm_scmi/vendors/imx/Makefile     |   1 +
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c | 235 +++++++++++++++++++++
 include/linux/scmi_imx_protocol.h                  |  29 +++
 4 files changed, 276 insertions(+)

diff --git a/drivers/firmware/arm_scmi/vendors/imx/Kconfig b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
index a01bf5e47301d2f93c9bfc7eebc77e083ea4ed75..1a936fc87d2350e2a21bccd45dfbeebfa3b90286 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/Kconfig
+++ b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
@@ -12,6 +12,17 @@ config IMX_SCMI_BBM_EXT
 	  To compile this driver as a module, choose M here: the
 	  module will be called imx-sm-bbm.
 
+config IMX_SCMI_LMM_EXT
+	tristate "i.MX SCMI LMM EXTENSION"
+	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
+	default y if ARCH_MXC
+	help
+	  This enables i.MX System Logical Machine Protocol to
+	  manage Logical Machines boot, shutdown and etc.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called imx-sm-lmm.
+
 config IMX_SCMI_MISC_EXT
 	tristate "i.MX SCMI MISC EXTENSION"
 	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
diff --git a/drivers/firmware/arm_scmi/vendors/imx/Makefile b/drivers/firmware/arm_scmi/vendors/imx/Makefile
index d3ee6d5449244a4f5cdf6abcf1845f312c512325..f39a99ccaf9af757475e8b112d224669444d7ddc 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/Makefile
+++ b/drivers/firmware/arm_scmi/vendors/imx/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_IMX_SCMI_BBM_EXT) += imx-sm-bbm.o
+obj-$(CONFIG_IMX_SCMI_LMM_EXT) += imx-sm-lmm.o
 obj-$(CONFIG_IMX_SCMI_MISC_EXT) += imx-sm-misc.o
diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c
new file mode 100644
index 0000000000000000000000000000000000000000..808cbedba5de4b4314948c06c60bebea057efbe7
--- /dev/null
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c
@@ -0,0 +1,235 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * System control and Management Interface (SCMI) NXP LMM Protocol
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
+enum scmi_imx_lmm_protocol_cmd {
+	SCMI_IMX_LMM_ATTRIBUTES	= 0x3,
+	SCMI_IMX_LMM_BOOT = 0x4,
+	SCMI_IMX_LMM_RESET = 0x5,
+	SCMI_IMX_LMM_SHUTDOWN = 0x6,
+	SCMI_IMX_LMM_WAKE = 0x7,
+	SCMI_IMX_LMM_SUSPEND = 0x8,
+	SCMI_IMX_LMM_NOTIFY = 0x9,
+	SCMI_IMX_LMM_RESET_REASON = 0xA,
+	SCMI_IMX_LMM_POWER_ON = 0xB,
+};
+
+struct scmi_imx_lmm_priv {
+	u32 nr_lmm;
+};
+
+#define	SCMI_IMX_LMM_PROTO_ATTR_NUM_LM(x)	(((x) & 0xFFU))
+struct scmi_msg_imx_lmm_protocol_attributes {
+	__le32 attributes;
+};
+
+struct scmi_msg_imx_lmm_attributes_out {
+	__le32 lmid;
+	__le32 attributes;
+	__le32 state;
+	__le32 errstatus;
+	u8 name[LMM_MAX_NAME];
+};
+
+struct scmi_imx_lmm_shutdown_in {
+	__le32 lmid;
+#define LMM_FLAGS_GRACEFUL(x)  ((x) & BIT(0))
+	__le32 flags;
+};
+
+static int scmi_imx_lmm_validate_lmid(const struct scmi_protocol_handle *ph, u32 lmid)
+{
+	struct scmi_imx_lmm_priv *priv = ph->get_priv(ph);
+
+	if (lmid >= priv->nr_lmm)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int scmi_imx_lmm_attributes(const struct scmi_protocol_handle *ph,
+				   u32 lmid, struct scmi_imx_lmm_info *info)
+{
+	struct scmi_msg_imx_lmm_attributes_out *out;
+	struct scmi_xfer *t;
+	int ret;
+
+	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_LMM_ATTRIBUTES, sizeof(u32), 0, &t);
+	if (ret)
+		return ret;
+
+	put_unaligned_le32(lmid, t->tx.buf);
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		out = t->rx.buf;
+		info->lmid = le32_to_cpu(out->lmid);
+		info->state = le32_to_cpu(out->state);
+		info->errstatus = le32_to_cpu(out->errstatus);
+		strscpy(info->name, out->name);
+		dev_dbg(ph->dev, "i.MX LMM: Logical Machine(%d), name: %s\n",
+			info->lmid, out->name);
+	} else {
+		dev_err(ph->dev, "i.MX LMM: Failed to get info of Logical Machine(%u)\n", lmid);
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_lmm_boot(const struct scmi_protocol_handle *ph, u32 lmid)
+{
+	struct scmi_xfer *t;
+	int ret;
+
+	ret = scmi_imx_lmm_validate_lmid(ph, lmid);
+	if (ret)
+		return ret;
+
+	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_LMM_BOOT, sizeof(u32),
+				      0, &t);
+	if (ret)
+		return ret;
+
+	put_unaligned_le32(lmid, t->tx.buf);
+	ret = ph->xops->do_xfer(ph, t);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_lmm_power_on(const struct scmi_protocol_handle *ph, u32 lmid)
+{
+	struct scmi_xfer *t;
+	int ret;
+
+	ret = scmi_imx_lmm_validate_lmid(ph, lmid);
+	if (ret)
+		return ret;
+
+	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_LMM_POWER_ON, sizeof(u32),
+				      0, &t);
+	if (ret)
+		return ret;
+
+	put_unaligned_le32(lmid, t->tx.buf);
+	ret = ph->xops->do_xfer(ph, t);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_lmm_shutdown(const struct scmi_protocol_handle *ph, u32 lmid,
+				 u32 flags)
+{
+	struct scmi_imx_lmm_shutdown_in *in;
+	struct scmi_xfer *t;
+	int ret;
+
+	ret = scmi_imx_lmm_validate_lmid(ph, lmid);
+	if (ret)
+		return ret;
+
+	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_LMM_SHUTDOWN, sizeof(*in),
+				      0, &t);
+	if (ret)
+		return ret;
+
+	in = t->tx.buf;
+	in->lmid = cpu_to_le32(lmid);
+	in->flags = cpu_to_le32(flags);
+	ret = ph->xops->do_xfer(ph, t);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static const struct scmi_imx_lmm_proto_ops scmi_imx_lmm_proto_ops = {
+	.lmm_boot = scmi_imx_lmm_boot,
+	.lmm_info = scmi_imx_lmm_attributes,
+	.lmm_power_on = scmi_imx_lmm_power_on,
+	.lmm_shutdown = scmi_imx_lmm_shutdown,
+};
+
+static int scmi_imx_lmm_protocol_attributes_get(const struct scmi_protocol_handle *ph,
+						struct scmi_imx_lmm_priv *priv)
+{
+	struct scmi_msg_imx_lmm_protocol_attributes *attr;
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
+		priv->nr_lmm = SCMI_IMX_LMM_PROTO_ATTR_NUM_LM(attr->attributes);
+		dev_info(ph->dev, "i.MX LMM: %d Logical Machines\n",
+			 priv->nr_lmm);
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_lmm_protocol_init(const struct scmi_protocol_handle *ph)
+{
+	struct scmi_imx_lmm_priv *info;
+	u32 version;
+	int ret;
+
+	ret = ph->xops->version_get(ph, &version);
+	if (ret)
+		return ret;
+
+	dev_info(ph->dev, "NXP SM LMM Version %d.%d\n",
+		 PROTOCOL_REV_MAJOR(version), PROTOCOL_REV_MINOR(version));
+
+	info = devm_kzalloc(ph->dev, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	ret = scmi_imx_lmm_protocol_attributes_get(ph, info);
+	if (ret)
+		return ret;
+
+	return ph->set_priv(ph, info, version);
+}
+
+static const struct scmi_protocol scmi_imx_lmm = {
+	.id = SCMI_PROTOCOL_IMX_LMM,
+	.owner = THIS_MODULE,
+	.instance_init = &scmi_imx_lmm_protocol_init,
+	.ops = &scmi_imx_lmm_proto_ops,
+	.supported_version = SCMI_PROTOCOL_SUPPORTED_VERSION,
+	.vendor_id = SCMI_IMX_VENDOR,
+	.sub_vendor_id = SCMI_IMX_SUBVENDOR,
+};
+module_scmi_protocol(scmi_imx_lmm);
+
+MODULE_DESCRIPTION("i.MX SCMI LMM driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/scmi_imx_protocol.h b/include/linux/scmi_imx_protocol.h
index 53b356a26414279f4aaaa8287c32209ed1ad57b4..456559f021696ae51f40ed11e6f85089d430ce71 100644
--- a/include/linux/scmi_imx_protocol.h
+++ b/include/linux/scmi_imx_protocol.h
@@ -11,8 +11,10 @@
 #include <linux/bitfield.h>
 #include <linux/device.h>
 #include <linux/notifier.h>
+#include <linux/scmi_protocol.h>
 #include <linux/types.h>
 
+#define SCMI_PROTOCOL_IMX_LMM	0x80
 #define	SCMI_PROTOCOL_IMX_BBM	0x81
 #define	SCMI_PROTOCOL_IMX_MISC	0x84
 
@@ -57,4 +59,31 @@ struct scmi_imx_misc_proto_ops {
 	int (*misc_ctrl_req_notify)(const struct scmi_protocol_handle *ph,
 				    u32 ctrl_id, u32 evt_id, u32 flags);
 };
+
+#define	LMM_ID_DISCOVER	0xFFFFFFFFU
+#define	LMM_MAX_NAME	16
+
+enum scmi_imx_lmm_state {
+	LMM_STATE_LM_OFF,
+	LMM_STATE_LM_ON,
+	LMM_STATE_LM_SUSPEND,
+	LMM_STATE_LM_POWERED,
+};
+
+struct scmi_imx_lmm_info {
+	u32 lmid;
+	enum scmi_imx_lmm_state state;
+	u32 errstatus;
+	u8 name[LMM_MAX_NAME];
+};
+
+struct scmi_imx_lmm_proto_ops {
+	int (*lmm_boot)(const struct scmi_protocol_handle *ph, u32 lmid);
+	int (*lmm_info)(const struct scmi_protocol_handle *ph, u32 lmid,
+			struct scmi_imx_lmm_info *info);
+	int (*lmm_power_on)(const struct scmi_protocol_handle *ph, u32 lmid);
+	int (*lmm_shutdown)(const struct scmi_protocol_handle *ph, u32 lmid,
+			    u32 flags);
+};
+
 #endif

-- 
2.37.1

