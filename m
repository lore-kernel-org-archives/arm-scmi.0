Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012066.outbound.protection.outlook.com [52.101.66.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801E539EF15;
	Fri,  1 May 2026 11:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777636654; cv=fail; b=ZVrDT+3bOqfOrChyFzxv3bIFKP8ltP0syZDIq+9A32QLwLZwPKWdKk+3YT3dIfhSn405OhSQaoNR/j8NDRoavVw61hhTqBMcFRzyPugEW7gjBbpfPoLPEPH75i0ixZZN1PtdnNikCA3FrG9FahFcSC8LipGgK1v56JKMmyyCYLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777636654; c=relaxed/simple;
	bh=rncQtdMtxq2FuLx3/PJb+ykn1A2tZxYwuX4t90AX0s8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XczU0DHze49FBEkSgv+3DyDtn1HqnyHHd10jK9cOKX80gAvYH45BhmxBA0DZKCv+nylR3owXpUgB4pokX+7Wzj8yKEKxOCSmOp6ZBEsXqZgWKRDXE0eSTDrPAlpCferwk7PqErXecCsJzqYNVt5evcE33V1yicfv6SkDEwkhx+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GWLJ525u; arc=fail smtp.client-ip=52.101.66.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GWLJ525u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qF3148OLXHprNPkgZLZC9KBBpsE0EGeA7sF45utMH2PmJvRjMYIaDBmPgUdz9ddM8FK4YNqTXin6tykPpcKhUH4tVTygBDNPb6afInLeg52gt3uYuUrgxeFPiVpcVH47Hz4NAyu4XJqBOkhlnfVWmOB9XZsRIZaM4l5RsgKUaRXl3fEYOW8TdHYJnrPspsT7a9X4WnGOMsK2oFGb0M5o7zk3AuN4IIfVb+jY9/zpH2tOI6eh57BmMTVlD9E/CfpBLZuPnZk/YF0wKXWtLzEusbBqRAYTBaAeJhPOhmR0XSXfDc6TuA/AiQX4PHFOGe1k/pqbTlrQ19YSgh1kp6Nz4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rncQtdMtxq2FuLx3/PJb+ykn1A2tZxYwuX4t90AX0s8=;
 b=DCXHmSJxtgIQDdNswBvDVt3e8Tcm/V6Ka74tizL1KRV9RkLnCUGZKVoKjcdWptPrswgW0U6BwJ95aD0cLG/K+NtvBMNgloYlrxg9/M4n4qLbYCLRclUG+cncsMpabkZvFTbuGuhiKagZpAdCV9TG9ppsRrnKMQW4TKIwKRQnaGB8hbrGNKRgGoPs6aMTOlD9SyUf+f7WLbBE75Y6BCn2PGNu3e9lSGo5Mj3E9h84rc3Vu7RiWisJO2M9N5uWluiyTPCD+OzDLHD3BYvheCuQt/vqQgMVvfTo6bV1qX+S2xNYzlkfpvDor9rhwfc/zG136ezDrlRzbSwdvV1DQPxqKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rncQtdMtxq2FuLx3/PJb+ykn1A2tZxYwuX4t90AX0s8=;
 b=GWLJ525uWXN6LPoLyOuwk6updO7avuw7qRkr6UIiP6futvvEbsKFOBuzC6/OkXM14iEMkEbH1A1y44iaeRbJpvU78A6QIuY8tTcomym2Vt3BIcNW7RNsRtXkBHMAiHQzelo1NbIYeBFWHOaoTN7/RYtW+tTF+FktMmQt8Lf3ax1/foasvbcGww6bhOd/W4EzTmWI3Z9/ayyNzAVr9hEbUzhRsKQBuuMwu/9sNfYUME2Ary9uwkyJT7FF2hc7JkNbGdYC9J9hQhQeGBj4LSGNtioRHjQMoV+VhP49dB0lGJevgHubfuWaxlT6gwA3UaWSJdJY0heFxQxcf9SdeTFYng==
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by AMBPR04MB12231.eurprd04.prod.outlook.com (2603:10a6:20b:758::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Fri, 1 May
 2026 11:57:29 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.20.9870.022; Fri, 1 May 2026
 11:57:29 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Cristian Marussi <cristian.marussi@arm.com>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/2] firmware: arm_scmi: imx: Support getting reset reason
 of MISC protocol
Thread-Topic: [PATCH 1/2] firmware: arm_scmi: imx: Support getting reset
 reason of MISC protocol
Thread-Index: AQHcrEMkxuFpKXWm1EKbAIc1MWSZ9bW0fkKAgEMshQCAAb/MgA==
Date: Fri, 1 May 2026 11:57:29 +0000
Message-ID:
 <MRWPR04MB12330499DA799B788B0FB78BD88322@MRWPR04MB12330.eurprd04.prod.outlook.com>
References: <20260305-scmi-imx-reset-v1-0-18de78978ba9@nxp.com>
 <20260305-scmi-imx-reset-v1-1-18de78978ba9@nxp.com>
 <20260318-savvy-courageous-mule-b3f9ae@sudeepholla>
 <20260430-private-versatile-jacamar-fd932f@sudeepholla>
In-Reply-To: <20260430-private-versatile-jacamar-fd932f@sudeepholla>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRWPR04MB12330:EE_|AMBPR04MB12231:EE_
x-ms-office365-filtering-correlation-id: a150af36-4cb8-4413-8968-08dea778d1fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|19092799006|18002099003|22082099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 Z848AE7i2cyEPrz/8u8eegkBnpu7Ei1iTwXUj02dv/gPvYGA+7+Z2Yf9KSIvxXsGhcKsCL2e/yqMzfl+qO3c4eMVHHRXmxmoedFv/L3ldcVbRNzW07tg+gP1dNYbIJ6MpVabFusZLwJ70EHjRbHyh9Nhj+ZObG87AFuA1ydZmSKC7kfZV/ye4zp6XJvmz0GGamiOjoWT1cw22yJpygGl1OoUKo5z6i/uW853qfqgvE3V1BkHbEv9H3gHsav5iKSLP9/xG4y8E4OfyrvMOT+JnCw5FNaUpM7q+Eba4J+w1gWjbQ/xt50R3ZIDrKSmgQy7YGk90W6Pf5Vyn+VpGU4eoVhiZk0PB2JeJ/WKC63Izj3iLvAELEEDVUGp2bkt0BYOdcAxrJyi6Q4hW2IxswSPBcr0l8NKN+m/Mpq4Y38t0Kv9F0IV17bHTiQE+u+acHpOBXB7a0zqPyD9j4rHWYByDlexgoHU/PGICDcwFPDVtFewhpIbKN0F2HvKprzz6ks4RFKXdqBnGdbi2nK3yckDq/VcGss9wxLakY05wxkTjhImnGiK6JE8VTNFdYx9g3lWEf8a/UQ9IgI/zDbCY+3Ye0XhgwgVb0Gb5iIyU/DQXMyXEn4GyT4BjzKTSa+Ulkd7dOPtvSO/MnWCoGtPQeZOHLgr8GfDHqRMr/JoTul7Nj/955KmYh71aHI6v74YGTzFQmeYl7DKyW/cOqfaQFcK1VySjayVzMU4vmiIL+lS/6dPdgaytRlXLVUXGPKXdw5g
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19092799006)(18002099003)(22082099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?jp0Q6J72rSHG8sv3kxsYR5SCQhefJcN+A0HuUAR4nZrJYvN2I1h4hV+gV1TB?=
 =?us-ascii?Q?Q+hXsNTTbYoGRsz+WBQ9ORhUamP3r4XeVjKzCtcQMnQ0qpWckGPSQbnwbRuS?=
 =?us-ascii?Q?hG5LnjJGJOkjaZDdZHz+rDIoRU0P/T1bZLSVtCX38kkghP3buURtFNh9v/uz?=
 =?us-ascii?Q?gx4N9ajJgeUoRSeL3TPqzTcH0zz78utsYU8NR8XH/sJI1woUw217+XcwrASR?=
 =?us-ascii?Q?1oE9dFouMa4yKct0cDo/P7ZY0qqTv+T7PqReYeQSJb83Xq5x/IudQ+r1JUoP?=
 =?us-ascii?Q?r+xHd4VYUT395wlYDT6nNZj4g6G3rXUoDYn3KOwII1CqbgVw8eO0HDTOa6EZ?=
 =?us-ascii?Q?Lp6P7tQz5OSnIsVz9BAE+Z9td2Qi5523FNO/ZoY/qm2FuGHaYgtc1RqGQhI+?=
 =?us-ascii?Q?xiDl6YI+W5HqYKAJ09Nsmp8yUVbRnQsq5m3OtKRuM2BqIc8GmfQLYF+TNHzT?=
 =?us-ascii?Q?DKuBGkp1opQRJfJE5MK4dN3feBa5qpMPMOiXGAYOQQJVmOk6bA57bOxPG6do?=
 =?us-ascii?Q?Ury9JNYOxqfa5pGxhHWSTgA498GyCiJwp0ynjNZO6NYTiSxmqU0825BkvrDH?=
 =?us-ascii?Q?xMYeJ4m0GhyiUpR6k8L//tm49+mlxsxxg17nlC/E7d0mkZwaoFhlRDJl4LBn?=
 =?us-ascii?Q?VX+0L7Zr/vGnYlmVkxHa9VzRTv1+acGfPMYHEtaO8Q9Lyru3wsIs7bCpDSvK?=
 =?us-ascii?Q?5Ep3eX8EG0Ru5u9F5CNcTYaLmSkVSCuDKzNLFl3FbxWX2Pi8mlKKeI5VuIbQ?=
 =?us-ascii?Q?njYhmKpwNXCkA99qOYRFpaV84rmEQ6uJY794qPHUXIoQELibBvLBbIqvkaUL?=
 =?us-ascii?Q?Xm0X0n2C8corWI7BbcnCMzLiIM0rx5OtFq+4mg3247nSg6tdR9Ldk2XPWjgY?=
 =?us-ascii?Q?YZBIfTcS5DYWebD0IjXO62Ju9jYc6bq/tcLI+tYRDvaLGj04/FMT258k1YHZ?=
 =?us-ascii?Q?EZUI3z8uwEdz9gnlCVB2RdVF+j3R3XrDNlIM3OKUMwvW23PG48YrmyL1fDY1?=
 =?us-ascii?Q?K83uDyEdnooHsEfCB7dkfQE3GdhzhJzpgF6P5vppPx9dQuQWJwd2Hkr0chE0?=
 =?us-ascii?Q?Q6BlbmUPvX2c3YIHwsNu9K6hjzmPM6pmxwJjgO6zZYqakexY7tq4EBkgNWIp?=
 =?us-ascii?Q?Y+pT8LR0sOct6flFshlZC4itR1t62FZjp9YjKR2uSmucuouWeEZC2HrIUWOc?=
 =?us-ascii?Q?VWddIODE4v6dea5WFJ2InMrFUGEPykLSaWGY1YLWu1qFOwVuJW8zZ4M4/W6W?=
 =?us-ascii?Q?LDvX3LS5blQHGaeDSSVF1L5Ge/5WVc1KGcnHBLAZejPDiaYQfz0k/fbR4QFv?=
 =?us-ascii?Q?oCOhAyVSDms2GOxz2HyHedjECQHqR2aKz6D6Raw8R0KK5xvvn/n3OhTC8YTf?=
 =?us-ascii?Q?Cw+gFCVvQ2iJNGWupdOsQ8BpATVBGEbpWSgYLIxrXNOjDKMwZYA9Ch4+UF14?=
 =?us-ascii?Q?hfAY7eagiLoZvg1amTYpHG2U+P5ENFuIjY/JNFu650OlcDnGFoNImn4vBGMQ?=
 =?us-ascii?Q?V4UShnme3y8841Yh9OZmMCV6/UUFjBkQRa2mJUiXx32YsATmAbt4BvY9N/HY?=
 =?us-ascii?Q?x0/bV7/KsLFu35A6Xd8HseFGe75smGjJBd9gJrtnhWE7wkKLoZJLx4i6Wt3p?=
 =?us-ascii?Q?hT/Gh3+oXynt0V6yF3mF9dE59mrZFKMchkCeLo6kmlqyjAUYSvymeqDPB3hJ?=
 =?us-ascii?Q?bBjUhNJo3ifSzstCIsoAPF/0oxJhIBRowqqM2n1RIm38nRyA?=
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
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a150af36-4cb8-4413-8968-08dea778d1fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2026 11:57:29.3622
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C2YoWN2PaOzkAGeLvc7kzqm3Q6hYq10ceuRjyBHQ1vb8URObdkZXeTPtag1/3coK9oi+pdzRFqgMwFbxQbTpcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12231

> Subject: Re: [PATCH 1/2] firmware: arm_scmi: imx: Support getting
> reset reason of MISC protocol
>=20
> On Wed, Mar 18, 2026 at 03:25:03PM +0000, Sudeep Holla wrote:
> > On Thu, Mar 05, 2026 at 09:56:44AM +0800, Peng Fan (OSS) wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > MISC protocol supports getting reset reason per Logical Machine or
> > > System. Add the API for user to retrieve the information from
> System
> > > Manager.
> > >
> >
> > Sorry for missing this earlier. It looks good though my usual rant is
> > that this MISC protocol is becoming never ending dumping ground
> for
> > all sorts of info you want kernel to dump in dmesg. Anyways, I am
> not
> > too bothered as it is not any user ABI.
> >
> > If, you plan to ask i.MX maintainers to pick this up,
> >
> > Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
> >
> > If not, I need their ack for 2/2/
> >
>=20
> I have left it in my -next queue assuming I would get ack if I need to
> take it. But I haven't received any, so not sure if I need to take it or
> drop it assuming it will go via i.MX tree ?

Frank,

Do you plan to pick up this patchset or give an Ack for Sudeep to pick up?

Thanks
Peng

>=20
> --
> Regards,
> Sudeep
