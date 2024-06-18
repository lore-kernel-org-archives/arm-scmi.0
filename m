Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2054.outbound.protection.outlook.com [40.107.103.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB13718A92E
	for <arm-scmi@vger.kernel.org>; Tue, 18 Jun 2024 13:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718715670; cv=fail; b=D2Uw/96O2fTITyK9npIYXW8pGmH18BxkSKQ4FIN6ypNZFxl0ZqWqiK7m43OvQGvzTx66/H9Y81lQ9pjgFUdsOVYCaowEDLezKk0phXG1r5HtFcnBEbgMInIubIs5KqfnKR/XlJP+nxfGYPdxjKIdT9d4wyC7uikauzNw2kt1OgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718715670; c=relaxed/simple;
	bh=0COjXRYCkAUXQXlRyahbW/EbWCCzbKDFyXXzXOhxJtI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=owqS+GLtb3VUfuyl4c12fuu7DV2J79xVbMaGK+C4OA0FdMMG5RUI8uJYb+J+edAzYPqMdHztqh3LYG3LbArFhmAnPW51KGSqjLx8wwKyTZ3fQEevPvIWTVWQtYBru7NJfJos2YZVeevIJ0F7XQLE6QOUSdS3QOyyRuwfcjzJVvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=IzPb/8Pp; arc=fail smtp.client-ip=40.107.103.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="IzPb/8Pp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bBEDwXykhmzyMiDcXOH6AGBvUR5HWNrAu0S+g6deLYIb8R9T7HlouF0h2VuCQxV3VspQqZric45/Ubf11Vv30EySDlbukbh6YO1kR6rMEElVzdR8HIb2eIoB1tRPXwT65czkgwGeMhIkLpxcZXMDBVVTzH7erqeapsL+v6dWwjzbwTTgoXUPbeL/B7WqXh9QQmcz1LgW7aajUpbNfWUpiE1I3VWlx8XTaGyF6aRvTHnwlMGGkS1wrokD1lqoAdIsYVmuCMT28AoHjjT/U8GgKgdRjUtP+PigvauFWvJz4LEnlREsmn5JS5MOR2r/nKlZvuhuwTvy4QtaqNuCM7aP6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7BIEXvv/k/M803PLeas9CvCvIvfrYjRi/x9EzrMpho=;
 b=Kt44iiul0RSgByzIJGpApX7X5o3HJRnEd3NTsKk4dhFL3t6unXwkchIF1+Lxc+JXWoGGi/9I+dKBZl3MRf566QNIDc5J/wRT9oxIUbdR6TZVI1dV4YST3V/SmGB8j9bKqbuc8CrNf5UV3RBaKPqo2eSCha6hNM94K7TWKAvazfWOuy9joTL85nLOQvi7xTQ5v6pCcf+dvZMTqbTR/MHgga+lxmdeFdskgsIcDPoSr38GFCzSeQJTPLF1XIHV6QQYmu8zrfZV72cYF1ZfhHBV2bOdl5Bn7zT4YMvNNEnycViswfOWaDtAFTNt9uLqM3NUY4ybfGyv7EE1STGSohY+5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7BIEXvv/k/M803PLeas9CvCvIvfrYjRi/x9EzrMpho=;
 b=IzPb/8Ppxx/CMkWc4BMVRW/UnDR6vDj6SdGTNQ1I9zh1REP1/eALforCJXFgnIvRPGT6rzG31dHr/kcxhM79mSv/0RG5BmzSvqLSOaWB1kgX2noQ83mFLH4JyHUQv5GTnNkv7okbma5AfoFNQyYPqO4vvi6jb/T8zKdJb3b4ac8=
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com (2603:10a6:20b:9e::16)
 by VI1PR04MB7088.eurprd04.prod.outlook.com (2603:10a6:800:11d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 13:01:04 +0000
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256]) by AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256%5]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 13:01:04 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>
CC: "cristian.marussi@arm.com" <cristian.marussi@arm.com>, "robh@kernel.org"
	<robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: scmi mailbox max_rx_timeout_ms value
Thread-Topic: scmi mailbox max_rx_timeout_ms value
Thread-Index: AdrAlApOOs97D7woTNS/plZUvgvIdAAJiiGAABo6LAAAEQwYAAAFP7sA
Date: Tue, 18 Jun 2024 13:01:04 +0000
Message-ID:
 <AM6PR04MB59419C43F0B2CD4295DC90F988CE2@AM6PR04MB5941.eurprd04.prod.outlook.com>
