Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011049.outbound.protection.outlook.com [52.101.70.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47378374FA
	for <arm-scmi@vger.kernel.org>; Wed, 14 Aug 2024 02:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723603928; cv=fail; b=BOufd2oRQOIKbtbr5DJsnBOp0RcdJyAQmkpIrA+CcgVJDstp9/IRVtvxzk1QTO3OUEmijP4JhIvUgKfSUSrfj/jdeB5CHqnLJo5+E8DKPpI2OfIDpLCx9dnCmni/pVEJuh+55W+x46ZFbREwXMsh+rszpCWZcHn7BI3VBpBYvJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723603928; c=relaxed/simple;
	bh=Z79lTJgN3qrI4IB1BZ6rLVJgdM6ibHDb3bfYU6rRk58=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=RLctyHesfXJF2xuss+CtCoxFA50oz6KD2DtiMNOFhQ7SopEAGEZP14ZLLWjm9lQfSemsb3uDCTysFKJ2q4FHG5/uvyNMYFBQI7EHtHSK1g+JLfDjb3MYgyjV/U6rdlPraVsbHAPcsupi320pBZVfwln2dmqMpJoOM+j3bRx0nmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cvrJ9Y3s; arc=fail smtp.client-ip=52.101.70.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cvrJ9Y3s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8UX+PZVxUg1km2Lp9jyCLqyQoTLEuyscv8ZA3PB1RHoi8Iqg/X8sujUJXfPG3dXq89Tp6wqoGS+3YuUaI1qp041H81ZVAwH7412+iahfD/jWBTJaBY1Jx13+UoRq+hQr+uwuqvOyrPkTQUravCnuj8t5RYE67R9WvfyOwL3d6WwSLMOMZRjyMp0IRdljtlQHYRCvnmKqx/CPA4JM7FYSUE8Ip0EAov6asan5m1kzrSCyDmGCUDneaZL0ARs3i30dcK3OwWe+vS2LAeLoOa6RgQfMtQOjNuhGWrHaWCmcxo9R+YWFL1eKxgroonQfhfZkhqa3QF/l2QwI5pB44pmlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z79lTJgN3qrI4IB1BZ6rLVJgdM6ibHDb3bfYU6rRk58=;
 b=JtDGL4TOPDmGPkSwSHvAj2Y6ejdUYByf78ZfaOqH+0HxVJ/urdLxfL1o2f9dXNJO2krYcoshBqnx3XjutRmzHmTDy3U1Py8jSEivhKXxngM/aUn80feSdp7r82ZvkPC+zROmtWYxE8wFtv4Q5OwYLVQrxPzPaI+bUn79kOXBrrF0jpc8flFGacqk2HX4I1rwSPDzP5qcYKwC4dixxkJqGnSU42qV7v9SssWjYzaYR4JFFICkh8YW5XR2RJ6rbZn/jBFTUHWozyOyLJSJ0nh5gAyaPnoVAFgOHAcwT9YgclFS4eFqmf30GqSfUT5xM6HvSA0nA1c0ED1CE6MyM8wZ/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z79lTJgN3qrI4IB1BZ6rLVJgdM6ibHDb3bfYU6rRk58=;
 b=cvrJ9Y3sqfOzSfPJlnsP3cA0et/FScsgoGqIms7lAo2O1bmluKOjSWoOQXz4WKZb2RvwJVrLLRkgnLix0/yFejoG+hMwqhbaGm7Rc6AUboguVwz1BC0cdm5V/INfWQBYVOD0BS5HUSfSjC2QW69Vh/z9BeuokMOuI55hPF63s9OyJE2PtsKeFaxMzXgLMQA87jpmJLNDb14roALG56tT91S9SshTpA9KCAx3SksznGlTiFNusPpHA0ZmNctkER/oM6gRwzVWRLXLVFzXBtFxiQNVF5cZRUMb96AByIEIl8M3emGanj7FRauhBxbo7fcepepeeMWvAFXDvkLlUXcLdw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10608.eurprd04.prod.outlook.com (2603:10a6:150:20e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Wed, 14 Aug
 2024 02:52:02 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.7849.019; Wed, 14 Aug 2024
 02:52:01 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Saravana Kannan <saravanak@google.com>
CC: "cristian.marussi@arm.com" <cristian.marussi@arm.com>, Sudeep Holla
	<sudeep.holla@arm.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>
Subject: fw_devlink for arm scmi
Thread-Topic: fw_devlink for arm scmi
Thread-Index: Adrt8itsUfAXCqPNR/SR17ylJU5i2Q==
Date: Wed, 14 Aug 2024 02:52:01 +0000
Message-ID:
 <PAXPR04MB8459FDF32FAD5EFD3D14509C88872@PAXPR04MB8459.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|GV1PR04MB10608:EE_
x-ms-office365-filtering-correlation-id: 0ac7a15b-ac8f-438b-0d13-08dcbc0c1238
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?qgZZjPlajdnKN/hVs6L0jfXkfLBJXdCEhX5ntILyqxD1zAYiBI0A9+PRBrH8?=
 =?us-ascii?Q?eYa6TmJp3huZdNziqbPScRKakB5LVva+xHchVTYpnjREZsbCegL31Chb5haF?=
 =?us-ascii?Q?M50GB4mXucV1y2bkxrTHXSI5wc74hQHhcAc5UrKFvRuF57KfSgyhakWWyfyI?=
 =?us-ascii?Q?/CSOcNtXIjdQ3MkvD6/KP8TLpbkz+CeFwnPJAIHnMhpAGcSVXo76rkpIJzHh?=
 =?us-ascii?Q?K5x0eW41GlTunbF+a0bCZvmXByX7d54Cwu/pXVlMtHeOItxWAc44b9ZcTpd2?=
 =?us-ascii?Q?+LF9NCUpuZDKL/B75N4WUqaI5N5nHn3DmQFy91YeHj7U1b1Y/W7FoUeQESBI?=
 =?us-ascii?Q?u7Axy3y9tP9YE8Z+QyW/lXKTKlNtLHthI/VzuOVkKRfnWM/vQ1RgIQGiUd2X?=
 =?us-ascii?Q?h3aDo+KFFdt9qE5wxFp46WAhMQG+o+y0eVYlyeWFn4PeolXYpuHXeTUR1XS5?=
 =?us-ascii?Q?7cHJwD44reTgRci+4RXIrhFVSkDNfWGE+FQcyQJXlq4cah9xmVWHsHfOruc7?=
 =?us-ascii?Q?n1/Z3ZQd9nLahgsztKbZWhXVwgnbEFrU0vHXwYKE0zIhVEwRXSRuwV/RRcb1?=
 =?us-ascii?Q?9Vk9yVbVrnexMMb+ndjC5zzkwBTCw2F93+Pj29hoBqbcAq0Q5sjRiaP0OiuZ?=
 =?us-ascii?Q?LLUsFMiG5n7J3IGLBvsTCtiC8gAfQsGiweVY6gG1oJP6gT/W+enyYajaJ9xW?=
 =?us-ascii?Q?8FGRoHUuKyaAhC+bRg7FWQatM5oklSjHawsJQXs+OchqGJN8giZdcLnF4IlH?=
 =?us-ascii?Q?hiU/uYYPIT5GhPgYkrokKqjkBZnDyOA11cyL4NVKoAFpeF3O0uGjy+i8XLpu?=
 =?us-ascii?Q?luP45CDuBTx3BEVG3dNBYtNo1/6SUl792zRX8rVW+G5dx2jzN6FGHccbSClP?=
 =?us-ascii?Q?hmUaoGgv3UdelkH7x8P9fBp7Xz1gWwYqFWZa8+olMnKHNaGTCCZWgvv4BUCo?=
 =?us-ascii?Q?LgLIqcdS8iq2j2AP5EkkYkXTPe6uzRI4SqWujjEFshV5mAj4pyP4ax72/662?=
 =?us-ascii?Q?hjXfouiCGz6BIrLxBwgsIruw7mS0qqX0PIx8gc0srxXPG0rkWQ5eW8ci4Kwg?=
 =?us-ascii?Q?O4Sy7j4+IEb2PhpWUicH1Z+7IgUeuoZdb5I6p2ksbkaEc3i/vsxGJduenFgj?=
 =?us-ascii?Q?MEdKnGlSbfSEwRpY8XwwfupAw6KG87AzStiEMEhPFy0NL6KHwyk/uDWogbeQ?=
 =?us-ascii?Q?+dUx++bHsVCN/it0n82tEwS4iqudO4Q/IxdW7au5JIydOxKYPQVHZmwAALaI?=
 =?us-ascii?Q?uKNz9uoTgjhrAwsiwcscaZBtoDbgUc3SKf1lQWEVXLlqhxpf0hRla8KxkhsB?=
 =?us-ascii?Q?tbyiR3QfRC2fb7G1s38rl6bs77TTpcyN6PInQG/sIX9uXkwOs+GlOK218OAK?=
 =?us-ascii?Q?PSNlzzMkS4RS1jJ8N/taDFrWzof6eE+91nS5xe1GMzrgkdy35w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?iANjf/0QDjfezJiGzr+SRv3ib37pEsQ/R2NsT5+iLrRmyIjRX0OSQLyZRzFZ?=
 =?us-ascii?Q?y444QcwCprXOrLOrX7sJGkdk/oZBAmQxfoWKSfYkPkYo1UP0PsMS1ZTmHi52?=
 =?us-ascii?Q?5u4k/6XfKfc6R3tITbSAGQd7JsWv3Ki3ZCLQV95IrNgCwUBSQSg4ZNog0f94?=
 =?us-ascii?Q?Spxr924nrLQ2gGw7SIKD73tfCFHEIsjaDouhx6+MfiZ0G8zLL6EDBQs5VGJF?=
 =?us-ascii?Q?2Rsskk3UNHdJOf1un7iuv2IiIlucjqDJbvlxsQUQBA+PtGuKg/kBZjbPTdKk?=
 =?us-ascii?Q?u3BOuKIhjnoOShhR69205BSqhHb5LZ8GEGO/R1KTHJuzeaeuXQrX23fHl6B2?=
 =?us-ascii?Q?GjtAehvnU+DFqdI7+pCv1r9MRfXRsGeSfXGA/pkBoWBRphMsnzO67/nBJwO5?=
 =?us-ascii?Q?1fO51E4cyJKKOOBpM0L2ODofvjqdiXOtKfhjPOM7ycGjKbIBit2E48sfpTNB?=
 =?us-ascii?Q?uKlecvQPtfT7vwdNUSEu1bT6ZxJrNphj+8A1L6VDI45BxB6xVwpvehZ7/1i7?=
 =?us-ascii?Q?dDlkTZ4U5/UwCPJN68iJYBFEZBkf4zZJuDMyD6jQKEHG81BIstYXb1Y59LgO?=
 =?us-ascii?Q?+yAYwQnYdkLWpN1gmo6HFNoyzUiDTQCUrXxKWZnAa6sz8iFt0UVMUyXdVeHh?=
 =?us-ascii?Q?mqI81Yfcjc+KMwWw/6zyPyTUhzoJYlf3hfWMlK9nIiU/d/5z1OEGaElRsGD7?=
 =?us-ascii?Q?uheb0M3xlzmia4wc+jmvGJj6nUVF9mRC4Xix0Aqzyj+wuTHiMDVe6PlhYOSX?=
 =?us-ascii?Q?ixSgZ2vdyUpzPPa9tsoO3jrw/uHUNCV3h2Txi9Kt56dTVWxBVOY5G1faI3gd?=
 =?us-ascii?Q?+3oYJPhGNS54ns+wNydHfkinC2jl+HOtdRNoBoMtLsZ2gAesORZNKlrm5iEX?=
 =?us-ascii?Q?gAWamiTHfAdHhMmJx0BFMKjOdhwbEip/F4ziRcBuAu1vmhk+qUcXEfG/57Os?=
 =?us-ascii?Q?hbkbCfZzm60ZAt/xADqzinVXn6pqxGRMgNh774C7iT+4+qzh1JDl8irgEmdi?=
 =?us-ascii?Q?4ilnWflQlE5aQOqy+taVelN6xWyZ42XL6pJGoH4Q9AZxTyvgb4/fsuryvT6l?=
 =?us-ascii?Q?1aC8xJrQe1lRIfMalWoOUUyna8ixADtTPcKO2jGIRxkDMPe4k2HjSdc4544g?=
 =?us-ascii?Q?djTvIQUDl0Qyl0hKb7vJq1iDn/sHBxTT3lFZcqsyfExxK/lgVx2sO0v/eFBm?=
 =?us-ascii?Q?OltMgQunDV1Df9WWhkSB6YDAK63qgXQBpe25PmKEyZpuY8xfJRvb/ZdQmV/C?=
 =?us-ascii?Q?YqfOLabO8YTeWEowLfp8VdnXhPq+nDvOlPBLOPuSBpa3B9GDdUtu8vZpf0yp?=
 =?us-ascii?Q?DKQGSO+Ih7elQT1j+8ovrcsURcOHnbQSkz1JzvqFYidEEWrUR8hcx2JW2VUb?=
 =?us-ascii?Q?Qq90cJpxKnvj/J4bF0jjGuI1w3d7JpN0Wxge69N+GK4++R6Ly2Wt1NwCVGwe?=
 =?us-ascii?Q?AHARmsxsCye2Hl4lRBwQ37A/MdgKrBfUFpgEgr4E3z5SVtHwCv0qZHTbX6Ez?=
 =?us-ascii?Q?b6BvHdqhRZc508VVPLG0stK+Mkb23FsI219yxwQMGfEcYLhhHunoFm+Ta9uQ?=
 =?us-ascii?Q?iGimrRyJb1QphUrv5Lo=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ac7a15b-ac8f-438b-0d13-08dcbc0c1238
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2024 02:52:01.0909
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9hT9twAdlM4fRVpmiSJLuPCJI9kyM569V9NXujm8t6tTBQg/+gPghTGtWswzYTPAsQ/PoBXJK7J8Ww2nsdsg0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10608

Hi Saravana,

Hope you are doing well. We are facing an issue with
fw_devlink for arm scmi drivers. Per my understanding,
the current fw_devlink only supports one device for
one fwnode. However current arm_scmi bus driver
could create multiple supplier devices for one fwnode.
But the fw_devlink only use the first assigned fwnode->dev
as supplier or consumer, see device_add.

Do you have any suggestions on how to support multiple
devices created for one fwnode?

Thanks,
Peng.
