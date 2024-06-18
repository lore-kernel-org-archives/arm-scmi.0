Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2041.outbound.protection.outlook.com [40.107.7.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D42E848D
	for <arm-scmi@vger.kernel.org>; Tue, 18 Jun 2024 02:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.7.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718676731; cv=fail; b=f6y4xV8godkm5fm11z94+VQlxOToX13rtxEfbFbhbOizvhrpogadGpsuAbwdADlbEPB8PFyU/rIUocIM8gvt0R+8g7Gy1DH4yydJ3lW7n55ho7VDdEWbLpz144p4OTPBWqmBN1JWxu2smLkXXjnb92Fi5NLS7W47K1mO2UkXvNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718676731; c=relaxed/simple;
	bh=rj2Nf7O04/cChFM2jf9WY3Iheo+jsB66PmVhqe/rFfA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rsLaMi5dY8xtBmZcKsxQ9Re+a9BZZesu47VFW+Q2bRDfLB/C/54Mc2/u+c+kUH3wgJXJVyfAhlDhkc40ohgqJFeb5A24mxCZpA3D8fQ18EQ6Kb0xur3/ElV5jBRPhPjumOL6xPIldvboW9qmxL2HTSn2aRX12CNXvzuPJBF4pxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=aRD1ef0d; arc=fail smtp.client-ip=40.107.7.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="aRD1ef0d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DLUbTEi49hWwBl+H6d9FNOYqsFe5DdG6RA3CasFUp7mjoHlteaxf9I3DR7qLJ1E27mUd5xXghZZnNG5kQVGgAPWvjc7qTML8Td8N1uj/Q6mBZ2N6Ox4DC8uIN4X2WtZjht3v9vlBguMZY/TVTlgwXDmEhgRU/2wdkRs/HsfBEU6JchT81yUdECp+a+6qjxtw3jGOZFYAs7TCrUuShxO7jV8boXpbeFpKU6qhJu4AZ7AaZ+L2p53j++Ycc2lkIO85brK7fk7nDQY0RnfVKTwCT599T3O4zvbFULC6xS5Z/Mv/ErMkUfcZtlXQY7LCyw77MXWWdDkR89F7FS8Qqxd6Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rj2Nf7O04/cChFM2jf9WY3Iheo+jsB66PmVhqe/rFfA=;
 b=e7lioG3PyasO7GWDIGt0Fcd6Ef8F7CnWxUgORakOWiuWXrcPVHNYKrb/jNTaqNZycIlcA/WebxsDDh4fajW2m3xg4m6tUFhiwZ4I6YXubY3fm2YGiMfXR7ec7MmGCchMMCv7gnGulGr/TCFXpPhTdbuxL+iEhSUnOkKBJQZJdWzKQniRBYaR7ZPZIJYLtiCXWNxeJb8Kwh52blMqSGK9hfWEPZ2b6Izs+JyoUMRIVJpZPlTNj1xyUF3E3ioSj/t20OZLvraVlc7LwPaPQC/QyiJYhKZqcLw4xGOV4Uq2mcomb63dt7Z4JcwR+1KW8mq99dZtX5uBaRmwT5Z5V8i1Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rj2Nf7O04/cChFM2jf9WY3Iheo+jsB66PmVhqe/rFfA=;
 b=aRD1ef0dWBoT3S6Zbv/Rf+d+rdvhj2yNpIJ6ANBTeUAgAn/WQvdKK49k57Bn3cPQvz2Cvzcc91YQQZPUu6IaLNv9aW0Jl0PYFZud1Y7aQy+dUTfaVOz8fA4e2AqvWYifThEHZ2pHQhWpCCV8F2q7QdkT74QaaYuM0IBtpp8xU4E=
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com (2603:10a6:20b:9e::16)
 by AS1PR04MB9263.eurprd04.prod.outlook.com (2603:10a6:20b:4c5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 02:12:06 +0000
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256]) by AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256%5]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 02:12:06 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>
CC: "cristian.marussi@arm.com" <cristian.marussi@arm.com>, "robh@kernel.org"
	<robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: scmi mailbox max_rx_timeout_ms value
