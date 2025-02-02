Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2078.outbound.protection.outlook.com [40.107.241.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8362C1D6195
	for <arm-scmi@vger.kernel.org>; Sun,  2 Feb 2025 11:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738494517; cv=fail; b=TbSc+I2UKsvCxf1i1U+Fe9YL01oaPaQgmHiNpKljlIGyDiEe95P96+T4eKrvE/nX7g7kSeXM47tIEeVB3v2ZjYjW4uVBCKGdiMWqJEcKhDe4HCOmmJlQAK0zik+Amgd0/uwS3qPd/HJAbGgWgbYcKOqfbryYqz+A5J3yjGxURk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738494517; c=relaxed/simple;
	bh=E6n+e3W/WRGxiCKVN1PIjYsfwOHZ9fIOk3R1a/gs+WE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DRA1mbvk5TISBM+k2shWYuaj8AyaHKt3nvbYRATlqgauBqMeMXMfVEJwao70nfeHf7LHIVle86fVQg0ryulzWbZ+PRrNCxCBANZhXdsJh/N3w53iPcEZannNb0YwDS/jHyCjTidS3zn0w/PYgXvuVTI0zMPTw+Sf3N0X3Y6TGI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eTPRUgT/; arc=fail smtp.client-ip=40.107.241.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eTPRUgT/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KOtTa8dYevq1+Ow3Qs8roH4Z/2NfCI1xNpLnFr/WKsfOI6MoVArAvIuztkouq7JCUIi6pLsHdZml0WxWNQr0N2if3m9czMagEXPjonf2FdRFYAPOH4YhRS1EsS3WRw2eqWvjANzICxcsBp6Xk0HfwJndUPzFNzHFzxz3d8hS3fcRshKLjnXZmUn+bCHqun4+xXFNz9AWN8VQzEDJgzJXbRNJv9aSZ9dYHcK/Mtxqr1dqsr17aGsDwNpV1wChiODh0SYc4g5gNA/BDMUWytYFrvoT8W88RfMZV2lqhgn6TWYKic+474q0fDqB6HEVr4WWKIZJnrbYDjw1ZhTUFoZyqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6n+e3W/WRGxiCKVN1PIjYsfwOHZ9fIOk3R1a/gs+WE=;
 b=pFHJ/JPVp7E/CrFdL2p1s2fYq4kcgJhXYcMGwzLuRVcYjEIZxXV+Kc6M/WBo5N7/dX7x+g0Z3X2LLcsXuNi/dz1PWVFndS9XHeNOf3RyRPRgBDSOeFJhXhPWrsXKu56w7WyLQ5fXg0aCVyP5kXVDW+hmorhus0zoh1/TWDDKv1Jca9jPsRaak7aHNmpG0n0BX+1vMyD+j4orIcnb0BhYS4q790NApXe1wscuG0uSeNWtr/ldEs5n7Bvxudv/xdq4xkiWDaSKuCs6x72t9wDrfrHcvwLUBYAZaV5Re+UMrLvrdp9nW2i6PMf/8+aDZ9pQtpFSIxgihtZ6ChmkxEQ17Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6n+e3W/WRGxiCKVN1PIjYsfwOHZ9fIOk3R1a/gs+WE=;
 b=eTPRUgT/nUpLvDmS5328t0Cr/mq3laS8oNDZqxXFvxkLIDsM6/9WrpRucLAr/AqrwkfAz4mEsPuPrTnnlMsiRT0qVk5kFXCEwa/lzHYQpCPus1Chp4bfKcc7q23zOBdNsINHRaJlWI0/ybuqJq6S1sYtriBqgv/CObP+nOJm18o7EF0ifLEeY9p1HESPMozLWwRw1EA9/08evQNXhwjRMaEJNMjai9MfAZHLJZ92csuE/XGcVp7eBTWWNNpbS0OwJFgNz/YyxPRBzZ6ZYBar6GvD6EikiW/A8h4BZG6rajfIqLTuYIFxhB1kIHPGVdphOHMdpDOilCMARuSfNWdWQA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB8646.eurprd04.prod.outlook.com (2603:10a6:10:2dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Sun, 2 Feb
 2025 11:08:32 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8398.021; Sun, 2 Feb 2025
 11:08:31 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
CC: Cristian Marussi <cristian.marussi@arm.com>, Xinqi Zhang
	<quic_xinqzhan@quicinc.com>, Guomin Chen <guomin_chen@sina.com>
Subject: RE: [PATCH 1/3] firmware: arm_scmi: Relax duplicate name constraint
 across protocol ids
Thread-Topic: [PATCH 1/3] firmware: arm_scmi: Relax duplicate name constraint
 across protocol ids
Thread-Index: AQHbc+sC/9PgRjsYh0m3polNR5pSXLMz3ZCQ
Date: Sun, 2 Feb 2025 11:08:31 +0000
Message-ID:
 <PAXPR04MB845955EC77F435D76BCE829D88EA2@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250131141822.514342-1-sudeep.holla@arm.com>
In-Reply-To: <20250131141822.514342-1-sudeep.holla@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DU2PR04MB8646:EE_
x-ms-office365-filtering-correlation-id: 2440ca6d-d98c-4445-bdd4-08dd4379ede9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?D4qaryJGqO7AN/kX26AFCkAYUYtKw6alaZ6I713O+9yB3nMt6aNqdZkN6jtK?=
 =?us-ascii?Q?WKUUQ0Eco6XyN4xEVr0o/kgqs22HfwKKwEukyg6U4YDTErYUKFx0CZqJKXb0?=
 =?us-ascii?Q?hIyJHUHFcef28qSE6nezJ8gWp5quDWXJdSX1KtueEOXUFa9EvFu6ns9qNYuC?=
 =?us-ascii?Q?uFsa9CoFfVvpiEAGRai19fAEoTNtRzzKBEAIqZCf1fIjmqjFbnNZJ8kg7+vf?=
 =?us-ascii?Q?jezlTDKTzflXIbBLnMepbfzfDklUiKqeVT5lDpmeiwbeiyJPQJ1XoeTBumNa?=
 =?us-ascii?Q?MsPnXT1yoKcXMfwAvSsJidrzjgt3ZGuEm/DrsZnaGme9FEpn8gqPNg8L8gvF?=
 =?us-ascii?Q?nOlVp4wqLUwDeFo/HuQ0TiEYXWiNs6fLsUa+abHVyYJiOpV6PjE93oEZVPpx?=
 =?us-ascii?Q?OgAIKPhYvwEJLRtE7WKZ/yOuWsRifd7eUz7iDxcRyEYJ7+mEkNUAnnikbnjw?=
 =?us-ascii?Q?uNs1Rv2reAiClsSPi/w3OLxaICi+lsSg1pJOS7kTsJHo0FdD6E5w+Fijibtq?=
 =?us-ascii?Q?X+EF9PgfXPB7tI2qnTWOncw0y2RkAdsFMi4wmmReMj6xyzyk2LWfUcaCqwcX?=
 =?us-ascii?Q?PaOg5Nk3SgzK8LyJ2gs7UGpaMCE9bczYFTbS/Qm3n3CFJo8VrK2Dtj6I5viE?=
 =?us-ascii?Q?0f2Nfs+xY0Gv48WDMLl3H50+anI8LfyzTVKT2UXhb+3ZKzAstKl7taGpLFJV?=
 =?us-ascii?Q?MnFyc4wLnB9ptE33dMqWNTeSsdp6EVIE/PStQzF6PAI79v67KrAaohqKt5pI?=
 =?us-ascii?Q?YGwX3Etpjbjs3ChWlGp+wLMIFSDcaW5ksHMHp9lF7e68rZtIgNCiDtEgoY8V?=
 =?us-ascii?Q?Zuwh2RMF83uo1c5BQyh95W3SUb6fLApQPTPPbAq5aqwsQsxaUTdDDibuDARY?=
 =?us-ascii?Q?BnU4oaFYFBQtxXm1RZS1YuqosCuHIV/adiTZZt3o/oWJ5eLe0IQvBJalD/RL?=
 =?us-ascii?Q?j7Pwm1/4thGFfd7aZQugM3/LOVbDMZw5e3f17yuQ4dDydPgI3Ay6T9oeWfYF?=
 =?us-ascii?Q?01BLDTjtUKoy5d0qMFhDRp4BnGRdi96nruQ/j9mJ1JTdN3skFoeyzFO49T9x?=
 =?us-ascii?Q?fTEMxiMxtVbDfFiWWk/Uqct8FyoNltMWVjwLuEC4cI4hkW6EVXgtDZD3X1qa?=
 =?us-ascii?Q?lLW0Mj3CkmLP0L202brZCVzLfCyRJuAyljREjcKXoqKETJWGcqWiLYgKZtTc?=
 =?us-ascii?Q?ZF1/S/b84RTofKgh7WGjnQciM9ULnlw1jas5gcmM6LvgU5ALf+NU+bhF32kd?=
 =?us-ascii?Q?HAxWnVOrU5n0yU39qDM5YA/jAY3ocLssrxe2bF4LpvT1DGZCCEPhuesf5U9i?=
 =?us-ascii?Q?VItSpzlG8kordqSRFMP9nNCbL/ThUEAv+Lfl51kDWRcCFsS3XXVWd7WJou7L?=
 =?us-ascii?Q?evjBqzyDBjqUZY8aRGH3KiHjQsdzB5dtZAca/ru4PyaGwjY647kFP52bUC9r?=
 =?us-ascii?Q?NZrtIDxE4grYTQVvoLB3enNTItXy/coB?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?C/gJo2A5pvNZj4ibZH0DM9Jff+2EnXWBBsUlWopXhChsBB0EpUz19g8eAMIF?=
 =?us-ascii?Q?zE/3OB8wkD/alHRgU/qBvs6X4f+DlGggqPpuqnc7DB4eUb5LCd/HbHqNipEO?=
 =?us-ascii?Q?0ZX9yn2tl2X7j6xzvhSPrJQb98gLWcirytUvaIqS6FBru/KqM2g+tZYkTKFL?=
 =?us-ascii?Q?ZKwHNEsjh7B38O2wLyugqecB2pG6PQVvvAbkCebgC1IcXsurzGzFVaQ9vTcl?=
 =?us-ascii?Q?HK2fWJIGGTc4XrAOD9usz9TXDUNy/7Qc4QIdw2vEJTKsPE9fnVeKUCtd8YjX?=
 =?us-ascii?Q?jjhcM3TGP4ZJpzFt7a8oXy9KPIz9FoLmaHFM/62RdVO5XNLz2JcqnAjZ2/X2?=
 =?us-ascii?Q?AWZaPmsQLrJXXigYvLJ2oWkV3WQ7k9x9xfjNW0HVxcICOh40wUjkse8g9FMU?=
 =?us-ascii?Q?Wxp9CV0gVNnP6YjlKOWmJs7kUXddy5gEIUMIY+fXiJl0WZu4vw22Zd6SnlDh?=
 =?us-ascii?Q?k679xYp8mDG6vijZgEOjNqICeXgI7cn8OX+Ec8KgPS/iU21Vv5EHna8kQfUh?=
 =?us-ascii?Q?85nq8ds5phaAcFJ44UzT9vQDn8vsEeubWlPhXcDcDLwaZ5nEhplKYXpInkWL?=
 =?us-ascii?Q?1l6BN47MFTmwF/9oQfrObqjmkq0g8sP7VPcwhJ4t03uFCn0m1ZHihQCBgZlZ?=
 =?us-ascii?Q?ojf9S1eb97H1IQ/vI3zsAGBrmqng7Ha5OwKzSmQkJnQwOkn99fby0gI9I/IR?=
 =?us-ascii?Q?vAAldIlnYZW4Kmq+oJpG+M8M7rLb4BjUVNZZCIq/JgIvTbwt3LXLdIHtRTln?=
 =?us-ascii?Q?bArXIh+hx6O8V2XmohDMFKBwFiEe6yKtQLxUfpgW7JLdjmFSYp8VE+zUJuND?=
 =?us-ascii?Q?caK+1L3JSz00SG6BKmcshizXKyrpW71p3SjMY9m72udRPUVU0xaxzC1oHnvx?=
 =?us-ascii?Q?uAWim1j90uJUNwFJzqYoOWbxk7guREQGhhINMVyx3Hp3JbhZOa9CRt/z7JKo?=
 =?us-ascii?Q?xMZPMoIffLK+D6uRCCypHJJZlw7Lc6mFvh2rQpz6NJIv3o+xuhfGbL3PSJ4y?=
 =?us-ascii?Q?3ieFCf4y69lNtzboevG2/tgYz0tiL38kjNYKhSJVbJCaCiPXihdSxa2Mcpv/?=
 =?us-ascii?Q?001SVr9X74lpcBXbDBwXd28dkPLJ0sp7vwN2rVGlYYiS4yt38axpp21Jr/1E?=
 =?us-ascii?Q?Mq/+3pvUY4BWpIVGpG/phnkXG4D18toEm0RSo5VOh57m0nOSIqHLGn82rzEl?=
 =?us-ascii?Q?7aVYwBjyrimv/X2sfUm6bXJnT0lJMalV9rIQKweW0EgPxSs5fYo24Td0C5w8?=
 =?us-ascii?Q?QTKaVHd+LFMwQIaGsMjR7ZT9AczzwtZCrMmmr29rYpRBZrZ5pNF+hvDgKlSo?=
 =?us-ascii?Q?kli2o3+qZyJmYQTeR6DQP1H5Jyw8h8sKkH160g4eNm+mdMrldqPoYUIF2K5j?=
 =?us-ascii?Q?a+vaL7V9ag+R8YS36JMoGGNwv+Z1zMh3eqJJBdQMtPTM+NoAUzqyY407WUyh?=
 =?us-ascii?Q?WUljW1K8Mu9vOkXgVtZFIPwaKTsjwXoQeR3twR8mY9pYK5RvB+We1eJpP3qw?=
 =?us-ascii?Q?KoqrjuSbSu5ltTF4/UPwQfepTVa7FFA0TO4nGAGtM2+LxxZgG6PPNsCChCT2?=
 =?us-ascii?Q?0cq8eY/qPEbBuOt0Vw4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2440ca6d-d98c-4445-bdd4-08dd4379ede9
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2025 11:08:31.7572
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OtR/kiqKPEnJGd7NAhBgqpVLUShOP4SrRE97YFboJy+6/FD8zkCKdsXUZnF1XYTpp6v/weE6guc9GzrSAl61wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8646

> Subject: [PATCH 1/3] firmware: arm_scmi: Relax duplicate name
> constraint across protocol ids
>=20
> Currently in scmi_protocol_device_request(), no duplicate scmi device
> name is allowed across any protocol. However scmi_dev_match_id()
> first matches the protocol id and then the name. So, there is no strict
> requirement to keep this scmi device name unique across all the
> protocols.
>=20
> Relax the constraint on the duplicate name across the protocols and
> inhibit only within the same protocol id.
>=20
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
