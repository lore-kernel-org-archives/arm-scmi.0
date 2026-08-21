Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013044.outbound.protection.outlook.com [52.101.72.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B7E426431;
	Fri, 21 Aug 2026 15:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.44
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787325682; cv=fail; b=CoRoDuCQFz+5DfG/493WsNDIQb+yxI+I+UwyaKoVyXmvFxfF8c+Aa2X5WJpPLJPt8OlVpuYdifJTkGwlafHsVd2Xw8EiBSlNnuE7CQcd80z0fcY4m6w5cF9zK1+4mo2zkd0VRQiegjTqvRBZdPxCpw8ia0g+Y091TYaJeoMHDd0=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787325682; c=relaxed/simple;
	bh=v9BqutEUAPvrZSeE0dYRJjv92h2Fl5d+6yeelL/qmCg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:Content-Type:
	 MIME-Version; b=tSIQ+kbhwZZDgJnTkPGeGoUZsIPxjXCqDfNqvuErrvd5QeBhy6uPkG8Yisn3Ci9yhaYRSdOf0QX5c7bl27NJv3HpAFk/GsMnjtPJdTVhh6q/PRxw03Lq6XcQ4NcXE2E7/34qOd1EVIzqPHup/0gqRTrTr0Psc3MmQv7/9row+4k=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KtSB05sm; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KtSB05sm; arc=fail smtp.client-ip=52.101.72.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KtSB05sm";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KtSB05sm"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=B/zLOLATY24pKNNik9WrI1n4TsNvBg1DPxFvtcNJpHELAjBURAUU+H3KePrBu0U1gLgFvzasBTc0sYnVFESk/zoKs7tb6YgsNz+O9DVX4D6sf2CBt1Ux5AR/RwDtiJVejwKihlBgmb4v8NyGoICSO61O5xAyOPLf+f5iZ7E2xkSX1FOtcszW0wro/qssvFc8oZSGMZMnAQERNE5btbmlSUoefzVNPPDwqq32+fTdABjCxg7uwdOL77hN1AnfxjNf6rVh4nwFy3VLFbEjqJYL0+vmEF4X2rFm6bDCeW0Bb8zE/cjbPz66oOQxEKRNHLXys88AN3sJBk4BIIgusMdodQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v9BqutEUAPvrZSeE0dYRJjv92h2Fl5d+6yeelL/qmCg=;
 b=gHmeoDVhRPKcBlgYEYta5KLdOgD2hf2hEO9AJs5OAzN84XV4Llb7N4j5tc9l+fLvbo2Ff7ZFwj/DIHeAlg1Q6WmJCu8CPh20nX5DQzfjjd5DgR8l30fEthngRvKwVzvYXXGBlx8vwSE1pp8oF/izaFWZ4cul2PgJkD/h8woou/we0FyOq5yBRmOBvzVYE8yoYmLpGJML1JktbVT3BjQ9sNOXXk3klUO0vwSSToVjwtW/YcNEJmtWZTRX9wwWYsgIhp3wvh8u1ajynEc3dhLjuZUxhK9cGdFI2tbgbjkJE3qG1PHWJ8fL+1mjpKI+oLEV+SLAavp+NecabreNF5i2Ow==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9BqutEUAPvrZSeE0dYRJjv92h2Fl5d+6yeelL/qmCg=;
 b=KtSB05smVHoHBGjQuoiwOPCeYYJnK3QvyKJQIWhD+lncirAmG8KI0QSM3atyXUtaT+kCdQYkfE1YWpvefs8U8exlqmxlYvuRfpugPMYW+2DeNsk7AOeQu42Z/gY2pWxvLuzwaJNMAgGT2/wq8W6fxEvfnLD+osIMDJmVQ13B2cs=
Received: from DU6P191CA0030.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::9) by
 AS4PR08MB8093.eurprd08.prod.outlook.com (2603:10a6:20b:588::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.9; Fri, 21 Aug
 2026 15:21:15 +0000
Received: from DU6PEPF0000A7DD.eurprd02.prod.outlook.com
 (2603:10a6:10:53f:cafe::30) by DU6P191CA0030.outlook.office365.com
 (2603:10a6:10:53f::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 15:21:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7DD.mail.protection.outlook.com (10.167.8.37) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3 via
 Frontend Transport; Fri, 21 Aug 2026 15:21:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xaH2QdnlRJzAHROrzeIqraTGtVpV2R7gkR//2frmIFEb/oPAmHAkmboPZ/AGWUqkzYdU6uH63ZGe9+EJjpqa5A0iX1GGUoniKW5O+/fYrvhjqSwHKCL5GJeaLhfHqUXMmbyDhnidKuy1iYy76CZ5GkxM2TtjTDTTJJnSGTgfj2y09fSA9oY0UMIzHnpavhFoaxmypF98iQy9HoaumVdiRo8eSWQ5YOaBCBaRlYRPUyQi5tkweET+uiBDsstFhYmvyvk3zhz3sFt/q1XsmrMR8dn29ELN35ZwD63lgfaUmnjMaCi/csdeOrVqh+AGx5JW21L1ouxcSNkj3GU04/BsYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v9BqutEUAPvrZSeE0dYRJjv92h2Fl5d+6yeelL/qmCg=;
 b=WhG+8fk9qJ3jL33kdq2StE37qmaAnPVxzNqBhq8dotWegxRtaG/DUdC78BKKSQUXMBtntTvXlbIfKY6ENQE8O0e3OrPlvRsGn8V/hQ7H5Ss2HWsQxx3fK0d5rsLVfUfGyK2d10DyZxYTVlf8fectuHfliuN0P47O+SDUMAt3dRp6VdzPkifm3fsTQpLp1gqNiMJgD6EqVPaM2S16owhLueL+J2C7gR0gOZ4YeLSfIeAWcjrba5m7LQdUyd4js6UG30MDuSkjoyb3TxfEg2rwr6zj3Gg8mzJ2aDP+DmAV6UiVe8K5mc7RSh/BeII2MvonFP6H9wuLYj0XRjVCgIqFWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9BqutEUAPvrZSeE0dYRJjv92h2Fl5d+6yeelL/qmCg=;
 b=KtSB05smVHoHBGjQuoiwOPCeYYJnK3QvyKJQIWhD+lncirAmG8KI0QSM3atyXUtaT+kCdQYkfE1YWpvefs8U8exlqmxlYvuRfpugPMYW+2DeNsk7AOeQu42Z/gY2pWxvLuzwaJNMAgGT2/wq8W6fxEvfnLD+osIMDJmVQ13B2cs=
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com (2603:10a6:10:3d1::9)
 by PA4PR08MB5920.eurprd08.prod.outlook.com (2603:10a6:102:ea::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 15:20:42 +0000
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90]) by DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90%4]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 15:20:42 +0000
From: Fayssal Benmlih <Fayssal.Benmlih@arm.com>
To: Cristian Marussi <Cristian.Marussi@arm.com>
CC: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>, "d-gole@ti.com"
	<d-gole@ti.com>, "david@kernel.org" <david@kernel.org>, Elif Topuz
	<Elif.Topuz@arm.com>, "etienne.carriere@st.com" <etienne.carriere@st.com>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>, "james.quinlan@broadcom.com"
	<james.quinlan@broadcom.com>, "jic23@kernel.org" <jic23@kernel.org>,
	"kas@kernel.org" <kas@kernel.org>, "kernel-team@meta.com"
	<kernel-team@meta.com>, "leitao@kernel.org" <leitao@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Lukasz Luba <Lukasz.Luba@arm.com>,
	"michal.simek@amd.com" <michal.simek@amd.com>, "peng.fan@oss.nxp.com"
	<peng.fan@oss.nxp.com>, Philip Radford <Philip.Radford@arm.com>,
	"puranjay@kernel.org" <puranjay@kernel.org>, Souvik Chakravarty
	<Souvik.Chakravarty@arm.com>, "sudeep.holla@kernel.org"
	<sudeep.holla@kernel.org>, "usama.arif@linux.dev" <usama.arif@linux.dev>,
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>
Subject: Re: [PATCH v10 11/24] firmware: arm_scmi: Add Telemetry notification
 support
