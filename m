Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011035.outbound.protection.outlook.com [52.101.65.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3542E889C;
	Mon,  3 Aug 2026 22:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.35
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785797744; cv=fail; b=cbGH8HSoc/o1hPWQJk8vd77F5DPda7ZU9jTTkODg4bifQqYf6YVgD3/0k/UHiNwV+BCwQS8YvkgW7vKl+4qvP3s8fjGkUM0gcqrx/Fc6fMPj3vJaol6xaHjAfsRvlaHO0Nl90IbhJ4tO/ISIMgR68B7VAT0ihIHvEJyGa6YYbm4=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785797744; c=relaxed/simple;
	bh=D+jPNX6U9xl5gckkiCpQOyrVkscYL3WhO4c6SPlxm1g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:Content-Type:
	 MIME-Version; b=m84IWW4ppbYdCu9uMID6QUs/tExdYCpAvAxt0cJwjzo9GoegCU6PRnSNW2r9ds50yo7DeraWBXp3Ese55rQ0nwQIEwo+iYL+emD9GMmjJYO9MmIHieyg3/AFhAe0Kb6db+5EjeJCVBPQhzT6NzbWB6a6tpjTHnN9RawVs4+ryyw=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nYLg6BeR; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nYLg6BeR; arc=fail smtp.client-ip=52.101.65.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nYLg6BeR";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nYLg6BeR"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bE/8TtRUbGVOzT7AVUqXUhkNYzki0Z7G3gDhAqEv8TOdqwHy4cBzX9RiBzaHj+wAnmMrcIl8YnWWYvWU7JKNc6ouL/3+5VgyGTjACvS9owmxFD0DvwRpdhnKDZ1QOxuELPbf6zsRN3EQC1bb7KtHdErzORiCSJyc+Uk4DL4xR000bNSUpexZoNQYN7ir12C3xbFfInU+UmuUM+0CBBYCmwHQTUXPdIQkh8ie8k009nsz/jXkFZCapKEo6weuTXhcYl3Tf2bnWl3otOl82DKGkxAiV596SiuTT8gef6jB/7fjJZajNNcx1B4NWzabPhqqYy+vbSahgoJGhjUafS3y/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+jPNX6U9xl5gckkiCpQOyrVkscYL3WhO4c6SPlxm1g=;
 b=kolnJDRyUqEM9LSKwM/lT3aOwJnwX0rf4dyq7/iNiNz1foKN839EAUcsxYOC6BBKVFbG/f3lHu5bY+klNLA+4ChD/LBAugra14wePjLTt9XRAEow5l47+Amg/N5ckTn7ivu43W5qULg9W7QffpUE69NAo1PWNWtlH5/jWsQabJitdht09iespI9xEFheO8ZXz/y41xJBb5SzCg9NfwPHcAzzfVgoT3083OoE7F7i0VPhVpZ12TvEODwR6fY++SPaHs70uwBz1gBOMslbx/Sg61kb66c2YbbFXx2JoZIccxkiFbgt8MIxsXD1rK+y8zmW49grvWH292+eI2jyzqsmaA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+jPNX6U9xl5gckkiCpQOyrVkscYL3WhO4c6SPlxm1g=;
 b=nYLg6BeR4O52dU6b26Ez1pyGVv+ekPf5SetdT4EpLfoRC263cbptJb79OsDCOg+w1kvAzB49NJKEPeos0eu5Ys9rNnzEtF97Hegu13DGTQGrMrTCjx+f/xgfMr+W9QXZgUmI6BQMKpRDJ+eYqVAwdNBaWdu1fDOHgFm8ADXI86U=
Received: from AS4P191CA0025.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d9::15)
 by GV1PR08MB8353.eurprd08.prod.outlook.com (2603:10a6:150:a3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 22:55:37 +0000
Received: from AMS0EPF0000019C.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d9:cafe::6b) by AS4P191CA0025.outlook.office365.com
 (2603:10a6:20b:5d9::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Mon, 3
 Aug 2026 22:55:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019C.mail.protection.outlook.com (10.167.16.248) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Mon, 3 Aug 2026 22:55:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AvOlEPqGfN8PBlSGmMSxztDotVgn/PnHln23OdDAoCqcmQLmo/awydIkJS2HXYLiEi0hcu30wiWgnSJQoeRsiS9OpaWjhqYRLmdLQwkgEcuOvY0GOJ8a/4zex9wJLwTLK2m5iVgb31ttKZSOWN+abY8spcJ/6JM6iCsDdfcePneli29FjGNvWS8dQsoPCacAqhOfe+D5oIl37Fl6v5EblHuL/BeqjZ3qPeff4cugyT1dkg8x8dXLbI4mSu5Vgxv/98nNXGQMBxf0vuBVa7dE3oPA/hSS2Q8BfIQSfKtbc5TRoK1/mrK8hiAbMWDCcZFSKmh1sEfWMsjEdswB7w42xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+jPNX6U9xl5gckkiCpQOyrVkscYL3WhO4c6SPlxm1g=;
 b=MO6TEFT5fJkJAl3VkTzyNGDvocvaAas7rAchV7CUhTtcIDRuvQwr1hc5b3Vqc76EWUwrd/XVXC2LbqAAzxKgd1vr/IMwQcES9wCpEzhSbrDm34n3FBaLThzr1nlsLUAt0q6UKVbO5XqbCCGf3ZX4lvbveUgO0IJmkVDYX5yN7cYP2v+E/fHXaI6+Klr5DW1+36Ww7ouPwQPYV2Gv1NCxan5zvxjhGI+u5KgRsZYrgODXkL9cVi7mydQnUoSjjMrVtEFURGWk8oOLW8OC6zXqXpTmvXznESN3yHd5Z9Udf7SbQDkGWS5K+Law5ej255zkmNli3bN1sFGUKoPabBma0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+jPNX6U9xl5gckkiCpQOyrVkscYL3WhO4c6SPlxm1g=;
 b=nYLg6BeR4O52dU6b26Ez1pyGVv+ekPf5SetdT4EpLfoRC263cbptJb79OsDCOg+w1kvAzB49NJKEPeos0eu5Ys9rNnzEtF97Hegu13DGTQGrMrTCjx+f/xgfMr+W9QXZgUmI6BQMKpRDJ+eYqVAwdNBaWdu1fDOHgFm8ADXI86U=
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com (2603:10a6:10:3d1::9)
 by AS4PR08MB7503.eurprd08.prod.outlook.com (2603:10a6:20b:4e7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 22:55:03 +0000
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90]) by DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 22:55:02 +0000
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
Subject: Re: [PATCH v7 11/23] firmware: arm_scmi: Add Telemetry notification
 support
