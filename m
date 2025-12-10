Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021092.outbound.protection.outlook.com [52.101.70.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB501FECBA
	for <arm-scmi@vger.kernel.org>; Wed, 10 Dec 2025 11:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765367112; cv=fail; b=flm7eaF4MUdbiM7xYNsntJhe/UvKvTKIuKpKj24+nnLTnbDD//yCO/BeYwT+aF+9Pwu8YOJx+OravFWc73G0zh2fEFgVUp8kDqyGWHxz5xkBunljGseUpq55SOEAKhAssUAq21D0ilJnfNpA3Z9Vzx5/aa6GExUABqf2BNEP56M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765367112; c=relaxed/simple;
	bh=iXfjjPqlRS5wByFB2NT/SRE3Uijx4DXa/orpJAZo0Bk=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=QiPuvftLlggs9MzJrFK6EMh03VbaH+hDRSd6f4lCZLiEGGHIV2KbFixeRP3QIsM4/qqVJAHrNTfhEa6tjiBey9O2rd5/B0wRZEH+ULxfWe9yCkat1t5LAshf6pgVjqLI/STMmr+IsRu0w6l6LjPfN73M5SZsD9J05STmCuj00Ww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hailo.ai; spf=pass smtp.mailfrom=hailo.ai; dkim=pass (1024-bit key) header.d=hailo.ai header.i=@hailo.ai header.b=wWsfULk1; arc=fail smtp.client-ip=52.101.70.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hailo.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hailo.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hailo.ai header.i=@hailo.ai header.b="wWsfULk1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W5wVzY+OBZPPYlW0QagjTsb4jwS54qnq1fi6R8vc4QJlzQt7OYylLw8QFSJk/CTwXRKl6+hrHf/F1mlDcxB6l/mKT9LqoNaZZzo8BhwSFIRX+xD0QkMFIKVj/EHVTNNbT5lw8SvTDiJCrf9vAVoXihlZ03sY4V+0OY70iEPH/ST2I/Mxa0KRMxutgjhDFzgScOiMjSAn9awLP72EJVmV0+QPOECMq5FYETgn0a0X+xSggs6EVMnqAvMfHBikqVE++ENcUK7Dh0xi/6rcaQYJCz1gb0pKLYzXbEFfCKGyXvpZBjcukN3fOvjBZ8T6H2vz63yX0pu/xuVkv9RC0j1FRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bbyeou2KKuO+gPxIpZgYR90og6cioOJeab5kjdz/8/s=;
 b=o1Fpr6eoARlYaaX4p0dbLEXSusaxSt7VM3icDDeyCbb9uhslISWPdhP/eabd+qTKpeP/QyjD7/EGmEVG6yz67k5rCCyStaSQ2Wh/ZOip3vKGWDRZaM4td7oteIDeGFc/MU8oQZaLPhVTUBeMR0PDh7VR8oskaQ6JSTlACH8U0wgfC9KWFrrSHC2E8yvJJ0izhXajGKUfOfnjbkgOeGIkvVk4Rta8W1At3IH5//4xSzQzU0Afjj04+eite0VucC4od1/pXq4d2YZK5uRM/CwZiAGccgSG96U/3ZvDkGGou074k0M75l6BR7DwaSUG35RuyeYb2uJcibdGLHWtx9TtFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hailo.ai; dmarc=pass action=none header.from=hailo.ai;
 dkim=pass header.d=hailo.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hailo.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bbyeou2KKuO+gPxIpZgYR90og6cioOJeab5kjdz/8/s=;
 b=wWsfULk1RFIlQvw4lohhJwpzc7E6hzdhzhKy0hN+8h55ImH5U8zIbE+em3U4V/OjjugOXjEHv69b73cfNDbvHyIbw59loofiqVADLoE1V7nuUCeJQsU41fi46ubpL/KwKZ0gjkvhfFniNfqdjDNfYHsQ8h6NlxkRvCTT9BBtZVs=
Received: from DB9P194MB1356.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:29e::14)
 by MRWP194MB2904.EURP194.PROD.OUTLOOK.COM (2603:10a6:501:96::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 11:45:06 +0000
Received: from DB9P194MB1356.EURP194.PROD.OUTLOOK.COM
 ([fe80::f805:511f:699c:7c1f]) by DB9P194MB1356.EURP194.PROD.OUTLOOK.COM
 ([fe80::f805:511f:699c:7c1f%6]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 11:45:06 +0000
From: Amitai Gottlieb <amitaig@hailo.ai>
To: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>
Subject: Bug in arm_scmi driver before v6.10
Thread-Topic: Bug in arm_scmi driver before v6.10
Thread-Index: AQHcacZiffUeHgiVnEqvtv6cT7NkYg==
Date: Wed, 10 Dec 2025 11:45:06 +0000
Message-ID:
 <DB9P194MB135668B1AD35E56B0BCBA578C1A0A@DB9P194MB1356.EURP194.PROD.OUTLOOK.COM>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hailo.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9P194MB1356:EE_|MRWP194MB2904:EE_
x-ms-office365-filtering-correlation-id: 807b49e3-1833-4ae1-8878-08de37e190b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|8096899003|38070700021|4053099003;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?cKejT4ZCXkSS8+ADavAL3eqqylxZbGXgSGW6o393pvOWcB2qQeI3hpQdG2?=
 =?iso-8859-1?Q?K861/aaInDwdmGMnezu1yDQMMofR2s+6+HnR4c1RfrIaSs3pP0jBxWSLGY?=
 =?iso-8859-1?Q?L+pKONQ9ALtokdjKoqgk+kwP/0kNRrT9RW8VpQ4K/BB+SbPR7Z524jCLXB?=
 =?iso-8859-1?Q?IhkRf+CVfGDRkbEqQ0+jkg5mEtb/mFW9htSX3VJjtlE4CgZJpFvTF7sT1j?=
 =?iso-8859-1?Q?T0NLwDvXq3mDvzYmxT3Kf05kCmT2G3YV/3zBXSKpE02YLk/CGFgKt+Xc1o?=
 =?iso-8859-1?Q?MZsxPSwk/M+wwpfqme3A6lQHtLaq0+uJZUZRcBq3FW3BjpYIFvErXwReKB?=
 =?iso-8859-1?Q?5NaKPORSK5iWDY45ANwFgzt865WEv65zreJMvhfORHjki3kx95lFMJeQvh?=
 =?iso-8859-1?Q?dvXxTXb59Qs926ct+eOOjaGEU7PaTBLv+vOPhVWVuiXmipsKS+HTCjhPXI?=
 =?iso-8859-1?Q?vlUIDu6wvAWCpcyQPUhbJWg6v4VdFM+jlUcWB0fNcblJvt1V6yjH4gSIY+?=
 =?iso-8859-1?Q?fN9NJ+drJTqOxl/QxJm5HhQZQTsnL1o/9N714rugZnVCXSiQ06u7gmf3e0?=
 =?iso-8859-1?Q?AhqmNzzmPp8FgtOWCF1/aBNJfMDRz6LtC5tu+yZTvVrgBDLVSB6Vj+8tyu?=
 =?iso-8859-1?Q?qykSw7GfWoZX6G+RKbGnOXsGJBQ5boHt4uBD0eC++LRkv3yGqRhAfBMF0l?=
 =?iso-8859-1?Q?zsA/AETAJgq6sicuVBa7SjEH6eQccqEtqdTX6hlTNZpSiCSrW4xPoqAbB9?=
 =?iso-8859-1?Q?tqg8DmAs0KFiLMJtzGqo9g72rgdtq96/eIHNGmELQyXfe0X9j1QGSydbcf?=
 =?iso-8859-1?Q?KBo5SMOUmvss/5YCEq94xRFRjCDCrp9BDcUAIUoauhtPD/ZWct9BjWtkTy?=
 =?iso-8859-1?Q?Ojj8lYEGXddBp0h84SEjxW+hsX/2E4DH1r1bcKUj49yM7RqCsvsIKz60bl?=
 =?iso-8859-1?Q?vkE85iCQ91NbEgNrdKmBNAViPaJzAVMCrlPlDpbHUBxApdNxt+asCKwNTP?=
 =?iso-8859-1?Q?VF/jWtyfYt1N2w6pQ8ELTG/vNg3hsnQHe4D76QiSzee9jpfNRGbJipy91+?=
 =?iso-8859-1?Q?9NAVIsxN7RRrZTkHsxApJIacQm2MaBMoDx1jK5ibGo6PjCXPGNNxlVgqNK?=
 =?iso-8859-1?Q?NBTDKqREn5FdZs/Jx/W1AWb4KDfzu1Tgqg41yEeUeOJuCfP+geeILAc9bD?=
 =?iso-8859-1?Q?6cIfYIe2MJdYWh7yWiy0k27uVj2dBtB2QAOY5stIGOWFdONYthN3lHZQf0?=
 =?iso-8859-1?Q?05H5hSAwQFXkNVhHQ/5DT4z2utxCBfkmdW0/v2nBF9BuV6oA3Tjsnd7gQM?=
 =?iso-8859-1?Q?AHmxbKU4zOzsCO0TSemSzcaEqRCSRNkoAXeP8xSZucAs0CQKHr1VFsPWlK?=
 =?iso-8859-1?Q?JKJaHhUflQ5CqIVI/uM6W8L61HUt8WyHVwMZfJlqVnbb771ZOvT/yhA7kW?=
 =?iso-8859-1?Q?IO/aeUHfKP3FDrVkf62rglurAJhmEFTkps0kumAtVkItOovzPKssX0IMgw?=
 =?iso-8859-1?Q?a0YXRcshIfaF6ZN0jApg9ft2Rpp38AhEoqG9nzehh2oQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P194MB1356.EURP194.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(38070700021)(4053099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?z3cgr6Ppf/01S1lPkeisfT5IbHs7FBkus3sIZYJPjkVGBMpkKlVCT8DBuM?=
 =?iso-8859-1?Q?XjXbDT+36+HKtn6/GiVnDCnf95YsKHrvzPceMQeaO7Rc+WfJPk6lnuKKVv?=
 =?iso-8859-1?Q?z5KyU4Zmfs6VSAbhxlmSS7WtWnw4yMMUg/axE4/+g+Xb846ERnZOHHPqCV?=
 =?iso-8859-1?Q?w6+yJL6tuj5QCGZDgu7+nnay8qmKvOxA5Vfg/QJSvOpkctObLIwxHV2AWi?=
 =?iso-8859-1?Q?xIN2P7g+gdtBshch0ziD4NErJeKrLvy/IEuWmlk0h3YutB/OTaA6MkxHYG?=
 =?iso-8859-1?Q?WFEVVG1bdIEquBRmj0L3cQZVnb5XVW8ov5jgpV3u16erN9a4U0qIuMDAp9?=
 =?iso-8859-1?Q?xH4jpXDjrnYP9L1ROuX1LXv93bsusf7JjwLY7C4Nkyq0/nQ9nN9ShPpruV?=
 =?iso-8859-1?Q?P/5OHUoCz3D0fLeNhHTqd3TTCbQkcWCXMbYuH7i28h70ux5HNOh2lbKwrN?=
 =?iso-8859-1?Q?pbjDeZgSs037RNgmMCj+zH6Sx5E7dBSetpfUliDBhV9WUl0ipwFVW1Ybgy?=
 =?iso-8859-1?Q?BRQkvnOq8xII6aoD/y7mKtDSncqF9UXBv0o7OCOYy4hR6HE7nsVCbGdyEV?=
 =?iso-8859-1?Q?c1kovvmQPGoYopZmT16wMIpewgsueKXtXVTW4pWX4+aIXmMTVBmdvWaOqB?=
 =?iso-8859-1?Q?/sAevCF8DgY+dgE1xcvCF45Q6AsN8s9VAjAmV122/01xrtbltQaBkPj0Vf?=
 =?iso-8859-1?Q?RalUUSvAitKXj27mkcRrBUdNZOVvd+OU35EsR0eccKVxbNM3MOXrW54GJh?=
 =?iso-8859-1?Q?omYYYYgoScE0azTS65/H1ZLi2Z5foBZkislfz6OBkS90TH+tMYeYa+/oU/?=
 =?iso-8859-1?Q?HBlpFhJwexwH/bX2LtND21Zant2pR3t4jCGMlPrHg099NDL9c3KG1OZFg1?=
 =?iso-8859-1?Q?NoEiSkv9X36eC5MMtx73oFFQU6UkweRtHXsIXV77DdO5IJGeU5+YGjecEH?=
 =?iso-8859-1?Q?pFhsQFuEd92+H79rpBwnBiGWtNxfiDrncXUZy5n200DR20OJxTHBkeRtbA?=
 =?iso-8859-1?Q?AAXMZc4BvMUvM31B8+grZAfB+VnjeI4uOJSmJdzfIQhRckfaop8jcDVae7?=
 =?iso-8859-1?Q?ORhwzNKG1U3AoevkQGZTdF2RIxqd1hmpFRKxRWhP3iuO6ObDZjOqlZR7iO?=
 =?iso-8859-1?Q?OI7jKwUCPQ0nRTG7cX/PFEeAzRzpzNdDQa6NHlNDFUDVEkSGZ/QsEM4DrH?=
 =?iso-8859-1?Q?6T9Xsc7iONLtLsexXfuXz+npXpzRl3bb0BEr+C5siabzJj5I3XIzPOyw1E?=
 =?iso-8859-1?Q?1osZRGcwcRaGl2KShXrgoIiG9VOr9e7tT8lFpk7e80w9VO5X6ceTuFlYq0?=
 =?iso-8859-1?Q?SF3N6OTAAyLUpwsl41SPSktKcLepkvwyEWovD4Lg7D7nnBrWpyzVE28m4+?=
 =?iso-8859-1?Q?1zDqRwya4kvg5ThcbandYu0kSsRGd9MgaXn6huEutkf7apmNQG5Gylbm/S?=
 =?iso-8859-1?Q?c4E3iJiIa+eni9f37FDAPkliAp8g8KER/AOZkY1RbrE+XN3l0QxGNzCZo8?=
 =?iso-8859-1?Q?djp4Ww10rDbw/+ri8dCF4Bk2Q5IM0pcQQj+fptRBwJuT9hEvNOGJ9SxpL9?=
 =?iso-8859-1?Q?rXZX4cuA6v3zL7KBjZCxJygx/9nERuzpEZE/Cb7Ex6HDJxF1UOx+VZ+p+5?=
 =?iso-8859-1?Q?J/Xh+yFyFVhb4=3D?=
Content-Type: multipart/mixed;
	boundary="_004_DB9P194MB135668B1AD35E56B0BCBA578C1A0ADB9P194MB1356EURP_"
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: hailo.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9P194MB1356.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 807b49e3-1833-4ae1-8878-08de37e190b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2025 11:45:06.7799
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6ae4a5f7-5467-4189-8f6a-f2928ed536de
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XbM1Dhhmd/CS6Kh8n+0PlOjI4UGbKlME/jHElzrQNqESFIss8zdiMZZYCpwXl6DNytEpHAi/H804Kjg2o3soyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWP194MB2904

--_004_DB9P194MB135668B1AD35E56B0BCBA578C1A0ADB9P194MB1356EURP_
Content-Type: multipart/alternative;
	boundary="_000_DB9P194MB135668B1AD35E56B0BCBA578C1A0ADB9P194MB1356EURP_"

--_000_DB9P194MB135668B1AD35E56B0BCBA578C1A0ADB9P194MB1356EURP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


BUG DESCRIPTION:
Function scmi_devm_notifier_unregister<https://elixir.bootlin.com/linux/v5.=
15/source/drivers/firmware/arm_scmi/notify.c#L1531> always fails with -ENOE=
NT.

AFFECTED VERSIONS:
All versions before v6.10

ROOT CAUSE:
Function scmi_devm_notifier_unregister in drivers/firmware/arm_scmi/notify.=
c ignores the notifier_block parameter. As a consequence,  scmi_devm_notifi=
er_match<https://elixir.bootlin.com/linux/v5.15/source/drivers/firmware/arm=
_scmi/notify.c#L1498> always fails to match. I've attached a diff file for =
v5.15 for clarity.

CONSEQUENCES
In my use-case, I cannot safely rmmod/insmod  my driver as rmmod fails unre=
gister the SCMI notifier meaning the next insmod causes a double-register w=
hich sometimes leads to kernel panic.

I already reached out to Cristian Marussi (Cristian.Marussi@arm.com) who as=
ked me to report this bug on the mailing list. He also said that it may not=
 be critical enough to fix retroactively. It's also worth noting that in v6=
.10 Cristian did a small refactor of this code that fixed the aforementione=
d bug.

If this bug is critical enough to be patched, I would be happy to take the =
time to help.

Thanks,
Amitai

--_000_DB9P194MB135668B1AD35E56B0BCBA578C1A0ADB9P194MB1356EURP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
BUG DESCRIPTION:<br>
Function<i>&nbsp;<a href=3D"https://elixir.bootlin.com/linux/v5.15/source/d=
rivers/firmware/arm_scmi/notify.c#L1531">scmi_devm_notifier_unregister</a>
</i>always fails with -ENOENT.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
AFFECTED VERSIONS:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
All versions before v6.10<br>
<br>
ROOT CAUSE:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Function<i>&nbsp;scmi_devm_notifier_unregister </i>in <i>drivers/firmware/a=
rm_scmi/notify.c</i>&nbsp;ignores the
<i>notifier_block </i>parameter. As a consequence, &nbsp;<i><a href=3D"http=
s://elixir.bootlin.com/linux/v5.15/source/drivers/firmware/arm_scmi/notify.=
c#L1498">scmi_devm_notifier_match</a>
</i>always fails to match. I've attached a diff file for v5.15 for clarity.=
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
CONSEQUENCES</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
In my use-case, I cannot safely <i>rmmod</i>/<i>insmod</i>&nbsp; my driver =
as rmmod fails unregister the SCMI notifier meaning the next insmod causes =
a double-register which sometimes leads to
<b>kernel panic</b>.<br>
<br>
I already reached out to Cristian Marussi (Cristian.Marussi@arm.com) who as=
ked me to report this bug on the mailing list. He also said that it may not=
 be critical enough to fix retroactively. It's also worth noting that in v6=
.10 Cristian did a small refactor
 of this code that fixed the aforementioned bug.<br>
<br>
If this bug is critical enough to be patched, I would be happy to take the =
time to help.<br>
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks,<br>
Amitai</div>
</body>
</html>

--_000_DB9P194MB135668B1AD35E56B0BCBA578C1A0ADB9P194MB1356EURP_--

--_004_DB9P194MB135668B1AD35E56B0BCBA578C1A0ADB9P194MB1356EURP_
Content-Type: text/x-patch; name="arm_scmi.patch"
Content-Description: arm_scmi.patch
Content-Disposition: attachment; filename="arm_scmi.patch"; size=471;
	creation-date="Wed, 10 Dec 2025 11:25:04 GMT";
	modification-date="Wed, 10 Dec 2025 11:25:07 GMT"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZmlybXdhcmUvYXJtX3NjbWkvbm90aWZ5LmMgYi9kcml2ZXJz
L2Zpcm13YXJlL2FybV9zY21pL25vdGlmeS5jCmluZGV4IDBlZmQyMGNkOWQ2OS4uNDc4MmIxMTVl
NmVjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Zpcm13YXJlL2FybV9zY21pL25vdGlmeS5jCisrKyBi
L2RyaXZlcnMvZmlybXdhcmUvYXJtX3NjbWkvbm90aWZ5LmMKQEAgLTE1MzksNiArMTUzOSw3IEBA
IHN0YXRpYyBpbnQgc2NtaV9kZXZtX25vdGlmaWVyX3VucmVnaXN0ZXIoc3RydWN0IHNjbWlfZGV2
aWNlICpzZGV2LAogCWRyZXMuaGFuZGxlID0gc2Rldi0+aGFuZGxlOwogCWRyZXMucHJvdG9faWQg
PSBwcm90b19pZDsKIAlkcmVzLmV2dF9pZCA9IGV2dF9pZDsKKwlkcmVzLm5iID0gbmI7CiAJaWYg
KHNyY19pZCkgewogCQlkcmVzLl9fc3JjX2lkID0gKnNyY19pZDsKIAkJZHJlcy5zcmNfaWQgPSAm
ZHJlcy5fX3NyY19pZDsK

--_004_DB9P194MB135668B1AD35E56B0BCBA578C1A0ADB9P194MB1356EURP_--