Thread-Topic: scmi mailbox max_rx_timeout_ms value
Thread-Index: AdrAlApOOs97D7woTNS/plZUvgvIdAAJiiGAABo6LAA=
Date: Tue, 18 Jun 2024 02:12:06 +0000
Message-ID:
 <AM6PR04MB594170DF514A3B168E35FBA688CE2@AM6PR04MB5941.eurprd04.prod.outlook.com>
References:
 <AM6PR04MB59414DB0445EDF6ECA46B02F88CD2@AM6PR04MB5941.eurprd04.prod.outlook.com>
 <20240617132811.adcqbpf5u7e4xqe7@bogus>
In-Reply-To: <20240617132811.adcqbpf5u7e4xqe7@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB5941:EE_|AS1PR04MB9263:EE_
x-ms-office365-filtering-correlation-id: db1633ec-56ae-4ecf-6be4-08dc8f3c0d40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|376011|1800799021|366013|38070700015;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?VrHVp3AP2F3Y4+B9Ohaaf8gGvzF/emezUEguoofsiU7eaHp0MpMKPP4Rsban?=
 =?us-ascii?Q?wpnHEJhtBxTgF6IwdnmlV1bfauoz7G9ARiGCkZPg/hxPJ/OBPjjPba1PmJo1?=
 =?us-ascii?Q?5NM8Nr3bIFwF8bp7o25LB2EyeDNKdd7ZsJGV+1GNP6bqZRAF2UC9um/Xjnyq?=
 =?us-ascii?Q?nWE5bQB3W0DE/pRCwWYlm9IzaA48OHs15Fuh8jb+rC6QVUBl0XgUDHSNKinB?=
 =?us-ascii?Q?++nlpOB+CdfLm3tYLWWKxxxxve0biZ262Opft+DNQYSAO079maGx2mIH0tdU?=
 =?us-ascii?Q?KgkVlayUhM0olfe/e/7srn6DpU+G6liBQlnS/y9A3tmgutSxRXJQG+K73D8z?=
 =?us-ascii?Q?vuIegyoRT2MFTg/051JQFwowPLy/xY1QsgGQcdu6FI9SnW2GjbP9PSwWNbnu?=
 =?us-ascii?Q?Adp0cIWN4TZYPV5fB3gHZtlhyj3owYP8nShl74kTFu2e+Sez2q9cb6XT9ErZ?=
 =?us-ascii?Q?E3CcwHHIcyDTUnAH/1lK+BnpqU1IaxqpAyXnHdunmSb65tyvsjOjrGH93rG0?=
 =?us-ascii?Q?KxqBTOe6C37rriWpNSmXge2WN2LRwBHeIcd3c8fgBqpV8DibsiVZDeAdmDqK?=
 =?us-ascii?Q?4TWVGnO3/JN0nuAshToJGo0qiy33Ck+w0JfuoVDdEpjOOv0zs73k76cp/nZR?=
 =?us-ascii?Q?q1bfxlpXhxaIpC/Y6c8But8dTSRfl7KW92hsvm4QvH6qGTSZTk2pBq/sk77p?=
 =?us-ascii?Q?spKK+tdHJo7D/HF7B3p2s51wI4q1xYHu5qxyeqzb9VPBPhvpaRs6Q4zkzNGe?=
 =?us-ascii?Q?cxF6dVW+BqQfa0zEv8hC9B0EZiywO1KMXtFoKM7AkZQVzyq+qjQUq2xOt80C?=
 =?us-ascii?Q?Y1n6UH54ZThM94akmZkmjXhA/LzabD63CrvsiZn8CAo1oXW1Wgt2CRrk+4P/?=
 =?us-ascii?Q?oYsmHcB+559IH9mEfuuPwiCtBRQe4YG/D1csLKoBjklC7FlfJj9+g2958aZw?=
 =?us-ascii?Q?gLPHrGbItKrYfbHNlbVNREAMGUGuWm1U2CuTCvlCMGQyRiiRm7/uHZruZF61?=
 =?us-ascii?Q?82bo8TUuunERgZTPNUKPUq3aDUJFDDX7LFV8eYTKMrlAb9bUsxXcCP2ZKCAQ?=
 =?us-ascii?Q?opFw2Sur8cusyPYHYD99Q3KwWA2liYNCnlOh9Yoshws7pPj27FgbAUTdjW7Y?=
 =?us-ascii?Q?/sgCqHqrYHo+NXnwnZr6IJompWuZQQwy0jjvG0yqkULKMBbOrBP8f3dVvGTz?=
 =?us-ascii?Q?EdOYsMNJ9PqId0At9f0sygusdXtozAZLjJOTwWTL3w8/gjL59ObxadUqeS6K?=
 =?us-ascii?Q?RKe0nVjW2QiHdR9UK0NQcblCoWSB0693sKwilC9U20xf5T9qUb5eazkV22LM?=
 =?us-ascii?Q?ruPFZAucalH/DWsm5XusW8CH8SyBzF2M9Mztlf8g9dVcwzm5431pOgnrDlP7?=
 =?us-ascii?Q?hTs00+E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5941.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(366013)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ZR0nd9qcimLhv/WBKOPpyJNhLZnf/0Y1cw8lR57uikr6D/2zYi/qzgYIx9Du?=
 =?us-ascii?Q?R9GKCJdvNz20HnhhM6ZSxYXlaiAkY5/N8+rzu5sKkNmQACJy7qJIZAxpEFAw?=
 =?us-ascii?Q?ziAfSqmSCLo5e4pjR83CK3FXmlqsqtGEmf2iYSY6ADq0J6LEDptepuAXa6df?=
 =?us-ascii?Q?rosplPdZB8qmEGV0uEr7+CNiD3FHHn/URwNGpdWf18h0zNd8zSaxAg6/a/7L?=
 =?us-ascii?Q?ciasekLp+wt3twFyYRe5YjKbuVuagn7Y5Q5uDbzoOAbHfUuInmJaPvfvcxCW?=
 =?us-ascii?Q?z3fRmBQyoHPlVUITcLMxtsr0GNGuov01dHnwVErpdJWk/3KIpfrh6dPB3nOr?=
 =?us-ascii?Q?BDANB7cZRgBS3wFL43upy3o1/nmXIGAo6cZGvyqYie04tkFT0aUZXCLfMbPk?=
 =?us-ascii?Q?/tT3Qy8pUWcvPo7aL+N/mZcEwOyPU7IHsHqNJQ1qKaV3ipskFgNApBHnHmiQ?=
 =?us-ascii?Q?XIBEFzJ3DKlTAUgNCANAZ4cnY0ulXTtDozbHMKcI7tD97zXtfzfTXBe5RXyj?=
 =?us-ascii?Q?FX6fle8zmHkQ3pCCBMASt2WKSx9iigqbGNoVBIfGxe32v2BMQ6rWJi/RAAcg?=
 =?us-ascii?Q?/IrGIuqPnZRHpPgQkRm6GULT1CTzbUbuMnLhfiCHpn0DcVMvuyu7h0GZT2Xg?=
 =?us-ascii?Q?Rp1sA5IST4tdqRJjTuc+6vv2zrsjvIMnccmIOLDNEKA9H1O7TC/n6Tl89Gzs?=
 =?us-ascii?Q?12zmXCcXE3ko7pVvEgkhxWNAtQHwU6jUHsox0JJJpet2MbvQyLQv8DHFaLRB?=
 =?us-ascii?Q?D82hqbp9NRrmIG1fflDLerkDZbAgRa0i02a5+oRKjiC8sCSeVhuvPa6cIYoQ?=
 =?us-ascii?Q?JGxj97OMauhZmHvL8op0ICJidwIaSz/D1hKzpEd9PL1FMCOC9HjPi8OwZ1Bo?=
 =?us-ascii?Q?nsei/qUUOhRQf4Fec8zut4YAw5jlYk4y0IL/frQ8PzIp1B7PuioUhWg2kQgI?=
 =?us-ascii?Q?19fNAMD9n+IUt06xaJP3xwlZI8ZKxyf/exMgu4/w8Kph2rDLEIihrwTCrBvd?=
 =?us-ascii?Q?cp+iBwD2aNMKizQtffc8LD/VGnB24Js37+DxSnbJk7ttOeqVWSUavFngLL+0?=
 =?us-ascii?Q?lR5pqpCkl4jFU5Zo46D6EwZBqadMif1wUHjqjAzEJKSLguBNZgnd4VoBHWq2?=
 =?us-ascii?Q?yh0Qr2/HLtUYHUe3iHfywn94XnOmZ96Qiwvk6ByF2zIIIl0cSK6Z4iLmIzx5?=
 =?us-ascii?Q?f1YziheAB6QyPeD8tJQs3V3cQ8wIioWJnUsV32aOqSu7/0Sy245zBJ9JV67P?=
 =?us-ascii?Q?kcuqmlEFtEai2IBaFNYYxUpdvojcrvngnTaMWyXliTkQQL69oeaeepirit2U?=
 =?us-ascii?Q?jBvB/+Fp3Ib4wg6wJsGoHcIbLSHHKwQWwrb/LZdkaIwpoPRTIkWaq6e0X/Ta?=
 =?us-ascii?Q?V0+0gvxnZJ8qPnOv35MSXAZxaV76W2LLxznBRC1w5XIsQ28qOftAyaHEIFA6?=
 =?us-ascii?Q?2Gl8u+NR4dJS792PrtgTWf643tfGed1ATHh6NMcyJbwNX9yy296M4+2YsmBu?=
 =?us-ascii?Q?MazxMYtulkTzemamshNsAbdVn8xj0xO/SwiPdVO7nultsV2aQVyvW/sTm1fm?=
 =?us-ascii?Q?EfR+i12iuTx2U/d2UXs=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: db1633ec-56ae-4ecf-6be4-08dc8f3c0d40
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2024 02:12:06.2813
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H77eGQX5dP5iA0YTUb5IUqDFl4XNsM/c9MpElI3PFakQcazHXod5jHF/nQ4qQAP6HPtzECh2+bumovBrkzyRPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9263

