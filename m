Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013015.outbound.protection.outlook.com [52.101.72.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B64F21C16A;
	Mon,  3 Aug 2026 22:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.15
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785797634; cv=fail; b=VX1kw2eKA5LDB9smfDaclFboEdA51dFwMtSbmt5R+9RfLNIvgWJ8Kjv45QRiiMMO5Iq1B/UuvKOoJ0O2ax5fkjG9oR/tDd+uGie5UTrkUKTPd1Z1oplzXZf5+tptGjKh2G66wIhnhAy4zkhLlWqwcCSxQdrQ8wURveyFJs5mhDQ=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785797634; c=relaxed/simple;
	bh=nCQnFVpxRktt4DukrwY9Mrc8sSsp3y1D6ZNbmdfrdcI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:Content-Type:
	 MIME-Version; b=Bp1qaSMFkYRAmWoauGyiLupkbDMqLCPq9oozCGoJaeMfkkeHBc1+KsxaYbRlz+Urtmu9ls8t0MOZlGHgerC+YZS2bMRFUCkRU2DF9O6eyAzREt/yeeFpXkzrC/pEU9KpEG/PJlkKFbaSBRvPHbByd8yAV6el4oDZxGN6ZFKMNwk=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NFA0g1Cs; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NFA0g1Cs; arc=fail smtp.client-ip=52.101.72.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NFA0g1Cs";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NFA0g1Cs"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=VZkCgc5kSX7G6pK7isRP20A2ZL8dX7YrPwjjxVWN9rHCvdQEbYoSmIlXq1+oKsXx47w668stHpIjeSxRZAUfdPiJJTYbEdhcY3ziz+03+4JpXOEED7Rv5SH96EHkG8p+C2Dxn+niGY5kxeqUsqj7As+wcZ1JUK1/sTTkdz+bgSrylVJmiinicxuqIBoXCVC6IyppeSEYXIFdGvDRSIMK7FKZeuBPYQh74v6mrQyOS17ybpz8mivCtnqNj3WVgwrQD4Pulb73LVri9io3qrmz+KV2ekz2KYB6/X9va/eTk/oQwx5lAm/X1+TMljs1aokvu3t2mFqi6qXvlo8pMxiRfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCQnFVpxRktt4DukrwY9Mrc8sSsp3y1D6ZNbmdfrdcI=;
 b=TTfSb6kH/d2zAgTjJcWIOgl5aIaUrzvgojmZ+aVCLuz2B9pWbJgdeQFPqXI2A1TW2Zd28hBCchpsywmGIdD+qFGeEqnM53p8sy6j29yLoRlWdZO79cace3MHpnDf/G9vw+swRiFVzOL72y1csrtAu28Vj7O2gaBngcaOTb9iLEyoICfzboxFIOjhLytWqjcUYfAKY6Yc+PX3dzgUlUMx7IAlep0c+hi4nvamtlcOCHc/QooQ8JUK01+M0nAGWE30JJCtBUn2lHNcXaF2FMoNmAFPxuNmK5Rtlk8WbBAwyvWdlP50imGEiKhxd8DAkG8t+8WJEnoJQ4FFSqmUMiX9JA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCQnFVpxRktt4DukrwY9Mrc8sSsp3y1D6ZNbmdfrdcI=;
 b=NFA0g1CsL4pdHqCzAv76dKGwOw/9C0dneUC9vZ8fw8w/vchVaThVPU5wkrzc9QWh9vLktNu22v5k13Q9AQ0KRbZIkmWofp2gKsALYzi8bIljHgXS7hSj1sTje+82m6+AkCJtTAl6Y5w0iTdhPTMnZLL9uMfj/hRLHqAinWOY8PI=
Received: from AS9PR06CA0560.eurprd06.prod.outlook.com (2603:10a6:20b:485::10)
 by AS8PR08MB8635.eurprd08.prod.outlook.com (2603:10a6:20b:563::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 22:53:46 +0000
Received: from AM4PEPF00027A63.eurprd04.prod.outlook.com
 (2603:10a6:20b:485:cafe::78) by AS9PR06CA0560.outlook.office365.com
 (2603:10a6:20b:485::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Mon, 3
 Aug 2026 22:53:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A63.mail.protection.outlook.com (10.167.16.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Mon, 3 Aug 2026 22:53:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gXxRxKSJ2T3w6vm2KBNKjeYeojxU49m/cevYAv0PSQTzMZ1SGWdLVMvehY9SQTk2kHuu/5CneexgrN5bA19MxW/pwn5o5HD5EzmR2T/dL41W4V+XCYva8DijlcdV0Qfbldmq/5ziOvJaby4HS888+iQ82jagtJVZKVNwgrgh17W74LBzzbAOdG2YbOnQ+WxfrkVbFQg6N/T3eAEPu06czWj1EpUAQXmJo8thMZWuBiL0iTXPbOy3JBD4IQIkTNqWcHFcL3tnLmE5MRjV+0WACNsrAgufoHeRF/6askdIcA+PxA7RqwsBRg/UDAL/82iBL43cSHQGOKQ0+pFoANIcuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCQnFVpxRktt4DukrwY9Mrc8sSsp3y1D6ZNbmdfrdcI=;
 b=KucWzG4YlTh/b//lRTCC4Kq7nPUxAxXkqy53a0AI2HBuaL3WitrOwFXYnPP+c/tNRXugcSHcwRDVuA/Gw8Zdxq7SEBK6vq7mEbqwL1mGBRJyhiNhZEG/XBRTSa/P+UC/zPcAxrMT6P0gqUwJz7+N198VcW+aYsCGJsgmu5NRlMQNv7nRfhA/odiH0KugMIMOs+uDGpcUprsPUOz+ZZD+0MUykPNW1poXoQi23cz+BFZYKwCmm4mddYvjvEbWUk6AvN5QcfOzgK4DSwjtaM9EKbbgJmqkX54K2sCpZQI6E926tne39gktfKpgWLi4YfVetJZLyZ3JDClKrB9T1APZQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCQnFVpxRktt4DukrwY9Mrc8sSsp3y1D6ZNbmdfrdcI=;
 b=NFA0g1CsL4pdHqCzAv76dKGwOw/9C0dneUC9vZ8fw8w/vchVaThVPU5wkrzc9QWh9vLktNu22v5k13Q9AQ0KRbZIkmWofp2gKsALYzi8bIljHgXS7hSj1sTje+82m6+AkCJtTAl6Y5w0iTdhPTMnZLL9uMfj/hRLHqAinWOY8PI=
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com (2603:10a6:10:3d1::9)
 by AS4PR08MB7503.eurprd08.prod.outlook.com (2603:10a6:20b:4e7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 22:53:12 +0000
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90]) by DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 22:53:11 +0000
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
Subject: Re: [PATCH v7 06/23] firmware: arm_scmi: Add basic Telemetry support
Thread-Topic: [PATCH v7 06/23] firmware: arm_scmi: Add basic Telemetry support
Thread-Index: AQHdI5rcAJrOaqK6u0Oqs5YrEEKv2A==
Date: Mon, 3 Aug 2026 22:53:11 +0000
Message-ID: <AFD5A4D3-916E-4989-9F38-F23E7A2BED0B@contoso.com>
In-Reply-To: <<20260802145618.1952804-7-cristian.marussi@arm.com>>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB8651:EE_|AS4PR08MB7503:EE_|AM4PEPF00027A63:EE_|AS8PR08MB8635:EE_
X-MS-Office365-Filtering-Correlation-Id: 006b213f-2f76-498e-5e56-08def1b212b6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|38070700021|18002099003|22082099003|3023799007|5023799004|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info-Original:
 FFXp6/NjkAKH21kCGc2AmsxiHQfdNfpS0nn2gaceqEeJhz6dy+EJ5E09T62RL2AFHMSkKGMCQJ3yl8P8Yfs3jrrrckNosA6I5NbibrGudBndkiTfIoS3OfgvKunKVIlfZHa73rIb0wTScrdkwllxG4f0M/8HKO57dN989uhg5axOanGikMk3BAq8P2uk8GpKj3f9dEgbcuiHXA3XTmbrJKvytX65QX0dEOj+gfFAJthEDoe1U1AUCPdJGslU6dIbD1tKbp/RdNHx9I8+iFpgg13UOPfo8JXz00jaqvcY8q++OMGsjtiD4A5NtSoOMU9aeQBbBNmBW64sKJTmalmRb4s76Z7Zw2qdXWJfz+ulwY2ludnCn62RUXE3Y2YZrWQK4VJ6mzEUhm9/ZytHgbffP4/2RHAzakZJ/KzoW6aSPC8qsnYSxKhsdRhKuOCKk/sNabhCUEaRhApK9PrB1hQg27kvhpBFyR6OXcx5fof43PGamOQ0tnBymhefy0318Jd1t2Rw3MmcKfBPiawBZBQeYbRRnAEs75WQbQgP1gqzz/0iPS56f3qdEWb6dTQLTCfALIYN0RRyY8aGGuCQUv8f0vaRBFikfL0xH8sAc1F3pbHnXpgLxYaBuukyFHG0M1E8ZjSqutr0CFFeQLF97iotvGMcmQXml3kqjbUZcZkkb8s/Ydb4KWOY4Qfjy9hmXnCGrJM2DcUhC2lyT9MAgA6z5kuRvBiNVxyaslCgNWWxvZA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB8651.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(38070700021)(18002099003)(22082099003)(3023799007)(5023799004)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E19F543E6700FF4DAF13AF0CFDDE1B31@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 LBLFJoUvTkrEih4QUToqd7KUR1g7rvbB8FDus648as/sEJ2agt//htxukOdB3bTRATaYpERBusQOBzCC39VhP/PjGvAJU5GvxBFxlw0xJVpTMeqvp5hs0+VYQ1++CVpL+CoPsSVMFQ9UgxcbbkC2S0xuHC02XjKUm/JIyQ/tY9PXI8l4LZpZzh9+eh/mfjoHL6vb/0px/qZAwxZxLkl08vpD7Q8wBiUPKGRu/tuZbaw1pD7Hcan3DXczJtVlqhGbNNjtnOKyfdEHYYtuOpchkftPQyFFtGU5xjkx5kIB0wmU6sYx7sYe4sJEzns+sOk8BBfABHtG5kjPNImUrtWjeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7503
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	720bb8e0-1349-4c70-75c5-08def1b1feb3
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700016|23010399003|35042699022|14060799003|3023799007|5023799004|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	MjZG5Azvfo6QeqWh1fc3UPC3OClAahipt25DAtTFG81Z6uHX1fJpYmdnaWB0IEIFMaiwhqEd9SLrD4AGISGdTMnP15JmVmud+mlS4B1aPHfsgXgh5oBggAkwstq2CQmLQ+NV7bZCGzniCEzec0+WFaWqR7iZLn8LP0CZy5L49pTVJHut64mursOHHb2yifAv/GoYIaI9tQsLzCABJCvmo2foq7GEIevk7k4q072lguRUZ8MqKNmvUe0eW0UpbjxxIr7rW9X05twQSOZvdY4ZpJJ9FQMrTEO8uNDHVN0cJvWqReV0+TdYhKZ5nuY7BZi55Ppm7LD9xFqs4oprMbOOsvCtnHwoPYR5AoDUFJ+jR9ZSETgGl+VVbn7FMY4YQ50b7USX7yC0QlTqBgcX9o4KwDagnCUe1DUlsik8Ig9dM2++ZeOM67dC8dvFr3iVosnuM1THfOIH6PLHR6UMErjWqtaFMD6qHcJooFg0XqDcELm85gdZM5SZhil1BZIVa507dHUzQieLzdk3iNwOoeS7FQprtsIp678FpGAJfMmgUFpeJeK92gvz+nx44gcEJ5zXDBxCjITM9LpVbaowA99iRo/dxrC5DhBzxmWzO66b2+XSHJHFOQpVfl07Z5zWO75jNELsCaEOatelurRhACYOvwo/Z+6/iEYKRo7VFB1M+c+4c7Yk2BF6/LjHzI2oRmbpUxEJJnzI2KEzgJjBR5++Zw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700016)(23010399003)(35042699022)(14060799003)(3023799007)(5023799004)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BaL5BKoS7iGazyhCGgDNPuO396m2gJQvsTZQlNth6+q4zNhtSkRmkQq8loFbyr6mY8w7dZpnGVf4cyZit+KcOyERCsTd8gLpis418IFr/FDkBZJr204akbCYssPZyFu3tMBGfjvjm72x/c7IM/D9ZTx1TNhSHXQhvv1A8HzNnEunSYr2rLVFrS0/pDR3Uk7tMVOukDjPZxpWlotarPckZmG6lo1sf4JSW6udP9weTWGChUoPGgOe8If0YtDlo6e+lo1PuMqHJfb1vqaeLM4hZIMTvZeAXsm2KS2Rxk6LQVDP975pNd3B7tMzr7ebViKvZmH6LV2wopHapV67kxpjK7i3D3HFoTO03L1BuNNdX/CRNNfBusMlRsADE4V5bN8Bmkef5OhrbO13bBMnKgqsapmv+l5APC+s2LtFpwXBm5yjFfIT1c2wwOXh9vT1BC5V
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 22:53:45.2589
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 006b213f-2f76-498e-5e56-08def1b212b6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8635

SGkgQ3Jpc3RpYW4sDQoNCkkgZm91bmQgYSBmZXcgZXJyb3ItcGF0aCBjb25zaXN0ZW5jeSBpc3N1
ZXMgaW5saW5lLg0KDQo+IAl0ZGUtPmRlLnRzdGFtcF9zdXBwb3J0ID0gISF0ZGUtPnRzX3R5cGU7
DQo+IAkvKiBDb3VudCB0aW1lc3RhbXBlZCBERXMgKi8NCj4gCXRpLT5udW1fZGVzX3RzdGFtcCAr
PSAhIXRkZS0+ZGUudHN0YW1wX3N1cHBvcnQ7DQo+IAl0ZGUtPmRlLmZjX3N1cHBvcnQgPSBJU19G
Q19TVVBQT1JURUQoZGVzYyk7DQo+IAl0ZGUtPmRlLm5hbWVfc3VwcG9ydCA9IElTX05BTUVfU1VQ
UE9SVEVEKGRlc2MpOw0KPiBbLi4uXQ0KPiAJaWYgKHJ4X2xlbiA8IHBheWxkX3N6KQ0KPiAJCXJl
dHVybiAtRU5PU1BDOw0KDQpudW1fZGVzX3RzdGFtcCBpcyBpbmNyZW1lbnRlZCBiZWZvcmUgYWxs
IHZhcmlhYmxlIHBhcnRzIG9mIHRoZSBkZXNjcmlwdG9yDQphbmQgdGhlIG9wdGlvbmFsIGZhc3Qt
Y2hhbm5lbCBtYXBwaW5nIGhhdmUgYmVlbiB2YWxpZGF0ZWQuDQoNCklmIGEgbGF0ZXIgdmFsaWRh
dGlvbiBvciBpb3JlbWFwIG9wZXJhdGlvbiBmYWlscywgdGhlIGRlc2NyaXB0b3IgaXMNCnJlamVj
dGVkIGJ1dCB0aGUgdGltZXN0YW1wIGNvdW50IGlzIG5vdCByb2xsZWQgYmFjay4gR0VUX0FMTCBz
dGF0ZSBjaGVja3MNCmNhbiB0aGVuIGNvbXBhcmUgYWdhaW5zdCBhbiBpbmZsYXRlZCB0aW1lc3Rh
bXAgY291bnQuDQoNClBsZWFzZSB1cGRhdGUgdGhpcyBjb3VudGVyIG9ubHkgYWZ0ZXIgdGhlIGNv
bXBsZXRlIGRlc2NyaXB0b3IgaGFzIGJlZW4NCnZhbGlkYXRlZCBhbmQgc3VjY2Vzc2Z1bGx5IHJl
Z2lzdGVyZWQsIG9yIHVuZG8gaXQgb24gZXZlcnkgbGF0ZXIgZmFpbHVyZS4NCg0KPiBlcnI6DQo+
IAkvKiBERSBub3QgZW51bWVyYXRlZCBhdCB0aGlzIHBvaW50IHdlcmUgY3JlYXRlZCBpbiB0aGlz
IGNhbGwgKi8NCj4gCWlmIChkaXNjb3ZlcmVkKQ0KPiAJCXNjbWlfdGVsZW1ldHJ5X2ZyZWVfdGRl
X3B1dCh0aSwgdGRlKTsNCj4NCj4gCXJldHVybiByZXQ7DQoNCkF0IHRoaXMgcG9pbnQgZGVzY3Jp
cHRvciBwYXJzaW5nIG1heSBhbHJlYWR5IGhhdmUgY2hhbmdlZCBmaWVsZHMgaW4gdGRlIGFuZA0K
aXRzIGFzc29jaWF0ZWQgc2NtaV90ZWxlbWV0cnlfZGVfaW5mby4gVGhlIG9iamVjdCBpcyByZXR1
cm5lZCB0byB0aGUgZnJlZQ0KbGlzdCB3aXRob3V0IHJlc2V0dGluZyB0aGF0IHBhcnRpYWwgc3Rh
dGUuDQoNCkNhbiB0aGUgZGVzY3JpcHRvciBiZSBmdWxseSByZXNldCBiZWZvcmUgaXQgaXMgbWFk
ZSBhdmFpbGFibGUgZm9yIHJldXNlLA0Kb3IgY2FuIHBhcnNpbmcgYmUgZG9uZSBpbnRvIHRlbXBv
cmFyeSBzdGF0ZSB0aGF0IGlzIGNvbW1pdHRlZCBvbmx5IGFmdGVyDQphbGwgdmFsaWRhdGlvbiBz
dWNjZWVkcz8NCg0KPiAJZm9yIChpbnQgaSA9IDA7IGkgPCB0aS0+aW5mby5iYXNlLm51bV9ncm91
cHM7IGkrKykgew0KPiAJCXN0cnVjdCBzY21pX3RlbGVtZXRyeV9ncm91cCAqZ3JwID0gJnJpbmZv
LT5ncnBzW2ldOw0KPiBbLi4uXQ0KPiAJCWdycC0+ZGVzID0gbm9fZnJlZV9wdHIoZGVzKTsNCj4g
CQlncnAtPmRlc19zdHIgPSBub19mcmVlX3B0cihkZXNfc3RyKTsNCj4gCQkvKiBSZXNldCBncm91
cCBERSBjb3VudGVyICovDQo+IAkJZ3JwLT5pbmZvLT5udW1fZGVzID0gMDsNCj4gCX0NCj4gWy4u
Ll0NCj4gCXJpbmZvLT5udW1fZ3JvdXBzID0gdGktPmluZm8uYmFzZS5udW1fZ3JvdXBzOw0KDQpU
aGUgcGVyLWdyb3VwIGFsbG9jYXRpb25zIGFyZSB0cmFuc2ZlcnJlZCBvdXQgb2YgYXV0b21hdGlj
IGNsZWFudXAgZHVyaW5nDQp0aGUgbG9vcCwgYnV0IHJpbmZvLT5udW1fZ3JvdXBzIGlzIG9ubHkg
YXNzaWduZWQgYWZ0ZXIgZXZlcnkgZ3JvdXANCnN1Y2NlZWRzLg0KDQpJZiBhbGxvY2F0aW9uIGZv
ciBhIGxhdGVyIGdyb3VwIGZhaWxzLCByZXNvdXJjZXNfZnJlZSgpIGNhbGxzDQpzY21pX3RlbGVt
ZXRyeV9ncm91cHNfZnJlZSgpLCB3aGljaCBpdGVyYXRlcyByaW5mby0+bnVtX2dyb3Vwcy4gU2lu
Y2UgdGhhdA0KaXMgc3RpbGwgemVybywgYWxsb2NhdGlvbnMgYWxyZWFkeSBpbnN0YWxsZWQgaW4g
ZWFybGllciBncm91cHMgYXJlIGxlYWtlZC4NCg0KUGxlYXNlIGluY3JlbWVudCBhIGNsZWFudXAt
dmlzaWJsZSBncm91cCBjb3VudCBhcyBlYWNoIGdyb3VwIGlzIGNvbW1pdHRlZCwNCm9yIG1ha2Ug
Y2xlYW51cCBpdGVyYXRlIGJhc2UubnVtX2dyb3VwcyBhbmQgc2FmZWx5IGZyZWUgTlVMTCBtZW1i
ZXJzLg0KDQpUaGFua3MsDQpGYXnDp2FsDQoNCg0K
