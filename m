Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2072.outbound.protection.outlook.com [40.107.21.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB666B67F
	for <arm-scmi@vger.kernel.org>; Mon, 27 Jan 2025 02:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.72
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737943743; cv=fail; b=YwgzDMnGJT9Xz9wsiKkvN6uiKWXt5POsA9dWwOH09AntYtfDhEy0YqGozygyTahA84WvBapZ9XFuXzvqBWigBWVlmfduWc8A9ewQDPalCZhDvcglbwzVkxWxt0q9EoiFeI9/XWstemRyDyTJxH7xGK951riqmcm1wvUC3Fi0nWI=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737943743; c=relaxed/simple;
	bh=d6cejWiIxCXiH3vxx7NSNzLwcStGpo5Zz6Lz+XQa8OY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FMaOsBIR+uoSQOkyB28OeOHmxMYV5R4Rh2EOxOpzEDWrddvbfJR4/wCLqSsLmCXbvtl9aGpzz59VuPZSzi3wPt+TZlExlUmkFX/AYKbd6WOlxJo5oaGpftyordGMNug/zDbvuf6v+C7PCfrJNya4SjCEPxWn+XIapE3t0UVQsWU=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AkjQhXKB; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AkjQhXKB; arc=fail smtp.client-ip=40.107.21.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AkjQhXKB";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AkjQhXKB"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SnvRWvvwbuBE1AZnihNsQiqYx0RIE59W6HNC0QYEJqDKdR09z9+UW6T/OTz8Rotcao6RFn2msHVPCC9k5A9+b5cvg+JrgdYk8Ss3l45W7vBOaznXzETkgSgGof11vrMVYLO8JbOMennrnkNXuDcvIJFosycq/cdU1CpDQX26tI4+nT6/GkL2ryouuFEnPReL5wFu98TWhuGnVMQuopJiekCwlrwsHU7gHHscJByAwRGl6GX0nVkowdK0tYXvTVgD3o7Yhxc+xJSWb9dtJwEQl+MR3I1vet1mYUaPszZQAWzhEFFoPUdumbMraQofbdlFhTym5IwCgp/j5kRbalEWJw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUjVhDm7IcjTZ+mCQHh0jXtU+PW10gOoHjsE3BD/jmA=;
 b=plZOv9XkNnMZmiAYJ5C94M6LBkR05CplZpvTUTI1huwuvP1qGYakJUpljG+PVkX/tN6ZqiwMrELt+V+V+9Uw0Ms53i82j0ZzmQNl3Yh7j/oRSd4FlvX9qnpIw+3+BP2L/92wWqMNYSHIOezKdMyxHTFwFkvSCmXQ36loTxb3odsfcOZvwkpITknaio/GkmVB4qh3myfzaiP25/RVjxQLHdxzNhd2JsOd8fw6+jO9dAJOPHXOX4oE+McJ8H1VfXmU7yMS/39w4BzsUy2+UU1tkajMG6o1ITdwmCy7s+YqDHKGrg08whxhMGEf46XvsQ34OMHkWbZ/U0rMEp+UAto8Mw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jUjVhDm7IcjTZ+mCQHh0jXtU+PW10gOoHjsE3BD/jmA=;
 b=AkjQhXKBz/nMKatMUD36wGXAoM7/FB9Hd393ZVFY4HMQqq/o7VgzouQUlni9P/NvLQ63thDIv6Y7m6v/ibHPfj69RKoXYcQJrE8vdkfuPhUpkeQdmakSaMcMUVlN6RAFkUd5xFKdM3Rz14GFMi5K92jlnGX8JtLj5qbtt6X3PqM=
Received: from PAYP264CA0029.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:11f::16)
 by GVXPR08MB8211.eurprd08.prod.outlook.com (2603:10a6:150:17::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 02:08:54 +0000
Received: from AM3PEPF0000A78D.eurprd04.prod.outlook.com
 (2603:10a6:102:11f:cafe::84) by PAYP264CA0029.outlook.office365.com
 (2603:10a6:102:11f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.22 via Frontend Transport; Mon,
 27 Jan 2025 02:08:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A78D.mail.protection.outlook.com (10.167.16.116) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14
 via Frontend Transport; Mon, 27 Jan 2025 02:08:53 +0000
Received: ("Tessian outbound ad34cb01f105:v554"); Mon, 27 Jan 2025 02:08:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 25ca7d2cd99a6d92
X-TessianGatewayMetadata: fYjK3Gk5b2IiG10v6AzfMXXmASh0Wvrtq+MNUw8pozd3XZNkHoba/86IEFEq6U3yonQPSaY5rElkn9O7jy8sUPbqgUEx7HPuQk6WaWThHtWeoE5Wwe2AQbyA2cjcyVZ6q+RXfi2Wm4s+zBe64ePI7EyqRdqy8sBKli2fTY6xfSVbyTCbUMc5bxvSi02YkyuSXeuRYlJ28jgvrFfALzcX+w==
X-CR-MTA-TID: 64aa7808
Received: from L1998424116fd.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D7A672CA-E4B6-4216-8D77-9D93A444F197.1;
	Mon, 27 Jan 2025 02:08:46 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L1998424116fd.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 27 Jan 2025 02:08:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JVsvbje3PmuFydgC+IaRHZiRq9puOsjahRJe51+ehNN4SB6fwKCU/nxtqxmaqFmy7bRT/J8UbolfOovOd3UV4EBGiLdZQbS68nEw2+sBXoDQSSMBjL60kUZnayVRRNqAJb2tSR7HYyCCBEIJprd00j+B6l2RTNWOZQhGleAOKXCbo26HpiwNoiEEnihUhJbfhKIeNqEt7CrcaAxtgOOzGsBtfAn7anTqJ9Qe6Qd1dAXvS7Tqwq+Sq2BAQdCqhu1qFb5B2krqleesIaLqonhy/nb7CPXZfMzTzct6Q5zQFKam5CNsVRA8ahcCLYEfoVpQLFXdgSGpl6M1EndwrFuH5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUjVhDm7IcjTZ+mCQHh0jXtU+PW10gOoHjsE3BD/jmA=;
 b=nulxcl5stOhQuzm1ICCahIqAyEKzJ12vCCwaSlErtNLjGeq6v/eBZNAzD+L4e12RecB2h0+syHg91U9TqGCTz+tvTZUlcb0p1UYFMtZcs7Mj4fhwXqiaESA7KAPwL4/TKK9TJtgfED55XlJxc2DT2twsFDunwk9jIjSCewbET4Ju7puf2sM9j+uPsu2B2ArW72QeVD5yFuCqyj8t86jRWHeYnMiIWSGDe3XV8W/lvPo6VaUvF3se09ODXNfP0OFsQi5/PnsxzL2x/biGvAzRH2D6SdzGBhYaJJeDFiR81OQnPoPuheaR2mukcnegpFUdx3UEgpGIlRTy7SQL4BvqgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jUjVhDm7IcjTZ+mCQHh0jXtU+PW10gOoHjsE3BD/jmA=;
 b=AkjQhXKBz/nMKatMUD36wGXAoM7/FB9Hd393ZVFY4HMQqq/o7VgzouQUlni9P/NvLQ63thDIv6Y7m6v/ibHPfj69RKoXYcQJrE8vdkfuPhUpkeQdmakSaMcMUVlN6RAFkUd5xFKdM3Rz14GFMi5K92jlnGX8JtLj5qbtt6X3PqM=
Received: from DB4PR08MB7960.eurprd08.prod.outlook.com (2603:10a6:10:38d::5)
 by DB5PR08MB10256.eurprd08.prod.outlook.com (2603:10a6:10:4aa::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 02:08:45 +0000
Received: from DB4PR08MB7960.eurprd08.prod.outlook.com
 ([fe80::46fe:3aff:fc62:1b4a]) by DB4PR08MB7960.eurprd08.prod.outlook.com
 ([fe80::46fe:3aff:fc62:1b4a%3]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 02:08:43 +0000
From: Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>, Vincent Guittot
	<vincent.guittot@linaro.org>, Girish Pathak <Girish.Pathak@arm.com>
Subject: Re: [PATCH SCP] module/scmi_pin_control: Fix ->write_payload() memory
 corruption
Thread-Topic: [PATCH SCP] module/scmi_pin_control: Fix ->write_payload()
 memory corruption
Thread-Index: AQHbbAU1MoBj0RcJ8U2aej4ZFWFfZLMp6EkQ
Date: Mon, 27 Jan 2025 02:08:43 +0000
Message-ID:
 <DB4PR08MB7960497670EA3B3C77101E27EBEC2@DB4PR08MB7960.eurprd08.prod.outlook.com>
References: <ec49918a-595c-4755-8b1b-f0351e63de1f@stanley.mountain>
In-Reply-To: <ec49918a-595c-4755-8b1b-f0351e63de1f@stanley.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB4PR08MB7960:EE_|DB5PR08MB10256:EE_|AM3PEPF0000A78D:EE_|GVXPR08MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: 77858fca-3758-4d39-c327-08dd3e778c86
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?4j68nEE4ATocDyJ+RB19u5ruodaq4hoN2uHqk4x/J5ntk9qnhpHhFSHHvU?=
 =?iso-8859-1?Q?W0JimBheKU96CkPm17BGY4PjtpZEYsFQLeGQd+cD1/0xOHWOjuTxkKeyuK?=
 =?iso-8859-1?Q?XlB5oPkzU8a85cvURVrjMrO90kBlEfymNIkIqwaIYNexFXxj6/cRiy19nY?=
 =?iso-8859-1?Q?zALVTcnBL+w0GdkBSzso2Zg6KuTFgCbb+jrogzRHVWgEaX9iUItEZHDke7?=
 =?iso-8859-1?Q?2DPPt+U2sHYnhNpkeFDt3BLccO7yMDXLLkG1UvOJUg0/px47tiKb+gprSw?=
 =?iso-8859-1?Q?ZvzRRAZ2OqU1Vkyfu0TeInHoIy3z/b2eDR/lzpaE52+hbfXYcmPXx0wwBN?=
 =?iso-8859-1?Q?PGMdhEcgXdy4X0xagS1Yo1TM6c9/UdTNARfgeTl1RP9mx4/6fkYZj2zhu0?=
 =?iso-8859-1?Q?wo/wr3Zrr/mjoQW0ULmqnn6hrLfZ/S3EuBgmcTkkLO5VT9qbjK4TAbqiCr?=
 =?iso-8859-1?Q?xN7RrUHnsPD+bVM3BEflKXnNtVFVF0Xw1QrlRImfXEhxKJR5Fl4bG0F9u6?=
 =?iso-8859-1?Q?ZvV2FcIS6JjnMGlMuW25gSAkDgbHVmWrBnsQV9eiG7pZuq1Hc4JBF3RXBd?=
 =?iso-8859-1?Q?JA01Mhf0Wl80wmZIv2vGO1jrthmhD9sx6CMQu0txCs3USX6BA/nKdL/hJ4?=
 =?iso-8859-1?Q?gLk7gw/wMXdvndZFcHxrvt/GKpSrDKW9SUPLFB8F7RmKkzj0aTg/hSZK2u?=
 =?iso-8859-1?Q?Ok+iTSrgwUHf/fGtQEs7hKFCm922Ip2bunOhdRUSQH/qcqe9t0FQe0AA/d?=
 =?iso-8859-1?Q?0ObMCE2mvoEhB8+NSC1ysbWZ/ImPvvh+LAzCavj3lf+wnH18sPhVJnj/IP?=
 =?iso-8859-1?Q?DSyOdlPrKTpghYVVYb3IWRzKxqeb76YModRRK5k+c1SGWE/x47TOBRbPyR?=
 =?iso-8859-1?Q?CK0B2sta/uQmzqlfZML/54mA7z5lVMdceZuAUu1B1qPkXrKEzseKZEp/Tm?=
 =?iso-8859-1?Q?SI99jd/Nqdl1wlBAG2ysNYv9p6/9/8QPND4LsCD9NbooZBT5qjOp4IZCZT?=
 =?iso-8859-1?Q?sK+7ZSfa9k2IensTtEfOfpY4WvBKDZx3qqjFfp+weuiCqLGaY0K9w0LQkw?=
 =?iso-8859-1?Q?oWa9a2gNDHW2sT/r/L4sg4xP/j8+gQXCzXwE7kYioaQB+T1lH1ZJQ7TKOf?=
 =?iso-8859-1?Q?Ub5GgvhEVZk/2kfuddrtMKUacH0pH2OIJLL6ExRJJp4NtYd+1XTbwU7mRQ?=
 =?iso-8859-1?Q?TMMPc4Mf/CrZGdNKnzVPOImUHMdrCXgEeHYTPZ/u2gCFvPmhYDc7AFjuih?=
 =?iso-8859-1?Q?tWShfzeuo7aTmRjqtKV2Bsx6DSy75llJlp7zWuFfRU5QxQDNwXFqft8Gpa?=
 =?iso-8859-1?Q?L5+mVlwATMV1wklolGKFbrED0n4IqRssGImtLeAp5ClHRrReSMQRJZt0/e?=
 =?iso-8859-1?Q?veDAxpiao4L+Evc6+FDd0rP3pal/A2nlZSKMh+Hz4trzd9hYkagKHqYbaM?=
 =?iso-8859-1?Q?m3ljhoqhX6e5VE+vgXkuN11Mi7Fhn3YCp1xjZY6SDM20ZWsIhOQwegJOs1?=
 =?iso-8859-1?Q?GrgHiO8DqY79LYIir8BW2V?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR08MB7960.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10256
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:38d::5];domain=DB4PR08MB7960.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A78D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d51ee5a9-c504-4814-eaa3-08dd3e7786a7
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|35042699022|376014|1800799024|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?Sb1SpNqpeAe+CLae/AfaMHsVWhr8r5qr5P8LuUd8vLsU0EvL+LZWoOzPEQ?=
 =?iso-8859-1?Q?PRVTnwRqXF4XbB2aDQxfHvE3Sw2YjY1ELKmIDzsL6bhZIw8xX17vCzxCWX?=
 =?iso-8859-1?Q?GTbBrp4uwc3YxCpaqtvQhUrzllmSnML+eRa6V8E1AhBkt4TSY0EviL1BaH?=
 =?iso-8859-1?Q?laiDw4ol+KB95NG3cZcGtBWJTd/hVO7vGXpTnpiZVBBl2Wiz6pmdvnM8dO?=
 =?iso-8859-1?Q?djnyDx6qnXqxshNu17jqcfbg3GTby/NG2PPoIRnKFbF883CODh1LEYsiq/?=
 =?iso-8859-1?Q?az+7Dxm5GZhhZHWacuGXOg8ZShhyC8MSAD2jElXpCrwsMr5l7/s6GvGAdM?=
 =?iso-8859-1?Q?GJMDzLLEAnAIt1Juq4FYwOCEq2wXxwjxhVVIM39IarvBmHw/lKKFdwzAZI?=
 =?iso-8859-1?Q?5jSrVldMZdETZ1Xn7Ff7Lj0sZauEHUV8zzrQpmRCjp5dUu6YWWVNJvnGmn?=
 =?iso-8859-1?Q?5gz9ekum19n2MIx3Z3qyD9snHoRp4uxYELrsASrbHeMrzbLEX3aSgXPZNz?=
 =?iso-8859-1?Q?/Mulus6a+4ZQQtW06fIgEODmhOAR8sRoifYflxc9DxFHSZxjuRBIU9Qi78?=
 =?iso-8859-1?Q?5Agg7uoWkIPRT2+rqjnEPzpbc7MCBw75MjL02btJIoTuLxTYqZW3TBznvY?=
 =?iso-8859-1?Q?N6XS3YYGcvDhTPaaw907C5g9TUNeQLBkdLxljAhKwgKHyIHO9f16JYA/KQ?=
 =?iso-8859-1?Q?pFBwcySzA/xocL8w6N4cKMXhLTyxbR38NmFSWmQMZYCW8avUNrbLUvUmeY?=
 =?iso-8859-1?Q?+E280upgsmFKrHrUy9FQORtE97WKbjY+ckendMK7pIumLpsc70wU+C9AAO?=
 =?iso-8859-1?Q?r21zdDfTJQORP1PGQ8km75rvqUdJpgwkfhjl/a6CGHn37BA2+nEIzDS7w3?=
 =?iso-8859-1?Q?4rIduuatNw9zKm9qpnsinUIB57DFs0tKkJPCjU5dWmVToETYx2CTLyTSqF?=
 =?iso-8859-1?Q?9Ngxudh/2LYi7I8B+LWQFgEyk+n+n2koOob13Z/xsWaK0jWgN9Zl9BMzzj?=
 =?iso-8859-1?Q?9/srSs9ablaMZCbMDsiLYuut6g7+83xL54spLXIFt2ADJMD8u1IICS1cSM?=
 =?iso-8859-1?Q?zRi7FxKMF1c1PlcuX0Pmtj3g6XQjo6psHrqexIyl5HD3np7HJGiaerMeZj?=
 =?iso-8859-1?Q?cggndUMiMA9VIbsG+/SiIUylduuNRx64RiOURPNTP92+FuJptgqgicb9KG?=
 =?iso-8859-1?Q?fyGfsfXc0HTgkqpSSJ1mEpN5j0yWAyLyPnra9rBMPqZSSH2Trd9k7yStyE?=
 =?iso-8859-1?Q?+pgwFROl5HQnYSIrL4ikjmbegFepicGUWLAVvoBMS3XbLa2F8fevXhHZ9W?=
 =?iso-8859-1?Q?vpZD29QgiYT/zjBXq31OpdHvv7w6MVxlumTm1lEFPe6dpK6KBhSq/PgHOl?=
 =?iso-8859-1?Q?9GHRJqig6ORGb0ubs2ivCFtCiKFd3q4+c6Y8eldClM6dGzO4oRHs2YDiJh?=
 =?iso-8859-1?Q?uJeKiEeKEh84Ik3aaA9tDiSpNHGVkXTTFUx5AIXcc+PhsUcZEfaruhRFyd?=
 =?iso-8859-1?Q?VbAo/MqB8CWCTWzwOw0YoxWtdUHFdRWFV+j0YptXugOMlCk1MNOslBOZp0?=
 =?iso-8859-1?Q?mypSND8=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(35042699022)(376014)(1800799024)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 02:08:53.5525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77858fca-3758-4d39-c327-08dd3e778c86
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A78D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB8211

Hello Dan,

I'd like to update the scmi_pin_control.c regarding your proposed implement=
ation.

thanks, Dan in advance

________________________________________
From: Dan Carpenter <dan.carpenter@linaro.org>
Sent: Tuesday, January 21, 2025 1:05 PM
To: Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>
Cc: arm-scmi@vger.kernel.org <arm-scmi@vger.kernel.org>; Vincent Guittot <v=
incent.guittot@linaro.org>; Girish Pathak <Girish.Pathak@arm.com>
Subject: [PATCH SCP] module/scmi_pin_control: Fix ->write_payload() memory =
corruption

The call to ->respond(service_id, (void *)&return_values, payload_size)
will copy payload_size bytes from &return_values to the payload.  There
are two problems with this:
1) return_values does not have payload_size bytes so it's a read overflow.
2) It will overwrite the data that we wrote earlier with ->write_payload.

The way to use ->write_payload() and ->respond() is to use
->write_payload() to write the entire payload (in multiple steps, chunk
by chunk), and then pass a NULL payload pointer to ->respond so that it
doesn't write any further data but just sends payload_size bytes of data
that we have already written.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 module/scmi_pin_control/src/mod_scmi_pin_control.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/module/scmi_pin_control/src/mod_scmi_pin_control.c b/module/sc=
mi_pin_control/src/mod_scmi_pin_control.c
index e58814660f4b..058c89f9512f 100644
--- a/module/scmi_pin_control/src/mod_scmi_pin_control.c
+++ b/module/scmi_pin_control/src/mod_scmi_pin_control.c
@@ -392,11 +392,15 @@ static int scmi_pin_control_list_associations_handler=
(
     }

     return_values.status =3D (int32_t)SCMI_SUCCESS;
+    status =3D scmi_pin_control_ctx.scmi_api->write_payload(
+        service_id, 0, &return_values, sizeof(return_values));
+    if (status !=3D FWK_SUCCESS)
+           return_values.status =3D SCMI_GENERIC_ERROR;

 exit:
     return scmi_pin_control_ctx.scmi_api->respond(
         service_id,
-        (return_values.status =3D=3D SCMI_SUCCESS) ? (void *)&return_value=
s :
+        (return_values.status =3D=3D SCMI_SUCCESS) ? NULL :
                                                  (void *)&return_values.st=
atus,
         (return_values.status =3D=3D SCMI_SUCCESS) ? payload_size :
                                                  sizeof(return_values.stat=
us));
@@ -569,6 +573,10 @@ static int scmi_pin_control_settings_get_handler(
     }

     return_values.status =3D (int32_t)SCMI_SUCCESS;
+    status =3D scmi_pin_control_ctx.scmi_api->write_payload(
+        service_id, 0, &return_values, sizeof(return_values));
+    if (status !=3D FWK_SUCCESS)
+           return_values.status =3D SCMI_GENERIC_ERROR;

 exit:
     if (status =3D=3D FWK_E_RANGE) {
@@ -579,7 +587,7 @@ exit:

     return scmi_pin_control_ctx.scmi_api->respond(
         service_id,
-        (return_values.status =3D=3D SCMI_SUCCESS) ? (void *)&return_value=
s :
+        (return_values.status =3D=3D SCMI_SUCCESS) ? NULL :
                                                  (void *)&return_values.st=
atus,
         (return_values.status =3D=3D SCMI_SUCCESS) ? payload_size :
                                                  sizeof(return_values.stat=
us));
--
2.45.2
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
