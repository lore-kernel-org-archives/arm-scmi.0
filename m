Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013018.outbound.protection.outlook.com [52.101.83.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AB732A3D8
	for <arm-scmi@vger.kernel.org>; Thu, 30 Oct 2025 02:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761791781; cv=fail; b=bZKDEGC5GCJyF/V4ZR9CgNra9HcLXHNNGmJV21x69c9b8EgOG4s+bkUgsJqwE4zDOi4LhF6bn8u67NnOemQnOS8lW8JKbP0u3bjDe5X0SmHgrwyXWer9yy1pxVceU+4MqlvlP63sy+mjtPUgw4Rsd+0S3OdBP+vYqnPMhDSOBJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761791781; c=relaxed/simple;
	bh=e4GVrVa4BkCgs5Aoym6Xj6HfEqgnUcRTa03ju/mtw/o=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=p4SXGzv6L4Wu1AjHCp6bgkq4Di8tWuuux2ILXKT7N7b+ad1kLldhSNzvJCX5FKe6ncSciSkydzlkZanEG+Ln54R7o7w3/mP2LQyqp7mtXxJ1i0XkkH0e9WiDuC5yE2W24ezGpBleAlUqSCfEQDGAiUzjxCJDbDCmSul20a3DowY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XzDWK/hN; arc=fail smtp.client-ip=52.101.83.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XzDWK/hN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tYZDD55jXFBKHhkx2yxBlYS09woMUoziw4Pp0+BPjQUt7S2WLlOlfjPEIF1s8AlvfyvDuHjFS/v+FC5yP9C7kiI/cDrQH/D+qXk+Z2gQl1/Xo2zTqe4aKo5OcjvUveeW53n+ldK2J26K7zTRwiiylPhrI5DGLo9zEGvFa+N77tEe4hxDydPLaVJsanqC68GcFtjzWsMZi4tv3brOh5l7XG5nz/iAUsZ8rarzaSiezNgBHTIcE6CiUG6/MSZAaEneVDeylAa1v0F5rcU+0cO3tWRFxvLmtWcvFM/eFaElKaP1AgrK5jSFw7vQD1v4E5FxOVgxMh9TZos/q0i7LnuoOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APXVsmsHY93euLit4l5gpO+kz+e2bjkCXlG8OVOsUPI=;
 b=DtnASwqggjkdIwjLRKhD2O0yl0P66WPidSfL85YpXCuVQeMsIsSzkF6bs5Dyu2l0Ndl6TPEKyokRi1lUR0qCvTLw5gXRsN4VY+cOb8ETGtBzj9XwZIRE0I8szkImJ9wwyPTvxBm9rsVsCumZLIzpVbEKEiKOp5q5r+WOm6EMcfMBJ6qDa5KHxZLSxLO2kKhP8DwUQ4QZ/YWtJcTUuA+vIF8zy21fJhWQXYmB6yDW+vv8iev1ttzgKGwO3BNoR2DVV8nuht2dlF+LRlGgj7GTGiq5XRnz1EgzMqHYoNExebW+VESphbZ6RBpq9OuXzWohqBxIvmXv9n8rwlUcYqO+2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APXVsmsHY93euLit4l5gpO+kz+e2bjkCXlG8OVOsUPI=;
 b=XzDWK/hNfHyfgxuD6c4hpD2rA9p5M9t7FpfV9sqyYJeyctyenpWcxhctiZlh5yDMgBeI+4c51l8ow9uwNP4tJe4vtfbp4/VH1AgEIugoffKi5fyvVVsvYr//GFN92C0a2TqfQtZe4d8bhOu85OcdvX3chSAwIpZQSdoUADFOwPdbrobcS7h0dk2Lfc68GGlvpMYL3TTqGPL3iCbe00QgW/ZXDR4fdOeDu0xu2IX30tn6MWoKHSjhXfd0qD1KeDEZddzMKgy1Rt3dMb97NHEBsgEmAX5XfDvlgn6ydtNAmsemJPktxIu3oYj/Koq4NIl6qlZmE8qI76163KXEwDbnxg==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB7806.eurprd04.prod.outlook.com (2603:10a6:102:c9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 02:36:14 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 02:36:14 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi
	<cristian.marussi@arm.com>, Souvik Chakravarty <souvik.chakravarty@arm.com>
CC: "open list:SYSTEM CONTROL & POWER/MANAGEMENT INTERFACE"
	<arm-scmi@vger.kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>,
	Dhruva Gole <d-gole@ti.com>, "Francis, Sebin" <sebin.francis@ti.com>, Ranjani
 Vaidyanathan <ranjani.vaidyanathan@nxp.com>
Subject: SCMI Clock Protocol: clk_round_rate() mismatch with actual get_rate()
 results
Thread-Topic: SCMI Clock Protocol: clk_round_rate() mismatch with actual
 get_rate() results
Thread-Index: AdxJRRxlARKjZJ4JSrmZv/oapwBRfQ==
Date: Thu, 30 Oct 2025 02:36:14 +0000
Message-ID:
 <PAXPR04MB84594F6E2CE36C0EA1EAE24D88FBA@PAXPR04MB8459.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|PA4PR04MB7806:EE_
x-ms-office365-filtering-correlation-id: 80145c8f-321e-468a-f348-08de175d1872
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?iJdY2uqrZyG+A5cKltfis/dwsN+UnLUP21nGXZJ7Ag1i04qhK+masIz2lWMX?=
 =?us-ascii?Q?XAiD/Z6u6S8ZDcNoSK9DtDc6J/NgKikz++mS+AP3tz9L+JCe0MumdQCzHj8a?=
 =?us-ascii?Q?O35WdFq+QRA7cFKtcV12iVGRXZkhFsk4qbKQszNEL1Cqu0JgujWr781BNN3B?=
 =?us-ascii?Q?ngLosdut0jO6Dr9Q8Ijsij+mJxtmN8/S4rbYWB0bYKWBuwAiwVKB0bkQufj1?=
 =?us-ascii?Q?2fCuhvxCL7JvE/VydeWHmBJBytseRV0tF1MjtNnUxjwxqcRvALPMXAEe/FVi?=
 =?us-ascii?Q?cOx8D538SYsMFGEJOc6ZbilRaCqnt9d3j+LqPQJmmtlu1P6naWUhkcB3SF4g?=
 =?us-ascii?Q?9F+UgQRX70kX4XGPjVqdDFXhbHYQzskioPjVVMn6RZoldtZNh2/I/3x8gEjf?=
 =?us-ascii?Q?Yj6c46aCyhsvOXHHpuSdMJsEz4X9JofYfBkmL0ilF113PZaKJC+RFSGwPvXa?=
 =?us-ascii?Q?AnYy4CUBfq3qjh949aC4WJc526O26gD5eEaj4/nivFyp+3+A5aTL4UUqL2u0?=
 =?us-ascii?Q?9n4XhKzSoxw3e6YPip9lkuOpqm6MbgmfuPv6J+tLqP39t/yt6iUIBwYmUsMk?=
 =?us-ascii?Q?v4caY0rQqYeylWppYrXUEQBrawHjg4VYw6w6P7XWBgVy8kvKKydfMcHFCdTe?=
 =?us-ascii?Q?Pa+cZS4eSTm5n+2UPV04o2VDpQ1EUpWPsxWuX0KIFVgwc0XgxPnGmkr6ZTz4?=
 =?us-ascii?Q?g1ESKLcHr4rr1s/4tcKf9prcyr4H+bc1CJpsK384acxkapDYPf3WOjsHUbGO?=
 =?us-ascii?Q?amtMAKNemgNFst+ZGvUTMdnqFT2a8BI6BoCxn+5+GQYuzWUtVzDwVD/xp6g0?=
 =?us-ascii?Q?0GXqzIV394C+NtqKXPHiMLUnMdEwJYCherfzkvWEx/44OOT7YjJ9PVtTF1cf?=
 =?us-ascii?Q?2IxmKTaqpM91hy8Md2eUH+K1uy563a1XVP9VlIbYOqVaENItNIyZ/PvWI+5O?=
 =?us-ascii?Q?JZyhW0cNMOKPseyFzcrtRrpd6hkW+CrhoCDRWw5NI54ECKGNeAtzBlbQfv7/?=
 =?us-ascii?Q?r/6aSOiyPCmxIoToJDt7EvGTP2srNDe+pMFrsxPZcdAC441xqegKXsHfQDuC?=
 =?us-ascii?Q?KA/mmQIrlwsdNcsEIrB6VK2jRtKaTs19cg9kb7FsNT9OS1ipo0P34Z6SMo3R?=
 =?us-ascii?Q?7UZTyS5OsP8vYDYCMkyHmjPC9MNQ5rq88kBcDeGFOHQCXPfgZ1VWbvIGwg6z?=
 =?us-ascii?Q?++HszYak+J555QU6IcycjuAfbVAYNAVGx4fifY7ixERImIgTGfwLO7mxeOfO?=
 =?us-ascii?Q?xWiCQpYhizbH0PsJGx3JfvanmL8U877xRgemNPCqN/r1zxyUVdISTU6NqRpv?=
 =?us-ascii?Q?FyHxn8KZiSZ+ZG1jDoa9FhPheYjWiFDPDwdHKNPb4MQa2T6b1IHgoxpCypNl?=
 =?us-ascii?Q?LfMFGdiSLE9lKp0CNyK38bHFxmWCR+umziI/p+oRinNkIYe2yPyvJFh4lzvQ?=
 =?us-ascii?Q?uoKQ+F1mcWPOoJgfuCIkk/MOw49b5vGDHiIuNxrzvVuWy3Q6Rvmwamj4tM8t?=
 =?us-ascii?Q?UoUdGjsg79XJE/6/+tUyRjX8PYHTnK3A/KU6?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?RRsyuChgLVqT5DLD4ackJJO1FuXKNdFuMTK1e7l6Fmjnl0RJ6gjHTa5vQzM1?=
 =?us-ascii?Q?mi4XfgfP5hQXifTt1SwY4WvERJ4spODHhqgXrMaFPErXetLhR7mpn3ruPoy1?=
 =?us-ascii?Q?B4xVVH3qq0tQKPMa+3HAw2fbsx59vxsc6+7bXA59bzvJnNvgw6VIryUNminH?=
 =?us-ascii?Q?u/rsTmvmBaLijVcwoWwzitUWsQBv+3SBxB4A4LsSMllkWfXzjqVNeqWIz0RW?=
 =?us-ascii?Q?pQ8+4eVoW511/4L6ItT0OjugwEaS1n1ZTPc71kP5QrkBDsBedRBhrXgx8udn?=
 =?us-ascii?Q?VXBiE9bO33lr4jC8T05h+U5UTB8Yl+h8kt8J1dvJBjiadSKWR5szYrA+PMef?=
 =?us-ascii?Q?DsJpFHdJJho9kq8Sk2nFCkv3MHwgqtUN+xwjwpZ2SevImUVpPWE+Plc1MGsj?=
 =?us-ascii?Q?wretq7GK46eP0iKZcJ0opw3dPTUfjfw6+OKscIrjJCp+zTaNTlCcwvTJLpkk?=
 =?us-ascii?Q?HIDCxCNR/kFA2J+gwqy9nEK0KA07jJjjPCYJaOeiz4vB/40fu4ysnOHgKFyh?=
 =?us-ascii?Q?hWwIwTuePvNwvTSNE3L9zFWEqzuadGVV3NfGOtXnBuxZoBuNsjCrwSffooTL?=
 =?us-ascii?Q?cxyqVBqqqEV92OIk37XCKWxwKY1HL3FUE2JohfVDBi1vCTZmizRQC6M6E2dr?=
 =?us-ascii?Q?mcwbZAwHKVxmHOfWMoZ8trUBJ/LOGgsaAuZEH17CRyH0iNYnMu+qngNsc9zE?=
 =?us-ascii?Q?BKYKXs4LNQ4PLlBfvggNqdnhrx5dvg0LBJX7Cnne1dkMV3OUyAdakK2WBSki?=
 =?us-ascii?Q?wE80VcvrkBosTHGT4s7EMeMhLm+DIwpg7S2ISFQB1GGdjzFjxcwzB765E9L5?=
 =?us-ascii?Q?TboPjXRMnkOBezG+RWUcMU3jIYQyOQLMzfbfxJSoYWaFLcYGOw3Ibl/c/HdD?=
 =?us-ascii?Q?W+wj/ZrvCZfiWpfX3fueG+/f+cBznydZ0soLRdU/V48lAh/z2YFXouYS2o8N?=
 =?us-ascii?Q?r/v0yMasGbsPfuMLZK300433a/YcRICnv4VWCLi0/JAGhUERCMyS+Q437akv?=
 =?us-ascii?Q?cb7mDuRez8jwIIdbbRWMq+U5q4t5j085DMlTZEYnn1AJBpDfzhHEU1cCAORI?=
 =?us-ascii?Q?99CTVcZcrx1GeygA4FBr6iC05XSLlOpkAWGQQK2HBKF+avXUu74uMjHYqCHs?=
 =?us-ascii?Q?mq+tq3pXoURWO1yuMbm34bPG+4utxuI7abWCOV/t4bMFg+e9NSDwcOGakqax?=
 =?us-ascii?Q?NegjHvvhlFemqQVDFY25lXetAYjBIqV+9Tc2MVbGkv5zbD3eEKvbcd+iHR39?=
 =?us-ascii?Q?3uWRCUdLIjt67A6P0SMGB8dypXiSm02seagqbO4ToywLrMgGeBGqCsYCZbEP?=
 =?us-ascii?Q?Jhd4oxccLZF+OahZpgVpAccpN2sH/SEQFidn5QSGgN8OXWP44ILLJ/VYKCiw?=
 =?us-ascii?Q?j1iRFgBfrN4y6efM3I4UqiLabJnSef5NFv6upLlGvUaHDTb7/+cZBQ69+BWe?=
 =?us-ascii?Q?Q8KmoLhGQ/2dxD5G9v2v+GN6ijD14/syTD/BUUDKPw0Amp5+g2Qj5vduSNWI?=
 =?us-ascii?Q?2bP82UIJbwzx/w52Nh3XW/EyGxiKMxCEOc77uhJeS2gcCGv1N2chb3GFc3j7?=
 =?us-ascii?Q?pKg6AQW8c9JVFHZiqDs=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 80145c8f-321e-468a-f348-08de175d1872
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 02:36:14.2139
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XHpFyMMeHA4XQPUo5ovZCmgTqZHG9F1GYOLv0dT/fQ3ZbB3caySeCwKZARyD1DbYfkz03RfiC4mJ8JnSxqz3Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7806

Hi all,

I'm encountering an issue with the SCMI Clock Protocol implementation in
Linux where clk_round_rate() returns a value that matches the expected
rate, but after calling clk_set_rate(), the actual rate retrieved via
clk_get_rate() differs significantly. This discrepancy is causing problems
for video modes that require precise pixel clock frequencies.

Here are some examples:
1) Expected: 148500000, Rounded: 148500000, Set: 148500000, Get: 148444444
2) Expected: 148352000, Rounded: 148352000, Set: 148352000, Get: 111333333
3) Expected: 74250000,  Rounded: 74250000,  Set: 74250000,  Get: 74222222
4) Expected: 74176000,  Rounded: 74176000,  Set: 74176000,  Get: 63619047

From what I understand, SCMI does not support a dedicated round_rate
protocol operation. The Linux SCMI clk driver uses the initial clock attrib=
utes
(either a discrete rate list or a min/max range) to implement clk_round_rat=
e(),
but this does not reflect the actual rate that will be set by the firmware.=
 As a
result, clk_round_rate() often returns the expected value, but clk_get_rate=
()
shows a different result after clk_set_rate().

This behavior breaks video drivers that rely on precise clock rates for mod=
e
validation and setup.

SCMI supports clock parent relationships, and the Linux SCMI clk driver
correctly builds the clock tree using this information. But when set rate,
it will not propagate to parent, because determine_rate() is there
for all scmi clks.

Questions:

Is there any plan to enhance SCMI to support accurate rate
rounding or feedback?
Would it be feasible for the SCMI clk driver to verify the
actual rate after set_rate() and adjust accordingly?
Are there recommended workarounds for drivers that
require precise clock rates?
Could SCMI protocol be extended to support parent-aware
rate negotiation and rate propagation?

Thanks,
Peng.
