Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012031.outbound.protection.outlook.com [52.101.66.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D291F561D
	for <arm-scmi@vger.kernel.org>; Tue, 29 Apr 2025 09:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.31
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918173; cv=fail; b=ROhq+j2nH/OkDlFUM2h2zAkf8PNFmI2fRKmx7qai/4pV6SUVno/IL7eKEpgAO29xHv3Ql/LoDtGUjyOduP8UYoHLHWYD8SzRY7G+jS10SnXjaBwIo2mnLCdeTyPWMjTEDuWBEskMG8uqoR9x9LBBBaye9lzT8fnt7ECwbgdjN7k=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918173; c=relaxed/simple;
	bh=y9CvXDIgQo0hcDe1tiLakDBl7OOOAaWUFF7uxxWFNuA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZRiX9nbDD85r1XtBQNeKKb0LQ4rUr0GRN879nl6uXtaHKuf51Z9Gv9cJ6BSHAsKm2djCpqBHA+eYuOJnSax/Fe+cw0ehhENSzQhpM+0NiUJlT6gAWKQv65dBi5pDLU7Jijn8dC9JQMSBIlfa4QyGiaqp/4GgiuhHWE1Ha9Lr33o=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=PWCspJ1l; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=PWCspJ1l; arc=fail smtp.client-ip=52.101.66.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="PWCspJ1l";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="PWCspJ1l"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=oP467qI/U5CwOPcAMwV8qojXHMICg94XOy3YhfBaRYOqliwovFYd1VnK+JwtYKOHaJmp2ui2g4izSZb/ZepIU+r3+Ms2wGtsw+OkO1Nb97Dg8kDMQLXqCzF9puw1lOwZqKkgl+TAv5iu07LcdfNQK5oI73jgkMpOegKZYW87Nv3yphG+h7gY21YQ9b7AopBDs76ZjSF5h9xqJR++u+ZufCSo2QILJrCeh47sugGidouE5l5M0m6J2qyLdPIZh/EgCKjPOcRZdfoNBWmSnMGS1ZHfRk9usGrFRlkLRx1Z81ZUyol8ygj2XV/s5qzc3DBxKyaetBJK5ioIAv+heFn1cw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fyA3oIkngFUw0DYpuIJQpaokM6XliemGh1NLQFLkoA4=;
 b=ZUoHK2xMFh3lwGhcj6XSs8PUx6KLMBWhY3Vv3z9JQNIN/AeIrEB+7IzO/y497MCWchPJXRcgmuYYiT4YnO/xZ8/vg1UTRDtT8aztgcUu8BATJpQ805Ee0wf8iQ/tKmLqBoyDjn32tWr9kmOSRJigcUUybYnYS5u55oYdLp++njA/7KDkBAeTNRsPTvoMKdaUHgy0gV7ScDVIVf8ySpByu4TV2zhX2d0lHe02ufqjrnFtMHztw/2Tu/aiLJa4elNY2SscFFYG1JkihdG9Jcb/WjrRS/0/fFiQu9WTDvBxxgjQzCEwjS+rA7LNlnGmXofVL7QMcHA1wqU1V8pI8ROJ2Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fyA3oIkngFUw0DYpuIJQpaokM6XliemGh1NLQFLkoA4=;
 b=PWCspJ1l4k7pJPCoyyLj4tRee/CcoZuGpHnYaLojHmlyHMkBVDou/I4aY5Q6g2swChJgvxE9KKxM2xUtw+Uzw1ovXgg1a2gf4ZT6pKzq7o1BbLs0DxvXmTXCgqsUo70wls7/mdErb9geQpWcsg8VnHVTr77/OZdRw3e4Lt5dIjM=
Received: from DB8PR06CA0024.eurprd06.prod.outlook.com (2603:10a6:10:100::37)
 by DB9PR08MB9563.eurprd08.prod.outlook.com (2603:10a6:10:451::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 09:16:05 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:10:100:cafe::5e) by DB8PR06CA0024.outlook.office365.com
 (2603:10a6:10:100::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.25 via Frontend Transport; Tue,
 29 Apr 2025 09:16:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8B.mail.protection.outlook.com (10.167.8.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.33
 via Frontend Transport; Tue, 29 Apr 2025 09:16:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UeGLGZKmw6w75UEC3jNeleny6hV+wYPLmnEZWq780TsTk0FtqFSXUbRyPas+DdjjB3CEjPSJRlkZ4UGRXZD66Xm8BuGEBeqg1618cZ2ZlzivHqMd/GpwWE7wlKrMLv87/j6uWqvgFukvSv2KPBYjYrZjlRkOUvL/DxYNIUWz1cWm6zt5SkbdM3+gpv6PKziYPnqIIJdWK0nH8rgn357P4GqNgImYGsQVtFLdEQlnyYQVHvlpert0jfEd90jSjU4uMaNk5NFPFLe0V/FwgsOPwl3n+TzKNkynyO5yeozBedJysrj5RQ2gi9pxgH1vSmRYlDpJKYKwEafj91PFmjh+8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fyA3oIkngFUw0DYpuIJQpaokM6XliemGh1NLQFLkoA4=;
 b=bBnOpTOlCvehuk61mRxBvrsE8s45U2DU21NAF/2Wo1/z1flOVHTPJPnK6ivEL4CaO/hzPWZ87HqqukVQJm/nU5/7+Tm+vAm8wyVhEmrOmulXyO5DmaL6cBWGOdnq4jcpXcPLB5mF1HKNIZGAsJ7EDspUB7xGyaev/WrF/+oYifVhg9IlgJZcSS+alYjF7teRjl6O6YEZTP5Ta/zgIYVnc22bfgmPI00cO7y2BIiRXgklO9zPzgZIXtHLj0FYFNnMrl//qw3Aef2m3buPANcpEgGv7DDnlJ7sWY+AzDD8Ynizgv7rP0pYUyNzPCpgRrNKW+4p3k85YmLkzliT8FcRgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fyA3oIkngFUw0DYpuIJQpaokM6XliemGh1NLQFLkoA4=;
 b=PWCspJ1l4k7pJPCoyyLj4tRee/CcoZuGpHnYaLojHmlyHMkBVDou/I4aY5Q6g2swChJgvxE9KKxM2xUtw+Uzw1ovXgg1a2gf4ZT6pKzq7o1BbLs0DxvXmTXCgqsUo70wls7/mdErb9geQpWcsg8VnHVTr77/OZdRw3e4Lt5dIjM=
Received: from GV2PR08MB7955.eurprd08.prod.outlook.com (2603:10a6:150:7f::21)
 by AM9PR08MB6706.eurprd08.prod.outlook.com (2603:10a6:20b:303::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Tue, 29 Apr
 2025 09:15:32 +0000
Received: from GV2PR08MB7955.eurprd08.prod.outlook.com
 ([fe80::360d:c6b4:e158:bc33]) by GV2PR08MB7955.eurprd08.prod.outlook.com
 ([fe80::360d:c6b4:e158:bc33%7]) with mapi id 15.20.8678.025; Tue, 29 Apr 2025
 09:15:31 +0000
From: Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>, Girish Pathak
	<Girish.Pathak@arm.com>
Subject: Re: [PATCH SCP] module/scmi_pin_control: allow variable length
 responses
Thread-Topic: [PATCH SCP] module/scmi_pin_control: allow variable length
 responses
Thread-Index: AQHbuB/W2bfPmp/9sESkgCreGaBZO7O432CBgAB3bICAAQYHSg==
Date: Tue, 29 Apr 2025 09:15:31 +0000
Message-ID:
 <GV2PR08MB7955BB3B2264B50DB07CC0EDEB802@GV2PR08MB7955.eurprd08.prod.outlook.com>
References: <aA9KGTuVXZotPEMF@stanley.mountain>
 <GV2PR08MB7955196626745F65BF74E90DEB812@GV2PR08MB7955.eurprd08.prod.outlook.com>
 <23d664b1-b816-46a0-bd0c-fd7c518d2a41@stanley.mountain>
In-Reply-To: <23d664b1-b816-46a0-bd0c-fd7c518d2a41@stanley.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	GV2PR08MB7955:EE_|AM9PR08MB6706:EE_|DB5PEPF00014B8B:EE_|DB9PR08MB9563:EE_
X-MS-Office365-Filtering-Correlation-Id: c3d4759a-c747-4057-9392-08dd86fe7734
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?/9Vo9JXas+XmxW5UmJfvrp3/2/YY3LoV37hzSjfBeg4urJV6OWoxYt5Elt?=
 =?iso-8859-1?Q?IqSe7rX56MiWxCGBW0G7mlQZxhZUDQWJPRlwIPHTUJYtpUwXdMSHglRVqw?=
 =?iso-8859-1?Q?guGD1TCaLapOQW1u8IBwGP+pcdJrWqJyrJLDuyDxmR1WxxPbQN4C1drfw8?=
 =?iso-8859-1?Q?hY3PWMJGciKVepLkAaqHJoUvOIfEYI+jCpWozdUjyElny994GsvzvLVObj?=
 =?iso-8859-1?Q?yonRZuRUl7LGWT2jWHIAzU6w6ZE2smXHajMUmaPjM7WcVRvyVv1MTMthwU?=
 =?iso-8859-1?Q?+X3DuONfMWGbZudcqT4pDv52Yf7l9Hbor1AbSHMZhQs+iuNm3ldsngCeKz?=
 =?iso-8859-1?Q?YdfnVZha5LJmXHDlYH1+GJLqNib3+Hqfhp4SvgE/CPCQ0TQ3PjkECRJkvg?=
 =?iso-8859-1?Q?dXiRgEngv8ENKD05KfpRarsdPvQErN9BPJxwewqEcMNW0p8kW2WV4o4Q1h?=
 =?iso-8859-1?Q?+xTbrbWeujRrRMStM+AIXCvPivWHsS1nMVUr3fj20m6J8gKL596W0UQnFI?=
 =?iso-8859-1?Q?g8dZZWQTNVvKHF5z33JmENRkW99IzOAkU1r56CLWA/3dsDf/Xo2Zc9rs2u?=
 =?iso-8859-1?Q?pcvoNRYM3gQzpI0sdI26Xl52+3l9HAmfukQQh5HArKzZ8kmdV+CP+XYC+V?=
 =?iso-8859-1?Q?jZHQ7Zem9OFkliS1GR6dlTgsh4gAYRC17gjcyjVr/VbRhz8xeS0f62tNCI?=
 =?iso-8859-1?Q?hq/h52dVZWLbR4VsQSUt5rY0n99tc2cSmpBj0SzR9jQpYMdAlpgHygrkSk?=
 =?iso-8859-1?Q?v+aL3/12xtMepohzXh+6kriRzg7/LXJFJvjB37plqtoZv19KjYUvRctIHx?=
 =?iso-8859-1?Q?1+5egRcD2czEqj185CmIHP1jhJiKWitIhHw9Xq/ewQOqZYynb3/XyUyuDv?=
 =?iso-8859-1?Q?1wQhzn+lwoA7MfKg0qY+O5lQllmU+jrrG+NZkH1BDYxsZjjHS1swjDWXXn?=
 =?iso-8859-1?Q?PwWw+5UjL5fEOysTerTQP5rD1RIlEZe6dNDVbvpzThxl2uQSG1a+y8XHH8?=
 =?iso-8859-1?Q?Ek0GCUtCc7JhD8M2DB3hO2uopToRy16KsArpTSLyfNPrGi5IcgtKA2MoCD?=
 =?iso-8859-1?Q?gH45PhcmhRdSjM0x5MQczf7MPCRtrD2XrP1n0V4Ka20FSosFX4wH7OgDKr?=
 =?iso-8859-1?Q?APYXcruiKTBUM9dds4CmJznmDNY4VR47P858qatD34jD0MrIYQRqJFvTUc?=
 =?iso-8859-1?Q?7ZfYR64qHcV+vuOvippfELuMoLihcxQ29pNVWFhqa/Saxc+kho6pSw67lT?=
 =?iso-8859-1?Q?T9RX7AdlmHGaBPFdsYYSnBmNfgFG6hGiYvtVi3JDrGuZ3p36QS5hYpJzks?=
 =?iso-8859-1?Q?vz0pWlBJ/0E5vR47VNCIdA8QqssS6to85DjwzU1X04ybIlM+lfwKF0OR0b?=
 =?iso-8859-1?Q?E2V+YvkrNRE2qPA36tnvslMkhI2PHgjWm0XEspONN1Ws811dFCHAEFFinD?=
 =?iso-8859-1?Q?KKO9En8GxCCJeihZwHxK7fhoaKJjd4LNpg5tW5Q6uM+15iyUjkoNe6+BU1?=
 =?iso-8859-1?Q?7uguYFauT2qxRmPads4QHd57JVBDJo0Txpd2U5fFCVmELYWRJJXgQPrfcx?=
 =?iso-8859-1?Q?6Ft+pKI=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB7955.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6706
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0b9158aa-e7d2-4ff0-4813-08dd86fe6431
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|14060799003|35042699022|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?qAqN3q4y8AhKr8umeCJ2bHi9jrACuoF5NTzrvfUSLFHMEjTW6aG+cYg5KO?=
 =?iso-8859-1?Q?D1MBrOk0QnkeFSwJ5XIizbb3a33w758GPkE11E6PejlWKdEp373f/trn3O?=
 =?iso-8859-1?Q?ky5Zzr6JopCCRJrcpPqbex5jvk6P5hiLmI5chPczIwdmmhjngeL+Ywxw9t?=
 =?iso-8859-1?Q?EKBQH/ZRhCL8AzrTBvJ5suRvGjBISajrVQI8Zikg0pXtF7lC2vUCOYFKsk?=
 =?iso-8859-1?Q?f/Y9TNs3ucIU59Fv8cixoxs/Bl+CoW0KyjyfazYo5VnpLLEDV33PqQJNAG?=
 =?iso-8859-1?Q?oZ6vyb/yiNPECa5RhX8fEDjA3LnhqaSQt9ZsmPi2MFlKOLWFbpRKxMus2g?=
 =?iso-8859-1?Q?xjcg2iihSieMzTjL7phj/uQaao7/c8G7yObxigKXoQBMqh//qNFaVnxLGu?=
 =?iso-8859-1?Q?iEUSVrwFPhUJJHGxfQ2dufZGPywSdBqDe9qA+Bi6wkYaVoYNUTuk1QA5fR?=
 =?iso-8859-1?Q?9zVTJoLy9TPEoqtR4LjFGmhozK6ZsjiseGkC5jStskmmWSEgPuH1ybVV02?=
 =?iso-8859-1?Q?F4cOtNdmmj1BfrfTAjNdq+ifAay3R3lDt2x5CMdFFW2AivULn5Qa5gVg+Z?=
 =?iso-8859-1?Q?qbqC8L+Kvd9n7ftxOUTjjdPpeRjpMQKfN+RCXRPheAWPhMSphpa4962xNo?=
 =?iso-8859-1?Q?39CIYGCX77zR3TVNkZVbYvYzGVBTYnYxLBcuC1j68uiNoYECLfdYLZQiS8?=
 =?iso-8859-1?Q?z4G6O7OaVN7qGTMpU6p7gOTZoOdeF+t5XVys6i/NfvPgGDujf9NwJ3Cc56?=
 =?iso-8859-1?Q?A6+xqzD04oSfAq5HmDxqz4+gRYPNl6UChPnKPhOJmpM2hffMI2jIg8Lz+k?=
 =?iso-8859-1?Q?Pd3O7rkydFD6SPgYdseYIAjnfa6k9b+0ilk2DS+qY1ay5aCiyF9zoVibbq?=
 =?iso-8859-1?Q?EUawAwjkwlmefC11aUDk2fpDSi3C6vIf6iVkJXx9FQcU6042hGgh3y0tsW?=
 =?iso-8859-1?Q?J3e99u/T6Q6jrAqhHKi18TY+BZkoVj0HiSFAs/3Tg9xA2BU1uPHQp5Tup8?=
 =?iso-8859-1?Q?+A/GQyp4+CXu+FQMLgM6GLL3alXd5DMncJpla8mU0hOZnIMboGhVZmp6I+?=
 =?iso-8859-1?Q?bQht4uVJy7k3lla5sDh6S0o9CDu38SrbZMN/4neURfpZ8JkpLnKUSRD+Ws?=
 =?iso-8859-1?Q?hhRqcj2P/+hK8lif9Y6OS/qguR1xA9aHAVTysvGAQTDLs2cjBqxJcjNJtJ?=
 =?iso-8859-1?Q?WUaORHljQr/3ZOuWo5rYN4VmF080mBTilXpKvqBEZNLp2DgDfeiYFEBRkZ?=
 =?iso-8859-1?Q?pIRIhwGEeMIGzqjKnD/rbxhPz34k3EWPJOKdTGxPea8YlbVLNNEj3I2b7N?=
 =?iso-8859-1?Q?bUNec2vOqUu944TuuUHG/CgEBTlE1kGPhmGBMOZVWqDtFATjn+SZm1wQPR?=
 =?iso-8859-1?Q?cArG9TmH6OUoZgE9WSgbpyOa/NTr+DtW9DGZdVC3JzSPnXBCPHTWjRF8jw?=
 =?iso-8859-1?Q?nObpDehbOCJ0RJfiIhHoAUzL2KXCO79N9Y930uZKOTHfaLsZYg7fctf3S1?=
 =?iso-8859-1?Q?fMsUnEFS/7HkPo4ktnU8PNoSjcvENJMoPoNvZtL5lee+iPCdwyPtgzJAK0?=
 =?iso-8859-1?Q?yEz2F+rzSernP9mqqPVrO+eU7lM3?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(14060799003)(35042699022)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 09:16:03.5675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d4759a-c747-4057-9392-08dd86fe7734
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9563

Good morning Dan,
If the data pointer in scmi_clock_init() is corrupted, it means that the sc=
mi_clock_config was not done in the right way, or it is not implemented. It=
 is okay to go on without scmi_clock from pinctrl perspective, but let me k=
now more about the test you are working on it I may help.

Thanks, Dan, so much
Best regards.

________________________________________
From: Dan Carpenter <dan.carpenter@linaro.org>
Sent: Monday, April 28, 2025 6:32 PM
To: Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>
Cc: arm-scmi@vger.kernel.org <arm-scmi@vger.kernel.org>; Girish Pathak <Gir=
ish.Pathak@arm.com>
Subject: Re: [PATCH SCP] module/scmi_pin_control: allow variable length res=
ponses

On Mon, Apr 28, 2025 at 10:30:33AM +0000, Khaled Ali Ahmed wrote:
> Good morning Dan,
> I am sending this email to add the whole attached group in the CC, also
> to list more details about the implementation of the Dynamic length
>  setting configuration.
> This takes into account the current code base, also the
> "scmi_message_validation" scmi API has been updated, and a new macro has
> been introduced in the mod_scmi.h "MOD_SCMI_PROTOCOL_DAYNAMIC_PAYLOAD_SIZ=
E".
>
> Thanks, Dan, in advance

Great thanks.  That works.

I'm getting some sort of crash in scmi_clock_init().  The "data" pointer is
not a valid pointer.  Apparently, it's 0x133a80.  I don't know if that's a
known issue or if it's from a mistake I made forward porting my patches.
I've disabled that for now because I only need pinctrl.

regards,
dan carpenter
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