Thread-Topic: [PATCH v7 11/23] firmware: arm_scmi: Add Telemetry notification
 support
Thread-Index: AQHdI5seMHKRqNhNzEqzWdXbQH1yJw==
Date: Mon, 3 Aug 2026 22:55:02 +0000
Message-ID: <53688831-E76D-48AB-99E7-4CE7C456620B@contoso.com>
In-Reply-To: <<20260802145618.1952804-12-cristian.marussi@arm.com>>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB8651:EE_|AS4PR08MB7503:EE_|AMS0EPF0000019C:EE_|GV1PR08MB8353:EE_
X-MS-Office365-Filtering-Correlation-Id: 501b6483-b801-4df6-cfdb-08def1b254c7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|38070700021|18002099003|22082099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info-Original:
 fXR6FUQiINKplhjnBuYOhyWYB08XNz+eBSX1DQZuOi7oSG/8q9KVve3Tb96kIjwKX9IOXNJDP7//zmZpC5DS11cos7v7/5X2FPFsYTsocioD7K8Y+uOK/TNRDL/OyctyRugQ7/qTZ4Ng93d2Lkn4AYJPRuIcfFItssk2QMZlcqEq2YHP1WG0fbgQHDf+vhkeo0lHZJGQzegDQVxbABEaXTxoJdhVsNI6oq6tDdanZEfd/+9iWSyYTFccHg7Yr2orXfrLQH0tfcbKSaGdQx2IYvdW+tWtuNLCUv+puRa/vuKIlaskV91TI7fquUneNADf4oGfHMTBFnGHYmpca3yjieIb8N4BNp28A1DibLhYxyfrcu6wTyMaxgPT5GZHNJwJ4X9/C8XO7nfhbIEur90F19nacNrtCHjR/XzAnRrBA3PjbYzE5naQQQkDcRJEIazyvlqOYL/6CcQpYPLn1mQ7F1QWFHLAhoyTA65bLuognCTprQkjdcuwkPnKo2DDbyB1daCwThr/hqprSUL6NR6tfUGVdvz+nAnjeyjwKC3Le7RFR10jMvawOUmNK4oMwQQAN4fFHMPGj3F0Ypu0ycbe7nk2NYelFh+r7OIDjEIFHYctrgSvR58dEegIr4T2kmTnrcPLXSa0vnQfqfgbDc4FE0JV6wFBOOq/idudV+Ow3+mx1IIFgPxNuy220ENIGesu/zjKyQF5fjcbhbzyCubE7e/Ef5JRwcsOmtBbcSmzflo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB8651.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(38070700021)(18002099003)(22082099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4CE91D89E1C20D47B80AB41DC1AAF698@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 sbmRoOt6wEOfNrRu6ThTrmlgKLmq7jiOFbH+0swlck1WUrSDGO8tYeteLldtGFkLUTrmQOmoNUogXEU+D8FXP1d42DwumqnFD9BaAwabkzxorsupFVhmBLAn2PUZ6BtjGKESdp6+deyvOT+Yv+TsN4ceyqglxfjq13QcEWtqejeSH9SLPxO51JKpCOMqTDj82yb2TQwzSCWFc2GitFD0lYOVS7BL69rhwoQZWh9zT25mEA/vsfAR/b3cAwVBLSd77uXhI+B4aGUzc0BUOzv3Ga4s8jmMOnFNWw69U20LYs6bplZOXJzxdNX2eyprFUPNsjXbUuPykXhAh7/YmZcM1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7503
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019C.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d014c831-afbc-4ca4-d502-08def1b240f1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700016|14060799003|23010399003|82310400026|376014|1800799024|7416014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Ae+g5f1qlu4AXUAmc3EZlsKBKba1bCaqYPIK9/G4XdhCvZL8/ys82O6uZBEbJItrrKIg5HaFv8OqV8MXRqWoP+EgzQbddHTFPXzao8cSnhh3N2Z2tpjWQ2j1+1VfBsBXIBFYqu4MQ89A3fEeasqNgiqBAo1fgn0+D7v3HrVcBMHhjufWdsbS3NjwKXIKic3LFGoV/5sbi/hVYBXriiljSDTE72c55eMi9Xdu6yPcxtaJnRSNI46nn+zDVzXvnFJJ7jw6DSkOaEcGGkiE7RjdH99tRvqpfmMRUJvBCpU9TA17eS5aGefBCcrLro5z+xwUI46JXH0DeoPLaI2DK/O7Rny4hX/ss8k9i7Y09+BAUMHvc3Ub/iIbOMWR9cesKOLe0l432iXgtRDU7ahAcZMCGF5q7Q4Logq03hS5XTYWP7wAtVRdiH2TM0RCgQkpfRFTVDoLzgrjvELgezDjFpZ46E/1PKDnvIyqNwlegnMxNX2c6eRQKUdwESupPEwjNmFKJs5OgNby/FoiDYmNm3rPxEIdBcIQCG8IizGUpviyZatzlOFfpkyIgNhsfdGRr0Y8W+A2viIO1Cfwzkw4JE9HCZmLIqMG7yXdfNAhn0wbb7Olt+xu5530ot2wrxZtTe3QI5AP29fDaD17Ne/HrzVCu74LAHCtAbTWB31oiCU8l6vIe0K6G5faI9k9U7VbrVmNLVDOotMEY5PRt9WyedTZ4A==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700016)(14060799003)(23010399003)(82310400026)(376014)(1800799024)(7416014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PcUYwfQR5+fKEng3s3BuL6lRHCKSNTRL/LIQwm38uL9UBKNDLBgx4IpGoEylUAW25CpLrhP/2NX4WO2aPGAZ+CoWqRCHj2KmiqDrn3qO1i1VFtG3YtQUtCYoVjF8eh/eCn3r4zTGo2yhICjsAiovx6YSVSdgwQnqkWALlN2RAoRz1DlVC6fZpRp5a+PuLc2qtjjLxDPtPNh4vHiatVZcJQW5fs16jGxEaiS9htvLUbPrq4DfXkyoyhl7xLDNKoVmqlxUQwR2/MIIcyxbyRW9/Pldud34NVnw5UEobcQS5oTgOUabCd+HOUN3Kk8MDut65gCUgeSyQcQ8Cqn5AdIXMipZYlnQEc/0/RCZOmfdwmH7P9fYKrZxe1vOwT1efapdMwC9z26mEt1k0nko/hFjwtAaXUCv5GRZ9sXE7rgjHZyf3U7LHIQ84mUwslbC3uln
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 22:55:36.1057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 501b6483-b801-4df6-cfdb-08def1b254c7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8353

SGkgQ3Jpc3RpYW4sDQoNCkEgY291cGxlIG9mIG5vdGlmaWNhdGlvbiBwYXlsb2FkIHNpemluZyBp
c3N1ZXMgaW5saW5lLg0KDQo+IAkvKiBBdCBsZWFzdCBzaXplZCBhcyBhbiBlbXB0eSBub3RpZmlj
YXRpb24gKi8NCj4gCWlmIChwYXlsZF9zeiA8IHNpemVvZigqcCkpDQo+IAkJcmV0dXJuIE5VTEw7
DQo+DQo+IAlyLT50aW1lc3RhbXAgPSB0aW1lc3RhbXA7DQo+IAlyLT5hZ2VudF9pZCA9IGxlMzJf
dG9fY3B1KHAtPmFnZW50X2lkKTsNCj4gCXItPnN0YXR1cyA9IGxlMzJfdG9fY3B1KHAtPnN0YXR1
cyk7DQo+IAlyLT5udW1fZHdvcmRzID0gbGUzMl90b19jcHUocC0+bnVtX2R3b3Jkcyk7DQo+DQo+
IAlpZiAoci0+bnVtX2R3b3JkcyAqIHNpemVvZihyLT5kd29yZHNbMF0pID4gcGF5bGRfc3opDQo+
IAkJcmV0dXJuIE5VTEw7DQoNCnBheWxkX3N6IGluY2x1ZGVzIHRoZSBmaXhlZCB3aXJlIGhlYWRl
ciBjb250YWluaW5nIGFnZW50X2lkLCBzdGF0dXMgYW5kDQpudW1fZHdvcmRzLiBUaGUgYXJyYXkg
bGVuZ3RoIGlzIGNvbXBhcmVkIGFnYWluc3QgdGhhdCBmdWxsIHNpemUgaW5zdGVhZCBvZg0KdGhl
IGJ5dGVzIHJlbWFpbmluZyBhZnRlciBzaXplb2YoKnApLg0KDQpUaGlzIGNhbiBhY2NlcHQgbnVt
X2R3b3JkcyB2YWx1ZXMgd2hvc2UgYXJyYXkgZXh0ZW5kcyBiZXlvbmQgdGhlIHJlY2VpdmVkDQpw
YXlsb2FkLiBUaGUgbXVsdGlwbGljYXRpb24gY2FuIGFsc28gd3JhcCBiZWZvcmUgdGhlIGNvbXBh
cmlzb24uDQoNClBsZWFzZSB2YWxpZGF0ZSBudW1fZHdvcmRzIHVzaW5nIGRpdmlzaW9uIGFmdGVy
IGFjY291bnRpbmcgZm9yIHRoZSBmaXhlZA0KaGVhZGVyLCBmb3IgZXhhbXBsZSBhZ2FpbnN0Og0K
DQoJKHBheWxkX3N6IC0gc2l6ZW9mKCpwKSkgLyBzaXplb2YocC0+YXJyYXlbMF0pDQoNCmFmdGVy
IGZpcnN0IGNoZWNraW5nIHBheWxkX3N6ID49IHNpemVvZigqcCkuDQoNCj4gc3RhdGljIGNvbnN0
IHN0cnVjdCBzY21pX2V2ZW50IHRsbV9ldmVudHNbXSA9IHsNCj4gCXsNCj4gCQkuaWQgPSBTQ01J
X0VWRU5UX1RFTEVNRVRSWV9VUERBVEUsDQo+IAkJLm1heF9wYXlsZF9zeiA9IDAsDQo+IAkJLm1h
eF9yZXBvcnRfc3ogPSAwLA0KPiAJfSwNCj4gfTsNCg0KV2l0aCBtYXhfcmVwb3J0X3N6IHNldCB0
byB6ZXJvLCB0aGUgZ2VuZXJpYyBub3RpZmljYXRpb24gY29kZSBhbGxvY2F0ZXMNCm1heF9tc2df
c3ogYnl0ZXMgZm9yIHRoZSBkZWNvZGVkIHJlcG9ydC4NCg0KVGhlIGRlY29kZWQgc2NtaV90ZWxl
bWV0cnlfdXBkYXRlX3JlcG9ydCBoYXMgYSBsYXJnZXIgZml4ZWQgaGVhZGVyIHRoYW4NCnRoZSB3
aXJlIHBheWxvYWQgYmVjYXVzZSBpdCBhbHNvIGluY2x1ZGVzIGt0aW1lX3QuIENvbnNlcXVlbnRs
eSwgYQ0KbWF4aW11bS1zaXplZCB2YWxpZCB3aXJlIHBheWxvYWQgcmVxdWlyZXMgbW9yZSB0aGFu
IG1heF9tc2dfc3ogYnl0ZXMgYWZ0ZXINCmNvbnZlcnNpb24gYW5kIGNhbiBvdmVyZmxvdyB0aGUg
cmVwb3J0IGJ1ZmZlci4NCg0KUGxlYXNlIHByb3ZpZGUgb3IgY2FsY3VsYXRlIGVub3VnaCBzcGFj
ZSBmb3IgdGhlIGRlY29kZWQgcmVwb3J0IGhlYWRlcg0KcGx1cyB0aGUgbWF4aW11bSBkd29yZCBh
cnJheSwgb3IgY29uc3RyYWluIHRoZSBudW1iZXIgb2YgY29waWVkIGR3b3JkcyB0bw0KdGhlIGFj
dHVhbCByZXBvcnQtYnVmZmVyIGNhcGFjaXR5Lg0KDQpUaGFua3MsDQpGYXnDp2FsDQoNCg0K
