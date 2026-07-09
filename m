Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011048.outbound.protection.outlook.com [52.101.70.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA9628469F;
	Thu,  9 Jul 2026 03:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.48
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783567070; cv=fail; b=oCHeAUxzqne7ZukeHsZ8TiJ+ze8gMGVkPwfzmgxYjC+/4lrspWQQbga9Xql/MEg9Dz7v9AnAQmWlBRmI3Y1XX4FsRYeprOe3EclFFVQ8X7egbjG+p6aLVVthd3LPoF/XCGV4Ob1dS+6/uho+HcMGB9p6Da58PI0kNHYDoS7YJDY=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783567070; c=relaxed/simple;
	bh=3LLEDTjbXVWMU4FrYZPFHmkqX7v2SO1G4PBJqnON2IY=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=HZHm/pPj3hh//prnCoOl7Vqkz2f7/qC30DDNbhoDB2Rn4QXHR7rCTNRd6LHv5IdYVN5gShMvhfUfYtDPgFBx0RovGzr0aH0MQnN7+0jl5uYMntZB1kKaEmVke6PNPp6Hk9faqxERm+QTtKK6xoPb/4HIrLmBmEfNX9kpz1IxKHg=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Il5qpc8h; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Il5qpc8h; arc=fail smtp.client-ip=52.101.70.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Il5qpc8h";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Il5qpc8h"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=fGTokw1fOCWwJ5G7J9FLVQjjWoaq5TZUQ2IZ26yuVj5FfCRyQEQzBD4b+5kfjdbVkzyq3fbIU+QclWAOcNseKZjbvzpVz+nmGGm8ylPGgZO1cw7Mc93v1ulfoSi2XLEM1IbmhVWwKiVAXLDFidKorWMr6Ngctp+LRllif8rmZKrBPAB0d9PlnPxVhoR/1hQ2Cf40jKMPnLWUnHIriBiv04KJ9QgFW+dB1xgHEclNVlvO2wDCm79ua3r/t17wQPcJIfXj7cYt4yGmptlSfuaipnr/v3dfZ+HGucesO+xtIJebg/KqZSfIG/0ZrS0B26Le36Z4IxQCYRQBR8iyJHTqxw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3LLEDTjbXVWMU4FrYZPFHmkqX7v2SO1G4PBJqnON2IY=;
 b=SHaWLaXLyIV9VhIgIAKuqTL9TxCT3W/rQO41yCNlcJ4VLbPTT0lQK+uGIt8pQwdPGEk7xKOzi7TLBFomaDQzg+9js+jO/H5q7RnDdFUDxQhC306+bbNTx+xd5hUksMO9BzDoqjJacDDCMHyh/TWIME4nY/sNDb3CUofFCvnvnwzxqih1tSks01LVKCqcEvE1OXj5BU4xh6sYWCOag1zSxr4q8xEyv5qd8BxBZu2VZ3jVkPLq/c+Cy03xcwtN/QlO9pfNdciZQ4moGNcDQXYwCTqDfX2pGT/xa+hWtWAsSs87LgLAeMM4aYv7jSzT+nplNhYjE0pRDkSpj/3zuCu++Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3LLEDTjbXVWMU4FrYZPFHmkqX7v2SO1G4PBJqnON2IY=;
 b=Il5qpc8h7q0NVulWPK1RoW7aqoF4kHkAHu+nKrs/OMc6DWb8LFGOOxz5Yf1VHbXkcebxGFYm2J/lyjyvHVqTNYsdmkGnUrXMpZh03fXbDr9QFVeIdrvp6gAct6OjC/FY5ZdE+dt4N/RC5Oq50z4IMaZBaSYOqLQOk7Hk5f2a9dU=
Received: from AS9PR04CA0147.eurprd04.prod.outlook.com (2603:10a6:20b:48a::20)
 by AS2PR08MB8479.eurprd08.prod.outlook.com (2603:10a6:20b:55d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Thu, 9 Jul
 2026 03:17:43 +0000
Received: from AM4PEPF00027A6B.eurprd04.prod.outlook.com
 (2603:10a6:20b:48a:cafe::8a) by AS9PR04CA0147.outlook.office365.com
 (2603:10a6:20b:48a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Thu, 9
 Jul 2026 03:17:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A6B.mail.protection.outlook.com (10.167.16.89) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Thu, 9 Jul 2026 03:17:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eIzP5p+OnLJ3ZPxR9ehVimvNPDCxxYLfPQ5JCHHWQvTySsIRj7kCKhxA101Jxk0YshxNYZHSxBvHCN7huqnLTMz+y46EQUC/priiyQdUeyxJYdz1F4uyKuZ6Fx6ILS7RBF5gtg/7I2B6zop9j4VtoeXRhWgFZxVNGvntj9OUqy64RlSpoJ1lTb1F4ufGg350Tw492IdI9/sMQ96GrYCW8tQ5whZHHHTuAfMn2ESq7ib0NZY+yKBZAxE0c330lC37N+ppOJpkZzhf86daK1IptiTMpBvp0hnJj+qHF0yTcayg9X2+grwDwosYVv7bPgsFzwiuBwGbLAoo3tukf4bwkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3LLEDTjbXVWMU4FrYZPFHmkqX7v2SO1G4PBJqnON2IY=;
 b=iSOcI64faG8JS+CpDrqh4oI7r2xvqt1LXp6sH0S+AadTkrdTiglp0h1rdVc7lhA1cUCBwhoPTg9W9Vk4p4Z1KF8j4bq0Ew+d/amLhxj6j3DJhote8biABdAV8impBqqOs2BotFV6FMUYblFb5WCYy4KqigGf9iLFnaicoqTiFPO1RhNL8hSQkWk0tuRYxPGFjTw1yNO8ikPBG/RNwKUlTeawEljY8ae1SbJJrun6QkdGJBWWO+I92am9itrdIauu8Di3ldyENbmJnMb3Hu4yZbWmoHHVJ1wBqC/RtXE1EOJG7hQ7U6FjN4jcLYauX+g8qsyR6KMC+37Zh7iOZa4MQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3LLEDTjbXVWMU4FrYZPFHmkqX7v2SO1G4PBJqnON2IY=;
 b=Il5qpc8h7q0NVulWPK1RoW7aqoF4kHkAHu+nKrs/OMc6DWb8LFGOOxz5Yf1VHbXkcebxGFYm2J/lyjyvHVqTNYsdmkGnUrXMpZh03fXbDr9QFVeIdrvp6gAct6OjC/FY5ZdE+dt4N/RC5Oq50z4IMaZBaSYOqLQOk7Hk5f2a9dU=
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com (2603:10a6:10:3d1::9)
 by AS8PR08MB6119.eurprd08.prod.outlook.com (2603:10a6:20b:290::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 03:16:40 +0000
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90]) by DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90%4]) with mapi id 15.21.0181.008; Thu, 9 Jul 2026
 03:16:40 +0000
