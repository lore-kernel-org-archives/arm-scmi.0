Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011065.outbound.protection.outlook.com [52.101.65.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C58A3515C0;
	Mon,  3 Aug 2026 22:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.65
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785796630; cv=fail; b=n9NBLGbg8UTMhYmcJa3adJErCKUSjo2A0SkL8rMZFJkPtKhQh+3KH/tIx4vLjSAlMAG773XgoQWiaeWmSiy9VghVNMAJ+IXB4t3a/kZXBfqtJbl2xfCJ+QQQvEHQ/L/h4ov33H0y/yNtxVyZcTOCrIn3e1J8rqA78DYvb+n+Y6w=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785796630; c=relaxed/simple;
	bh=fEHDarjkN+HInuHyx2mhUFwcriqXZaU8qqEaKLTssBg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:Content-Type:
	 MIME-Version; b=Ppk6U6eEr/5w5vJfa7R749ZCW7gxA8W3Cwmvcdj8Z0w1z0U+PnfF/nKzhiG7UNj0brzykBhu6yrf+a11eWwBpt87rOVNAywKwt7n8c4tXOSKgD61/Pcn6mYppbOFNTGapMi5EU/aZqnnSMuKAmJh1wFkEPXXV/IkgVn+DwSgdDk=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Swc2/TZH; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Swc2/TZH; arc=fail smtp.client-ip=52.101.65.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Swc2/TZH";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Swc2/TZH"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=uVTuP2NRpt/LMpTO7AtSgsfRD3FjGufZMWQaN9bghs6hEwWC5K3fc6jSW1d3IFxsGsoVNe0m3CTSvtD31LQyAW/eehNfNj9uZVMLFpvTjuArrsax0Fwx/oPvOa+3b1LS4F5MvkdalMmlgaEqv6dfQjFXGu8TsXSUiaGZtSeSMynfu3ZF6S0TgEWRXqLLYUqmHikx5uwFdrha+rWDNzQ9oXtUsMmqJ86cq8eSBfvZkVOZWmEMKay9FTelifAPSOySUiHh3z4TrJoWjQ7CHiq1pbpMgvAG+FJjVc/O9qc9/iqjziPRITpBPw/L5TwNC4xrjJ79tB8RC7sAwZgysFrZZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEHDarjkN+HInuHyx2mhUFwcriqXZaU8qqEaKLTssBg=;
 b=YNyMoiiSAdcpOJ7oUDPZjigYPN8THdBo5VvfV9E6Tl0/vPnmwHQnw0zQzSJHGznlaYICjPz5ZsKzz/AuQcRlpyFrhnY1uwhNVRQv2EoUhUAlXUWTd0wpeXqpYyhT57kriQapKliXnXw4wlHsiOXwGb1nYCUdB/M5xLeezmlrovDbdJ8co8tpMER4kAcw7si2EfgjnPJXC1gW/mP4oFKnxEnMywRx0m1yqYv0Y832vBtIiYYSm59tALUucU5H0u11AjmqB80IgmoPJ1HAWJ2vhxk50ko2FhrOMeqPkZpwhnb71BukDWTxon8+BisvzI0PiVgkEP6FBNesIplRnFmWug==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEHDarjkN+HInuHyx2mhUFwcriqXZaU8qqEaKLTssBg=;
 b=Swc2/TZHTjRZAZXepSHkvgvEublU4AYV7jVSnAXVO9gPkgpadAddWWCC4UOWGUPcxfZO67qO2LLmFG74I0GKuZegTVoUxdojoF8ma4eOUIjrzKa09RXANmISAhHBbBm7DWkgOnjs/h7m0KcYXCMMiSCid+WMnluf9CeZE6xuf8A=
Received: from AS4P192CA0028.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::13)
 by VI0PR08MB11221.eurprd08.prod.outlook.com (2603:10a6:800:256::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 22:36:58 +0000
Received: from AMS0EPF00000193.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::39) by AS4P192CA0028.outlook.office365.com
 (2603:10a6:20b:5e1::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Mon, 3
 Aug 2026 22:36:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000193.mail.protection.outlook.com (10.167.16.212) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Mon, 3 Aug 2026 22:36:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h821plyAtxHQUjCVtNwgAM5U/N9wOg+TWGb2qc/scqqhUNBTLaeMEjC4nA45/vSuMJTvgmWOdgm3mGSDPETsFAKukWnkM/ml3JMsblyjhhDc1Xy62J6rXr8sFf6FkY8aZQ54QyFq7HaoIbqG6f3W70y+GBqB1MgViiXtWTQDhcJy9up4xhNKNCPO+fLmMMO8DC22gxkcnC9+sZdWfWNRNOlB6AeAj9BnrOJKNiyT0e9GDJNWEp7ti7u7GC8wsYn6ciALYSKsV8h737u+NXmvGYybVaMxI09NhJlJvz7Os4ZxrJ+DG1RFlswBqtdba9ShW8S3m84KJoAga2yDHtllkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEHDarjkN+HInuHyx2mhUFwcriqXZaU8qqEaKLTssBg=;
 b=LB7KKKw+7PsLceRvKvJfxY8b/mRkYFb67QLxSwXmBa94nLsHgni9Q39wxNALgAoLWJpQCF5kxa70UgWXAKY2IyPJ0JKPob7oBu+2lHch9I/RR7TSkbKl41lJ5A8x7HOoG0OA5tsziZTgsgqFZXMTn9Xas4AZsZxQ1Vazeif25BDcDZeCXH6Xc3YgLY4MmFhKQc5EKC2V9bHSD5Dlt8axm49B0Ts2T8l6weMJTkEp1/SFdKP3by4mBT0q92TXhIFRGEMFNXwLMOMKFs8ZPB3d1WTfFjb13ujZbMSx/xIrk3kJb0KJ0zVMIv1QEBTo3uPtKSWvlRmROKbjrVyqfTb9dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEHDarjkN+HInuHyx2mhUFwcriqXZaU8qqEaKLTssBg=;
 b=Swc2/TZHTjRZAZXepSHkvgvEublU4AYV7jVSnAXVO9gPkgpadAddWWCC4UOWGUPcxfZO67qO2LLmFG74I0GKuZegTVoUxdojoF8ma4eOUIjrzKa09RXANmISAhHBbBm7DWkgOnjs/h7m0KcYXCMMiSCid+WMnluf9CeZE6xuf8A=
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com (2603:10a6:10:3d1::9)
 by DU2PR08MB10087.eurprd08.prod.outlook.com (2603:10a6:10:491::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 22:36:25 +0000
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90]) by DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 22:36:25 +0000
From: Fayssal Benmlih <Fayssal.Benmlih@arm.com>
To: Cristian Marussi <Cristian.Marussi@arm.com>
CC: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>, "corbet@lwn.net"
	<corbet@lwn.net>, "d-gole@ti.com" <d-gole@ti.com>, "david@kernel.org"
	<david@kernel.org>, Elif Topuz <Elif.Topuz@arm.com>,
	"etienne.carriere@st.com" <etienne.carriere@st.com>, "f.fainelli@gmail.com"
	<f.fainelli@gmail.com>, "james.quinlan@broadcom.com"
	<james.quinlan@broadcom.com>, "jic23@kernel.org" <jic23@kernel.org>,
	"kas@kernel.org" <kas@kernel.org>, "kernel-team@meta.com"
	<kernel-team@meta.com>, "leitao@kernel.org" <leitao@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Lukasz Luba <Lukasz.Luba@arm.com>,
	"michal.simek@amd.com" <michal.simek@amd.com>, "peng.fan@oss.nxp.com"
	<peng.fan@oss.nxp.com>, Philip Radford <Philip.Radford@arm.com>,
	"puranjay@kernel.org" <puranjay@kernel.org>, "skhan@linuxfoundation.org"
	<skhan@linuxfoundation.org>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	"sudeep.holla@kernel.org" <sudeep.holla@kernel.org>, "usama.arif@linux.dev"
	<usama.arif@linux.dev>, "vincent.guittot@linaro.org"
	<vincent.guittot@linaro.org>
