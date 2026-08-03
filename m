Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013013.outbound.protection.outlook.com [40.107.162.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0300B345EA7;
	Mon,  3 Aug 2026 22:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.13
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785797989; cv=fail; b=WUENi2rbnKCQ3t3yNiXBJVX0bOh8d//zuaXlfa0SPIdXjncc9ECZZku7t/69xWtpBrWNVUFUp0Ngwfpjo7MEFYLO57+2coNHoxx9yXSMR/hYfIJz/A/LoZhQ6v2kNhbEiwuoXhIKUvVQxGxCs5xiegpOxpR2BCRpFPfvrdWb2sk=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785797989; c=relaxed/simple;
	bh=HfXKO2NhFlWRQqlHraCzzs8rGqTLuiUTlr7R3AhkKG0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:Content-Type:
	 MIME-Version; b=F7Xn8f8agE8aUVm34KoGc2uAtpkbMMXwmdxI6JQRoVfLIjopdhgwv//JxFgq9fYRCwooHCBHZsp4tRz3OXz53smIrTpFw5085XffJuxbdK4p6lUylH0uaLnT/6HLwEYKAMQs5LqGEvujqSBDxKaTwW4eQFULrZmWgh1L9XbXlG4=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Af83ce+H; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Af83ce+H; arc=fail smtp.client-ip=40.107.162.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Af83ce+H";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Af83ce+H"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=B7pskGXx69lPEuVc5MjNZUvHUJ1c74DpnGB+MNE02jIwkwzNvM16M89J7wI/zrdQEjbB26HWO++/EAtumJrMyzDFvR7CWmCHv+GbkWkf9gNMYUyc62lVR4olon9NN6TdYQgpzUNFoSlK0V6bLHTf8vWXV/U+PTjyWW60VE3TSqSbNprdtTwgwhyy+hjN5ghbMPOTX3JJ/eIWoOTE2GbmyLKD5BREkxUNIgZFMeSIUGgtuLZ66jMYnSLtfBGLxNIWnKz9U4qbaUOT0pL53g421AaPAMygNz0jHFPdd3q6S65BD+4SmiH+UIQtOLIWaGVSamHc1iIeW+Bgtqt3VzGoCg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfXKO2NhFlWRQqlHraCzzs8rGqTLuiUTlr7R3AhkKG0=;
 b=phlVmF25FtYA5fNceERXhI5AbaInT5n47FrbbRfsa92dA0JA7i3bQzVShOfAQO58gyObKL6WBvcr8O3Unyq6q9RH9I9aotIryOAq8b5kCdM8ME4oTCKfAxSr2N9YfAUOKJBQEi/1DFZPom0BaYNGEg8AjoGiNNweYvShiqJ+h7HznRUkboh+5zx1FWgq7yUOSUpAzGComYXjQ71JJQQDfkW7sif79JQg3uoH2GkW1hBldw0UOOAvFXVfZ+v8+PMnSdnZun7I7jFTqxzKb+k881wPSXNAzkkB94UCkmDCNtDIhVw9PQ1l+Bgec6ebEey1OfPXEUPlR9bOMMvOq9eFmQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfXKO2NhFlWRQqlHraCzzs8rGqTLuiUTlr7R3AhkKG0=;
 b=Af83ce+H/sbOGjx6tUEF1ks04Jv5RCGhPFrPnIfdFXJmnSGImd7vzSzQdA8YSeeOi+LbPWWmXLNq6b5cr6z//eXu3JGlVG6Mf+8HHJVP1dqv0fSu/ZQB/fN7hajkjVe/6msgOKbY7XBsFZAx/z6OKRRCxEcwQLT4/rIZW2mBIhI=
Received: from AS4PR09CA0021.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::19)
 by AM7PR08MB5400.eurprd08.prod.outlook.com (2603:10a6:20b:109::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 22:59:42 +0000
Received: from AMS0EPF000001AE.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::92) by AS4PR09CA0021.outlook.office365.com
 (2603:10a6:20b:5d4::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Mon, 3
 Aug 2026 22:59:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AE.mail.protection.outlook.com (10.167.16.154) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Mon, 3 Aug 2026 22:59:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O1mpJZF6ZUID/V6FtsJ5VYMiSAgFUqFi8ZWMR3Me4tk9lTmjDPm8DMfGUIXOVxGRT1kU0S+5YzK389MLHQlaZIRQRqVFW5z5W+fZMFIOrdJLsWEjHwZ8/6qXVBLX+jmREm4d+bqaz6HgVLze1I9q8x6pm1+1/D1uKLa8VhVODkCt4EmzZ0NF3QSa0jsm29F8+KoSRHRYzksCyqpzOXpLVXjK7TiIbTHHb/ngAJkMfj0we4iNdmlgh3nUZV5UQJQUye2RBabXUNEPwx4HO7oIAVZy47XrsOPDbuPWEkHGe28jzMnhXigqOR6siF8ceSQ4YImw6TyQcW7SacZB7cCS6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfXKO2NhFlWRQqlHraCzzs8rGqTLuiUTlr7R3AhkKG0=;
 b=TUN3Hj/XTpgb3fQUDI6zAjfSA3S21jAOIl0i09OFO5lULJzWxIPBjdjAj+tLG2LQxiSy63KqMCjn6kZwnYKzFAVibJXs4zVcm+zavNIBGUu5IPq/PBjZ7mBfm2p7KpyADZwGH3c8IFjvOP7RSRLb3QgW/tE40WSm9h07FTfl8/RMsR4N9BDtNG9NjKzKIZBca9w3Y4+aBAI/E/RGbto8xfIKFDZSnlAzDd6RVaPbxXCXN3PrDgSufLIQM5AJItUO95eFvWfNJxI07tqZdewkAFx1Ox/jhZCne4mukU5Dlbc0X2NumFHVd4+Wjmc8AVwuWDemXVhw4TD/NaWx8cDIuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfXKO2NhFlWRQqlHraCzzs8rGqTLuiUTlr7R3AhkKG0=;
 b=Af83ce+H/sbOGjx6tUEF1ks04Jv5RCGhPFrPnIfdFXJmnSGImd7vzSzQdA8YSeeOi+LbPWWmXLNq6b5cr6z//eXu3JGlVG6Mf+8HHJVP1dqv0fSu/ZQB/fN7hajkjVe/6msgOKbY7XBsFZAx/z6OKRRCxEcwQLT4/rIZW2mBIhI=
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com (2603:10a6:10:3d1::9)
 by AS4PR08MB7503.eurprd08.prod.outlook.com (2603:10a6:20b:4e7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 22:55:40 +0000
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90]) by DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 22:55:40 +0000
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
Subject: Re: [PATCH v7 12/23] firmware: arm_scmi: Add support for boot-on
 Telemetry