From: Fayssal Benmlih <Fayssal.Benmlih@arm.com>
To: Cristian Marussi <Cristian.Marussi@arm.com>
CC: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"brauner@kernel.org" <brauner@kernel.org>, "d-gole@ti.com" <d-gole@ti.com>,
	"david@kernel.org" <david@kernel.org>, Elif Topuz <Elif.Topuz@arm.com>,
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
	"puranjay@kernel.org" <puranjay@kernel.org>, Souvik Chakravarty
	<Souvik.Chakravarty@arm.com>, "sudeep.holla@kernel.org"
	<sudeep.holla@kernel.org>, "usama.arif@linux.dev" <usama.arif@linux.dev>,
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>
Subject: Re: [PATCH v5 00/23] Introduce SCMI Telemetry support
Thread-Topic: [PATCH v5 00/23] Introduce SCMI Telemetry support
Thread-Index: AQHdD1EZ1C7AJBpKeE6XQMK7KEbvcA==
Date: Thu, 9 Jul 2026 03:16:39 +0000
Message-ID:
 <DB9PR08MB86515A3C21BCBDC1FEDC64D3FFFE2@DB9PR08MB8651.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB8651:EE_|AS8PR08MB6119:EE_|AM4PEPF00027A6B:EE_|AS2PR08MB8479:EE_
