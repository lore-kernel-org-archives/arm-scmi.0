Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2061.outbound.protection.outlook.com [40.107.103.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5181E3779
	for <arm-scmi@vger.kernel.org>; Wed, 30 Oct 2024 10:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.61
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730284576; cv=fail; b=DtlGy5h55wLseTD/k/moqE3oFiMMk5Kpnqh5ZwMYrBXMGU6tL0JwWXuGT2fclpXz685jbJkUR9uxmy3c/Bm4jkFPqcxKFxD/TdgpYoLcUAAyeEUEn5HXa5PdYSkJPqVctAGEbEbuauaWImc9Rxe0AadXL79iypJSHmskRIEjsUI=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730284576; c=relaxed/simple;
	bh=aKrWOs4KbqcLEA0n+FeT+GOGDdKr1K/dSPqHV3ix4yA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AuXq4mfEL0vIh6jc6td81DnO2ZYTZfqPaUuxZzAywQpF0br8ptIWv0b8pHvGxA0CWOX9LS+kMQBjwO0N9Xq7m8sQ4grSdoVxWYEeFU1zDjTS4A7hVdtIrdQgcNYfxBOOZfe/Vz89niBaadIZ+ZRH0YbzXvK7Bcnj7Pj0yLrlXqc=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=By0vreCh; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=By0vreCh; arc=fail smtp.client-ip=40.107.103.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="By0vreCh";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="By0vreCh"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=zMaZumK7tzKTuScG+r5F2eNwQvfzXYbT2EJxs9agLpolweydBhrRZzesLA/+s3PfH5Ev6kDeasHWYQCmhqKtd9GmdQYTZTKFQxT17+1QGxRRfqdAyQefGUhljuNCSERDdvv8A1y5PXgkd7u9qPEnxZUcBhhcNehzCg2IYmbUYdD5EB0/ynUZ5K7DyN+AzyGnwmzlZ6rzeYWVhNCqeuyCs7ZHBYJofSJL/yvOQEtsv0tBMyxB/ytBGBOG4ZdlQG1fj/ql3XHkDyapwMJC14uS/pGpT39p5wWvq5TxNgPWSb/uyXF8NlyexUTm6WkCjDexg98+HlyhIMqfLzLBFTUwVg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ec7zpDsX3ZscK2UC8FawjcFdlEtMJ3jo+NHSiwv4n6s=;
 b=lgzSRcboBbCSKAA+5nnLvXp8sqAS+Zltp2Cj0Y8egKSGEea6CjZ6yrO/9akacow5hzgnveuL+VZzG1VOKlZq8N7gY5Drbvbt1p0TLE/NcSQxfqJFjLd9MOrexqkJZFQE50gYPvn561bF34tZg9wDdOG5jxGQTSjkSEt7RLsWveeOLlzVURvAIrpqESyFSj4KpluQW6wfReyuTaHJ93F1fgBDcBqCYXnv2Mtph/qdPXEXawwRMUdVsYUzWTVAeiuQjvPogMBGTRMFb8pAgD06uq/vuwRh3nq52vVMFH7SamGmMOhgOhgWZXddbnUUxBZ6rPu8R5+iV5LxhawhKJWEzg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ec7zpDsX3ZscK2UC8FawjcFdlEtMJ3jo+NHSiwv4n6s=;
 b=By0vreChwiotZd4W/m3gtzecVBRHY3Cm4M2J3Pn6krUdGwpOZerkwe/LCDDj6f3jJ1T8lHfd3b/otDO7fhffb1eQQ9xLksydjpNnxKJle468xC0qFNA5IJDq2ly+IzBbiJcbxlSkKNd37Ru48yZ70wWUD/O0wMy6TZBHFW79QHY=
Received: from DU2PR04CA0265.eurprd04.prod.outlook.com (2603:10a6:10:28e::30)
 by VI1PR08MB5423.eurprd08.prod.outlook.com (2603:10a6:803:133::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 10:36:06 +0000
Received: from DU6PEPF00009527.eurprd02.prod.outlook.com
 (2603:10a6:10:28e:cafe::e3) by DU2PR04CA0265.outlook.office365.com
 (2603:10a6:10:28e::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.22 via Frontend
 Transport; Wed, 30 Oct 2024 10:36:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF00009527.mail.protection.outlook.com (10.167.8.8) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8114.16 via
 Frontend Transport; Wed, 30 Oct 2024 10:36:04 +0000
Received: ("Tessian outbound 4f9bb016c0c5:v490"); Wed, 30 Oct 2024 10:36:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5b6a9602c6ad8db0
X-TessianGatewayMetadata: Q8QqYEeRjomR1o7QaMS64Mpmbo4hMmCVz+1O8h6UlS71jltr8JY37v+Vkf8y73ngu0dugWvTsfnuo+B7KmyJy/xsfljlnDpSlI97f3WsQ16O/BuGHT2TJvFPpiW5GETlp/U6grz3KuQJOgn1aT8VARkOHyuTOAE1aQT1AqrTr7Q=
X-CR-MTA-TID: 64aa7808
Received: from L5d8a3c8bfd95.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6513D787-55ED-46C6-A3EE-234B0923E070.1;
	Wed, 30 Oct 2024 10:35:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L5d8a3c8bfd95.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Wed, 30 Oct 2024 10:35:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s3gbuJP89IgXDdF4ZeKQdi4+C+tLEu/zCbKrlWHhn7zAZiUvA2DRIGQhZT2fUOSsoQBtS6O4dsbtz48iLS1TeNi1M5IWNSjbaWmzZtZvh9ztHkJJTq2fDCyid04xJx2Nx9Yigq13IZdJ4LHxr6keZl3Ag88HYMhkAa/EQBE+0CNpOhs3VINwL6xGQWRf4UdW9GkV4VCqplNtkq2GNhKAasI4W9w7GaOyvVtu7zsbBgQ8Vc84/hWJr/LTTow44ezRQx4OnzAS6RihwpGJW31c/r3o0PXXnwLuURrMjkIE+PUh/jE06YgM/b06ZfLyrYoo0gItVwZO1I7GZXSMv3oG0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ec7zpDsX3ZscK2UC8FawjcFdlEtMJ3jo+NHSiwv4n6s=;
 b=DHRu8CwZbfgKdkuyt1W0YScS5V2kwD7D1UQrJwNE45rmHDin5oPF7BgsHVZeHUtxUqGtSqcS6eyspEM3U9k+r9xTnQHtcbzosuff96RLHmo3SBydnU9MRE0yO2tqeAqh4fYMF9GC8YZo4pNy6fnmulrMXdHbZu/HoP8QAvuvZwliuYvor9OWs5BRvhKlYavLZrpwV42orFFAQ3Nn5q51uVjJqAckz8HdpLnYjjAIIDNTa+BKtQkKU2ogXu5WgytNEEBnyFaiZLAi3cYdXR1LNdjLlKtbZ5crNEqL0KzWd+m3YjMtD39F/or6XAKrpCtDhISey/hrz709Ob8Oniz2dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ec7zpDsX3ZscK2UC8FawjcFdlEtMJ3jo+NHSiwv4n6s=;
 b=By0vreChwiotZd4W/m3gtzecVBRHY3Cm4M2J3Pn6krUdGwpOZerkwe/LCDDj6f3jJ1T8lHfd3b/otDO7fhffb1eQQ9xLksydjpNnxKJle468xC0qFNA5IJDq2ly+IzBbiJcbxlSkKNd37Ru48yZ70wWUD/O0wMy6TZBHFW79QHY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB9409.eurprd08.prod.outlook.com (2603:10a6:20b:5a8::11)
 by VI1PR08MB10243.eurprd08.prod.outlook.com (2603:10a6:800:1bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Wed, 30 Oct
 2024 10:35:50 +0000
Received: from AS8PR08MB9409.eurprd08.prod.outlook.com
 ([fe80::984c:fdea:7759:16ea]) by AS8PR08MB9409.eurprd08.prod.outlook.com
 ([fe80::984c:fdea:7759:16ea%5]) with mapi id 15.20.8093.024; Wed, 30 Oct 2024
 10:35:50 +0000
Message-ID: <8ff3c048-f1f8-4ec6-9f7d-5b3982dd45fe@arm.com>
Date: Wed, 30 Oct 2024 10:35:48 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: Question about identifiers
Content-Language: en-GB
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Cristian Marussi <cristian.marussi@arm.com>
Cc: girish.pathak@arm.com, arm-scmi@vger.kernel.org,
 vincent.guittot@linaro.org, Linus Walleij <linus.walleij@linaro.org>
References: <c5fdc171-0dc7-4c38-88e7-fcf9de7cbec2@stanley.mountain>
 <ZyCuAKfqRnuFdAwC@pluto>
 <f305d661-71e8-48c0-a6a5-4271c0436bc1@stanley.mountain>
From: Souvik Chakravarty <souvik.chakravarty@arm.com>
In-Reply-To: <f305d661-71e8-48c0-a6a5-4271c0436bc1@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0006.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::11) To AS8PR08MB9409.eurprd08.prod.outlook.com
 (2603:10a6:20b:5a8::11)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AS8PR08MB9409:EE_|VI1PR08MB10243:EE_|DU6PEPF00009527:EE_|VI1PR08MB5423:EE_
X-MS-Office365-Filtering-Correlation-Id: d9708586-927f-4af3-0534-08dcf8cea7ea
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?VUI0a2ZxY29NYXJibWVIcGYvYkkyU0dmWTNzK3Vud0hQZHZIT1g2Yk9RbE56?=
 =?utf-8?B?VWlJNWJqS2ZmNWFpenhHbTdPaHlxSXhJKzI1SVJHQlkzU2JkQ2hFY1FnamxG?=
 =?utf-8?B?UnZJbHNPWmYvU2ZNcndzREN4SWJXLzBTdmFnWDZUUXB2UWRpd282Ky9DaUcr?=
 =?utf-8?B?elRxZ3ZxNTU1MXgvTFJ5Y0ptLzA2Rk5BaE5oVVo0bHVaU3VPZWwrMi9uVTNQ?=
 =?utf-8?B?M3RDTG1aaWl1ZklpcXFxR3YxZjkvakN6elo2anA2ck8zT2JyTDlDdVg5WG04?=
 =?utf-8?B?TjlPVlJHaDNNVk9mdlBzU29vcHNRckJ1QXJkVUtUeC9oa2dTMGpxVDl3TjVn?=
 =?utf-8?B?c00vVitGU1FrL3hzcHBhYk16N3d4c2NWN29PZ2tjcEVXMFJnQXowQ0NXTXZs?=
 =?utf-8?B?V3RHdGhJT0E5YTB1UFd0WmwzMmNQb1BGd29xRWRDUENwT0R3NjJUZXVzVzFK?=
 =?utf-8?B?NklTR09CcU5pYW9SaWpaWkVwSXR5MVhyanBGb2ZaZ0orUmxYV1lXdmtINCtN?=
 =?utf-8?B?RGxQb1hDbmIwc3IwcjI4ZExQSUhlaFBpTGNwcTZIWWdlL3NXOHJ6anAwOVla?=
 =?utf-8?B?UTRlZnU5WFlaMVMrN3pTWENrT1VIYitKT2tCNHIrMGRPWXg0bUFnZUc4MVVW?=
 =?utf-8?B?aDFjUnhNejhyR3hmb2NxWnROa0g1TzRLRmZYQlY5czJVUVlnbVoyNjNZQTd5?=
 =?utf-8?B?WjVvbkU3bnhsMEZ1eVlnZStaSEpPcHBNZHBtSlM2b3kzZDNIRkhkcG1RclNl?=
 =?utf-8?B?ZFoxL3AwVnQyV2Nab1RRL3cyZ2kvZ3NmNDBYU2hsM1Nhbzh0d09IM1Y3dEN3?=
 =?utf-8?B?N3luN3hzY2FpSUx0QmxORjlXM0J4a1ZnRlVSa2VqN215R2NFUHlENmdNaDRN?=
 =?utf-8?B?TzArcURQUWVBNjdWQ1ljUzY1T2RyT3FPcEovck1IQXJUL1JZS0FENkFjdWI4?=
 =?utf-8?B?d0xOY2VjUzczeVlRRVhRRnhkRVNQTnJmRjRrMHowNDB3MmY1TERZZmxheW5W?=
 =?utf-8?B?dUpqcXdRZjdJNVRzbHU4dnVNSmVaTUVFdHVpcHgvOFJsV1ZHTlk3NWNyWWp1?=
 =?utf-8?B?RVJYdlE5NEc5NFNZUGdvTDlVNnhENUJSSGpLd1lzVE5oUm5LZ0Zaem9FV2tT?=
 =?utf-8?B?cmpmNW01UEQ4N2wzRUVwUm5MZXJjQWVQSFhScCsrUWt2RlZyQ1NNWEZubVlk?=
 =?utf-8?B?Uzl6cFp4UDN2VzZISE1sOUlTMXV0WC9ZOHpaZGt3eEhna3JLQzdmYmtoRHFU?=
 =?utf-8?B?bmZ4THRxR3ovYjIwZmRXOVZpeVBWeVlXVEZGZXhBQnZkZ0I0dk1DSURzWWdI?=
 =?utf-8?B?MGdYWUVEQ1Q5RUZUa09OUE4zVXIwKzg5VHhVYXpadWFYUnVUUmxZUnl0cFNE?=
 =?utf-8?B?TXdYMUcrY3k1MUI0M21BanJ1MHJZTzU1dFZVbXRJQlZpc29iTEVNSThRbTFU?=
 =?utf-8?B?VXdreWlOaEdRS3M1UTlZTHRIRGVwVWNRTWZlc1FpSG0yekJIOGlHRzFFTlVt?=
 =?utf-8?B?VCt0MGJ1aENkMEdTdzB6aUhyRDhHMWtGalN2NjRlY1grOVMrN2gxRFdTaDBq?=
 =?utf-8?B?MlF1WG1WblRTZ0phMG1wNXg1YUZ3V0lEWjVKSFExcGhqbjJBQkZ5Um9FZ0No?=
 =?utf-8?B?ZWxpTWZCSzRldlRuUXl0NmhkNGpqQU5LeEJtZWp6UjN3Zm5KZlJWY3FIOS9s?=
 =?utf-8?B?QTFjU1NyWENPQVU3bXJvT0Q4aFJZSnRURUIzcjFXMVZINjc5NktrSVY2RW5V?=
 =?utf-8?Q?1sIgoEkk1ZhjY9zWXR3o9MLhey5ZCypMkTt/9cy?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9409.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10243
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:20b:5a8::11];domain=AS8PR08MB9409.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fe36033c-7b2f-4edb-268b-08dcf8ce9f8a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UHdJVVVETld3T1B0WlplN0gxU0dsSTNVZzhleTNKTjRUL2x6a1ZUVHJCNm9I?=
 =?utf-8?B?eGVhRTBEZnJqTE1yUXM3eTlBemx0WTMzbVN1d3pFTXlla1lNVUQxcnl3N0lj?=
 =?utf-8?B?dTYyQ0FXazVpN1dHSTVyWTFtRk5XU3ZyZVhUZ3kwOXo3SXVPUjJTMWsrVUU1?=
 =?utf-8?B?QjlhSFNiK28wRytZak9CeGJ4VmtlOXRaN1pzS1VwZTJXeXlldkhGQnVlaUNN?=
 =?utf-8?B?cVd1MTRjQkdvbDMyNitOMUw4bXdpV3V4TXhhNFluZ3NaZmd5SERaRG9lWGNU?=
 =?utf-8?B?WU9MZkNlV2xrRnF2WXVBOEEweWlQbThiYThPOTZPN0gxK1lqS1NpckNVWml4?=
 =?utf-8?B?dVJNalJ0MnNDMVpuYVZxbHQwdnUvcWxJRTA1VTFrR04wTzNlWGZFQThhZzJs?=
 =?utf-8?B?eVpIMStSWCtHaWxoWm9ERTZibEhXWE1wdlMxT0o3K25VZ2ZvWHdJbElGRDR6?=
 =?utf-8?B?MkxaWFhRMGFSL09aWWk4RVp2WFUza2xZejd2WkdwT1pBRmNuRmUwWlR0SUZn?=
 =?utf-8?B?VG0vc2s0cWRHZmlhZTZwNGpWKzRwTy9SSGhITlJxOUl0NUdpMENnSVlMRk5X?=
 =?utf-8?B?a1B6WklnZTM3N0lOVmNIZ2RPaVJKMWxUUSttckRFMnFubmNIMXltSzQrYS9Z?=
 =?utf-8?B?WUFlRElkdlIwOVduRGZFRnlTSU44UUloK0l3djJvQXdzRUdPNnJ0TDl0Wi8w?=
 =?utf-8?B?Qm5GTVhqVnJXR052ajZvUzByT1d6YmtjMXA4dm9iZ0ZudURnSXRxZnY3QTdv?=
 =?utf-8?B?b2F1aU5hY3BnNjNRWklzaFhJN0RZbytseWJra1dBQ3VENVQxSE40VGMvRHZE?=
 =?utf-8?B?Qms4d2FFaWlLcU5tUXdSdTY3L3RlaHlGRmdLWGdNVmg2NHdoNVhVZkFuYkZW?=
 =?utf-8?B?Y2VzYzRHQ1hpNzNrT3ZWd1JSbFcwQndMOGhRcWRXNlc3THlwK1Z6ZWpZNndL?=
 =?utf-8?B?cndxaHpHTDFudzZIYWtYSTd1MHJrcUxjTHhQN1NKNmVqbkk1RXBCZWMrYjZN?=
 =?utf-8?B?NXg0NjVGL0VKaWdxTVVLSGJncXNYRDArZDByNS9BM3NRV2tBR3h3ZkhMMkJq?=
 =?utf-8?B?OXRCeGF4UTU5WXhFMGg0VXVROHVKZFZiTEIremtnanVBV2x4RVRsQ09vUHhW?=
 =?utf-8?B?OTdSQUZpdFlOSkdOenhJOVdpLzZVTVVhbS9Zc3RQZmw0SHZkSXdMTWM0MjdZ?=
 =?utf-8?B?KzBTaTg2VDMvbmhsNEVaTjJxdlBUNVExRjE3ekNVZzFrYU5JVXVHenpRdFlH?=
 =?utf-8?B?OEpaT1drSWJHOGtJczJFUGlhR0hVeDFaT2pxQnBGVFlHUDRGNnlVSmIyY1R2?=
 =?utf-8?B?WDB1aEx6ZWV1NS9kS1RCY1d4VlFBWUFOaHdzWlY3RXlCNzlGUVdIcGF6M0N6?=
 =?utf-8?B?bUF5b1U5Y0FPZ3Aweis3WmtRVVQ4NkRyV3RRZ0ZjeTFMNFNjbEFhd2QyRG0y?=
 =?utf-8?B?K2kyNjRuVkFTTStHakhEbmxRZUY3Q1NSTEYzZFFpTXBnMDhlUFlxa0xBTVRS?=
 =?utf-8?B?cjNmeWVpeXNMQXM1dzlmSXJZbFdjT0Z6ZDFzeTVVS3NjSDRnbnRUd3pjZXYz?=
 =?utf-8?B?N05PUEZVRFhYMk1sRDExbTNWREtHU0J2dnhnVGNPTEpPS0xxTGtMRFZGUHR3?=
 =?utf-8?B?Qkd4bFBrdmMyc04wWHlJVld4YWk4eHZKWU1weGRCVG5yRnpFa0FLeDkyMDNT?=
 =?utf-8?B?WVZkWXBFU1VZUzhzU2gwVkVyb0NTR3NrVlZUQWJVTDZ6SFZPVkRmcnhoMWRL?=
 =?utf-8?B?WDdKYUl5NXdCOHNXM3FwWHZxa3Q5MnZnaEFWQVNXN2RMTlphY3g0dXByeVQ4?=
 =?utf-8?B?ZzVmQkdYMnNhSk9UUElLQ2tWS2UzdENUai9QS0NGbW12UFRlQmJyaEdySTZy?=
 =?utf-8?B?ckFFU0ozYWd3VDVvS1dtSzh1RjBjdTI0bS9uZnMwSFdJRkE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 10:36:04.3694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9708586-927f-4af3-0534-08dcf8cea7ea
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5423

Hi Dan,

On 29/10/2024 10:20, Dan Carpenter wrote:
> On Tue, Oct 29, 2024 at 09:42:24AM +0000, Cristian Marussi wrote:
>> On Mon, Oct 28, 2024 at 06:09:50PM +0300, Dan Carpenter wrote:
>>> Two questions:
>>
>> [CC: Souvik]
>>
>> Hi Dan,
>>
>>>
>>> 1) In SCMI pinctrl protocol each pin, group or function has an identifi=
er.
>>>     uint32 identifier
>>>     Identifiers are limited to 16 bits, and the upper 16 bits of this
>>>     field are ignored by the platform.
>>> The linux-kernel assumes that the identifiers are basically, 0 to nr_pi=
ns,
>>> 0 to nr_groups and 0 to nr_funcs.  Is that a fair assumption to make?
>>
>> It's not an assumption really, any SCMI resource on the system, across
>> all of the protocols, is identified by a number in the *contiguos* range
>> (0... TOT_RESOURCE - 1) where TOT_RESOURCE is usually gathered with some
>> discovery initial command...looking at Pinctrl specifically in 4.11:
>>
>> "Protocol commands take integer identifiers to describe a pin, group, or=
 function.
>> The identifiers are sequential and start from 0."
>>
>> Pinctrl deviates a bit from this since you have 3 different kind of
>> resources, so you have 3 different TOT_RESOURCES values to query.
>>
>> ...maybe adding "sequential and contiguos" would have been clearer...or
>> maybe it is just that I am used to SCMI spec parlance/world so I
>> implictly interepret like this...
>>
>> IOW, for any protocol, in general, the platform is expected to expose
>> to the agent a contiguos set of IDs numbered from zero...i.e. without
>> holes due to reason like 'resource X is not present on platform Y so
>> we'll leave a hole in the set of IDs returned at discovery time because
>> is easier than remap the physical resources to the set of IDs exposed to
>> the agent'
>>
>
> Alright.  Good.  Thanks.
>
>>>
>>> 2)  In the spec 4.11.2.7 PINCTRL_SETTINGS_GET and 4.11.2.8
>>> PINCTRL_SETTINGS_CONFIGURE it only allows for pins and groups, not func=
tions.
>>> Meanwhile gpio functions are functions.  That's just a mistake, right? =
 I've
