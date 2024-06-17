Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2052.outbound.protection.outlook.com [40.107.249.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB741191482
	for <arm-scmi@vger.kernel.org>; Mon, 17 Jun 2024 09:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718615838; cv=fail; b=RXWqGm04i4nu7XaBlcg8+eyr6GdpTW9Rqz1Jqo4Y3hCdxcJAwyixLNF1AQtTIcpc1Yjy8SUoocc7G6iYKx3nv9ronPyykj8FAPeUvaimpLXQXM/quvykvZTOEp/uMitOM6p18EwGAHZyAiRTPdDGAToROs1TW9KLkd7yxLq0I7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718615838; c=relaxed/simple;
	bh=2lT8qOEsYMeDa2Mo8Ow51jzVnT1DF9agXld6JJuF4M0=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=fV4G78t7o7s9XcBP3XVZAAMxYj0fPlsiJ5jZq65QXGqVXxvbQcaWLmE+GONmXJOrU8FzhPv94ZrNdtvGzaerps4UH0Zgw946L1YjfyRkUtWEK473gQoE2myEWkjvZ7QwtZgMx0+11MMmN949QEADOKukP4tOoN8GXbou3KS0zB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=AmNLnIiP; arc=fail smtp.client-ip=40.107.249.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="AmNLnIiP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pc7l2kTKGXBWAFsMjthEoKxLyOsjvEPdT6pKTqApi604JgUXl3cSYNcT3cjzjnFn+l5BAgxQjMz3YJEht/cNefkle7VAY5CHLKvCelCVjAwbaqbYiTa1151Q4CDhW+XmeSI96FewRkC0Madr2ffszZRwH4QLXA0/GK86xGfXljrsiTnTHovoP5A5poMuwDs78cH41SmCbZjANhLLuqrAfCWkaJ4j58P774N/5hS99wxtEk2sBX47cO1e39mBexMMMO7Ko0BfxCaIHQlY5VJkWLOSHg5i6s7yK/TOMhe8B1cJIFHIyAYgTD+y3r7urk6TTGYX69+BJgxZXLUAhQJUFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2lT8qOEsYMeDa2Mo8Ow51jzVnT1DF9agXld6JJuF4M0=;
 b=AqNA/rgLUUAxNTxX6VvT1y9fOSTLvojjttMKtdLeo0UKltkz97Al6Zb6sHKsvqM67KBX9GDIzCAduGVAILk/gbKy/xccpym3+wYaBW5hO1hxSZCFY0TP0kccXsReqalHhZCMSZvxobKmQ4sVgo/YKqH24FzBR2XBqSGpM6NeEF929pbviibAen9YmlsmwJevoDBDYS2g9Oeue3FfMJQkBfvVVi10BiM6ziol6m6Gysf7KhO0444B+NztcEixsldk2ERwfo/ac6luVk6IxiFXxPvW+pqKZvwRmUU2dUCgpLwfH+73yruoBDJVymuJinFjvHfaC6h2csDGYv29tAPJDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2lT8qOEsYMeDa2Mo8Ow51jzVnT1DF9agXld6JJuF4M0=;
 b=AmNLnIiP9Hn3O0GSRoRLpGg6GSfR4rdJ6LsnrE+t5c3B0QiUgYyy3wadAgaJ1XdeXK6hvwEEXXwhLzxzroEa2z64F4ptpKslmQ2ugRXaOFIfZ/1ZZALCHGR6IuOJd3nPVcGIO/RZycnyC67N/K4Bjl9Rh7RabApe/LLrP42lD3s=
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com (2603:10a6:20b:9e::16)
 by GV1PR04MB9197.eurprd04.prod.outlook.com (2603:10a6:150:28::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 09:17:12 +0000
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256]) by AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256%5]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 09:17:12 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, "cristian.marussi@arm.com"
	<cristian.marussi@arm.com>, "robh@kernel.org" <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: scmi mailbox max_rx_timeout_ms value
Thread-Topic: scmi mailbox max_rx_timeout_ms value
Thread-Index: AdrAlApOOs97D7woTNS/plZUvgvIdA==
Date: Mon, 17 Jun 2024 09:17:11 +0000
Message-ID:
 <AM6PR04MB59414DB0445EDF6ECA46B02F88CD2@AM6PR04MB5941.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB5941:EE_|GV1PR04MB9197:EE_
