Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2048.outbound.protection.outlook.com [40.107.22.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97A060890;
	Fri, 24 Jan 2025 01:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737681238; cv=fail; b=NVhz7PUssqg+FER102qEYuncVy/UmWiWHXbxQjyNcmQxKEaM1+mW8ECnp7s5TXO6C0BD1kliOiiFghrnIFgkL332BzC62LjSO7kZ3tu9oNNbyG+bf/DS0ZP3CgUPDocE2It3/A1UJkhgkfhZ5ypHIrSluI6YITfL6o5tNQmweHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737681238; c=relaxed/simple;
	bh=FbzI47wtxc4z1NouZhNmVNbxykTcfJjQ2L595Hcumu0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mEeQxgKViAfqV35OuLjt9I4aVYc/uZuFFiT3+ED6u9DtibXaDxTGzPjurxmWb25LkBPe01/61XPYGLq1DnFvt27KxuY3FNY0zhevy9aKDDPL5i7Bz+qo+tT9OW3n4Ydy0aiJ1J6cdLDYNkwk+qPQHwpUYaOZtvWop1cD8+/9/1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FjobXp1O; arc=fail smtp.client-ip=40.107.22.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FjobXp1O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nONc3dhnleeqc/cU9fo663K9qyKtEsDtlJlc9ZW1+jAbY+RalBAYBFB5DztEyIWdIYH/3RX3vtbBc5bDeqtTCLkrLVKmKPPeExglQAsCpsr3EXl83B+anEzjgNzeRwtCxN0L4OT/55e/dyH9T8YmX/BS3YNqFaeaZqIdlRmBEQt1aVVbuo8sITu0soi50QiWoYpf7hWPnFMpUOG0VFRVs7aCKTO8mG5NIFkg/KfZl5lIYRwRDlnEGyGamJ9UFjW/lUGYavrUmwopMnvdnzAq0nfdjyMP2NjWyUcdyPOiGmLrDPP0SyNgsTUPQC49VKekuGxCrOrnf1yhT6wZafyyTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aU3VKA/bQTWS+bu4+aakGGz0ODZlmqPSORLEC7Iu1H0=;
 b=EwRPLU+RxZqk+5f/PUkVuEi5iBfv0fPz401a5GjoKHj8Xe3l0LndD8brf+7Nk72DHON6h5FGFn21DjIExEmRbtnnJkIP9QSA/aZVPiD3zkoXBGbPj5zm/BlGdwhccspmOlrBB1UGO/iKFqPEcSBbTuIpw1dDt5THKZaN5bX3ZsgXF4ZnlS9lqIi46Iat1JcASgLDACm1vsKQ9fPKwqwvm/dJzpCtq9ppen+IOI9Wwo0GDkkLdz3vWJMYVlDsltbkzA8KzfG6dcdcvDFoEVGD76D5z7M5LfMdq0oYVngF2TTL2mCY00PSdxqANQ//nvB8K0zxULB36yBc9geryKvvuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aU3VKA/bQTWS+bu4+aakGGz0ODZlmqPSORLEC7Iu1H0=;
 b=FjobXp1OHY4qHrJxfHUprtapSWImMMp/UpmzzNVnbcktj5U1yJznb/OPliLlnehyLoPdT/kdtE5gVGRlSxtFIfpg0dnJteqRF/uoBEljB8M928fiYPMqRxnKANJdWbqF2yGbp/TjQYV7WlAGU9KxKU1U/IqgK8skLR5awXdYTHjgS/p8KBURRcxiQ2FP+C4kMpGhLKrQVfkqGrSCIGwNL71LRtlflzSXC1c7QCJmbnDfM51mTaeIqE31cDFTZpRGyEZaEW77LU1c8TnnmW+OD1he+ZlBoHqQ5A/zbva9Qo1qhHj4HfQjU0ZIyMr1zmuH/juACrhul3erTWWwIpllgw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB8411.eurprd04.prod.outlook.com (2603:10a6:10:24c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Fri, 24 Jan
 2025 01:13:53 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 01:13:52 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: "cristian.marussi@arm.com" <cristian.marussi@arm.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Jacky Bai <ping.bai@nxp.com>, "S.J. Wang"
	<shengjiu.wang@nxp.com>, Jason Liu <jason.hui.liu@nxp.com>
Subject: RE: [PATCH] firmware: arm_scmi: imx: Correct tx size of
 scmi_imx_misc_ctrl_set
Thread-Topic: [PATCH] firmware: arm_scmi: imx: Correct tx size of
 scmi_imx_misc_ctrl_set
Thread-Index: AQHbbWEC++aM5mB4eUa1vaBSu2/W6LMkR7gAgADXqsA=
Date: Fri, 24 Jan 2025 01:13:52 +0000
Message-ID:
 <PAXPR04MB8459EAF6D69B99B87D237D8D88E32@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250123063441.392555-1-peng.fan@oss.nxp.com>
 <Z5I0Irl1eUarzLlA@bogus>
In-Reply-To: <Z5I0Irl1eUarzLlA@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DB9PR04MB8411:EE_
x-ms-office365-filtering-correlation-id: 5f149cff-98bf-4438-8598-08dd3c145ddf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?81MuoVpVVTiQg8p1LA2V1GjCCSjFEXk0yNClNP5JqRjeL310NVq9o5GyhuPR?=
 =?us-ascii?Q?+Ty83uyPNfE70012WSDP6PIbc9wtlpmn4d+OA1a0k4myMwDFmBCrALl2kIri?=
 =?us-ascii?Q?SG1HPS7sGNbL990EDExZxcEVujV3wqvJTxRw/1du5wwsuzernx2he6i6iC7f?=
 =?us-ascii?Q?wfIuhXdyer8Zyti7Jr/TSE/f2x00pHq3ZFJ8vyp+HV71vCOa++F6xoWpidxK?=
 =?us-ascii?Q?+PRVEPSuqi+oBBmsVuBEmC0REz6be9+mPheq1xPm7WSYx2S/xA2ejn97OAJ5?=
 =?us-ascii?Q?1onyrngBJlq3IovtCiPSL5SpWBIW1nhLgmUxhmaO2m+iOK0n6U9uuln50t/r?=
 =?us-ascii?Q?1b4CEm/SKOGxqlLAYGamWjBWI3vAUQalGIEcyQLoGi3ag4hryM5HwwmowOR1?=
 =?us-ascii?Q?2+UwaULy2WeOxevje1gUKKNlCVBCCl3Jy+OCK2KuOfnt7IzK9sU48iJDneje?=
 =?us-ascii?Q?K4MdjuJ+DAtK496tV8fla2iSWYt4L1pv96uREAHYnmdTz1QlWQPS8mOBqYwA?=
 =?us-ascii?Q?Xu2/GgJqbDkhG14DIMvbUOdAU23yH12C5vxFDqpr0BS3cjKYtH0LjZI42tPr?=
 =?us-ascii?Q?fkbMs3fwZ4XVhvgoBVXk+uD4igmSbxq7fvJJWn/lwrO0HyuKoWoFi660wF1b?=
 =?us-ascii?Q?ezNQJNxg/kDY46NZ/BD6e6sQcdb5x2zz6A93AmaNyx4DE8H6lxb06im7U9ux?=
 =?us-ascii?Q?abzNw+6JjwvbSQJRpHd7jxVLRa0g39VGLssmKUgeZ1f2/gnmwRc8Cysud4TK?=
 =?us-ascii?Q?ifmbsHUhE6cgOvxlFfTjhP/sIsyoqQ6VE6JeifO8NLSzJMxw/kdUWW0TujNb?=
 =?us-ascii?Q?ikD5wpRLkY6WRwz9EB3gO4kqW17sJDr473ThYAitRDBqrxRS24qOLL+mcylB?=
 =?us-ascii?Q?P5UQxoNqm+JVJkPDRZd/3/Q3I727qj4LlE4VI9LbkmfYeGtxBdz+kjsowWK6?=
 =?us-ascii?Q?uGNiUkOQZXhvGNvP/ltPDuv3T653x4dQ7BRcLXgGoc+Ya0ETtdJ+8qBVUuO7?=
 =?us-ascii?Q?yQYgRiaB8iBP/rb8m5sOvv6LycuWLknk57U1Eath0/h3lO4KPxToOX1Nd7bH?=
 =?us-ascii?Q?W8NlBuHPl1g3+wTW0IqxoUDjIspBhQ70L38Y1Htd0cjQAwhBQBfz3qpbJcAv?=
 =?us-ascii?Q?aOZLohnwcmzJWPlPoHSwDaDcEu39TRU8zqk5UBljcoZg/m/8U5c8BF3Arj0J?=
 =?us-ascii?Q?qg2bLSXnOOms8WdfZ/560Z8a+BhrYbzDOWnVODIU2+IK8fz4hymfNyJ/I1i/?=
 =?us-ascii?Q?e3kaph0QwiazW9C0xdU2kogUf7aEF3WokGGrmugSABue55SRSEJtyj1uyBeQ?=
 =?us-ascii?Q?43I0mjmgw8l7pJ0zyO3s9YxIcGeOcWHD8l5zJFjDF/jBvJbfksRMnNMdkRz1?=
 =?us-ascii?Q?lOfO3BtTToxzozW7kE3xBOHJVfglAmjaeEegp9/YCv2j7IT6zbWZtxw1ZKlT?=
 =?us-ascii?Q?oOCi85H9wZu9ZP3SSE7MCDC3Mh4eyKeU?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?3aFwasZvNhdLmrxnnWYqvnnz8HLMb2XM5aKixyXdGTamHAYO7lx3y1alZxrn?=
 =?us-ascii?Q?YKpsSIqtqJKXyYINrQmwTwzzs2/xq3BEm+srhzN5lELhFgdJ4ajdc4FjkAWG?=
 =?us-ascii?Q?+965bKJcBqDCUDkbYVhgqZYxd/4sYureSVAUJfwvaYSC3kGzBpGJdBLeV+Ez?=
 =?us-ascii?Q?JefmHbqjJnzMFYW2RHUNlJnb5I8ki5uzFk04ZLWPW0DncMyqoiVCD7Zv0fls?=
 =?us-ascii?Q?fchSDB7DmYGJB3bY5c3WBdw5TpbQgk0Ezg4mTJSswihIGLI2Ntb4kv77qQtq?=
 =?us-ascii?Q?LQQkeSkwKWsKmmv6G37tCzJ9ESRnQ9gdmDVzZ/Qce7gWskvW0md9w3AH2HnV?=
 =?us-ascii?Q?yt3Q15y4OB//DdDLFdP/6bDkNU2l5zAVPb1lnpCUmbD1kulOPKAh2hDNmxuw?=
 =?us-ascii?Q?ZN+V2w325qr4I7es9YRaaNrGUj9zA3/h8+OqAf2C7/Gley8jgrKKx90y2amp?=
 =?us-ascii?Q?JlQJeOhYhBtqqY2izL3W1y1wJz2ao5uWcayVbT1zqHa12HRnjm5dBw/YhN5C?=
 =?us-ascii?Q?aqyyg8QI7pGTjRk0aqzO40TFc+E4HKgCZ8o0gdBTzmB7sx2KuKvo5TXaFmaR?=
 =?us-ascii?Q?oKfA9d3GspOoGrhHyYBAc7LKYsG+43e4h85LUHB4fn9bAVfYfsqTUkujICYm?=
 =?us-ascii?Q?8uHThs9fEkDw1w8mdPDjTwVOISpydXASETj2xGRwYSVjxUalKZun4/PDuVwu?=
 =?us-ascii?Q?LAntGTH/DqroyTn0NY77g/jLY6wk/5FgeJR+zWplC0DZ5PbjbNDSxSRDBWWI?=
 =?us-ascii?Q?bNZ58qXpwuXYzi1txkCFeA6xFUtfIdVjAk8R/frzkaGCVLY+xFYU84Sp6DHz?=
 =?us-ascii?Q?j3wOItu3BmEpcNjC7SFeXTpNb9F3Tn6tFr8u3DGSbSAsy/zFj8pE6bAt4m0o?=
 =?us-ascii?Q?ZEi9OrQPD2wFhuVuWJ+nI29U1h56rgdEybwILEZ6RDy7W9PWkYKocDMkWE4W?=
 =?us-ascii?Q?zBEM4Ce3D4L/DU1x4tOWPczgiZlAm5Yr3qQOqqX6ew/Q4aHYwRG7BBg16SKi?=
 =?us-ascii?Q?XjOGImt8unKf0nTFozaun60p3koHr2I6hpFSgvDlz6CyFb3RMe8TX7CaYBot?=
 =?us-ascii?Q?wajPydA0xeYFG+GinWftlwaALfPWObkvf3dmRS329UEh1b2G8H93PxM8fhIr?=
 =?us-ascii?Q?MgBR+t+r91hOJBZYYQdRk2Rmjk/OYUwRbP+lOhbWG4SXxfw9uQhlMzx7VKRf?=
 =?us-ascii?Q?Tp2j3UlmG4xD3zoSOe83DfJkaqLhs4ZZbe8jT9+eNkiQ5RtpqyAKKnvR/xgV?=
 =?us-ascii?Q?66gCZCJUax0b+WCEzF2byU8ZgRQlp5u60Cy2pH6AGkgPbprqz/DNZAT8qT3n?=
 =?us-ascii?Q?QwCf/J+Vdo0DGVXi7vmm0iwI1OFCslzSmjRfAoc/wMV9lVbjCG53bYpliCcO?=
 =?us-ascii?Q?FhPB4BOrRXsHKzb7zMlDfJtEP8qStq9WoFPLy67/FM6hx4rsGA/KrJAeM8Bb?=
 =?us-ascii?Q?MXeWuD9MLBZohUu8z1HNyiWdisW/d66VbHTpBWPJyLSsopaJ4TGkVNoAiPtE?=
 =?us-ascii?Q?B7a5uQDae38Wy/oaPMqabSE20BQnhvJ/EyAILaa8OUbJNx3cJM7izLOM45QO?=
 =?us-ascii?Q?M7sdH6vik+XLGqDPwKw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f149cff-98bf-4438-8598-08dd3c145ddf
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2025 01:13:52.8074
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gt8xCQ/3eb888ooG6+TSH8jT2Wf3HjaIHlYyJmliZKhBPZmMoizw5AsfIBa+aBN98LjKlAYWaS2zVDLE7eqvVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8411

> Subject: Re: [PATCH] firmware: arm_scmi: imx: Correct tx size of
> scmi_imx_misc_ctrl_set
>=20
> On Thu, Jan 23, 2025 at 02:34:41PM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > 'struct scmi_imx_misc_ctrl_set_in' has a zero length array in the end,
> > so sizeof will not count 'value[]', and txsize is smaller than actual
> > size for tx,and SCMI firmware will take this protocol error.
> >
> > Fix this by enlarge the txsize with 'num * 4' to count in the size of
> > data.
> >
> > Fixes: 61c9f03e22fc ("firmware: arm_scmi: Add initial support for
> i.MX
> > MISC protocol")
> > Reviewed-by: Jacky Bai <ping.bai@nxp.com>
> > Tested-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > Acked-by: Jason Liu <jason.hui.liu@nxp.com>
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >
> > V1:
> >  Patch is cherry-picked from downstream, so tags are kept.
> >
>=20
> I don't if Ack is really helpful, but Tested-by is as we can't test it on=
 any
> other platform. But it would be better if provided on the list instead of
> coming pre-packaged like this in the future.=20

I see. I'll follow that next time.

Thanks,
Peng.

I will add it as fix soon.
> Thanks!
>=20
> --
> Regards,
> Sudeep
