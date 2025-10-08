Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013051.outbound.protection.outlook.com [52.101.83.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B013F9FB
	for <arm-scmi@vger.kernel.org>; Wed,  8 Oct 2025 12:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759926913; cv=fail; b=oWyTcmk3lTmvUNNWlPzkc+aB07n9dnKUZbqmgqJj6PQozfSvnR0z6zOJ04V4rsVljKNRl0Sncf02WljqtBXM1HDyA24N69KCCeA0qKg24uBxdXURF/XU9iBUBUYDRfXtb1dIr3KXRSJH7IC+CSLzUrlbo9XpaMzxR1FWdybq3UI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759926913; c=relaxed/simple;
	bh=IgPyTbPNd8otKOlqBF5p8a6rvZ6hujniwRCXYEdtVAk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L0m3w0PFk2WWaPeF3dGEKQmEBnmPFPesnWxhexCV4YyJLbeZi/tSjqzGSAFBew2j50xV2ZRbNacV1K5gJs4dsZgU0JpYvPKGjYNbn2bMNMZNbQL0GpD0cJx0vBobLkhM2P2Ul5lqz+kZTf9rWDr4dl0JJ6W88thi5CRwc9tkLsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=br4bgsje; arc=fail smtp.client-ip=52.101.83.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="br4bgsje"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DFQvcx4wiHGXRbH1c8R8iRL9zepByCz5odvBwMl9Quq/iJ32exWtQgYlhwkLnlsTQivFJn22RpKFZFy9HIN1gioixMGzkLZH6nQlPnnzKxZy56NJm2t0NVdGZjjFWIeiMkJjf1fJTa4bcj0vIzsDwFzXs+P+dz5K6pXTOVsIeoo7YssRf4zg1BIZCMAPP2d+skhFXK5eBvp/tP0I2ytjTSPLf5qfGCLG6cPxOMUZ/pu9ihDN9vtJMVNUn+55kns7x+K8ZWgHhVKGdk4NLe2Norr4ZcKrHXBc4UYVdasQt4W4vXgK55GS71xjrfgDsS7h7PcgDhHzQOT4hyxE7sGzZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQ+4kX61xPrjei1zvKTTdbt0QmIxJm2vEznqWPFElfc=;
 b=UD28tMaADSPg/jq2066i/y4MqeK+QwGLp2z6ijqib+OQLjbCEiq/2TZJupQKTQCBApymxxzdeaB271CnHNXk8aYmk3eCFy1O8NHqi9tNItEkMi9k9yomJLYp4SVZ6DmpSUNPeqJvttMi27Y0+UwGF/g16FxwOV7h2DZnieoW2oP0nfoDwAcUTYWMrDOhSFnsQLV9kgP7Pnr7gq9qqKrLGIxtgI+w4gr9t3VtqejJi7PDid8yqoZd7J/6guj9LC1d8AXHB2tvCQxChR7ZTAUXN/lSuOMWfGaUt7cBl+ApVD5iww8q3fnLKLWhHXGRm6Q07kQA9r6XcQzvZu/gIXw9IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQ+4kX61xPrjei1zvKTTdbt0QmIxJm2vEznqWPFElfc=;
 b=br4bgsjeYLYK3pHwlRBybSa7Zuzvf7EjetHf1gl6rXwiWhJPoRSPDXKExdRFLZ5sE3E05TXBB8U2gtyGFXdBdbT6A+E9PCmbgeLwnmcvVf8X6OcpKa2tqewLc7wAUko+qCdZFyatBuvCu84HxYj92kxFyOVw5fGRXK7DlZbUNqj0noLFyXQacKNdkCHtWwO6WWBCF8abNzNtNyvaFMtGmKzrqF6b77hOtgOc7WE4Hr9zA95w+HTb8p4q+RqcAGdZU7czTqSvRSjNV63s75bv9yMFnEPT+mkPSjLV8ivueIW6DPVnMjiqPfFtB7eTMTIb1r09zlJZq08CYCBib1FXvw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS4PR04MB9339.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 12:35:07 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9203.007; Wed, 8 Oct 2025
 12:35:05 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>, Sebin Francis
	<sebin.francis@ti.com>
CC: Sudeep Holla <sudeep.holla@arm.com>, Sebin Francis <sebin.francis@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>
Subject: RE: Add OEM extension for clk-scmi
Thread-Topic: Add OEM extension for clk-scmi
Thread-Index: AdwyCiBSq25IwY8lRjauikw+8rfD6AEzJP6AAF4/zkA=
Date: Wed, 8 Oct 2025 12:35:05 +0000
Message-ID:
 <PAXPR04MB845998F8E67A458CADF9D4F488E1A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References:
 <PAXPR04MB8459F97453698D981B52BF38881AA@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <aOPhhYmWtXHBjYAO@pluto>
In-Reply-To: <aOPhhYmWtXHBjYAO@pluto>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AS4PR04MB9339:EE_
x-ms-office365-filtering-correlation-id: e598a094-efa1-4b82-3881-08de06671bfd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|19092799006|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?gKZTxaI09Lo+CStxVsc0uO+81pvqfU0GlW/vDGMk2P1838U57eSOje5v5H+j?=
 =?us-ascii?Q?w8/I+3Neuy8QR4hC0XSvEpl3EgKtUoeTPC3M6vlncIkoGeGOMU/fHXPpFDox?=
 =?us-ascii?Q?f6BaqPgpugkZeAWua6ABjg5UvMG/QAgzNI5M0B0of6gpXmPIH6Hv0ddYZ4TL?=
 =?us-ascii?Q?HR+iirfLrkGM19jbPHs5dLHEWvwf2+S+4a1nhtAj2CpnFgHtdkvVSnHcxtCX?=
 =?us-ascii?Q?J6X9fLd0gWr7TcnJO+gTZjieGlXgH4oCM8flgaWHkvcw9msyvl5yjqi0Btjn?=
 =?us-ascii?Q?UmtMkl4EQb4/+ewYtf/QK7y3PeJyOqthnmVm6yxpFUFfNMSjPdW4rVt296go?=
 =?us-ascii?Q?sk1PQEzEyRb8U/1WrfRFw3Uq9fV4B5Z6Wefn0fV5utMavsNbyFsoEkD6w/M0?=
 =?us-ascii?Q?0ZMkukSoHGdpNhQ/X88KaJQO7L/XSuYV2JZ4qrc3j++3APaY0nswEYBEr2ZZ?=
 =?us-ascii?Q?ECq0Ca1GRgyMzac6UI0gnLMrP5NzQISkRH1dH5hkLK0CET9D2xTdOvpyYuRk?=
 =?us-ascii?Q?ibmhGyXIgJl+WK7aaFpTaZpX/mv3rPPk/F+wp2cW7ecd8RJn7Nt2mvBuhVQz?=
 =?us-ascii?Q?GQktI4Cv3h4JGpZynA8hVJRkOVcWfAWdPo4SdnksEE/uU+3TeH+AF6N1eCyh?=
 =?us-ascii?Q?gFuWxW9OawZOq8F6N7nZV8SCiheEQfX8Tch0Tx2r+bMHCR5KVL7LAsv/9T4X?=
 =?us-ascii?Q?RuSi7ADT42hPwB8zTZQpw3nmgL/quX7l9177FHFzk74n/i1NrWR4bvCIF2Jt?=
 =?us-ascii?Q?w8neKxe3O0yG3N+YxeBNpJAhnTDaH6A4hchyxkt/ROgp/QmtMFLRdgOt+dKg?=
 =?us-ascii?Q?JMCtciiv+Nq474DllqKOYbUIpzaPoyjCWPveDyQ0/VEw6SGDQKVzTsAQDUZh?=
 =?us-ascii?Q?yLvv/f9vFVE4/e5tz9ESAdFOlnX9XxxHvNNRcHmlw8Jrtw9ZC+PaMVSp9y2Y?=
 =?us-ascii?Q?JCubRlCK4vtfxlP7pqt1Um0Og0tbV29XfKZvzGEaptL3gZJe7PzMMGEWg+Eu?=
 =?us-ascii?Q?p1V1puTTRrG/bBYZxpJ8DhQ6qp1Ye9VF1pBM+/gAHbDKrCgGCRT7nXl5Fzjk?=
 =?us-ascii?Q?ZEVj++YILD8LbYUjkdV0+nsBLPjLAIQVPTZCLoiV3Dn2sD5YMqQLyYEZj47o?=
 =?us-ascii?Q?XrWwXMoNxqHFEDZI1tDYrj/nphiXYtpXOxFHJvqQXzGY/CH9cxzC59lJOh5V?=
 =?us-ascii?Q?MvlX/ClZ8bYrjlvQW9YIqs/hoUmTUYjCXCmVrGEUp/uKFvhAkguBjo2MKdW+?=
 =?us-ascii?Q?DsxKKBVkGXfPkpBoQGqtmVHs7RJR58j6lMF830kHsDpeJkjn8IDQbioBVb/V?=
 =?us-ascii?Q?XdHLq1zvMLFrZLgrZIwxUTUnKAkDfw6oh1WiBCW83iGJAaHDMgtlJjj/R2Kh?=
 =?us-ascii?Q?vLt3FTcoGqtDrme4pjDQ+sOjR6yc+O04BFya4O2RbU6gGVJcxOk5uJeXGuTf?=
 =?us-ascii?Q?Wvd6y18/3q1rTw20i+6iXQvDGGVH9q4UsAg/kzTNRHfI9IBV8UIhd9H82byp?=
 =?us-ascii?Q?QOpGtw4+usOyuNpd7XE27jagXb1+SgEyC6kk?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/xfJEBW50OSTKCO4/jGCIYO1AMvSdC4DnPyFY4bliK/AggARM6GTLFS3n2ta?=
 =?us-ascii?Q?s7wUh3o82RtgsVgcg/h8y1GDP07NwtCPyvNkDHGRT4dENmwNOgo44RISi5Lp?=
 =?us-ascii?Q?q3qPVyOn1kejk+FAoGjQvvvQN8mHrs6eV6i3r8bYb144XtP8jeGKBy9MOnMh?=
 =?us-ascii?Q?YBAWgK9UgF4czCChOCQS0RhfqPm1x4UQE+/LcfTIFqrURUlH/cfPZdDp7Zbx?=
 =?us-ascii?Q?HB03aFrU5nXgF/WXWSj9WeDtVK55fDcxISj1YUcbMjcTV0RKcFtT3xUuq7Wo?=
 =?us-ascii?Q?dHh7JnG0WcOKINwM2OT8xl9knI6KWcgCHpOPhnGcouvPaDr5xMFKpZH0WqrD?=
 =?us-ascii?Q?c0HWYtZjto405fFBEof3RH+yxecHNZiFqfBQqWgbce2IeaPGNUyyrDJbSd8g?=
 =?us-ascii?Q?envE2su5lRcFIUxQktvlPtB+jlnArb7SumcpHb0ir0XHzmcyOoZwPNfOMQfL?=
 =?us-ascii?Q?D6mpH7kI7KJ58TyvdNj+gH9bJWU18B7Ooppx0VEjkt2SI/wPRQPqNVszMNjZ?=
 =?us-ascii?Q?4A7Ez1SP12OyDjy7L6rEgOQ7MzMBkWgGRfqTZNhkohMLgk5/PtzpoQGyeN4w?=
 =?us-ascii?Q?A7ni2zDiBFQvTigOlniNyMwBJ2QOUQDhqa3sZ3lHUdf52zmh8kIXPRA/zlwe?=
 =?us-ascii?Q?PIic7/by958xvIXNGyOxgbcd3ENkckSr2SYUpMRzuNCDKEG5R53NEKY69pdr?=
 =?us-ascii?Q?tlFvHQlufLbn2pad2Ed6HcyLbF4HSVG+ERp6v0IBZb1yg6ZHgWTBDIH1D1N5?=
 =?us-ascii?Q?Y6OVImupxi1K9cWKsWitDpfc5ou81yi1CJ1S7la0h70eWNHOGXVk6JEwjvYQ?=
 =?us-ascii?Q?HyfYaCI4VU3SXD8idXN/lMRU+H9Q5bSN3K5FrDz8DMiOU8Mt6U8KKDsKJ032?=
 =?us-ascii?Q?jiZ/o+LzQ3eC/RvzRo08WfPlEaRKzply1QusNpObIg73Xo1Bb0wUItWg1Kf4?=
 =?us-ascii?Q?AbwFQZdEiweZFD1hD6qKBsHHO3TmhQP8/oeZHpY9AT3M7T9h0fzejKv/yDO1?=
 =?us-ascii?Q?0EU3hw+GnmYfwpMWw/fuG8W/WPxgouoIYVvvONGEjJrgCinS643RgSFrrGD7?=
 =?us-ascii?Q?/QxjW/GeYr6NyGmvKXohU6ujQ8l+tI7kf/EbUspHDaBOolzzWtZJkvjCW0mL?=
 =?us-ascii?Q?o7QTlGZGZzxJHWLk6xRk7m81FGzHAd4zDdEW+WBfRhwzpo/YePAwlgNM36yx?=
 =?us-ascii?Q?1Q9gNI2mjv6w9pe4XuxKRd+S2AuUFq6U90b8lkwZLtsEmhNwBFKvOl39ZNPS?=
 =?us-ascii?Q?XEh1W5E6b/E6/rSkbPhnakkiITBcKY2JuMOt6bv4ji3WFDztEq6XZa4hbC+Q?=
 =?us-ascii?Q?K1phD8Y39kq2xCgXNGNiVdOaXTSC5GpTc1eF6eNgsU15oNmfrLAce9HVYZvc?=
 =?us-ascii?Q?IuIkMt4MsBnfOqSROsp7YGy5i+9E8jc2iPgJ34oZj31qPdPiicN/4e9uQaD7?=
 =?us-ascii?Q?sNaDdYMc1Vz0E8Sd2KwSPRLoyg/YfTYqpkn+G1ZNAui0JokD+UCHp7+Uo0LS?=
 =?us-ascii?Q?feF5D/yu79xSXV0kKKxwTE68bQEH9Nrs82D1l4sqXse12MUq1CX5NLJmXBP0?=
 =?us-ascii?Q?VGu58NTyld9PCaxMoK4=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e598a094-efa1-4b82-3881-08de06671bfd
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2025 12:35:05.3242
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 54/HBNjVcjESapUUhBIH5FHAh41AtWphY1K3JDvuMwISlM1dH1STtXTm4M9PanwoElsh6P1jEVw3Xit5Gh5xVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9339

Hi Cristian, Sebin

> Subject: Re: Add OEM extension for clk-scmi
>=20
> > +               ops->set_spread_spectrum =3D data->set_spread_spectrum;
> > +
> >         return ops;
> >  }
>=20
> In general seems a sensible approach...once you had a full series we
> can reason about it better probably....and see how much more (or less)
> we can/should generalize.

I reply both here.  I will post the patches together with the clk ssc
enablement in clk-conf.c this week.

Thanks,
Peng.

>=20
> Thanks for this,
> Cristian
