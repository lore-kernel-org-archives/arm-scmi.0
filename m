Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011044.outbound.protection.outlook.com [52.101.70.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F31F352034;
	Mon,  3 Aug 2026 23:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.44
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785798007; cv=fail; b=b8UYtjdHdCjuPNgVR8oNg1DrFxMIIVtN/a3qZQJCM3jWTYeLwktVkff8amRgztiSAgzB/SfbKC8ycSYId7avrM2htKY6f8XJtMvRLfhVR7F1hX3+04tvi08HeAZx5ioEyvjLAt2SPKOcvEAqIP2DOREsXQXt8q0MhWo+e9DAE9g=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785798007; c=relaxed/simple;
	bh=nJG67cRSBCPKhvbfbWExOSzNtL4gVtxOsukdAViQ1hA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:Content-Type:
	 MIME-Version; b=Q3hULQRZ0t+YL70tvWypX6BWurLAvuMLjWF7EzavWPxBPuD1Fzwac7ju65zahgArPpl2vAOH0uCKwXcA9whmcMFclETFvcd5wSi2XJpsu2uqglLXBrCdpf9+sXtk6WM+2xLhfQPIALi8iHEHUjDF5dxsVMb51bENIAOCvPbXexI=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=oZWkReeZ; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=oZWkReeZ; arc=fail smtp.client-ip=52.101.70.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="oZWkReeZ";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="oZWkReeZ"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=VI8Hs3QUJow88+78Pi+qP8V8s1DC29xHAoXy0Q+qqCfg3biRVwKjfoosJjHqpkt5hTz1W3V5jUAD5le3V98bLj/9V1xNyrR5IzjXoL0hzEYsZakvxbCfDBBj8PEovi6ZBiT6MQyUfcyOkVSC0MWFndg5dRb1sUmlNGDOg1Oj5C8piNPjw49m6OuLjlir7DdZRFcyn84Upkh25QwKvZaTUVSKrgtfaUa+O0S6aFY2K579vHNq8dO720hpFM69OFG9tKEeuxEr0c62cxZH63Y8hf8Bj2YaUf3XcCuI176rFabJaFsvpz+YiHdzET/gFfzbVZribxyfXcFLQ7eWgON+Rw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJG67cRSBCPKhvbfbWExOSzNtL4gVtxOsukdAViQ1hA=;
 b=lbJE5WMBCxmCJmm+q0TAVJVvXQXMjfThnAZOAPljBFCLhbDcmadVNF04uyUs1+dZouZG6b4xnD2EeCJVH5+nfFLCuVKoQ1vGW1tL9NKSkD+7tnDSizLMGR/fKRBV5rOynxIpTiJ6n6qUTx87IIgzYX86eKSdwWzpCZ0YI4LelwK8ykI0DHsajgNT8AGEpBHv3/h+WzbcAzg+yyQgWzfm4dlg8xRIZiBLJI0QTzx4/undJtpmhNPTZ+zyQxy5L+J1KEq0mKJcoB8cKg/UYEIc3XFBjxRiL8cFprHYM++X60FmXdDnCMC3jOu4aj/UMOv14WlNcI1Nw6bjlQSrvVKXJA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJG67cRSBCPKhvbfbWExOSzNtL4gVtxOsukdAViQ1hA=;
 b=oZWkReeZyhdHF8XyAGIDV0PcyXCiwLWPy4FE8O4cnIDnGg9GwPVuZHFvlPqESpnBqdR2ozNV8j5XEFpr9scCUAFNEyg0ahz3xXv1nwZm6NqLRB1wM+fWb5wVyL7Jx17Wp8CWCvATCwIj4qZkViFf+EVfQEN39MHy6cEilriSfdc=
Received: from DUZPR01CA0193.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::14) by AM8PR08MB5634.eurprd08.prod.outlook.com
 (2603:10a6:20b:1d1::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 23:00:01 +0000
Received: from DU2PEPF00028CFD.eurprd03.prod.outlook.com
 (2603:10a6:10:4b6:cafe::a4) by DUZPR01CA0193.outlook.office365.com
 (2603:10a6:10:4b6::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Mon, 3
 Aug 2026 23:00:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028CFD.mail.protection.outlook.com (10.167.242.181) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Mon, 3 Aug 2026 23:00:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGWyCkNiLla0MMdhhQt8NiclDkWYpXfWr69Udnkj6MJ9ajZ7Od3Ut4xMwbwnlMbufKWRVRUdUpdoCvAaG+Maem6sHg9Hjgk/Ic86zcin2z1sDkcWNe+r/NcGmTuIiyRUSIH/DEYSxww5zRHhE6OF7W8GoyPJjX+aZqrDhU9t7hB1iXoF+kZqvu3LrwcwHcMn0ipS/yq3ZDfb5D7LxYKTkXjnZdLisBr3NXue9d9YI45b2vAdAu/gJpZy2t/QuMYXhCE+wkA5Hvi2nJgm1E0IZgMq9STdC/aYH0hqkAEmhnvu1iEvQ7xqMbfacN9lh8etSzL8zjyiQXXPyPySmjqGaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJG67cRSBCPKhvbfbWExOSzNtL4gVtxOsukdAViQ1hA=;
 b=Ldtyvkyv0sEpxNZ5hrWAh0xEmw8Dt01Nusf48FWnyhGRl+Tx0cHEi4wK9SoXH8K9qkuGPH/bO4DWhHBX/6AsJ2o2gkNXsE27QhKn3ALGGA/nvGab9w/HocikDRGz7K/LV7rVM9KxOKmPNL4Q1yvJJXgNb0Nze8MN0apvyZnxpE339b4NRoTDqmMk2Kuq4u7A9Rk6IQlV9udbRbXh5aZ9G3JnivlqiHbD9movobXsNq0bsI2+03I+Yz0wfnOKNOcErgm5fFiTWkEhVIZaN/11rJqt1DmsxWWl19i1Fu8LeFAn3Da53EfBHRGMgpj/4fU+j4+zy719O8YOF0eOhhbkFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJG67cRSBCPKhvbfbWExOSzNtL4gVtxOsukdAViQ1hA=;
 b=oZWkReeZyhdHF8XyAGIDV0PcyXCiwLWPy4FE8O4cnIDnGg9GwPVuZHFvlPqESpnBqdR2ozNV8j5XEFpr9scCUAFNEyg0ahz3xXv1nwZm6NqLRB1wM+fWb5wVyL7Jx17Wp8CWCvATCwIj4qZkViFf+EVfQEN39MHy6cEilriSfdc=
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com (2603:10a6:10:3d1::9)
 by AS4PR08MB7503.eurprd08.prod.outlook.com (2603:10a6:20b:4e7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 22:56:20 +0000
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90]) by DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 22:56:19 +0000
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
Subject: Re: [PATCH v7 14/23] firmware: arm_scmi: Add Telemetry generation
 counter event
Thread-Topic: [PATCH v7 14/23] firmware: arm_scmi: Add Telemetry generation
 counter event
Thread-Index: AQHdI5tMVN7dMMNN8U+9OU/EAsOYGg==
Date: Mon, 3 Aug 2026 22:56:19 +0000
Message-ID: <5B036D99-678B-4CB5-8347-3CD29705542A@contoso.com>
In-Reply-To: <<20260802145618.1952804-15-cristian.marussi@arm.com>>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB8651:EE_|AS4PR08MB7503:EE_|DU2PEPF00028CFD:EE_|AM8PR08MB5634:EE_
X-MS-Office365-Filtering-Correlation-Id: 440c71fb-8aeb-445c-6c44-08def1b2f28c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|6133799003|38070700021|18002099003|22082099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info-Original:
 1HO0dpYvKzhDDVSBwPF9RJbKfFIVSlVdsy5zQaoemZ4MeEJhew81a+Aq24e6lHt38KLmoTVBU3h50V187imcDN9fJxkIhALcjleDkxH+Ab6ALe2KlPZZwf5psBhfN/l/gsiEcknyFGygi/zgC/UqOJMIt5/TMFVGVmuHwzjHqrVwEHBGSGfYkjNZVK6T6e5KG6ikkw1pXi0BQDwu2CBwsm2rgWvYmeZKQUo3Y7nOdaRxDlRVtDzhz+dDHXil91JN02JVmk1GM5T5OC/nT5UIK5cPZvJr99OgN1xnjuoRQ7Fe3WRGCE0qfF7IVprWPVXEmYQjVlZzwWd+iqiPkctY1bTtxwFrksgMVcy3Fudl9t426Aw6IdKfgCgNzK0YP8PYDsAFPeGq8Gde0EzCx2veGsTzgtlDYmkZByC/Qn5c5ErlgOLTkOmx0m5a8y+evepjJ54kKx4JP7dDX5REFOoSmTIz/bm7gq4RnoL8FO/YUwIDOPUNGQU2eUh2Pcb4bgxg2DndsggsBsOFkq9XEh/9Gcw6SV8C4+Qis9AlZ3Vu4EX4vrnHvUgU1JJuNRB5gfk1Hc97EK2rRm4F2QigQD/m/2zr3DTc6SEsyfYRpoiG/BW+oT5sj7ovmG8LWEXAGV4OMQaoYKB01iQ1wRpJiVjdKSreY6rodB0n2DTev/VZK8cQSiSBOVD6QNA4ErGhuqGGoF+7n80DhNsmXlNpP78mxSk9oNjjFCs3bZTw4fQANFA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB8651.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(6133799003)(38070700021)(18002099003)(22082099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6D6B1415B576AE42898A7D54E8B0FF08@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 XbnIT11PY5fLgMhw/q0Ct3vMpRGED/z7k9GNjn3FNKzeHoqzqsxRioQGQj8m+qBjUKhiPJL9N+a7ACFgrH+7KT/N+7KiL9My8A9dVt9VknQfhwaKD3/ne7ZMWrUrTs9fN4eMYV5UJb4uOhkFW7Ode0OpRQlyPkz2vOU6qgNdOVWtIKhNnSlwgJP7G3arY4qSJelIbS8FhWqr+PZ08Ej3P0V2ysGRIkdV2lHpebWoWF2e2yTfndT/e1S7P4QEg1P6Lxyi7Ga3J4XOcTLmDIp9o+8dJQMHBxTozT2d7jJni9lvPw75ntBXW+zDa+FXOsuxXkSWX3ooD3aI3YinpvFr8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7503
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028CFD.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	221aa7c8-c35a-41f0-8479-08def1b26ed5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|7416014|1800799024|82310400026|14060799003|35042699022|56012099006|11063799006|6133799003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	PcrQqGT2ij2KqwtBJRkfXUJ6Jdkg9+F6Cj2cvxAMd09rScIBA4xk1j86yJA0NMHFuW4UAIU78VTyydTT5v0jdzMWROyGMg+Hd0gaHy5QPhw5riD2gnbv+RW5hrsfFHKgvtxKA04dCt10n6soB6otgbYnxV+xWQhBq9qE4pF7JG9ybpSCBSYw1yVYjbd4e7gadh7zkuyO6SfBAgaOSpSTqSSqbfawg6IvzPBlxSSzC4UEJJuM1u7cjJrWKuEYMcO886YXKi/Cb4JEBeb7U3p+l9wSvSA61cMm9W3jYmkhFsKiQZEqRhatABqAEsL4sBu436MxEbJb6hPSxpepAIuqH0TPDTeSVAa8ghmCJDkYiUleL1ihi5ry4KgdWxYCTzIkyaiZmFh+bI5P3ziaCsImjQJPd4+mxo1jQwUboOIOUqpKtrZmqczKcC8cl4rPzcR0l20k339JAPwTFSnTRHNLY9ZyF8BNMJDD6V7OQc2eJ+9H2XMhgqOMHIF7E350pnW9p+/8Wf3teDDe3sM/kbWrD+WcTiFnRCncOi9ykBbaTCoSDr24xUYWeiSZ3kxiDbKYIqlEy96SJfxtLAJHbDtjFXQDPVw9xYDF7VZdkpP3UAvPkJ/TxYRsZ71bBiV5yxGJLcBG9Kse8sVp4/dvvOwjlkveOce3Mm0emS7dYZjg2thvKb3sZasbfNiiKHdn4J8YCBk4kNhz3WakUl4puFov3Q==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(7416014)(1800799024)(82310400026)(14060799003)(35042699022)(56012099006)(11063799006)(6133799003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WOXiHzKFokmv7L6YXhLTLAcOtVu6vT40MUzasmxslH4e2FTo2Wi8giCQRqGYbh3vNNLgDA+YuvpcvZ9+H6bIcSbfAtZrE3yXxOhLPdzPhU5KyICk7vys9vovgupOnMWgtAVvKNtfrCQ7tbJlwA7v8YPEkO5WOWecNQyJZCcX1WyFOM5DhOofqNyVqkTLaWvPjZwqzN3O9QumjBJlGZOQQyPfv6UUVDbDxx1pHMNoiVVKHD+CnA2DU+CkPgbG43kSep5vzbxIikNd1nNtmRm7jMxOZv0p+ADpvqzCor0UjEHewzMmGnURzQB3mb3zHmw6g0NeUM/Yso/2m8U31yw/w9PNXcojI9viq895k06Y0jLa7INcaMB3AetbONbAj4ubVLpAKn/A20dfbakmYSiXm+h+6cowUmNuBG9y1egvax+qUK2WLrt6gciscQMsxXKm
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 23:00:00.7962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 440c71fb-8aeb-445c-6c44-08def1b2f28c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028CFD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5634

SGkgQ3Jpc3RpYW4sDQoNCk9uZSBjb25jdXJyZW5jeSBpc3N1ZSB3aXRoIHRoZSBnZW5lcmF0aW9u
IHVwZGF0ZSBpbmxpbmUuDQoNCj4gc3RhdGljIGlubGluZSB2b2lkDQo+IHNjbWlfdGVsZW1ldHJ5
X2dlbmVyYXRpb25fdXBkYXRlKHN0cnVjdCB0ZWxlbWV0cnlfaW5mbyAqdGkpDQo+IHsNCj4gCXVu
c2lnbmVkIGludCBuZXh0Ow0KPg0KPiAJLyogV3JhcCBhcm91bmQgc2tpcHBpbmcgaW52YWxpZCBn
ZW5lcmF0aW9uIDAgKi8NCj4gCW5leHQgPSAoYXRvbWljX3JlYWQoJnRpLT5pbmZvLmdlbmVyYXRp
b24pICsgMSkgPzoNCj4gCQlTQ01JX1RMTV9HRU5FUkFUSU9OX09ORTsNCj4NCj4gCV9fc2NtaV90
ZWxlbWV0cnlfZ2VuZXJhdGlvbl9zZXQodGksIG5leHQpOw0KPiB9DQoNClRoZSByZWFkIGFuZCB1
cGRhdGUgYXJlIHNlcGFyYXRlIGF0b21pYyBvcGVyYXRpb25zLiBDb25jdXJyZW50DQpjb25maWd1
cmF0aW9uIGNoYW5nZXMgY2FuIGJvdGggcmVhZCB0aGUgc2FtZSBnZW5lcmF0aW9uIGFuZCBzdG9y
ZSB0aGUgc2FtZQ0KbmV4dCB2YWx1ZSwgbG9zaW5nIGFuIGluY3JlbWVudC4NCg0KVGhlIGFkZGl0
aW9uIGlzIGFsc28gcGVyZm9ybWVkIG9uIHRoZSBzaWduZWQgdmFsdWUgcmV0dXJuZWQgYnkNCmF0
b21pY19yZWFkKCkgYmVmb3JlIGNvbnZlcnNpb24gdG8gdW5zaWduZWQsIG1ha2luZyB0aGUgSU5U
X01BWCB0cmFuc2l0aW9uDQpwcm9ibGVtYXRpYyBldmVuIHRob3VnaCB0aGUgaW50ZW5kZWQgY291
bnRlciBpcyBlZmZlY3RpdmVseSB1MzIuDQoNClBsZWFzZSB1c2UgYW4gYXRvbWljIHVwZGF0ZSBv
cGVyYXRpb24gb3IgYSBjbXB4Y2hnIGxvb3Agd2l0aCBleHBsaWNpdA0KemVyby1za2lwcGluZyBh
bmQgd3JhcCBzZW1hbnRpY3MuDQoNClRoYW5rcywNCkZhecOnYWwNCg0KDQo=
