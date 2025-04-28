Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2081.outbound.protection.outlook.com [40.107.104.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E901F8AC5
	for <arm-scmi@vger.kernel.org>; Mon, 28 Apr 2025 10:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.81
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745836271; cv=fail; b=bhx2QwfAPUoZrs6yFcR3KiNsZjHIMVdGnQtcLd3NF2Izv7KY0Rf/MybCLUzTKkwbTLiABISZFjty0H7bj7Kd4nc3VDGLYb4gGPxy3JxXgeV+9SS4tiHcuADL9ImkQ1wAfiSyWnv8qI4EUj5c7FlbDy2e9j3LhJX1DT275Bm2R2Q=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745836271; c=relaxed/simple;
	bh=wEpYh3Kod4aPf+jf3BdXGr4A6K2k5wxKAS+z7usibLs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JeqJjAXBXAdD/7LroFaijTCa1urGHxMUFkepU+8mZoCbueeWLAVbOHBaFNqFw/UweRDUYJ02U9SJVdLf+Vahq2PyrL0rPPEszxAJdrM3wGIzdQuP5Nzy4gwnsNkl9xOnumWRbd28xEnu7n4XB2wH3HBY4dl+BwmEnKNWplQQ5K4=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=O4+E4BNy; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=O4+E4BNy; arc=fail smtp.client-ip=40.107.104.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="O4+E4BNy";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="O4+E4BNy"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=oRYuBRoONWeiL+M+3JhXLMAu3qLx/FcChkFapcYjGY25NBBbebE3r4pQUlgzYZnOwx0EFNXYkl1WPvC2Aof3PaTOClDq636Sj7OlBgbRcPpUJ/VfdmS8sCUlKLa2VmvH0UVgF0Zjn6X/IKx/LzvJM7Z4PWiPp9kSNQ156HLofKdtRVau9I6YioPtIc33/vWMT5jAJXNwjUmlKp/MkHz4RrgWGLfboiL7eTcOQHwL/6qWYcUa+JCzhjIysKzkf88xjAzeC9vAJ+Qnl+eWT+56GuKU2LNLJ4n18YBgwKUf4PhuoZhRosS43SQDtjv/K40Be1/YOpu+7gnzqwCnrCWzmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qi025Rgt8kBZfncGa7GyvPu4UVUNlLGiE3ZvrqhdKhE=;
 b=R4ieCdhgvClFzcCvSFUi57j+D3z0avB/JqaBlTHADA8cV59Jm+dk/7Fe0cwv15/XaKlAp9ABj8QuxkfO/sOzY9/Pka4e3JMw8e+LRFrqNbXNvmJOsatEsK1FXHL5mOKcXRWfP3OhKcUCs0NtQaCNbqwIlz290IkWrFCPNbSYQZFA6aA2BuBG+jbroXKp07I7FQHqu/iN0aH1ZVVulceDLdpGz5wZ+dxNmiuOMrHTOujWIpQF3OuTVWi9SQGBz5oa/tv0TgMDmgwDiA5W0IxhUTNiq3wQ5EOO+3WnRj0Kx4jBSPPTyWhjsR7QT9uVKpG1NUyT65yy+L07+Bggg9iAdg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qi025Rgt8kBZfncGa7GyvPu4UVUNlLGiE3ZvrqhdKhE=;
 b=O4+E4BNygceLCbmy1L5jKZZiuCxu1sBykFRv+yFRSxquv+GbC/r5ZYilol8OLcFFsDRmKByBLtfORR+6X5ec4y38ZBtS4r+qdvR0YqL6FJtc+LIJcxXUIwyvUPBf7eL9CMIEwwsSDCDy8K/CpX6VNnf0vULRsJe7cERZL7wTtPI=
Received: from DB9PR01CA0006.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::11) by AS8PR08MB10025.eurprd08.prod.outlook.com
 (2603:10a6:20b:630::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 10:31:05 +0000
Received: from DB1PEPF000509F6.eurprd02.prod.outlook.com
 (2603:10a6:10:1d8:cafe::6d) by DB9PR01CA0006.outlook.office365.com
 (2603:10a6:10:1d8::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Mon,
 28 Apr 2025 10:30:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F6.mail.protection.outlook.com (10.167.242.152) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.33
 via Frontend Transport; Mon, 28 Apr 2025 10:31:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wuPUwwd5snfMeuKdlAyCpSiza6Wf0kNSKmDBDYgcBSqfp//Sh6ppq5LZ8afQ8Wo2FlHmXZozwDRr6yNSZHzRDg5qTt4T5yGzgX+3EKf3xwkDBOsVBWCdMoTt8RJ6KGI39dfgHuPhUHBcSwikwAuWzebgTwkU3jN+PHZofOpuIukXJWnKTdsuXtNpobXWQWu6ksIbyBgJSlCMChLig17a48cXiebA/ykYen/76bvKNPC7hff5B0M5Zb4Ikbu9OnkeCU9QyfOLHWWNUoBZMO2soPQV9fxKBGFF2qAKq+d4aA89Nv3xSb++aXPGdjzfG40k/eQZKK4OJqJmEEA92m9stg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qi025Rgt8kBZfncGa7GyvPu4UVUNlLGiE3ZvrqhdKhE=;
 b=fjtFz0ttio3+2KVjFFyxO4Y1+EX1vOxbVXG252EZzTTI+/V0VRCppuPyGqVRgrSMof6IaEN8lrQHFcBoo9+ba33Bo+iYfvY0a14prjTv0uQOI1Gh9PEwWhbsdkGweeiFhee7J7b3Abow45jFabSWpoIpwm5vwjy9twu++bKdc+YQZqfdJXHKKgfg6aOYOv9bMWoiM2XBI1lCcmaE25oq8j6mtBGhvNJNh6nMFUNhpTlMNeTjYx6B6EVyJVAC/BTAlBCz967H1gr7vzLOr92FkBs3l02IU++pDSfSLYkzkgAR//nXJFAxcw1Cc7hYDS28jrSWuwDnjRFmGyBu6c2lgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qi025Rgt8kBZfncGa7GyvPu4UVUNlLGiE3ZvrqhdKhE=;
 b=O4+E4BNygceLCbmy1L5jKZZiuCxu1sBykFRv+yFRSxquv+GbC/r5ZYilol8OLcFFsDRmKByBLtfORR+6X5ec4y38ZBtS4r+qdvR0YqL6FJtc+LIJcxXUIwyvUPBf7eL9CMIEwwsSDCDy8K/CpX6VNnf0vULRsJe7cERZL7wTtPI=
Received: from GV2PR08MB7955.eurprd08.prod.outlook.com (2603:10a6:150:7f::21)
 by AM8PR08MB5700.eurprd08.prod.outlook.com (2603:10a6:20b:1d5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.30; Mon, 28 Apr
 2025 10:30:33 +0000
Received: from GV2PR08MB7955.eurprd08.prod.outlook.com
 ([fe80::360d:c6b4:e158:bc33]) by GV2PR08MB7955.eurprd08.prod.outlook.com
 ([fe80::360d:c6b4:e158:bc33%7]) with mapi id 15.20.8678.025; Mon, 28 Apr 2025
 10:30:33 +0000
From: Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>, Girish Pathak
	<Girish.Pathak@arm.com>
Subject: Re: [PATCH SCP] module/scmi_pin_control: allow variable length
 responses
Thread-Topic: [PATCH SCP] module/scmi_pin_control: allow variable length
 responses
Thread-Index: AQHbuB/W2bfPmp/9sESkgCreGaBZO7O432CB
Date: Mon, 28 Apr 2025 10:30:33 +0000
Message-ID:
 <GV2PR08MB7955196626745F65BF74E90DEB812@GV2PR08MB7955.eurprd08.prod.outlook.com>
References: <aA9KGTuVXZotPEMF@stanley.mountain>
In-Reply-To: <aA9KGTuVXZotPEMF@stanley.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	GV2PR08MB7955:EE_|AM8PR08MB5700:EE_|DB1PEPF000509F6:EE_|AS8PR08MB10025:EE_
X-MS-Office365-Filtering-Correlation-Id: a086db35-ab39-475c-e4a9-08dd863fc80c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?NWj3ClOz0dnnRPpjKIsM7x5kH5ghMB7bzKbkgeI2lSLvYbBZhIH0AkNWXh?=
 =?iso-8859-1?Q?nPNVtF6r3QPLk5PJ1APJENEnRwgKPCQVq9LGcteGU9o3FF9QEfFRg0qDdK?=
 =?iso-8859-1?Q?se6SE5dbJjmEZgR+iEADqr7ePzxqNaSoYmHWcGsaTCyC0T+dmJ+kM4hRAN?=
 =?iso-8859-1?Q?uq8rGHa20sLRn5klRsaDctua2ympHw6GYXsz8r9iCh4X80N5s0/FV4pEKs?=
 =?iso-8859-1?Q?/BY7/V3tikf5aotk3QQ9mr/KjTmCNd1F7C/joPOAYAKqXrZKshWssbmPzV?=
 =?iso-8859-1?Q?i1tzOPQ0IeiUFmJucd8lfz8T0iWQNyTIRBNbTxMWICQImj2W3gztYZVBe/?=
 =?iso-8859-1?Q?d3ep5ysw8P8v1Z8+GZxj9ixX0ojbPOAB7JlC8dFet2IPq3iEr0wDC26WIy?=
 =?iso-8859-1?Q?HASAY1YS8OHb2JPRPiWJav0I9rsG1Vw3JFMS1hyag7IN/I0A0N0lqrtBbb?=
 =?iso-8859-1?Q?NP8n0HoSESDxLN8ggP1s4o7X/fMZtB7K7kzlOAhLLkEdEi8HLOnSN3DziL?=
 =?iso-8859-1?Q?JEyhXUZpiL4zAjW+bpKoQ0uYVuvBEjXNI29aJj6l2isJI3rV+01IRNJvbr?=
 =?iso-8859-1?Q?1RVlRQ9XvJwsGoN8F/ix0XwntDF8c7/iyswE0AOAvZhd//HJ0jKoYfMm05?=
 =?iso-8859-1?Q?KqoZz7JUaze673UHY/RVIURCmrFShjWsvIXFgsTPqaWvFU8Pckul/GKSyS?=
 =?iso-8859-1?Q?yrpjOu8JAxlw9RMr644d03I0k8npKz3Sn6uVKdInNXakayhNz8MT355Asm?=
 =?iso-8859-1?Q?bGQGdOrqwe3AsmJidwcV+RQDT8vv+vl0A+ciriuyCXqljO6lhXdXh6sFSS?=
 =?iso-8859-1?Q?mKa+bLuFLhTAjjGwJrjp5LEU9uvsnRulvaq7CD5dO9TUW1tSjMPDsV0tx0?=
 =?iso-8859-1?Q?PAUCJn1Gi6MvshJQRbFWE3NC/Er9rKNOc8WXAc2QWg6f8GQummCiAtKq8f?=
 =?iso-8859-1?Q?Pwy/KBx97IToNnXNap99MfvNcMW9oIMBMWoe5zw0C1kyNXfcEBDBd8riSA?=
 =?iso-8859-1?Q?87UEpwE9/ZsVrs5TQCY2U9JH5Ijrj7m8Y6//jvxwsTtvRQUiIEYF/J8s/U?=
 =?iso-8859-1?Q?lUZ5IY56qvD67eFwNgvZU+36fy9+ACh56FMc8drqWZpJp/uar1Ut8cqbIZ?=
 =?iso-8859-1?Q?zVuIiq0cWC7XilzCgKu4fjQ62GkR/od1Fs7z10tgXjiS/Y8CXVozxC6NRs?=
 =?iso-8859-1?Q?y5gbzTSVLTkZYeJOQXoo/ss7TJ7OD7o/yfA4/EEDhb6c+5fgUTmmm0NR0c?=
 =?iso-8859-1?Q?3H/v0nKODBKGc7K6W+iR6D+cz4Tw9bD5gXvq2Rj6mRu/W5n6JQnoDNoYht?=
 =?iso-8859-1?Q?+ModWgB2EpJzAsjz20tx93jt6/AuW0dmTplEAUlAnKGSrsqoEjGt7GocLk?=
 =?iso-8859-1?Q?oLT/bdti3b1jvCfJPYyeFqZXKDcZ0PAUzQsiYeFnoBN2/35i2m9G+kwjri?=
 =?iso-8859-1?Q?Rq6m41BV1A+NGcdy/1g8SAX0/qdUexeKKWIsTyVU0f9j39pnUeqcZFeG5y?=
 =?iso-8859-1?Q?JOf7MKNDBE8nownAL4pjDiz6sJuTohUrwrFHVQYn+M/g=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB7955.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5700
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F6.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8ee2e7b6-111a-4979-c8ee-08dd863fb4e3
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|35042699022|36860700013|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?dN4+GZ+di59yzYgu6Hp6PovLlt9SFL1thtSGD4/ffcw4EZREu0Z09snq8f?=
 =?iso-8859-1?Q?ZfCHoEIfrXirrUJ5YEr89prc38Jnd9FE44KfzACbSuLJNGpbRGiiXx31L4?=
 =?iso-8859-1?Q?i+fF38cbYbHHebmRSuWyQ+LCRjwpmADHb8/GCjZIkkmxw0MGPHdrFk7tfM?=
 =?iso-8859-1?Q?LliGShBd7ok7GE79Liw1VeZT0ro3pejKWvmT3wVU3mrkS6xsjetshZSrl2?=
 =?iso-8859-1?Q?jEPcKeTOkDdfwG0tP5l3Ffkz+zPIpAMnkDsGR/ygL7Fruar3FgyXX0L9gm?=
 =?iso-8859-1?Q?ku6nK+KhAtXo7xBYVQQlFeiS896IYXPaUJTcGAtppodMTvivBgE2Vi3OhW?=
 =?iso-8859-1?Q?wsrELoRN2gKeQ/jVZnLTDsK0hzf3wvccty32nPG3ys/qM7B6sJVEOmnWmx?=
 =?iso-8859-1?Q?jU5BWV0wX3Iv430AsinEccUNZ3R9AHbYWcGvRkuZbjCEPXJwEASvZm1FOo?=
 =?iso-8859-1?Q?/1uEywoAnd28IkkC1KbrRpn0J0M4sQUl2ePwhe4WKd+uJoxAfqGtn5kdyc?=
 =?iso-8859-1?Q?2cTewFOEl+Ja3gU3IUIJn+rQbJPL3pL5n6zaEUXS6JYymuhMKTQQ37ySpF?=
 =?iso-8859-1?Q?FwicuFzlj6QJam52JHEWtTnzM0DrbhGFbfe4d8LlFGYhXNjk3LVR+3DKWW?=
 =?iso-8859-1?Q?45ZXm7k4EvXCUzZgIeVMZNld6cZocz2IAZ0EoNtrfck4jOeB7Yxp8qDH6c?=
 =?iso-8859-1?Q?eNSCdVtPwpho3jKXujfEhTdMescFqNh3KpG4xBMHe7rD8O03OPPYGFRLrj?=
 =?iso-8859-1?Q?GwkdQhvgQVqajIiGbcdklN3U2ZVPyCaTgACUrKNKorQ0IIaThtF0qHYY0I?=
 =?iso-8859-1?Q?kLxfT88MNa6mSKJ9MxbuSluZOtyEbU8QdAyZ3oxXaO2X9AbFwfcBDmMp2R?=
 =?iso-8859-1?Q?6au9ptDkNkhlaKsoibZMYDt6VmTyMw8LuqWfIq1ks4r8xpKV1AHxLOJoIJ?=
 =?iso-8859-1?Q?0PNi+8vLoqQInDcsCKS/m+3X4wbPolBv+IGQIi63/aVwTtUExKAFOw988R?=
 =?iso-8859-1?Q?bpQ1l7dgF5Skl7+43q14w/G4KmAzSB1KlGcDcyJC4ZKnpcV8zeukv0EGNX?=
 =?iso-8859-1?Q?3VSVwtoDr4fNf2FWjIK3fIqABRs1zOl7D2NCfnw74txu7YCTwhXYpyc9hw?=
 =?iso-8859-1?Q?tpiZOzwweIqZMuAZpebe1Xvps3TUNkz9XlQwtnkB/AjaLcZrfHWZVgHhO5?=
 =?iso-8859-1?Q?IPTkV6iJU/UDPLEFU28f/61A0+ilq8kt+5lALfszxukHwp8qwi/0oaOi0B?=
 =?iso-8859-1?Q?KRJxQw2J9PaHTAdGUTWDRMHWJfg3mSujBJjtKxcSeXl6QWTL2FjbC4TgXO?=
 =?iso-8859-1?Q?X53KUu8qKJ68SgnaH7C/KmrNv3q6gIwdJRK9aU19CPlNAUkJi0zm+3RXx7?=
 =?iso-8859-1?Q?UBRlwUozcLcOIzl9HFdbbg2F4WEaJWMe+20Bg8jHx+VKgNPDgQgANH/QXg?=
 =?iso-8859-1?Q?Fn17zSo+aeHDj7eKeinaEfALHS6n91FfrvRxlVvb/qQ8EZHusXb/PdSU70?=
 =?iso-8859-1?Q?IjKtItp23COusvfOEnw93lIhL+OJj/6A72g16R+WPco5PTSBqaT+C9gZpj?=
 =?iso-8859-1?Q?eVqgk/1/ZJf4Q2vlX+3s2G32a8Ed?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(35042699022)(36860700013)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 10:31:05.3290
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a086db35-ab39-475c-e4a9-08dd863fc80c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F6.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10025

Good morning Dan,
I am sending this email to add the whole attached group in the CC, also to =
list more details about the implementation of the Dynamic length setting co=
nfiguration.
This takes into account the current code base, also the "scmi_message_valid=
ation" scmi API has been updated, and a new macro has been introduced in th=
e mod_scmi.h "MOD_SCMI_PROTOCOL_DAYNAMIC_PAYLOAD_SIZE".

Thanks, Dan, in advance

________________________________________
From: Dan Carpenter <dan.carpenter@linaro.org>
Sent: Monday, April 28, 2025 10:27 AM
To: Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>
Cc: arm-scmi@vger.kernel.org <arm-scmi@vger.kernel.org>; Girish Pathak <Gir=
ish.Pathak@arm.com>
Subject: [PATCH SCP] module/scmi_pin_control: allow variable length respons=
es

The PINCTRL_LIST_ASSOCIATIONS and PINCTRL_SETTINGS_GET commands can
return variable length responses.  Originally, they were hard coded as
returning only one response.  Change the length to -1 and change
scmi_message_validation() to skip the length checking for lengths when
it's -1.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 module/scmi/src/mod_scmi.c                         | 5 ++++-
 module/scmi_pin_control/src/mod_scmi_pin_control.c | 6 ++----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/module/scmi/src/mod_scmi.c b/module/scmi/src/mod_scmi.c
index dfaf441fbae5..da4ecc09e13b 100644
--- a/module/scmi/src/mod_scmi.c
+++ b/module/scmi/src/mod_scmi.c
@@ -434,8 +434,11 @@ static int scmi_message_validation(
         return (int)SCMI_NOT_FOUND;
     }

-    if (payload_size !=3D payload_size_table[message_id]) {
+    if (payload_size_table[message_id] !=3D -1 &&
+        payload_size !=3D payload_size_table[message_id]) {
         /* Incorrect payload size or message is not supported */
+        FWK_LOG_ERR("invalid message size: message_id=3D%ld payload_size=
=3D%ld vs %ld\n",
+                   message_id, payload_size, payload_size_table[message_id=
]);
         return (int)SCMI_PROTOCOL_ERROR;
     }

diff --git a/module/scmi_pin_control/src/mod_scmi_pin_control.c b/module/sc=
mi_pin_control/src/mod_scmi_pin_control.c
index 058c89f9512f..2a1095dba9b4 100644
--- a/module/scmi_pin_control/src/mod_scmi_pin_control.c
+++ b/module/scmi_pin_control/src/mod_scmi_pin_control.c
@@ -99,12 +99,10 @@ static const size_t payload_size_table[MOD_SCMI_PIN_CON=
TROL_COMMAND_COUNT] =3D {
         (unsigned int)sizeof(struct scmi_protocol_message_attributes_a2p),
     [MOD_SCMI_PIN_CONTROL_ATTRIBUTES] =3D
         (unsigned int)sizeof(struct scmi_pin_control_attributes_a2p),
-    [MOD_SCMI_PIN_CONTROL_LIST_ASSOCIATIONS] =3D
-        (unsigned int)sizeof(struct scmi_pin_control_list_associations_a2p=
),
-    [MOD_SCMI_PIN_CONTROL_SETTINGS_GET] =3D
-        (unsigned int)sizeof(struct scmi_pin_control_settings_get_a2p),
     [MOD_SCMI_PIN_CONTROL_SETTINGS_CONFIGURE] =3D
         (unsigned int)sizeof(struct scmi_pin_control_settings_configure_a2=
p),
+    [MOD_SCMI_PIN_CONTROL_LIST_ASSOCIATIONS] =3D -1,
+    [MOD_SCMI_PIN_CONTROL_SETTINGS_GET] =3D -1,
     [MOD_SCMI_PIN_CONTROL_REQUEST] =3D
         (unsigned int)sizeof(struct scmi_pin_control_request_a2p),
     [MOD_SCMI_PIN_CONTROL_RELEASE] =3D
--
2.47.2
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
