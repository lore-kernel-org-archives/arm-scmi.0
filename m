Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2063.outbound.protection.outlook.com [40.107.22.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13831DDC3E
	for <arm-scmi@vger.kernel.org>; Sun,  2 Feb 2025 22:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.63
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738534359; cv=fail; b=ejnBGWFdaaTtAbBERvhClrGiyS7nhRw0M2SPCkCY5SticljFeU5zXEssU2/1X9Al/WwQjfXfJZu2LeIe3v+WmM2lmTCy1qE3KZfX0n0kxakAudHq8Kv2Ufzhb1yLFohozFBf3n04Zyv+jVjRszbjGg6zCTOpQl1CGDZFbOAp/hM=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738534359; c=relaxed/simple;
	bh=LTaSmqvMsXdNxiI6geq0LyD1bTVA0n92ws/5OE19/f0=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TjKwAXRGVcyHGiytYs9ELOKkGLvu0FtyarsHF+m6cHQlNX6UjYjdAJJmVLjydc0gJcnVHPi3ElS3yNpiThEYfe8ywrFvIlZAcFSozAJZQ2WiED60pUUi4CI6sNY4DQHWHzgV0Crm7wNx0sQOlH3wU5l9oMEPogP/USuJYYh7Y8c=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=eIpBkxFZ; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=eIpBkxFZ; arc=fail smtp.client-ip=40.107.22.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="eIpBkxFZ";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="eIpBkxFZ"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZHwe240/wKQ9/3V0BEVYmxUqHJKaHXJycjKEarkXhgUAiSy3JeeMljxqebNwvAOkeu9ruepqIRfqff1VbIudJr8T9FkSqY3vYCB6eCic765Syddk02rk/WPxI/LQ/RsBml3VdGepIf+kzoUdvrAokSBSjyEsMrhfZE7frMRMUBFAKczJWQ+9rLc1oBKotrj0403tS3m6dmHkE0LqoSBIz62C5NaPWY6WElhtZxE0bblNoEhemeewJphS85gvWgnyxeKtMDwTYc7QsjEKFMdakB6wgDAjfaqw5s6IeFfd7lNC7cIzk56MUikutYQPPEWfTJ2AzlIphUlY0hrNz4Jrbw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtitkP5wBBkVI0PJIEJ446kGh9bl8UQ30Tnexso4n6w=;
 b=xS8u7tWsJDDTDewV8dOP+7KUR1/LTXckRL4sRPDRXR63g+tlbKlXRPShepkEjDLlfW2v2zaX65M4KoqmnEOgdoIvxbqD3lwLBeCLHBuxjuxh7UIlURkZpNNz+Pf1xQSymz5H7s3IYA6ucbXiRD2+MXbykr0LahTf0zo7ok+Xj3wMCa7tAqvauAr4NkQtv/Wiu/LNuV6iL7MJLxvmQatadRXQo0AUn60Qnd9DpWBPSuid/JCEyl6aVpfq5TTt8bNdNLAhL/l8LJKexdEou3TH8cTS0Zz8i249jZ7Sl/22lPrHZ2kA29UunkAGOQuYMJN+DuEzIPAAi6i0tqGUJAwgDg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtitkP5wBBkVI0PJIEJ446kGh9bl8UQ30Tnexso4n6w=;
 b=eIpBkxFZVavVz2RmqnjZLOqv6eqpAWYeEQdbdIe3UGbroPGUVotth+VGlgR6hz0de4OmpqD9u7h9PBljQk3IBHwc9NIyU3F5X8mjsmawYUVe1jslorxGhBew6PXGfpTaqTjdLDG3/fQu5xEse0FIJsw8F6FYEnhw2k+2NcbT4mA=
Received: from DB9PR01CA0021.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::26) by AS2PR08MB9812.eurprd08.prod.outlook.com
 (2603:10a6:20b:603::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Sun, 2 Feb
 2025 22:12:30 +0000
Received: from DB1PEPF000509F9.eurprd02.prod.outlook.com
 (2603:10a6:10:1d8:cafe::a) by DB9PR01CA0021.outlook.office365.com
 (2603:10a6:10:1d8::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Sun,
 2 Feb 2025 22:12:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509F9.mail.protection.outlook.com (10.167.242.155) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14
 via Frontend Transport; Sun, 2 Feb 2025 22:12:30 +0000
Received: ("Tessian outbound 57745bc349d8:v560"); Sun, 02 Feb 2025 22:12:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 58f9aada298b1e27
X-TessianGatewayMetadata: 0pmUEa3d6bR4df1tl1KxF/yOLU/wBQTJc1PPFNJDMDjvR++clYwy6tyjFs6Qu8CVJEvO6ZmD64TxfdHKMeGERE+C13/0e+aoFzx0NnX1UvTunrj7ek14VLe59yJ3Pjsp/PjK4gORRwgHTwSX0DMjNKwgaN1rjxqL7SXpPCpu3hefYoWuaB5vNchW19ev9M+8l4DTU1giXNGD2AKNE20vaQ==
X-CR-MTA-TID: 64aa7808
Received: from L0fd3fec1d63f.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F61148EA-A75C-43F6-BC90-EB5372186893.1;
	Sun, 02 Feb 2025 22:12:19 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L0fd3fec1d63f.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Sun, 02 Feb 2025 22:12:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DB9a5US4zujDN9Pud7J5Zgk8gqmiDIoe7XzMuPGO6jBKoFCooHHlI/qC0jT5GfV7qFwA45ZsSmTP8s4aBa43xjJwLW3DxA7jnLgPW/Bxvk4msT7EoXxn9/3bwuLsd7EO3Pb0qbXwO9s8r52jHfWn4K3h5pP1fwoCiqtq2Zdct1VM440QOpSZKNk73vij59I4duyE07Pvn1S7k+u7vNtkx67pJ/+JIChgP4GphZvXOU3WDhF7ov56m5Zrxj6m7cSpMUbkiPQ5WGCqfetWeYybSwk20MknekhSoXtsbC3kh3zJSrpgXR4+iNQmjh+1Ys2hj8i/X//m0TDeqmgnCbokvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtitkP5wBBkVI0PJIEJ446kGh9bl8UQ30Tnexso4n6w=;
 b=NpU57L0v4MxaZvicQccGZdLYyNpkgu9k13HdviStI7TH7vuNlvECuBirY2JOGTcQXVxdNXFnZj/Al2wQ6q0VkU3jaYr+fy1ho53uGcQbSWqSZrYnhEJ2S71rgkRqygqu8Y/O3WWIe0RDon+7bWKv8AhyoBmKjNJUo4EUNyo1tW659XRpulYikMh6eudlF7n9Qv6uAsfajDeVxafyLvhRKbvUSUbm4qkn4imHi3cLPockEDf4jZ4rIeW/XD08pk10HUXUxKRtdcPfPCX37OOP32fSNbnSkp2G7k0DBQOLbh7R3CV2RRpCV+IASgCKJIITlcIhK7KdLm56TV+139S0kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtitkP5wBBkVI0PJIEJ446kGh9bl8UQ30Tnexso4n6w=;
 b=eIpBkxFZVavVz2RmqnjZLOqv6eqpAWYeEQdbdIe3UGbroPGUVotth+VGlgR6hz0de4OmpqD9u7h9PBljQk3IBHwc9NIyU3F5X8mjsmawYUVe1jslorxGhBew6PXGfpTaqTjdLDG3/fQu5xEse0FIJsw8F6FYEnhw2k+2NcbT4mA=
Received: from GV2PR08MB7955.eurprd08.prod.outlook.com (2603:10a6:150:7f::21)
 by AM8PR08MB6628.eurprd08.prod.outlook.com (2603:10a6:20b:362::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Sun, 2 Feb
 2025 22:12:17 +0000
Received: from GV2PR08MB7955.eurprd08.prod.outlook.com
 ([fe80::360d:c6b4:e158:bc33]) by GV2PR08MB7955.eurprd08.prod.outlook.com
 ([fe80::360d:c6b4:e158:bc33%6]) with mapi id 15.20.8398.021; Sun, 2 Feb 2025
 22:12:17 +0000
From: Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>, Girish Pathak <Girish.Pathak@arm.com>
Subject: Re: smci: how do reboots work in scmi?
Thread-Topic: smci: how do reboots work in scmi?
Thread-Index: AQHbdLE4n/a2Dgj14kKBnTjpoq2RyrM0lPD0
Date: Sun, 2 Feb 2025 22:12:17 +0000
Message-ID:
 <GV2PR08MB795555EB6766B147C5420371EBEA2@GV2PR08MB7955.eurprd08.prod.outlook.com>
References: <a72847fb-afa7-412d-baaf-52da8b0e6fcc@stanley.mountain>
In-Reply-To: <a72847fb-afa7-412d-baaf-52da8b0e6fcc@stanley.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	GV2PR08MB7955:EE_|AM8PR08MB6628:EE_|DB1PEPF000509F9:EE_|AS2PR08MB9812:EE_
X-MS-Office365-Filtering-Correlation-Id: 88ca9d59-e8b9-4329-e0e3-08dd43d6af9f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?z5iJlfQAspF+cOI43lZZ6bqxhij28VAZ3Zhgu50wxc6GhpjaRwQMqYyT2h?=
 =?iso-8859-1?Q?R8xjksZC7oMJ9lDvXJ7h1qNyONoTr9x6fA5JE+hnwNakOFBItm7wMA/mZA?=
 =?iso-8859-1?Q?CilmlpB+Br3RZolDuY6dsiZ9T9rpiuCJlVx4ylYvW5JTOIkOODd16JQ7TT?=
 =?iso-8859-1?Q?ZIbug8SNtCYLpfdrCqDxsPnqkdfWyAWF3Z/YKoN8gDTap/W5D3eeDeoi5K?=
 =?iso-8859-1?Q?06rMtIMCQj5lHVTdbKEIA+queJ1e0CAT+W1cNNHlKb2xa239GfnE/7SBUg?=
 =?iso-8859-1?Q?UHJ9wS2hxZ8DjVbWPhSjXba2jIwLEDiLptF6nHEUNucqsWAhafN9Dn1LMg?=
 =?iso-8859-1?Q?8OV8w+fuNJpcYxjwKKmZB12Az/0/vPCbYSD9gaZrERVdIUeGrsvFRElX1R?=
 =?iso-8859-1?Q?IHzmnec4gFxHq8pVeLjBc9AEIpUB9aVgTWwMANXDIoovc9Tr+VSN/zK11d?=
 =?iso-8859-1?Q?C/CUaIcVy3StvvhJ3fLVOsNtZBVum5ME1eE36lxgremWFtYo4ILdF4g6nR?=
 =?iso-8859-1?Q?aLF1alzM4VbCyLcJlGCazJihpXKRUUEhJLwhp4PEICAbZ3qwUIW3Nnbvta?=
 =?iso-8859-1?Q?k/+9oZ5FdwaZ0RZrEsLfIfA7eiobz2X8CqTz6vAgA5XGjQ5WunKcK6Z2de?=
 =?iso-8859-1?Q?X2nt0ArhIEm5M2/wFMfKK2pNvMskBtDw2xo1y3WZHMm1XJjEK3mwUO3RaK?=
 =?iso-8859-1?Q?BXKyFgBmfsvbtQj0X5XaGrobhllizRIfZS5GVm850ZIAuvu9+PPjLZG6N6?=
 =?iso-8859-1?Q?a1CZUH2LnnATwAl/08cgD4+AOfk70axEK0i4XEcdbqgbvMwIIozNBT4rZ6?=
 =?iso-8859-1?Q?gAdy2LvK2u9FCu2KVvtIvRHdoo1xUBDR5yVPv34BbMPHZplzX7Iyja4zOa?=
 =?iso-8859-1?Q?SQaaV6TsHUPNyF9DALuFvKEF/N284jSvo7zpdi/ti+gVAgLW+lh1FRJvy1?=
 =?iso-8859-1?Q?PY3YDyO2xWoucvgYzXMOcDAnYd1F9utajsFj7cBcwno4nrnwEG/PsUsOZR?=
 =?iso-8859-1?Q?Jrle/d0OCNV7H+NkXn7blM6LUFVQrTao/ySNOdNxj7Qd+hxAAxL2UOZdfS?=
 =?iso-8859-1?Q?G4qesj2VoHCZjIclq/yDfGPuNXxtLsoUTOqDkT5Z44UNkClAQEYJp5Gd1n?=
 =?iso-8859-1?Q?QDWOeQD+VH2kS+AVNZ5kTBL5pg4XnqOkgUTVDAqUdy00UqeP9tITeUFe3v?=
 =?iso-8859-1?Q?2go5DEEeIr142uVaI2UJIkbd2q6rAaYJzOvzdMjFWtObph6f1tdqA9Wqtw?=
 =?iso-8859-1?Q?k4/yjlra5/EqB5hXJooUUXN6Gi0/GAyFm0hvjcEP3iX7YX95drpNeL+57s?=
 =?iso-8859-1?Q?pMObBwkn7CM94o3dWbfO+HSbeBhNu79OcK1ZGVPzTGye8d25rmG3zvY1jT?=
 =?iso-8859-1?Q?FhmRP/xmi+MZqyzils5SzVsiesbNUMJtCmVdJS2GnMRzxOPIL30zFamhRF?=
 =?iso-8859-1?Q?IbLRy+I/Lxx9AftINKxzCYsOHpZbmpigdWcZhKNzuD9ThvIktilzN0Iumj?=
 =?iso-8859-1?Q?QJg25inCcDdQDcQGDD/DBH?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB7955.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6628
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:150:7f::21];domain=GV2PR08MB7955.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F9.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6a434637-fc6c-403d-6cd0-08dd43d6a7d4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|35042699022|82310400026|14060799003|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?JQaWLORPYP9/tLvkNbMx6OXzx4yiXgJaZ/FhoDvdRKd5xpJIn21yGKGaiu?=
 =?iso-8859-1?Q?14nqWV5zZ9uvumFA2wiyPLb/57WbtLRLpRA8UWRRGntcDHyjR7F0JF0lrG?=
 =?iso-8859-1?Q?RwMDgjwLobD8+V5bC/GNIyYG8oLi6JQVke28VqjeQRhBfXB0DFFXJg/Su1?=
 =?iso-8859-1?Q?D8F4iehG06cH386in2Lv20sSRzbeeI8QmKqJWFA3JshSaJY1N/Yb3JBY7c?=
 =?iso-8859-1?Q?7erwXCA+oh1zNOyaCXIyxb7hMFwb5/qq9R3zcjxAl3xOTUJAiLdfOy3MxC?=
 =?iso-8859-1?Q?HXJvOiMl6S05zho8Oyr4HmBZ0BQIoookF/pbz/0R77vtb2G2jiyEV/EJnQ?=
 =?iso-8859-1?Q?+RXOwHVf70qfsojf4u3QveFkzxwjgQmGH5ADtWyUJPfkE7tC8p1iKembQP?=
 =?iso-8859-1?Q?RtfKvMVEoIj4cndvtY9I/m2YG1Lzrx0gKfoGXQ2qHGBxHneNfoy/IeCrOZ?=
 =?iso-8859-1?Q?nyAqRilPZlynNkNce/I0Z2n+lD4k5qb2ndsbvLr0AGjHqQuM1V1+6jwNcV?=
 =?iso-8859-1?Q?FjF0iHHGJszott2gL3e7nM9cUIYZDU6KW2TRgynt7j6YS9zFwtn3Y12ood?=
 =?iso-8859-1?Q?lORAFuqzA8pgUtRg/NxDIhI1P6DaVWa/37Emp1GVqlN7UBSlQDXBCsQHvO?=
 =?iso-8859-1?Q?3ZjQaZP/PU/pzYHQKWVKB8FFWQNMBGANaMvFPD8y0THTHrt1tZsEDAyRA4?=
 =?iso-8859-1?Q?Mwiz3yyp2vgdqbIm5eOqMNwMflb19PS5d4EG52wPimdBxICA1ZWfBo9QxV?=
 =?iso-8859-1?Q?eZVIaxasgq3IbzZ7sztW6nM55/kwrzLF03IeiQjZOuamhgCpMeyGWZnX/5?=
 =?iso-8859-1?Q?JjgSW6EJTNVbN5HHpr0LS0flagQejm6HY3p9OZw64kPqfxy4y/H6l/T1Da?=
 =?iso-8859-1?Q?vOnn9R6JuobZIF1tyEtSPKj0Jxg6XObiCUXv9zsU5hny96Na5X2zwSQcRb?=
 =?iso-8859-1?Q?NBOJqOoOPPwRhC76kwCTecx/kVD3dcOmrcTQn+8GwosvcHh+VOoswU22Wy?=
 =?iso-8859-1?Q?0FGyCS8SDvrL7h1Z0OZVoTxkBDezw8CGRGfHkVWAs4MypJJ7X6uxEINpDs?=
 =?iso-8859-1?Q?8Rs49nNbUAdSCW8eMRMb6bYdBDeysTwiWJr0C+2zkylOgd6gnrZ89hMNjw?=
 =?iso-8859-1?Q?WiJHNudFJffgWb7VhTvscMb4R7jSBSY04uxlXT31CqpuFaMBrAOHnP/fkN?=
 =?iso-8859-1?Q?m/aL88bVb8hK2jQA8lvJskocIdvCPpeFQntsbW7ntsG9o3fqAUStcGu6Oi?=
 =?iso-8859-1?Q?wbCgkMC2IXPL+yaCtBv9Y8VVCC6uZtCWnhASIvTQMOr1QQlzaQBtO/bISy?=
 =?iso-8859-1?Q?/KcoaV4/uTyQ81YqPh1Ktz+/yWElRkYCZ0ZmLvw56krFN88PewHk1NZcq0?=
 =?iso-8859-1?Q?VFve7ti3oBc3kseGXfaFmIc3lNj8g0b9fRHzmx9VSP2sthc17ZnbvLxoIA?=
 =?iso-8859-1?Q?TFO9G+3xeoM485TQKsQyB+5N6x0Qpb7qmAe6AhLCUx99YxVBp9yItsc26n?=
 =?iso-8859-1?Q?aRcBQqv4hXRteOVJ9pufwOcfS90CAJpV+14CESQUjEe9DW5KkdcZqb1W2n?=
 =?iso-8859-1?Q?rsuj+6E=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(35042699022)(82310400026)(14060799003)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2025 22:12:30.5031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88ca9d59-e8b9-4329-e0e3-08dd43d6af9f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F9.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9812

Hello Dan,
the following message still has not been implemented yet:
- PINCTRL_REQUEST.
- PINCTRL_RELEASE.
- PINCTRL_SET_PERMISSIONS.
- NEGOTIATE_PROTOCOL_VERSION.

thank you so much for your attention and participation.

________________________________________
From: Dan Carpenter <dan.carpenter@linaro.org>
Sent: Saturday, February 1, 2025 1:57 PM
To: arm-scmi@vger.kernel.org <arm-scmi@vger.kernel.org>; Khaled Ali Ahmed <=
Khaled.AliAhmed@arm.com>; Girish Pathak <Girish.Pathak@arm.com>
Subject: smci: how do reboots work in scmi?

In scmi with pinctrl then we do a PINCTRL_REQUEST to claim the pins,
but then if we reboot without restarting the scmi server the the pins
are still claimed.  Is there some way to hook into VHOST_USER_NONE to
release all the pins?

regards,
dan carpenter
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
