Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2069.outbound.protection.outlook.com [40.107.249.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089491F4271;
	Tue, 21 Jan 2025 15:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737472141; cv=fail; b=G7wIvIgj6Ju02KNdLuU3Zb2LrDKlVdrwvMa7VkCC2107VivLO4NwnmqNRZLMbBsmgv+q55ocWi11hKQ6xgR0vqtGxqKDJjX36uwXejmL4CDDaNI+GeWmRequEp1ICrWwuqoDReIypiOUfG8HvU/tPaD8xBHI5cNVmHGqP7LLzlk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737472141; c=relaxed/simple;
	bh=ifgDquSQscn/T03rF9Vz+EDOYQiu9tyXilA81NHM2OA=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=nVPpaBvlLPIUKfa0TSSOF8lWlEX0jqwMzWuFWQFxGcNmCKcs4gcc/T9RYvzYgEHWHyC1+kLw6/Xdsp3UR2QNBKfYoxF+gn3mLWv9UgUbjzZdZy3DcNDe9MhxwP3G0wVGaXkh10S0ExYTiL6DONbYpJfjicz9FLLGeNpLZAjMQ5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ogL8IMts; arc=fail smtp.client-ip=40.107.249.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ogL8IMts"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zSTraA3QITi/ScDVDkDsqMM08hwy9H5QBtTUmi7qUPPSpeDG0TrJkiwdZiRWKw9utip0z4LApCwka3aLgKsde2ifdqjRmD3opjvuEHlGdYQutdiOekyEorgPA9GySVJIOBgL5t4NQa6Y7uAyj8K6OuVeuQ/SQNDFEQrSzVJiChMidwwM/x9QNi1e4eEQuko7pSS8u/b0UwWQjWtuimkzBSfbtoXecIa+FTWIaBb6rzq0bnuSLJT0JIdcbaQ9uwe2oentCxO/XxDVHUR/1AfTztDzHv7dPv6HPLakc5+iUGpk9b8jpvg5avAGz499cmKq5f0TGdvwewLMzsX5pg3u1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9D7PA6aFzmqVU2lLtS0EwBKJWFPcm877IuoXmo+pUOo=;
 b=CBmKUbOrD+TXj1wLGeOH1qdkNu7EEsHoXfvE5NpGZbd7zmY3IeZZsAXKjNKMKM0nYnpwr5QYj7/jGqnGfK3qz/ssSAc95FEdYt20U8v1JL0OWnO0yCDSJfp1qvb+s8fLbVg3nh54b9+uEcEPQC/ETGOLeSah2qgqQnYRsMLBP2VRab5Bk2CSUuxGKD0H8RkFYoNNKRQW1uT+VAnTabqm5VAgPQR0mA1GS6wo0U1XniGWAYTRR1OmEuoV1LZhuHPsvTOCparbkhOi7rLK4anZwUBAAwNuTwioVp0QqdLJWBVwz5ZX+TgojOWogDgkeBheHN0bgWhrkFuUjWF28FOeyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9D7PA6aFzmqVU2lLtS0EwBKJWFPcm877IuoXmo+pUOo=;
 b=ogL8IMtsy8lLBavTNzy+DNaSN1vvzC6tgVWIX1ZFQ0ujYsUMB3knaFNmBc42DJMUUkHX1fb8FBZYLOD/VxLav8YJ+xWfkasHUqnNwwuJ+dgr3HoCv6Q2rZU1ND7jgusvla1QYSak/B/zDGJKIVhBXOcGXKoj3rd2g95jVAlxl+IkNI5WDYYlICq7UemFr1i7MXaZk0hlapdkJu3B73pFdEf5giIJnEqQFiu+3ktdRwO+lKU1qWsHHignWX5c8POrkUfovQ327Chxd8IJGZh6eH5JozdTcE+lYvtop0e8cKfcNr/92CT29vgP/hlu+Oo8n+9omFzLUqLfwnNRQqlicg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM7PR04MB6853.eurprd04.prod.outlook.com (2603:10a6:20b:107::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Tue, 21 Jan
 2025 15:08:55 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 15:08:55 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/5] firmware: scmi/imx: Add i.MX95 LMM/CPU Protocol
Date: Tue, 21 Jan 2025 23:08:10 +0800
Message-Id: <20250121-imx-lmm-cpu-v1-0-0eab7e073e4e@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFq4j2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQyMD3czcCt2c3Fzd5IJSXRNDi5TExEQjU/NUIyWgjoKi1LTMCrBp0bG
 1tQDf0mRzXQAAAA==
X-Change-ID: 20250120-imx-lmm-cpu-418daaa257e2
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737472103; l=1945;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=ifgDquSQscn/T03rF9Vz+EDOYQiu9tyXilA81NHM2OA=;
 b=fjrH/jfBR0WMiUpMhFg16nHNhW5E0kmOKjXBY5/OHI2YJNJeFZg9xwHmGKtpRFFoVv4EDvMD9
 15AT+PglcFSAup/O2VFULM52tshVRt6mkgM1CSOAptmaec9sD2CwJ/C
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
X-MS-Office365-Filtering-Correlation-Id: 10ff29ef-c68f-4f35-1051-08dd3a2d85d6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cHhYR1BWWXRVRE5Uem1VZFRXcE43MDZlMVJIcnY3OVYzZ3pibHhuMkZoOXNL?=
 =?utf-8?B?NmJGQ3ZQTmlrSkF3WWJpMlozYXlqS04rNVozRjJlWmZUbVUxaG1zaUNOVGVs?=
 =?utf-8?B?YUplVENWRDBHVUlHQVcrd3NwZ2VLWEFBOTFJWUI5UE9sclFiYXNpOFV0NU85?=
 =?utf-8?B?UmpWUHNFUml4cW9Ham5SMkpUWHN1L0daRHZudlZRZkJScEUrdzVma3c1TjF6?=
 =?utf-8?B?RGx5Qm45MDU2K3R3NnFoWTUvLy9zcFB2d0U2WTdNaTZyOXJLckdNaHNzNDZu?=
 =?utf-8?B?MkppQkpEL3VvcUtqdlJXS3RqNFM2YXIrN09Cd3lmOHZlcjB2Z3I3VjcrcWZo?=
 =?utf-8?B?czB5ZDlmcUVoT3ZlR2VWcVpqOHE0WDJpU3l0QW55TFZCc0liNnpPdmhmUzJB?=
 =?utf-8?B?NFp0bE4wNGdnQWRaWVVCazF6YytNdmdteWVlWE00bExuWUVpaFc5WnU1OUYv?=
 =?utf-8?B?TVFlakN2OEdNOXovN1Zybno2ZDhlNitSVEJRM1cvcWFpNEw0OTVuYzlsM0lm?=
 =?utf-8?B?TE9pWVo4T013a1FWbDgyczhPUHZ1L2o4TzBBZldNTmZKdTVCME1uU0J0SmdY?=
 =?utf-8?B?SFJNLzlUYU1Sd05Za2pqVXd5SlFoUk9FUFlKbzBrWHppVWhXUTBXYlRlNW5P?=
 =?utf-8?B?RnBiZXZRQkZ1NFJXa3dGdU5HcmU3MGdnRUplTjkrS2NwcFJadUN0NHBpK1E5?=
 =?utf-8?B?cXdPU1BYRldPN0RIS0F5Z2lqOGhTc1RER3ExOGNkSWowUGE0M1VYKzZHVkhn?=
 =?utf-8?B?SWFQdWZ6N1Jtb2xQY0NIQ1hBMFdwSEJKcXdDS25OQVJ2YmRHWWNPVFVWY1Vs?=
 =?utf-8?B?YkVzU1RlYy9IaXRsTG5UdjlEQTBiNDhLcS9aME5JVUtjMlBHQnJSbXdwbGJM?=
 =?utf-8?B?VzIvckVKeGN2U3ByWldEd2RUUFNRRFJvUzNOU2FjM20zaUhYS0dLS3RIeVdI?=
 =?utf-8?B?OHVhajNrY3NWUEJJQ0lybnhXZ1N3RWtrc0NLajErdkpkYWpZa0VGdlpValZW?=
 =?utf-8?B?dTdHWUN0Q29JSmRsYURkVXVUeDdzZGJ4V3g0NS9uS3grTXo4WllXYWN4MzUz?=
 =?utf-8?B?UlBuYnhURHRGS1BpMnI2Vk1ROXo2NFBmSzNCVW5Ed0tMVHZLTGZXNG5KK3Fi?=
 =?utf-8?B?QkFWUktoRGxuWVVMYzBtRDY4RW9FRUlBQnVZNGtMbDg5NE8zTDJZK2xOK3Q2?=
 =?utf-8?B?d2VUc2hDS3JqdGtGWVVzdVkva0dsMzEwYk9rOUloUXpJa1U4aUJYRGJtMXA4?=
 =?utf-8?B?ZFpiWlQ3R0F2OEdqOVpDcHo3dityQ2FQeExZRURCY3VSMHZrUmJSUi9sQlZv?=
 =?utf-8?B?eVMydjFtZ3ZkWXRVSmtPcUJzSnpSTDl2UlhiR2tCelYxSjFiWStnaTRaaUE1?=
 =?utf-8?B?YlFOVTRZQlppWS9OMTNZdk1rSk4zdUxORTI2T3Jvam56Ky9rckYrTGVlODRD?=
 =?utf-8?B?VzEwc2RGSnJGeTlycURwa00rK1ZJVDFHS0FWdExsTW1RWVBvVnRIeGpvbWd1?=
 =?utf-8?B?dWVHb1N0VTVPSDFFRkFYOGF3Q25CczVmTXZZUU43MHBwbGFuZ1RBYzhpdnhI?=
 =?utf-8?B?YWFIOUY0ZDVpV0ZFME1UaW5EdE0xL0daY0FCSXZXRW9vbzh1VjJubkZPam9I?=
 =?utf-8?B?SFNDV1hMVEZJYm5US1dheC9QdEQyaEZPSXNhRWY4QmViRFMvampjYmxmWk5q?=
 =?utf-8?B?ckxYOWhhbWc0Z05uaTFUMGt4TjkxN3lrM2YxdmphNElnNXlhMUFocWxiSzN1?=
 =?utf-8?B?N2RDMWJmV3JCRlFOQW1YbnVoYU1QcGdZTGpUUnZVMzAxZ1BuandKamlXVzlU?=
 =?utf-8?B?ZXREeUExWjBzeVNFWS9acWNRLytTaXFaOTZwcXhITk1NSDBkNU1HSnlWSEN4?=
 =?utf-8?B?YmJGbEU1K2VOOC9qZlg0TUtHNVlrMWgzM212bTVTRXI1UU1HdG95aDVZcWJS?=
 =?utf-8?Q?lIossxgaiTiMbXKozG6y1o6zSnuP3Ecy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFFUdEw1ditxWTBzZjVyQmNlMEtQVElsVnliaGNSQ3JXSEJEWlBjanBFUGZU?=
 =?utf-8?B?UW1ZOHVmdUt2YjN0UnBHYUVHWWphRzBBK244T1g0VE9BZExjTXFUUWdINXBL?=
 =?utf-8?B?TUV0Z2ZDQ2pVNHlaZ2tvY1R3d2V1b3lkeUw4OE9JNXFIZWEyNDBKUmNaSjd5?=
 =?utf-8?B?aUVzZHFKUWdZNzhlY0g5NStiNFd2eWZIbkRlMHNhVjdzMXFDOXEydWMyQ2Jv?=
 =?utf-8?B?Ni92YVJCSTl1c3lqT25ja0RpRytnelJYa28xNXRMc1ZzbkpieGFMMnAwL1lx?=
 =?utf-8?B?eFhHZ2FiemZZaTkyT3JoZGZ1ZTlxLzlkSDhRaFJtb0NPSGtLcGE4VkZsb2tV?=
 =?utf-8?B?T3N3MitXTE1aOW50QXZITWE4MWxLUk9Bc0FRbFFpZGdUWWJqanFJVzBlTFFF?=
 =?utf-8?B?UVB1NitZcnVobEVtSDhCeVE0Y0xTaGpEVEdrRGpuS1FjQjFZeU4yeTY5U3RK?=
 =?utf-8?B?eG5RLzI0NHhJVVAyaUwrWUg3ekpPbXF5UDR6WDdlRFcwZFh2TWo2TVFnYUZo?=
 =?utf-8?B?b0o0SDFOSzlnZDNVVndYdm01eWZyTXU5dlEydkd1L0dGYWRyL2RHbUVDV1hB?=
 =?utf-8?B?ekd1cENzdUw5TG1HanBHTjhIZW5nak5GZGhPNHc5TkUxeEhRRWZjTjZ1alln?=
 =?utf-8?B?QUZvM3RQN25VMll1d1k0UlFYT0hTVW1MNHVvTXdzQnhDSzhocHRGYUI4N3l3?=
 =?utf-8?B?YnZRSW1YRS96TkpKaG5lamlXRWxqWUJ0ZnlZVnFlRUt3L1VVcTEvSTJ2QVdL?=
 =?utf-8?B?LzlQTXpaRDBDb3ppWHcwMEFpZGg5QWZsMzBKUys0WTR4S3BkWlk4RW5URThk?=
 =?utf-8?B?WnRNVnYvRHlDVmFiY1ZteWZmdnhiT3ZUdDFLbFF5bXczbWVXS1JvQ09pZlpW?=
 =?utf-8?B?RGIxQjIxVG10d0prN3dqRHlOQ3FGUnljN1JVOTBVUjhyWk10UDA0NDdjRWhD?=
 =?utf-8?B?aTkwTXJOcCtGblFDdjYyMWZrQ3dBZ0w2MndBanBXTGRXUFZjQnB2ZWdiQTBw?=
 =?utf-8?B?UHpwYi9tZU96eW1vU1pENVV0VkhZcjZBZW5lL3dHWm52aEdocmU3NGFqZXVw?=
 =?utf-8?B?Z3h6SXRJQXBweHIxYXFjQ1lWd2Q1Vkt3Q1ZueUR5ams5ZlJ2R0YrbEtjdFp4?=
 =?utf-8?B?UkpYVE80STdsVytFY0RVb2FuMzQzYXBPdE9wVWNnUVBVT0pJQzRQRWxRRFox?=
 =?utf-8?B?ZG9jWDZKSHYrbS9JcDdtbkpaTG51MU1sVVI5TDhaZCtaekEzVnp6YXk3cEU2?=
 =?utf-8?B?bXVmNmdvMUNZbWY2NUU3cDJ3Rm1KdmIrem1lNTBXaE9ueTNwS1FOVXQzN1VG?=
 =?utf-8?B?Tmdvc0Vza09OUFQ2cUJscVpYSTFCajhIK3BXWVArNVJJeWsvb2ZYZm1wMTJo?=
 =?utf-8?B?bER4cDZySUs5b0ZLbDY0VTFyejRQemJ2clFia0VzZEQvSFM2SllRRXhUQ3BK?=
 =?utf-8?B?a2Ftc0l3RkZob3d1QlkySytTQWYrQk9TZU1RcGZxSjZTTktkMmhkNDJRTC82?=
 =?utf-8?B?UjNQR3dqK21vT2NTanNXd1hsdjNkN2wvMk42T1R2YlIwd0FRT0I5cmlKVGg2?=
 =?utf-8?B?OG8vQUg3am8wdVBKQ3FPUDJkTWQzdjEzOWZsNE9UcjdwQ256L2o2RTFndHNJ?=
 =?utf-8?B?NXBnZUlSVUFPVG5FRDBZWjNLb3F2R2t3MmRPclBUUEtvTm5kd1BORE0rWmt5?=
 =?utf-8?B?Q3pTUDdsNXNQelhKZitvWjV3WTBFcGdJWTNyRndHMXJ6WXhrK0FxYkhRVU5s?=
 =?utf-8?B?S094WXFwYVhlSk81MC9idEhRTFJZL2RmQzdtcmZZOUdnZFhmTlRBRE5tY094?=
 =?utf-8?B?UUI1U2pPWFQ3eEFOdUczNEg1bjZKa3VXSnpUVnNIZVZYMW5xZ1F2QUE4SVVt?=
 =?utf-8?B?bC9CN1l2elVOYk9xZTU2MW1vZ08wRkZrV3U0RlIxMkhuYTE1SUVSbWkvNnRq?=
 =?utf-8?B?N0c5QW9TcFMwNmFmLzVuRWdWb09yRURmR2hUWDVLOVZTdDE0ajVzV2hwRWdP?=
 =?utf-8?B?Tno1NzRkZ2Mzc04vbGhTUWdlcTdRNlFJY04wYm9QOTJsVnE0V2kvK2VhOVJ5?=
 =?utf-8?B?M1dnY0NTMEZGZ00wVTVVQnhIQVE0NStvdFQ5djRXak12RHRtNi92cTZzeWZr?=
 =?utf-8?Q?dtfypaScyZWbADfU66fhpaytg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10ff29ef-c68f-4f35-1051-08dd3a2d85d6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 15:08:55.0776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lMY9dOAMNpXD2F5Wd55r6LUDN6S1ge+PEjqhx5ybTxJdHPbx/2T1ORpLxHvJtiowGelIFlKGVbBi9JYzIrQgcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6853

i.MX95 System Manager(SM) implements Logical Machine Management(LMM) and
CPU protocol to manage Logical Machine(LM) and CPUs(eg, M7).

To manage M7 in a separate LM or in same LM as Linux itself. LMM APIs
and CPU APIs are needed.

When M7 is in LM 'lm-m7', and this LM is managable by 'linux-lm',
linux could use LMM_BOOT, LMM_SHUTDOWN and etc to manage 'lm-m7'.

If in same LM, use CPU_START, CPU_STOP, CPU_RESET_VECTOR_SET and etc to
manage M7.

Both LMM/CPU APIs will be used by remoteproc driver. The remoteproc
patchset will be posted out after this patchset gets reviewed or in
good shape per Maitainer's view.

Build pass with COMPILE_TEST
Tested with remoteproc on i.MX95

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (5):
      firmware: arm_scmi: imx: Add i.MX95 LMM protocol
      firmware: arm_scmi: imx: Add i.MX95 CPU Protocol
      firmware: arm_scmi: imx: Add LMM and CPU documentation
      firmware: imx: Add i.MX95 SCMI LMM driver
      firmware: imx: Add i.MX95 SCMI CPU driver

 drivers/firmware/arm_scmi/vendors/imx/Kconfig      |  22 +
 drivers/firmware/arm_scmi/vendors/imx/Makefile     |   2 +
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c | 283 +++++++++
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c | 235 +++++++
 drivers/firmware/arm_scmi/vendors/imx/imx95.rst    | 692 +++++++++++++++++++++
 drivers/firmware/imx/Kconfig                       |  22 +
 drivers/firmware/imx/Makefile                      |   2 +
 drivers/firmware/imx/sm-cpu.c                      |  91 +++
 drivers/firmware/imx/sm-lmm.c                      |  89 +++
 include/linux/firmware/imx/sm.h                    |  56 ++
 include/linux/scmi_imx_protocol.h                  |  39 ++
 11 files changed, 1533 insertions(+)
---
base-commit: 0907e7fb35756464aa34c35d6abb02998418164b
change-id: 20250120-imx-lmm-cpu-418daaa257e2

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