References:
 <AM6PR04MB59414DB0445EDF6ECA46B02F88CD2@AM6PR04MB5941.eurprd04.prod.outlook.com>
 <20240617132811.adcqbpf5u7e4xqe7@bogus>
 <AM6PR04MB594170DF514A3B168E35FBA688CE2@AM6PR04MB5941.eurprd04.prod.outlook.com>
 <20240618100716.wlgf4wc6afzjlutu@bogus>
In-Reply-To: <20240618100716.wlgf4wc6afzjlutu@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB5941:EE_|VI1PR04MB7088:EE_
x-ms-office365-filtering-correlation-id: 3bf37ad0-4bc8-4543-f52c-08dc8f96b613
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|1800799021|376011|366013|38070700015;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?RuscCvBbKdQpii5Sa4suSHIcKec0RltXAJ5tr+hAfOh64oOeSVkYDtko1Sc4?=
 =?us-ascii?Q?+4YEYfYht50wOlkgSXyZLqR7Y/Gl6A+anO5dfHHVN8bvM7ApE4euxru7Nx3+?=
 =?us-ascii?Q?fpYpB1cYltw1/k9uor8miSRJrNmD8fOFB1LjrYYYh0ivWMv2CgdEKVkeV4nG?=
 =?us-ascii?Q?ga6bAWwGr5TKseg1LDLyVuSckpmLg028iQwHG0qZ/7btMD3R4tpladaPlEPA?=
 =?us-ascii?Q?gcdmDdfVLXrhzF1rdAednIQX5D3qjVCZRKR4zX+adbIg6frNYL/N+C2ZiN7w?=
 =?us-ascii?Q?C+53LMV1Aqv1YTRvp/tR6MTzZenir2s5v9eBYrxlNOnd9mxCa39BbUmIIDyf?=
 =?us-ascii?Q?u2buoCmsFFe2A1Le40dMRyYB6UJC3aAjqVPvnWP1VWVQVxerrqEwClBeQx5c?=
 =?us-ascii?Q?K96XtUenF2Vd+bDKVc38Mn71eGQUaeAjjlbzoWymUy6uOGyJSAhFtIxy8+7g?=
 =?us-ascii?Q?+971Lo+hFG6VVWGuyfMlfNuDGbwjDFAK+9i6ytNhJvNafBWntrfR7TLaXnBx?=
 =?us-ascii?Q?ozKbVUh40Ho9h+Rr5Cy+2Fi285Pc/duPTPdxSzktFFrm2TsCyBAKEGWnfSdx?=
 =?us-ascii?Q?cOgdBbJAbpTvwP6GJxjyK8TzdVqn4NExlloQkO1Hl3a4+aLMkR5cehSIy9SN?=
 =?us-ascii?Q?52iLA1JFzAJGe4MpGw2t6FzrnWCMRVECrr1xgKVhMnHyCEidL4G2zX7FZCef?=
 =?us-ascii?Q?wDlq78bcWt6GKBW5glqe7BNj5wGUOwCZwwojhd6/jIkv6iWwY8X2F01MA1j0?=
 =?us-ascii?Q?/fWuR8CYbWXseiHNm34w3yV72h5zR+iwAmOpmvaEtgQcXYPZD3WZY9MULgxD?=
 =?us-ascii?Q?E+1XFLsWt+XCH0O6VM0ERTlcXTTgLTOYz9czFai+uuBTy2/bztUpLnwOhkqy?=
 =?us-ascii?Q?rXzVtsQgZ/HCgwFvleCyMQYFR24cqXuQzn/D16urrmGQjUls0F0DCr+yJUbp?=
 =?us-ascii?Q?cEMZcDqHxBkqW9uMgnBGTvo3Y1F3W8x2Bs2MiD5ryvglBon/r1pXIYRcezjs?=
 =?us-ascii?Q?ZAidLpjlgmwagrz2bwIwxhj+rmkZFXB9J2GI6EjS8N1xn90D4L4qrA5Px2YN?=
 =?us-ascii?Q?sBAJqyKFsZtTzbuYIdUfr91VJKV8eHD8FUllnyRchOSiE/GzjjWSx+K0aXMB?=
 =?us-ascii?Q?oRTTToHylpchnkJLZpON5zFPDBJsTbOHqrDtjLuvW29ivFK1gFysXF0lot8A?=
 =?us-ascii?Q?x/nA0W0e85FHFYug01ee1E+pR0GAVDMf0cuSsO5Pm4mDzAX0svgNIZZlq2YO?=
 =?us-ascii?Q?hMowEfI+XHpESjBXKxZe6qXvKpM96R1rOMtgO2LkZWoZO9tKskFIBdaSsKYH?=
 =?us-ascii?Q?5BU07aVB6GqeReUp3n4qtrYEuP2pQdej91kONXATo+NaMlvj8x+gkL7DXHSo?=
 =?us-ascii?Q?NW4w9PM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5941.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(376011)(366013)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?JtJYCmjBI9xXIkfPHwgq3L9XYTLQv3HO3ZKH8ZyquA4y3FWB+Hzx5VIK56ng?=
 =?us-ascii?Q?BVLm8XBuqlFfcRC4Zp2SX7C8BQxfxZFKPdOmJtNaAzU+Ics190l5gQ7lfEXA?=
 =?us-ascii?Q?b8/iBtPm2vzF7pdCYyFSPo58JYjHOpnWt/qgWEk1JFyKHocPmSNG/n55I4qS?=
 =?us-ascii?Q?OA1BLx88hnJNHg0DdFeYvP3hq/z2CPGfmy6ZfMdwRQnLZ44rs/MqiuuYAlSL?=
 =?us-ascii?Q?tyEoyMgQkHP8D7bu6IclMLbBKmo6M1HOsDgkfmG5jzBotlVMmxkP8oB6WbUI?=
 =?us-ascii?Q?25H3mj/4WJRbqgQfMIv4R5JO8jhC2wiuMft7Tq7TslK3GaKYVx9hzGjZrmXa?=
 =?us-ascii?Q?wCbmmgPHiFtQ0dV0uCyR5oKayzvLi7lZGV7xHF63XLfbU7e5FqHFd12umz59?=
 =?us-ascii?Q?oLj0hyrP6E70/tjBVGMP/bWzYofMkZj68Yzs2Iz1zvOaKp8DGri40oMXDgLz?=
 =?us-ascii?Q?opXYNnfUmkGEqMvZmCgsfpGf9xrgTzkOPb9kEy+0MUz3/VEsTCoUXDFDPUqI?=
 =?us-ascii?Q?F/cbRpKqQFzsASKLHOMWfj9pm0rErNr7e8JMV9lt/ROw8B9kwgVG1eORL5sG?=
 =?us-ascii?Q?lee5hxhTOai7TuWwKgDzcsqq2dG7pQiI1T3aCotNaTMhGX+uS50MqF4VJPfu?=
 =?us-ascii?Q?gpw4dYAKI5mgWeOm7TlMCatczNnmWpaSd6NEHBKUi246yWqtNgIh+tuPfq7v?=
 =?us-ascii?Q?dZ2qFaFpzxNEhCA8YPwZMhoz2vi3XJKW8ctcW/G/1ONtIHT+5quNEHWiU+JF?=
 =?us-ascii?Q?Jmf42xTKUFdKHx96XBehS3kC+bc891Wiax5tw79qM7d+HbwzIcxQOm5CfMc3?=
 =?us-ascii?Q?sNKjPQ0BHlfyXIeu98U/HrylhsrMsuFHPXD/Ql0UT2cLi57NEy4NYaMUq0GM?=
 =?us-ascii?Q?kyHJKjRtMhPI3t/cbeihMY2fPy8iJyx8Pqd67cGVvvefO+Dx4dmNBDjgWlSv?=
 =?us-ascii?Q?G8mByVhSoKfgy5pgljLwNcdmE/SxDrbuM9Ef10wFI/4kVRxQR/u5bNJBBu7h?=
 =?us-ascii?Q?bkbiED0SfMVapktuHQerxbzWsYUBe0mVCL8uTKx19Y3RJKHIM7WRW1KHSs3R?=
 =?us-ascii?Q?hIoUBy5xeg3KRQ8cx6a8dy4xp36Y+XHzeGncyDHwzxMHrCdHWG1XRc9HlXir?=
 =?us-ascii?Q?F1b04fBXdLdMb8ePpw7SZSQ9J+BUZabyTorM4IgLROzNaM+NATwlDq1Br0RD?=
 =?us-ascii?Q?0P04Me/5tKnsk+M2zHSR24izbxDeCp+lxyUcRSbUI8e/debKbex+3snOm12P?=
 =?us-ascii?Q?102EshYxLS3BbqWDNCLPKQI+ybqFJ5JWCrM6TniE1UHyRU3/Tk0VvHSjpbMj?=
 =?us-ascii?Q?SaKnH+8VgZv+NGJ4z4cBDi0ra19LWPZ3fCpgLwSc48SDXI8j7zxOPXQe/5OV?=
 =?us-ascii?Q?8UXrpMVbiEm474u2IHtCkBMUTwQ6IF27AeHiLkluPbiKjoGHmLaDzoM5LWyP?=
 =?us-ascii?Q?c8ev/2O8BzxpjThhIU7c219jnOvd/8Ozqywn891ASlIanA5FYqS0+Ala14a6?=
 =?us-ascii?Q?pmCbufooECNRr9sESG+XIsL10tsnh/nprmXH44n4z4i06fvQ0nP1nVSMyS8W?=
 =?us-ascii?Q?07ob9AM0y0ddseT/rpk=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bf37ad0-4bc8-4543-f52c-08dc8f96b613
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2024 13:01:04.2286
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: az06fcTJSwBZhIdy1Wa/oqP+t8ZC6Nk1DjJ12nKJJ33vQ/bOWh9gWRT8HujbiZBJEeRik/llx8VLuha1ewqJSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7088