> Subject: Re: scmi mailbox max_rx_timeout_ms value
>=20
> On Mon, Jun 17, 2024 at 09:17:11AM +0000, Peng Fan wrote:
> > Hi Sudeep, Cristian and DT maintainers
> >
> > In drivers/firmware/arm_scmi/mailbox.c, current
> max_rx_timeout_ms is
> > 30ms, we wanna to enlarge the value.
>=20
> Care to provide the reason for the same ? Few possible bottle-
> neck/issues:
> 1. Transport
> 2. Firmware implementation
> 3. Processing capability of co-processor implementing SCMI

We have M7 and A55 and even more SCMI agents in future,
A55 linux agent has the lowest priority.

In normal case, we not see issue using 30ms, but in extreme
corner case, A55 linux may not get response in long time
if other higher priority agents have heavy SCMI requests.

>=20
> > NXP downstream value is set to 1000ms, but for upstream I think it
> may
> > not be a good solution that just enlarge it for all scmi users,
>=20
> I think it may not be good solution on any modern platform to have
> such high latency for P2A or A2P communication. Even Juno(a decade
> old platform copes well with 30ms with SCP running at 50MHz(IIRC). So
> I am interesting in getting more info about i.MX before we can decide
> on the right path to progress here.
>=20
> > Each platform may have its own max timeout value depends on scmi
> > firmware design.
>=20
> Fair enough, but 30ms to 1000ms just seems wrong to me to start with.
> I simple need more information to get convinced here.

It is just based on i.MX8QM/QXP SCU experience. We thought 30ms
might be not enough, so chose a large value 1s here.

>=20
> > So I am thinking to use a device tree property for this, saying
> > "mbox-rx-timeout-us", just as "atomic-threshold-us" in arm,scmi.yaml
> >
>=20
> May be, I am not completely against it as we need this if some
> platforms need say 50ms instead of 30ms. Typically any sync
> command needs to be processed with few 100s of uS not even as high
> as a mS.=20

Right.=20
But as I said, our A55 linux agent has the lowest priority. If other
agents continuous issue SCMI request, A55 linux SCMI message has
less chance to be processed. This might be extreme corner case.
But we just wanna to avoid potential issue.

I will post out binding and driver changes if per platform timeout
is ok for you.

Thanks,
Peng.

So as I said before 1000mS needs lot of convincing. I am not
> even sure of 1s is tolerable latency in general for some of the SCMI perf
> commands.
>=20
> --
> Regards,
> Sudeep
