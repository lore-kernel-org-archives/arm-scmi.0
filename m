Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=2 smtp.remote-ip=52.101.65.65
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794390721;
	b=Vkqyp8w+g/N54z1GFyHXaPuR4L5ASmhudW03nBsJttB1nRQ/hfQNUFt0lySHr2LUi41N
	 C/AhueR95rLHaieeF4paMdLhhRdPG9DBjILX36iSovBUQujVj4cXsjGYTmqiC6o0DA6th
	 OyGUxICVAhfWVb9H6zzcCA+ybsbA7Sv1WYkriJBU36HYFCU0QfKY87OlsDHbH5MPzXOAo
	 5we+vz/D79Xl/HD/aO28owdTWj753B3s+L0C5cn/4CwiXIOyCs9ogKdulhz9UmsBAbIW8
	 oAOg+DYaLe2sTWHETYDMTgAZq01cNabCZQnEZXygwZ4VPBgPfuF5rpnXJH7ZFcejchQ==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794390721;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:
	 DKIM-Signature:Authentication-Results-Original:Received:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:x-checkrecipientrouted:
	 NoDisclaimer:X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam-Untrusted:
	 X-Microsoft-Antispam-Message-Info-Original:
	 X-Forefront-Antispam-Report-Untrusted:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-EOPAttributedMessage:
	 X-MS-Exchange-Transport-CrossTenantHeadersStripped:
	 X-MS-PublicTrafficType:X-MS-Office365-Filtering-Correlation-Id-Prvs:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Qq/htkgcdtwbx7tz1CbTWi3Z6rIKYf+fKiqw9DcYtMg=;
	b=GPwWRvStWqVHbIenjMhd0gXLfcjE4CM2FE1AGzi605ubb0ZmlPvzblRCpIGIK2d2nJfL
	 mCtz0VJGB0vrL2rb6Tdlhl6DjthAK3oftmjFu0kEctpZAXeDS7MU3zdyvbRnzGs2Ykkok
	 0oJ0tBexC+tHQCGeQ1Vvt309wsYbZwERlwAhOF1btcVNb9I5z+2ZFVKgtDo703sQ04nMm
	 WVNlwKE7ZeAYT5v4NeRIVhNFJeO/DbbezdZzXj3GPj/SHfPKw8T9wX1kfUvBR7W6P4s1h
	 wAN+wnCeriUv3Ei0EY6jbUbVimJ3DWxe9ghjJuWq8cJUmy6daCpIdN+45xtSurXkLjA==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b="kQKC0hR/";
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b="kQKC0hR/";
	arc=pass header.oldest-pass=2 smtp.remote-ip=52.101.65.65
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011065.outbound.protection.outlook.com [52.101.65.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534EF606A324;
	Wed, 11 Nov 2026 09:52:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 534EF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=kQKC0hR/;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=kQKC0hR/
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bbwTUtGjczPyy0tJkyuWHZ0taQdYQbTC7+lLTMzQbcW7+1A90wgUeSJE3MnqfAVTyI7LL3sjVLZ0Kl9RaAKlAMFYaIYG3/J5E0N24Ku3A6UYr4SF091qP/DKcZ6+gjKlpBhboLrqt90EC1LTU37wc2Xd4I+XdX1A37bjwqgabvdaV16tF7hOB65NCFHtHpGq4/ioiSvHshtTQkvzBNq6yhReFRKts/YkBthtC2zJ+My6QuX4extV7zMFPCAfNzv/oo7IjL4T9Ioes2axHcpuS8LafBU3Z+YZGnRwIPUjeHEtw81silYxJ/1hv3KYYKm2FKEQ+56vqoQHkRRS7zSRlw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qq/htkgcdtwbx7tz1CbTWi3Z6rIKYf+fKiqw9DcYtMg=;
 b=nH5n522DUkvzTZ57RH/Tk3BAaa8hUWyu8FCrpmtoLKi1wymHCc5P56R2urprB3abCyDlnqtR8YK9Vx4QFCWkXt5/3OF3cfr1GPvf7mC+tqZDfpwzddkRglhLh209iTOtnAL+jA2nh1JivtdDr4PB/aTiSF0Ud8j8hdqiojuh6L4Fp+bAcuZvf3K8dVvjGaLhQtD33DLynzKA7lepFIkonvRTkoKQ/YBCItcPJHqhztE/20nrVTDq81ziXb/TSTGgwiaEfLTtsOLQAeFehxD9NUJqjdl3SOeQ9N/FKJN/3Ui3WhueoV9Ow17tGG88MVluW4ddS2s0TR88yhTa9MtHDA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qq/htkgcdtwbx7tz1CbTWi3Z6rIKYf+fKiqw9DcYtMg=;
 b=kQKC0hR/Y+6PHfjkHKgi2KgF+KXRtBk/oTrejtx6t0q5EX2OOSQ+5rwF4GxR3ag3w3MzkrMuTtdLelfr6kgLIp6etV32zIgjpy/cFcZJHtSlSBUNMb+swC3H8hU/Hjm8TytWkCPcFW+YZLknkdkMrS/f7qBTokJnDUyM06LPlTo=
Received: from BE1P281CA0037.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:22::18)
 by PAWPR08MB9590.eurprd08.prod.outlook.com (2603:10a6:102:2e8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 11 Nov
 2026 09:51:52 +0000
Received: from WA1PEPF00009B39.eurprd05.prod.outlook.com
 (2603:10a6:b10:22:cafe::12) by BE1P281CA0037.outlook.office365.com
 (2603:10a6:b10:22::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0 via Frontend Transport; Wed, 11
 Nov 2026 09:51:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 WA1PEPF00009B39.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 09:51:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hqMLhHlYuXhZmDwh6NEaPtpPY5cLJu04zlEJM9yc0JUYBnduzm1bbN/czvS1BhgunrbtlkTIq8lLd8P9FQgKGwI+MZq04AokvWpSacG/NVCtL5uvYkRvldLqQUcsMjmLzm71CJYK/PQJO11esaGcjz210LdLoezfxTKWeH1bbVd1FckZj7/aEC9qfHJ6BsBwneoLHPGVCEESLwRQ/BQX8sft8x3wsblEGEIh+YVjLAPwnO72teAiNOwlOvR++K8SNSpeDl2LcKeDg6ggcorU01OEbeg/A1NMzb02QE+RWr1p5JudVEXDsAsFgDhyG13Ri0ZLUig9cRs9dhvJurxBrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qq/htkgcdtwbx7tz1CbTWi3Z6rIKYf+fKiqw9DcYtMg=;
 b=yXAHsjb2ZjzS40KiSIuyjS9VhNV7/ZcyzsILDOAlXr06dVrVg1Q/uURg7dy41X+iSeWQPPUXkUBWxqf1fbnTpeSAM+ueiQ79b2xjX1ldn/FqZLJt1YRjqbb/mXbDTFzs7y/T8CHng1a8J3ItuRuEkyJKcLZUcaXvJcE6CJAokfpOVjUOpcmvfzNvTfhpXR4irEWihqU3JuKlhHjyyS4zubQ+LsGBorCDxOJ7KdSIKE4JPRmTigLnrKYxTRpK9/cNEXd2f64KGFA5M3myFJ/A8SZAnxAR6BvaCLxEDyTQ8JfCPYjHIdmR2AbwU3svHLYsGrrohZLZEMXf7Hawi7Kc/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qq/htkgcdtwbx7tz1CbTWi3Z6rIKYf+fKiqw9DcYtMg=;
 b=kQKC0hR/Y+6PHfjkHKgi2KgF+KXRtBk/oTrejtx6t0q5EX2OOSQ+5rwF4GxR3ag3w3MzkrMuTtdLelfr6kgLIp6etV32zIgjpy/cFcZJHtSlSBUNMb+swC3H8hU/Hjm8TytWkCPcFW+YZLknkdkMrS/f7qBTokJnDUyM06LPlTo=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
Received: from MI9PR08MB755481.eurprd08.prod.outlook.com
 (2603:10a6:290:86::12) by GV2PR08MB9280.eurprd08.prod.outlook.com
 (2603:10a6:150:e1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 09:51:08 +0000
Received: from MI9PR08MB755481.eurprd08.prod.outlook.com
 ([fe80::7f1c:5743:84b5:37d5]) by MI9PR08MB755481.eurprd08.prod.outlook.com
 ([fe80::7f1c:5743:84b5:37d5%6]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 09:51:08 +0000
Date: Wed, 11 Nov 2026 09:51:05 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, d-gole@ti.com,
	elif.topuz@arm.com, lukasz.luba@arm.com, philip.radford@arm.com,
	david@kernel.org, souvik.chakravarty@arm.com, leitao@kernel.org,
	kas@kernel.org, puranjay@kernel.org, usama.arif@linux.dev,
	kernel-team@meta.com
Subject: Re: [PATCH v15 00/35] Introduce SCMI Telemetry support
Message-ID: <20261111-fine-primitive-locust-9ee539@sudeepholla>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
 <20261110163809.000070d6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261110163809.000070d6@oss.qualcomm.com>
X-ClientProxiedBy: LO4P123CA0342.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::23) To MI9PR08MB755481.eurprd08.prod.outlook.com
 (2603:10a6:290:86::12)
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	MI9PR08MB755481:EE_|GV2PR08MB9280:EE_|WA1PEPF00009B39:EE_|PAWPR08MB9590:EE_
X-MS-Office365-Filtering-Correlation-Id: 3885d0b1-8d89-4e7b-2ccf-08df3fd968bc
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|10067099003|4143699003|11063799006|56012099006|261022075727099003|261021135927099003|261026140227099003|261021123027099003|261022105027099003|261026121527099003|261021121427099003|261028144727099003|261102123227099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info-Original:
 rUCQfoVJObsNljJP+X2GBO4B0fS9jEUMZshxPdtH0vjRZAfcyBR/QVxhioIAkQbcmwnYcQmmCdunYnQE+N6ZOR8ec3BxgYrLYxC5Upc63fFNqKrsuVN4ttUfxiU22nDCcAGVa2rQF7cCzQibA2YDB8Nq3pRkl2E5CnSbahvUqUI/J7xy/38+K3uOMricZhLu0LB6jtwRiYwy9qFDK/ZyWu/EqZvc/hX8rz+xr2u6DS4C+pT1R47YwxykDYmj61rpnldYz7KmBwYTpDqxpRqHb6VNNnAsaqDFkG1HQ8jDKCbeHbaQkKf/2ZR7Ht1WeDcx7BiPxJmxTCn9V1/5YCYUgBRO/5EaYvQPvpmn1mdMWQ8+dNLPvvX+FlSuu0AzYnXSAfBiqDATe+ve1WVbc/VAyLYB3qPdnnqH7Vntwj0bv7K/WBXGJxszi64k9PPqlRGFqpx4Uhyg0qhw9P0L1GGFO0wzP67lpOa3PIlrbiTAJ2MtEwoJDjLquzIPjegy2ABv2dcs0Jgcw8II3RzY+Yt2kAES9/mSgqQPbEb4zKvpIXb6TQNemggJ28iqFpZgsGp7KY2hczWpoXkOwFwsOqupFfT6ssiaO9thal7fqapSC1NpeY/tA55CjKWJm7BV9I9JsJFr7b6+eIxTgaDBEw4YE/8VNf0d8/hZUm+8lSSYIIs=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI9PR08MB755481.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(261022075727099003)(261021135927099003)(261026140227099003)(261021123027099003)(261022105027099003)(261026121527099003)(261021121427099003)(261028144727099003)(261102123227099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 G1jCcoM2l4gm2xFxLfC8CCHdMJyA+60ArGNwMGUCMf5M888kMqDKpB5xDKvVLOKwGn0odAiG7F9v0Vu8ZR1Wyfvz4PgSB4MtCt5QjLQUnm+LAvpbwnhAIufP/bLkGi45l/t2zV7nb4J3/iWkcY9eCosr/+mHTVd/x+MIZEdPnBuOo+PVWlLf+3PnWhnS2kA2zhjfUOy5MOq9KnyyzSAG5hYdLQiY3mCSfTWFUmHdmDB5R9YeEELW8JtBsOqW2LTqA3o0m3bZaj/MwVk3K/ze1iKeeAMCvC5fMMrOQBY7HHTAEL2dUStxPhSEwGaIKWL+FrBGti/JYVMjlh4njHlQ5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9280
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 WA1PEPF00009B39.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	771aa87c-73f3-4cbc-f597-08df3fd94f6f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700016|82310400026|35042699022|7416014|376014|23010399003|1800799024|22082099003|10067099003|18002099003|3023799007|261022075727099003|4143699003|56012099006|261022105027099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261021123027099003|11063799006|261102123227099003|261021135927099003;
X-Microsoft-Antispam-Message-Info:
	paAuBEhxaQpCkYjp3tq7vvYzdUyS+RUjbdabQT+jFsSISLn0uvanIB7ekbdhMjC/FQFVrSZfNID8psSWoDJe1oAm7oqMYZSiHFNPWNQMYQLyXdQ2pUD81nk/H/mxu4asj2NRuHPsGRcqlnMhBRGWk54zLsmq1RMiHk0fwEmWidnqwwM+B72F/7+csMTfmf19SYxa+TU+K6P18H+316f5JuFQgF5Mv1VowR0x2QiFDEBYiMhckplJL2vIs/X+NWo/0OrJ4do3Cejxd8DUYoaTXyv7ytEDXHwy+aeHcnYYTe6SVxJq6NRn05m+RqoQDTtyaQtIOASvQd0DqreeL5Wr98+z+VJT4DfJhS8vD5sVpfxXS3m4eiVvFSLG7Kq+BPFQpyUT3Zu4K2QL7mzl6xxI/nzd5uP06y3ufKn/pln86M2WYfdCdUU6+j4YpUl8STwofgY/pk4khPLubqKOwot2/mn49w1ZUw7JlZCQ6yXKCEQ29q9ZqvLGpo5T30VZCSyHLxA9HTGQObw0LUQY1LjMIrEvexNYZH/DMOb8N1o+jY1VZYOvppnokqn5HgE/yyD2oLj/JCwSo8LzMQCB6O3SpZ2UzEFZPOjlT4lV3jzxt/K5iGunfqGgTUHs8iykOuxsQlPMEIHnYGHSpd6FB6jP7X/ui0yOmENtOqBK9VdElbMLLbPGoz4pXyKHmbcNa4MAQwUiCGs6TX7D7N86kwNFZg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700016)(82310400026)(35042699022)(7416014)(376014)(23010399003)(1800799024)(22082099003)(10067099003)(18002099003)(3023799007)(261022075727099003)(4143699003)(56012099006)(261022105027099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261021123027099003)(11063799006)(261102123227099003)(261021135927099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4PhJSjJj4t4sGopCdly1ZWwOkCwFES6k2vqJmqSMg45usJRmkGcMQAv472FrK9+GrUSSArHB1lBzoqCa9qzJQPg7q0T2Jl+9SePHImlEaIGv9RRwVnV433u4Ifm2D4TjUQbHqwjYJ/0ykSVk9Wb93wWL0ci3PKrPoi0z5vr6DY0BKUIRS6XmcwJdrcrUCgvqO+ldYABCkJl4gaD/taZg0SLzkvzs1pHYXUOW5yprF9O3HnqDaaX4tFjw/DBL7V3QHA+T5uTIkpQWEe975CenopZiroxAN0vVUDzGMn9BjIJZzJjqV778Db93xi9kzpiYv69AQS/cPeDk9Ac59jnEg5e6uEIo8VTE2vi5/5lN+j8lSCsHCSjAzUOBdWbjS2ztrJFx/jIOS8pTSYheWWdt9mArjKV8XW7wKjERAag5+7wPVubs4KIGXg1qRT+mG9X3
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 09:51:50.5575
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3885d0b1-8d89-4e7b-2ccf-08df3fd968bc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	WA1PEPF00009B39.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9590

Hi Jonathan,

On Tue, Nov 10, 2026 at 04:38:09PM -0800, Jonathan Cameron wrote:
> > The upcoming SCMI v4.0 specification [0] introduces a new SCMI protocol
> > dedicated to System Telemetry.
> > 
> 
> Hi Cristian,
> 
> So, the main issue here is pretty much summarized by:
> 
>  28 files changed, 12801 insertions(+), 99 deletions(-)
> (obviously there are tests etc, but it's still > 10k lines)
> 

Completely agreed and every time I want to review this, its just takes
less than 10s to deprioritise this just based on the size.

> There are relatively few reviewers who would even consider taking that on.

And you are definitely one of them. Thanks for the patience and the review
you have done so far.

> I foolishly thought it wouldn't be too bad (and I review a lot of code).
> By about 3/4 of the way though, probably much earlier, I know the quality
> of review went down considerably. Honestly it was probably a waste of
> time continuing but I'm stubborn like that.
> 

Much appreciated, please continue to be like that 😉.

> So, unless you have a path to bribing or sweet talking various folk to
> deal with reviewing this with each having to set aside multiple days
> to do it, likely repeating for a couple of versions yet, I think you've
> got to figure out out how to make the first patch set more manageable.
> Probably don't split it up as much as the mpam or CCA folk have had to,
> but you have a lot of colleagues who are experiencing the same problem
> at the moment. They may be able to advise.
> 
> So it would be nice if what was in that first patch set was 'functional'
> but I don't think it needs to function on every systems or support more
> than an absolutely minimal feature set.  Just fail to probe when you see
> something that isn't supported by that minimal set if that means
> the thing won't be functional.
> 

Yes I am thinking I will complete review of basic support and all
non-telemetry related patches here and see if we can queue them if not
merge.

> Once that's in place, over a couple of additional patch sets you can
> get to everything you have here.
> 

Agreed and sounds like a strategy that would work in making progress here.

-- 
Regards,
Sudeep
