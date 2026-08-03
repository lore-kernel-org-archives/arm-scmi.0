Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013060.outbound.protection.outlook.com [40.107.159.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D77078F39;
	Mon,  3 Aug 2026 22:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.60
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785795963; cv=fail; b=YRCh1wq9o3decAPx3I4xjvn0DAWgD7P/f1nULsLGfEL1qWEfv5Foc+VIcD9AdbML2ycm8FPlvJJMyuIbLbIxWuSlwNz3rl5FuKGC4twSd5SJtngKU3e57DkGae/XM1ry584aD/MzXorXCkXxD+gUJvsRBcHlVPeP0Rm41QRpmbU=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785795963; c=relaxed/simple;
	bh=KlTs32Wu/cRBuE9vNJzT2pf+IpRmsakfs9uA+NszcVY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:Content-Type:
	 MIME-Version; b=gsA6TBlz847z6NozWDMGlPglJ4VtSJ1UHRORzcxzlKXiIMBH0QcSmhFIfMT5Eq7M75oVwRlugWf04EOEaAdWZm0189cF8zt1Vv0f8z8XoUBTZ0SWRTGW7p0nwhwWfSA7p+PFDESfhClv0I8JGbSMkT1hj96Y0bFvMJwpH7SG6IQ=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ODghUZCU; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ODghUZCU; arc=fail smtp.client-ip=40.107.159.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ODghUZCU";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ODghUZCU"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=kcDyIm8e8nqALv4RzRAguiiiaih+18gWCtY2yAPjCrbANV/GgBSlWTQec7qdQAKvEEC+NIgDA/O1l5hXQcpP9omN7bdwHEdDZX1NuX946tUWZPRcsJ+0B1jcrAiV8M4ylPwhEMTGtzvOWN6hKJ8vc0Y+rY7NzVspEsPZJ7KtG2TnYwddgPYe0ZvdeCblN3BpD+IGX2lagf4vVW4hhnq+1o9QM7PND4sU9KJ9cg7mneE/u+DCm+U74VDHnM5JSEk+8cD1aVr2WASNXelOsgQPgLZbFsAYDJCrn/pyu1ahnY0Wa725O+Cp2yuyBikGp7pY8sWksRVFkfLGKUnrMwBt9g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KlTs32Wu/cRBuE9vNJzT2pf+IpRmsakfs9uA+NszcVY=;
 b=vYvCjikWL/OWklZG4+ke4BeeUA28krXfVWtzpaw0lpyUxk3kK76Kvcsysy80DB/pxmvYWjzMnTgaPIWY/uYvksJrsLQxyCmrHz3xs5GnCXMhZeFUqiYzvnBK9CdR36YK10zgD6rk7i4k7bGBUwz273yIpM8FS67cJDOJDLN5NuUMPtTULErnULfSjXmJdmprgnchXaiBiNIa4O7RMYv8QesCCa0n4n1h8SuxDTuHpNimIUkD96fMCDD5S82nBUABlqOImN9prfeER4V66AApn/0dPXqPVZV3g7oKi/ohUl3iB++2WoxNStgd/Exn9zE4vQO8ouX30Rlf1nX7PY1UUw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KlTs32Wu/cRBuE9vNJzT2pf+IpRmsakfs9uA+NszcVY=;
 b=ODghUZCUDzgDuk4lMZJRWR96GdNxwx3Hno0Gd3bhwSAum3ZphziPZskiSmPhWPqm0aKV+FnP2QXpPmd6f4f3DWNzew6TdzNUCyPm8+7yvVDbvmLI/PW+5PlmmQwYZDAkr3FwA4bfIski4mVIZ1BCBBQWwwANMcnRv/bg0zBV0u0=
Received: from AS4P250CA0010.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5df::7)
 by AS2PR08MB9389.eurprd08.prod.outlook.com (2603:10a6:20b:597::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 22:25:54 +0000
Received: from AMS0EPF000001B7.eurprd05.prod.outlook.com
 (2603:10a6:20b:5df:cafe::59) by AS4P250CA0010.outlook.office365.com
 (2603:10a6:20b:5df::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Mon, 3
 Aug 2026 22:25:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B7.mail.protection.outlook.com (10.167.16.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Mon, 3 Aug 2026 22:25:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VL1P7us3TUzZBH5E7WxUb7Xr2Y2o6GnmxUO1ZafPEwb48njqRFPsc2kCVwyci0vEjfhIXJAyVNyxFfYtJul0Kpn8rjIO/9Od3bYD2XCtnOnltFRTl37+0u9Kz5opoEVUcgzwN+cjCj0g1hEKChElxqHu8A41Y0FuexcBmG2/+/uv2Mxq0lTLCnvRROCcYsUaz1ZndzBJKKT14cN8MChpMWaDYQ9TES3VbpUmMfcbWjMLl3QutpziQA1QlYFNS98BrWnYxDUtaogHOw95M/1Fr2HQYPC7NjNoRTXVNqM17GtcxdqMjMTxd/Bu3hR1EySjYuwvX+SMXpYFcIDSaE1/Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KlTs32Wu/cRBuE9vNJzT2pf+IpRmsakfs9uA+NszcVY=;
 b=J5TgstB69bYx/p/Q8a+Jjvt+vR9Sfy7YJzh7ROYr6lNS0UpmHxo5ypsBQMP+9An8rUkDG7E2PlzzAuYvnxbn6uDzaU6ll/GYiq/FI/gN7L4+al4ROAFCwXMqRdWfmaFkNV7AHDDNbeJcazKQflR1TwRSHAMeQMhRHycxT50MDLcD5KbrIsrnvE0LOMnDTFuYKRAO7gspHh0fm969huEBLjEt7axjS/ZflNvoXV2KCSAFXGLUfLF14y+wP8TzHc3F4Hoa1RXLKr2F3w7a3dgDOCaOUmnz78WDv5XdMb/QlGaytLmMS4KZ0Qz5TGpcmBcHIvJ82dxui6WD53+2WZX9Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KlTs32Wu/cRBuE9vNJzT2pf+IpRmsakfs9uA+NszcVY=;
 b=ODghUZCUDzgDuk4lMZJRWR96GdNxwx3Hno0Gd3bhwSAum3ZphziPZskiSmPhWPqm0aKV+FnP2QXpPmd6f4f3DWNzew6TdzNUCyPm8+7yvVDbvmLI/PW+5PlmmQwYZDAkr3FwA4bfIski4mVIZ1BCBBQWwwANMcnRv/bg0zBV0u0=
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com (2603:10a6:10:3d1::9)
 by DUYPR08MB12014.eurprd08.prod.outlook.com (2603:10a6:10:65f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 22:25:21 +0000
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90]) by DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 22:25:21 +0000
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
Subject: Re: [PATCH v7 19/23] uapi: Add ARM SCMI Telemetry definitions
Thread-Topic: [PATCH v7 19/23] uapi: Add ARM SCMI Telemetry definitions
Thread-Index: AQHdI5b4JAud/7Zlb0e+zfkSVFQFMA==
Date: Mon, 3 Aug 2026 22:25:20 +0000
Message-ID: <A113D0AA-C4C5-4694-B3AD-731D6D39666B@contoso.com>
In-Reply-To: <<20260802145618.1952804-20-cristian.marussi@arm.com>>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB8651:EE_|DUYPR08MB12014:EE_|AMS0EPF000001B7:EE_|AS2PR08MB9389:EE_
X-MS-Office365-Filtering-Correlation-Id: 73fcf055-5f86-416e-6264-08def1ae2ef0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|38070700021|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info-Original:
 LifmvXkn51Axez0yTTJcTNF2UQrLgsKbM5LrSVPclr9pjEaGkTw3uPXrRqx6EVThpRU+Ti34sr00WC2jHO6AKEv2zwHfhYCjL7a+sBaY+bIyaVI1p3EBaUpuQ6uHQez/h5korV3p3GUAcGpEf7gLOAQKhaiAYvM5tCMr69W8Oiif4gOVAmFY3WbjMEBY1xcLJxwne48vWquVM9qGHfRjRB+idIG1C7zdZRSA0T+hjroGVCtpR1xOX/Iv+MQCJZHZMGtCn589RaZorG67ZMdBy6Ib6YZvx0adlJzMtTgOD+vpF4dIBX8V0Yyorsa4X2xj1lswuF3QjtPyQVilqEmBCCzFB7zWQ+fgF4YEsHY746MJu599OLsEMKX2CDSeVIF/OadiLE4T4bdlPi7N5cZOfpRBP8gHhDuV+4Esli0XFtQ84v9AFfJvzMbCf1legs7QvBm5t4aHTn7aYM+Gd/OTJIQc4oeJjQ7OBMX/6qgNXDr7FDhN+eRXTH7fnGtcr4LgN5K0kXUaHh7W9LCD4QA0+nUCm6lvA5RpuqH5r2n01GMPos6oA23D1aFicWF2KFxlvfC0q7YoJtgPGWiDuqYg0WeMbvLBh0soeVfQqxM2RNTnUnFz1BoEcUmG7J+YEr/s0/nE1JyrCn0sW/0galWK/KCYOQipv5Lt+wk+EPMTBvsNFOc0CXrGxlygUtE3gkH7NgWu6lVMzxKPfOfwmX3Iol+DDXeNtwR2UrQk4zHuZQo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB8651.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(38070700021)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4066F5BD469F5B45B0004500BB1884E6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 aHltID/e3BbIl1g7YRtHsS2tTm47frPuUCuSZ3gUZs1qihV/+EwaUR93GQ8JESEP3IxgMqddqkS3HPjs+oQNu3wT1HaTSq/Bz5DbQbQnUEP4QpId4EJUJZk+oaSQxcwUhyJnrZuagFr1SXDjEvzz7EWp+5ELVvhUdntsH27OJhTvk2II014ZwNm//pa2inUQqqrGLLLvJRdyN2g18vbgn5fhbizamxzpItqVa/wBVtBLOteUJiDcSVUs79Ch7ZajHZhJZP8k4NjAd/L5UYUDfJ47nVNhWgfEBqGvK/eGOpN09FvuQV0cUdwcxr7iyU0SnQbamfauQnrGEy+42mvZjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUYPR08MB12014
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B7.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3d072d95-7f22-49e1-68e2-08def1ae1b06
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|14060799003|23010399003|36860700016|35042699022|1800799024|82310400026|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	qLJI23AAtIFR8kQSygVOISYnqX7QQuMbYWrS2UoeO87bKsnlTu5qpsBikZlbi24yIxUDjavldea9vbk0MQjRCLkOjPIgeRV8nFTqyfJBY94nqtKRWvwHzTnarlWCDj673KYM7tZT3Af0WbZZn5yO5wW8EwgfQQ7pJ2T6tQbX4j9D7S87h4ZEb9SKd1xtG6zfCv/ZFRj8tlm7eK7nbaOgOPTtS851HplSXjjz25Jc9xkI4bj1EGtWbgualbBqrWxAQ/+2SgrEakYhh5mS6mP0kWzz75R1k3CyOHagEoKs5AsROZM9KAb5iEnq9jZxzvkFvT9C75MNYZa0dhjfUHiXu+7r0FdEQ2RRyMzoIUmKmz6v5hDddXicuVZVZfnnDEkR9mct22nipTSi/rgzfN3Oe2u27RtZsQpyN5lU1Fr40lXx8BsDumUVXWGVnctYZpW6O/oLStkt0Q9ZkRXSVnO8v01cj1e6KeAlijFwbv4+X7+2oFGzHMwdFPIXQmjtl34Oz4oLMqnBOCERcT7FYTnS4c+s9f1W2doVL84EWSO8aJpbZ7apA+NglBCCklWYlteTRiQ01npYovV26dzPkamLJ2vaBZwo6b06MhNqtD4KvTIX5Z7zUn2YYX3WPoyPiWl3Sv3GSEcuXaJJFeaU+fP6B3zqmW+rn1FYxQxjh8LkQOesU0Db/DzpAoH76A7iOhiOYSnwB71q41X85v2UKXEh9g==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(14060799003)(23010399003)(36860700016)(35042699022)(1800799024)(82310400026)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PGbtROYL6+XA7K/aVpNTQTD7ro1/Bw6IVyrUtHaKJ+6nhW3QcTVlt0yDr0EEOUKY2lgtOYi1b+8J5ujjbWgBSAZwCnKjFmJlNFCoeUq6USisD85WQGd3mJBQl+4Fu5HsWHnf9/X3fW23OMYsBEHyg993iKXlpRs4ohgrOmzz/2SdgSvKtTZujXmrHZyyTFZRXY8FqVMemnnuwoMyHFr5MH6lo7SOKXL0gZUQaCNSxHuKeAHlpqR+l7psm4MH1dsPtqDUzLSQezgkaBvmEiUiH5bOx4eL0UWs4u8QVEg5BFYiPgAZZuXdt4O0vDIYiSanwI4bErjRqOayDRiu99CFpk9B1Re8fzwknpMtapeaX6lNpN8UsrjdVYhgHifNkv3VO2X39J14b78WSvGrFHX1QdFCam5k9q+UK7s4EdimaiSpCyAEQSBwTMkDoYLko1pt
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 22:25:54.6402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73fcf055-5f86-416e-6264-08def1ae2ef0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9389

SGkgQ3Jpc3RpYW4sDQoNCkEgZmV3IGNvbW1lbnRzIG9uIHRoZSB1cGRhdGVkIFVBUEkgaW5saW5l
Lg0KDQo+IHN0cnVjdCBzY21pX3RsbV9iYXRjaCB7DQo+IAlfX3UzMiBudW1faXRlbXM7DQo+IAlf
X3UzMiBpdGVtX3N6Ow0KPiAJX191NjQgcmVzZXJ2ZWQ7DQo+IAlfX3U2NCBzdGF0ZXM7DQo+IAlf
X3U2NCBpdGVtczsNCj4gfTsNCg0KUGxlYXNlIGRlZmluZSBhbiB1cHBlciBib3VuZCBmb3IgbnVt
X2l0ZW1zLiBXaXRob3V0IGEgY29tbW9uIEFCSSBsaW1pdCwNCmNhbGxlcnMgY2FuIHJlcXVlc3Qg
ZWZmZWN0aXZlbHkgdW5ib3VuZGVkIGFsbG9jYXRpb24gYW5kIGl0ZXJhdGlvbiwgYW5kDQp1c2Vy
c3BhY2UgZG9lcyBub3Qga25vdyB3aGljaCBzaXplcyB0aGUga2VybmVsIGlzIGV4cGVjdGVkIHRv
IHN1cHBvcnQuDQoNCj4gICogQHN0YXRlczogQSByZWZlcmVuY2UgdG8gYW4gYXJyYXlzIG9mIHUz
MiBpdGVtcyByZXByZXNlbnRpbmcgdGhlDQo+ICAqCSAgICBvdXRjb21lIG9mIHRoZSByZXF1ZXN0
cyBmb3IgZWFjaCBzaW5nbGUgaXRlbSBpbiBAaXRlbXM6IHRoZXNlIGFyZQ0KPiAgKgkgICAgb3Jk
ZXJlZCBpbiB0aGUgc2FtZSBvcmRlciBhcyB0aGUgQGl0ZW1zLiAtIE9VVA0KDQpUaGVzZSBzdGF0
dXNlcyBjb250YWluIHplcm8gb3IgYSBuZWdhdGl2ZSBMaW51eCBlcnJubywgYnV0IHRoZSBhcnJh
eSBpcw0KZGVzY3JpYmVkIGFzIHUzMiB3aGlsZSB0aGUgaW1wbGVtZW50YXRpb24gdXNlcyBpbnQg
Ki4gQ291bGQgdGhpcyBiZQ0Kc3BlY2lmaWVkIGFzIGFuIGFycmF5IG9mIF9fczMyIHNvIHRoZSBz
aWduZWQgZXJyb3ItdmFsdWUgQUJJIGlzIGV4cGxpY2l0Pw0KDQpJcyBzdGF0ZXMgPT0gMCBleHBs
aWNpdGx5IHN1cHBvcnRlZD8gVGhlIGRyaXZlciB0cmVhdHMgaXQgYXMgb3B0aW9uYWwgYW5kDQpz
dG9wcyBhdCB0aGUgZmlyc3QgZXJyb3Igd2hlbiBpdCBpcyBhYnNlbnQsIHBvdGVudGlhbGx5IGFm
dGVyIHByZWNlZGluZw0KY29uZmlndXJhdGlvbiBjaGFuZ2VzIGhhdmUgc3VjY2VlZGVkLiBQbGVh
c2UgZG9jdW1lbnQgYm90aCB0aGUgb3B0aW9uYWwNCnBvaW50ZXIgYW5kIHRoZSByZXN1bHRpbmcg
cGFydGlhbC1jb21wbGV0aW9uIHNlbWFudGljcy4NCg0KPiAjZGVmaW5lIFNDTUlfVExNX1NFVF9D
RkcJX0lPV1IoU0NNSV9UTE1fSU9DVExfTUFHSUMsIDB4MDIsIHN0cnVjdCBzY21pX3RsbV9jb25m
aWcpDQo+IFsuLi5dDQo+ICNkZWZpbmUgU0NNSV9UTE1fU0VUX0RFX0NGRwlfSU9XUihTQ01JX1RM
TV9JT0NUTF9NQUdJQywgMHgwNSwgc3RydWN0IHNjbWlfdGxtX2JhdGNoKQ0KPiBbLi4uXQ0KPiAj
ZGVmaW5lIFNDTUlfVExNX1NFVF9BTExfQ0ZHCV9JT1dSKFNDTUlfVExNX0lPQ1RMX01BR0lDLCAw
eDBBLCBzdHJ1Y3Qgc2NtaV90bG1fZGVfY29uZmlnKQ0KDQpTRVRfREVfQ0ZHIG5vdyByZXR1cm5z
IHBlci1ERSB0cmFja2luZyBpbmZvcm1hdGlvbiwgc28gX0lPV1IgbWFrZXMgc2Vuc2UNCmZvciB0
aGF0IGNvbW1hbmQuDQoNClNFVF9DRkcgYW5kIFNFVF9BTExfQ0ZHLCBob3dldmVyLCBzdGlsbCBv
bmx5IGNvbnN1bWUgdGhlaXIgYXJndW1lbnRzIGFuZA0KZG8gbm90IGNvcHkgYSByZXN1bHQgYmFj
ay4gVW5sZXNzIG91dHB1dCBpcyBwbGFubmVkLCBzaG91bGQgdGhlc2UgdHdvDQpjb21tYW5kcyBi
ZSBfSU9XIGJlZm9yZSB0aGUgaW9jdGwgbnVtYmVycyBiZWNvbWUgQUJJPw0KDQo+ICNkZWZpbmUg
U0NNSV9UTE1fQkFUQ0hfUkVBRAlfSU9XUihTQ01JX1RMTV9JT0NUTF9NQUdJQywgMHgxMCwgc3Ry
dWN0IHNjbWlfdGxtX2RhdGFfcmVhZCkNCg0KU0NNSV9UTE1fQkFUQ0hfUkVBRCBpcyBlbmNvZGVk
IHdpdGggc3RydWN0IHNjbWlfdGxtX2RhdGFfcmVhZCwgYnV0DQpzY21pX3RsbV9kZXNfYmF0Y2hf
cmVhZF9pb2N0bCgpIGNvcGllcyBhbmQgaW50ZXJwcmV0cyBzdHJ1Y3QNCnNjbWlfdGxtX2JhdGNo
LiBUaGVzZSBzdHJ1Y3R1cmVzIGFyZSBkaWZmZXJlbnQgc2l6ZXMsIHNvIF9JT0NfU0laRShjbWQp
DQpkb2VzIG5vdCBkZXNjcmliZSB3aGF0IHRoZSBoYW5kbGVyIGFjY2Vzc2VzLg0KDQpQbGVhc2Ug
dXNlIHN0cnVjdCBzY21pX3RsbV9iYXRjaCBoZXJlIGFuZCB1cGRhdGUgdGhlIGRvY3VtZW50YXRp
b24gZXhhbXBsZQ0KYWNjb3JkaW5nbHkuDQoNCkEgZmV3IGtlcm5lbGRvYyBuaXRzOg0KDQotIHNj
bWlfdGxtX2FiaV9pbmZvIGRvY3VtZW50cyBAZGVfaW1wbF92ZXJzaW9uLCBidXQgdGhlIG1lbWJl
ciBpcyBuYW1lZA0KICBwcmltYXJ5X2RlX2ltcGxfdmVyc2lvbi4NCi0gc2NtaV90bG1fYmF0Y2gg
ZG9jdW1lbnRzIEBpdGVtc19zeiwgYnV0IHRoZSBtZW1iZXIgaXMgaXRlbV9zei4NCi0gc2NtaV90
bG1fZ3JwX2luZm8gZG9jdW1lbnRzIGEgcmVzZXJ2ZWQgbWVtYmVyIHRoYXQgaXMgbm90IHByZXNl
bnQgaW4gdGhlDQogIHN0cnVjdHVyZS4NCg0KVGhhbmtzLA0KRmF5w6dhbA0KDQo=