Subject: Re: [PATCH v7 22/23] [RFC] Documentation: Add SCMI System Telemetry
 documentation
Thread-Topic: [PATCH v7 22/23] [RFC] Documentation: Add SCMI System Telemetry
 documentation
Thread-Index: AQHdI5iENpyUKBa4cEa53mntT5EBtg==
Date: Mon, 3 Aug 2026 22:36:25 +0000
Message-ID: <66DE0696-9526-494F-90D0-FCB54565DA4D@contoso.com>
In-Reply-To: <<20260802145618.1952804-23-cristian.marussi@arm.com>>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB8651:EE_|DU2PR08MB10087:EE_|AMS0EPF00000193:EE_|VI0PR08MB11221:EE_
X-MS-Office365-Filtering-Correlation-Id: 365ef2b3-4712-4032-493e-08def1afbaa1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|4022899009|1800799024|23010399003|376014|7416014|18002099003|22082099003|11063799006|3023799007|38070700021|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info-Original:
 d4x8V+bmrF4ciau8AyN4+/LqiKI69dtHO7qT3XJNjiA98RQR1kIRusZy8XOEBuvEs2Da0yxdOj0KyIHKnUYtNr3XXeHc3zdjBk2ruTcnjYX+g3WpP3tM1zyAOE3aa7G8Q0GnHWsJ/yVNYnybGdYbZwY78Rxx2kBiVAAibDs6FOsUDROTskZtBxegKoyYHFKK6SxCvBAXUzhac0FmaLJ6a4Rtv2lmAWqSqkiaETjTWYs26m2P1WXX8P1B9PkEh3vVwMNiJnzNRZb039RmhbYRHIkKWU1rlVxOYTSJJHC9i02BJp0rqFRohGovozc1V5SITatK9KxxT7/ohMAbWrrHV4T5TQkWp80Z43K+DW/aK6T4ua6tqRE1ax45ys9ou652Y50+s8ngFmbtIre3BoEXrN3/736Hc78SK0pi7U6eRQ9adWAGTBp37VbLCfje3qk0JSkbkZqdGzh76KFAifL0YtPog5Dy6T1pFjx4CeO3eqtJj35pEMSxW0HPKm2wbBXsL7cbWtQTBpuj6/KvGGhdGH5sweTyVDDldjfeiw08p4De2YCvvtLPftrVYkcP2Kt7fKIVOpnnrdUH0cMgBrZvXrUquKH+OlvYtw+AG+KNOyNf9DcULvB6zOFnhE+/Q4FtjEezRhxiyreIQDYFVZUfnnVF7s7Jsoew/1xGiAco61hAcn0Y7buMtiJE25vxlNrmR1JOgs1tJD6tvCDPRT1XZwy92iIyNZsHr5wxvtTRfn4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB8651.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(1800799024)(23010399003)(376014)(7416014)(18002099003)(22082099003)(11063799006)(3023799007)(38070700021)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <07F40B4F8E0EB64A84E062BDEEE67988@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 SRuC50g3Ysq5ACc+3nHfJffe3x23KSECYsfGm3eqE+An3eKJOoldT43NnCCGtUbLJmObtDluDAwoG/UitamZ6PNw1JK0HZ4sYQvN91hV+I8nhSeNd7iCl/fBMD31fiFYorESXQCNfjr0DoXmYBn49rfxrLqVU8ipO9/ryfrWTqtpuVL/tDvWhvR20A5cxDqYAbAo705EcV8kB+socHjFhRH4Og/4RXM1/Ks3EP91DyujDVGgQDXic7K7IU1iBzBcyNma1IvEBqQHi8Z69b5e8N4zr8YGUZoV/lrJ+pZ2etbWF8+UT6TO2SSLuzwbHO8QUiOrVL+I4CnFK1oICNjlxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10087
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c0245b9f-69ec-4ac8-62cb-08def1afa6d5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|35042699022|82310400026|1800799024|4022899009|36860700016|23010399003|14060799003|22082099003|18002099003|3023799007|6133799003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	+z6Fz4iAdAWt3+YGV4rtx58TZQDUihtNrhEiudFecMQhqBKCWxFm1QZUS/hSIDZd/lnNrntHhgqS27EkRMQnqrYKlOV++Gl+JEwz7VvUMCq5wfjgui3XJehrAvAb5Lbg2vGDaLfj5oh3EdSQ9L9WaKHJkT1+raoC5mJP1QuIkCn5XUtfNhgphlsyMMMsojY9JQIgylycpWMPLq1zk7m0E0s73av5yhFSfUtcnjkae9semrBxopvu1oHC8Q8tItLtSZumTgI3Oee/rLeKkV+9a1RDJkv9iHtjbWCuYYHwIoajpBt/JNRUsFnY9bw2iOjLU1FkZtxssu+3LXB+/08mSE2waN0lxHEw0W0xYK6d99+F2vCtHh4MpcBpbv6jERX49tTaudLS2PTNTwenebVqGaX0KsNPaiyXV5AB8cBLdUwvvQc/DVqoKD4zy4SH8CPC4JnRXSiBK7UlR96SYSR2Hoe0Aatpwbd3/5xEQrZe30RH699GDVUhvQnz5x0dHzdm4/K3Z1Svr1TvDBXdRgUoSfQQTHXi285GdH+Emc4zqllqqACj0J0upZO/+OSpmEr2NjHyDcZVqxgafM/OnR0Z4bkLlO5JGG7ldITJnCrLByGUW4oDGyVlF1Wkjiqqf9U5JTellMqMZoMCZV9IBncd93RFL2+nzdw1thACoLNYkDQZehuzCejtzCUGXCei5FDBw6brpr0qGvzZY5i8sTysvw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(35042699022)(82310400026)(1800799024)(4022899009)(36860700016)(23010399003)(14060799003)(22082099003)(18002099003)(3023799007)(6133799003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NFIVp/+U/NNPnP/QS9GJNtuwUJkRdlzr6CbtWQLQptuKmYMWo/LBF2lesiQkp/Ab4LLi8/VSVG8As9YhH3bD9PmIPkRRO3bQfY2+KRCTrFNvt+xeI0xBdXaHNmGlBCuGVTEpJ0299Jwd+0vKaI1Rrj6KMKcTel7Zw14i/1BiLfPb4NblLoFeXQbNC1Nu+7Q+alRTXgYNNo3DN2lhT484mIT51jZfYuHVN1eW9XP/YaEAW7T+KC7XWGOkzNm8SsiUD+gwQNEaW2Rf37Xmk5zHEpkjIjxEOz6dFghz542B+3h/atU5lfptHk1Cm2kavte37r9+1Xh2ZB6r9gySafA5DGW4w0JtMMJTNrOr9rcLs8RPgcKyc1/g2epp0fy+qdciXeBodmMl7u/USLmCtkPEIiRbBqxAzyx8e/Nv3S292nw8gY5Gvmx6svfG0mQCjpfp
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 22:36:58.4765
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 365ef2b3-4712-4032-493e-08def1afbaa1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11221

SGkgQ3Jpc3RpYW4sDQoNCkEgZmV3IGRvY3VtZW50YXRpb24gaXNzdWVzIHJlbWFpbiBpbmxpbmUu
DQoNCj4gIC0gU0NNSV9UTE1fR0VUX0FCSV9JTkZPOiBHYXRoZXIgQUJJIHZlcnNpb25pbmcgZGV0
YWlsIGFuZCBiYXNpYyBTQ01JDQo+ICAgIFRlbGVtZXRyeSBmZWF0dXJlcyBsaWtlIG51bWJlciBv
ZiByZXNvdXJjZXMgYW5kIHN1cHBvcnRlZCBmZWF0dXJlcy4NCg0KUGxlYXNlIGV4cGxhaW4gdGhl
IGRpc3RpbmN0aW9uIGJldHdlZW4gYWJpX2ZlYXR1cmVzIGFuZCB0aGUgU0NNSSBpbnN0YW5jZQ0K
ZmVhdHVyZXMuIEluIHBhcnRpY3VsYXIsIHJlc2V0IGlzIHVzYWJsZSBvbmx5IHdoZW4gYm90aCB0
aGUgQUJJIGFuZCB0aGUNCmZpcm13YXJlIGluc3RhbmNlIGFkdmVydGlzZSBzdXBwb3J0Lg0KDQo+
ICAtIFNDTUlfVExNX0dFVF9DRkcgLyBTQ01JX1RMTV9TRVRfQ0ZHOiBHZXQgb3Igc2V0IHRoZSB3
aG9sZSBpbnN0YW5jZSwNCj4gICAgb3IgYSBzcGVjaWZpYyBncm91cCwgY29uZmlndXJhdGlvbi4N
Cj4NCj4gIC0gU0NNSV9UTE1fR0VUX0RFX0NGRyAvIFNDTUlfVExNX1NFVF9ERV9DRkc6IEdldCBv
ciBzZXQgdGhlDQo+ICAgIGNvbmZpZ3VyYXRpb24gb2YgYSBzcGVjaWZpYyBEYXRhRXZlbnQuDQo+
DQo+ICAtIFNDTUlfVExNX0dFVF9BTExfQ0ZHIC8gU0NNSV9UTE1fU0VUX0FMTF9DRkc6IEdldCBv
ciBzZXQgdGhlDQo+ICAgIGN1bXVsYXRpdmUgY29uZmlndXJhdGlvbiBvZiBBTEwgdGhlIERhdGFF
dmVudHMgZGVmaW5lZCBvbiB0aGUNCj4gICAgcGxhdGZvcm0uDQoNClBsZWFzZSBzdGF0ZSB0aGF0
IHRoaXMgY29uZmlndXJhdGlvbiBpcyBnbG9iYWwgdG8gdGhlIFNDTUkgaW5zdGFuY2UsIG5vdA0K
cGVyLW9wZW4tZmlsZSBzdGF0ZS4NCg0KVGhlIGRvY3VtZW50YXRpb24gc2hvdWxkIGFsc28gZGVm
aW5lIGNvbmN1cnJlbnQtY2FsbGVyIGJlaGF2aW9yLCB3aGV0aGVyDQptdWx0aS1jb21tYW5kIG9w
ZXJhdGlvbnMgY2FuIGludGVybGVhdmUsIHBhcnRpYWwgZmFpbHVyZSBvZiBTRVRfQUxMX0NGRw0K
YW5kIGJhdGNoIG9wZXJhdGlvbnMsIGFuZCB3aGljaCBjb21tYW5kcyByZXF1aXJlIHdyaXRlIGFj
Y2VzcyBvcg0KcHJpdmlsZWdlLg0KDQo+ICAtIFNDTUlfVExNX0VWRU5UX1JFR0lTVEVSOiBTdWJz
Y3JpYmUvdW5zdWJzY3JpYmUgdG8gYSBUZWxlbWV0cnkgZXZlbnQuDQoNClRoaXMgaW9jdGwgbmFt
ZSBkb2VzIG5vdCBleGlzdCBpbiB0aGUgVjcgVUFQSS4gVGhlIGRlZmluZWQgY29tbWFuZCBpcw0K
U0NNSV9UTE1fRVZFTlRfU1VCU0NSSUJFLg0KDQpQbGVhc2UgYWxzbyBkb2N1bWVudCBzdWJzY3Jp
cHRpb24gb3duZXJzaGlwIGFuZCBsaWZldGltZSwgaW5jbHVkaW5nIHdoYXQNCmhhcHBlbnMgd2hl
biB0aGUgdGVsZW1ldHJ5IGZkIG9yIGV2ZW50ZmQgaXMgY2xvc2VkIHdpdGhvdXQgYW4gZXhwbGlj
aXQNCnVuc3Vic2NyaWJlLg0KDQo+ICAtIFNDTUlfVExNX0JBVENIX1JFQUQ6IFJlcG9ydCB0aGUg
bGFzdCBzYW1wbGVzIGZvciB0aGUgRGF0YUV2ZW50cyBJRHMNCj4gICAgc3BlY2lmaWVkIHdpdGhp
biB0aGUgc2FtcGxlcyBpbnB1dCBwYXJhbXMuDQoNClBsZWFzZSBkb2N1bWVudCB0aGUgcGVyLWVu
dHJ5IHN0YXR1cyByZXByZXNlbnRhdGlvbiwgd2hldGhlciB0aGUgc3RhdHVzDQphcnJheSBpcyBv
cHRpb25hbCwgd2hhdCBoYXBwZW5zIHRvIHN1Y2Nlc3NmdWwgZW50cmllcyB3aGVuIGEgbGF0ZXIg
aXRlbQ0KZmFpbHMgd2l0aG91dCBzdGF0dXNlcywgYW5kIHRoZSBtYXhpbXVtIHBlcm1pdHRlZCBi
YXRjaCBjb3VudC4NCg0KPiAgLSBTQ01JX1RMTV9HRVRfU0hNVElfTElTVDogR2F0aGVyIGEgbGlz
dCBvZiBvcGVuIGZpbGUgZGVzY3JpcHRvcnMsIG9uZQ0KPiAgICBmb3IgZWFjaCBTSE1USSBtZW1v
cnkgYXJlYSBkZWZpbmVkIGZvciB0aGlzIGluc3RhbmNlLCB0aGF0IGNhbiBiZSB1c2VkDQo+ICAg
IHRvIG1lbW9yeS1tYXAgc3VjaCBhcmVhcyBpbiB0aGUgY2FsbGluZyBwcm9jZXNzIGFkZHJlc3Mg
c3BhY2UgWy4uLl0NCg0KVGhlIG1tYXAgQUJJIHN0aWxsIG5lZWRzIHRvIHNwZWNpZnk6DQoNCi0g
dGhlIGV4YWN0IFBBR0VfQUxJR04ob2Zmc2V0ICsgbGVuKSBtYXBwaW5nIGxlbmd0aDsNCi0gcGVy
bWl0dGVkIHZtX3Bnb2ZmLCBwcm90ZWN0aW9uIGFuZCBzaGFyaW5nIGZsYWdzOw0KLSB0aGF0IHJl
dHVybmVkIGZkcyBhcmUgcmVhZC1vbmx5IGFuZCBjbG9zZS1vbi1leGVjOw0KLSBjYWNoZWFiaWxp
dHkgYW5kIGNvaGVyZW5jeSBleHBlY3RhdGlvbnM7DQotIGZkIGFuZCBWTUEgbGlmZXRpbWUgYWNy
b3NzIHJlbW92YWwsIHJlc2V0IGFuZCByZWNvbmZpZ3VyYXRpb247DQotIGNsZWFudXAgdXNpbmcg
bXVubWFwKCkgYW5kIGNsb3NlKCk7DQotIHNlY3VyaXR5IHJlcXVpcmVtZW50cyBmb3IgYnl0ZXMg
c3Vycm91bmRpbmcgYW4gdW5hbGlnbmVkIFNITVRJLg0KDQo+IAkJLyogRW5hYmxlIFRlbGVtZXRy
eSBhcyBhIHdob2xlLCBzZXQgYSA0MDBtcyB1cGRhdGUgaW50ZXJ2YWwgKi8NCj4gCQljZmcuZW5h
YmxlID0gMTsNCj4gCQljZmcuYWN0aXZlLnNlY3MgPSA0MDA7DQo+IAkJY2ZnLmFjdGl2ZS5leHAg
PSAtMzsNCg0KUGxlYXNlIGRvY3VtZW50IHRoZSBwZXJtaXR0ZWQgc2Vjcy9leHAgcmFuZ2VzIGFu
ZCBob3cgYSByZXF1ZXN0ZWQgdmFsdWUgaXMNCm1hdGNoZWQgYWdhaW5zdCBkaXNjcmV0ZSBvciBz
ZWdtZW50ZWQgYWR2ZXJ0aXNlZCBpbnRlcnZhbHMuDQoNCj4gCQlzdHJ1Y3Qgc2NtaV90bG1fZGVf
c2FtcGxlIHNhbXBsZXNbM10gPSB7fTsNCj4gCQlzdHJ1Y3Qgc2NtaV90bG1fZGF0YV9yZWFkIGRh
dGEgPSB7fTsNCj4gWy4uLl0NCj4gCQlkYXRhLm51bV9zYW1wbGVzID0gMzsNCj4gCQlkYXRhLnNh
bXBsZXMgPSAodW5zaWduZWQgbG9uZylzYW1wbGVzOw0KPg0KPiAJCXJldCA9IGlvY3RsKGZkLCBT
Q01JX1RMTV9CQVRDSF9SRUFELCAmZGF0YSk7DQoNClY3J3MgYmF0Y2ggaGFuZGxlciBleHBlY3Rz
IHN0cnVjdCBzY21pX3RsbV9iYXRjaCwgaW5jbHVkaW5nIGl0ZW1fc3osDQppdGVtcywgYW5kIG9w
dGlvbmFsIHN0YXRlcy4gVGhpcyBleGFtcGxlIHN0aWxsIHBhc3NlcyBzdHJ1Y3QNCnNjbWlfdGxt
X2RhdGFfcmVhZCwgc28gaXQgZmFpbHMgaXRlbV9zeiB2YWxpZGF0aW9uIGFuZCBpcyBzbWFsbGVy
IHRoYW4gdGhlDQpzdHJ1Y3R1cmUgY29waWVkIGJ5IHRoZSBoYW5kbGVyLg0KDQpQbGVhc2UgdXBk
YXRlIHRoZSBleGFtcGxlIHRvIHVzZSB0aGUgVjcgYmF0Y2ggQUJJLg0KDQo+IAkJZm9yIChpbnQg
aSA9IDA7IGkgPCAzOyBpKyspDQo+IAkJCWZwcmludGYoc3Rkb3V0LCAiJWxsdTogMHglMDhYIC0+
ICVsbHVcbiIsDQo+IAkJCQkJc2FtcGxlc1tpXS50c3RhbXAsIHNhbXBsZXNbaV0uaWQsDQo+IAkJ
CQkJc2FtcGxlc1tpXS52YWwpOw0KDQpQbGVhc2UgZG9jdW1lbnQgdGhlIHRpbWVzdGFtcCBkb21h
aW4sIGNsb2NrLXJhdGUgY29udmVyc2lvbiwgd3JhcA0KYmVoYXZpb3IsIGFuZCB3aGV0aGVyIGl0
IGNhbiBiZSBjb3JyZWxhdGVkIHdpdGggYSBMaW51eCBjbG9jay4NCg0KPiAJCWlmIChyZXQpDQo+
IAkJCXJldHVybiByZXQ7DQo+IFsuLi5dDQo+IAkJcmV0dXJuIDA7DQoNClRoZSBleGFtcGxlIHN0
aWxsIGxlYWtzIGZkIG9uIGFsbCBzdWNjZXNzZnVsIGFuZCBtb3N0IGVycm9yIGV4aXRzLiBQbGVh
c2UNCnVzZSBvbmUgY2xlYW51cCBwYXRoIGFuZCBjbG9zZSBmZCBiZWZvcmUgcmV0dXJuaW5nLiBF
eGFtcGxlcyBpbnZvbHZpbmcNClNITVRJcyBvciBiYXRjaGVzIHNob3VsZCBzaW1pbGFybHkgZGVt
b25zdHJhdGUgZnJlZWluZyBhcnJheXMsIGNsb3NpbmcNCnJldHVybmVkIGFub255bW91cyBmZHMg
YW5kIHVubWFwcGluZyBtYXBwaW5ncy4NCg0KVGhhbmtzLA0KRmF5w6dhbA0KDQoNCg==
