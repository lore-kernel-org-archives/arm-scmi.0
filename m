Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2070.outbound.protection.outlook.com [40.107.6.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8960190661
	for <arm-scmi@vger.kernel.org>; Mon, 17 Jun 2024 08:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.6.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718614036; cv=fail; b=RaV9NT5RQXClx89k2UL4PxSCJxQpHAH/Y1CsISI1NOO0kigAb7ncWi1T7aJ2KiFNRf98F1zBlSWkagS4kDpMuS0Q5/UDraDZ3ks2fFueC/v1qIbafaX7ncJHuOv2lTeq3MHQcKcUGPD7f+ruYdW9dMZeAajRqL1/TVusGQDlJGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718614036; c=relaxed/simple;
	bh=eKVCskMkGFstT2MOp2Rz+FWXJSGqGcA8rqHDOopvwOM=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=EXljJEyoP/xam/XZ5WieS15jygkBhOviYVV9U5SrO22bYs2YhWixzNkkR1BYBo2FHr6bs8J2clYWwlcmvEIH7pAN5LurtXHx02PSQNEt9+MKM6KahJyfoxSbbegPMzrexyB2yZaFOvqFjixOBx5c6pZDZWMKOv2pvKf5eNLGJsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=L28DoVPZ; arc=fail smtp.client-ip=40.107.6.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="L28DoVPZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O1EcAgohgo3XvUs7M7rS1/kV1WS0mLKRYcGzjTHG94peAH/45cQklw4BZ/AyIp+izetJrjwZJaPFd9ciXWb1aLNF05XtfrtAyhGlWTpzIbiPu0S12A9mWtuWxx0b1ffu2qNJ3lH1GZ6MTiAIqZ0obS2sfE0A0FQTfMmGUxDGyE7XZU5dgTke5JZpkMElGtfMq9tVE8Vwb+z4+iQka6jmZZnK00PwMvJGr7Xzh57IfYsTfw92STQKSiixMEQweiuH6mStfoGdXkNblJilZ1FkGa38VN3W+v8tZFB0LzK/v8p27oUKTqpZVPw546u4ynmdNprJfZ0zDTZHxyqaGpmHKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKVCskMkGFstT2MOp2Rz+FWXJSGqGcA8rqHDOopvwOM=;
 b=DqNR1KNQwOdhhr4VNfojZ+9O9H+PilX0cLFWBOdz4UAiDKZg15DTeG/o/XUm1TXpbBRnmgT4RUxefhgm8pKj0n960Q2SvOc1dXNxchfATjzsQFzwalwEL4D5VwxGry4+iyEucSL+G/5pFb7dvUvL289FL8NcbL3sCtnuV6eABVqbvOUhENTMimtQsoTpcnQpjND0Isxhg9PnmSXyNNRYR0g/Oe04fTqRddJUMblRryZqlfM5vcRJZQ/2wACOccIiLB+uVWA+dVeCpsXODj+/JRip1d0LaJqhxbPMDilfwMw1v9QLw83Dd4es5VSozefokHOwN9EhC6B1BQaniHInbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKVCskMkGFstT2MOp2Rz+FWXJSGqGcA8rqHDOopvwOM=;
 b=L28DoVPZYQz/ezS4mcDZXwCVNUduCT7twFCDn1b+oTizIMfmoswvccA8NTVsW/l7Vbw9vM9CuAXu97dgcQyYim+KhSoH3lu4nbqRxyJfiNbZvfg+TNvTb/Ez5V25+vD4TSmg9bGnu3q0aGyxV2aHghdMtNJ+XIhp5kOQesvKpJ4=
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com (2603:10a6:20b:9e::16)
 by PA4PR04MB7790.eurprd04.prod.outlook.com (2603:10a6:102:cc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 08:47:12 +0000
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256]) by AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256%5]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 08:47:12 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>
Subject:
Thread-Index: AdrAkvEHs5U15BjwRWqHxnLDMG8wSg==
Date: Mon, 17 Jun 2024 08:47:12 +0000
Message-ID:
 <AM6PR04MB594193D73A5CAA64B118354A88CD2@AM6PR04MB5941.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB5941:EE_|PA4PR04MB7790:EE_
