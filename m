Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2060.outbound.protection.outlook.com [40.107.20.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF601F0E27
	for <arm-scmi@vger.kernel.org>; Thu, 20 Feb 2025 09:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.60
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740045589; cv=fail; b=ewyDM6n+N5oTmr2z9DDpQnCPhxlclKZdCMZ4B8187805EcVeZCX7359Tz7Ipy2hi2nFLhGecUNyXsjltW8RwwjKSBquPKLQceva4er8tEkUaA9WTnLgrroPYYDUotGjMyCUIIlgQyvYQ6jknrBJX0qxnGMFGAkwG93A2ZiW9ClQ=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740045589; c=relaxed/simple;
	bh=u3D4Mlp4+C6mkGfYvHchoFfmVqwKUzfdKE2bYdYQJrU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CUjwMakXe7vG2P37WBF6IDct/AMB88jospyNL8C2dvvtU5qUhBC9S6A43gV2tR72nRFN0DakORPCvUcI4ht1wKQnKl8rGGE1sDAftJcRxK3lpxXew/KPN9HI9Ejo0QBM4UKpY+f5FRg91a4fy5ecuJrQCzSF4DywpfIvktH6vYY=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ZJtnSFMm; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ZJtnSFMm; arc=fail smtp.client-ip=40.107.20.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ZJtnSFMm";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ZJtnSFMm"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JIuAAWrWewKIg+10UnrdZycZicXU/YUoDIezMzsIqwS50V4msQMMLBYeMsbC9G+HlfK/07ELAu1hONTN8QTq9ltjfgxBHtIBR9F0mv+roNrRl3Vg4HN3Gf4am3lotU4qZUPtUNG3iG15rjsCX6Sv9/Yq5KKpm84oj4+FaRvR56rKSlijWrwzZZxOmmXVa3pn9orMOwkJkWw7bk+gO8JbVcK31vEBLuU9kihUudUaK7o8reauhAvKbAD+s2RdIqM2AXwePczBAtnoJv9/lko/AVkOWkeo0ZfXFh0KH+oKkZjMstYz2A1bjyGyYQdABWVzv6JCLovfRw1fnaGWdP9hSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JSIyQ+dSgs0tAg6+pECwxztTG7r4XaBS5BKixmsQ8Pc=;
 b=VfZl+JCGiByk8Fw4AVUmGI2HChwvW7Z2w8zsTOstXPPipDa5dtywl0iz8ZW2D2o5IMUnEi54drfbkZNOHLC7dW7gAwZt4dyjV2Cgep13J/t0MR+ZU7Ra8qNoAK5E8tVNDm/v8DFuZL6vkw140JlHe4t98uRT2HKTJwXStE4Eiopsn0vyH1oSsFAa/mwnm1+syujFlaLeYboqKJjI+4oE5GHapTKcr+5s0pKfmfxcV/vuenpgR+K7ta5bNJ+hx2Z7RmbcDifhQHEkX/oMUBfeN0ahMoVWJseL9jn1iDBcnNocxU9MQ7DG6m83czqECD9f4wpWHlS645f+eJfRKkMFKA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JSIyQ+dSgs0tAg6+pECwxztTG7r4XaBS5BKixmsQ8Pc=;
 b=ZJtnSFMm3cWCDR5h4XgDcS8wzY8ntY71kPVsiuQIAdcweS0yWEbfUAgajrRHNAZdyyseVsxiI7q+Z6Fz+Dg+gGX+862NIq70C4uRWAi7ZkgRnXNoVr229aJCxHc1nzYT4nAvrE0gRe/nhWgiwBsS6yjNfVbOu/iVG6DE05ZUELY=
Received: from CWLP123CA0179.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19b::18)
 by DU4PR08MB11053.eurprd08.prod.outlook.com (2603:10a6:10:570::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Thu, 20 Feb
 2025 09:59:43 +0000
Received: from AMS0EPF00000199.eurprd05.prod.outlook.com
 (2603:10a6:400:19b:cafe::21) by CWLP123CA0179.outlook.office365.com
 (2603:10a6:400:19b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.15 via Frontend Transport; Thu,
 20 Feb 2025 09:59:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000199.mail.protection.outlook.com (10.167.16.245) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.11
 via Frontend Transport; Thu, 20 Feb 2025 09:59:41 +0000
Received: ("Tessian outbound e6618df50830:v567"); Thu, 20 Feb 2025 09:59:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: be36abe7851b4760
X-TessianGatewayMetadata: Juuhw8MBgoYcK85lFil0dJ5kNu3KbD/1X9nSkHoobw2oHjLLarJID8SYX9dYWniOnkkHqdgtIQgfXpoVqOK+zg2/xGjSTEkFYNNLfk+G7Z9ZsYsUpyZ6+2j0qvvxHdu2s1r0TTXISQqvhufwuM6ysoa0X82jjMK8V0PqP50N9vw=
X-CR-MTA-TID: 64aa7808
Received: from L1df76f99333c.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5683E743-894E-42B7-BDEE-9F502BD2DD33.1;
	Thu, 20 Feb 2025 09:59:34 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L1df76f99333c.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 20 Feb 2025 09:59:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eMI0c/l6kSRmQ4EBSCJO1w255psa4Hwvz8zVpH5of20yf0cpZ0F2WRjrb604u3q5wmnU4q8/rP2MuzrU1ZcmDaT6YrCXEuV1IdMSu80BjNTdjScPXAozgGOyAN7nFKe8e6VXwY0t/gh4NEGaxxcWaXLiCJ/nzO15fWqD0SKWpAeveD2pvZHn52C1LoO8TB4A+MZGB6xKEIdXXezxnv/i1Stt24tgZO2Dk+n02tU6YjXMa9Dt+L5gdWj0VYQAAhj5yET3fnLKY0PgLnFSosAXbp5XD0KAYHzvzec9X7GB+y5pOQHwENcpvPVxbfCJc84YODNDLFBQcBr0/zYn7QI5Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JSIyQ+dSgs0tAg6+pECwxztTG7r4XaBS5BKixmsQ8Pc=;
 b=Y8v7s95puDl01lD2IShfzENASW4iybJAi13TkIl6McgC05ERg46wtiZC3WtI3C8cYulUpmYjv1nQ/AFBMQh9TIRY5fR8gGzPqiLRZI9RfltA8c9CA/GDCju6mG3xtbpK+FWCTgG3wUGm5rC79VJp5u39+7HDicmTjJdORl0A/h9HSH6iQBPeN9oIN/o+8uVof30jU0tbuHpxp3GZcJ+VI9BPGarpC3nht1Yc3LziXEglI4ktWA2JY/DLTkKqENgy0abG2ewyHvR69QJNjzwy3/Gww0txkEkej/qfGfuwU7Y1qzUieNBjeaqYnBZjbmjQXvu/0tTswrAIM++dhqWutw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JSIyQ+dSgs0tAg6+pECwxztTG7r4XaBS5BKixmsQ8Pc=;
 b=ZJtnSFMm3cWCDR5h4XgDcS8wzY8ntY71kPVsiuQIAdcweS0yWEbfUAgajrRHNAZdyyseVsxiI7q+Z6Fz+Dg+gGX+862NIq70C4uRWAi7ZkgRnXNoVr229aJCxHc1nzYT4nAvrE0gRe/nhWgiwBsS6yjNfVbOu/iVG6DE05ZUELY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAVPR08MB9401.eurprd08.prod.outlook.com (2603:10a6:102:302::19)
 by DB5PR08MB10312.eurprd08.prod.outlook.com (2603:10a6:10:3c1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Thu, 20 Feb
 2025 09:59:32 +0000
Received: from PAVPR08MB9401.eurprd08.prod.outlook.com
 ([fe80::db4b:1ab2:a259:4d4d]) by PAVPR08MB9401.eurprd08.prod.outlook.com
 ([fe80::db4b:1ab2:a259:4d4d%3]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 09:59:32 +0000
Message-ID: <81580b24-e11c-40c4-a709-5ad0feab8841@arm.com>
Date: Thu, 20 Feb 2025 09:59:30 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: POWER_DOMAIN_ATTRIBUTES in SCMI
To: Peng Fan <peng.fan@oss.nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Peng Fan <peng.fan@nxp.com>,
 "cristian.marussi@arm.com" <cristian.marussi@arm.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
 Chuck Cannon <chuck.cannon@nxp.com>
References: <PAXPR04MB8459E8D1A82DE43C08B6C26788FE2@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z7Rjyy7_Jg66vqCf@bogus> <20250218130823.GA17099@nxa18884-linux>
 <CAKfTPtBd14wM2st62m3tnkQOZgBTUmxpjZXghMVff-Yg7wCVDg@mail.gmail.com>
 <CAPDyKFq9QHw==2WqcThC5mjMy8ALqmZ_hKxt2QsZJ1q-qixLfA@mail.gmail.com>
 <20250218163146.GB15753@nxa18884-linux>
 <Z7aZPt5a0P53VL1N@NXL53680.wbi.nxp.com>
Content-Language: en-GB
From: Souvik Chakravarty <souvik.chakravarty@arm.com>
In-Reply-To: <Z7aZPt5a0P53VL1N@NXL53680.wbi.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO0P123CA0006.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::8) To PAVPR08MB9401.eurprd08.prod.outlook.com
 (2603:10a6:102:302::19)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAVPR08MB9401:EE_|DB5PR08MB10312:EE_|AMS0EPF00000199:EE_|DU4PR08MB11053:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eda59da-3605-4a30-45a0-08dd51954ba9
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?S1liMTE4ZFM5N0EveDJGY01qMUhWSUZKK2pUempubmRNenYveFFobHFwalNs?=
 =?utf-8?B?WWxTK2t6Z0I0Ly9GUjY1WnZGeUhRV2R1ZUxibUYxRjNBTnJSVlZRYk1iRWto?=
 =?utf-8?B?T0FGMGp6SHFhMStWcHdzRTJwcWJLeXliS3RrT2ZqUmord3NwK0dUREsrMU5K?=
 =?utf-8?B?S1VsaW9LSEtWcGMrbzU1ZlVIZ2ZJamU5c1R1MlVKekw0OTFKam9wcFJZeC9W?=
 =?utf-8?B?VEdzUUNqb2VzemVRY203bGJSOTVZZXdhVWU4elVFT3l0Zkg2VGpNeHdLd0Qx?=
 =?utf-8?B?NTdyRXBESzlvdDJUMDZQUWtrNi9OY3lDK3ZnK0JtckpJVFRKT1dMQXVQM050?=
 =?utf-8?B?dTRCdTExdWNSM0dNbmwwcmtxa0R5N2dob3djeXhmYjArOFVlMGpGM2IzdVhS?=
 =?utf-8?B?SEM3QkxXc2NRc3M2K21MM2hvTDN1TzBUSXhPWlNkYXlxc1NYelVoS3A5Nm9x?=
 =?utf-8?B?MUNlaFNuTGozb1FLTnFiczBNZ1c1Y1VtQlVXbEJVQTNpOFcwN0JzUEJqckJW?=
 =?utf-8?B?VUVlS3dVdTBWRkw4UVZrZnFFTUQrcDk3TUg5NFQwcXAxOGpTWjRtS3RWZWJn?=
 =?utf-8?B?WkRiZ1doMWJjMUhvbGx2Z1VKWkFrZTBXcThHZUUzUnFyczY2cW8vWWVnYjM4?=
 =?utf-8?B?SURNYWFTNndWUEZURHZPQUZZbXpWd2pkYWtLREpER2xqOFdCTms5N0Z2ME1N?=
 =?utf-8?B?aklBdS9rR3BWNGNQNHBibzRMQkZXaWJlaWNkcmdIaEE0b2FHdGlRditUZGRw?=
 =?utf-8?B?bHVGZE9UdStCMkZ1M29zZEd0UGpZcmhFTGI3SVExZGp4QW1UOVh4VnJteFRp?=
 =?utf-8?B?bTlIblBBVTAwNTVscTZPYXk0UU1nZndHUW1ncDB4MEhTcW5aZGJZWmtIYTlR?=
 =?utf-8?B?cFpvNG04Zzk1OUFkdXZJSldPQTJKMWxZUU5GRVBNdUllcWZ5Rit0ejNqODdP?=
 =?utf-8?B?OWloZzhyT3R0ZTdJYXUyZmlXL01zMjNBTk55TXZyQ3J5citDTTZ5ZkVGUmJ2?=
 =?utf-8?B?aTVoQnZ1MEJGZndnYkx4ZmUzRStZVzhyZHpwcGI5S1QzZjhKODVUZzc2YVhK?=
 =?utf-8?B?RU9ia2lFS0VSSkRFaHJhWUxyNitCdVBoNG1CWWpRT29WeTgyZzRBYzZsY2tK?=
 =?utf-8?B?LzFEU3piRXRVWklYTHFrL1F1bjVsb1BBNDJWYmt3THhlUnNIWW9JcndEVkYv?=
 =?utf-8?B?QVoxVmVwWTlXUTRkQlBxOE54dzdJWmJmdVVRWitxanRBZ1RiemVLWk1CejJZ?=
 =?utf-8?B?QzhybWdweTE0dWVPZ0NhZUtYVnl6ak9TTGhrNXpHU2syekEzVmNVR2RESk8x?=
 =?utf-8?B?VE1YdC9TOE5ZSFF5ZUF4SW9kczRxaVBJek4yRzk5bEs2dzRqU2kxZVRlZGJV?=
 =?utf-8?B?aWIvSEdMc3Rhdy9LVHRtaHV4b0ZyZ05uVnhJNCswZlRjdGM3ODEzZk9laEhC?=
 =?utf-8?B?ajlSZUNxY1NEUUloWExnc2k0S3d6SUNpVXZqUDNyY0loT2I2dXJDQUtEa1Z3?=
 =?utf-8?B?azVjNmtrSFpScjdHNnhVRXZXckMrM2xFRWh5OEx1TUhkUVhzNnlBQVRtTnV4?=
 =?utf-8?B?Q05JMUdhV2hpRDVZckRyNC9rK1dlbGFEajh0REpkYk9kUmFGVmdHd0swa2Ro?=
 =?utf-8?B?Unlhd29jTFZzYmpoc2hUenU2Wnp6UENCOUlqbGpGRDVjY0tOZmNBKzVRTnhV?=
 =?utf-8?B?MzlIeFVOK2lXczBNQStYS09iOWRKUmRuNnNhMEcyN2RqdEFlT0FBa1A0Tm9s?=
 =?utf-8?B?UlhLaXpXdTQzRCtQcEE1bHBtYVZjcE9keEk0dzJhcGxpbjBPVElFcE1ISzBr?=
 =?utf-8?B?UXRLV2ZXV3RhVVFwMUtnb3pDZG53MUFGWUhHenRLNU9qN012VVcxUkxybHRp?=
 =?utf-8?Q?i3LmiMGotQDFO?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR08MB9401.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10312
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:102:302::19];domain=PAVPR08MB9401.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8e81ef4a-2855-410c-01a9-08dd519545d7
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|14060799003|36860700013|82310400026|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z0ZWbHc4TWtmTkRzekEvSkR0T0xqNEVSR1NaTFd0SFFoQktNdWhyZ2tsS2do?=
 =?utf-8?B?VFA1OCtHY0VyRDF4SmM5R0hNT2NndVAyRTFURGcyZ0I2SURaWlc1bW5MWXkx?=
 =?utf-8?B?Q2lYNEVEeW5xNEJ2eXRIaCtzZUMwUzFkOEk2MDFSblp6YlFCd0I5L1VEZzA1?=
 =?utf-8?B?dzFJcjhqN2FhUE5tYmROaGE0VENiTnFkYkI2YngvWHhFdnZ2UE5OanVtQ3My?=
 =?utf-8?B?MjNHb1pPRzJOeDRVMFRFcUFyaTV2VHB6RGpMY1Y0VWRVVXp3N05ydFNXeXlv?=
 =?utf-8?B?Tlo1SS9kTmVLNjhwellabWhueXJNT1EyZ1RUeWo0bjUzMjZTQ2MzQU9RK3My?=
 =?utf-8?B?V3lMOWZnT2pMRG52WWxpeCt5ZFZ2U0lETXZBa1VTZDlqMEprQzBENGlKT0d0?=
 =?utf-8?B?aVZWNlRlOVY1MlhoMFhsK0FXV3FxdmJnakRxSFlWYk1VU1NOQ0Y0T1ROSUR5?=
 =?utf-8?B?TDJQSnJXTDRZQWFnT0hTMzJ4Q2Qva2RualBudE12dFNEZklidVN3M1dwZVdh?=
 =?utf-8?B?bkpJQk5Bak9QYmNqSjhmcHNJZCtmQ3l0cVRxRi8rNitHUVY5dGh3UkhPT1hC?=
 =?utf-8?B?V3NmdHBIVUJiMzgrQmpLUE1vcHRnSFJ4cm9TSVUwZnl1bkgwZXRXTDY1anRX?=
 =?utf-8?B?SFJHL21UV0U1di9vdnRwM2dsN29DTDdpMEloMG5IVTZsdlZXa1ZlcTg0U052?=
 =?utf-8?B?NHJhUFdEbndpYjBUeUhTUWRYN0cyWXhadUQ3WEFnK1VWVE14TlZidW1WZGRj?=
 =?utf-8?B?am50U0w3TVJvTHU1SVpqcEY2S0tnRC8xNExRMnUxN1V1MWJxclphT2pjQmJO?=
 =?utf-8?B?aHlyM0lrcXZYb3lKdG9QcWJrZ053ZWhFVEpIcjRuNHRxaFJPbmI4V3A2aUhR?=
 =?utf-8?B?KzJOQ2ZoMmpvZ3EzamY2WktPS3daaUQ3RzBkVkY5TFhXNXZPLzBnTDZjVjRB?=
 =?utf-8?B?Z1N0dVR4aTczTFpCSWdnT2RXOVhzeG1BMm9nSjFEcEZYOWxKSWZzZmY3MWFG?=
 =?utf-8?B?NEJsUFJiZjBEUzhzYTZJcld1QTFjS0duVE5RVFFwSWdDS3Y2L0FYTXhSdC9y?=
 =?utf-8?B?ajBSbkkyNlYyaHBBYjFWZm9EbVVCNHpLUTNGUTQrNXl3dThzeEZkdnBFU2hl?=
 =?utf-8?B?UEYxQ0pLN0EyTEdvUjh0a3NSbnF6YkJTc1l6T2k5QllTN1paeFpuZ0xTb25X?=
 =?utf-8?B?cWlLdVcxN3ZYZjhmOTVRTWppOUJRRVdzdEJNR3BKcWY1cTQ4bGg5RnQzRnRk?=
 =?utf-8?B?K3ZhZDFkaU51bmVtTGx6YlJuT1Z0elBxRllnZlZNZVNBN0NMNm1xdlRCZzc5?=
 =?utf-8?B?RDl0Q1JTTUxvc0tlbWhFMnVxa0oySzJydE5XWmFZdFNHdEF3eHJmUVFFTnA2?=
 =?utf-8?B?SGhHUm5EckNIenYzVkNkK3V5ZGtGankxamJHZmpmZEhHNkRuRzRQcDRDVldo?=
 =?utf-8?B?Q2xoamxYZVpDVzI1MFpTNXZZVTZDTjdRQ2hGVmV2VVBYSXVwcEcrZ1drUHVJ?=
 =?utf-8?B?TlVMVGZrODZvdHVRLzBPcHhBZWFEQjBzc2JhR0N4QXpNRXdDbW4wMzdpK1Fj?=
 =?utf-8?B?RmcwL1dFWXNkMlR4L1N2bEs0Y3NPZlBVMVBpbVFjZEpOUnBnWG9CT1p2RkRt?=
 =?utf-8?B?R2kzUTJqRW5sNnlKSnJEWlZVM280WnpEa0tJb2ZaWDdJMzBiRlZaNFNoQnBK?=
 =?utf-8?B?b1lLV0lNZWRlZmx0dE1tTkdPbkptM1lQWDlpeHZEMWxCLy8yb09VK2xrWmhO?=
 =?utf-8?B?a3hmZGFMbUVaYUFWNjUzR3ZDbzlHVUlKbFFTdkFqSFk3eVpmaDViNVlKYUZR?=
 =?utf-8?B?VFdqcnRBMHliMFJuYkh3QUFJKzRlNElLeU91cThETTgrSmV0ZC9EK3lURGJZ?=
 =?utf-8?B?L2N0aVk3TTNjRlJsY0ZjdTc4Ui9BaW1YQjdDTG5USEMzSHUrSUxWSGtHc1R4?=
 =?utf-8?B?UGFkckNrTU4rbG90OVEzWFpxaGRqT1B5RXVrdlRyOUZZdEFUNXIzS2xnbG50?=
 =?utf-8?Q?sNfxZxIvFhgMcklQwWjwS04Tu3dZVM=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(14060799003)(36860700013)(82310400026)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 09:59:41.7058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eda59da-3605-4a30-45a0-08dd51954ba9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11053

Some quick thoughts below to keep this architecturally consistent.

On 20/02/2025 02:53, Peng Fan wrote:
> Hi Ulf, Vincent
>
> On Wed, Feb 19, 2025 at 12:31:46AM +0800, Peng Fan wrote:
>> On Tue, Feb 18, 2025 at 04:02:58PM +0100, Ulf Hansson wrote:
>>> On Tue, 18 Feb 2025 at 14:57, Vincent Guittot
>>> <vincent.guittot@linaro.org> wrote:
>>>>
>>>> On Tue, 18 Feb 2025 at 13:03, Peng Fan <peng.fan@oss.nxp.com> wrote:
>>>>>
>>>>> On Tue, Feb 18, 2025 at 10:41:15AM +0000, Sudeep Holla wrote:
>>>>>> On Fri, Feb 14, 2025 at 09:20:27AM +0000, Peng Fan wrote:
>>>>>>> All,
>>>>>>>
>>>>>>> Previously I posted a patch to linux to set all power domains
>>>>>>> with "GENPD_FLAG_ACTIVE_WAKEUP" set in
>>>>>>> drivers/pmdomain/arm/scmi_pm_domain.c
>>>>>>
>>>>>> Yes, I remember ACK-ing that and now I am thinking why =F0=9F=98=84.
>>>>>> The description of the flag GENPD_FLAG_ACTIVE_WAKEUP says:
>>>>>> "Instructs genpd to keep the PM domain powered on, in case any of it=
s
>>>>>> attached devices is used in the wakeup path to serve system wakeups.=
"
>>>>>>
>>>>>> Does that mean all the SCMI power domains remain powered on with thi=
s
>>>>>> flag ? If so, that sounds wrong to me. I hope it is not the case and=
 it
>>>>>> is effective only if the device attached is wakeup source.
>>>>>
>>>>> Only when the device is setup wakeup source, the genpd framework
>>>>> will take this flag as keeping power domain on.
>>>>>
>>>>> Without this flag, even if the device setup as wakeup source, the
>>>>> device's power domain will still be powered off.
>>>>>
>>>>>>
>>>>>>> But in the end we find that some power domains
>>>>>>> could be in off state while it still could wakeup
>>>>>>> the system. And we have a downstream patch
>>>>>>> +               if (!strcmp(scmi_pd->name, "hsio_top"))
>>>>>>> +                       scmi_pd->genpd.flags =3D 0;
>>>>>>>
>>>>>>
>>>>>> There you go, so you simply rushed some solution upstream to carry l=
ess
>>>>>> patches downstream but this time you got bitten again. Sorry, but I =
am
>>>>>> seeing a pattern from you here and I don't really like that.
>>>>>
>>>>> I not wanna to argue here.
>>>>> I DO care reputation. If I do something wrong, I will improve.
>>>>>
>>>>>>
>>>>>>> So I am wondering to extend the attributes of SCMI spec,
>>>>>>> Saying In SCMI spec(DEN0056E)
>>>>>>> 4.3.2.5 POWER_DOMAIN_ATTRIBUTES
>>>>>>> Page 44 of 210:
>>>>>>>
>>>>>>> Bit[26]: If set to 1, the power domain could
>>>>>>> wakeup the system with power state
>>>>>>> set as off.
>>>>>>>
>>>>>>
>>>>>> This is not what the above flag is all about. It just instructs genp=
d
>>>>>> to keep the power domain ON as the device attached to it could be a =
wakeup
>>>>>> source. They are not one and the same. If the device is marked wakeu=
p in
>>>>>> the DT and it is both wakeup capable and is enabled, it shouldn't re=
quest
>>>>>> the power domain to be powered off when suspending. Why is that not
>>>>>> sufficient here ? What am I missing ? I am interested in knowing it =
as
>>>>>> it is important to fix the issue you are trying to address here.
>>>>>
>>>>> The flag must be set if the power domain needs to keep power on to ha=
ve
>>>>> the wakeup capability.
>>>>>
>>>>> But in some case, a power domain no need to keep power on and it stil=
l
>>>>> have wakeup capability from hardware perspective.
>>>>>
>>>>> For example usb phy in i.MX95, its power domain is off, but it could =
still
>>>>> wakeup the SoC. But with the GENPD_FLAG_ACTIVE_WAKEUP set, the power =
domain
>>>>> will not be powered off, so more power consumption in suspended state=
.
>>>>
>>>> This probably means that the wakeup mechanism is not in the same power
>>>> domain but in another one that is kept on while the device is
>>>> suspended and the main power domain is off. Do you have more details
>>>> about this wakeup source that works with powerdomain being off ?
>>>> I vaguely remember some old discussions about inband/outband wakeup
>>>> source settings for devices which enable drivers to specify if the
>>>> wakeup source is in or out of the power domain and if we should keep
>>>> it on or not. But I can't remember the details; Ulf should have more
>>>> details
>>>
>>> Vincent, you have a great memory! :-)
>>>
>>> Indeed I tried to post a series (I can dig it up, if you want?) that
>>> allowed the driver to instruct upper layers, such as buses and PM
>>> domains whether the wakeup is managed in-band or out-band.
>>>
>>> An example could be an SDIO irq, being re-routed from a regular DATA
>>> line that is managed by the SDIO/MMC controller to a GPIO pin during
>>> system suspend. Another similar use-case with a potential similar
>>> wake-up configuration, is waking up from a UART console.
>>>
>>> My point is, the SDIO/MMC controller could be configured as a wakeup
>>> source, while it's actually the GPIO pin that is managing the wakeup.
>>> In this case, typically the GPIO irq can be managed from an always-on
>>> logic/PMIC, which means there is no reason to keep the PM domain
>>> powered-on for the SDIO/MMC controller during system suspend.
>>>
>>> At the moment we don't have any way to express this kind of
>>> configuration, I think.
>>
>> Thanks for sharing detailed example.
>>
>> typec chips using gpio to wakeup system should also be the same.
>>
>>>
>>>>
>>>>>
>>>>> So I am requesting extending spec to give agents the information whet=
her
>>>>> the power domain could wakeup HW system in powered off state.
>>>>
>>>> I tend to agree with Sudeep that it doesn't make sense to say that a
>>>> power domain can be off but the powered devices can still wakeup the
>>>> system. It usually means that the wakeup is not powered by the main
>>>> power domain
>>>
>>> I tend to agree. In general, I think we should always use
>>> GENPD_FLAG_ACTIVE_WAKEUP, but we are lacking a way to inform genpd
>>> (and other upper layers) that the wakeup-irq is managed out-band,
>>> which means genpd can still be powered-off.
>>
>> ok. Would you plan to work on the feature? If you not have time,
>> I could do this, but need your guidance on the design.
>
> Not sure whether you have time to work on this or not.
>
> More info for i.MX case:
> The i.MX95 usb wakeup logic is in an always on power domain. So when
> usb controller is powered down, usb could still do remote wakeup.
> There is no dedicated out band wakeup-irq in my case.

There are 2 ways to wakeup a device:
a) The device is powered by one or more PDs, one or more of which needs
to be kept ON to trigger the wakeup.
b) The device is powered by one or more PDs, but none of them are
required to trigger a wakeup. The device wake is derived from an out of
band logic which is kept powered ON (either transparently to OS, or via
another PD which does NOT belong to the device).