Hi Sudeep,

> Subject: Re: scmi mailbox max_rx_timeout_ms value
>=20
> On Tue, Jun 18, 2024 at 02:12:06AM +0000, Peng Fan wrote:
> > > Subject: Re: scmi mailbox max_rx_timeout_ms value
> > >
> > > On Mon, Jun 17, 2024 at 09:17:11AM +0000, Peng Fan wrote:
> > > > Hi Sudeep, Cristian and DT maintainers
> > > >
> > > > In drivers/firmware/arm_scmi/mailbox.c, current
> > > max_rx_timeout_ms is
> > > > 30ms, we wanna to enlarge the value.
> > >
> > > Care to provide the reason for the same ? Few possible bottle-
> > > neck/issues:
> > > 1. Transport
> > > 2. Firmware implementation
> > > 3. Processing capability of co-processor implementing SCMI
> >
> > We have M7 and A55 and even more SCMI agents in future,
> > A55 linux agent has the lowest priority.
> >
> > In normal case, we not see issue using 30ms, but in extreme corner
> > case, A55 linux may not get response in long time if other higher
> > priority agents have heavy SCMI requests.
> >
> > >
> > > > NXP downstream value is set to 1000ms, but for upstream I think
> it
> > > may
> > > > not be a good solution that just enlarge it for all scmi users,
> > >
> > > I think it may not be good solution on any modern platform to have
> > > such high latency for P2A or A2P communication. Even Juno(a
> decade
> > > old platform copes well with 30ms with SCP running at 50MHz(IIRC).
> > > So I am interesting in getting more info about i.MX before we can
> > > decide on the right path to progress here.
> > >
> > > > Each platform may have its own max timeout value depends on
> scmi
> > > > firmware design.
> > >
> > > Fair enough, but 30ms to 1000ms just seems wrong to me to start
> with.
> > > I simple need more information to get convinced here.
> >
> > It is just based on i.MX8QM/QXP SCU experience. We thought 30ms
> might
> > be not enough, so chose a large value 1s here.
>=20
> Well why 1s ? Why not 100ms or 50ms or 200ms ? 30ms was initially
> set as mailbox initially didn't use HR timers and we wanted to set at
> least
> 2-3 jiffies on a 100 HZ system. It can be and must be lower than that
> but left it there as worst case value.
>=20
> So can you elaborate as how slow A55 and M7 can run

For A55 agent, it is 500 MHz
For M7 agent, it is 400M or 24M
For M33 SCMI platform,  it is 166M, normally runs at 333M.

and why 1s is
> good and right choice ?

Our firmware designers suggest agents wait for until response,
and no timeout, because if real timeout happens, linux scmi
will not recover per firmware design. And if M7 agent
has higher priority, and M7 is asking doing some time
consuming stuff, linux agent has high chance to timeout.

I could not say why 1s is good or right, actually there is no real
answer to this.  just from our current test, it is a value that
makes system work well.

But our customer could customize the firmware for any
stuff they need, so the max timeout value varies.

 Coz we may have to see if perf fast switch
> needs to be disabled if fast channels are not supported ?=20

We not use fast channels per my understanding.

It may have
> other implications.
> It can't be just any random number like 1s as some developer felt like
> testing to overcome the issues seen on this platform.

Ah.

Saying
M7 is doing SCMI request
ATF secure world is doing SCMI request=20
TEE is doing SCMI request

The linux SCMI request could only be serviced after the above done,
if above agents have higher priority. It is hard to define
an exact maximum timeout value.


Putting the 1s aside, could I post out the patches for each platform
use its own timeout value first?

Thanks,
Peng.

>=20
> --
> Regards,
> Sudeep
