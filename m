Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011001.outbound.protection.outlook.com [52.101.70.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47D3437471;
	Fri, 21 Aug 2026 15:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.1
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787325708; cv=fail; b=p/x0XF5dc/pnabuILBWb39M7QpwEYvK/hX/wTag5Z35wH288/x/JttCcf70QHayU7axsrQ6pp5QA3x9qaiDVYNMDFjaBh81tQE9BQfGcQI6AMo2lKbjRsc1EewPC3SPMBIFrbHY10D2eWhPErGx2oB9I6zEgFdcaZxSbjcCwaIE=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787325708; c=relaxed/simple;
	bh=m0AeqoJjW06CH3YbRg1PrnDgwGHrN9ESABM6jtD/Kx8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:Content-Type:
	 MIME-Version; b=nOSiEu/DVzaA0i0furgcp5Bck/QrFU4uDfK2nsnyhRnAzMMrZSrs0v5xcE4JPqd57EQGcNRdFP0xBXkHeJlu8Mr5pH5MU0hTpT9wbpy9b3JUes2amug+jZQS/3sS3LbdZ2zIbIo+dihZJ5YoNUjjGTH3WvCnbIo9NNGSSJjWOts=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ppSNAxuF; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ppSNAxuF; arc=fail smtp.client-ip=52.101.70.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ppSNAxuF";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ppSNAxuF"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Uk8Pk/8qrE6F5LtnsBfHYNDOjA/v+8K7r9BzIHbfr1/wgmNaKlnBQpJlqZNIs9vmoxmIQJ9p6ieJEE05Qlt7Qw9wE8UZ32e9OcyWhlWaoSKNBHFjUNWyLD/Go2zaCeGdAjr09gVNdsuZRr7yvut+vnNHuYeedvVtisQtseYnM/zk+3K/oO/NfO6FSJtLuXcliMYKXUV+RqJ4zmOM2e0JI7GOEnBVS7rQubCB+5dwUXLmKUxt452mqShxeKdi6wYPKEOkYhPdwe0iibgdP7dUTS6wfLtNVskvr/018m5CyQ9yW2X5nX9NHxdFK/0sgRUH9DxH8wX3y47ixnrLQN3SCA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0AeqoJjW06CH3YbRg1PrnDgwGHrN9ESABM6jtD/Kx8=;
 b=bqRS67j2l5pYpl2YuKoz8jBI4cdjkmjjEY53iqwt+j91dHy1drGx7hkfY+mRTEcdCyb0xipjPuy6XYhAhUSVp9Iw9pjeWtdJeS2S2pQrtIk94f5wGACCm2K5JYaw8C6q/2BC6FLWcp+mvkKmLaFzkTNmBlogyK9A+/r0j2XNJFKevIt45lGapr0ZQ4TasMImcROmRkTv7a2N8wtle38ELLUHYwsTzDtSlPQ+ITQ0XnU4Pw3ip2Zwc7TUZiDdd2TPOu1SODjJmIbG5OzRBfBn5E9np+Bb3K6k0PbKNFhn6kBiJvdMnwrmO4g5zdKWx/nBj1Ppltiu50+XNmu4+PKPHQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0AeqoJjW06CH3YbRg1PrnDgwGHrN9ESABM6jtD/Kx8=;
 b=ppSNAxuFD4ip3T/h1QKTsrmCQDKqZTlaRmpHnUtWqxyCxFKWJJBWKRa2w9EBRTlSAlihLxL5aI9+WyLsPPeP3OZxSbFC9EPfkQi75MBEIzqOZZN2GVgNseI9/oSyOlZTa0E7ChGkINW/Bw8ouvyCMVNYj7sWgeG+IMuufkixgO0=
Received: from AM8P191CA0022.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::27)
 by GV2PR08MB11607.eurprd08.prod.outlook.com (2603:10a6:150:2d1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 15:21:41 +0000
Received: from AM1PEPF000252DA.eurprd07.prod.outlook.com
 (2603:10a6:20b:21a:cafe::52) by AM8P191CA0022.outlook.office365.com
 (2603:10a6:20b:21a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Fri,
 21 Aug 2026 15:21:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252DA.mail.protection.outlook.com (10.167.16.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Fri, 21 Aug 2026 15:21:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=avoN/OwsxnyhWL+JBphzr6Gy4jxBaMxavj6Y8jYDUuP1l3mxV81oUx7f9HffAinCVubgVCUlqXte24aMZ/aYNaol/geEMTgNE7oRN3m6383GbOnqsxaupmG8cGiXAOoBhPDgc6ukQIa3uYLdyQQNLmdfclSxSLcTKd20oxuUjem52bQ3mfLjORLDYz1bs61mYfsh2iQ2/OTJTDYKexPMhZ/ovMxV2v4I69cJ/FAIrs5Y3XStIYJJ5taVnV0rZKi0CQgjOZvW9wVPiaZzsB+im9q9q4prZBl1PUYeQqlcRmLHF026j/5Hy0VzsT11ujJOVDDonM/M2J8/obu4+yJtGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0AeqoJjW06CH3YbRg1PrnDgwGHrN9ESABM6jtD/Kx8=;
 b=G4HdX3sWkVe3qmOv2hJXGg4+3hfKBBZYcOHPDiGW+VrlByvyuLegFp2M4a18e/PRGVBpPoAGfl1NXccv5pXtYLJvhmJcBtul80ubIzMLwq9YcGfRMjiIuEAnVHuFwmLPcoF+nzpzzdBhDsufkWkMIvylkudwyOpZNvNHYJiajpy4VUor/iyINd6Hn/LyxDr7qbc4L+k49pgYobQ+qL7M/GClACG0VFkYmGi9erFUQLX7jdasQb3a71U2LRUzjqsKbMYZ6q20eSPrQK/Jl3mZa4WHEjhhwi0fO6BFUFa8J/hhUVBoEwYrWd2btcFi3Fmopnizj45YzT0R0X3kAO0F+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0AeqoJjW06CH3YbRg1PrnDgwGHrN9ESABM6jtD/Kx8=;
 b=ppSNAxuFD4ip3T/h1QKTsrmCQDKqZTlaRmpHnUtWqxyCxFKWJJBWKRa2w9EBRTlSAlihLxL5aI9+WyLsPPeP3OZxSbFC9EPfkQi75MBEIzqOZZN2GVgNseI9/oSyOlZTa0E7ChGkINW/Bw8ouvyCMVNYj7sWgeG+IMuufkixgO0=
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com (2603:10a6:10:3d1::9)
 by PA4PR08MB5920.eurprd08.prod.outlook.com (2603:10a6:102:ea::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 15:21:09 +0000
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90]) by DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90%4]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 15:21:09 +0000
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
Subject: Re: [PATCH v10 12/24] firmware: arm_scmi: Add support for boot-on
 Telemetry
Thread-Topic: [PATCH v10 12/24] firmware: arm_scmi: Add support for boot-on
 Telemetry
Thread-Index: AQHdMYCx2vffyS4zfEqsYBbWsY32LA==
Date: Fri, 21 Aug 2026 15:21:08 +0000
Message-ID: <220CE9BC-B06E-49B3-B24C-102647075F5F@contoso.com>
In-Reply-To: <<20260815232604.3730754-13-cristian.marussi@arm.com>>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB8651:EE_|PA4PR08MB5920:EE_|AM1PEPF000252DA:EE_|GV2PR08MB11607:EE_
X-MS-Office365-Filtering-Correlation-Id: 633ce5f8-57ee-440e-d61b-08deff97e700
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|23010399003|376014|366016|1800799024|18002099003|22082099003|56012099006|38070700021|6133799003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info-Original:
 gU+BlWo0UBLIBpX5f854tusCXpAZaqOeETY+QQvzgnTCkKF0c0Ancb+5aopCTr9YOC/24CbzRglApGmkjC1t2ICzWQ1WdWMGBIzfJze3wM6UqzRni1YLrohCgxxmnyPnMWIk/MTym2WcnCtIb8ysaZQaW957Uly3SjIZV4y5Acg2AzK7k6k8Z9/PX2osiAGTCmn/JoQ8l2w+CopLEGgIOzdD7jOk6Vvkm37YCh7fT1U3qtFQD55QVKjihsg2gaGyHgAXQ/dgSKMIKOTOK1M+1uekwTKZo7U0PQbWa5QHGTDVWTewIvK6GGD7WidnNbNgq0qdfi4OXw8R7B3Is78KM10opRro5OLnZqGNoirvXf513jLBT/AQObCfDeNCTPm87RMd0Xbze91jwOTGBkTE/5fCG/sWXIHFx0tggVShASHOOCc87mPNnSkxJuJT7NznB1uyOTWYT1cp0CFUrq0hIMKb2/76gB2Wb4Q6dc3uHk+/nk9sCSF/HVaknjuqbu2T8YNZuYQRCenEmY96Bkpvq+cBo1njYDpsg0vJMZuxqzSq7+y8QDyYsdy7Fqetm2HfxMDAg2j7YhJQV/+xY+uFtuH4EQCs1LyUySmnKLtiqn0nFzJS1oBfaC2lbMVCxFaAKNkcel/YZRkeXAqf9zfJHRANQsZ7yPfXlWjmYSCp7ozrlGns69QVYjABuThBT+yyiVF0mWl1GIajZ1htmAbhhP6Q+fs3J66S/Yt8BCYgc2A=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB8651.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099006)(38070700021)(6133799003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CADE9D582959584EB589052B00DFB8BC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 gd85CyoBEd0ZVtTnLpEXV3TyE1GBnhGWTpFOtljX17eFfQU/q2bjfoHehx6zS39UEEfd7mJ9kEKJywrzMglajaklLrwYtbV3n07aHfpUS3H0O1vpNAp08LlCxQhWRsY2T6D+R4TM7W79zEk/ULWnmTZY+5YHOSK6NO4/bt/NREWuqfTI7wtaHglTXtctJM8gWgBVVz+9ihP78rebCMPZLV/ERIxEwVrabk6RwqZa6laZ2f8cbGSdYrnzYtn8bhlZ3Od0ouzm8aI+rVo+AkJUaWQT6v6ZH9449GHxjTwirD1OVMby4fQc68b/0xpBHKGBTbyvL1Y9vYI5us1JmJaDbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5920
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b35191ff-2afa-4358-c13b-08deff97d3b7
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|23010399003|1800799024|36860700016|376014|7416014|82310400026|35042699022|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	y3WHNygmvIvMKWRfWxFNLb2vIEj27GoFh9oTZ7NOIeKpUU0N6rDUmfiAFlqyN6bjKVpgfTfrQINtNZD1v2RhMkHmCnNUGQq/wZ6Vw79DdAQybB2f5THcpI1z9PgZZTHvjhn/cWCUnAGiZx7Dw3hxU5zK1V9EUP5+y9SmSA2lJVD+GQpr6OLjea5Wr6y+KAoJWptVR9cRgpRN5RtxFiuD82VKtlYdNeW+x6ox09IC1V9NxuF34//HYULFzGOYhjOkgQyAOSE/2F8fO7zE1yXa3G7VFkuxmFhlsbLUhmIpoe9lmoNTp50zbPYrw4aDzHpHZgGpkMhe0kI2Tkc1f8Rpph61Ky1EqNdBq1T71s4ysmHBFuj4bo6WzI5LdSDENxOoXTG4mY1dWSyHbGzTorzz2oC1k2jGIAyheChobBKzTjUF/V52ibdTC27S9uS56geyPEPo6IBcgL7oVR//bXkadpkHS2Fr1VMj4+EvtNA4V5KmQUZuJU7NCShts7taVjZJnzvhM3g83eDWscE4x2DR2VqRiiCNANM+UZF3Ex3CWKnWUjjAvTTIsLJ1DgKApmP1OQsEQhxqf/bSSF6ALH+PBsXANY+IyABL7r4veoC5UhRu7024eS3nNNH73jlY7RTd+rVv808h5FBrh0KHb5Q0piEMv3jptT6FS21DBzGFZ4oadv+Fq/BeBDDTvn/VxoQhfwVH4UA21RBLEcd2zr5VTA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(23010399003)(1800799024)(36860700016)(376014)(7416014)(82310400026)(35042699022)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5c1nbC+PDDFqPMTzgZRSiHNSG8FJL4Yyn51RZAdpX6i3NSHhRZW741QUoXrZQ/Fa5kmcCKySXjChXPDY4ST4/kjcykcKPFiksKBVoSvTg3lJcU1eGwNeVrFQPcFKjuW6ur3iRvx/94EKD+5xS9gY6Oql7dac/hmri0BkI6NPCvNHMYaEO1pN+/ie8JUryJWilfksOwf7/QO9Ja9eBl/rn5jsfKDY2mr6T26ahKjHAuUIvWC1dPd4IX/3rWGPlJ0MKofDesuf31Q1BSl2gJPEOg4oV3NRLG8EXSQKJEOdHg+a+o4dERWRdFw1VdmYQuYdihmBeR8NAhUB0RdLFUgZLpiUyrNoR3BnO7l9/Ibt5ftWsgokTrNopIzAvmu+pYGnFYzV1mhccgxaqQFifl/k5PQTOqvuKtk5tXivt2mrWP6AcukwUbX7uLrPwZaLe04m
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 15:21:41.2988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 633ce5f8-57ee-440e-d61b-08deff97e700
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11607

SGkgQ3Jpc3RpYW4sDQoNClRoZSBncm91cCBjb25maWd1cmF0aW9uIGxvb2t1cCBlcnJvciBoYW5k
bGluZyByZXBvcnRlZCBvbiBWNyBzdGlsbCBhcHBlYXJzDQp1bmNoYW5nZWQuDQoNCnNjbWlfdGVs
ZW1ldHJ5X2RlX2dyb3Vwc19pbml0KCkgY2FsbHM6DQoNCiAgICAgICAgc2NtaV90ZWxlbWV0cnlf
Z3JvdXBfY29uZmlnX2xvb2t1cCh0aSwgJnJpbmZvLT5ncnBzW2ldKTsNCg0KZm9yIGV2ZXJ5IGdy
b3VwIGJ1dCBkaXNjYXJkcyBldmVyeSByZXR1cm4gdmFsdWUuIEl0IHRoZW4gZXhwb3NlcyBhbGwg
Z3JvdXBzDQp0aHJvdWdoIHJpbmZvLT5udW1fZ3JvdXBzLg0KDQpJZiBmaXJtd2FyZSByZWplY3Rz
IG9uZSBsb29rdXAgb3IgYSB0cmFuc3BvcnQgZXJyb3Igb2NjdXJzLCB0aGF0IGdyb3VwIGlzDQp0
aGVyZWZvcmUgZXhwb3NlZCB3aXRoIHplcm8vZGVmYXVsdCBjYWNoZWQgc3RhdGUgYW5kIGVudW1l
cmF0aW9uIGlzIHJlcG9ydGVkDQphcyBzdWNjZXNzZnVsLg0KDQpQbGVhc2UgcHJvcGFnYXRlIHRo
ZSBmaXJzdCBlcnJvciwgb3IgcmVjb3JkIHRoYXQgdGhlIGFmZmVjdGVkIGdyb3VwIHN0YXRlDQpp
cyB1bmF2YWlsYWJsZSBhbmQgcHJlc2VydmUgYW4gZXhwbGljaXQgcGFydGlhbC1lbnVtZXJhdGlv
biBpbmRpY2F0aW9uLg0KDQpUaGFua3MsDQpGYXnDp2FsDQoNCg0K