It would be good to ensure that whatever solution we craft here
acknowledges and works for both these cases, as they are subtly different.

Regards,
Souvik


>
> I draft a prototype. Would you please give a look whether this is feasibl=
e?
> 1. Add a new API device_set/get_out_band_wakeup with a new bool out_band_=
wakeup
>     defined in dev_pm_info
> 2. Drivers could use device_set_out_band_wakeup to set the bool
> 3. pm core suspend/resume will check the bool to decide continue do
>     power operation or bypass.
>
> Thanks,
> Peng.
>
> Draft code below:
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 9b2f28b34bb5..fa0d93c9078e 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -1450,7 +1450,8 @@ static int genpd_finish_suspend(struct device *dev,
>          if (ret)
>                  return ret;
>
> -       if (device_wakeup_path(dev) && genpd_is_active_wakeup(genpd))
> +       if (device_wakeup_path(dev) && genpd_is_active_wakeup(genpd) &&
> +           !device_get_out_band_wakeup(dev))
>                  return 0;
>
>           if (genpd->dev_ops.stop && genpd->dev_ops.start &&
> @@ -1505,7 +1506,8 @@ static int genpd_finish_resume(struct device *dev,
>        if (IS_ERR(genpd))
>               return -EINVAL;
>
> -       if (device_wakeup_path(dev) && genpd_is_active_wakeup(genpd))
> +       if (device_wakeup_path(dev) && genpd_is_active_wakeup(genpd) &&
> +           !device_get_out_band_wakeup(dev))
>                 return resume_noirq(dev);
>
> In include/linux/pm_wakeup.h
>
> +static inline void device_set_out_band_wakeup(struct device *dev, bool c=
apable)
> +{
> +       dev->power.out_band_wakeup =3D capable;
> +}
> +
> +static inline bool device_get_out_band_wakeup(struct device *dev)
> +{
> +       return dev->power.out_band_wakeup;
> +}
>
>>
>> Thanks,
>> Peng.
>>
>>>
>>>>
>>>>>
>>>>>>
>>>>>>> This is just an idea in my mind, I not
>>>>>>> write code to verify, just wanna to see
>>>>>>> any comments from your side.
>>>>>>>
>>>>>>
>>>>>> I wonder if we need to revert GENPD_FLAG_ACTIVE_WAKEUP flag enabling=
 on
>>>>>> all SCMI power domains if that is not solving the problem you though=
t it
>>>>>> would.
>>>>>
>>>>> Revert the flag will cause a power domain not able to wakeup SoC if t=
he
>>>>> power domain needs power state on to have wakeup capability.
>>>>>
>>>>> I am not sure other vendor's SoC design. To i.MX95, without this flag=
 set,
>>>>> the NETC will lose wakeup on LAN capability.
>>>>>
>>>>> Regards,
>>>>> Peng.
>>>>>
>>>>>>
>>>>>> --
>>>>>> Regards,
>>>>>> Sudeep
>>>>>>
>>>>>
>>>
>>> Kind regards
>>> Uffe
>>>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