x-ms-office365-filtering-correlation-id: fb2b4b55-96fb-4e62-2f38-08dc8eaa14a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|376011|1800799021|366013|38070700015;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?+iKVsBGmGGZIm07wr4bA/dJrGAKF0n7o4tevDCb/42yaGXOl8Gp5UdrDw4KZ?=
 =?us-ascii?Q?86fLJTKJZzzEVWvXgLLnB9Nj2hfLDebYIzO8G9qeIMsfDfKtZVq2JLmHGI63?=
 =?us-ascii?Q?TvLftHBQf9gsJlmfHl5F58eGFd7V9L1KvhWpUTirPxDI31sne6q2mBz3UIwR?=
 =?us-ascii?Q?ZrqMqxmCXmSEdjoaa+kxZW/jC8Gfdov5fbRHReNc1bGtXzz/yrGCr/eR+dox?=
 =?us-ascii?Q?te9jNRwuY8ezHpmTQaNx0D9lwCbIHwt3B6mrxu0xUhDjqHDnqvrY/maloDip?=
 =?us-ascii?Q?zfi6muQJnuL2sm5tI12VUAbS2zy5FD1Ju4NIsd7teOa0jVyiQK8+b9R9aGC8?=
 =?us-ascii?Q?/0xt/+7OJvCDfK317Vd3jla66gwTsiXLtgvvVpvcdQY+H5EHfc35CALbslwb?=
 =?us-ascii?Q?NFcZ6hyodzt3WvVhTr1aqNdCoyQUX6/X8SoO4ltz1ogMY5Q5qRIv22/dsu9g?=
 =?us-ascii?Q?+CGCoNX7LQxS36dW+7eMC9R9ZGgd1go1rJ5MYkpLW9SkLo6IyoR6kW+eJiXJ?=
 =?us-ascii?Q?rPt8I+VaIkktTSB673vkndb5xm6J+KcOo0Z6lUh4DJ3Kk0A5fQUXZk8o/Fo0?=
 =?us-ascii?Q?03qRJO1mli5qOWnzQCptliGXaPxdEoMHQaiakp706wh2hWxK6IfYyp92dfrd?=
 =?us-ascii?Q?nVsTB5l/jEFn9lg7ftOSgiS4z8dLPPBiLUAtpb9g9C9c3QmUOv8xU4VJil/J?=
 =?us-ascii?Q?NEEwkZI6/of+KlIuTKk8+YCh5XX+Fjr8HEQDB4msY037KKLG2jYoRF7g6MOa?=
 =?us-ascii?Q?gKWqwEI+CbMsIxcIVYwvrhyjgEniklfKMxvZb6rpnqUXFueT+1iMOIpJJxSO?=
 =?us-ascii?Q?ijiss2wjEEh5dqDqRW6MSxJ6vTtAuNX+EPMaBKZXlRytidjRRiPWFaa1TBnN?=
 =?us-ascii?Q?hhUuBjzRsBOirmkhpQ/kR6LqDkUd5bp9AopXE+DY1JmIoV/FG3zZ97dh4n/M?=
 =?us-ascii?Q?01VdmT4SIgldZ4J7RYYMiHIl6qxRdvxDjj2U+C8+AMm4z8dRM/B6UYI/g4LM?=
 =?us-ascii?Q?kFtHlCkKpsNakPxYEENGpoGrz2TVOZfhTMWJPBji/ramPY5qBgIONDh72rRw?=
 =?us-ascii?Q?HKespR06lAUznLPAguvaaQi8UN7U/wTlg8fNTVtOeT+YAz+QqVJKQUSxwreO?=
 =?us-ascii?Q?khZAABHF0GPFAU/gSrkUP/+gkSNJY5Dbxa7EZdzpqFNXUGkWj8ILItNmeg7p?=
 =?us-ascii?Q?dt2zhqwSypTfs4d0OvQBgPXo9VCcuL2rfdUP1mZ65y/fRQ/+T40rLH3Dsrm5?=
 =?us-ascii?Q?uM03pmYi6qD+zjFx/oQwlGvVNVZIY9BqBSdeiP9plx5f4KlPBeQMFmpLdxpn?=
 =?us-ascii?Q?eWt/i38SnDgvF7ZVLWI5M4shdcZKaAUu8NjJkUgzSHGi4559JmwwwQVgK8fA?=
 =?us-ascii?Q?1qd7wyc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5941.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(366013)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?A/Ah5SuUAPGK41TdhkCREW+sJQU5A+JCGLnRdA9Kw9IkycPLyuEDrAuop/JU?=
 =?us-ascii?Q?WXH0jBAX4hUuF7DTJrm0/is0vrSQKBJBinAPiffSJ44BrCfBRp6TO/cfLFf2?=
 =?us-ascii?Q?iPV61wYZSEl0ps9h4ABxfFhoU6YRnuENMwU6cyYLY2hBclxcK1H3tNZ1n3bJ?=
 =?us-ascii?Q?lPIpdgHFA6EADSDq5RiW+VzjxL3zl049y0x/WTlr1qvUU5UH7GzpWKaheo8z?=
 =?us-ascii?Q?NY5zaT9SomgMIkwGh6OddbtWhMVHK+8Qb8nf1fTtiJGecCNw/6sOkZ3q/U9t?=
 =?us-ascii?Q?nlHHlo7MD9Lg5lhf5f73B5/tcgc8teqTT+183ed2U7kMMce97e5vkChr/OI6?=
 =?us-ascii?Q?40Tu5N5WPnu31NmC7jTmF17+HRjnPgKt9tU/kJS6eKGT+cmhqqFLAK6stSJ7?=
 =?us-ascii?Q?M9oLL+fDK8vAgk765fD9tJ/QexbmeeuluT7xIUYW2Vvi3dq0fIlwvmWU6b8A?=
 =?us-ascii?Q?7I0hPa6+r62gWTcGlXd4VHVGvkT1GiwV4/xp3XfeKxBMeXm6WNlXcx/2Cv5d?=
 =?us-ascii?Q?zOCYFUnoVX9kvc5xhiP3wMPyKZW2+NzemKWopXVuYRZoEqeDYikMPh21y/aO?=
 =?us-ascii?Q?gsAxj5HYkrobhxwvrU16gLQhJ2+CwXf1NgOo6MXxX3UNsTaozuxL7xdeQlvE?=
 =?us-ascii?Q?lRB2f+yQ38e0d9uCyrTj/XpO00e9joYapShXDnITF9IP2Wvh05D396vCcTb/?=
 =?us-ascii?Q?s64a2HoVg7yTU5fLbVZqMVGpckomvN5/ZDfNE27D9RL/DL4MfRlW/VyemOQp?=
 =?us-ascii?Q?macTYKwF8vNk93W6FPNifqQdWlGLwTQnNG9ERsBW9t0QbxYdbZJwDDOKEuoH?=
 =?us-ascii?Q?Bz3vT+HZzh1RpmmBseS9n6iuzG3vtkHFjxaykeTcF+nwnhmt+fXzNDb2R2QL?=
 =?us-ascii?Q?GMYS/ropAZnGrYxCK0zy4wfLpqqivk53nr1ldXw9yYecTRDtVDqEBWu+gs2c?=
 =?us-ascii?Q?wIX8R4K9zeBsge0jtGNz7xO2TWn8/NPL8D5W2H/e0Xc+oyPBHPEnlspm5xDm?=
 =?us-ascii?Q?ytlCnSsF1CHeOVZoY/lk+uj9DYm8zwIw6HQxk07Hol1ASrfHIMzvNBOQllJ9?=
 =?us-ascii?Q?0RBacgTpC/3RYr3wHf/MCBT5Fmkv0jKzcdM2pfNc/AFumCK5mXU3iwoxmG+p?=
 =?us-ascii?Q?AtmW8Mai0xSNNVAB5ErNUr4YMb6ufQyvxpOGeiqy0VOqPF9OrNAN8m/JZnwC?=
 =?us-ascii?Q?O8HbyqfrNEiYEZzsczrZwb9AaOOXerHfvUe20CJ/SdU/cuRBlBHn6nKt/fHS?=
 =?us-ascii?Q?JrYWdGlo+Ghs8QgBQQBlVmqghgrZPFr3Qf4IqHy0Xehqw2cituDY0OSzGDNe?=
 =?us-ascii?Q?xoaslk81AiKqtJEB5SCC/QfnKAqvvEs/tsTieaUG7zgXAQx3IaWGtJTlmKtr?=
 =?us-ascii?Q?OGqYykzkkC76oox/R+sJA9PSY0k4yffnhYeUSR6nrXpOJrqvAMso90cUNxDA?=
 =?us-ascii?Q?ZGa4EgsPYgtk47Bb7Fn1VQrAL1DrbyxHTtNRvLT/8FkWBJ9zPLWJzYlp2mNF?=
 =?us-ascii?Q?DirUYneUmqoprUIf4C/mdEU3qUh2nFhLO291nZYnZIca5eORScZ29neOWUlT?=
 =?us-ascii?Q?aSa7xp1ojikuyFXd1pk=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5941.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb2b4b55-96fb-4e62-2f38-08dc8eaa14a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2024 08:47:12.1206
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LRROYuaTqN4ZWM4igwESdQocoJZQxfIiKnjrCI7xdqNY3wNkrWibRiQJQsgPU9aGNQANHl2ct+54YQH9mMA31Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7790

subscribe arm-scmi
