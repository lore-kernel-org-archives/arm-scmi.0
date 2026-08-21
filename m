Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013010.outbound.protection.outlook.com [52.101.72.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050A030E83A;
	Fri, 21 Aug 2026 15:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.10
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787325656; cv=fail; b=Mm+IwdFZ69tVcyoZPvFxyeBxDzpUDkTkBlwMvqO4OzxD82j5aPWPdxcfgXDfWGfUGbDPSifwFwKavxlC4KEzSbMngk6VCNF/KtyjVLni+lhTIicUjnfB660i5Jhb2CdbS9RItFkleEllJNuonY+UzauvwIXM5ZfdM+Ojj709/Ro=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787325656; c=relaxed/simple;
	bh=btQu8hPnUsXWiDIZV4ubxou3PGuxpNrsVmoZx3DHHT8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:Content-Type:
	 MIME-Version; b=DdFqj+dKdCd8AUZ1gur57RLOxSEA9aqE0q3YNwwTot5QRTzJFQsZgpNsDATxn3LpNxv2phKcn095vxyJ2E4QDa8vjdXbEZX9XzHhYHksOhhiQnK9RLtQ0MjvUIYhm8E0ZJhulj/aehc3DdjJYibBQsu/ncY5R2w6vsMp1/crw7U=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=bEVE36JS; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=bEVE36JS; arc=fail smtp.client-ip=52.101.72.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="bEVE36JS";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="bEVE36JS"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=cbpd779j1WYheqdPzT96bTYJLWY4+uZNWGuyPkTsXfZThcq9hBp6SsHQ6okMOOcUyeOy56q83j0c95aLSmIDXasfYAsBsaI4pSPVZQw8lMQc5A0cThDhV2rFMH3O8AshcVJSI1bh45O8MXuwW34PJ2hc44621dy5D5SN6eOVTTSgcDvX7jwWJ+JhGtNv3fxnTVqPGze28UfPKORewZ4U3/q7sB1w2zh1BumAt+GOcqUUjCCkAX0ZDo7Tzc1qUQ2CgwrrsXu5iIiUE0rwjSzgGyadG8RWEWWenG+14S7Ezaaieh0j23O9mVCXuEmG3xBvCU8tFpyP2LRztNDyHEvemw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btQu8hPnUsXWiDIZV4ubxou3PGuxpNrsVmoZx3DHHT8=;
 b=vO+oY3undGpaPpj3WK+wpCQYCHSDpJI/86tPOxV2zCgfyyTYUvV8Lq7MnrukC4JX75qKnzQO+ogela4QyABuutSXbWbFELsJLH5BCNFJx6Ufm7mjtyI/syqAcrlNsqVcaujp0rfk1V7nurfDL8SmSavyhZMEmk1tWcZ8/XSzrycCYpn/CXBNVYAk3Pps4MQ9esuUQladFqbzA8BWJ8QFYkWszv8ZZB7ZHJkBgfrBjDIxMkRxM8c1JZACPEDwS2gPGVhRSdeWNKI4lHvELCfArc/vL1aTQ9Q24q4yx7VdCj62E8gLOrDtBKzbw/v7/S/OL/CIzhS+jWj8EMzVk29Abg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btQu8hPnUsXWiDIZV4ubxou3PGuxpNrsVmoZx3DHHT8=;
 b=bEVE36JSaABNo3zWOU0BRDOgXOnDC6Wzv6k0NgTNh+qLQF6v5aBnI3AEw3oPGFCLgQPwCJfD9A20IMUaJDDBpiI6EMQ3kzt3ZBtFBl9ge8WSiUjZEt7y/VjxbgZxSVlV2d6FEYfg7yibSbaS4Qy25gegjvRt6uoNLh6aoIW61/Y=
Received: from AS9PR06CA0717.eurprd06.prod.outlook.com (2603:10a6:20b:49f::28)
 by DU5PR08MB10577.eurprd08.prod.outlook.com (2603:10a6:10:51a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 15:20:48 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:20b:49f:cafe::81) by AS9PR06CA0717.outlook.office365.com
 (2603:10a6:20b:49f::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Fri,
 21 Aug 2026 15:20:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Fri, 21 Aug 2026 15:20:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bkJ4KNvYOadWVRE3Vkr4rzpMRKVDdbzzxx+CJBaKBrgdIVbVXXCSFTmk2wlqsuLEbeKg5+4TmyPXN52C0wKqdb0z0t7QfLQi5Vgufd+VJI6kJB6epOEYkPSh8eH5nTUwHjt95NXlihAxEbWgmcxeWD0CLPcGfkBrbQ7Knl1Qo4oaHzROyT/cxzmLOf6tuP3GJm3AUZPj313IutM+VxBVhQxGm+K7pqjiMkTpSSlXKazWsF8/pBuY5tBiNt4k2LZ0YdSET+wUnLEAOHsSTie2VK6NgXSgXa8WPLyxVlKXEL+bbopXcqvqjQry0DgLa/FzVHLD38iAD4GIKAJuYV+oeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btQu8hPnUsXWiDIZV4ubxou3PGuxpNrsVmoZx3DHHT8=;
 b=NMfTWe2RTBpfTkgKRNYw8Irw3bT0gGU3Ewgi1FneM95pswPN7E/dvGVDH7ugD2T5Uh1kICZHIgcGjLkBd3qEydP/1nYE8X1x/KyNTLA8Lb6GwAMLDMSXYAA2Sgs1FZYO344wPp6EXv4BCET2oPBQ0jVetW0Lo4gIKjN8u7d4p6R5/zEl0EBZWDcR+vsDJpL0VJc5S3CzxNyxCl0j5pxDTmozoK1qFPd956EscevH2ladHRtRffE4Ef+cx4kPR+bnjeWsi1R7kAEpNQch1BrS9b1Ib0SBV3mUoE6HbvnmfklO5hi3EWyRuj7cFMTOiYFVWBiyWciQwQRUpomxu5BDnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btQu8hPnUsXWiDIZV4ubxou3PGuxpNrsVmoZx3DHHT8=;
 b=bEVE36JSaABNo3zWOU0BRDOgXOnDC6Wzv6k0NgTNh+qLQF6v5aBnI3AEw3oPGFCLgQPwCJfD9A20IMUaJDDBpiI6EMQ3kzt3ZBtFBl9ge8WSiUjZEt7y/VjxbgZxSVlV2d6FEYfg7yibSbaS4Qy25gegjvRt6uoNLh6aoIW61/Y=
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com (2603:10a6:10:3d1::9)
 by PA4PR08MB5920.eurprd08.prod.outlook.com (2603:10a6:102:ea::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 15:20:13 +0000
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90]) by DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90%4]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 15:20:13 +0000
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
Subject: Re: [PATCH v10 08/24] firmware: arm_scmi: Add Telemetry configuration
 operations
