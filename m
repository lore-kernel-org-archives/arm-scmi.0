Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013046.outbound.protection.outlook.com [52.101.83.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764472248A0
	for <arm-scmi@vger.kernel.org>; Tue, 30 Sep 2025 13:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759238542; cv=fail; b=GSqUfAeX9qXfXZ/c2WCUmPVpcrcNqsWXBjY8vHViVTHpIqJ2HbaMPrRGHE3JvMUK8MIsDlMbckGltgsY5sKySSQZ/E7sdrla+ZwkitYdfBooIl66GV3jhv2tDGtWF9nQI1qt9yjU2sSRG3zvUTR6f2MfMlTmkws1YxZEB2CFrsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759238542; c=relaxed/simple;
	bh=8sy/oPaf5w0Q1q1I7admzAV6OH7DWKtd/YNg8h9DS9I=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=slL0ACp+62bA/NixBSb5imsA8QCBGa1QRA4bFVYdAy6i9q0dWTx7fYWw4nqHrxjhzRDyC8//Gm9u/+HnGVfHZGgST8T1fbTwGICogpl3TXso34R0Smo3+2J/j3Dw4BbQtqAlrBhhUIpZ497RoFzdwzdXoCFddVSqpLAVJIAqkPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NpYiVHcQ; arc=fail smtp.client-ip=52.101.83.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NpYiVHcQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FUEUTTdSEXtpxe1jm6vDk7D6IE4vvE9aMF7k7hN2qKerp9dR3D+TIHBI2h59+vd0qqtIlxkawZIzZndDzk8WOV48VcuEcX2AU2RGU6MFAJwY85mOaeqY0XHK2vDpQL0NN6WPuzitDiktT2FgyuZ4U0yEhFW4GEyjEE2A9zRraoIazMQ5xVwCnnrcMJZrZwJDTMXRXQzIDD5fvgSxlfT9Io+NuStFWqR7YsSxn2lxYL4QdiIr65k9hZvSAEufO77Y5Rw7je66K0E5A+rgZQiXxrcLgPuZTJQebxnQXDHmt1dDCsLEhnVlfMwKAVte1ZhimguBrZQEPY5jKIm1+PzuzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSRglLsPS844TWBQAoc/gPxXRppYc3aisqFBA2oM410=;
 b=jN/BHD+w5CgODe9hZDRaGGnsL+q7yKCjmifO9BVD2n4KE5zviVN4H7+KbMt5nOtYB6JRU5/kqjyF9tfbWjpmvAE4CymVN0uqPzik8aDNUEW6SbIPyJT7/KuL2oIt8Fh8wwfMxewQF0mH6E3AcuYtvmWDUAcbW+yhnM34jf4Lc7Q962u9nES/78VUjc8NoBa+jJnOuX+hD8WnncGf1wLjEHJJFA+20B2lVagmm1gXl1nHoXY5dLpRUUlqXowZkeOWKs9V2J2/gC6sbpaWIBvcTUs0pLaJMlpN9MMGspFO3WndpDb4Z1/9LLKZjT0jAKT2SPUz25QCZY+X4o3dof8neg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSRglLsPS844TWBQAoc/gPxXRppYc3aisqFBA2oM410=;
 b=NpYiVHcQ2RVdVCPFpswSxbXZaOsNOPO18skI0lW6jfYmuDepmHcStTCXAXvklQy3GESpK5lFPw5W8dBlEPRcTIEvOtCxAAwgMax23pe4BuS4neBG0Zf/xJU8YWKTLtN4YcZgmC5CsDjfnLY8NDLplqPyAl3iagRAuZjjGJjQJqQZUcPEaXNOIRAmEZE1m6CJu5kit/+bi5VATxFkQ4b1A6QgsUsEhTEEXd9Hih9UUa3Y38fa7Nv3MD0zKOINkell9McZwtsedgPsoNxMwIg9kNWCRhb8NczTTtepq4VIDb6F3wRrnQ6tYtS5qKw+XZU2+2nPW3WJdrXLJy+502YZoQ==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB9973.eurprd04.prod.outlook.com (2603:10a6:150:112::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 13:22:15 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 13:22:15 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi
	<cristian.marussi@arm.com>, Sebin Francis <sebin.francis@ti.com>, Stephen
 Boyd <sboyd@kernel.org>
CC: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>
Subject: Add OEM extension for clk-scmi
Thread-Topic: Add OEM extension for clk-scmi
Thread-Index: AdwyCiBSq25IwY8lRjauikw+8rfD6A==
Date: Tue, 30 Sep 2025 13:22:15 +0000
Message-ID:
 <PAXPR04MB8459F97453698D981B52BF38881AA@PAXPR04MB8459.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|GVXPR04MB9973:EE_
x-ms-office365-filtering-correlation-id: 9634d665-81e0-4be8-48f4-08de00245f88
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?F2xAO1c6oYthaF/gmeZzVvdUz4hEIhMKGy0k5/9zU6/6F75Twwc+j3hHDQHG?=
 =?us-ascii?Q?saC/XcCi1kfuZF3FNRS+wZk+BYPz7mRYMrK1PPtxurGNIfB6H22RWVrbMdva?=
 =?us-ascii?Q?tE5hhtHsz2BS/MB8Uju/PiJVAxkVh2/15c0V66b+MdOtMuIFJB0haNmp1rC/?=
 =?us-ascii?Q?yO8hyq5cNUbsH/K1QD391pK+x3gxxgVMvDqnz9C1moy7UNMKV3ojx9V33LOA?=
 =?us-ascii?Q?Z5wft7/C/Xvr3HgyABNw/DqfVr5Jkmg9m6+fhXxzznd7XGt0c+bfkmlyQCdn?=
 =?us-ascii?Q?FDddD0xj6jGkiUrTEbB4WIcGcdm8XdkrJ3X/0TTJlKej0DayvDTlTuw+3iu4?=
 =?us-ascii?Q?RKLEMp9pPGFP0nP68RRE5A5HdAE9jdH81BX5xx1pDtJQoClNMz100GwIBOXD?=
 =?us-ascii?Q?uoOsnLj4mX41Mznl66XtH2yAv1l0JcY73kT+ahiajTWU9GeUj+TYZyuBgFpo?=
 =?us-ascii?Q?Y9b+09yJXfOOwqqc01nIFXpSbD71n8+onVy3YgQieBDV3uKTsYokvmuEJedP?=
 =?us-ascii?Q?ZQI10ZfkwGwXlZMWbXyRte6gn2f5KLzFFND1nfvMdCXQsOB6zzSNyNWFHF5p?=
 =?us-ascii?Q?GhytS8bDVLXyyV8YaCs1L67KKdtme7ijSpu0iy9vN8oQ3KKF66SAq+X2A/XP?=
 =?us-ascii?Q?U6hkukTB6I2TTef3UR2RiEN3p5KoszlqAdef5ZrjNqddPF3aOphjWJcMXxrE?=
 =?us-ascii?Q?+lhwUlaD1qMwLpSWp6exHzHwPmcqLfsn98e9OHbYkQDNTQ2gURtkKKmqVPN+?=
 =?us-ascii?Q?PLA2zTyGAUFmcLboBcGyDJl7wZsC1QNVddPmkOFIw1C9JewpXNSm6VyPxVQd?=
 =?us-ascii?Q?gRsC25nonz8C0ceEDv0dmhX/Ab9WVkY4XRhXLl1rtcU1HMA51bfznpI7MHnw?=
 =?us-ascii?Q?fpJ/FSxYkLlnAOGrgIg0qV2PEpAKN4OBBPIyHmrRzE3HR4bb6VbPSwJ+qNMX?=
 =?us-ascii?Q?yqK3WG8ey8OtL12HK43XDnDgnsbvIKo1+Vh3Y67mzHfUVjuTj3vCkRXdP9BP?=
 =?us-ascii?Q?Wpl4MhfnFICNOXPW/1Dz0opL+Wtw60hCwFhov5CdkuEbyVjPFJKC+uAeVKs5?=
 =?us-ascii?Q?072QWT06yw2RkNAtxMY+TRJQz6o3wxMyBwjBJaTzeE6ZN1PHxdDl4/0pZ1G4?=
 =?us-ascii?Q?PCjaDwr3f7s6SERlOxeiGEIYO7NnvASP918lsTyj7miKkZiC2viv9nH6XWmc?=
 =?us-ascii?Q?4h8QuYf3AcOzRiXiaJC7OAoaqhGHaX82Akag0WpK3eNaHS+LIYV6oJMN6Vyk?=
 =?us-ascii?Q?o25TEqlB7S7wjwRteuaOtcxAuPPDOGCcrScnBgcQfc7LtC2BpXs5CDX5p0qO?=
 =?us-ascii?Q?2PR9GUsh32RevRrbh/hhBsej5S7pkAEUUJ93EoReugOi6hkum7Z9y0dZ8bUo?=
 =?us-ascii?Q?HPHzd5Y55EX2GQVlRqixgCyi30IGT/S5rUBX8g6Hy1x/wjNgZsCkBY1fSA5X?=
 =?us-ascii?Q?MkJVGEKxuOzEC4b3hH92WhQ6DWEPEhA04vQFnVdZpWv5xoJupvviTi1rqS64?=
 =?us-ascii?Q?z+gDBBDmHbSxZMaFUj540McTuuBDcWTmKewZ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?aekLRFfTBZJE2753Qz0yJLSyNy4RWix9+5xKK3vYmeL6MwFiuItlpj11FVnU?=
 =?us-ascii?Q?JqGxFHnbtU1gtIkDtdYoEg6M4Yu4WEsjgHa1AUCD9EJbY2fjCszOs5/zLjzX?=
 =?us-ascii?Q?01Y+ybddkvwUGnPKNO57XHJuokxo+4BNxuZY4eXPuKPC1DXJtnrvamoGEyWz?=
 =?us-ascii?Q?WsfqFY39AZndumSLiuY+a762vGwYu8nwNW/+NnisSvBMAiC5bN4Aoj5tUQmL?=
 =?us-ascii?Q?hxzCYZZSAfwoZH+wYdWlFNOaw1IE844v2y6/x2V6k+rbn7p61TzkRNTTs5rK?=
 =?us-ascii?Q?LPQPtPQS34wWkqlZT9QyiBTL/uS9COfeI87IeQN4TxMtFUhtncDmr208S9jb?=
 =?us-ascii?Q?k/PjEKIk2gS2wf7G5y98Lylu6VOIZdz7iezF8dxdvXCmJf9ij9Wv0hRdk3f9?=
 =?us-ascii?Q?eyzbQVA2CIGa/EILu8PT9nDclszUSpZsze738Jb1DGD09LQPwfZY2q0NJw2H?=
 =?us-ascii?Q?4qW0KNfVQynuKcdMdxirwVdAnykESTtqDhFTMOQxellVGfuOa0cQb6UXet3v?=
 =?us-ascii?Q?4rgXKrtNo93K5GojZeSNJ/yqUFy0k/l3TgU1t1I5ROFW6s3ctR0ocrrdMVc1?=
 =?us-ascii?Q?DA9LPKpf2Hk34nlP7OfDRp+AP4RqfExRJzckQP4oeN8cgMboWwVDB4sAcvdm?=
 =?us-ascii?Q?eTi4tw7pfkuuzwRDGjxkJiEZjs6xWtb9jP4D3huvjD/xoC7BaAIRf/+e94RE?=
 =?us-ascii?Q?9btwMeYSQTzr631uW+pf/EuPFrg+faLPDTCSSHcu0y+Zs/IZ3dFofbMUPLon?=
 =?us-ascii?Q?NijschJiNCg0WjdmruCsCpgW5JVLbFAUgCAZKNK0r/5IL37d6nSaG+7mTVOa?=
 =?us-ascii?Q?kC36l3PhPG2Wf8ogt7nuzkhrrfnJkM3V6VJM/XAgZqt6Zl2Cv8K0ZmdvbQIf?=
 =?us-ascii?Q?inWl3/T0oZPJNonv61l7S0AAOWdO/6oceGxwU/23IP6U/IpKbFVchhEITOve?=
 =?us-ascii?Q?jGBEzrP/KiHQvwYYsNkKzWE2YLG4tzeN/0XyqssFm3t3LxPT+s8D367/sQkX?=
 =?us-ascii?Q?bPNfG2AdUZfyBCZ3vCYmozH9hwCmsBK8JKiHnEsLE0DYCx+qQ5sBRdYkwPO2?=
 =?us-ascii?Q?H2/cxXmqnJKgjvfU0rOiMAmofOfATe9Ci4W27fOI7SClyO/qYFhTMpb5jA1c?=
 =?us-ascii?Q?LK5Vf3p06306yC5+PnpRno4GSPbOCUP+gukgGRK+KF7RxwVHwGdW/7LxNgoW?=
 =?us-ascii?Q?FS2c4kAxKMDtV8af5AzWvssPn/N7XInAWj592lYCGVOGD3TPt8U75Eu9dGzL?=
 =?us-ascii?Q?Cmxl1NyeP3PAeYLb+wEkwlPofUv5RyTifeTUFwt0np1un52BUmJBCliKalVf?=
 =?us-ascii?Q?AruAD9dPgAGmMr4KZyFw/LwZ7KYabM5XNEJ7tDCYMCXTAcqQa/bZWtr0UKrR?=
 =?us-ascii?Q?Wfe046c0tzouLVgLml0YxuXUYDHac/ecVBcaLSoId0ZX06OkiNmY7brBJkql?=
 =?us-ascii?Q?7n1OCsMbeXWQ0dUZEY3ubU18KVJvbqSIneV5vkn8EmaHu8pQrmzta8786d+7?=
 =?us-ascii?Q?ulEljlUq/VvXX448myJPreLRQ2dekOxEmPwl6HJ633E7BbFGr03d09AkeI42?=
 =?us-ascii?Q?CZlY7yY/7J3wjimAQkQ=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9634d665-81e0-4be8-48f4-08de00245f88
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2025 13:22:15.4661
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nNf4OJqmfZ8DoaRAntPGmxV3CwqSKodAlxPpToR2f8thkYLKe55Id3aJa5sxf41U/paXeTlLhc6KLKdFEI0i8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9973

Hi All,

This is to discuss the spread spectrum support for clk-scmi.  I think
it is hard to provide a generic framework from scmi core level.
Because oem extension varies per protocol. And most of the
code added is in consumer driver side saying clk-scmi.c not
the firmware/arm_scmi/clock.c.

Based on above, I am thinking to follow what arm-smmu
implements(arm_smmu_impl_init), by calling a function
scmi_clk_oem_init in probe.

And define a generic feature macro in enum scmi_clk_feats:
SCMI_CLK_EXT_OEM_SSC_SUPPORTED,

Also define a new structure for OEM stuff:
+struct scmi_clk_plat {
+       int (*query_oem_feats)(const struct scmi_protocol_handle *ph,
+                              u32 id, unsigned long *feats_key);
+       int (*set_spread_spectrum)(struct clk_hw *hw,
+                                  const struct clk_spread_spectrum *ss_con=
f);
+};
+

Add a new file clk-scmi-oem for up plat hooks implementation.

And add clk-scmi.h to move some code that would be shared
between clk-scmi.c and clk-scmi-oem.c

This is just an idea, more code pieces as below, this does not
pass compiling, just an idea in my mind.

If you think this is feasible, I will do a formal patch.

BTW: I will be on holiday in the following week. I will check
email from time to time, but may not respond in time.
=20
drivers/clk/clk-scmi-oem.c
static int scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
                                            struct clk_spread_spectrum *ss_=
conf)
{
        /* TODO */
        return 0;
}

static int scmi_clk_imx_query_oem_feats(const struct scmi_protocol_handle *=
ph,
                                        u32 id, unsigned long *feats_key)
{
        /* TODO */
        if ( the clk supports SSC)
              *feats_key |=3D SCMI_CLK_EXT_OEM_SSC_SUPPORTED;
        return 0;
}

static const struct scmi_clk_plat scmi_clk_imx_plat =3D {
        .query_ext_oem_feats =3D scmi_clk_imx_query_oem_feats,
        .set_spread_spectrum =3D scmi_clk_imx_set_spread_spectrum,
};

int scmi_clk_oem_init(struct scmi_device *dev, struct scmi_clk_plat *data)
{
        if (!strcmp(handle->version->vendor_id, SCMI_IMX_VENDOR) &&
            !strcmp(handle->version->sub_vendor_id, SCMI_IMX_SUBVENDOR)) {
                *data =3D scmi_clk_imx_plat;
        } else {
                /* Other SoC vendors (TI) */
        }

        return 0;
}

In clk-scmi.c, using the hook to update oem feats
@@ -375,6 +388,9 @@ scmi_clk_ops_select(struct scmi_clk *sclk, bool atomic_=
capable,
                                                 &val, NULL, false);
                if (!ret)
                        feats_key |=3D BIT(SCMI_CLK_DUTY_CYCLE_SUPPORTED);
+
+               if (data->query_ext_oem_feats)
+                       data->query_ext_oem_feats(sclk->ph, sclk->id, &feat=
s_key);
        }

@@ -313,11 +322,15 @@ scmi_clk_ops_alloc(struct device *dev, unsigned long =
feats_key)
                ops->set_duty_cycle =3D scmi_clk_set_duty_cycle;
        }
=20
+       if (feats_key & BIT(SCMI_CLK_EXT_OEM_SSC_SUPPORTED))
+               ops->set_spread_spectrum =3D data->set_spread_spectrum;
+
        return ops;
 }

Thanks,
Peng.
