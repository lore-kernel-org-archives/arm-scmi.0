Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2054.outbound.protection.outlook.com [40.107.241.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986CC1F4282;
	Tue, 21 Jan 2025 15:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737472151; cv=fail; b=dqAs9DlPYo2JZS/3S6Cw9p7yKp8bJMvqBcPVJC9CpaydJ/vYlRu8w7MTbYMqNqbMLM02ftajrYgKaktsi9QMvscvvxXcx7PmSZn8jWMPL38iUbqaULN35EmXlV4wfGba69vyTxVA2E72BfhVdM8EYPbzw57G165ynu6kpZQb2ZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737472151; c=relaxed/simple;
	bh=QJIKfl0mXBhxX6voMTkPVP1lJTY6KSu7ej3OjfpObLA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=dhCkRdsMfYSJ2rx4KWE9R8Hq5p+vyiXihXq6qmYVyhQp5e3zDUzK+TG3fYUYsZwW5VRFYn8LwQBZqZMgbzg+pPZj8bAjQCCQrzp/ULBkifgIeAX2IgB936fXheHfZkL9nJ0lCRuIl0ZtxOEFHaGvH4c6IFugpUWu3QnTc+UU4jg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RH8fbHo2; arc=fail smtp.client-ip=40.107.241.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RH8fbHo2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yvxRrHY9fzuNzZ1K6tbC5sT5fqf7O/Hz8lYJKLUhL+Ze+1yl6fFkLukDhXlwZb2E2u+JJAR7vfXylCxS/t1Ry02sdWyVwhdUu6guYLkVbbEVyCFh3W9bzakB/HHYEI/Loshl0IFZhJz2FZ5VAyp8lvPYnx7zcvH35q1VccUXA9/V/onC716sEzE7DZzMdcVdWv0bULjfQ8j9dmZk3ZM+/mkhX2vySEvPmsF/wiYgdunGEWcqOBKxkDOMXwO3GHLhlUBS6nnkTct20+NPpGqKSXgOgm4EYhcQT+0EmVtobWWY2sj4Y8s0otML/IhcFyIzkhAi0yHhV30XDJHWXrwIJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pM9zzB6aeAwddWUvYjRSsDj4sKVB+qMmWDZSrT1KnH0=;
 b=MnZyB6RvOehfhRGX9PTInrEiCr/rufyIK+uW6WhBTHVQ2adqYSY4UBD9DrQPMdjdXqIvrwdu0fcwlVBgG0nLz9KaMZ8E225bwd33SE13hWfJBuP0TPvt1yr9N5R1RGd7XXIx02pRwO2X8cxykuo13sAAByA1avVVeOJcZJTx1npLzfj3jnaHPB+ElGM17shAK4keS2CT/ByLW5/U/DTOiJBrG/XYvIZ1kcpsVnYNhFc7emQy2Q2IJwdHvD5sb9CfDo2oS92cIXwXPJS2u0DO9IRfV6ycRDBYSuyifwWMxTkBOBYNbdDBXuBuwSaBJXzTrFw6mHqV1oS07uyaQ0WOjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pM9zzB6aeAwddWUvYjRSsDj4sKVB+qMmWDZSrT1KnH0=;
 b=RH8fbHo2aI70KsCWzIW+KQWhybrji8Ilq54KO653IlFgbWL0Igb1zDbGGhz3vNNuX32rw0rq8V4q1Q8WWvOh7Y+dEnW62mS5ztY+QxY/vgsRykULaFbkDjLV8TBXXzNvHS4kU3NTuiRzemayeyJ2d8s6NCS+lCnE8SOzukOgvIJUrCTk487uWJvSLDe87cOA4ztXsSj+n13aN+ikCun48hkiKgbRfLUL30FJVLtNdd84f+e5seYUQ6/v0jH4FrDjhE7aKNPVXkuqgAf0kVZtRo/9sisodvi7Loweu2jUpCVF6VtPT0JTKJbuaTuLm7ISRYp1ScwMSdc6MEm4Ln0ziQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM7PR04MB6853.eurprd04.prod.outlook.com (2603:10a6:20b:107::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Tue, 21 Jan
 2025 15:09:05 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 15:09:05 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 21 Jan 2025 23:08:13 +0800
Subject: [PATCH 3/5] firmware: arm_scmi: imx: Add LMM and CPU documentation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-imx-lmm-cpu-v1-3-0eab7e073e4e@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737472103; l=44537;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=MeSuPpktTf9tUfV5LgTrNjhdwrtDpTgMVUPHLUYTFZg=;
 b=hGGv9RCRuj0KxgrY25QsXTQ6+xyybISfTDk+wF5T0IM4Iu+WbznPQxdPx0tWz8oEZtWy7/xJq
 LA02ZvU9yQ2Apq3GDPJDKujzlPUIslsFw12VJt4v/UDv06zjSUq3c50
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
X-MS-Office365-Filtering-Correlation-Id: 7bf9d842-2614-4cef-2234-08dd3a2d8beb
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dnJmSG5GMXNHQUFmRkxYRExTTGJ5QWUwc09zRGxpdHM3WjA5dnBaNVZJNnJ2?=
 =?utf-8?B?Y1VYcHJOMlFtRUkwd3Y0c3A0VitjdVdVU0JQNmVFUFl4bDBWNUczOEtPaXR3?=
 =?utf-8?B?c3BzZExzKzQ2UWwzZFk4dmVrY21BYTNpYXROaTRCbmtmYVk4NkIvSFFRQjFH?=
 =?utf-8?B?Nkt2aitQSkdhekxxemI3b3RIREJORGhYbm5CeW5PVjBvcXlGZzNIeGRPdlZP?=
 =?utf-8?B?cUtBS085MVFOQk5jTmVUS1hCckM4QmNmU1lwaitIZjhXbzYwalRibUhTbkIr?=
 =?utf-8?B?WldKRUxVM1FvRE9FeGpjNnhBZ3V2R25LSGt4elhvZm05VlB0UG5zaThXRnJS?=
 =?utf-8?B?aWxYazVhNFc5L0owNFNpSDRyR2MrT0dFMkQrbGhEMWIvK3BTcndHOHhvY2FG?=
 =?utf-8?B?MWU3eUhmaVl2ZmdJZzd3Z2pSV0FROTd5eGxyN0hsanNreDlqdjUydks0TVJW?=
 =?utf-8?B?clZjL2FidVZZT1ZtcjVjYk1DZmg0bjVpSTBldEJuTlBJK2RqNWphVDgwNVhr?=
 =?utf-8?B?K1ZLOW9XUlJ3WmF0M3pKKzkzaG1qc3RRQWhOOHYxL0ZRanRka1cvN3U1TW83?=
 =?utf-8?B?M0lnc2FoUXZSWXdEVFNGMEVFWlJrL3pqQ0JFd1RMOGN5N1hOS21oeUxKdTlL?=
 =?utf-8?B?WWltWnRucHZQQXhyc3hYV2ZtdVp2SWhkVC9mbXc3SDJoNDhLUlN1WTltQ09I?=
 =?utf-8?B?RWxUeTlBWHdJbHBUcC96aEtMWncraXp2WXBVWUNYZU5rR2Y0NFhxWnpUQWNZ?=
 =?utf-8?B?dkZ4SVV6SXRsV2xIeGRUWHBYQ1EvYzZnM1JpREY2SUlkYlBqUnIwZVAxbmQ1?=
 =?utf-8?B?Y3h4YzVjYldQZ0I0Mk8waU5ScTRGWDIvTitBTHdIbS9KeVZxamQvVkJSV1FG?=
 =?utf-8?B?K3l4UXJwKzhWekdlUFFidEROaytLdGU5c2NIRHVlQ0E0bk1Qb2lCaFBhVmhM?=
 =?utf-8?B?ZkZVQmt4bWlzeTVLNzVTNWNDQUFzeU45ci9KWUUrc1BKMEdKY1Q5RXlMRjNV?=
 =?utf-8?B?MDV5VFd0RlNNYS8rL2xPUStDaUNoSndPMytvYTF2aXljTWg2Sm0wMHowNGxz?=
 =?utf-8?B?S3ZYdmhyditwWGJGVzV3Mzl2L3MzUEQrWEVFcENWWVRueDRKQ1A0QjhXdUJK?=
 =?utf-8?B?b3hHV1NNdlNzdTFEVENKZmVMbUxJK2JyT01OdGpualdQakhtSm1HS2NkYmtG?=
 =?utf-8?B?bmFOY3pUTW50b0tVWHZLK2xGR3V6MFNFZURhZnEwUGE2NWttM1BhVHZSMFJk?=
 =?utf-8?B?RnZQSk5QOEtpR09hN2NBUlVaVjd0YjlCNkVmYW9nUEZyM05reWZUZ211ODlT?=
 =?utf-8?B?VlJZR2pDeHRGcXo1cDhTRnpBMERqNFpsZERMS3dYL3N6UVhmcTJ1MUtxeE9U?=
 =?utf-8?B?WXdvZkh5U2YrQlFxZzBiRCt4VDVnZ3NKR3R4OWpMRDcvTHJaam5xQmpBYzE3?=
 =?utf-8?B?WGpMMXF1ZXZ4VzRKMGJxQmVzZnl0aGNnYlg1MEl1UW9MbkV5R3AzUHpKRTFL?=
 =?utf-8?B?aHNNcDJnTVVHQitPV1NhQTlveDZFc2U0MWVIYkxHUHlGR3ZsZ2FPTDRYaHdH?=
 =?utf-8?B?Q0VEQ0I2YWNTQWp5ZUJ0Ykw4ODlEZFFCcVp3UGZqblFHdFJlaGp6N25XWDVa?=
 =?utf-8?B?djg0NXRnWlc5K09RckdaZ0YwdHZRMU8zQjA4VFJ3eGhPTm9lWkpteDJzN2RF?=
 =?utf-8?B?VDBib1FrM2w3djBMOGFsTGs5Nm5yQWVuTzJ0ZCtQM0pHZkFlc3Z1Zk5hM1Rx?=
 =?utf-8?B?d0ZBVVJTR05wTTZxUHpBUjhEaDJreEZWNXAxUTVUNm1aQlNldTJEdzkxTUky?=
 =?utf-8?B?OU8yTXFDaDBmZ2NEZFZpcDdVYVpJV1lCTnR0SzdNdWdSMGJZQUlmd1ZYTDNn?=
 =?utf-8?B?Unh0MHJLdE9DTWUySzIxZjQrZXU5MW1HSTVlMGJJcTQ3UlVsMkJNVE5yS050?=
 =?utf-8?Q?vejMgaX3+FQRmPgRO2jGcDXddry+0Tm2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTlreElFRFllbTFVZnNySWNaNmtvalBzVjNtdW0xQi9hbnpmTmJjeklJRURH?=
 =?utf-8?B?YjlXbUZYN0R3b1lMNWZtdER3SzdFS0VrNEVXVzVXS0ZObGQwTDRYRyt5NkxN?=
 =?utf-8?B?OGRIcXJWWm0xaG94WFRLMmJicktUa0pTa1J2RHV3N2xBYlZVTHZHdXlYZ2hR?=
 =?utf-8?B?dEdLMVVvTEdXY3pyNzJub1VsWTIrNXF1KzluQjBYUzFyTWZMbFhiOWU0c1Rr?=
 =?utf-8?B?c1JpMHJTQUZQRjg5T29DTmVNUlVyRHBhb2NFOFFKWHBkcFVZU2tsREJLUDJZ?=
 =?utf-8?B?Vzd0SXdnUTdIMSt1MXhYcG8wbDZTZE9zZXFSVFgxa0VPZmNaM2J1Q0toUmpu?=
 =?utf-8?B?d3h5SnNaaU81cmQ1Ym94Uzd0VHpQNVBJOUN5SzBzNzY1dFRiRmU4RlJ3Y05i?=
 =?utf-8?B?akRqWGVUajR2b3QxOXdMd3JhMm9DdDNOSmZXdjdJNC92NDRzQlZZb2E5UnJX?=
 =?utf-8?B?d2gwUnZxRHVpY3BVSjVPekZpUytWRXNWaVhuT0hCaHV2eG8vOVlMSzRXdEFl?=
 =?utf-8?B?dGR4RWltVnozWUJsc3EvRTh5bEhiMnhqdkd4cEdNY051L1lKVk9GazNhS3VZ?=
 =?utf-8?B?V0lQRVJSV1gwSjVUVVhma1N0UFFZTFprZ0hCL2k2L3JuMHJPdHJsSnFZdTda?=
 =?utf-8?B?NXU4VVlTTm1zM0piMTZGK2tIOWkzT29xK1hhcEVJbDZkSWloNzUrUzhBU2R4?=
 =?utf-8?B?eEt6QVNoay9zQ0VSUlFWWkVmS0pRVGFoU2VxbGtpVTVmQmNVM3J3ME9wMTJ2?=
 =?utf-8?B?WFk5VnZ2cFJQd21KWUN3dndOR2oyZU4ya2Q4b1hyMEEvZllpZXhRT0xGK1lw?=
 =?utf-8?B?YVNSVVdibzlINUM0dE1zMXNURC96ZzIxb1lxbUx4ZEprU2MxTkl3VXVwaGxG?=
 =?utf-8?B?eEpWWE83cFJaNjRhbi9QN1BVRDlQckx0UGtqLy9pdmtVcmprNjdhNHhBSi9s?=
 =?utf-8?B?T2s0M1Y1QVA0YkVGbDY3aEVjT3VuSVd4cDd2MG9HaGFlN2Y5Q0s4QW1PVVUy?=
 =?utf-8?B?TzJ6Szhmb2tLSnRJZ1VwV0FKVG9UUmRWcEk2Z040VnprQzNKaThkZFFUK1Ju?=
 =?utf-8?B?bW9KcTBxWWpRKzlZVkxzQkxBenY5RkxubEFrR1ZGQlloRjljK0NtMVE0bS9n?=
 =?utf-8?B?ZEkzeHlTU29pY2drL1hWYWY1VU94ZUJreHpOZGFIbEY0aGF4Sno0Mm8rZE0y?=
 =?utf-8?B?M1E1dUQ3Ri85TnJnSnUwd2NjVHl0YXVJMFdBQUlWcGJGU1dJTDV5NjhoUmpl?=
 =?utf-8?B?NEZlS2RlZHM4c01UaXdKVTNzMEMyQ3VDUVJNU0pQUmJwNzNMWklZN2RoVmJh?=
 =?utf-8?B?TktKRENTM1JUVUJzVGpzbjJzWXJGVkVDQXFkYmZtYTV6MDBhc1U2T2NIclpn?=
 =?utf-8?B?WjlVL2h5MzMyVXRGbUJNOGpSdWJnL0tpQkdocjdpc1p3NFFad0VBaTd2dUk3?=
 =?utf-8?B?b2hYWS9DdUo0NzRLRFU1dFF5bFZhRUxLVHZBNXI0ajZMYWhvaXFOc09iTUJL?=
 =?utf-8?B?Vzc2R3lXV0VUNmVSbHRFbExuZlcyVjdwYjhQU1pqVFlMTTZVYkNjNXlUbUlk?=
 =?utf-8?B?Qmdqd2NjckhvM2pUWDA5LzdTVWJxOFY0d3N4TldKTzdueFd6TCtlck14VGhZ?=
 =?utf-8?B?N3U3K0xuL0x6ci9LeGI0aFk3ZVdRZW5ZeitqU2ZTUHhRdmV2bjIrRkNUWDNw?=
 =?utf-8?B?cWRrck53K3htVEhKK2ZuNkxaVVl5clpqOFdnR1lhL2VOR2V4T0Yrd3lTQ0hM?=
 =?utf-8?B?U2ZFNERWdGhQRkhKMnRvbFRTUVZHdmswZ0pBSERreWtsem5OQXpZVnpuYW9O?=
 =?utf-8?B?U3UvWUNobU14MFAyRXBVQUdCT1BpKzNrQ1pkUnl6ZFdWUFhQZzBjcVNUdGk4?=
 =?utf-8?B?VHJKeVJseTV5UWVFMUNLWk9lVEJORXRKK1lqZXFrempsTWtyUWhMS2JKdmhu?=
 =?utf-8?B?K24rTTZoaDhPRGJnOGEwUk1sdE9IY3ErbGhtOXdSUG93TW1kQmxWTU5ONm5v?=
 =?utf-8?B?TXVxMHV0dFpWcUJaUEQxcWxoVUpLMnk2a2xUYmFVMUJuaXpFS0tWVG5kRzFJ?=
 =?utf-8?B?SEFDZGx1WEF1SGJBd3lBK21vSkVhWmkxTXZVWVdac3JhQldlVGprNjhxNTdj?=
 =?utf-8?Q?wM3dXj5SQKh4F/PHJfzNOfywK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bf9d842-2614-4cef-2234-08dd3a2d8beb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 15:09:05.4121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l7wRpy7ARyLloarJA2g2Xh56Cb3wl8+c29kAdzWiNLNLUWal3GO8xYoIr9FaB3H/CGZeg6F2w0KexYzhDpqsTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6853

From: Peng Fan <peng.fan@nxp.com>

Add i.MX95 Logical Machine Management and CPU Protocol documentation.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/arm_scmi/vendors/imx/imx95.rst | 692 ++++++++++++++++++++++++
 1 file changed, 692 insertions(+)

diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
index b2dfd6c46ca2f5f12f0475c24cb54c060e9fa421..384d4f9c27e489a9c54cdde79c9f03a6f5979630 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
@@ -32,6 +32,419 @@ port, and deploy the SM on supported processors.
 The SM implements an interface compliant with the Arm SCMI Specification
 with additional vendor specific extensions.
 
+SCMI_LMM: System Control and Management Logical Machine Management Vendor Protocol
+==================================================================================
+
+This protocol is intended for boot, shutdown, and reset of other logical
+machines (LM). It is usually used to allow one LM to manager another used
+as an offload or accelerator engine. Notifications from this protocol can
+also be used to manage a communication link to another LM. The LMM protocol
+provides functions to:
+
+- Describe the protocol version.
+- Discover implementation attributes.
+- Discover the LMs defined in the system.
+- Boot an LM.
+- Shut down an LM.
+- Reset an LM.
+- Wake an LM from suspend.
+- Suspend an LM (gracefully).
+- Request a graceful shutdown or reset of an LM.
+- Allow an agent to forcibly power down or reset an LM.
+- Read boot/shutdown/reset information for an LM.
+- Get notifications when an LM boots or shuts down.
+
+Commands:
+_________
+
+PROTOCOL_VERSION
+~~~~~~~~~~~~~~~~
+
+message_id: 0x0
+protocol_id: 0x80
+
++---------------+--------------------------------------------------------------+
+|Return values                                                                 |
++---------------+--------------------------------------------------------------+
+|Name           |Description                                                   |
++---------------+--------------------------------------------------------------+
+|int32 status   | See ARM SCMI Specification for status code definitions.      |
++---------------+--------------------------------------------------------------+
+|uint32 version | For this revision of the specification, this value must be   |
+|               | 0x10000.                                                     |
++---------------+--------------------------------------------------------------+
+
+PROTOCOL_ATTRIBUTES
+~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x1
+protocol_id: 0x80
+
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      | See ARM SCMI Specification for status code definitions.   |
++------------------+-----------------------------------------------------------+
+|uint32 attributes |Protocol attributes:                                       |
+|                  |Bits[31:8] Reserved, must be zero.                         |
+|                  |Bits[7:0] Number of Logical Machines                       |
++------------------+-----------------------------------------------------------+
+
+PROTOCOL_MESSAGE_ATTRIBUTES
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x2
+protocol_id: 0x80
+
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: in case the message is implemented and available  |
+|                  |to use.                                                    |
+|                  |NOT_FOUND: if the message identified by message_id is      |
+|                  |invalid or not implemented                                 |
++------------------+-----------------------------------------------------------+
+|uint32 attributes |Flags that are associated with a specific function in the  |
+|                  |protocol. For all functions in this protocol, this         |
+|                  |parameter has a value of 0                                 |
++------------------+-----------------------------------------------------------+
+
+LMM_ATTRIBUTES
+~~~~~~~~~~~~~~
+
+message_id: 0x3
+protocol_id: 0x80
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 lmid       |ID of the Logical Machine                                  |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if valid attributes are returned.                 |
+|                  |NOT_FOUND: if lmId not points to a valid logical machine.  |
+|                  |DENIED: if the agent does not have permission to get info  |
+|                  |for the LM specified by lmid.                              |
++------------------+-----------------------------------------------------------+
+
+LMM_BOOT
+~~~~~~~~
+
+message_id: 0x4
+protocol_id: 0x80
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 lmid       |ID of the Logical Machine                                  |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if LM successfully booted.                        |
+|                  |NOT_FOUND: if lmId not points to a valid logical machine.  |
+|                  |INVALID_PARAMETERS: if lmId is same as the caller.         |
+|                  |DENIED: if the agent does not have permission to manage the|
+|                  |the LM specified by lmid.                                  |
++------------------+-----------------------------------------------------------+
+
+LMM_RESET
+~~~~~~~~~
+
+message_id: 0x5
+protocol_id: 0x80
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 lmid       |ID of the Logical Machine                                  |
++------------------+-----------------------------------------------------------+
+|uint32 flags      |Reset flags:                                               |
+|                  |Bits[31:1] Reserved, must be zero.                         |
+|                  |Bit[0] Graceful request:                                   |
+|                  |Set to 1 if the request is a graceful request.             |
+|                  |Set to 0 if the request is a forceful request.             |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if LM successfully resets.                        |
+|                  |NOT_FOUND: if lmId not points to a valid logical machine.  |
+|                  |INVALID_PARAMETERS: if lmId is same as the caller.         |
+|                  |DENIED: if the agent does not have permission to manage the|
+|                  |the LM specified by lmid.                                  |
++------------------+-----------------------------------------------------------+
+
+LMM_SHUTDOWN
+~~~~~~~~~~~~
+
+message_id: 0x6
+protocol_id: 0x80
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 lmid       |ID of the Logical Machine                                  |
++------------------+-----------------------------------------------------------+
+|uint32 flags      |Reset flags:                                               |
+|                  |Bits[31:1] Reserved, must be zero.                         |
+|                  |Bit[0] Graceful request:                                   |
+|                  |Set to 1 if the request is a graceful request.             |
+|                  |Set to 0 if the request is a forceful request.             |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if LM successfully shutdowns.                     |
+|                  |NOT_FOUND: if lmId not points to a valid logical machine.  |
+|                  |INVALID_PARAMETERS: if lmId is same as the caller.         |
+|                  |DENIED: if the agent does not have permission to manage the|
+|                  |the LM specified by lmid.                                  |
++------------------+-----------------------------------------------------------+
+
+LMM_WAKE
+~~~~~~~~
+
+message_id: 0x7
+protocol_id: 0x80
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 lmid       |ID of the Logical Machine                                  |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if LM successfully wakes.                         |
+|                  |NOT_FOUND: if lmId not points to a valid logical machine.  |
+|                  |INVALID_PARAMETERS: if lmId is same as the caller.         |
+|                  |DENIED: if the agent does not have permission to manage the|
+|                  |the LM specified by lmid.                                  |
++------------------+-----------------------------------------------------------+
+
+LMM_SUSPEND
+~~~~~~~~~~~
+
+message_id: 0x8
+protocol_id: 0x80
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 lmid       |ID of the Logical Machine                                  |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if LM successfully suspends.                      |
+|                  |NOT_FOUND: if lmId not points to a valid logical machine.  |
+|                  |INVALID_PARAMETERS: if lmId is same as the caller.         |
+|                  |DENIED: if the agent does not have permission to manage the|
+|                  |the LM specified by lmid.                                  |
++------------------+-----------------------------------------------------------+
+
+LMM_NOTIFY
+~~~~~~~~~~
+
+message_id: 0x9
+protocol_id: 0x80
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 lmid       |ID of the Logical Machine                                  |
++------------------+-----------------------------------------------------------+
+|uint32 flags      |Notification flags:                                        |
+|                  |Bits[31:3] Reserved, must be zero.                         |
+|                  |Bit[3] Wake (resume) notification:                         |
+|                  |Set to 1 to send notification.                             |
+|                  |Set to 0 if no notification.                               |
+|                  |Bit[2] Suspend (sleep) notification:                       |
+|                  |Set to 1 to send notification.                             |
+|                  |Set to 0 if no notification.                               |
+|                  |Bit[1] Shutdown (off) notification:                        |
+|                  |Set to 1 to send notification.                             |
+|                  |Set to 0 if no notification.                               |
+|                  |Bit[0] Boot (on) notification:                             |
+|                  |Set to 1 to send notification.                             |
+|                  |Set to 0 if no notification                                |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the notification state successfully updated.   |
+|                  |NOT_FOUND: if lmId not points to a valid logical machine.  |
+|                  |INVALID_PARAMETERS: if input attributes flag specifies     |
+|                  |unsupported or invalid configurations.                     |
+|                  |DENIED: if the agent does not have permission to request   |
+|                  |the notification.                                          |
++------------------+-----------------------------------------------------------+
+
+LMM_RESET_REASON
+~~~~~~~~~~~~~~~~
+
+message_id: 0xA
+protocol_id: 0x80
+
++---------------------+--------------------------------------------------------+
+|Parameters                                                                    |
++---------------------+--------------------------------------------------------+
+|Name                 |Description                                             |
++---------------------+--------------------------------------------------------+
+|uint32 lmid          |ID of the Logical Machine                               |
++---------------------+--------------------------------------------------------+
+|Return values                                                                 |
++---------------------+--------------------------------------------------------+
+|Name                 |Description                                             |
++---------------------+--------------------------------------------------------+
+|int32 status         |SUCCESS: if LM successfully suspends.                   |
+|                     |NOT_FOUND: if lmId not points to a valid logical machine|
+|                     |DENIED: if the agent does not have permission to request|
+|                     |the reset reason.                                       |
++---------------------+--------------------------------------------------------+
+|uint32 bootflags     |Boot reason flags. This parameter has the format:       |
+|                     |Bits[31] Valid.                                         |
+|                     |Set to 1 if the entire reason is valid.                 |
+|                     |Set to 0 if the entire reason is not valid.             |
+|                     |Bits[30:29] Reserved, must be zero.                     |
+|                     |Bit[28] Valid origin:                                   |
+|                     |Set to 1 if the origin field is valid.                  |
+|                     |Set to 0 if the origin field is not valid.              |
+|                     |Bits[27:24] Origin.                                     |
+|                     |Bit[23] Valid err ID:                                   |
+|                     |Set to 1 if the error ID field is valid.                |
+|                     |Set to 0 if the error ID field is not valid.            |
+|                     |Bits[22:8] Error ID.                                    |
+|                     |Bit[7:0] Reason                                         |
++---------------------+--------------------------------------------------------+
+|uint32 shutdownflags |Shutdown reason flags. This parameter has the format:   |
+|                     |Bits[31] Valid.                                         |
+|                     |Set to 1 if the entire reason is valid.                 |
+|                     |Set to 0 if the entire reason is not valid.             |
+|                     |Bits[30:29] Number of valid extended info words.        |
+|                     |Bit[28] Valid origin:                                   |
+|                     |Set to 1 if the origin field is valid.                  |
+|                     |Set to 0 if the origin field is not valid.              |
+|                     |Bits[27:24] Origin.                                     |
+|                     |Bit[23] Valid err ID:                                   |
+|                     |Set to 1 if the error ID field is valid.                |
+|                     |Set to 0 if the error ID field is not valid.            |
+|                     |Bits[22:8] Error ID.                                    |
+|                     |Bit[7:0] Reason                                         |
++---------------------+--------------------------------------------------------+
+|uint32 extinfo[0,20] |Array of extended info words                            |
++---------------------+--------------------------------------------------------+
+
+LMM_POWER_ON
+~~~~~~~~~~~~
+
+message_id: 0xB
+protocol_id: 0x80
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 lmid       |ID of the Logical Machine                                  |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if LM successfully suspends.                      |
+|                  |NOT_FOUND: if lmId not points to a valid logical machine.  |
+|                  |INVALID_PARAMETERS: if lmId is same as the caller.         |
+|                  |DENIED: if the agent does not have permission to manage the|
+|                  |the LM specified by lmid.                                  |
++------------------+-----------------------------------------------------------+
+
+NEGOTIATE_PROTOCOL_VERSION
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x10
+protocol_id: 0x80
+
++--------------------+---------------------------------------------------------+
+|Parameters                                                                    |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|uint32 version      |The negotiated protocol version the agent intends to use |
++--------------------+---------------------------------------------------------+
+|Return values                                                                 |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|int32 status        |SUCCESS: if the negotiated protocol version is supported |
+|                    |by the platform. All commands, responses, and            |
+|                    |notifications post successful return of this command must|
+|                    |comply with the negotiated version.                      |
+|                    |NOT_SUPPORTED: if the protocol version is not supported. |
++--------------------+---------------------------------------------------------+
+
+Notifications
+_____________
+
+LMM_EVENT
+~~~~~~~~~
+
+message_id: 0x0
+protocol_id: 0x80
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 lmid       |Identifier for the LM that caused the transition.          |
++------------------+-----------------------------------------------------------+
+|uint32 eventlm    |Identifier for the LM the event is for.                    |
++------------------+-----------------------------------------------------------+
+|uint32 flags      |LM events:                                                 |
+|                  |Bits[31:3] Reserved, must be zero.                         |
+|                  |Bit[3] Wake (resume) event:                                |
+|                  |1 LM has awakened.                                         |
+|                  |0 not a wake event.                                        |
+|                  |Bit[2] Suspend (sleep) event:                              |
+|                  |1 LM has suspended.                                        |
+|                  |0 not a suspend event.                                     |
+|                  |Bit[1] Shutdown (off) event:                               |
+|                  |1 LM has shutdown.                                         |
+|                  |0 not a shutdown event.                                    |
+|                  |Bit[0] Boot (on) event:                                    |
+|                  |1 LM has booted.                                           |
+|                  |0 not a boot event.                                        |
++------------------+-----------------------------------------------------------+
+
 SCMI_BBM: System Control and Management BBM Vendor Protocol
 ==============================================================
 
@@ -436,6 +849,285 @@ protocol_id: 0x81
 |                  |0 no button change detected.                               |
 +------------------+-----------------------------------------------------------+
 
+SCMI_CPU: System Control and Management CPU Vendor Protocol
+==============================================================
+
+This protocol allows an agent to start or stop a CPU. It is used to manage
+auxiliary CPUs in an LM (e.g. additional cores in an AP cluster), The CPU
+protocol provides functions to:
+
+- Describe the protocol version.
+- Discover implementation attributes.
+- Discover the CPUs defined in the system.
+- Start a CPU.
+- Stop a CPU.
+- Set the boot and resume addresses for a CPU.
+- Set the sleep mode of a CPU.
+- Configure wake-up sources for a CPU.
+- Configure power domain reactions (LPM mode and retention mask) for a CPU.
+- The CPU IDs can be found in the CPU section of the SoC DEVICE: SM Device
+  Interface. They can also be found in the SoC RM. See the CPU Mode Control
+  (CMC) list in General Power Controller (GPC) section.
+
+CPU settings are not aggregated and setting their state is normally exclusive
+to one client.
+
+Commands:
+_________
+
+PROTOCOL_VERSION
+~~~~~~~~~~~~~~~~
+
+message_id: 0x0
+protocol_id: 0x82
+
++---------------+--------------------------------------------------------------+
+|Return values                                                                 |
++---------------+--------------------------------------------------------------+
+|Name           |Description                                                   |
++---------------+--------------------------------------------------------------+
+|int32 status   | See ARM SCMI Specification for status code definitions.      |
++---------------+--------------------------------------------------------------+
+|uint32 version | For this revision of the specification, this value must be   |
+|               | 0x10000.                                                     |
++---------------+--------------------------------------------------------------+
+
+PROTOCOL_ATTRIBUTES
+~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x1
+protocol_id: 0x82
+
++---------------+--------------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      | See ARM SCMI Specification for status code definitions.   |
++------------------+-----------------------------------------------------------+
+|uint32 attributes |Protocol attributes:                                       |
+|                  |Bits[31:16] Reserved, must be zero.                        |
+|                  |Bits[15:0] Number of CPUs                                  |
++------------------+-----------------------------------------------------------+
+
+PROTOCOL_MESSAGE_ATTRIBUTES
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x2
+protocol_id: 0x82
+
++---------------+--------------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: in case the message is implemented and available  |
+|                  |to use.                                                    |
+|                  |NOT_FOUND: if the message identified by message_id is      |
+|                  |invalid or not implemented                                 |
++------------------+-----------------------------------------------------------+
+|uint32 attributes |Flags that are associated with a specific function in the  |
+|                  |protocol. For all functions in this protocol, this         |
+|                  |parameter has a value of 0                                 |
++------------------+-----------------------------------------------------------+
+
+CPU_ATTRIBUTES
+~~~~~~~~~~~~~~
+
+message_id: 0x4
+protocol_id: 0x82
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 cpuid      |Identifier for the CPU                                     |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if valid attributes are returned successfully.    |
+|                  |NOT_FOUND: if the cpuid is not valid.                      |
++------------------+-----------------------------------------------------------+
+|uint32 attributes |Bits[31:0] Reserved, must be zero                          |
++------------------+-----------------------------------------------------------+
+|char name[16]     |NULL terminated ASCII string with CPU name up to 16 bytes  |
++------------------+-----------------------------------------------------------+
+
+CPU_START
+~~~~~~~~~
+
+message_id: 0x4
+protocol_id: 0x82
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 cpuid      |Identifier for the CPU                                     |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the cpu is started successfully.               |
+|                  |NOT_FOUND: if cpuid is not valid.                          |
+|                  |DENIED: the calling agent is not allowed to start this CPU.|
++------------------+-----------------------------------------------------------+
+
+CPU_STOP
+~~~~~~~~
+
+message_id: 0x5
+protocol_id: 0x82
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 cpuid      |Identifier for the CPU                                     |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the cpu is started successfully.               |
+|                  |NOT_FOUND: if cpuid is not valid.                          |
+|                  |DENIED: the calling agent is not allowed to stop this CPU. |
++------------------+-----------------------------------------------------------+
+
+CPU_RESET_VECTOR_SET
+~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x6
+protocol_id: 0x82
+
++----------------------+-------------------------------------------------------+
+|Parameters                                                                    |
++----------------------+-------------------------------------------------------+
+|Name                  |Description                                            |
++----------------------+-------------------------------------------------------+
+|uint32 cpuid          |Identifier for the CPU                                 |
++----------------------+-------------------------------------------------------+
+|uint32 flags          |Reset vector flags:                                    |
+|                      |Bit[31] Resume flag.                                   |
+|                      |Set to 1 to update the reset vector used on resume.    |
+|                      |Bit[30] Boot flag.                                     |
+|                      |Set to 1 to update the reset vector used for boot.     |
+|                      |Bits[29:1] Reserved, must be zero.                     |
+|                      |Bit[0] Table flag.                                     |
+|                      |Set to 1 if vector is the vector table base address.   |
++----------------------+-------------------------------------------------------+
+|uint32 resetVectorLow |Lower vector:                                          |
+|                      |If bit[0] of flags is 0, the lower 32 bits of the      |
+|                      |physical address where the CPU should execute from on  |
+|                      |reset. If bit[0] of flags is 1, the lower 32 bits of   |
+|                      |the vector table base address                          |
++----------------------+-------------------------------------------------------+
+|uint32 resetVectorhigh|Upper vector:                                          |
+|                      |If bit[0] of flags is 0, the upper 32 bits of the      |
+|                      |physical address where the CPU should execute from on  |
+|                      |reset. If bit[0] of flags is 1, the upper 32 bits of   |
+|                      |the vector table base address                          |
++----------------------+-------------------------------------------------------+
+|Return values                                                                 |
++----------------------+-------------------------------------------------------+
+|Name                  |Description                                            |
++----------------------+-------------------------------------------------------+
+|int32 status          |SUCCESS: if the CPU reset vector is set successfully.  |
+|                      |NOT_FOUND: if cpuId does not point to a valid CPU.     |
+|                      |INVALID_PARAMETERS: the requested vector type is not   |
+|                      |supported by this CPU.                                 |
+|                      |DENIED: the calling agent is not allowed to set the    |
+|                      |reset vector of this CPU                               |
++----------------------+-------------------------------------------------------+
+
+CPU_SLEEP_MODE_SET
+~~~~~~~~~~~~~~~~~~
+message_id: 0x7
+protocol_id: 0x82
+
++----------------------+-------------------------------------------------------+
+|Parameters                                                                    |
++----------------------+-------------------------------------------------------+
+|Name                  |Description                                            |
++----------------------+-------------------------------------------------------+
+|uint32 cpuid          |Identifier for the CPU                                 |
++----------------------+-------------------------------------------------------+
+|uint32 flags          |Sleep mode flags:                                      |
+|                      |Bits[31:1] Reserved, must be zero.                     |
+|                      |Bit[0] IRQ mux:                                        |
+|                      |If set to 1 the wakeup mux source is the GIC, else if 0|
+|                      |then the GPC                                           |
++----------------------+-------------------------------------------------------+
+|uint32 sleepmode      |target sleep mode                                      |
++----------------------+-------------------------------------------------------+
+|Return values                                                                 |
++----------------------+-------------------------------------------------------+
+|Name                  |Description                                            |
++----------------------+-------------------------------------------------------+
+|int32 status          |SUCCESS: if the CPU sleep mode is set successfully.    |
+|                      |NOT_FOUND: if cpuId does not point to a valid CPU.     |
+|                      |INVALID_PARAMETERS: the sleepmode or flags is invalid. |
+|                      |DENIED: the calling agent is not allowed to configure  |
+|                      |the CPU                                                |
++----------------------+-------------------------------------------------------+
+
+CPU_INFO_GET
+~~~~~~~~~~~~
+message_id: 0xC
+protocol_id: 0x82
+
++----------------------+-------------------------------------------------------+
+|Parameters                                                                    |
++----------------------+-------------------------------------------------------+
+|Name                  |Description                                            |
++----------------------+-------------------------------------------------------+
+|uint32 cpuid          |Identifier for the CPU                                 |
++----------------------+-------------------------------------------------------+
+|Return values                                                                 |
++----------------------+-------------------------------------------------------+
+|Name                  |Description                                            |
++----------------------+-------------------------------------------------------+
+|int32 status          |SUCCESS: if valid attributes are returned successfully.|
+|                      |NOT_FOUND: if the cpuid is not valid.                  |
++----------------------+-------------------------------------------------------+
+|uint32 runmode        |Run mode for the CPU                                   |
++----------------------+-------------------------------------------------------+
+|uint32 sleepmode      |Sleep mode for the CPU                                 |
++----------------------+-------------------------------------------------------+
+|uint32 resetvectorlow |Reset vector low 32 bits for the CPU                   |
++----------------------+-------------------------------------------------------+
+|uint32 resetvecothigh |Reset vector high 32 bits for the CPU                  |
++----------------------+-------------------------------------------------------+
+
+NEGOTIATE_PROTOCOL_VERSION
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+message_id: 0x10
+protocol_id: 0x82
+
++--------------------+---------------------------------------------------------+
+|Parameters                                                                    |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|uint32 version      |The negotiated protocol version the agent intends to use |
++--------------------+---------------------------------------------------------+
+|Return values                                                                 |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|int32 status        |SUCCESS: if the negotiated protocol version is supported |
+|                    |by the platform. All commands, responses, and            |
+|                    |notifications post successful return of this command must|
+|                    |comply with the negotiated version.                      |
+|                    |NOT_SUPPORTED: if the protocol version is not supported. |
++--------------------+---------------------------------------------------------+
+
 SCMI_MISC: System Control and Management MISC Vendor Protocol
 ================================================================
 

-- 
2.37.1

