Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012000.outbound.protection.outlook.com [52.101.66.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1735661
	for <arm-scmi@vger.kernel.org>; Mon,  3 Nov 2025 00:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762128566; cv=fail; b=hasVQpX3pPpaTtRzPZfhSBFYQDy7gIwFvDCCiXto1BUQ5gAOMRBNdDa3co9NoSxdFWJUIcdoTfb88rfBMVlMUaZqgpQL+Q5vDn29cV2JgiKl76SzRdl9U3taeKsMFNQa+SWqdu3k5z8SAFzEfpayDZHPFohcghCzRQF1e4iIpTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762128566; c=relaxed/simple;
	bh=hASBzpfJrHI9AaFJHAgKoszYmUkA6Odmz9aHxJTQ8Pk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=V33Az8IQX9emz9YrH43PACKUTzGxeBZ9iHnqrRpl+NoCObVzql9xXf5pHsaWLVmHozCLvqFb8swG+7Bqao0IN488CE/8auhccDUFzASDomrO7dzqB/qjFkBRXuqS84SZFjTtSKo4+x89yRfj7Y7ZJ1jPmXsej0CyyO0edqiajRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PTCvZsEC; arc=fail smtp.client-ip=52.101.66.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PTCvZsEC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vJzspXZOOT9crmDs0VNNLCBNm+WbMKhHp7g4I5S6txx5wdsqRXvZQbk4C2qJoApmOO+2Erl+cytR3DBOfFiRmI+4bd3f+6Y4E1V9L6goN+TElq+Zae/JQyjoqCbgOngg/PUHGfhbDDmrMeq1Jg7lJZ6jbHeIBjTF6F7O3TmcVII4rm+8YOUx6bqhIAIrk1BVcI3BSutpwuVvWagtUK3X4ar5CisJ+NwCuMXBU68xs2Jg7UWmrqd2izHMJZxjNLDC5+IsR9EFjC5kKBTOErUfXW/QcvrZioUrP+SirOTCtErqGXNnqGfLWrmEgiydeLcq/XOnsjYVyKmQb8pG9O4LQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uhVm5HidOJDJ/mn99UcYxgyGCLGJC0+tlpCDmk0CDlU=;
 b=qJ3YFW/Y+TuOFB1Ta9awF/KkQA2r0ym+XOLdFnArsmVgu7cHUbtjWDMxCjookJB1/ZJQjeGo4vyfP9DhPwqOXksXPASUoMeDKHDEzS0jdKYSYdf/BBgUFrNU20YrIZV+QRyIzMpi2l5RSbiwOIu/tuKSWr5Qq/5zNQcR5/Hxw1rqWDU5BGWSuJtr4eljOu7cZGeqw6SZre8UiqFtiNGufTiZOJsjwvzN//yRNNTgskjTagbxzq5+pW2xfbQkKUoUWav8iRu3Rlu+mgLYndBTGjw9W0vJuW5yjCVvZ6pXE10FvyV6jGpdUXt0uJoSeelR5B2zYldT25afaHqq0GdGVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uhVm5HidOJDJ/mn99UcYxgyGCLGJC0+tlpCDmk0CDlU=;
 b=PTCvZsECaAa+uhpKgJEOKOeEH0Adq025lWVNE7sgULGJPcu8g5uV0cx9nAMDrDkSB1a2YZUuubL9f9bTPH0mjiMy5Tsjxd9j7uXdRZcT1UidSns7+0pilSNy9gUgizOT340zPMGA/OtR9MGWORB++KW7io3TZ3oRIhw9DtN0F252jAT8hN5Z4l8/53N+fJXIpUnmw1iL1Bvjnp0tVc9poLt+mTprXeE0otKjaNacq76XH5tQhQFTcA7Fh7p/kR3i+khxNo+rOioxzITR3ZZQQe5OOJoxU8rH+WNoNKDMxf74gRU5pZx46SYR0F5eEOlScpzio3DDWpimrRyupg+oLg==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB8983.eurprd04.prod.outlook.com (2603:10a6:10:2e2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 00:09:19 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 00:09:18 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>
CC: Sudeep Holla <sudeep.holla@arm.com>, Souvik Chakravarty
	<souvik.chakravarty@arm.com>, "open list:SYSTEM CONTROL & POWER/MANAGEMENT
 INTERFACE" <arm-scmi@vger.kernel.org>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dhruva Gole <d-gole@ti.com>, "Francis, Sebin"
	<sebin.francis@ti.com>, Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
Subject: RE: SCMI Clock Protocol: clk_round_rate() mismatch with actual
 get_rate() results
Thread-Topic: SCMI Clock Protocol: clk_round_rate() mismatch with actual
 get_rate() results
Thread-Index: AdxJRRxlARKjZJ4JSrmZv/oapwBRfQBVrgcAAG59RBA=
Date: Mon, 3 Nov 2025 00:09:18 +0000
Message-ID:
 <PAXPR04MB845935042371B7059810258D88C7A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References:
 <PAXPR04MB84594F6E2CE36C0EA1EAE24D88FBA@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <aQUMrmJ4tX-i7pIS@pluto>
In-Reply-To: <aQUMrmJ4tX-i7pIS@pluto>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DU2PR04MB8983:EE_
x-ms-office365-filtering-correlation-id: 779375c7-9805-49ab-30fc-08de1a6d3b93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?OoWEm3bgithgHIDJZ35/ObopUIxgguaSesXA8ORqD1T6wAKkwIPBOPL2mMJ2?=
 =?us-ascii?Q?/PVoR7byrjGYCQSfZwhzvHTjkjzAFanCY5rDPk7pnJt4X9Q9QVLdtfVKTGHs?=
 =?us-ascii?Q?UdW3+2nQh1G8TYOnDEjRXYml/ejf5/ekJtc8Stt1k/KVZt7sqerluYusP/1B?=
 =?us-ascii?Q?eSMa2Pi7CaX+G+rbrajKcfFgKiXixfK4qbrMTB0O+sD/s7jeo1v1Z5izs+rJ?=
 =?us-ascii?Q?PqoYWwiItZ5ohFLzwkY9Zw28WtJnFp7nB8uNXhhP3E0u2DatZy+6GYJaMJP4?=
 =?us-ascii?Q?sYJIz7XWdAWFjFcD1QaKG7prhEQ2dryQMSR7xbwZ+oqZNY+b1DKbozJqwP61?=
 =?us-ascii?Q?Vk1R5VP2aB+V1cp3CGMCeT38tEXLJBoysvln7ectiXAQLhf/SkinHHus7PjG?=
 =?us-ascii?Q?6zb8pD2ImMYmKKGvI3lyOZ1L1Br3vHgNe3iy+eW6nP/9awubWS9wjGfKniiI?=
 =?us-ascii?Q?pfu5XYWQyaS0wHWxJYprM0u7f2Akq8pgQNwSnkAoZtU0gLEYV0NqEZkDJndw?=
 =?us-ascii?Q?NvOpRh79fYXjktAnFD2f2M1mkgUj/hgpAnlYdg3Kb1C+b6yWL9VtezzCZjyS?=
 =?us-ascii?Q?Nt5Iz5vVQEavDlLWW25Jjn5dpqSKUctfTG6RD3sRy1WcEH7j9OZ+6ufPLZxe?=
 =?us-ascii?Q?y7j3UIlROxLiIhX5SwlGFgcdApa9oEW7SI62EaMFYOBzmvv0WH6Cu4VS77zH?=
 =?us-ascii?Q?j7m/emblvkmZC0LJy/860gXidNqidpFhvwnp3KKFuTwAMAlV54BLAoWde58w?=
 =?us-ascii?Q?QBmR92ho8TuuEkkUxtPoqECFtIqYFDw/9ZTAaYCcZuqJmpyIbSvFfU7zDr5R?=
 =?us-ascii?Q?jaFWNXU7t6ueKJp+3KsxZldIQtnh9TyB/BvSL6szjlfyh1cubY8TW/cI6A8c?=
 =?us-ascii?Q?syLl3YK3DvdgnNY+m6+lmL01t4kPw8Ski4Xyqzinl1sOWBjZdg2xdK5WyEmb?=
 =?us-ascii?Q?2xFrdbbdm0jh1ImLvEn3SDtK4S3+6979ByoEQ0RwAPti2ZURf9KhJBEnVk6N?=
 =?us-ascii?Q?XZlt+F6mIbE3ENzltHT+1HRbfzsPhKVuE7pEYYjUyJPU9mJfq58nu8ADm7Zr?=
 =?us-ascii?Q?2fEG7L3WXXpxgZUKyBT/XOe6ZafvV3EiefcPgNeIGYYqZrZqPiShvxCiBaFm?=
 =?us-ascii?Q?4yWjMFpe3Y2nOCufln09W5YDBDzWcHwzn9tX4c6NGzC7nb/oxJGz13VVIywM?=
 =?us-ascii?Q?WIzjasdqHy6hM7HNh3t6ewwEZfeNSoneJQdpI5fo2Lzc9BnCpCkxRrAMTjn/?=
 =?us-ascii?Q?FJl3m7+zAiWbuJNYWKaPDGqIde4bv/dKktEl0pryPYt4GNEVql5NrJBZMy1H?=
 =?us-ascii?Q?w1+/J+ac89FU4ifnyziH7M4zD+mfqd52SRWTiIU0i2Zfie356BwVZCGA4yNI?=
 =?us-ascii?Q?fKGoRPPVqTAMzfVZlv8W6sDBmStBsJcj7dnBMaPxUTtiwTEZ0vy4ob0itpdg?=
 =?us-ascii?Q?ZyIt6l8hOQ0yvyTc9w9g9wLv+I0vbBxBOv+oiSzrm73O/449o6Djxp1kSGVS?=
 =?us-ascii?Q?BXkSi7TxuEx/VUq7lPzr+lbwu0tPJEgUHuue?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Zt4BurIxaWioF50KFgsiqaD0MhPX7K2yYDHmPNuawoVtKQXAIX8l5Nfbjf+/?=
 =?us-ascii?Q?U+paMN0N/pG1v1w9YirA1nShEB4ZSVBYCkV+oNADfUVC8ilUxnfqbpgId+Ww?=
 =?us-ascii?Q?fy3A0ToAf/F9VPnAkl4zjFEdUP1FUyFd7yX8S44n6ONRrjmnWJUXLwUrru6S?=
 =?us-ascii?Q?mrBrF1pNhQ8tukkfoPlERVmT2ezHCicyNzgzsUnRDvdUPAFeEHbVPX4hLRhg?=
 =?us-ascii?Q?Sn1yQNTSJn/y26gBBs0VfllobO1OnXgCTPOFzlsSLNe+vhNM9LOyV+le/wpQ?=
 =?us-ascii?Q?a66Fy7UiX5MW6VOOV/2mrMri5V/Z0+xnMzPvpHuWv23Zc5DE3QOkOedGdVXo?=
 =?us-ascii?Q?WW0q40oRNoBZI5qCyr/hZH7fawpFanfOv+36aue6D/84GcW/sc1OPNhoOk+I?=
 =?us-ascii?Q?tqsao6Suvrfzmc5plqj9DXKcWUkS3QPLUp5yGilnbjghngscZFyO6/pb1VoO?=
 =?us-ascii?Q?owK+7JiIQRo2Ywfk3qPjTo87e7KaZjq9VmMNu4fJ35TwiHNWilNLCmEu/HGF?=
 =?us-ascii?Q?xpcfTIPtAvxQINbtqscWoCZ9Y+s87enRascQ/oeDFrSH72MNXOCwuTYjDFws?=
 =?us-ascii?Q?0vCcPWKaL4ii+H5J7WcV7HMjAFNirdAblMZ9TIhMHlf/USKjdV/FA0PLREm3?=
 =?us-ascii?Q?z/OJ0RyxBn0TZPahRPeSrlod1btByYZAU3I7G+rBWz1X2ntyRKQ5tIIgvPig?=
 =?us-ascii?Q?Yk5R1grV9PdxpwlCMwr7elDwzUYlgZ1DHKeyfBAOOH7BXGdOI3d/kUnWah9p?=
 =?us-ascii?Q?Kmu8tlovYkaIn0QqHr9KiSVTGSzVS343p8JI8x8ctQRLLwn2HeyqvPhG/G5o?=
 =?us-ascii?Q?1C7Zy3hc4MG01XLbM2LttiBbKvZ3FYeJCf6Af5zaKYuZZY8h0ZwPysFjjuoZ?=
 =?us-ascii?Q?Hop17+z7dFxGnEyJa0MXo6MLUteq9LcyRmzKpdQQdULkDfZzsxZ5wqCSkHmv?=
 =?us-ascii?Q?zp8xGBlRgoyep7sKzOIs+UiUVNp/HtXCjXP2jutCe/mwl0+2tquPMFruJv8D?=
 =?us-ascii?Q?2MChUc8o7MVyyW1hZV84zIHzD4mM7fAcI04wF2aWOJSZM3z3fPZ5YnFEHXJe?=
 =?us-ascii?Q?4kM67OIWYKes8yn0XoumnrsHqfxTfVgqTQg5Oec0cNGLizDY10I1gJAfL5tr?=
 =?us-ascii?Q?Xlcjmzdp+mkRXUzNklNFqXn7RwKykUzmAZRtnzbk+TN6+dSIVn4mrKqMvsT9?=
 =?us-ascii?Q?VUWeMudnj/uCfrN3o6YRUo/CuaTaJ8Xs+DhA1eilxfMKjjMo5ugkJYPWGug3?=
 =?us-ascii?Q?HBfg3xiPOilnGBpqeBI8R2W5siI6NHKksD7T0NYrt0b5hFiAWuAKp3WlrQuq?=
 =?us-ascii?Q?3mzwOtddSrds/1dAvJEVIzzQT+YIMSampLafb76GKqP0ggR4BeHkLHOwckOI?=
 =?us-ascii?Q?xc5t63dBjVjQzWj1tzWgg1kHVGY1uhnVwoBqGv2Bp0Mf0/C6sSQkxwe7chFv?=
 =?us-ascii?Q?CNfu7ppyWprdu2ayLd4YrLIFBqLD/Ouptn/5wwOGJz4nNlWLudGU6t45yESm?=
 =?us-ascii?Q?1uFEiPLBgsg3JUWU8yqe7hk95zp+CRSBV+Ob2uAxB9RtGDtYnsSq3QTbcmVL?=
 =?us-ascii?Q?6YLcmDz94SyR6PZOEBw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 779375c7-9805-49ab-30fc-08de1a6d3b93
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2025 00:09:18.5954
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OyADK6H555PKJH1gricBSQIVVvjw+izVWw9n0sax2Jwuv1KM/lSOQjRJc2Y9R/zRdQmM836uIKbzTLSPIBwXUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8983

Hi Cristian,

> Subject: Re: SCMI Clock Protocol: clk_round_rate() mismatch with
> actual get_rate() results
...
> > Questions:
> >
> > Is there any plan to enhance SCMI to support accurate rate rounding
> or
> > feedback?
> > Would it be feasible for the SCMI clk driver to verify the actual rate
> > after set_rate() and adjust accordingly?
> > Are there recommended workarounds for drivers that require precise
> > clock rates?
> > Could SCMI protocol be extended to support parent-aware rate
> > negotiation and rate propagation?
> >
>=20
> A quick reply, there have been other reports/requests around this and
> an internal discussion thread has been started with ATG, and this
> report of yours too is being considered.
>=20
> Once we have something concrete to discuss we'll get back in touch.

Thanks for letting me know.  Waiting for your update on this.

At same time, we have to find a method in downstream to
address the issue.

Thanks,
Peng.

>=20
> Thanks,
> Cristian