Thread-Topic: [PATCH v7 12/23] firmware: arm_scmi: Add support for boot-on
 Telemetry
Thread-Index: AQHdI5s0wiC1ByUz9kSvmvGHYg7d3A==
Date: Mon, 3 Aug 2026 22:55:40 +0000
Message-ID: <027AD7B7-EC61-4A08-A3FF-2192F592C342@contoso.com>
In-Reply-To: <<20260802145618.1952804-13-cristian.marussi@arm.com>>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB8651:EE_|AS4PR08MB7503:EE_|AMS0EPF000001AE:EE_|AM7PR08MB5400:EE_
X-MS-Office365-Filtering-Correlation-Id: 936995fd-3c9a-4628-70cb-08def1b2e77e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|6133799003|38070700021|18002099003|22082099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info-Original:
 sbMPZv6y1R7wqWebRDLYw3YkRhcN9so6qtowBehs+GdpmCiaNlpKO8+iX9y9MhOk+UMPR0BWCtk9aMaVv02cIIhcPNglnNy/m48IBcv2Hy0aKhqINx831ikClBvaC0o0DoWiUKEaXBHFBLmi8Uo5rbzPfxhA2Ie+ygunVPJfmFt+oxTHu+hxw4WCgJU5fcbbn66ENk9NsQ3TGEC0vSZ34YM3vYXc51HchBgxpMdIEbSIuA9ViNvB9KxresODLH6a8CeRGusEVsOH6f63K8PnRcrTJHslggXF+oKROjIXdg9tggcHB2RHHtS6pUeq5IXMlPPY7rleaNo3jB1VqDr1DdnXS18JKLeD+biOEYFp1I4R4D4jykxWIKcfpomIcu/06RKi4v6anDpHDgO2gUDkqLcSgYLrugtZ0WWsGGF2jQisYIliVZ6OVlYqoih8Ux2Xr4E2Pof/p+9Cs4SGueAlPfW0L6RmjuFtKy++hGl8o+EBMT0vKuoRdx897aPzUZGs0Q7Z1rdCuNWXQkXk1g9+8Sraq+PUVdV7dNYx7rZt/i3416mxi6C0MMJRifsq1+TCKzLxCeFlcYuhNqcgL6H9BEt2neVGLEbTG2oocf0UibL8YRYIuhHkFKUsJ63AYwrExrHD5KzaL1npRDScQUb5cEtSDJwkTBY9V3aUTQfPHIIIHBhbu3TL1ORQOPTavq5Yr/rEyqD2VazxDOy9UE+gbmejKaxU0AFlTMesnGzb/W8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB8651.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(6133799003)(38070700021)(18002099003)(22082099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B57D096A1E1D9742A97339574C51DC6A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 J0QT5qLPM4aG7uGOdJiFay/QwrumrPfQevs8idtceFGuWJPOH0jXruyeDEKMkvK87nB7TZE5Q3rZ9MA4P2QFL607qiB/BtAPchz1BcpulZyeP8p6ZHD3TgRN9rgqpncIcEYQ7NACQ8fxL8cDTnJQ5wAr5Zot4w8ilp45YjKvmWJcB4l9LgZtUcH699Fe6m/EJWMb9BDoeXH7y4UgFpIs690DvP+s3cj2ULqB7KTsTpzo8Vh+KwgNmbNvFaLbbj90fV7sB8mdwN+0W7rPC3DwrwB6XDL4d6maeDBvyC0c7iBaOIZLHyImZb0s1jNNWL8qapyR6z1NTWs+vV77UsWIOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7503
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2233ea79-950f-4c23-810c-08def1b25745
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|7416014|376014|1800799024|35042699022|14060799003|82310400026|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	wk0iMxPOSrwJCIxZMTfBUfW6ZUd5Q3Jqltg0RpFIZc7YoMC8ET3D2O2HVv9hTSKuOYZWJmPshJFF/kqzImiJ27tQWuJDPZk2PlBjX5Ho20l7nPmh1WSK+XF47aP1HXDgEQNpBlrQ2qbwbAh8Ey7tjAivTiwaP+gF0V3Q+BXictUWmjs0Q0bikZQW1a+C7O4Rf3ywP24/vTnb4FOOu+TTbsVE+t03l+41V3O6zDwXCpSIotqDPb033+ZcGEDEpV1OE2ph5wz2dKawM6TlHVKF9QIy7+azdfVAqCXBivabxkOTgElCPs3X0OtCylb4ZeAIJ1o7Sg2sLcuLvq0M/q16cHDHgEeAcfUwe7JRwGLthlWevEmDwYGBuuKst44lRImzWKCNx9IYxR8Af4rKUilh/ddaqhaTDMOdM4kEJIrek8C6QlHX8zymu35+Vm1iBLbKbTSlTPz20aqD6vWQ2Rf8y3LeqtDvrVzFc0Xl4bRIGOtwVqcP1+fnFVB8AHEumm18Xpk4BSslzUiwh7z6S/7c1pTdJGzQedsVM3Hjr6oz/6/HFRtu8v0K+rpjs8xi7Miv5JylcXCsyrWzaDnPz2heCPyv/M31wxmAkzR52+u62K/pkNMkM1afCd8u6qUmKhZrvJJcg3tP6Hr3PChPqhF5136KvcVpGkCFykIVAcgRvr+kTyR8/76ATawlkN6lAPmbzi7My2QQ+I3N4OMEqTg9fA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(7416014)(376014)(1800799024)(35042699022)(14060799003)(82310400026)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Rm+JYtHbhA+PpR4iQUPtgXRi5cNXJ85aSmE02z61/pj6gIv5Vh1puHNVGXRv+l8B9x5Am//iagg8jmbzY4MAOttKs58sgSMuPGg6MntKfdnBqtqdIDCVVA7pQ5w1mESFTiV56dDTjV7UQJ79xpE1Cfxe8acFnV8Tu9GQS3PrUPt7IcrlQQd1RyK/NztvQhdTgcAneEiJQxQCSPZeelJ3WyyjCB3S1QFin4/fiUNCVhGoNIZFIW4vZicHUpCPMBLVsq46f0f92F6Axf1E4GAvKVwwNk7TN0xoyvgFRXLNWSkdYgw9rVcV5EA/Zm1pNUou7pGNUxkZG2/JtXHXXRVF0eeJhyb56hLnAAGTUZbR7B0OJtwJs7oKHZsQIpI7dBLapDhmxR6yope1rmi5pOPCnyFeseHDSWBbAsofgfPhyNNk8GRhDgCeGFHrG5HBs7yl
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 22:59:42.2636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 936995fd-3c9a-4628-70cb-08def1b2e77e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5400

SGkgQ3Jpc3RpYW4sDQoNCk9uZSBlcnJvci1oYW5kbGluZyBpc3N1ZSBpbmxpbmUuDQoNCj4gCWZv
ciAoaW50IGkgPSAwOyBpIDwgdGktPmluZm8uYmFzZS5udW1fZ3JvdXBzOyBpKyspDQo+IAkJc2Nt
aV90ZWxlbWV0cnlfZ3JvdXBfY29uZmlnX2xvb2t1cCh0aSwNCj4gCQkJCQkJICAgJnJpbmZvLT5n
cnBzW2ldKTsNCj4NCj4gCXJpbmZvLT5udW1fZ3JvdXBzID0gdGktPmluZm8uYmFzZS5udW1fZ3Jv
dXBzOw0KPg0KPiAJcmV0dXJuIDA7DQoNClRoZSByZXR1cm4gdmFsdWUgZnJvbSBldmVyeSBncm91
cCBjb25maWd1cmF0aW9uIGxvb2t1cCBpcyBkaXNjYXJkZWQuDQoNCklmIGZpcm13YXJlIHJlamVj
dHMgb25lIGxvb2t1cCBvciByZXR1cm5zIGEgdHJhbnNwb3J0IGVycm9yLCB0aGF0IGdyb3VwIGlz
DQpzdGlsbCBleHBvc2VkIHdpdGggemVyby9kZWZhdWx0IGNhY2hlZCBzdGF0ZSwgcmluZm8tPm51
bV9ncm91cHMgaW5jbHVkZXMNCml0LCBhbmQgZW51bWVyYXRpb24gaXMgcmVwb3J0ZWQgYXMgc3Vj
Y2Vzc2Z1bC4NCg0KUGxlYXNlIHByb3BhZ2F0ZSB0aGUgZmlyc3QgZXJyb3IsIG9yIGV4cGxpY2l0
bHkgbWFyayBpbmRpdmlkdWFsIGdyb3VwDQpzdGF0ZSBhcyB1bmF2YWlsYWJsZSB3aGlsZSBwcmVz
ZXJ2aW5nIHRoZSBwYXJ0aWFsLWVudW1lcmF0aW9uIHN0YXR1cy4NCg0KVGhhbmtzLA0KRmF5w6dh
bA0KDQoNCg==