Thread-Topic: [PATCH v10 08/24] firmware: arm_scmi: Add Telemetry
 configuration operations
Thread-Index: AQHdMYCQ53izCcvmB0utGrXYvsHqGw==
Date: Fri, 21 Aug 2026 15:20:13 +0000
Message-ID: <10C285F9-16DC-4A6A-A7BD-912E1215749C@contoso.com>
In-Reply-To: <<20260815232604.3730754-9-cristian.marussi@arm.com>>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB8651:EE_|PA4PR08MB5920:EE_|AMS1EPF00000040:EE_|DU5PR08MB10577:EE_
X-MS-Office365-Filtering-Correlation-Id: f300c219-ffac-4ed0-4f59-08deff97c62e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|23010399003|376014|366016|1800799024|18002099003|22082099003|56012099006|38070700021|6133799003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info-Original:
 nI0LihjTIbDwpRT86lsuKvoM3p3JsFIXwzmZSiVsKv5h7VkkldJYn8Iqzo/OiXCXJDUVaolYkZZBV6tzeGln41wsYsjSA+bEq2Rh3yk7VbY7dtyhyfqDcz7Uv55WU4M8mjjDl1I4Aui2GqO0iV+vOCzmgLI/eS/gs7Uy5LBmBXgMz3jSoCjOJrA5ArQihdxWPLpG4shF5Tgavgu8Xrp1l18gENER411ycz/pjBWTqNCv7w5JSX0ZOQOArAbli6+AT78n6fLVPB8/xYuhQoftUSEUQmnpwAcun9kjtpHXxLyeyF9Vk/VnpMfBvKRg8wf214HjcsLnHy4pnVoQANwb3jy13L6LKy3DuUHUR1Hf5vhT99lPiyaCc0bMQVrTVSoruVhOUuOfr92yqgs9s55dTn//Q2Ej+kqv/aByU1Zkv3Q5tUZxskm4NoKI1WcI2HvmqTDq48HQkGtc7rUt3v9Xr0LlUhMftVQUR8rFoPgksTy7mry93EvC1gRVy4wuvLud78dWAikbKEMeWVJscnKplvHK6MZUcxSAU8chCjJ1MWLGZ394ORrFRUnF36ZPPzJ2CJMuP3NA/ezkuuObx8eyxeHQF6623HGtB00InzzkozovoSqmKIvUgY3+uj6wz8EuPaoMVqP6l9rjmTOefOYSHBh3KmVSWhNRoaDS8sGFj6tx/de/cqsbLCwyTyMmp43bYpaBOLZy6bJCnoiRuJXkOmJ28ppbMO/pKw7vPc+XzYU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB8651.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099006)(38070700021)(6133799003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <445A1EE99223E24C9EAA80C82B7B04E0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 BARlWoY6lYbcehgD2wxKA83qAXyoycdot7zMgaN0g53SNjGgOXD4Vz3iXbYPDU53VNx/MR4kxCiaHJWaCNyeWVGXLTswb6SS9paQ/8w+xSqjbM8UImEB+Uqh8VohnkWIslHt6u0re1ulruQ18QLV21FAEGNew+tUNAeyojbn4wZp9tciAW04dpoBF81aDY8rZXGID2u9EcucqcK3GGGsxxtvwtAZJh4WiBBZ+JKk8ChgJto5Z/yR9aUfbdrKtJuPMGOKvGLNroFBvr4NvFzKio9oVSARqETC07WehzctyH30K1Wg/I5dRXdsUIdzkK8zFxoSZa2Izy/B9kaXgNOkcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5920
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	25194485-1812-4d7b-5c53-08deff97b2c5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|35042699022|1800799024|82310400026|23010399003|14060799003|56012099006|10067099003|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	sbb8iqn7E6vc8QipGi+tu1IedEYCYK6UT7hWNyEyNdLZJHbpZMc+pgdHLg+rSZ8OkU1SC2/Sr0DWS1NpZHRPIgzoYrBXuVF0ogZM4wbAcZvHoN1O0YnqDnPE8+GJW71uup/t3yhMyUxBAz18Zw29fO4/iW9x7eu1M2ubh46CqiMWc8dww0We0Y37PaCG+wKFvUqQFcWwOMjfZrVLubw/Vo8vl9jtidnHB7FfR+wm/jyndQInmQnO+jtCfZWlLoFHRMeSjxUrozDmPZlFBe08+o0fswalAeMhaz9+jO8cv1ERbpb23W5mXzkttwKiYAk6pxzq2HGqap3FEJkApEErSIm/v0DHErRIgGiQtWBSkGAur+fRawYezLHZ6o5DVsRW4J2bTWDS7vtiTJeuaJTEIfZY0UGbtVjSLyMlRerN36+SBPQsiOajK/yq4gRPEEIWdHglZfj/cVGfPJPAeGfFe1Khd8+qqv2Ikju87pXQCBL8c1+z4UEB8Wa6myxBDa1Si56E704hPV+XeqdcprxF7zPNfWVvvtrYnLTQeyImJ9wRzbcRhgHL0dMQ1XcoJx5JtMbVykNkHJ77WMQyQ5FSLEfp3MVuCVBpaxegEdvkWUtrIkS5k+QNEyobdpvZI1ejctcG/Va9j2Fx9OqS6zvAZ6SLgGfRilfTTpN1oWThPy7ZWa6s+PE829apmdVzkD6AF41HDZJBg1ijyDQ0TJHVgg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(35042699022)(1800799024)(82310400026)(23010399003)(14060799003)(56012099006)(10067099003)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eys1VieLRjer033iciZtOmPAkVAHYIFDjjwEiRcrmKrMtzwPD83xCBhyEa2aEIdN78PfQuQjauzi7ZkbxPxDhQzFHbYlJ541abXymN+hGfFlwYLv0FvWQ2vKTXOU71qoqwlks7JaPAqZtWtpk8SCER1gds4FrS1Mn1gqTar17cUES7i4mf8CZDT0Cnoo5ad6oTgw7RaOqtVCG6Ftz1D8F5kAC+YHkbXSk1MvP8kMmhOgKmDc8s0jHo6/l7OBdZlvkzo8Qy4DCp1fYLDLwBNz9uRDJo1wX/dUD+NRJQZkr93/9HLVWTa8BO4KC+mdQEKniSL2TiB3XLdxSOx4SZdl/YPb6O1U82hR7mnPE+JF25tG38uVglIPjhI0Etj2fc5vSsDmZUftkLRdzTq7HUHOKd4mEWtO+OgTtbue4SV5r+Qccmw8+rLxFufptvR3K+u+
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 15:20:46.2356
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f300c219-ffac-4ed0-4f59-08deff97c62e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10577