>>> been working under the assumtion that it is.
>>>
>>
>> Mmm, there were a lot of discussions around functions and GPIOs (which I
>> dont recall now) and a last minute rework to some commands in that
>> regards, so that now you can use those 2 commands to (optionally) get/se=
t
>> the selected function for a pin or group specified in the command.
>> All the other configurations are, indeed, only pertaining to pin and gro=
ups:
>> what do you think is missing around functions ?
>>
>> Moreover, are you sure that you have the latest v3.2 spec from developer=
.arm.com ?
>>
>> Since there were a lot of betaS for v3.2 cycle...with changes especially
>> around functions/gpios...so many betaS that, till last month, AFAICS, ev=
en
>> the ACS SCMI compliance suite on the tip of master (still not an officia=
l
>> release, though) was broken, since it was really implementing Pinctrl
>> testcases against an old obsolete v3.2-beta (i.e. testing non-existent/o=
lder
>> pinctrl commands...and I have fixes to upstream for this...once I'll hav=
e a
>> bit of time...)
>>
>
> I am using the 3.2 Spec.
>
> In PINCTRL_ATTRIBUTES it says that GPIOs are a function resource, not a g=
roup
> resource.  See the last line especially.
>
>    Bit[17] GPIO function descriptor
>
>        Set to 0 if Bits[1:0] of the flags field in the command is set to =
2, and
>        the function does not support GPIO functionality.
>
>        Set to 1 if Bits[1:0] of the flags field in the command is set to =
2, and
>        the function supports GPIO functionality.  The agent should ignore=
 the