Thread-Topic: [PATCH v10 11/24] firmware: arm_scmi: Add Telemetry notification
 support
Thread-Index: AQHdMYCh06pH5L0jyUWuJmKRD8dlcA==
Date: Fri, 21 Aug 2026 15:20:42 +0000
Message-ID: <CBCA047A-F5D2-45FC-AE8B-9675479487AC@contoso.com>
In-Reply-To: <<20260815232604.3730754-12-cristian.marussi@arm.com>>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB8651:EE_|PA4PR08MB5920:EE_|DU6PEPF0000A7DD:EE_|AS4PR08MB8093:EE_
X-MS-Office365-Filtering-Correlation-Id: e0318f4e-9080-4437-f0c3-08deff97d748
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|23010399003|376014|366016|1800799024|18002099003|22082099003|56012099006|38070700021|6133799003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info-Original:
 ZCE6vhDtzY6404W/BCWxq7SQQwU02ZO6GrRejRhofZQ4dBm8HYJfQm/UnEyQT/9abOKrCEj34SWtvoglpf3jTSUzQe8Hn1EDoYvUm04kI5muaSUe2XbfiuQY0teuwqBqaA/dJ3q1LzuPDve3+gFhIKH5cX7wwEUfre4d1WKcq6HDAgI5jRiX2RMVtZTRGN/fFFir5Ng5yMJEM2UR3G0KwVIBdHq5xFcCnIkxtJMYTCj6M1CGjH3PNtmnWelc4QOG9MXG+bPtXT1MywPo9q0xe+H3zZve0Bv7rmYVbKkbgvPR3PamNRBcRRCPpT2kUJlScuGexvcvx4b9ATz539NBgshxEBtcQZhLm2C4eJsZ8mIDOae/Pcm8BPQfY5PvAF/oaw+qqE92KFv3V6/oQEV7UC8dRkyjkZf0Fb+yVFagDttQHmSWRy+aUsd2eiUQnV5cX1rHYGYjX4Xn8yVeW3iGCXpdwpdkEiDjzv+CD0neAuKjGCC6AGnjgpQnwosV4MrHJSECkMMsRyzWSgodLWQLmSDzqK4IeCS7lp41UtI/8J102ZLfn/XaYpAlaW9kRX9CFM1wZc+kut+U2PrDpnlQ6Tnb30VYnfGNZidI91tBw6+RbUj4IKhScWKIK13YV8qeBX8aOMnchDC6c55S2KPXLv1Lo52PCEvsP4SjswJNBa2qtoU2TgRq+ssJQ8WazfHwsQTM/FkMUwwqOROGrHGpz7Az86q/u9Cx3al3u41YSRs=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB8651.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099006)(38070700021)(6133799003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <31DB36EACC403A4B8BE2C6D5FF7C79F8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 AsgP4b7vxd5cNzAhSgGpwtkmz+JpYhYJwhk7/VXZES2d6pcHKJRp6rsnYlwzc7yLh0aTGCpotz7iXE3y+novwdTe3vemxpFsNIW5EqQP5e8e8iu7JAeGDUCn25Il0dv0c1rhdOUDBj6jvuMaL/NvjYNJnuYSFFPsajN5MBnRtxdmAo30pIIphw0yMmbtvVTbJp0r6/44hNUJAu1MWizt6YTSBCAHFoyA+bZ3nUQtCRk15NZ4ahMClnl8j34hJssfRlWGbh2RmzrO3KdXGtzhcIUNfAR04zhcSs/vlw3ISC2mFFTrjENdTh8DyxvlYebeOyRZwbb/O1GsFHxOnEOJ5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5920
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f8efff09-aace-49c3-13c7-08deff97c3f4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|1800799024|35042699022|23010399003|14060799003|11063799006|18002099003|22082099003|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	jYv1cuQozAr61xtN6x7pmpL7ZQ+VEPiEnaT9lYH44DkRor/RHAYklFpy4umf7PVl3TVZcnxAzQZCdwDdQ6QtcF3WWgrbQhxz1+d2Zh0R7VUNz5y+r/0RZH8otcGU/OLLEOywVut5UdG0CT2HJOUJ6iByaO9sJnSrVevDdxpYAbbw4lEbbNAGVH7+DFkTPuyyE6/5SQ0fshPMdI/2reOJKjRlaKZv6+i/e6i0aoOvEBYoM7hANskz8Zo9ZjUyZKv8YdtKcphK9Krfl3faOZXmTURLrpztwj/EklJXqj2WzSASynrut3vx6tfD0QUVw1uzHXSE9tjN1CvX8bI93BABPOgaZwNw0Dj906ydiIeKklqqb0zoSt8Vjky5/2MWA6Y2CSFD4t6Iwda1KfSl7jJIsGmx+pnb2RIG8JFMg5zRReegn2X8qGsUSW8jEff9gHGTc8rgos5Y9yO2VrXi1s7aHO5TuIj3VUy2p2VzpO1czd0YHHcv3Nn4SQ6DJUl3RdXxi6EHY0IrizNTLU1l54VXmhL+BmItdewL6qRISJyTwV9s8sVYqlJiSsbboi8rAWV3pdsH5e3wjsvDqcuVucfKelrSIhOtePpkRoNjc7eJqKyjB5DH2qi0n8Ht+FbLwnBBZFoKNK6fjDOXEhB5GBZFwfSAPpOg1ibsAEq/BQV5Ezzu7f/1D4rKwoVtyRAm7AefzLNCRIyq42nrK7CF4jiFOw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(1800799024)(35042699022)(23010399003)(14060799003)(11063799006)(18002099003)(22082099003)(10067099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+8WMxrrww7QRGsxS2Ybrh63JWj/qKx5M/QBJMz/j0AR11wbxc04dJasRSFXEU18U3NaoEOiIdBk3C4i7SRRivWmQ3u2nphMFhrHXVuEsjqZCRT1Gpzszpg56oj3VmMyvzbXJY23zpIwEaVM2pEMkKb52NLLs7x18lxeuMB9WY9AhwS/h7Bh4bqd9uz2ShXUHJ+VkYrIXs0C0+EwfuF3JBLGofMxrpGJ3M3lEf/6CThPJETGVM5LMxrmVJoHC0ek7sDM4eL59g0KFtHyPSLAom4NkfcJIetvpdeBXgYMHkzb+Ubuty3dGNlxehEuHlsLxJNo7XX3a5mCfg6vwIPoTJnvRsGktl2/MptOqXLD0zjHVWQLhdPTZieQPDZxjYrruCgqYzPqaDz3A627PxMBD5Jp180aiZVtZu8OwmVaGiwQ1wK/7JY/vgtOjP4ahHwu7
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 15:21:14.9144
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0318f4e-9080-4437-f0c3-08deff97d748
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8093

SGkgQ3Jpc3RpYW4sDQoNClRoZSBWMTAgbXVsdGlwbGljYXRpb24gYW5kIHdpcmUtcGF5bG9hZCBi
b3VuZGFyeSBjaGVja3MgYWRkcmVzcyB0aGUgZmlyc3QNCm5vdGlmaWNhdGlvbiBpc3N1ZSBJIHJl
cG9ydGVkIGluIFY3Lg0KDQpUaGUgZGVjb2RlZCByZXBvcnQgc2l6aW5nIGlzc3VlIGFwcGVhcnMg
dG8gcmVtYWluLg0KDQp0bG1fZXZlbnRzW10gc3RpbGwgZGVjbGFyZXM6DQoNCiAgICAgICAgLm1h
eF9wYXlsZF9zeiA9IDAsDQogICAgICAgIC5tYXhfcmVwb3J0X3N6ID0gMCwNCg0Kc28gdGhlIGdl
bmVyaWMgY29kZSBhbGxvY2F0ZXMgbWF4X21zZ19zaXplIGZvciB0aGUgZGVjb2RlZCByZXBvcnQu
DQpIb3dldmVyLCBzdHJ1Y3Qgc2NtaV90ZWxlbWV0cnlfdXBkYXRlX3JlcG9ydCBoYXMgYSBsYXJn
ZXIgZml4ZWQgaGVhZGVyIHRoYW4NCnRoZSB3aXJlIHBheWxvYWQgYmVjYXVzZSBpdCBhbHNvIGNv
bnRhaW5zIGt0aW1lX3QuDQoNCkEgbWF4aW11bS1zaXplZCB2YWxpZCB3aXJlIHBheWxvYWQgY2Fu
IHRoZXJlZm9yZSByZXF1aXJlIG1vcmUgdGhhbg0KbWF4X21zZ19zaXplIG9uY2UgZGVjb2RlZCwg
ZXZlbiB0aG91Z2ggdGhlIHdpcmUgbWVzc2FnZSBpdHNlbGYgcGFzc2VkIHRoZQ0KdHJhbnNwb3J0
LXNpemUgY2hlY2suIFRoZSBjb21tZW50IGluIGZpbGxfY3VzdG9tX3JlcG9ydCgpIHRoYXQgYm90
aCBvYmplY3RzDQphcmUgbWF4X21zZ19zaXplIGRvZXMgbm90IGFjY291bnQgZm9yIHRoaXMgaGVh
ZGVyLXNpemUgZGlmZmVyZW5jZS4NCg0KUGxlYXNlIGVpdGhlciBhbGxvY2F0ZSBhIHJlcG9ydCBs
YXJnZSBlbm91Z2ggZm9yIHRoZSBkZWNvZGVkIGhlYWRlciBwbHVzDQp0aGUgbWF4aW11bSBkd29y
ZCBhcnJheSwgb3IgY29uc3RyYWluIG51bV9kd29yZHMgdXNpbmcgdGhlIGFjdHVhbCBkZWNvZGVk
DQpyZXBvcnQtYnVmZmVyIGNhcGFjaXR5IGJlZm9yZSBjb3B5aW5nLg0KDQpUaGFua3MsDQpGYXnD
p2FsDQoNCg0K