X-MS-Office365-Filtering-Correlation-Id: 2756f9e6-ff6d-4093-6047-08dedd68a416
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|6133799003|3023799007|18002099003|38070700021|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info-Original:
 cdT1wZuorEW31cRs6CWgIgGKVy+5EQiOHgTAsMAMUVCsJToKS4FFcQqvrqYI2CbnZJD9tmyjgh1+QdCVC++H3gUmrFaYIPsP9jNNBkofp+ytjZRZfYjhJ0V2h+lij1OYRkW0E2bxocSV5c1rq4mDHzSzyryCMhd6nTFpgtrC5X0emrL30p42fGkyoPaTVErvOe1MbvI2A47kitJh2svxsJWSFuTVZgsRtbQVNOpTBagW0Qvvau+qGzZn6wooO/A842XaoaVMiex2BrHAJgyS6b/HYXxoLHIjg/+SPi3cDQuWBeoONmnAb/va7Sj7ohbv37EwR4exODHm6M3GAQO+g/PK55n0VNYMvw/Qmsp3DLjKoG41/uCBm3IA2FVvVZRYhK76lF262SS3wbc7sxWZi8rz49Etoc7sye1R3uKZQ146xVR9wziRkE9t2DuvryvyJhISsmJXzcoCjl3JcW1AMRzeVGcb/YbUNusIRA4vBAWABopssNcghY8GF1e/q+Uhlf6YP/5i76La0Q5sZAE4ZeS12pMsZQF9a6iWYyYGE4ap1UnKJ9/01qlvM5A2dfC82Ub9jBhPvALcF5QOKkDZCHO1FdvbJWq1G2eH55ZbfxEHNzYHRhCeFuYe9794HPc+PhM/X2s7BjAF6qihh6MwdD6pFgGnA8kH9RgGlID59x+O8eu7kuvXD/u8LrbHJ9sorDTjCpkmMq1n2EGbkEogV6CrRlLU+UJXBLcUzp+ZdA0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB8651.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(6133799003)(3023799007)(18002099003)(38070700021)(56012099006)(11063799006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 sp278wSiujFoLE5kliQE+x8BKiHmpAcO6KSo11v12ZPs0yXUFw2CN18H39ZbJCLR5bBc0Wx/oXjWXssL3vzspH/S1oW90NUIthCyRPbhFwav9CtGuNivsR8O+5xpdGspEv9a61DF1BJ7yisjzkEMF5IMCG26MjLZ8H5ZoC311gEmOVuCkBI5YT5iqF6ZRe2s2b2hgVr4LEnqucMNG1OZY99LsCE12d2J25j0kvAG9VWRO7E992cfQuKXQR2M/rTE7/W3/hDzpRzd3b5c5l7cfZxm8uIPJT+qWsb01wMM5tG1I0PQ5h6u+JQ2NJ9CD9ji2TxZ2bFx5WUeejtrYl2YmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6119
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9e9ec457-2f09-426d-d92e-08dedd687e69
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|82310400026|23010399003|376014|7416014|1800799024|36860700016|6133799003|3023799007|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	bsczfssrLSx8/jqWPrnidoje/zKLbISqA6qVAU4Y3MhigkGvV16hWeyYQ/q3qq2SLHv/HO6aqqUwcViZnlKDlig1eqPX/pd5RGYx1HfHm75lSU6gOXx6SdAUSVTbvjjNJfmRFie7Li0bY8IQYSJRN7cJ20AwDsOuQG6LO1jfFVIluVM9i+hp9LCDXAnxnheyOy1zOQB6tOKxGD1BVUAW/E3xCdeRJuPEbU7bFC+NVJrZIrt74cOG875diu9ofbvaKaFd7iEhnyGGm4Wxodzrm+dt6qZ4A8F1fSlNB87QVP6Vz87WuAe+E+MQjFnJWGwvA75BoDMrFDchIvx3ScJ6BRj+QfqFkFvgHyrM9WACAb9PYf4beD4tFtzVoSoLq3b0GcHILwkY2RSkqxzlp8igEUOpx6LBvuzJgdIo8ebOPCX0HXAjnqYzYi2Qte8T7yusFmdEyuxyEy/tbCdY8kSVuaCjmyu/gSIjTZB7bYq1vwzex/1BFNU3sYf/WpgWsPF8IEkMYZToQcJMwqFfcaMU9vZHlOKWqh6mrkLpOO3vs+B8ca54ew7/1WyMPgzYpga2smOkI4UxVqsZF7vkFL4dqfYWXmU50gRyGNyN5Jt9KiSWxf3L6BMMrfxxobLYjd/nT5A+sRnPmL4dfltCH2Jv/JSZtatjXN/kWBQGW5L9WDqSxDPN04ygWjN/5YO+AvTeuwhiDWTG13J2eDO3shiC8g==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(82310400026)(23010399003)(376014)(7416014)(1800799024)(36860700016)(6133799003)(3023799007)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SaPxVXMJEtrgSrVR3vJ6kk7B2JkQcs1IE+HQpNO9c+b5VeFzIWrXvjsq33aAA0m0aZnI33/8R0fLE3+Sm7l2gMA/Nhqw/TJlxu3TjcH6fWCbuVFIgzW6Y4aH0L3FgXr96ooR+3yeFXSQN2ZTaxVz/F/AALDtpeVpyBEk92NhFXJSODHktZp2gP20znQqi1DvmWvxmP1ZqgH+ZwxDUeHcyY1Ti8lnUHMBs29oSKhZtB6IRudMgEHyCDJdUFmLdhK2wJm3sUbGEZRS5uFu337xMGzxVioFy6p60qyFVW88cZqCoF1IUJntv0Wy+mwJZSvqx+okr5D8217TuQVBXW2W6BPFSWtepqGh6zB5zX7o8zJCJRpzf6rsUqvwdZY6WbdWU+YgMT/WfRu8nai1YtFWzx6l4i2kZyj2pGnSJjgloTAn1ckMxCZflZUA7sdRzS9b
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 03:17:43.1449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2756f9e6-ff6d-4093-6047-08dedd68a416
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8479

Overall, v5 is a good direction: dropping the filesystem ABI for a chardev/=
ioctl ABI is simpler, easier to version, and more appropriate for high-rate=
 telemetry. The split between SCMI protocol support, UAPI, driver, docs, an=
d test tool is also much cleaner. The main concern is that there are severa=
l correctness and usability issues that should be fixed before merge.=0A=
=0A=
Must-Fix Issues=0A=
=0A=
-scmi_tlm_to_uapi_base_info() uses out->flags |=3D ... on an uninitialized =
local struct scmi_tlm_base_info base; this can leak garbage flags. Use out-=
>flags =3D ... or zero-initialize base.=0A=
-scmi_tlm_update_interval.exp is documented and used as signed, but the UAP=
I declares it as __u32. It should be __s32, otherwise examples like exp =3D=
 -3 are ABI-broken.=0A=
-Group bounds checks use grp_id > num_groups; they should use grp_id >=3D n=
um_groups to avoid out-of-bounds access.=0A=
-Avoid casting UAPI integer fields to bool *, especially __u32 enable/t_ena=
ble in scmi_tlm_de_config. Use local bool enable =3D !!tcfg.enable; variabl=
es and copy normalized values back explicitly if needed.=0A=
-Array sizes from userspace need overflow and allocation hardening: use arr=
ay_size(), kvmalloc_array(), and clear max limits for num_des, num_samples,=
 num_grps, etc.=0A=
-SCMI_TLM_GET_SHMTI_LIST loops over the user-provided count after only chec=
king it is not too small; if it is too large it can read beyond in->shmtis[=
]. Loop over the actual firmware count.=0A=
-The mmap path needs tighter validation: reject oversized mappings, handle =
mmap offsets deliberately, set appropriate VMA flags, and document the life=
time/security model for exposed SHMTI memory.=0A=
=0A=
Design Feedback=0A=
=0A=
-No ABI version/capability ioctl. GET_INFO gives protocol/platform info, bu=
t userspace also needs driver ABI version and supported ioctl feature bits.=
=0A=
-Enumeration is awkward. List ioctls should support a clear two-call patter=
n: call with count 0 to get required count, allocate, call again. Returning=
 EINVAL for =93buffer too small=94 is not very ergonomic.=0A=
-No generation counter yet. Userspace needs to detect config/resource chang=
es between discovery and read. This should probably land with the first ABI=
.=0A=
-Global config is dangerous. SET_CFG, SET_DE_CFG, and SET_ALL_CFG mutate sh=
ared firmware state. Multiple users can race or disrupt each other. Conside=
r documenting ownership semantics, adding locking/session model, or exposin=
g read-only access separately.=0A=
-SET_ALL_CFG is not atomic. If configuring all DEs fails midway, userspace =
gets partial state. Either make that explicit, add rollback/best-effort rep=
orting, or prefer batched config with per-item status.=0A=
-No event/poll model. For telemetry, userspace may want poll()/blocking rea=
ds/notification-driven collection rather than repeated synchronous ioctls.=
=0A=
-Timestamp usability is underspecified. Userspace needs clear timestamp dom=
ain, rate conversion, wrap behavior, and correlation to Linux clocks.=0A=
-Raw SHMTI mmap is powerful but has risks. It needs very clear lifetime, pe=
rmissions, cacheability, offset/length, stale-data, and security documentat=
ion.=0A=
-Batch APIs lack per-sample status. In BATCH_READ, one bad DE currently app=
ears to fail the whole request. For tools, per-entry status is much better.=
=0A=
-Text read() plus binary ioctls feels split-brain. Either document read() a=
s debug/convenience only, or remove it from the stable interface and keep t=
he ABI purely binary; no need for two different user interfaces with differ=
ent semantics.=0A=
-Rename the generic #define SCMI 0xF1 to something scoped like SCMI_TLM_IOC=
TL_MAGIC; exporting a broad SCMImacro in UAPI is collision-prone.=0A=
-Add .compat_ioctl =3D compat_ptr_ioctl or equivalent, and document that al=
l structs are 32/64-bit compatible. The __u64user pointers help, but compat=
 behavior should be explicit.=0A=
-Clarify concurrency semantics: what happens when two processes enable/disa=
ble DEs, change intervals, or read while config changes? A generation count=
er/reset ioctl, already listed as TODO, should probably be part of the firs=
t ABI version.=0A=
-Define permissions. Configuration ioctls mutate global firmware telemetry =
state, so access control/default device mode/udev expectations should be do=
cumented.=0A=
=0A=
Suggested additions before ABI freeze=0A=
=0A=
-SCMI_TLM_GET_ABI_INFO=0A=
-SCMI_TLM_GET_GENERATION=0A=
-SCMI_TLM_RESET=0A=
-batched GET/SET_DE_CFG with per-entry status=0A=
-pollable notification/event support, if telemetry notifications are meanin=
gful to userspace=0A=
-optional read-only open mode or permission model for non-mutating tools=0A=
=0A=
Usability / Docs=0A=
=0A=
-The docs need more precise examples for two-call enumeration, error handli=
ng, batch reads, and mmap cleanup/close semantics.=0A=
-Fix typos before reposting: =93Systemn=94, =93dwscriptors=94, =93istance=
=94, =93udpated=94, =93andc=94, =93A IOCTL=94.=0A=
-The sample tool should either be promoted into a real selftest-style utili=
ty or clearly kept out of the upstreamable set until it has robust argument=
 parsing and error reporting.=0A=
=0A=
Bottom Line=0A=
=0A=
The architecture is promising, but the UAPI needs one more hardening pass b=
efore it becomes ABI: The ioctl set covers the basic workflow, but some par=
ts are still hard for user space tools to consume robustly, especially arou=
nd discovery, concurrency, partial failure, and long-running collection. Th=
ose should be fixed before treating the UAPI as stable. I would also focus =
v6 on fixing the concrete correctness bugs, tightening mmap/security semant=
ics, adding compat support, and making enumeration/configuration behavior p=
redictable for production userspace.=0A=
=0A=
-Fay=E7al=