>        value of this bit if Bits[1:0] of flags field in the command is se=
t to 0
>        or 1.
>
>        This value of bit must not be 1 for more than one function associa=
ted with
>        a pin or a group.

The spec envisages this to work in the following manner:

All GPIO functions are just generically tagged as "f_gpio" or
similar...see the naming convention recommendation. So its just one
single unique ID/name for the entire platform which indicates if a pin
supports GPIO functionality or not (its NOT f_gpio_LED/f_GPIO_fan
etc...which is not something SCMI needs to carry over the interface, it
only carries settings).

So for this example lets say the platform defines "F_GPIO" as generic
GPIO functionality which is function ID 2.

Then when you pass 2 to PINCTRL_ATTRIBUTES (flags =3D 2). it returns
Bit[17] set to 1, Bit[16] set to 1. Bits[15:0] specifies the number of
pins which support GPIO functionality generically.

Then one can use PINCTRL_LIST_ASSOCIATION to figure out the list of pin
numbers support GPIO functionality across the platform.

Way to use PINCTRL_SETTINGS_CONFIGURE is to then use function_id as 2
("f_gpio") for the pin identifier by "identifer". The config of the GPIO
is driven by "configs" specified in Table 24.

So in a nutshell, the GET/CONFIGURE functions work on setting physical
pins to a config. and a function. In case of GPIO the function is
generic on a plaform i.e. GPIO, and the config is what agent is really
setting. The interface does not care which type of GPIO it is. Thats
internal binding of agent and platform.

Pls let me know if I misunderstood your point, or am missing something
obvious.

Regards,
Souvik

>
> Either way, he PINCTRL_SETTINGS_GET/PINCTRL_SETTINGS_CONFIGURE need to ad=
d
> functions.  Here is how that reads now:
>
>    uint32 attributes
>    Bits[17:16]
>        Selector: Whether the identifier field refers to a
>        pin or a group.
>        0 =E2=80=93 Pin
>        1 =E2=80=93 Group
>        All other values are reserved for future use






>
> regards,
> dan carpenter
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
