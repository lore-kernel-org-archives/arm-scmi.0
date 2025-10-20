Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013040.outbound.protection.outlook.com [52.101.72.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A106A33993
	for <arm-scmi@vger.kernel.org>; Mon, 20 Oct 2025 08:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760949532; cv=fail; b=PXozD+7VodkZhJAPIsArkom/63RIsmxOkWRa819ww6meqN75dYlW/SSwR40KxKxyKpGXX2WDTYrBEY6GzKUpkJKa22M9/ca+e+RwfJJwZKPR5oAr6uNeVnGcxO/VkgslVIUiFgMFIv1IM46VTJkdoLsjG0cB8A27yh/CfrJWexY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760949532; c=relaxed/simple;
	bh=Q033m7dklzsShr+otNp+tyz9kTHR8OxyjEPlegFwq4A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hWAUjNdLavPNM6qjEKS9BtgRaVtYfolx1lcJ8X07wGEURn5jjwUki0bFBcRbmILHGmusujdeqhsy2UYHO5zQ4H+OgTzLhEOrRpdrP5y1CcGmlZ2V3gpUvq3Sjwju8KTj1tmk5iUjQqzOmxib9zZTy8dNK3gf9ef9cAfhJ3H54wQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Jl8p559N; arc=fail smtp.client-ip=52.101.72.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Jl8p559N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lf/1JeEJ7cGxKopni+qukIfTeiLP94v7O1w1XeoM7DNajZ/fjuukQH4zAJy6/88qms5/iceTCIDU9OGYYYRAH4iYl0mzCz8IIAT0mv5O/1vbwLnWr3zJ9ItI8Sg36FAFC4wKPDvkLZcRXmyQYNK0xkThh918lJOqxFw7AcWitHdtHXQRrE27Mm5nImtgKMDZoq13x3glMVvdvZdNN5Fo4b6VeIvwee5hAm7a9bc4v1LPWgS2mms/Ji4qpHU8q+IhiNyCRQ3g7Ajc/UMx8QRiOxSIv6rN0dT4eilUqIIBcoPKohmHrFq0bFQ/ZbOx26/pe54X5tYqRjSMRLCHicJ9dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rbns3F6HlqloU2BQxdBY2+Jx61aMD2livGkQwRRAp20=;
 b=Ub72q77so325UFEBfRuIuTcdFK/Z2mOu7Zp9ufFVY1HC83Qo94L3JVGn1Lzf9QgavxKIuEihBAqhXMzgkdmZFcFhJRtKfyVoF7+kqJv1uXaTThWuJ7trDlOIsbMqjzr0P4XSv7XRO4sEVF+P2BK9oVWV+YCNtfLv2KdezoiNhtt2dyIzjWsMsu+7YwIhQhyuoL6tBIU2+7LrCmz5bp+bn41xoQoqdpJG/+qtZPbgSl0qhZdIIhziF+fxGQDSMR+QZXhlhdxdMDcCmnnBfqepufSHr3tUN2jA2//co+zelTkKPItRTQYlglWIemJSx9S2uRt5uQ/cQEOGimRbr3cEtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbns3F6HlqloU2BQxdBY2+Jx61aMD2livGkQwRRAp20=;
 b=Jl8p559NkDRRMG8LxecUY5XfFdjy0S6vBhgUfZZ7+SnPTUhyD6Y7ln4eqGfwLI/RlJFTfMZzgEuJgE0zwjBsLSLP+EuTbH3kh1lg6ZTAvCqpoIWuxzSbiQAL5FA6/mFu+je0rNSR+RajMqNneDd6yckEOWIO482l3TPWEBQx+CBbW35Rh98Qk3wDmG6+ooA/t5G7EyXEQXHdLjQHAs/TUSRRvvSZi2/SoOgbUmkxfSSmsv2S4040QUJw9ZLXKh+7g4el2OLKbbHXJvKjpqpMqK8Xv9vX4Ujv44in51TodHyt4g14kn4yCug+pQvXtag9Afp77DwNkN+PlI3CcVjEMg==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBAPR04MB7335.eurprd04.prod.outlook.com (2603:10a6:10:1b1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Mon, 20 Oct
 2025 08:38:46 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 08:38:46 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>
CC: Cristian Marussi <cristian.marussi@arm.com>, Ulf Hansson
	<ulf.hansson@linaro.org>
Subject: RE: [PATCH] pmdomain: arm: scmi: Fix genpd leak on provider
 registration failure
Thread-Topic: [PATCH] pmdomain: arm: scmi: Fix genpd leak on provider
 registration failure
Thread-Index: AQHcP1WxSkmZO6YKOkeDwGkDAeSr97TKux5Q
Date: Mon, 20 Oct 2025 08:38:46 +0000
Message-ID:
 <PAXPR04MB84593C99F5911275DD80C6A588F5A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20251017110320.1186555-1-sudeep.holla@arm.com>
In-Reply-To: <20251017110320.1186555-1-sudeep.holla@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DBAPR04MB7335:EE_
x-ms-office365-filtering-correlation-id: 49bd9735-6cf9-4712-72bd-08de0fb41584
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Iy+DIXO7GqGXOxnGhNFPbwmPo3FKglGi18V7JZTmfFvKQdFZbYgQwbWarGjS?=
 =?us-ascii?Q?41wTHRDrcSsrLJ/JxrIc7WKrpkSHGOvq/Ay61ehhFnCUi+8IdZ6lO1BTFwI1?=
 =?us-ascii?Q?kQkSiZ4pe5k0ou1sBzak5GodmbgbCdB19Y/iw5RD18ibr7RgGPPz5sEEXeAz?=
 =?us-ascii?Q?PgWs1Nd08dZShdcbJTzOQU7yUkBagmtlbhfWLhGElnrHegZFbKdgMaOZVJge?=
 =?us-ascii?Q?TZNBYs6Aa7ImdWYrlJmip0gLtiZVaAnjfGQcgKKp0PtkwnULqpe+dxgL1hwO?=
 =?us-ascii?Q?+LHYlJq1ig60Kr5GAtLFL5TjgFwd8R2cZA7Rwq8pw7GWA9YkNVan7RSylZKh?=
 =?us-ascii?Q?ZFqb5fO/bQBAXAj3YJiNjrmS7dJEQswrixH/jymCVL9JXWCSn6MUizgphE4N?=
 =?us-ascii?Q?5LfwI3FrzhDJ1Dy44TLj1s9oQPgvouFWigSNf33fVZMU0OvC0bpjN33R+cFr?=
 =?us-ascii?Q?Z8esNptYc2h7viKg3ZPjg4nJSBTP8ljULY4eysIOO8g4yS0CZ+tf4n/Xrq0x?=
 =?us-ascii?Q?KDSIgTN3m78dpy5otB3NZbZq23RttwZelDtOnPA+JZkYf7ETcG64ScjDRAWx?=
 =?us-ascii?Q?zUtFaOisDRgIGJwWSPDUYjwZX8Eg3vi0SD+qAz/qv6x3pCBvkp7Olnem5KIR?=
 =?us-ascii?Q?Krx6jva02anrkI0VppdKLXG1XcUU+eWXf4pCETv+rKe3GA/30ShJ9QiAVQl3?=
 =?us-ascii?Q?KuErPsghDHq1oi5/VVYJMuubUCq4yC0nWH8MbUmMkJYnGJvIYJ0kYd8o6Efc?=
 =?us-ascii?Q?knpIsdLGD05Vo3GoLUzDjs6a2MSzl1kUkNJ/CDZ3yFxWWHENcvKLtccYjF7t?=
 =?us-ascii?Q?Xn/9db0Sk5LB+slwzvxS7n19wJGhw4DTc5Qm2BeSaOeWvTBSP0JbfuOLwPJO?=
 =?us-ascii?Q?KqaMyAMXS8nPINTmok436/zxLdU/nfl5wRjY/+rTM9oAar7uTF5InEOoP8h4?=
 =?us-ascii?Q?y09MBwim/07pOx2j4dJOa9FuJ53f7fOUfW9Ntc1aJ5k9FqlcF7X91heMRVij?=
 =?us-ascii?Q?NByYWm8dljAMqBNuH2yCAnC6BL1UKUe/6+E+pM4TTNpmUCloZDeu1kUtZFN5?=
 =?us-ascii?Q?YQEY2tPEY2AMiko6FPwTicpU4xFHDdSPKRDfjgyeEoQmZ8Yt8wNadiQOzIJi?=
 =?us-ascii?Q?eIfv9EPoGZlmP3NE0aXbh8JhVFS1ymuIwbJesNjrdbpO4JEDK5+aibZWr+JC?=
 =?us-ascii?Q?eOgnRZ128dzMSIw/NrCWUa4iAbeRShFsXaXO+LcnbEpqYcukD9WMt9B4xN0M?=
 =?us-ascii?Q?Qe9ynTOMkyZlepRob+tDZniTF0wuuTnBoQgGcz+GhWvK9JkNG8Td8BVeZQ8g?=
 =?us-ascii?Q?RkRG9PkzVZQ7TX/pm7+F/vlquVQLBzEgevxLWcWfqTigHQf9jcFQf8MQnYUy?=
 =?us-ascii?Q?x2I+jpOZArgaDf1QR+77z/sQnKQd/51oNuPnmVHGA3FYtSY6KBzcM9YBneeK?=
 =?us-ascii?Q?ciLUYMWxEC319s7aRlvN7KBlvZKJLGE+ZLUR6VtI5h4oh0bXuqOtGBk0yewZ?=
 =?us-ascii?Q?Aw2cBg1apo/D281aTNcroTPf3NI2EvzU/ds8?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?FoOo8gXc59MsbnRJ49Op/0LfwvxN+qbZQNAbKdzidn4/mMMYsY3gkMEfMk84?=
 =?us-ascii?Q?TJHJj4G9fQsIadRDzxW0ZddOVUyI7kBtoghT4w5/Nn6hcS3MeMSB21suO86f?=
 =?us-ascii?Q?5rgvaxK4CeHuhK6d9nEKnLTwm7Ai/0Ywd68s5ntvHMzaiXkUmdoPVLpRPtS1?=
 =?us-ascii?Q?FVSWuKZR25aTbSXv1etMXPLW+NATTT14/Ip0nJvHfGiY4KrvCF8d34yFDWLG?=
 =?us-ascii?Q?7CR74okOuwB4Va0M15QzVHGroxMf+H4sYaakFa5bqFyGieXq66jjojxsgG1W?=
 =?us-ascii?Q?ksg+qgOHHRaRqGW0tSMHJKuvUF1DLmgo6nyU4qlKyA9fktwEq4fJqt1dSJM8?=
 =?us-ascii?Q?FFScu20wchpwhUuZ1J3qPceVa509TAWnx98J+LSvRRm9OaYFmIvt49KtBe+j?=
 =?us-ascii?Q?13xaB/8U5EzHBYR3Lp2FavxlPuDvDCe9N7dDHYjHu7KoKMOBHCEWuAZpOfZp?=
 =?us-ascii?Q?fGDgdieK1s9YfW1OC4mRrV8ZCJnxhUueFBhH8uIHg7FCju9SRDgDHHLOaQ0Z?=
 =?us-ascii?Q?K4AXDeBx/t1fDnCzem0Xxh7RW9t2zhfRcTFpfSjz5HSjRzo262+bfLKHUvuC?=
 =?us-ascii?Q?+KZs17yFMwrJQ7jLoY+FPeBHP6vZ+jcRQ0hMll7b9t8d6af47ZV7WzYPKe78?=
 =?us-ascii?Q?A5WVIdD67OiVS3AHU/3xUP9ig3uNC/Pu4mreXKJ2TvAfxCecqUK5BPh+b26u?=
 =?us-ascii?Q?fxTxLv8ivaWB0TbyKOu1PSoNjPLBV9ZaVOK+g/P+9DGxI9rRQliGU9nsyp9g?=
 =?us-ascii?Q?SP6ODqB9k/GGLpe7gdbPMP5uB5zYxgT7z4iBQNwwEUoUljVMP3zrHqKCMVIX?=
 =?us-ascii?Q?J4XrlH8dedtGiaruDu7BZ9vUKP7B9iWlrfm5lVKUMa8a3OJzIO4DAtipdl0+?=
 =?us-ascii?Q?lv5TxP+x/5xF2hkU59/3uW7x0Jduq3+ccLZnwoddNhf3P5Uc3DJ6McvQpn00?=
 =?us-ascii?Q?/XCaCoBWDyAN3756MibstCSWXP7or87imRVDt82WsV9Eo8lBE58eeabn/hWZ?=
 =?us-ascii?Q?vl4I9AvmF4BjCEJI2RFLXk1Bg0jGRJ0jw/RAhoVFLzOh9/N717lhMOqnS4ph?=
 =?us-ascii?Q?8jeLYUqfcy9DRtN9D45PWhutKXnxpaRhy8P/tDiOAlm969a8/71+L4XuW2Ow?=
 =?us-ascii?Q?jpuvjqTxNSk8GYB9v/hM/kSBNnTpMOXUSULO1ByAgK2Qiiy3y7pGz0DONshq?=
 =?us-ascii?Q?keO/UOJb83SRcNRRUUKyWjM37QeOzx52rCIsJ563QUi1kmEjCrQDDXwKdy92?=
 =?us-ascii?Q?PieopTigghK89mwpD8KGLJVf+RTqe6HoIEqg2KTpSUwNNfB0lgXYE2gQREbF?=
 =?us-ascii?Q?WAFMzb6seX9wt2fQBVStgzfx9kRcyJDF0V2qiV+axzWzYXfcjjn7z0uz+zOE?=
 =?us-ascii?Q?0U8c54TeEFllNAcKfLxNrmUHdSVS4Itke56rItehkatFRi3IxxugvKPei+89?=
 =?us-ascii?Q?MMqCqzU9khEvZGHOuLkHyu7GmuVaS7M3ULrqRls0SBB1wmK1M8DTjXPvo0vM?=
 =?us-ascii?Q?2LPJqKqr7X3RCsuwfMKK7XD/eEGSnOoQNkjtYW8r6ju6cFep1ixUjFfd4CEc?=
 =?us-ascii?Q?hQCJEEh433nMmyvMS2Y=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 49bd9735-6cf9-4712-72bd-08de0fb41584
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2025 08:38:46.2153
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F6NeoNXfFZgIwZbGgYT4JkBzYPpZLWukz8kMWipubVd4fsQ3DrEbzF7I7jbabCWs09V0BrcyvsQFrbLKS6y0ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7335

> Subject: [PATCH] pmdomain: arm: scmi: Fix genpd leak on provider
> registration failure
>=20
> If of_genpd_add_provider_onecell() fails during probe, the previously
> created generic power domains are not removed, leading to a memory
> leak and potential kernel crash later in genpd_debug_add().
>=20
> Add proper error handling to unwind the initialized domains before
> returning from probe to ensure all resources are correctly released on
> failure.
>=20
> Example crash trace observed without this fix:
>=20
>   | Unable to handle kernel paging request at virtual address
> fffffffffffffc70
>   | CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.18.0-rc1 #405
> PREEMPT
>   | Hardware name: ARM LTD ARM Juno Development Platform/ARM
> Juno Development Platform
>   | pstate: 00000005 (nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
>   | pc : genpd_debug_add+0x2c/0x160
>   | lr : genpd_debug_init+0x74/0x98
>   | Call trace:
>   |  genpd_debug_add+0x2c/0x160 (P)
>   |  genpd_debug_init+0x74/0x98
>   |  do_one_initcall+0xd0/0x2d8
>   |  do_initcall_level+0xa0/0x140
>   |  do_initcalls+0x60/0xa8
>   |  do_basic_setup+0x28/0x40
>   |  kernel_init_freeable+0xe8/0x170
>   |  kernel_init+0x2c/0x140
>   |  ret_from_fork+0x10/0x20
>=20
> Fixes: 898216c97ed2 ("firmware: arm_scmi: add device power domain
> support using genpd")
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
