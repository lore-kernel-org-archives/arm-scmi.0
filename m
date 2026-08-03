Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011002.outbound.protection.outlook.com [52.101.65.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1F930E85D;
	Mon,  3 Aug 2026 22:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.2
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785796826; cv=fail; b=aNpVbxGmF/gQ+J4rwUFpzfUnKYO2j5bdSH0vQZJdt2oYrcwYQY8ULQU6asvlUCLR58ZkY16uoTQ+jcxGjhKhWFd2zmpFN7O6zLtEhMpiI6klS4+f5M9jczhGd5vfB6JuFYlEKmIpGSnmenoc7UxujTq5ShJ1H6mVgDvQWh9bfjg=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785796826; c=relaxed/simple;
	bh=y7G/WmMRfZnVDTVKMaDQO+jhF0GlIfj9g2X84sGT1IM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:Content-Type:
	 MIME-Version; b=u0AnAnmZ/kxngEgyk0uZL+5UpkZyHX3r+RxwwhKCokSS9pnwM5EVweWrCBsNgGTTO9jVkyjvTUmA68Iufkvbkuzqe4hdJ2E9KHNMynVEUYBvDqbyc2ijY654xllhqypQNZPKWIvbQ3FSiMs0f+xt0/f3xbT0Ma3dPe9SYvHAB/I=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=F6knyCDo; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=F6knyCDo; arc=fail smtp.client-ip=52.101.65.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="F6knyCDo";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="F6knyCDo"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WbL8xk1XrPJ+QMMNCGMOOSzNtwdNg3GZK8bxhltm9w27TZNJWGNDGUdoOdFJXD0BMoCeKRN1HpxYnpSwn8N1NtVGmYsFyx0FKFIOlhftsa0w3Gl/8q8YxzZKLscE8g57ntNKsHwgJeeHSNpeLXKh4E5hbrqFlhwsjEEvvNIAjg4dJgBceUwaRu8ah9aDKnOIBr2irZgGab2XnhsDWcHRWpq8zqU0Xqtp+JDxXcLNryTuFPQE36VQXJecrRtM6ejIGcZGJ+v/kEiGFUOK9Ee6Eg2SezFDDhgZyXj1w6p51zl65hCm+b6mLNEH4ZdRnfH6XiY0Yaj3LhWjfMkcMc5gBg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7G/WmMRfZnVDTVKMaDQO+jhF0GlIfj9g2X84sGT1IM=;
 b=bBHGV2Q/ZX2JSFDVPfDpUBEheL0Z4VZuLFfhxcmodNhpLROWugOn2P0p5ZTb++ZP0JD3CC8e4HIvXowWV+8l12/Mq/ZhACDU4CXrzoRXlef2Mn9kral/KLjY9TeIRSDj/LWeqQw0hnjhMRNTx5F+GkcdRu7Mag7DPO9FGyoVwDKqoB8ksfiFG4cUxRtt9YERIyoHkKZnFSgjS0x/Kty2dWt7R+3hAIQYbZgMDlqYkbViVHzX/iO49+/NWIstEuJamOISulXsNlPm300UFiq1c/GBtX0Ep8CSqPzG6NXutQ/oPz+5kpj6nZZRSqhPcFiZsEXtEyFILIxcio/hAi/cVw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7G/WmMRfZnVDTVKMaDQO+jhF0GlIfj9g2X84sGT1IM=;
 b=F6knyCDoE15xE5whLOjMUyOnQ9iEcxQD+4YhkdWr6aw+3XeszBz3LTO29xWXngC0WWmKMEj2oUofqZC2lVMwbRXUzcugExFso3DlZarhRsYW+9hSGaKwBTcdns7lrVHefYIA2xvEtcvaPY63Du0CgGTH+yiajy3dWJvrlBzJOx0=
Received: from DUZPR01CA0154.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::24) by VI1PR08MB5373.eurprd08.prod.outlook.com
 (2603:10a6:803:131::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 22:40:16 +0000
Received: from DU2PEPF00028CFC.eurprd03.prod.outlook.com
 (2603:10a6:10:4bd:cafe::af) by DUZPR01CA0154.outlook.office365.com
 (2603:10a6:10:4bd::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.19 via Frontend Transport; Mon, 3
 Aug 2026 22:40:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028CFC.mail.protection.outlook.com (10.167.242.180) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Mon, 3 Aug 2026 22:40:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sz9ndZXsMUZ6Seb7jjaw/CV8zvPbR/3sveJriJnbQgIQ9MHHpynFzD+NhgpQU4l6zFVBheh2fP+yQJR8aG0z+M7s4N+silR9jbavxPShi4EPYIg1sK2/Y38HyCXOYQwpjg5ZmNBOtk1cti9B4/kn13sIOfZBBcJIldYJ03FacAjeBzFXWEaKs/Ui8doNjHLrelATiZLpP5UkDuW2PhYECnA96OSPkU2MXdns0mO3KJgGXZ8Rc/vT82NhlkTgpEonyh3bN1PIT+50S9a9VBEqXtfiQW6Wc5lvzhOoXDRSTcuq34fJ5cyxoxjs19fER2chQbYa6EKFu3A6hTQoentmNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7G/WmMRfZnVDTVKMaDQO+jhF0GlIfj9g2X84sGT1IM=;
 b=DuNBz+euJD4NKw2+EzTVDjrBAEgFJp7LgVdH5wC1wLzH4SEx76vJE9lhTZCDfPlPRWgyKadZ0ttq7V1+VKi/ahgRbvAw+KpCTfoAF8yNwiLrcEkTfZTXZ+gGWr5EQH9MnoyBhangMuSruc2HPvnZV6Fxn18RergcGNO84D25iHA2+lr1qS2CSygxt5nya/Dsk5BYM09oRfAuzezdpBre2sScSoAcn8NmqJhjmCElcwOU54anibIH5UdT3893QboIi7FZTvWM4uZfVwQiyKeAjxYFDxBG4vwuDhDO+mF3NCO5dPiZuvRRO+aEt1Tk4EIMLX+Dtl5GGjFpt7L2wv6oog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7G/WmMRfZnVDTVKMaDQO+jhF0GlIfj9g2X84sGT1IM=;
 b=F6knyCDoE15xE5whLOjMUyOnQ9iEcxQD+4YhkdWr6aw+3XeszBz3LTO29xWXngC0WWmKMEj2oUofqZC2lVMwbRXUzcugExFso3DlZarhRsYW+9hSGaKwBTcdns7lrVHefYIA2xvEtcvaPY63Du0CgGTH+yiajy3dWJvrlBzJOx0=
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com (2603:10a6:10:3d1::9)
 by DU2PR08MB10087.eurprd08.prod.outlook.com (2603:10a6:10:491::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 22:39:43 +0000
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90]) by DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 22:39:42 +0000
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
Subject: Re: [PATCH v7 23/23] [RFC] tools/scmi: Add SCMI Telemetry testing
 tool
Thread-Topic: [PATCH v7 23/23] [RFC] tools/scmi: Add SCMI Telemetry testing
 tool
Thread-Index: AQHdI5j55/vIbQU//UGu8OXcCU+2+A==
Date: Mon, 3 Aug 2026 22:39:42 +0000
Message-ID: <10F9BDCB-D2E1-42E4-94A9-50A896D0DCB6@contoso.com>
In-Reply-To: <<20260802145618.1952804-24-cristian.marussi@arm.com>>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB8651:EE_|DU2PR08MB10087:EE_|DU2PEPF00028CFC:EE_|VI1PR08MB5373:EE_
X-MS-Office365-Filtering-Correlation-Id: cfc21c2a-0a57-4009-ed77-08def1b03082
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|18002099003|22082099003|5023799004|11063799006|3023799007|38070700021|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info-Original:
 V04hVLCdpv2qoy5z5ZHiUnj45YZQ8Tk56t09f7zO5SY1DlGd9uqXklm1qG+BcCqjcI6NjN6lZuaHCw591wP9N78aqceqgSgo9XU/3rgs8pByRMTDNlYbVs2mI6335xaTZmLvxpYKDf60/PHyxBmNSBOPwyvY4iLlEUcEcpPxy/+vDzl8n5L8WbCjHZotY+fN13hc2HpBAjA0+8iB9eqimHVOY3hMc5LhNeVCPQhs3OCv9He6wEOs9tVcqJJY/03snFecX2lVYIqxCzconMA3nVTPgy8SIDg2pmD6HQXJd77PFnN37/xYZW6T9b9pfVPEbJ2wzHHIcliohTMJqW4Wrl8h4hrWOm3IXzDsek/rGctmdEEZLQpoA+8/PCABaWmYqN4kv+xyGXmdGr6hn9/EYJXEu4uoMfM0r7WdiPHGETCk826zCLchRhvUt0yWlkWYhst/fvnx3pC+VSBry39/THp/yhXgCYVrqx4ePfMvuqFq4LB5Cm8Z0cLxqi5eYf7ClrHnaNZoBU1yZWd5F/bl68hJwEKL37qlF8/7jcsOYwOTo+XauQf4Pb02t1bPM31CXxowynoBm6+4swwQlaUTUGVkDdx2j3cf9Rbm6exe8tZ3JGZAVVZJeBVBAUYbeifwz9V1H+kOiV4bsWM956DWCW4L1mrXXlIj9L7l7a1pR+lpuQH7cjSh4wllzHrKJMb4n+MhkkxbDxEYsZw+263oxyPtvzlJiOis+lpb4zgiv5A=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB8651.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(18002099003)(22082099003)(5023799004)(11063799006)(3023799007)(38070700021)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E804F9510888FA45A9EBEC0D4A32ADCE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 qYLzKlO4lOAIYpp3kUtZzXi5mA6VPkxd+wyQIOYsXr8mmcyxd9qax2titEmNdUksZgcCPRTbB9mXA7WV2pSnBrGahIhs8k4PTkApYI5eo6nwzLnisSvB6Lp7wBPyb0c6Rr92phxQt71zCJ7ELlyOU44l7tj/DvcBNkf899OQoa5WbuAqmzqxgooEz2+wk6hBD1odoD3Tzy2UtemZ2yMCy1yBfR0+PDUzv/MpWFLPRUUZfAlF8EgWGN8CxUS6qFY+AW6qiM6ZsVn0Ht/H6qycb+/nb8g5ZVMmu9T2RLY9tQTkYPcInk4rL+7KW2r9JNAL+qMdbMkUrlk3dZ2pR2PqZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10087
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028CFC.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3fdd2de9-af6f-428d-29a9-08def1b01c51
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|7416014|1800799024|82310400026|14060799003|35042699022|56012099006|5023799004|11063799006|3023799007|6133799003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qmEFc9Ds0ulL2C2Hh/T8YwE3qCS+dHDSeIvMmibRNb3we64r+U6ojJBvxSAHBsZGZMnOYbLSGVe76QJOwlYhxciW7fEpzxNpfR4OQ5NYq5rH3/gfFiNJMnBwXjktYIKGzwt30tUcxhz5JTeWGLqIBZj5ITcFT+emr0/ho5zn6DcfvORNmGSKn5ViBcQh/7QNBAxlTpZ+crlfoqYA3c5KrvR22MO3oqg+d89OnghWj+J/ns+uMt11nhQ1Q4edVewAnRyVH2YTnl7pFBxRmyqWwIZQb4kyiMCynNuOXHTUttmCReF+U1tZhL4BoIoQbBlPjjcBOFah9Vsh5G9xNlx+EdTVwuhro5L8M60BOIQ3icnmD2WzZdIQ/M/kY6Vwl7nOPybNTnnVWvOswkBv9j/4vY8sz9BkA66+Emu3agG0azB8fySF+5aHd/VgIhzNgOIQcynfgGYcvLsCNSgQHsXbQ1hO+YspWjt5KdjV1pPkzcVHR7c29I1w5UTw6fxKouT+UwoGUuAj/vkQnORJFBXuVLrUXDxCSy6k+wtekiADy3aEITIHuzLqbpoOu3SmXv/cGMR2slTIHN8aj3GgI290NArYUE7t0wwcXzm0fSo+xSj+9RBJ6OEcYrcD5YRlRwOu5A3VwzjGS5iaJY6/MyjSv/b0BrEtowocXZOJdLNFOZ7rFC/vKu13hWPGjku53uFqUW9uESpBA+UCx5wwCr/M7g==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(7416014)(1800799024)(82310400026)(14060799003)(35042699022)(56012099006)(5023799004)(11063799006)(3023799007)(6133799003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	74eMAsbP4oNGyqwZYa2FQfi/okI1Vua0htSBcz43jBHtCSMIia1w/kPNpBxqIUXfe3OdL8ebtJlyuxZTzsEoFvBeOXrJCbkaUV50tZU3PKZkI+mYo0UgWR9PobphB3HzfYdmWEgy3EFldqqSCCf6XgL+hH82Wgt4n5sws8h+TSV/uFC4nQBT1YpLepiEbLgoM8Wgt37JOWnO7Q1Q8V6kfpCYO5dmCZBKndbj9J1gqExMDeTCPeB9c+4qEWmvvJ8T9YaVFwctdRICF/ukd708BW+cYfAwRP9Q0ZwaPAT7HSrtqp1RkD4WSkjFri0QJSylsHly3vBsZmUeDdyxPlhc/yLoI008b1X0wL6MJwe7qfMOCgS+SAM+ds5H4T/mypUcsvvaZiBtKwZuc6ISyzA84sDy6NW610w+iSz9wNf6nIJKR5P+h/lywBkIxEvc2TkN
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 22:40:16.2540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc21c2a-0a57-4009-ed77-08def1b03082
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028CFC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5373

SGkgQ3Jpc3RpYW4sDQoNCkEgZmV3IGlzc3VlcyByZW1haW4gaW4gdGhlIHRlc3QgdG9vbCBpbmxp
bmUuDQoNCj4gCXN0ID0gbWFsbG9jKHNpemVvZigqc3QpKTsNCj4gCWlmICghc3QpDQo+IAkJcmV0
dXJuIE5VTEw7DQo+DQo+IAlzdC0+ZmQgPSBvcGVuKHBhdGgsIE9fUkRXUik7DQoNCnN0IGlzIHN0
aWxsIHVuaW5pdGlhbGl6ZWQuIE1lbWJlcnMgcG9wdWxhdGVkIG9ubHkgZm9yIG5vbnplcm8gb3B0
aW9uYWwNCnJlc291cmNlcyBjYW4gdGhlcmVmb3JlIGNvbnRhaW4gYXJiaXRyYXJ5IHBvaW50ZXJz
Lg0KDQpQbGVhc2UgdXNlIGNhbGxvYygpIG9yIGV4cGxpY2l0bHkgemVybyB0aGUgY29tcGxldGUg
c3RydWN0dXJlIGJlZm9yZQ0KYXNzaWduaW5nIGZpZWxkcy4NCg0KPiAJaWYgKHN0LT5pbmZvLm51
bV9ncm91cHMpDQo+IAkJc3QtPmdycHMgPSBlbnVtZXJhdGVfZ3JvdXBzKHN0KTsNCj4NCj4gCWlm
IChzdC0+aW5mby5udW1fc2htdGlzKQ0KPiAJCXN0LT5zc2wgPSBlbnVtZXJhdGVfc2htdGlzKHN0
KTsNCg0KVGhlc2Ugb3B0aW9uYWwgcG9pbnRlcnMgcmVtYWluIHVuaW5pdGlhbGl6ZWQgd2hlbiB0
aGVpciByZXNvdXJjZSBjb3VudHMNCmFyZSB6ZXJvLiBUaGlzIGlzIHBhcnRpY3VsYXJseSBwcm9i
bGVtYXRpYyBiZWNhdXNlIGxhdGVyIGRpc3BsYXkgYW5kDQpjb21tYW5kIHBhdGhzIGRlcmVmZXJl
bmNlIHRoZW0gd2l0aG91dCBjb25zaXN0ZW50bHkgY2hlY2tpbmcgdGhlIGNvdW50DQphbmQgcG9p
bnRlci4NCg0KPiAJZnByaW50ZihzdGRvdXQsICJcbisgRm91bmQgIyV1IFNITVRJIGFyZWFzXG4i
LA0KPiAJCXN0LT5zc2wtPm51bV9zaG10aXMpOw0KPiAJc2hpbmZvID0gKHN0cnVjdCBzY21pX3Rs
bV9zaG10aV9pbmZvICopc3QtPnNzbC0+c2htdGlzOw0KDQpzdC0+c3NsIGlzIG9ubHkgcG9wdWxh
dGVkIHdoZW4gbnVtX3NobXRpcyBpcyBub256ZXJvLiBBIHZhbGlkIHBsYXRmb3JtDQp3aXRoIG5v
IFNITVRJcyBkZXJlZmVyZW5jZXMgYW4gdW5pbml0aWFsaXplZCBvciBOVUxMIHBvaW50ZXIgaGVy
ZS4gUGxlYXNlDQpndWFyZCB0aGlzIGVudGlyZSBibG9jayB1c2luZyBib3RoIHRoZSByZXNvdXJj
ZSBjb3VudCBhbmQgYSB2YWxpZCBwb2ludGVyLg0KDQo+IAkJZ3JwLT5pdnMgPSBlbnVtZXJhdGVf
aW50ZXJ2YWxzKHN0LT5mZCwNCj4gCQkJCQkgICAgICAgZ3JwLT5pbmZvLT5udW1faW50ZXJ2YWxz
LA0KPiAJCQkJCSAgICAgICAmZ3JwLT5pbmZvLT5ncnBfaWQpOw0KDQpUaGlzIHN0aWxsIGNhbGxz
IHRoZSBpbnRlcnZhbCBpb2N0bCB3aGVuIG51bV9pbnRlcnZhbHMgaXMgemVyby4gUGxlYXNlDQps
ZWF2ZSBncnAtPml2cyBhcyBOVUxMIHVubGVzcyBwZXItZ3JvdXAgaW50ZXJ2YWwgY29uZmlndXJh
dGlvbiBpcw0Kc3VwcG9ydGVkIGFuZCB0aGUgcmVwb3J0ZWQgY291bnQgaXMgbm9uemVyby4NCg0K
ZHVtcF9ncm91cHMoKSBtdXN0IGFsc28gaGFuZGxlIGEgTlVMTCBncnAtPml2cyByYXRoZXIgdGhh
biBkZXJlZmVyZW5jaW5nDQppdCB1bmNvbmRpdGlvbmFsbHkuDQoNCj4gCXRkY2YgPSBtbWFwKE5V
TEwsIHNobXRpLT5sZW4sIFBST1RfUkVBRCwgTUFQX1NIQVJFRCwNCj4gCQkgICAgc2htdGktPmZk
LCAwKTsNCj4gWy4uLl0NCj4gCXRkY2YgKz0gc2htdGktPm9mZnNldDsNCg0KVGhlIG1hcHBpbmcg
bGVuZ3RoIG11c3QgaW5jbHVkZSB0aGUgU0hNVEkgb2Zmc2V0IGFuZCBwYWdlIHJvdW5kaW5nLg0K
TWFwcGluZyBvbmx5IGxlbiBieXRlcyBhbmQgdGhlbiBhY2Nlc3Npbmcgb2Zmc2V0ICsgbGVuIGNh
biBjcm9zcyB0aGUgVk1BLg0KDQpQbGVhc2UgbWFwIFBBR0VfQUxJR04ob2Zmc2V0ICsgbGVuKSwg
cHJlc2VydmUgdGhlIG9yaWdpbmFsIG1hcHBpbmcgYmFzZSwNCmFuZCBtdW5tYXAoKSB0aGUgY29t
cGxldGUgcmFuZ2UgYmVmb3JlIHJldHVybmluZy4NCg0KPiAJZG8gew0KPiAJCWJ5dGVzICs9IHdy
aXRlKDEsIHRkY2YgKyBieXRlcywgc2htdGktPmxlbiAtIGJ5dGVzKTsNCj4gCQlpZiAoYnl0ZXMg
PCAwKQ0KPiAJCQlyZXR1cm4gLTE7DQo+IAl9IHdoaWxlIChieXRlcyA8IHNobXRpLT5sZW4pOw0K
DQpQbGVhc2Ugc3RvcmUgdGhlIHdyaXRlKCkgcmVzdWx0IHNlcGFyYXRlbHkgYW5kIGhhbmRsZSAt
MSBhbmQgemVybyBiZWZvcmUNCmFkZGluZyBpdCB0byBieXRlcy4gQWRkaW5nIC0xIHRvIGFuIGFs
cmVhZHkgcG9zaXRpdmUgdG90YWwgY2FuIGxlYXZlIGJ5dGVzDQpub25uZWdhdGl2ZSBhbmQgbWlz
cyB0aGUgZXJyb3IuDQoNClRoaXMgZXJyb3IgcGF0aCBzaG91bGQgYWxzbyB1bm1hcCB0aGUgbWFw
cGluZyBiZWZvcmUgcmV0dXJuaW5nLg0KDQo+IAkJdGRjZiA9IG1tYXAoTlVMTCwgc2htdGlzW2ld
LmxlbiwgUFJPVF9SRUFELCBNQVBfU0hBUkVELA0KPiAJCQkgICAgc2htdGlzW2ldLmZkLCAwKTsN
Cj4gWy4uLl0NCj4gCQlzdGFydCA9IHRkY2YgKyBzaG10aXNbaV0ub2Zmc2V0Ow0KPiAJCWVuZCA9
IHRkY2YgKyBzaG10aXNbaV0ub2Zmc2V0ICsgc2htdGlzW2ldLmxlbjsNCg0KVGhlIHNhbWUgb2Zm
c2V0LWF3YXJlIG1hcHBpbmctbGVuZ3RoIHByb2JsZW0gZXhpc3RzIGhlcmUsIGFuZCBub25lIG9m
DQp0aGVzZSBtYXBwaW5ncyBhcmUgdW5tYXBwZWQuIFBsZWFzZSBwcmVzZXJ2ZSBlYWNoIG1hcHBp
bmcgYmFzZSBhbmQgY2FsbA0KbXVubWFwKCkgb24gZXZlcnkgc3VjY2VzcyBhbmQgZXJyb3IgcGF0
aC4NCg0KPiAJYmF0Y2ggPSBiYXRjaF9idWZmZXJfYWxsb2Moc3QtPmluZm8ubnVtX2RlcywNCj4g
CQkJCSAgIHNpemVvZigqc2FtcGxlcyksIHRydWUpOw0KPiBbLi4uXQ0KPiAJYmF0Y2gtPm51bV9p
dGVtcyA9IGFyZ3MtPmNudDsNCj4gCWZvciAoaW50IGkgPSAwOyBpIDwgYmF0Y2gtPm51bV9pdGVt
czsgaSsrKSB7DQo+IAkJdW5zaWduZWQgbG9uZyB2YWw7DQo+DQo+IAkJdmFsID0gc3RydG91bChh
cmdzLT5vcHRzW2ldLCBOVUxMLCAwKTsNCj4gWy4uLl0NCj4gCQlzYW1wbGVzW2ldLmlkID0gKHVu
c2lnbmVkIGludCl2YWw7DQo+IAl9DQoNClRoZSBhbGxvY2F0aW9uIGlzIHNpemVkIHVzaW5nIG51
bV9kZXMsIGJ1dCBudW1faXRlbXMgaXMgdGhlbiByZXBsYWNlZCB3aXRoDQphcmdzLT5jbnQgYW5k
IHRoYXQgbWFueSBlbnRyaWVzIGFyZSB3cml0dGVuLiBTdXBwbHlpbmcgbW9yZSBjb21tYW5kLWxp
bmUNCklEcyB0aGFuIHBsYXRmb3JtIERFcyB3cml0ZXMgYmV5b25kIHRoZSBhbGxvY2F0aW9uLg0K
DQpQbGVhc2UgYWxsb2NhdGUgdXNpbmcgdGhlIHZhbGlkYXRlZCBhcmd1bWVudCBjb3VudCBvciBy
ZWplY3QgY291bnRzIGFib3ZlDQp0aGUgc3VwcG9ydGVkIGxpbWl0Lg0KDQo+IAlpZiAobmVlZF9z
dGF0dXMpIHsNCj4gCQlpbnQgKnN0YXRlczsNCj4gCQlzaXplX3Qgc3RhdGVzX3N6ID0gc2l6ZW9m
KCpzdGF0ZXMpICogYmF0Y2gtPm51bV9pdGVtczsNCj4NCj4gCQlzdGF0ZXMgPSBtYWxsb2Moc3Rh
dGVzX3N6KTsNCj4gCQlpZiAoIXN0YXRlcykNCj4gCQkJcmV0dXJuIE5VTEw7DQoNCklmIHN0YXR1
cyBhbGxvY2F0aW9uIGZhaWxzLCB0aGUgYWxyZWFkeSBhbGxvY2F0ZWQgaXRlbSBidWZmZXIgYW5k
IGJhdGNoDQp3cmFwcGVyIGFyZSBsZWFrZWQuIFBsZWFzZSB1bndpbmQgYm90aCBwcmVjZWRpbmcg
YWxsb2NhdGlvbnMgaGVyZS4NCg0KVGhlIHNpemUgY2FsY3VsYXRpb25zIGluIHRoaXMgaGVscGVy
IHNob3VsZCBhbHNvIHVzZSBjaGVja2VkDQptdWx0aXBsaWNhdGlvbi4NCg0KPiAJcmV0ID0gZ2F0
aGVyX3RsbV9zdGF0ZShzdCk7DQo+IAlpZiAocmV0KSB7DQo+IAkJZnJlZShzdCk7DQo+IAkJcmV0
dXJuIHJldDsNCj4gCX0NCj4gWy4uLl0NCj4gCXJldHVybiAwOw0KDQpUaGVyZSBpcyBzdGlsbCBu
byBjb21wbGV0ZSBzZXNzaW9uIGNsZWFudXAuIFRoZSBtYWluIGRldmljZSBmZCwgcmV0dXJuZWQN
ClNITVRJIGZkcywgbWFwcGluZ3MsIGludGVydmFsIGFycmF5cywgREUvZ3JvdXAgZGVzY3JpcHRv
cnMsIGJhdGNoIGJ1ZmZlcnMNCmFuZCBuZXN0ZWQgYWxsb2NhdGlvbnMgcmVtYWluIG9wZW4gb3Ig
YWxsb2NhdGVkIG9uIG5vcm1hbCBhbmQgZXJyb3INCmV4aXRzLg0KDQpQbGVhc2UgYWRkIG9uZSBj
bGVhbnVwIGZ1bmN0aW9uIGFuZCByb3V0ZSBhbGwgZXhpdHMgdGhyb3VnaCBpdC4gQXBhcnQgZnJv
bQ0KZml4aW5nIHRoZSBsZWFrcywgdGhhdCB3b3VsZCBkZW1vbnN0cmF0ZSB0aGUgaW50ZW5kZWQg
bGlmZXRpbWUgYW5kIGNsZWFudXANCnJlcXVpcmVtZW50cyBvZiB0aGUgVUFQSS4NCg0KVGhhbmtz
LA0KRmF5w6dhbA0KDQoNCg==
