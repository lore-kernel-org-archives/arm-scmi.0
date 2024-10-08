Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2078.outbound.protection.outlook.com [40.107.241.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF1D24B26
	for <arm-scmi@vger.kernel.org>; Tue,  8 Oct 2024 02:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728355411; cv=fail; b=bxphu98GjiL9vVT7VR7dK+u+yEC+/JD5DwrvN5ZUmFJvWre4dhoe2IMo0fJrn8gGxZR+GI/uwcE2/TW+THi1TVmfvZX4eiIJWbRnnR0UcyzqcM++ovzxG00LkAGRFVIr6wE+3EzVjypkS77Fws7s0wVqmEEm6KdATvnSxYP2mEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728355411; c=relaxed/simple;
	bh=BD/AbQOOJSN+3RVFwdcDoCyEOI8l1HAP6Pc54rj1fkI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=f52xgasfWhVlKkihT83HsFEIKcTELxdLAB10xlSHFUdH7BH0kkf36e7mmwVo0n9bNrOlA9aE7OzyX8TLaid9TuTCVcJ2e84C5ZAaHL/lqEUOLnkgwwi2023Q055qphMOnwaZLbJfHzmt0IFCGtJH6lZJPGgJ3W63cZCGNGyoDos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FRROjPif; arc=fail smtp.client-ip=40.107.241.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FRROjPif"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aSQX4PUxf6091a9krK8jYAKQ4/MCgix8h5LWprHN+rB3s1nlaJk/QN/LPmzF/UaLTNwx6t/ceXKNFTmzeQp8c/KAvH7mm3DfU1P8L2hUA5qqKUJA9C9tW1XMfRvCYMaJia9wR4hlmGBe0vrl23+v0n/HH574oaH0IxKqmnrziybrIjEkyxgR841h1rKPXFNdeTrmh7vo+YcO1Hb/OnuJ//0jpNsfgg5/9iPZofx0AAw085qZp+pCsIpDzwCnVkCvV33XG5X8vNJqYCI40JJX9vP1Rxjrq/2S+qABwGVQ2cVpZghPT0eKXQBb2J/oHngcJEfOQc1jTb7hop2KwzygEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BD/AbQOOJSN+3RVFwdcDoCyEOI8l1HAP6Pc54rj1fkI=;
 b=kYvfJx+QPqYKb3ozoWsSTXg24eR3Xg6oVWp5MdwX4f3uwPxQ0sbgkPETLKkkjW5RoVunLH6WIO8UBpamka8YjSwDD56eDh83E++/2I3fNDzWwmqP1tIkMI2kCGUYyiagZjkND/WmWTlLPAK2Xs939xd2mXllvup7JBVfTB2cgJVhUXsEGdHPZkv8Kyuc7odHAokXUBzVOQdRxyIA8EH7YDq0aGg2VVchFJZUm03wDDpHWaziEFvx7jB00VbWdpITJYVvZ7iX3PvKMaXdbWc7fpzC3BBY91O0F+A/X9xlymmRu3RnCysaI2gSWe4orSkTDSZFnQbJOvzbMHrMnBVPNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BD/AbQOOJSN+3RVFwdcDoCyEOI8l1HAP6Pc54rj1fkI=;
 b=FRROjPifnVOujF0HRhQ+wUZti4tQTIVFJ4lznYs5kA3mlwSTN0e/8Iye5EM/pS+5p8nhWd5SiCR/pr1FEy5zWrfH+6miTZFDIe40PfJpIox+BUs2EyQjfTs1Hkvyl4FRVY0E5yYhu5YEyJgkxQhT4qVOH20I95vDLZjz8MHZkK2iuC2WWhXtbBd99gL0kHKi56VZK+sngg2lgwalUqsRyNZAlKovjVow5xKkWytTw/BGJuQTmZc36TiNtFFFzXE+BwEPTGTYRo8adoBhFuyT8BjQYXNAaKDJOPqQ2RlTWZ0r9xptlFz1a9K9aF8JCD31TX2B5YV70OnCemDrrzDQ1Q==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8827.eurprd04.prod.outlook.com (2603:10a6:20b:40a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 02:43:26 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 02:43:26 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Justin Chen <justin.chen@broadcom.com>, Cristian Marussi
	<cristian.marussi@arm.com>, Sudeep Holla <sudeep.holla@arm.com>
CC: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"bcm-kernel-feedback-list@broadcom.com"
	<bcm-kernel-feedback-list@broadcom.com>, "florian.fainelli@broadcom.com"
	<florian.fainelli@broadcom.com>
Subject: RE: [PATCH] firmware: arm_scmi: Queue in scmi layer for mailbox
 implementation
Thread-Topic: [PATCH] firmware: arm_scmi: Queue in scmi layer for mailbox
 implementation
Thread-Index: AQHbFqqVH8N+NRacaEmFrzsgXw2G9bJ7RXcAgAAB14CAAFB5gIAAkJlQ
Date: Tue, 8 Oct 2024 02:43:26 +0000
Message-ID:
 <PAXPR04MB845987450029059DDF5DE4C8887E2@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20241004221257.2888603-1-justin.chen@broadcom.com>
 <ZwPcSmRpTGrCdt6I@bogus> <ZwPd1Z2jl0A46hEU@pluto>
 <1ad5c4e9-9f98-40ab-afa4-a7939781e8cc@broadcom.com>
In-Reply-To: <1ad5c4e9-9f98-40ab-afa4-a7939781e8cc@broadcom.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM9PR04MB8827:EE_
x-ms-office365-filtering-correlation-id: 55aec23b-2cfb-480b-1df8-08dce742fbff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bnFWbFcyVnAzcDJpNFhPUW5SaUFTWEJxRGE4NDlPVXY5MHZaOTNKUnZYQmI3?=
 =?utf-8?B?N1UxT3ljQWI1a1gyTXhXUTkrL2NxT0NjaVpOY0lCQlB6RGt2VHNtRVhwNGFJ?=
 =?utf-8?B?UFZLbW1SMXVyRmJTRGREK3NzcVdEM2VTaEl2aitXMWFGUWxib3lCZDF2akJB?=
 =?utf-8?B?emdBQWdTcEFUWFJWVHRYV1dOOStwbkM3c2QwMkQ0dzV5YnlPNkxrd3pZUzY2?=
 =?utf-8?B?citNd050ZjgzZ24wOEFIdkp4clJwT3ZJbFBRbEcwdUZuRjJlUUg1WDdOYmpt?=
 =?utf-8?B?VUNYVUpvRmIxb0RkaFg3RUlpWkRoMDlmRFZpb2lpenc0cU1YWVNPM2Fsb2pp?=
 =?utf-8?B?WWd3Z2krTWkxSnJwRVJmQVBoQmlSS0twYzRCVFAxRmVmSlJrYUhKaVlTOGtF?=
 =?utf-8?B?Z2J2ellhVk8zTDh3ZHQwWVA4eThzeFQzRlFqL21Yc3ZyclFraEFObWM1RTNk?=
 =?utf-8?B?bUJtc3JQaVRIL2xDL0hCVTd2TFVOZ0tjTVdqZE84OC83Z0dWeWsyaGQwMTcx?=
 =?utf-8?B?UlZ1QmFHcmR6S3pKVHY4VC9pc1dzMkdMQTJLNUhwZE9IS0dmdW10d1laaHpv?=
 =?utf-8?B?UFMvUWxwc3FLV1NkNVF5RjR0ZXIva0gyM0Y3QVFJUzdOTi9VSW9hU01WNERl?=
 =?utf-8?B?Z3VIZ2QwSGh4QU1DQlJZV0YxclA2ODI4SU11L1BtcWwxbDVEcGQwWkl4Wlk4?=
 =?utf-8?B?NVMrSTVmRmdia1Qrc2RvalBqZEVFZmJ3VnI0c1IycXgweHlGU045SG9PSklC?=
 =?utf-8?B?Rkxid2NBN2xHTHkzRWFTMWtqT3krTU55YTFlSlNMSmp4QnkwelJVQmJ6ZVQ0?=
 =?utf-8?B?ZEMxaWIwU1R4S25TWVZxUHNzZDQ1NW00L0YxcElqbDVla2JzU3VsaEFqcmtK?=
 =?utf-8?B?Snk1ank2MkczNTZxUlVIUmFwcllmRWdCWnBVUVo1dnMva2tPYVpJZTNycE1I?=
 =?utf-8?B?aVRma21lczB6engyVm93QU5tYXJLUms2U0pUbjY4YW4zcXVpRzByd2lQd2xX?=
 =?utf-8?B?cmhHRkUrMklKMmZ0eDUrQ01SWk5HS2FUR1l5aVptdmZNanl3V0luRnBPYjlT?=
 =?utf-8?B?MzExbDhqUno3OFlOZFRMNlUyNFpqRi9GK1BNQ0I2akRYRHpJYlFXZVJXcXg5?=
 =?utf-8?B?cHl1bEdTYXFjbG92cjQwTjVDaTJDdHk4SUtMZDdkc3ZzMUduc2RmTnF5Sk5F?=
 =?utf-8?B?ZEFoUUIvbmlJRmxkRGE2YzBPaGlaSWV2cVFIVHVYc3cxMVk3QjhMNEQrNkwz?=
 =?utf-8?B?Rms3TDh2ZDJPUlNROXRRc1RxS1EvTHVzTFdReVl1ZHp5UXp0b3l4RmQrb0Fr?=
 =?utf-8?B?NmtmSGZhSkNTdXVudjFGT2VDRExDam94Z29XRkd0NzhoUUtNdTk5S2h0VHBq?=
 =?utf-8?B?UVdLRmdaM1FYamM1MjhQcW5JZ3NOUE5vSjRqeU1VYXZsRXY3OEpzQ1poQVFY?=
 =?utf-8?B?REJvdWIvM2lTQ3RUc0lHTW0wU216bFN6ZTFRTStmODBmZWFwWEJBejFIWXZm?=
 =?utf-8?B?aTZURG5XSTRvaHo2cnMzSFROeTVVSlFkZFVaMnRQS2VhUEQ3S011S05KbTc3?=
 =?utf-8?B?dHBOUjh3MHJOVkNjMGFrZG1hMmRCZTdudVdwRXdDWCtINm1GS2VTekd5aGh1?=
 =?utf-8?B?TzFQTVVOSUFiV25qKzg5YWQ0am1aeW0zYWZwVkhVb1YwZlBWV29ycDJKNjlT?=
 =?utf-8?B?MFlqYjVxTktKc00wZTVSVXFtQlp4TkxQazZGS2x3YXZ4YUEwd2dGYnR6ZWFB?=
 =?utf-8?B?MUd4SWlocjI1Z1pDdEp4eXBwT1ovSVBZekdMVHF4S01ZNHFqUjhPOXVOdmRt?=
 =?utf-8?B?Z3lvaGRVTFhSTnEyMW9Rdz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TWZLRmp5VVJ0WXV1WHFuZGhYYTI2dHpJekFLVG1pMGZIOG41eXFqaVhncVQ5?=
 =?utf-8?B?WGNYR2lwZjdFUDE4YzVpcjRCeS9NTERJbWtuUVJEYkJzRGtRcnppV1ZxdXFh?=
 =?utf-8?B?MzF6T3dUeFVxM1NUdzFyZ3Zaa1ZBZnJZRG80dFJFSTdDVzB1cFZzS0VNWnRH?=
 =?utf-8?B?RzZDSzZWOUlkaHhxWEl5NWtmelhPdENndGR1Y0ZKeDhmNzlpdW1XQmFTZ3Bs?=
 =?utf-8?B?YnFOaHdkZjcyYkxaQ0ZaZjRnOG8vbzN2dUROMWx3YkJVelAvNjdqb3lRQVFT?=
 =?utf-8?B?VytvYnVRZXIwZFNqc0JuN1JqTEcydHdTN1l2WkpVZjMzbGNjV1pMNkEzTHlN?=
 =?utf-8?B?ckd3MVV2UU11aWFOMUNsdXJXTTl0MlBtUXN3Q205UThJYndka3VqSTVqKy9l?=
 =?utf-8?B?T0xUWVRrdFJqVXE2SHgvaWFoUEJlMGNEZlc4SjczdDBJWVhqbE9aeWpFMloz?=
 =?utf-8?B?bVp6cGl4TS85NnFCRWFxbmFRdFVnOGtaQjBWemxlVStCTFlqTkNRTW1QT3lO?=
 =?utf-8?B?eG9WeW5JWGgrNzNHNjJ4a1E3RmU4YklLN0xyZHJSekF4bGJwTm5ycDJ3VkZZ?=
 =?utf-8?B?Y1B5RWVQNnA2WjNFbGVrNENsalBWdStCM1JnYXBEaHVKQVRRalZCdHl3MXFx?=
 =?utf-8?B?N24ra3djN0RDdmQrcXVkb090TVZXY1d0Ykg0dkpmMUVYSExkczlxZ1paekt1?=
 =?utf-8?B?LzI3R21LMDg0U1VETENxM0ZjdUVHVG9qcHFBM2ZDODIxMU5LSFdtWER0S1ZX?=
 =?utf-8?B?blRVVThmOUtmQmlxcXdWVE5ycUZLVUl4bk9ZT0JaNklhWlhxRUF2UjB1Qnpm?=
 =?utf-8?B?WC9tYU9DVDFIMWczeFpYcXhxN005aVhCTUlpdzFISVpibC9Ba0pSSUZGaEFr?=
 =?utf-8?B?K3U1djUzeVIxNkVuQzR2TGtFdTgzYnVmeXl2MDhqTkRJbUNreHFnMUJrTlgv?=
 =?utf-8?B?bFRDeStwZHlKTzIrS01sSlJxNjN2bHhSTjBzSjFWYnlPanc2N3QzdnNqdis2?=
 =?utf-8?B?UUdsRDk0U3F5SVRnMW5hWmx0cGVPUVdTUW01OW5PamttbnFqa2dvL3BiWTI0?=
 =?utf-8?B?OGRJRjZwQm5CelBzdEJ0UGVvTHg3elVNU2tLY1ZFSENLVjJpMlI1QjZSUlJz?=
 =?utf-8?B?Vy81L1VaZSt4S25RMUFLR3RBY29UbEhFYUFUNzg3U01jZXU4ZGdVcjNTQ0l2?=
 =?utf-8?B?MXRZcEc5OTVid3pSQ0R5b0t3VlhPcWI5T1A2VjZ0UzNOZWQyRTMvRVBMZ1hU?=
 =?utf-8?B?bFVlWm5lZ0lmSDZGVHgxaGE0cGhGZWx4NXB6b0c2QTFRc1NjMTR5ejZsTENa?=
 =?utf-8?B?VlVTZkRHWnpHamxPMDBERnU5T3llU2pKS0xFTFFqTWtheVcvRUR0UjlsNnNL?=
 =?utf-8?B?WHZ5TUZLVitJcERDTjRWck0raXJTQWJ0TVBlZFp0R2E5cm5NVEExZHVZeW9s?=
 =?utf-8?B?MER3U2dGMzdKbHlocmFzS3NYVDBDSjFEOWtaVmVvODJhZWVLMG9Ec0ppWjJt?=
 =?utf-8?B?dW1EeW0wOUdleEE3bmpBVlRGSHczTkpmWmNVamsycXVxSWJCK2VwSHpIOWFT?=
 =?utf-8?B?cFhCLzB2aEQyS1JDZ1JnWmNhMWhPTEp3ZEhYcENTc1JsRkYyWGFaNEhObnA3?=
 =?utf-8?B?L3dmcUtCd1JvRzVIRjlBUzF1V0RqbDFrSXQ5dG5vVm1RZ3dEVjJ6ZHQxTkJC?=
 =?utf-8?B?ZU51cGFXTVZza1lYSVZBWFVrcFU2WE5ZQ0dIajVwY0VvUk0wT2htdldGNVdZ?=
 =?utf-8?B?TmRIQTBqZG9VYWxrUEFkeHNSMnhtWW1wQmRQQzNWWDBkdXpNSFk5cmtmVndX?=
 =?utf-8?B?MjZzWWlEWVVrbGlZSCs3clNKdmJkejVlTWlydVBrUDMxeDMxRm1SblBVUmNh?=
 =?utf-8?B?MU4rbGV3UWxKSzM3NEQyR0EwZTZwc3BtWVltcTUvNHBXVzZUV2s1M1hPYmxt?=
 =?utf-8?B?NDhhRUZ0VktpZTMvVzY2YnJBeDdCMG9TSmdwc2s4UTl6bE5KaXovalMrcjlB?=
 =?utf-8?B?bCtRa0cwRFp1Z2p0RGF2U0lsaHluMnRXTS9Qamc4cFBFSDU0WDRnaU1LN0pw?=
 =?utf-8?B?TUFHamwxVklDemdDbHZRQjZrSEJjREEyUVh6YlFLcmhqL3R6NGtoTHRJVkRt?=
 =?utf-8?Q?Cxxs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55aec23b-2cfb-480b-1df8-08dce742fbff
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2024 02:43:26.1181
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v2DVYJOxUwRH2AOZUy83ND/gMoJwsfp7+dg5KW6RDGdGIT2y66X/d3tm3gd1H7owf86U538v8VpgsgrMt2QZ/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8827

PiBTdWJqZWN0OiBSZTogW1BBVENIXSBmaXJtd2FyZTogYXJtX3NjbWk6IFF1ZXVlIGluIHNjbWkg
bGF5ZXIgZm9yDQo+IG1haWxib3ggaW1wbGVtZW50YXRpb24NCj4gDQo+IA0KPiANCj4gT24gMTAv
Ny8yNCA2OjEwIEFNLCBDcmlzdGlhbiBNYXJ1c3NpIHdyb3RlOg0KPiA+IE9uIE1vbiwgT2N0IDA3
LCAyMDI0IGF0IDAyOjA0OjEwUE0gKzAxMDAsIFN1ZGVlcCBIb2xsYSB3cm90ZToNCj4gPj4gT24g
RnJpLCBPY3QgMDQsIDIwMjQgYXQgMDM6MTI6NTdQTSAtMDcwMCwgSnVzdGluIENoZW4gd3JvdGU6
DQo+ID4+PiBUaGUgbWFpbGJveCBsYXllciBoYXMgaXRzIG93biBxdWV1ZS4gSG93ZXZlciB0aGlz
IGNvbmZ1c2VzIHRoZQ0KPiBwZXINCj4gPj4+IG1lc3NhZ2UgdGltZW91dHMgc2luY2UgdGhlIGNs
b2NrIHN0YXJ0cyB0aWNraW5nIHRoZSBtb21lbnQgdGhlDQo+ID4+PiBtZXNzYWdlcyBnZXQgcXVl
dWVkIHVwLiBTbyBhbGwgbWVzc2FnZXMgaW4gdGhlIHF1ZXVlIGhhdmUgdGhlcmUNCj4gPj4+IHRp
bWVvdXQgY2xvY2tzIHRpY2tpbmcgaW5zdGVhZCBvZiBvbmx5IHRoZSBtZXNzYWdlIGluZmxpZ2h0
LiBUbyBmaXgNCj4gPj4+IHRoaXMsIGxldHMgbW92ZSB0aGUgcXVldWUgYmFjayBpbnRvIHRoZSBT
Q01JIGxheWVyLg0KPiA+Pj4NCj4gPj4NCj4gPj4gSSB0aGluayB0aGlzIGhhcyBjb21lIHVwIGlu
IHRoZSBwYXN0LiBXZSBoYXZlIGF2b2lkZWQgYWRkaW5nDQo+IGFkZGl0aW9uDQo+ID4+IGxvY2tp
bmcgaGVyZSBhcyB0aGUgbWFpbGJveCBsYXllciB0YWtlcyBjYXJlIG9mIGl0LiBIYXMgYW55dGhp
bmcNCj4gPj4gY2hhbmdlZCByZWNlbnRseSA/DQo+ID4NCj4gPiBJIGFza2VkIGZvciBhbiBleHBs
YW5hdGlvbiBpbiBteSByZXBseSAod2UgY3Jvc3NlZCBlYWNoIG90aGVyIG1haWxzDQo+ID4gcHJv
YmFibHkpIHNpbmNlIGl0IGFscmVkeSBjYW1lIHVwIGluIHRoZSBwYXN0IGEgZmV3IHRpbWVzIGFu
ZCBjZW50cmFsDQo+ID4gbG9ja2luZyBzZWVtZWQgbm90IHRvIGJlIG5lZWRlZC4uLmhlcmUgdGhl
IGRpZmZlcmVuY2UgaXMgYWJvdXQgdGhlDQo+ID4gcmVhc29uLi4uSnVzdGluIHRhbGtzIGFib3V0
IG1lc3NhZ2UgdGltZW91dHMgcmVsYXRlZCB0byB0aGUgcXVldWVpbmcNCj4gPiBwcm9jZXNzLi5z
byBJIGFza2VkIHRvIGJldHRlciBleHBsYWluIHRoZSBkZXRhaWwgKGFuZCB0aGUgYW5ib21hbHkN
Cj4gPiBvYnNlcnZlZCkgc2luY2UgaXQgc3RpbGwgZG9lcyBub3Qgc2VlbSB0byBtZSB0aGF0IGV2
ZW4gaW4gdGhpcyBjYXNlDQo+ID4gdGhlIGxvY2sgaXMgbmVlZGVkLi4uLmFueXdheSBJIGNhbiBk
ZWZpbml0ZWx5IGJlIHdvcmluZyBvZiBjb3Vyc2UgOkQNCj4gPg0KPiANCj4gSGVsbG8gQ3Jpc3Rp
YW4sDQo+IA0KPiBUaGFua3MgZm9yIHRoZSByZXNwb25zZS4gSSdsbCB0cnkgdG8gZWxhYm9yYXRl
Lg0KPiANCj4gV2hlbiBjb21wYXJpbmcgU01DIGFuZCBtYWlsYm94IHRyYW5zcG9ydCwgd2Ugbm90
aWNlZCBtYWlsYm94DQo+IHRyYW5zcG9ydCB0aW1lc291dCBtdWNoIHF1aWNrZXIgd2hlbiB1bmRl
ciBsb2FkLiBPcmlnaW5hbGx5IHdlDQo+IHRob3VnaHQgdGhpcyB3YXMgdGhlIGxhdGVuY3kgb2Yg
dGhlIG1haWxib3ggaW1wbGVtZW50YXRpb24sIGJ1dCBhZnRlcg0KPiBkZWJ1Z2dpbmcgd2Ugbm90
aWNlZCBhIHdlaXJkIGJlaGF2aW9yLiBXZSBzYXcgU01DSSB0cmFuc2FjdGlvbnMNCj4gdGltaW5n
IG91dCBiZWZvcmUgdGhlIG1haWxib3ggZXZlbiB0cmFuc21pdHRlZCB0aGUgbWVzc2FnZS4NCj4g
DQo+IFRoaXMgaXNzdWUgbGllcyBpbiB0aGUgU0NNSSBsYXllci4gZHJpdmVycy9maXJtd2FyZS9h
cm1fc2NtaS9kcml2ZXIuYw0KPiBkb194ZmVyKCkgZnVuY3Rpb24uDQo+IA0KPiBUaGUgZnVuZGFt
ZW50YWwgaXNzdWUgaXMgc2VuZF9tZXNzYWdlKCkgYmxvY2tzIGZvciBTTUMgdHJhbnNwb3J0LCBi
dXQNCj4gZG9lc24ndCBibG9jayBmb3IgbWFpbGJveCB0cmFuc3BvcnQuIFNvIGlmIHNlbmRfbWVz
c2FnZSgpIGRvZXNuJ3QgYmxvY2sNCj4gd2UgY2FuIGhhdmUgbXVsdGlwbGUgbWVzc2FnZXMgd2Fp
dGluZyBhdA0KPiBzY21pX3dhaXRfZm9yX21lc3NhZ2VfcmVzcG9uc2UoKS4NCj4gDQo+IFNNQyBs
b29rcyBsaWtlIHRoaXMNCj4gQ1BVICMwIFNDTUkgbWVzc2FnZSAwIC0+IGNhbGxzIHNlbmRfbWVz
c2FnZSgpIHRoZW4gY2FsbHMNCj4gc2NtaV93YWl0X2Zvcl9tZXNzYWdlX3Jlc3BvbnNlKCksIHRp
bWVzb3V0IGFmdGVyIDMwbXMuDQo+IENQVSAjMSBTQ01JIG1lc3NhZ2UgMSAtPiBibG9ja3MgYXQg
c2VuZF9tZXNzYWdlKCkgd2FpdGluZyBmb3IgU0NNSQ0KPiBtZXNzYWdlIDAgdG8gY29tcGxldGUu
DQo+IA0KPiBNYWlsYm94IGxvb2tzIGxpa2UgdGhpcw0KPiBDUFUgIzAgU0NNSSBtZXNzYWdlIDAg
LT4gY2FsbHMgc2VuZF9tZXNzYWdlKCksIG1haWxib3ggbGF5ZXIgcXVldWVzDQo+IHVwIG1lc3Nh
Z2UsIG1haWxib3ggbGF5ZXIgc2VlcyBubyBtZXNzYWdlIGlzIG91dGdvaW5nIGFuZCBzZW5kcyBp
dC4NCj4gQ1BVIHdhaXRzIGF0IHNjbWlfd2FpdF9mb3JfbWVzc2FnZV9yZXNwb25zZSgpLCB0aW1l
c291dCBhZnRlciAzMG1zDQo+IENQVSAjMSBTQ01JIG1lc3NhZ2UgMSAtPiBjYWxscyBzZW5kX21l
c3NhZ2UoKSwgbWFpbGJveCBsYXllciBxdWV1ZXMNCj4gdXAgbWVzc2FnZSwgbWFpbGJveCBsYXll
ciBzZWVzIG1lc3NhZ2UgcGVuZGluZywgaG9sZCBtZXNzYWdlIGluDQo+IHF1ZXVlLiBDUFUgd2Fp
dHMgYXQgc2NtaV93YWl0X2Zvcl9tZXNzYWdlX3Jlc3BvbnNlKCksIHRpbWVzb3V0IGFmdGVyDQo+
IDMwbXMuDQo+IA0KPiBMZXRzIHNheSBpZiB0cmFuc3BvcnQgdGFrZXMgMjVtcy4gVGhlIGZpcnN0
IG1lc3NhZ2Ugd291bGQgc3VjY2VlZCwgdGhlDQo+IHNlY29uZCBtZXNzYWdlIHdvdWxkIHRpbWVv
dXQgYWZ0ZXIgNW1zLg0KDQpFYWNoIHhmZXIgaGFzIGl0cyBvd24gY29tcGxldGlvbiwgaG93IHRo
ZSAybmQgaW1wYWN0cyB0aGUgMXN0Pw0KDQpSZWdhcmRzLA0KUGVuZy4NCg0KPiANCj4gSG9wZWZ1
bGx5IHRoaXMgbWFrZXMgc2Vuc2UuDQo+IA0KPiBKdXN0aW4NCj4gDQoNCg==
