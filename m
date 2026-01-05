Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013020.outbound.protection.outlook.com [40.107.159.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B65C3A1E69;
	Mon,  5 Jan 2026 11:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767612934; cv=fail; b=Lylvp2WKKafBKMG4l86vif7msPOqJjDUKs4M/pwADTiwxkxFnuIQaEDv1jIScN0slK+kgUj+xPRqrzEoHjjugdAhc4bYZNGiLk/xF9hvZbcX7P4XG66uWGH9oBrW5puDcq9u9g8v27N8NNjt/TueJEGOe/ZFT8bl70lySRVx8nw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767612934; c=relaxed/simple;
	bh=TeSiQ0uGcKyFRWdawAgd5pLKTUH2KIhgMQAArWMl/Xc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WtpBMPPeFlfbggmkCQNvpRT4Dgqvj4MGyhOjd62tLpuH0FlnEZZ47jtX9aLbYwKkZvM5GsdyY7XOoYM0QFp6t8/ASDZ3xUCNBLR9dVukvHy/CklrXhmuPbPi3WX+pBOEJHESMzV8zk1ryHi+VYjwD74pvCsIuB+vx/AeZzpQh70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AZnE2oz5; arc=fail smtp.client-ip=40.107.159.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AZnE2oz5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P8mV5aSkmIptEFNBnkocNxTNeuJZD7ETjpx4AdIe0av9+2zEOH3w4OjqBMA2WChKVclR2Foy9A51wER85V5r2gbrakBx3Qw61cxjdIEtCOKzWJ1klDVZ5l/cFJfDwgCoR+jlQq7pzxg31bqqVa4V+dUmpiZdWQSuddRmsBa4Uz96XSC6Jt4dFOSHefD0YqNdqIELcG92dl50cksXvGyiWLkL/PH3zp7Q2C+cODD4SZUkuubKWZgTCx4BnRGvXz/t3exMq7E3loS3N+IhAZZ7P28mbtZY6Slu5SBYbv1KgEl9ajM8Bgx7iGmQSFKmobsqYAC7yJ1P0gEubH+vaUcgZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/UYstX4hnjc4sadogv8VbKD2rPz/XtK16w+KJyc0Us=;
 b=GCGHoR3RmQieTAcJVtmk5M7hh2Ihm7LABhNGYjW9jgi42Vnm+o2kBoT246lYInWqLnGput7M5YTL7k4dzyK+hp57SCx/QTpxgRts75GcM0am7miN+ZMhcxuDny7kB6US5iiC7uhbAMCZnO3X9DMPRvHoe/DGlxzUhEkcEiUTMnVYjonX8vCCl+AHW43R1U3o6gBLTwLFbFQx8ZrWuaqWTC5ulOmDdVbUBPqIj5WhvexPmzrWlZy1dSoDrbxnUdBQvNdb5FUTtn+HtldehL+sMUUq03STKclesBhCceY6v8VLmk/2jdeeTrHzB0VmW6mMIBnIdb8w4Dql4ur1DnOyBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/UYstX4hnjc4sadogv8VbKD2rPz/XtK16w+KJyc0Us=;
 b=AZnE2oz544cTakFM9aOPdnZ/VGvkgJO83rPEcauomJtkQC/YBIfREhvxlbyGLa7rpgdgZDkXyx25/jxh10beAq5IWi5+TosWLwydOjH5ncK05uZHzBNvwjbqP6Tg+YVqW2aH1DW8oF65XDd5bpnO7666VrvZ3YvdATrbcvOXhb5UCX/J9p/zqMxfObPkkaIdKhmgl+s5GDkCfhK45Fbi1rKY/e60xebhrO0slJlF9p8aoLXLGYZLTr4dE8uK1GNeRpkW3GTIAw/1RT1LL9EDbMyhqTASb/Da5VxHgnmzQO8kx+1gV3pteVOU+Fxn6CjuYxDLf0YGFe3pn0MGZu+4Tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI0PR04MB11700.eurprd04.prod.outlook.com (2603:10a6:800:2fc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 11:35:26 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 11:35:26 +0000
Date: Mon, 5 Jan 2026 20:49:24 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] firmware: arm_scmi/imx: Support dump syslog
Message-ID: <aVuzVNmG2l-igiEB@nxa18884-linux.ap.freescale.net>
References: <20251029-sm-syslog-v3-v3-0-64e14a6e3f87@nxp.com>
 <aUCy5+vAPzDGeux3@shlinux89>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUCy5+vAPzDGeux3@shlinux89>
X-ClientProxiedBy: MA5PR01CA0054.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI0PR04MB11700:EE_
X-MS-Office365-Filtering-Correlation-Id: aee1f4b0-2e6f-486f-56d1-08de4c4e8502
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KTdW0acIsOzHEPs3PCUsMNngfcXyehzaz8XQPj2PSiaygKoqmW1FsAMMbPtO?=
 =?us-ascii?Q?ajOol7rij2/Ag1iClRpOBBBz5HHKuctFllANl3injNeMMi5SEpj6ytvj3XlP?=
 =?us-ascii?Q?NU34p+++GGETcjhTKMu6zM7KAeMOwIdSmN0qjzlmaX0UHCqpo+PPKDuJcQgA?=
 =?us-ascii?Q?MZTFMA+M5GDUSaQV/OwQfyYwrsMpe++rkpZmz0hNSxSsdrTM2G9n4Z1VXMSk?=
 =?us-ascii?Q?vZ//TbxtRL69zBAD/DZpyG3jwOYWU7lbGrI+sCXuMMDtVOzLzCTyesTnWRtt?=
 =?us-ascii?Q?mGuhD51AFyJHWwafwPX0dkmKN4LcJvBu9zYhHpJihKtPjiC+Afoebfn+elcD?=
 =?us-ascii?Q?ln/th+3bB+7knY9IQhcDt6t6klr9HEmXwERYQ0Srvr6dUcUvpntiluxzRJV8?=
 =?us-ascii?Q?Q+9Q5tP1C6fK5mdN6Ol0in/jq0x+et4ELhrunO01EMkuL5Va6Xc2wMGbons5?=
 =?us-ascii?Q?hoIp/Xk0YKix1yFBK7ClaFZxq+CE7NDrPWuuiCyESVzHuChSAFH9ESFIPp2X?=
 =?us-ascii?Q?xgIZ4AzhqLZynj4YqzbAkCA72GXwOLbX7Ub973wFmiOBp326r8/FusW5+WH7?=
 =?us-ascii?Q?EsmL2Ri7PzsArOVgIgZQZvr1l4iVBu1M83Oq8RLsMGSez5qcux/3WeMQp2v9?=
 =?us-ascii?Q?JBCeCGh9vdfYtrdaaqjgR5iK2JrkE2C0eAfHpXh/PDv64Qg40cKgq4w1kOTD?=
 =?us-ascii?Q?dzd+l3mdZnSdebjOXUoXc/CE6jyszo5z/bNi2JXqtvnFHgdsr4RHTSIXG/cg?=
 =?us-ascii?Q?yz+m2tVknAfoY+siyBtQGHx47Bj8U7oO/3ydEZlUeF6xdbVoIT7jaA8vxSxz?=
 =?us-ascii?Q?1RUkAUltoxhTPxihJpAgg6IdoHHLCFhpKo38mrMgdS17lutJDNRFPYbFfoT6?=
 =?us-ascii?Q?sQSIsF6nIYw7RY+b+S7mE/ZgfRA7ObHaNAYX7YACmjRHX2KMMZj3igIDJ2lo?=
 =?us-ascii?Q?OLg8jTLXJzsY9RpSpADooXSQC6kJGAgMhFsNcC96grnGbzvwihovmUTZJQXm?=
 =?us-ascii?Q?QxufpfKkpRD+1jO1tjyvpWwdO4Umq7vNocVy5EIVFU0uvyafHrC5P29gN4KO?=
 =?us-ascii?Q?oMRj/zQDNcNA9uAytzSDnotitcHdIzjyZB+I1tHbYbIrgrmh0WGiefpO5xH0?=
 =?us-ascii?Q?WS9dMhEGyog6Av5jv35HIUK7zoTZYW96a2fWIcoYxpvn+L3cvHKR4GQ1sen2?=
 =?us-ascii?Q?KYYftcS0WipLDCLqGF0X2btI0iJsNyezh3YZ0/koFefYFTo+/anipbxFKgcd?=
 =?us-ascii?Q?7nRb9aQ8IAGMyO2Kn2YN2xzN9tYmhXWcmG0CzNxK8goi9fd2jcTcETuT4ENp?=
 =?us-ascii?Q?sQL6f3w7HwDl1j7UQvI5wHWk4vkNstIwDWNTqVj7vqFgSg0tT7jEyA0/cHyw?=
 =?us-ascii?Q?eP0WmDxMkR/3IEPBRdLWpF7J4J0/MErUAmIiPdsdgRLeQGRz9ZO/W/JvIl3G?=
 =?us-ascii?Q?3TlnBuedqrAlMLhpQjAuSpZKOaZ31sUB9Z2RIpeLuEphKbx+iWlczQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P6DIV42lKS11DX0O2sghlM5v9rn1Vhkm46Zl7A8fAo2kJwf/d/kbol6GBbgD?=
 =?us-ascii?Q?Ny1Mj1hDmiFltefGh0I/8I+/U7TpdVRjzGtTggDt6K2HYm+/6EBdEHVUtbA3?=
 =?us-ascii?Q?Jp64c3KdX+KHn8ymX+L5BwvmZ1+462FI+Wyy1vHjM4XKVgA0Ynds1oo8TP7l?=
 =?us-ascii?Q?XxJvxGES/UOGp0WvXT/fjDToBxiElVk4fjHsOX+Jcp2zbH/N4FeCkjaMOmiQ?=
 =?us-ascii?Q?63lg62qKmZrPO5TwlCXZ0YhxWsTrHjm2B80Y4BLbsUprp2O6Tz7G2LHhjyUo?=
 =?us-ascii?Q?Lm7DwJde9FJtu3zuiJjquD8QmEeovuB8KxkV+PbwsXX8AQI1M+AePYgHnDYN?=
 =?us-ascii?Q?oBw5ymn0/NTbv11ITAzfOtVgghGjUYiqXhoUqB63BalfDODVv4vsaA7HCMuS?=
 =?us-ascii?Q?E+je4G+8gVNijmgRA+vuekPyLbk4i1eOaUnR5ep+BVJtG4yIC2b99hn/gJ0j?=
 =?us-ascii?Q?D19tW3hbikt/ZrbQKb2TLVCN6abN4AbQuNKmWMRJ0trqYeqyzxApCazcmfqr?=
 =?us-ascii?Q?T5XpzcaR/pZ/6hWD8bTpgVASMwEYIYgIwe1IoOJPmnjzndM8T7Hn0tevKDMF?=
 =?us-ascii?Q?2auHpal6eHTIJ/W6kbvrn0UFExaRlrwv5o80ZGl/nEp0oBdsTB50+SDwitlf?=
 =?us-ascii?Q?3o4YupMekSzKRlAbaLOslY+nMXFKntfzDrBB0A9WB54hBZjZaIQAzZbEsADn?=
 =?us-ascii?Q?HuNVL8xpwh3fjt6obj4mDqpLeuly7bd48ZgweSa2RvG2hNLEdPniGG+eevwW?=
 =?us-ascii?Q?9jdV0S75jowr/2pOe7tH4koUV4jKQYSnA2+fFNxTO9ZOZ4TPa5LY5LyOyRUv?=
 =?us-ascii?Q?bjZ7ji6Pi7hLR4Fo8zjekVCWWBZN5u7jdoguOhIh0MsSWqeXS8MyarvXzO4O?=
 =?us-ascii?Q?p8nFXYCGiuo/smU7RG9GIYuNgSQ5FoOa4P5FbCJSH9esKfa5TitvkLgqRdfC?=
 =?us-ascii?Q?n7/106ay4+0xFNtzI6aeJgJIWFay0G1BlCALzytzQWvH1Dg7rZnp90n1EK7g?=
 =?us-ascii?Q?b7wmog/z//ScNIZib5+lwoXdFJSXeDVuy1EwAhzEmLI9OJmmACB5FwF43Dmu?=
 =?us-ascii?Q?c7UpGK7YTtcuZqXCpzoh3y+X0jHvOTOqY8WV7GeLK9MvvweTokvS/o7QznQg?=
 =?us-ascii?Q?B4oCgvcPOUU+T5k3jJiSk+KvSRdvc/mQTuDKbBK3sRdogBrf8WlIa24fe7Y5?=
 =?us-ascii?Q?GAEkGSPTcK1uex5NQWQio/cui8scFbrbL7JeDmH/kV43QWucKR4xXO2a7UIr?=
 =?us-ascii?Q?hjiePkRubox4X/zdD215BOgDe25tMMB5TiN3C8AWMcFXkqwZBaXqZOr5/8oh?=
 =?us-ascii?Q?TKuu8cz9veESpAXPnjuyCIpqqYBFVXjS/7RrYca03dTToozv5mENb+1n61DB?=
 =?us-ascii?Q?xbtCJsKmTR0sQGCLCf7HOk/SV1C4n0SmJodJRpCeSJuOeq+SDm1NZfUx8CW2?=
 =?us-ascii?Q?TLYbFIeocpnx+YdoZn+hUOMW5/OOe4ZP3e9Xu9b8V4hTX1RJA/SYJVmoRpME?=
 =?us-ascii?Q?9g1ZaO+8gLs0DPySN88GOX/rEvSbnhOuvRWGnZs7YGrBl47F5QJ4Q3fEGCRf?=
 =?us-ascii?Q?DD9xoJWTJg612ml1r0jZUtfcMytnpqKI1I/X+AGVgaHTbQUmpROcSCOglnpC?=
 =?us-ascii?Q?5LWtsZX3j947s5j2OSKOrFehLC5oVB7kbKvKyZQYLIWEok79YYk5MWHiPsm+?=
 =?us-ascii?Q?rXW5Y/q2To79GESWchmiTJRoWzZvZbjRrgMKVGtlFz/e50uZI/laVZnUJZUp?=
 =?us-ascii?Q?OsfPAmrlOg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aee1f4b0-2e6f-486f-56d1-08de4c4e8502
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 11:35:25.9628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BpoN0ctt+q7mH5Ey105hRjRt2YmwgDrW9wQgQ48djoyZQF3/nPU7NZK94Qwnk6IFiL8m8k23SbOg8D/dyUF6jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11700

Hi Sudeep,

Hope you're doing well. Apologies for following up again, but this v3 patchset
has been pending for quite some time. I wanted to check if everything looks
good on your end.

Could you please confirm whether you plan to pick both patches? Or do you need
an A-b from the i.MX maintainer for patch 2? Alternatively, I can ask Shawn to
pick patch 2 if you only intend to take patch 1.

Please let me know your thoughts.

Thanks,
Peng

On Tue, Dec 16, 2025 at 09:16:23AM +0800, Peng Fan wrote:
>Hi Sudeep, Cristian
>
>Just checking in - did you get a chance to review this patchset?
>Please let me know if you need any additional details or context.
>
>Thanks,
>Peng
>On Wed, Oct 29, 2025 at 08:07:00PM +0800, Peng Fan wrote:
>>This is the patch 5 and 6 from patchset [1] with switching to using raw
>>dump, per check with Sudeep and NXP i.MX SM firmware owner
>>
>>System Manager firmware provides API to dump system log information.
>>So add the interface for Linux to retrieve the information.
>>
>>In patch 1, I drop the two structures compared to patch 5 in [1]:
>>struct scmi_imx_misc_sys_sleep_rec
>>struct scmi_imx_misc_syslog
>>No other changes in this patch.
>>
>>In patch 2, I switched to use debugfs to do raw dump the syslog, compared
>>with patch 6 in [1].
>>
>>[1] https://lore.kernel.org/arm-scmi/PAXPR04MB845937237E3C1AF5A2ABA8FA880CA@PAXPR04MB8459.eurprd04.prod.outlook.com/T/#m6ed303ac9c584c6e2ab39f89359f3131b
>>dfcc9e5
>>
>>Signed-off-by: Peng Fan <peng.fan@nxp.com>
>>---
>>Changes in v3:
>>- Rebased to next-20251028
>>- Drop unused variable to avoid build warning reported by kernel test robot
>>- Link to v2: https://lore.kernel.org/arm-scmi/20251011-sm-syslog-v2-1-v2-0-f43a3f6b32e4@nxp.com/
>>
>>Changes in v2:
>>- Rebased to next-20251010
>>- Patch 2: Remove the IS_ERR check for debugfs_create_dir per Dan Carpenter
>>           Change 'return 0' to 'return devm_add_action_or_reset'
>>	   Drop the size check
>>	   Include 'linux/sizes.h' to avoid build break
>>- Link to v1: https://lore.kernel.org/r/20250910-sm-syslog-v1-0-5b36f8f21da6@nxp.com
>>
>>---
>>Peng Fan (2):
>>      firmware: arm_scmi: imx: Support getting syslog of MISC protocol
>>      firmware: imx: sm-misc: Dump syslog info
>>
>> .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 83 ++++++++++++++++++++++
>> drivers/firmware/imx/sm-misc.c                     | 37 +++++++++-
>> include/linux/scmi_imx_protocol.h                  |  2 +
>> 3 files changed, 121 insertions(+), 1 deletion(-)
>>---
>>base-commit: f7d2388eeec24966fc4d5cf32d706f0514f29ac5
>>change-id: 20251029-sm-syslog-v3-0143f85b0ce6
>>
>>Best regards,
>>-- 
>>Peng Fan <peng.fan@nxp.com>
>>
>
