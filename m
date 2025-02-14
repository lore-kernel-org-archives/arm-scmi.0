Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2077.outbound.protection.outlook.com [40.107.104.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C876A22D799
	for <arm-scmi@vger.kernel.org>; Fri, 14 Feb 2025 09:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739524831; cv=fail; b=ZG3sQdK/oJzZsqqfTCwejLZ9gsl3Cf8crtOpCZ0vhF7imjen5s7FJ3GfkIiRrbzWDSEb5K9uPn7r8or2Ya5eD3J8b00MPqHa6Zw36ZUs/LTtX7vJ+IeB3TOfihZY+d0N3Wpk+acxTcJvZnKkxj6o9vFrTjzzb2M15FpXpf3LgU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739524831; c=relaxed/simple;
	bh=iOh7GbfRthC2b9+wVWtK7QcTXOUXkyjw/rB7GPUXuM8=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=PmrpbUKCjvyAsivy7ZBZDntaGh0AwcFpprc5NgkWFqauBpZROyv4FjNznliu8nX/tqmeI+d4XpwUSAMPmvw0b9kChRF+0LMapzx914GraYOPJSWsguKwMfpoYY+Ieah6Ww7zERoEOSZbrkPuYwQrag+xXZtAJW9JtyJ+v3jYYks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=L6pKUxYY; arc=fail smtp.client-ip=40.107.104.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="L6pKUxYY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DIpF22DqU7nqwL9dLuqM9+2mQ6lo1jYQQZ31/fDA1H3hzZEO10lPGKm+UFwoie/Fpq/B14pZ3XvmHiTCzX7AMHWwCbrHGIA7EDYvWjReJPBMhlwaV6Xuo0HvegtdSqKCy7nJyRQiFNBzc3qyfktTY83iDqNgW7WTSkst/WD5NV6qNNw1SJWem7yeJ2+yqhgecR2unoFBnp1JlQ4D7MAzUgU8v2gKETj/3qHvr5+woB28Gq3b48w+gLtTUbyYUpxZNlU5PK6W4c8vKGX/rCFvr6+r7fGGUVzkyoUv9NRhiRWeRKnBnCmCrtSM7/Arkrl2a5bh60+19hy+ip1R+gD33w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+Us7ba8FeHm5RoVRQ8sN6l0m5jEc+LO3K/M2FnQAJc=;
 b=MCC64p0URoSO49th+zK+WxaQLljSurL+fH04vHzDDjl9PqkZRzwel3zgnJmpBpNgXdXUjmthkG36E3rxMuiT9klCG/TET7PZgOz+HxJ6slqwDGnqVa0HxBc7o4xgaoIeNxIwdo8wr4JeCiLzBuQjqOBOqSZHSaA+wRgFBY6Y/pQeCK/tyw5L7MOWalehHCT4Mw2VyTKoeerEhI63wnIC2DFRGpzvCFjty4A0RcdxrUeayU2ngW3BU/rMeOg01/T+nrZ/a2k6OOj6xqfBr5n/f1MqXlXGPDqfJnHXNpufcPKK2z8euOmthnRczpLQjxwNHyjh1pLSJTEGYVENrIgefg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+Us7ba8FeHm5RoVRQ8sN6l0m5jEc+LO3K/M2FnQAJc=;
 b=L6pKUxYYHKL4RElZXoaNTZhH7eH0CjVR9hJm23aGm+fAsopVUIWgrjWyGwnhMoviNVguJhg9OvtXeabK4U2RwdqKyVQO/7RUtT6bycBZYDW3/cbhkyM2d7ywmwXiGv2gZToSo9HBhtpcAK+z/myLhJ72+X5PjhzN9U4W6l2ovPe/1umtNlLlsBao9uByiW/L+nRju8oHJ9i1n5sgdLqL5HrSZAyRpGThM607XUvBOYvV9vX/hSxzSiyVfpdKqFNBOwjD77tFIprzJGqPHayJySwaZzsfsukSNs6ekjmZW3edwGuHfch4lFF8FtmZqcNxCQ/HRnK6Vhw8IN4UVP74ng==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM0PR04MB6786.eurprd04.prod.outlook.com (2603:10a6:208:184::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Fri, 14 Feb
 2025 09:20:27 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8445.008; Fri, 14 Feb 2025
 09:20:27 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, "cristian.marussi@arm.com"
	<cristian.marussi@arm.com>, "souvik.chakravarty@arm.com"
	<souvik.chakravarty@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>, Dan
 Carpenter <dan.carpenter@linaro.org>
CC: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>, Chuck Cannon
	<chuck.cannon@nxp.com>
Subject: POWER_DOMAIN_ATTRIBUTES in SCMI
Thread-Topic: POWER_DOMAIN_ATTRIBUTES in SCMI
Thread-Index: Adt+wHBy9gMa1hazSQSoAkI5RdO72A==
Date: Fri, 14 Feb 2025 09:20:27 +0000
Message-ID:
 <PAXPR04MB8459E8D1A82DE43C08B6C26788FE2@PAXPR04MB8459.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM0PR04MB6786:EE_
x-ms-office365-filtering-correlation-id: c89d22b1-4ead-4b9f-5a35-08dd4cd8d1d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?O1BfPDWR8odw8xX4anrWQBEd6w+4csQbUT3kYzgT6Wn/D1Amf3LYGIQcfR8w?=
 =?us-ascii?Q?O79iwqUypSfSv8BAUSo739pml7Xm84avhHctBrqIJzVGktMvcWOkJv1zrBEu?=
 =?us-ascii?Q?mxMP3DsH0yFcXLee0prg68igPG5eE/ABaDA3rllCuOKQCvfPUVGN6VRgWmZS?=
 =?us-ascii?Q?6Qnl4M+jRUHhkYlvVrWLMOxykqBDD1DC+nC89RryukeasK/EjN3pR6WML/ab?=
 =?us-ascii?Q?0yL9wBxkVL7Ykiqj0z48Z2YeQYq0XsE6XgSSdJVi4HWPTTievtHP934OdvOR?=
 =?us-ascii?Q?5dQwily70fCQzc0RDDHZ7ZoTHa7WonJMrsHNIpVJEKHPiDev0VkcH7iIMkmO?=
 =?us-ascii?Q?c+CHHhuKr2iBTTLisKt06PvJePPG0cRXIclRPotePsv0iPQItHK6CmUmLnec?=
 =?us-ascii?Q?xtZsKZ/HM2loPC0t3P2TKrfiLt9bj/KUvMe88KZ4o+7jy+AxnxLmni8sq7By?=
 =?us-ascii?Q?YEKx+/KEIqpNAEqEvYFE+cZbVYu48+VsCMtlvuQUXCXSbXdqHIonBg5z7yc/?=
 =?us-ascii?Q?KOfhGuRMGDHCzwYD1juDU+VJN0MLk/6YMXvQ8PdGIS/+Da1ZuMf3LDJcPORj?=
 =?us-ascii?Q?SIp3LAqDYC/Ytxc2Z6+vyfY+X8RaDRVbDMeMsslHDWauZFwoRPoh1oqZKKz5?=
 =?us-ascii?Q?yd5GXLLDvBZPNSGYwtOjlGL6G2moNPr24TXXtp0Kd8ih0uwwQ5r8WGFkHxYR?=
 =?us-ascii?Q?ToRoiLt8Wx/kLsQuV5sbwR4WPkqLejtGFACxaM9wNh7jfs/MBWaMmX4aOFD/?=
 =?us-ascii?Q?mjMpe2mdxLSjWDy1vkAAhOIN0YzhS7Fc1pIDCF38/RlKQuw3IIOz5/vzsrvU?=
 =?us-ascii?Q?BmTB2PsEeZDOaQgv4wMcLFkTR1hFYVYVbHHjsWrT41U3fKBBn7FoTifLTqT6?=
 =?us-ascii?Q?Tvg+JAHi8JpUkfhBcC2jFq6e1cIkJLaeYWNHrRkk2iBXFnHioI4V9+99JW4w?=
 =?us-ascii?Q?OyYZNsOKSA39Xxo50oD08EM3tvQvVenpqnIXFCtaqaobhFpyXXFzTs33jfRq?=
 =?us-ascii?Q?nVXl+wyG/I5TrKdEJamRyanjFAB+y3GeAUY1crDH1bsCzWhpJh7wdyivWSfs?=
 =?us-ascii?Q?K6Ou7ekD6RIGYsaklfcslWZAMKC9WBH6409IqFjsr7+YqOQqy1N+g/ycHw6E?=
 =?us-ascii?Q?8W2frvoP9UMIZWxRoZaA5brCRJgmnLCboHXTIgxpal40ZLX0/VisPDrrFWhV?=
 =?us-ascii?Q?oP4LKYCQZzlQOIdsqCAETl69v78zkrXUyTxjUM0TWyoafErhU/eaFu/+cxw2?=
 =?us-ascii?Q?9HJvDfTABAEvhhOAxosU6FgI91aDXmJQH9HdSz2wvmI2nXGyaBuS+qPwXTGB?=
 =?us-ascii?Q?deD3fScZnp00r04pMhYl4LuDsAM8KKDkfXPzPEW3ikdecJAT0mSUXYxpzuZ8?=
 =?us-ascii?Q?IYlr3J66cPziibwOfbeGOS2zhk8FGd8GXLgZWHDp1CQV79aW0ZhT7TlgTGSu?=
 =?us-ascii?Q?Y0tegVYRJeB/TO1UOklXXOWt0Ta4u/Kq?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?rzGGyLHJTWMYBfSkoN+bP7Bde3uCWh0g7YE8lx60gFpDR0q3dSYCpD1+gTx0?=
 =?us-ascii?Q?P59sP597Ezld2ZtFkJDjR6zDIkK3lPmGV+6pRvgmBmlcoFSsPPBqwd+JexKj?=
 =?us-ascii?Q?A3eeypb3Z1IeNOta0gK9klsx8lw0S2hpWC3ryVSP4kmE/S94tRMyfnd60wlB?=
 =?us-ascii?Q?T5cXDwRARQI598GbII+R4gMCMkBBMa0FDMnjn2h0Zn4mb3OGjKuZc/1XRSU6?=
 =?us-ascii?Q?8JTmgnzyLtZkBYwAybAAa11uD+5BYyEtRhpdJ/gzsi0q7GUOJNqDZ731fuZl?=
 =?us-ascii?Q?k+DNv/Bxr+VIVwCe+hqML1qi83eI/k7CRsec0fS9WZ/CXEn7K3YNFaM/32/Q?=
 =?us-ascii?Q?835SfpUGdrRLeehwNisZQIG+sv9xUj9jBCiZmiPUXULq4JbDV0IFPtLodET1?=
 =?us-ascii?Q?AP2vyVeQIHE+YXd8beG4+1auCA5eDa0l/Mm1FNbHDPOdO7GfeB1b5HLNXpBr?=
 =?us-ascii?Q?DFSyH6dWm4yK6aFhAWJRENS80AJ2JhsztIRtBQ+TsCbJx52NI63BmJTA/Qnj?=
 =?us-ascii?Q?AAr4r6FNVWr9MRyI1PdrfX/5Bo0ypO+rxhInxCaUHhZgr96hJfryCBVL0m4D?=
 =?us-ascii?Q?hI7Oo28bpIPKboBA1BRihU8HHvQCJc40XmUhoCkAuJlnlRtsgrR4EWelSAFM?=
 =?us-ascii?Q?5CtspozJwZcrq7YmZ9YLZT86KaDZU+tc4ZlrJVQ9H2JXvaTzfC8cpGYXBy4w?=
 =?us-ascii?Q?rFV31QX8P54coPc8nt6xGEj7FCIFsn7MCSvb4sKbOx3whjE+D61/9odwZuxz?=
 =?us-ascii?Q?hk2KSTXCN31AXi7Quf3yYcJQjbEkyG5O08EAZj++AYsX1EV2w3FB5gnSA/An?=
 =?us-ascii?Q?8kKpSQW69NjhXxfe0wd7jk3ItI8fIxskEgjH4REd5zLuey62fXy+gUxAESSN?=
 =?us-ascii?Q?hir2gmq6rpsUM48d3eH2bAHsAzJGqNoV57VfsB1epPp9DODXmdKpV6k2oBOm?=
 =?us-ascii?Q?H6n/W/00gUhiLkcoSOeey94lvNmpFsUtdLEywxrqGj9PTvWBq60oaNVchz3m?=
 =?us-ascii?Q?rNwCRRT7HHAhxgwu28u974OCYJ+VLh7cg/AEsU4e1um+Ie7SuTu/djXivXJ5?=
 =?us-ascii?Q?YodO5r1ixuvf7y/IRHQ1F/qK7G5osHNtf+vTlM8c6LqLr9y2iDH8IaU6wJFf?=
 =?us-ascii?Q?PA40xgGABcyMY0DbzzkK6cSgnHOKkgBs/j/m3WGd65kNFEG1mUt+SWg0RdlD?=
 =?us-ascii?Q?5QwYQwv1QgZ0trSEPl4J0zErGognvuFkNPmfljuU8VYs7YYqMCWgsxvnUsvE?=
 =?us-ascii?Q?IaLfZ57gP08c1+r6Wicg1EK28yVUqNUit7/LWQ2ZHQn+/nvKUj9M810l4epE?=
 =?us-ascii?Q?uiHPmhndwDkUUOfOqm5Iid9JX1xT4QAUg755DSknJHHEbUr1X9B4Wfg4f7Ne?=
 =?us-ascii?Q?XzPE6QysijarFvJ/bUGDxAg38hrcpgmgGQB14vh/+G6oR3TuppeB4WeY1jda?=
 =?us-ascii?Q?S861L2DZXb24iomXzR3JGXo9msBQQng/GnWmsIf6EoMaNRG/iDCuQ5mODJNG?=
 =?us-ascii?Q?hqbtEG0AifLkFUHrwqvw/TnNoCGGvBkZk5GEYSR7qZ/18wBHHy5/q0BV7egL?=
 =?us-ascii?Q?RIFrxjIQp+xxDrMesGU=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c89d22b1-4ead-4b9f-5a35-08dd4cd8d1d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 09:20:27.2990
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GbtHlG3tcunt+0Z96GOjIkOYs2Gly5DAAsSu8s+dmvbyJg8EvTFTwCc/eGXZJ/KCX8rrF2abaHWSEu7T2dK0hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6786

All,

Previously I posted a patch to linux to set all power domains
with "GENPD_FLAG_ACTIVE_WAKEUP" set in
drivers/pmdomain/arm/scmi_pm_domain.c

But in the end we find that some power domains
could be in off state while it still could wakeup
the system. And we have a downstream patch
+               if (!strcmp(scmi_pd->name, "hsio_top"))
+                       scmi_pd->genpd.flags =3D 0;

So I am wondering to extend the attributes of SCMI spec,
Saying In SCMI spec(DEN0056E)
4.3.2.5 POWER_DOMAIN_ATTRIBUTES
Page 44 of 210:

Bit[26]: If set to 1, the power domain could
wakeup the system with power state
set as off.

This is just an idea in my mind, I not
write code to verify, just wanna to see
any comments from your side.

Thanks,
Peng.