SGkgQ3Jpc3RpYW4sDQoNClRoZSBncm91cC12ZXJzdXMtaW5zdGFuY2UgY2FjaGVkLXN0YXRlIGhh
bmRsaW5nIGlzIGltcHJvdmVkIGluIFYxMCwgYnV0IG9uZQ0KcGFydCBvZiB0aGUgb3JpZ2luYWwg
aXNzdWUgcmVtYWlucy4NCg0KRm9yIGEgZ3JvdXAgb3BlcmF0aW9uLCBjdXJyZW50X3N0YXRlIGFu
ZCBjdXJyZW50X21vZGUgbm93IHJlZmVyIHRvIHRoZQ0KZ3JvdXAsIGJ1dCBjb2xsZWN0aW9uX2Nv
bmZpZ3VyZSgpIHN0aWxsIGFzc2lnbnM6DQoNCiAgICAgICAgdGktPmluZm8ubm90aWZfZW5hYmxl
ZCA9DQogICAgICAgICAgICAgICAgKmN1cnJlbnRfbW9kZSA9PSBTQ01JX1RMTV9OT1RJRklDQVRJ
T047DQoNCkEgZ3JvdXAgb3BlcmF0aW9uIGNhbiB0aGVyZWZvcmUgb3ZlcndyaXRlIHRoZSBpbnN0
YW5jZS13aWRlIG5vdGlmaWNhdGlvbg0Kc3RhdGUuIEZvciBleGFtcGxlLCBjb25maWd1cmluZyBv
bmUgZ3JvdXAgZm9yIG9uLWRlbWFuZCBjb2xsZWN0aW9uIGNhbiBjbGVhcg0KdGhlIGdsb2JhbCBm
bGFnIHdoaWxlIGFub3RoZXIgZ3JvdXAgaXMgc3RpbGwgdXNpbmcgbm90aWZpY2F0aW9ucy4NCg0K
UGxlYXNlIGVpdGhlciBtYWludGFpbiBub3RpZmljYXRpb24gc3RhdGUgcGVyIGdyb3VwIG9yIGRl
cml2ZSB0aGUNCmluc3RhbmNlLXdpZGUgc3RhdGUgZnJvbSBhbGwgY29uZmlndXJlZCBncm91cHMu
DQoNClRoZSBTSE1USSBvZmZzZXQgdmFsaWRhdGlvbiBpcyBhbHNvIHN0aWxsIGluY29tcGxldGUu
IFRoZSBjaGVja2VkIGFkZGl0aW9uDQppbiBzY21pX3RlbGVtZXRyeV9kZV9wYXlsZF9zYWZlX2Nh
bGMoKSB2ZXJpZmllcyB0aGUgbGluZSBhZ2FpbnN0DQpzaG10aS0+aW5mby5sZW4sIGJ1dCBhIERF
IGxpbmUgbXVzdCBlbmQgYmVmb3JlIHRoZSBURENGIGVwaWxvZ3VlLCBub3QgbWVyZWx5DQpiZWZv
cmUgdGhlIGVuZCBvZiB0aGUgYWxsb2NhdGlvbi4NCg0KVGhlIHJldHVybmVkIGJsb2NrLXRpbWVz
dGFtcCBvZmZzZXQgaXMgY2hlY2tlZCB0aHJvdWdoDQpzY21pX3RlbGVtZXRyeV9zaG10aV9vdmVy
ZmxvdygpLCB3aGljaCB1c2VzIHRoZSBzYW1lIGVuZC1vZi1hbGxvY2F0aW9uDQpib3VuZGFyeS4g
UGxlYXNlIHZhbGlkYXRlIGJvdGggY29tcGxldGUgbGluZXMgYWdhaW5zdDoNCg0KICAgICAgICBz
aG10aS0+aW5mby5sZW4gLSBURENGX0VQTEdfU1oNCg0KdXNpbmcgY2hlY2tlZCBhcml0aG1ldGlj
Lg0KDQpUaGFua3MsDQpGYXnDp2FsDQoNCg0K