x-ms-office365-filtering-correlation-id: 2db854ff-9199-4842-59a5-08dc8eae456a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|376011|1800799021|366013|38070700015;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?/AN+byDAz35sQ7o7C12xWoS2YvgLQbP0CtgY9bQJ4qna7LJ0WkNOhywbT1Aa?=
 =?us-ascii?Q?dRaqftzJBG+4WPOdTRljdjryH5Z4+WWcYdJHnSiV1ljfud8mGjYoKcyeHoil?=
 =?us-ascii?Q?MaNjYKiMjVxKi8HCCwWZr9EHrhn9MOtvqZJ+Q1S/ynH2woOmM+AtIfvpdvyQ?=
 =?us-ascii?Q?5jcJmeu/NzhGpd84gepiy/1N7D62D+t3kelY94NwdEzkRbrnk5xj6+iijYF3?=
 =?us-ascii?Q?cpa/L4oXNtzJYfOn/bwsaymU+KwfG2neU92PF5PHHuIXLhVRRH2WwGdWoAY2?=
 =?us-ascii?Q?G7CQKWA1hG5E1rzmes5xBaWpNDyykoMvVxF+XjuTOR+1Ocz+64WihitcsEhD?=
 =?us-ascii?Q?jOiwoAOnhXg+NzFFsPehtlRmixrVVCbmBsyHSAwU4CIt9XyLotFisa+d4Por?=
 =?us-ascii?Q?qX4AobC8foF67wSw7QtoRHy32if/yx5ZDF/KXSTdeifu2tNXB72+5LCO4p4v?=
 =?us-ascii?Q?tbWVkMOkAAljUyq3PY4AoISsMv7PmIFRswL1mC2ZrRdvh4YrSLH2hlWCJvb8?=
 =?us-ascii?Q?Xcc2xuEmJMmNi/OR4ErkCO3vD9JnSj1rD0sexMZ7RU0ECgDktLfUTHR6ksju?=
 =?us-ascii?Q?dHIO0JX41hM4V8qZ2psTFhdzFxrp9c1UeG9RdE//le/3BFU6Wmxs6lkBb7Nj?=
 =?us-ascii?Q?066+bqBbcdY1MVlscknO+MihLnBy6Uowx9PV9HyCr32z00JoGt1gLW6esrGL?=
 =?us-ascii?Q?l7tX4Zux7avbVYLrTORGe4e1T8eU40JNTgeFZoUga8EzynQFnQ9rXuy29Mh3?=
 =?us-ascii?Q?5xznWMiq3xoT5MO/UZUhxsyQlhPEApI8dWea26ZXBDeCc2ZJ0paXVdOZueDD?=
 =?us-ascii?Q?OsYA7sX0j5JqeTnh8Ea34x6IJvfqOfXq2bxpNUNszigz8ZzuLR2hLAdK+udd?=
 =?us-ascii?Q?sQBL58QEL4gttuDPP5C+b/CQkHqNmSiZpwLoSjv9i7y7bhrLi+3RNggwcicw?=
 =?us-ascii?Q?zEP54L30EGpVE8Y+GdEbqY4ECInYD59GCgKKxyWdtiGH71UqQQDs6Z0qSu5x?=
 =?us-ascii?Q?5bpzZXndLEWB7IO6GYAW9fIHhLNbG7lFCfmAblcLsMN6wF1B8PzLtrH3MB4+?=
 =?us-ascii?Q?zkRLj3Wwz6vRaKVBObQvunSTZv7wCEg/2o8Fnw5mamLh2hKywNvjM/fPEg3b?=
 =?us-ascii?Q?1EOWpGb6YGkc0eFAvt4UNjgjzApDRRclM7kdB4jh3RBzLDQ7/dU5i2+/dc/r?=
 =?us-ascii?Q?GzVleRDW9lAwJ0grBiST2zMscz+1EhDPPF+VPr8r/J9F7PCHZdzT8/wc4DFD?=
 =?us-ascii?Q?CFIw9UdRxKsvUdwPH0byy0g4pOk9X3zzmfeQjfZVPbImkNW78NV1o6eink0e?=
 =?us-ascii?Q?06gHKRM360gZXwrGy8/08dEH1boYN8b5Dm58CFUeQ3eTw5LS/pnx+2+GkueG?=
 =?us-ascii?Q?G9BwJmU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5941.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(366013)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?QnXEiRxivmwS9romK+2NGGxZ8YM30bwvXdkET+5pbqTFsScTjCjPy+0cXnWX?=
 =?us-ascii?Q?5v6fytDwrf96dF8KltXDhKM6fhPWAfJZ1Zsldg5wQ0sKhSMKX9ezoH6TWajp?=
 =?us-ascii?Q?kT5HoteGpqKdw05EYisyx/xJEeBcyetSb17fc2N50YXEk20EvsuWiL4R1FhN?=
 =?us-ascii?Q?fCgk/R981wqUYeKgH6BaoSwExSFCiMVSe9gLhwGDMuvw1vJa/Lgc/XyhatMW?=
 =?us-ascii?Q?1dYjCOpQyLMqblS9AZzcwBxO60vdLFtCpAUM3C+VtvpnmDFKWKstngw6c6SR?=
 =?us-ascii?Q?fGN0lt2KVoO5+bS+/fkw9gog2ZEPo8ccDHCU93KRq0pMk7uCLBP/Du0BRiVv?=
 =?us-ascii?Q?AJkLHbiRlkvJvekfZVipWTeUndK3ua84m17y9QTaTnCmI4ZW8YpmQcHmS28s?=
 =?us-ascii?Q?Ijx9fcnx/+LmJURvEUADus+L871WQdsw3ygchvVGbkO5XfBUhdGu3AycQJnW?=
 =?us-ascii?Q?xJk0BTQITSKJpS34PCC/wcAeow1d6gsAQ20JhUdT5FjCS+yy07sc+/5pmYOD?=
 =?us-ascii?Q?4I4T1Rd/c/D3i8KVD8Go/0bAnnVG/lGRWBNxxQsY/B0rfxEOWiRTj/R7kULd?=
 =?us-ascii?Q?u/TNbmRv5ZY3jHsbt0HuGc0wb0hzd9tYM31jYCN9hsrZ/VJVmnyuCHGQtTYf?=
 =?us-ascii?Q?smPJBOn91E1Okwoi8ULjrQ5KhTj4O0Svk2q1vhfTGXyqD062ISBzZyRDtsCN?=
 =?us-ascii?Q?j111wJtBRYiWmU7wC28Qp0vdcprf0tEhebLkJCKrVSdQBLBCrGOMwdULODyG?=
 =?us-ascii?Q?aJdE4qMNn6oxL5pRpf+Z9/vIjtjmSqKPr5nH+hMcN7Lh6D71ohemc5tZHDES?=
 =?us-ascii?Q?eteL8hXWXrh1VXrmnQmLY5uEcr3rfCaqR2XlMtp1Q5KqDVDwKV7vH55qY7K0?=
 =?us-ascii?Q?hlJFtfXAA37YHctOapDzwJcvmHJe2JgUqwacXmvo31uCKXcRpsh67oWzMfnf?=
 =?us-ascii?Q?EOpN2yuWM8B7rJM+G9ilL/LgFW0WeXttdcrTj4G7WR01RrBNgc6Dn2U3YX4O?=
 =?us-ascii?Q?zGxpM5RBsbKVVdIDSV/jaKelALyM8oaPfcH8XorQZXhrD27jBlrTSKUSKNuc?=
 =?us-ascii?Q?dyqcOk2PkceFEYBJHpPjCN/OpmANK3TAp354oOSF38VyO2W5gHb/q7voWx7g?=
 =?us-ascii?Q?A10Dml6fdwtblgHVpGu40PvU3DfcdW856AI1hI9K7dpz2QhBRabOrHYoQN72?=
 =?us-ascii?Q?s2cmX1coPqLMxRWo7je4kMPpkvnOfZC0k2Q6vcr5V4cBMbpGtQBmrzvjua7C?=
 =?us-ascii?Q?Hxwsdk753HrhgUuFcK4egH4K1v936yXDsS7agKDRQ/nhSA6ES4gjAlSRRotx?=
 =?us-ascii?Q?phrV5oyRElLeaTgJdDFtK9Mm+hNKwWs/NjfIbLXWuA1r475/Z+jtlRhrBdR2?=
 =?us-ascii?Q?ntfSmKDNTMdVXgdHmtIoVdlV5YUW5sWaZCFGmme7kPtwTtFX4TjDABOcSruZ?=
 =?us-ascii?Q?wzQ1XvguM2+wGBefewFuQ2orLVKS6rI7Yrg9zP1Rtg6puZbZqyuhfblJNfnO?=
 =?us-ascii?Q?9sh9uKIFLQ0dlLViCXdtbV77hD8cA50Fs2AkdQ3y1Y4u8/9adD6Zfy1Muis/?=
 =?us-ascii?Q?6s1mI8Xzbu/QXy+LuAM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db854ff-9199-4842-59a5-08dc8eae456a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2024 09:17:11.9237
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yk97wooR9/x2E1QU/XDjj0nJ1oKdGeiEzwiPqXAX4c5EYjEux+dtbdt12u0KIJHIGFxJMcPoa+r4iebdcFtxJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9197

Hi Sudeep, Cristian and DT maintainers

In drivers/firmware/arm_scmi/mailbox.c, current max_rx_timeout_ms
is 30ms, we wanna to enlarge the value. NXP downstream value is set
to 1000ms, but for upstream I think it may not be a good solution
that just enlarge it for all scmi users, each platform may have its own
max timeout value depends on scmi firmware design. So I am thinking
to use a device tree property for this, saying "mbox-rx-timeout-us",
just as "atomic-threshold-us" in arm,scmi.yaml

How do you think?

Thanks,
Peng.
