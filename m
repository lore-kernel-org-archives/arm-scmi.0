Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2042.outbound.protection.outlook.com [40.107.249.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A771C26B97A
	for <arm-scmi@vger.kernel.org>; Tue, 18 Feb 2025 15:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739892287; cv=fail; b=MXLS8SYxNelfht/kETtKei0haKishX5BZ/ua8CmHGkewL85ebfIv/v5FZeK8PA3z42P7fWa7hl82uspjIOp7+xrN6WEkWMpLi9Zh8eMx3aImamQQXkKG4VskU9O/C1KXUhIJsefekIRi7Pq/W4h7H00+rhWC3IR8zm4jqMpOUGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739892287; c=relaxed/simple;
	bh=um0rNURY4GjuazmhB2lUloYctgh7PMKgLgi/Tu7RwVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ST85y7pXIfCLneXECNSdKAMVDIEprXOPcL/K/+MK2bckQPBZnoVIRlh0kyfwJGXOMlMXB6Ij9O3PZ5wShBt1HOxC1nsj3rd22Tq1OQpr86FiACpdZvFvOfxU/nTaKADWA9O3GfmKJ7dGHGMLVprQHSVPZmiGUta0PxvYXuise/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Y2VYclY4; arc=fail smtp.client-ip=40.107.249.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Y2VYclY4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPCFdJSCmKSI4+zmCMC+UV7+8z7XoMPuHzY573P3iWsjtFRy3EgvnXW0iJdOIINBw6JtLZIcJWhiTNQQrbGibg1AeOJxFAHhdsjP6r5n72dC0tCTm9bjsQaIBB5wG7VK37m0582SL2Y24uJh10sCIIk+3pPlm46WGcLiW507P2IBb4fxUDpHcL50+VfXOXc8yzd4iGN5SlwE2t79AajzGiN8M3jQyHROF0+qQrVsNcZhTsj5ROGtSIx/WrlnYmsqXqXQU+7MFyb0nC2z3wChCF5TLl6Lozeq5sUKY4RsjpFeTxMWHGDsZAXMn+2R2hXEGGqvBNtK0YKqD+mBhou9tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VDhsHQ+oFL/TpkHgFtPadsYHjBWtjznJ3qmtNUX1qq8=;
 b=Z2LLkOFgsxslFAHiVYkMb4dgmwpF8sABeQ8TTWNWnMnRxM2gOJDDPGDoybmXzO/Fmbd8VIiGiClOFrak9q2W8u0JIf3C4uf3Mwh7HtsyaS3hgdhuEmvvKI0m/t2zMbvRBt0gGS5knUSlZ+g5rt/artU10EaUH/+LY4se/TN0pM4JWbbt7uTGtePsCHqLX1rZgGMpOvsbvmbyfXe7dxZzEl/yHYfr61t/Mh+z3/ylgmcjVOOfLbQLBO3G/RI7ovAKvvAUFdaYRze2rZ8itxbBoTszdm+G43gU2BYOyNiUy6Ve8HpUKUIjdzv/A1/0XnuN8G52C+lihTeA2U8ncyuvng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VDhsHQ+oFL/TpkHgFtPadsYHjBWtjznJ3qmtNUX1qq8=;
 b=Y2VYclY4D4mgmj7l+21adLnEWd65/5dnrF0HaAYLvhIVa9NYYkr3CvMp8AeHAIikaet86J6GWnJeUZS+RmvoUWJomynje1VBzfF2mN5cYQaQ0SsG7tD3Er0/FC/C6UQOZ6XIHbvpq8sxDI4/Nc0gks5LTCLBrnqajxFXomxHdVH0DJzh78Wkx87ER5Z8iNwkdAPup6mt5xYkdgVOu7zyoWTTN+iUqhDWE6qPVeXqtOH58gK4GbSnI7F5yOKESLbEcj7f/IxjfzaKrgT/XfYazAZcJFi0d2pTeJfdN+cbYENUl4et56X/lNDWGyvkhiaNUUT3+fO7Sa7y563UJEgmDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by AM8PR04MB7748.eurprd04.prod.outlook.com (2603:10a6:20b:243::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.20; Tue, 18 Feb
 2025 15:24:41 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 15:24:41 +0000
Date: Wed, 19 Feb 2025 00:31:46 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>, Peng Fan <peng.fan@nxp.com>,
	"cristian.marussi@arm.com" <cristian.marussi@arm.com>,
	"souvik.chakravarty@arm.com" <souvik.chakravarty@arm.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	Chuck Cannon <chuck.cannon@nxp.com>
Subject: Re: POWER_DOMAIN_ATTRIBUTES in SCMI
Message-ID: <20250218163146.GB15753@nxa18884-linux>
References: <PAXPR04MB8459E8D1A82DE43C08B6C26788FE2@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z7Rjyy7_Jg66vqCf@bogus>
 <20250218130823.GA17099@nxa18884-linux>
 <CAKfTPtBd14wM2st62m3tnkQOZgBTUmxpjZXghMVff-Yg7wCVDg@mail.gmail.com>
 <CAPDyKFq9QHw==2WqcThC5mjMy8ALqmZ_hKxt2QsZJ1q-qixLfA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPDyKFq9QHw==2WqcThC5mjMy8ALqmZ_hKxt2QsZJ1q-qixLfA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG3P274CA0015.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::27)
 To DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|AM8PR04MB7748:EE_
X-MS-Office365-Filtering-Correlation-Id: fef22855-5450-40fa-ca5c-08dd50305d7a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RTd1TVliSVJKczdiaExOME1SQXpmSU9uSGk4UlU1SitaSXVJQ0VJaS9UaWha?=
 =?utf-8?B?RUwvd2dCQW1qWFFLVnV1dUFtdmZnb1lPaGMrS2JVc2Vob1FzKzl6ZlB0eHNw?=
 =?utf-8?B?UlFORXdlb2I4VU1SYk5SZ2p4RzdteFAyME9PNkpaTm05aDVlVGQwMjRIVW1z?=
 =?utf-8?B?ZXhuM2hMb0xlOE44U0s3akptT2RINExLYVNPMUhXVWVyQXZ1OWlRZnd5VHd0?=
 =?utf-8?B?RGduaVlUWGE3aElxMmlMblBwQXlmQ3ZUVlYxZWlJSVV6Rlh4VmF1OERxeDg0?=
 =?utf-8?B?Rko5VXAwNXV0WUhwYkhsc3Y0MmxQWnpZa2kzZ09yN2pTYWt1Z0UzbGN2eVpD?=
 =?utf-8?B?US9UYk5rSUd6RTJDcFJGOTRvNXc0WkhMQ3d6OVQwMFVLTVlwcEI0cStuMXd0?=
 =?utf-8?B?YXN4ZFZVcmtvblJVWS84QUNLNHZCK1NqeFRPTTlhNW5xWFJCdHFDaVFFZUFY?=
 =?utf-8?B?RnJWbng2TGZVRUFIYllaTTJTUDJ4UThXV3lmR296b0dhZHlsSVMvSTVuYjhl?=
 =?utf-8?B?WUxuVHBOWm12Z1FYTEYwOUxjZnNiT1ZrU05aT3FYZGNwMnhhK2NVcnlEZjZN?=
 =?utf-8?B?bC9Lck1IK1FjTVA2dGVzOWsybFp5b1R5OHJXQXUwenBPamg1MFZ6TjRlQlgr?=
 =?utf-8?B?T1ZyajVMV0VHdW5mSEtSb21CV01Oc0QvRXJBaGpNT28zMWk1TXZZa0l6Ykdu?=
 =?utf-8?B?Z05oN0g5OVJQcCtIZjVxS285NFhjMXozSWJ6Q2JicWY1Q04xU2l3bkZ2a1By?=
 =?utf-8?B?cmQxbnVqdGY4a1dnaFpuOHBEVVA0amdrNnBvSjd1ZlBwL053Z2U1UnVPVTJp?=
 =?utf-8?B?S2RuYjdxT1ZkYTRTR2tHalBLR3lVVGxIOHc1QkdMREVidW5wU2YwL1VZT3JW?=
 =?utf-8?B?UVJKcXRKZkIxR3FnanhTZzMxTC9OVDlleWRZTUl3K1NxMHVsKzEyTVlNZHZP?=
 =?utf-8?B?Syt3TXgrYWFJc1JDMTdrTkE2RlNJZGZiNjdIUnZZdUxsdzFMbHAyTkN6MXZP?=
 =?utf-8?B?S01PWlkzclRwVlJMaUpKMjFqZTFLTkJLZVVRRHJPWGs1eGN0NTA0dHArNGgw?=
 =?utf-8?B?c09vUkgzNUo5YTBEZnFtdnIydW5TYkQvYUJYOU8ySzZaaGJ4anFjT3ZPSGhp?=
 =?utf-8?B?S3ZxVUdWNUNQSUdNYStvWDlYdEM5YURTMVpEZDdlUFhyTTJkTkpCN0J6YU9p?=
 =?utf-8?B?c2tZL3BIYlQ2bVpEekN5NVhKL2VGa0RvY09velZUZmMvd0FBSkVDdWhReVBl?=
 =?utf-8?B?OEJZdUtKMkdSL0hINFQ2OUd1SXl2OVo4ZkdRT3dTd1F1aytIMVR0L29EOGRj?=
 =?utf-8?B?dlZqdW1pZXg0TE14NmFZU043UGM0TlVweE9aRVA2N0tOVGg0MWJKYUhTWU5R?=
 =?utf-8?B?UFZDKzgrdzhjTVdxcy9kQ2VTVVhpRDJzcVBhT2VOV2E3ZVpTWUJMTzR6YlU2?=
 =?utf-8?B?akZUMkNaZW9ZM2YzeXd3OXhxeWtYQWdFK0NLTTBLUWh2Ull5MVExNUtlMUx5?=
 =?utf-8?B?aGFFanRmSFBCVzQyeFNRa0xuSEhncG9kd1pjQlk5Mks2Q29nTzQyMi9OaC9z?=
 =?utf-8?B?R00vbzYvZFE3WTRVOTlZN256VDBDNTRZRXlrc1V6M0xrZ25GWWVLWVpKZHhq?=
 =?utf-8?B?ZU90M1VJVldSb2gzdFRkaTFYN0VrY05uSVFUNmFpOHdRTnZJRTJhL1BQMm1R?=
 =?utf-8?B?cFg0UXZKOTQ5TzBWdFhNcmpOQ0hhUXlQdG5ZakdnTEZoNzFzWTljUmY2YUdR?=
 =?utf-8?B?UlRWQmcvU3QrWWVUN2lVbkVzbVk3Y0xtZXQzNlo1VjVydExKZld0R282Yktm?=
 =?utf-8?B?bnFDWEhaZ1Z5aHZlbzRybmJqVW5HSFFoQTFXRTI5a3g5VmNIVElEcS9jVlhU?=
 =?utf-8?B?NlR1WnNqSVFkQ1g1SEpWYmRLdDJTSWZvNW5xK0lNWCtUNHE2RHlsNjFjUkxO?=
 =?utf-8?Q?d92qlC4yCwFOsz+swktY1SGkNokVhodQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXZraW5KSmYwUmN1cW5oaVFlUjg5clBHbnl1VEVXdGlKTWQ3bmJtTDUwK2la?=
 =?utf-8?B?c294ZWY0RW5mUkdVWFdoUXFWRzNMYkxyaE9YUXBKeDRRaWQyd2tlbzllRVN2?=
 =?utf-8?B?U0h2ckFjUC9KZkd6c3drcXpOMER1Y3Vwb2NIdmFvckh2aDJCY05kZUJycEdM?=
 =?utf-8?B?VHlhQWtpczB0OHZGL0JiNHBGR3ExNFhBNkxzVDJ5Ni9LZkV4Mmx1Z2ZPQXBK?=
 =?utf-8?B?VWdpbDVWaDZxYmFkTm9ZbkhIWEtSK3c1RlZ4Mis2WkxDbXkxSEZMVEFLc1ky?=
 =?utf-8?B?djdMRm9iTGhCTU9HTTVSMGlENTR3S0JOMUhFeHRpeTNlZ0FkWXlMbVVBamxU?=
 =?utf-8?B?Q3JzMG9VVlRKR3BkdlpORGd4eDZyM21aajByMHljSDZlakczNzdLT0lnQ2lH?=
 =?utf-8?B?bUxQWGdqaVE2QVpvWFZIU05MY2M1NVdMQmNucHh6T1M2UklGWHpLUmFYMkhq?=
 =?utf-8?B?L2prOTVKd1Y2TEQ2ZWN3bXlxc0ZvWmUyK01lbmRFeHNHc1FSVlJ2eVV6MWJR?=
 =?utf-8?B?MnhIUnI3cTNPc2Z6SG5Ea3lFdjF5L1JTckU0ajkyNlpCbmpvZUF0b0JUUHl1?=
 =?utf-8?B?MllKUzJqUVUxUWhTbUc1STNkMGx3eGlWNWtrOXRKNzJzOUY1SkRmMjJnWXNw?=
 =?utf-8?B?dzR6aFVQV3lxVXhWWjV3bkRTdDc3TTBnV2RQZEF0MFFmVEh5VW85c2dUMCsr?=
 =?utf-8?B?UjRjTUFwcWNWamVuYmxhYi9XR0tGUkZvNHVUeWJ3b2t6NElOUjlNNmVqRzlu?=
 =?utf-8?B?WXY4cndFMEdvQzdMWjZJMGdOUWU0dDQzWVZhcW5EWExpOE1zVElWa2h2T1F2?=
 =?utf-8?B?M3Y0QzdqYTBBeXRJdWJpd0NQcWFJVWV5VzNGV3lDN1Z1Q2ZxL3dKY0NIMm9l?=
 =?utf-8?B?U3BQVUJaRHVmMTBuakxXbDdFWkR0RmdSV1JUczlqUjdoeDdQdU1IMXM2RHBn?=
 =?utf-8?B?dGVHZkVlUFhqRlAxRmJxRy9LRWtmS0RXSldNbkZvd293QXRxbm1jSDkvazFp?=
 =?utf-8?B?V2FyaDRIRk1qcDFjanF2UWhGMlhISzJjQzhhZWRpeitramwrODlZRnZjcldh?=
 =?utf-8?B?YVVkNXVhS1RnSVNIRWVHZnd3TWhyZitQK2dadWQzc21sRVNiUnZ3bFVPOHR5?=
 =?utf-8?B?TnVZMjNXaHl5SGVSOTlqSkdLUHVwV1cyNGZtNTEwRExjRVRhMDZEbCs2WUxJ?=
 =?utf-8?B?STFUVnVzd0I4VXBKZlBXRXdJT294NkRIU1ZaQ0U2UVVRSG54Nkp4a3Y2TU9Y?=
 =?utf-8?B?d29xYTdYQTUxS0FBK0xoZzc1TC9hUHNiYjcyRTh6V0FCRVdaTjhEUWNTOFBy?=
 =?utf-8?B?QkJ5d0RZRmJ1MDFRWnRSbWFkUmpsQ2FUNnEwbUc5VjZFN0RvOERvZHZmV1lO?=
 =?utf-8?B?MkQzV3VYdjlZcGpISjBxelR6NHdQYjJQcUR3bUtmZzMrWEc0TWVjQjlYRmVl?=
 =?utf-8?B?dVNkdUZQd1hDYkdUNCsrUmlacVJpbG1OcUFNN1BWM0NyYVFEdmEwWlFtaCtM?=
 =?utf-8?B?SGw3cHBtMXJpZ054VDJuckpaUk1zb0w2dWJOODVGSkpHQUpxQmxoNWVTb3lV?=
 =?utf-8?B?M1F1anpqMEFYN3NzM3l6YXgzZWFVckkrbHR0c3F1SHVaWUpYZ0JzM3EvR0Ju?=
 =?utf-8?B?VkpzTU9qL3ZJNFNjTnNkazJSUDh1SjQrODRIWTRTS2JnV1pXeXRyV0JrSDV2?=
 =?utf-8?B?UHF3dW4veEVyeXhwdHBieFdwMW0xYzZmeGJaSlhUTkl6NkZPNDhOcDZ5UVlP?=
 =?utf-8?B?d09VOTNIWlhmS2hCQXRneFIrZHBpV0FMbGV5MXlpdTRNS0RBTThoNCtoSVhp?=
 =?utf-8?B?WThZVS90Z29ndndFcE55M3MwQ1RodTR4Nit3QTFhY3ZNWDdHMUhIME50ek9V?=
 =?utf-8?B?ZHhsTDVKcStKVjhQbzlTZEU2K1lud3N4dTlPeXB1azc0cXBoSk8rZXRuY1VN?=
 =?utf-8?B?MHZPendrakFUMUVUcTZmdW12U2YxN0ZvcW5pUUxZYVI0dG5EYW1yTEM2eVRm?=
 =?utf-8?B?TlZUNk5EU2dNVVg4d25sRm1JZVdIQlppTUhaQzNqaEhBK3dxOVFyZjhiUjAv?=
 =?utf-8?B?YmZiN0pQeTY0VEVQcmZHS2Y4ai9HTkxyZmNWUGZ3Z3ZkalRtalZHVWNXZ2xh?=
 =?utf-8?Q?cWUbp5hgUnxqx7CYCDOdvy/Om?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fef22855-5450-40fa-ca5c-08dd50305d7a
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 15:24:41.4832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lEJv3D38fPe4e1JKfotwSXRfqgxO3gh488uSxZLxz10WVgweBbc7Dqwoh8kcV6qzpIC307p0d3VixqmvL1iirg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7748

On Tue, Feb 18, 2025 at 04:02:58PM +0100, Ulf Hansson wrote:
>On Tue, 18 Feb 2025 at 14:57, Vincent Guittot
><vincent.guittot@linaro.org> wrote:
>>
>> On Tue, 18 Feb 2025 at 13:03, Peng Fan <peng.fan@oss.nxp.com> wrote:
>> >
>> > On Tue, Feb 18, 2025 at 10:41:15AM +0000, Sudeep Holla wrote:
>> > >On Fri, Feb 14, 2025 at 09:20:27AM +0000, Peng Fan wrote:
>> > >> All,
>> > >>
>> > >> Previously I posted a patch to linux to set all power domains
>> > >> with "GENPD_FLAG_ACTIVE_WAKEUP" set in
>> > >> drivers/pmdomain/arm/scmi_pm_domain.c
>> > >
>> > >Yes, I remember ACK-ing that and now I am thinking why 😄.
>> > >The description of the flag GENPD_FLAG_ACTIVE_WAKEUP says:
>> > >"Instructs genpd to keep the PM domain powered on, in case any of its
>> > >attached devices is used in the wakeup path to serve system wakeups."
>> > >
>> > >Does that mean all the SCMI power domains remain powered on with this
>> > >flag ? If so, that sounds wrong to me. I hope it is not the case and it
>> > >is effective only if the device attached is wakeup source.
>> >
>> > Only when the device is setup wakeup source, the genpd framework
>> > will take this flag as keeping power domain on.
>> >
>> > Without this flag, even if the device setup as wakeup source, the
>> > device's power domain will still be powered off.
>> >
>> > >
>> > >> But in the end we find that some power domains
>> > >> could be in off state while it still could wakeup
>> > >> the system. And we have a downstream patch
>> > >> +               if (!strcmp(scmi_pd->name, "hsio_top"))
>> > >> +                       scmi_pd->genpd.flags = 0;
>> > >>
>> > >
>> > >There you go, so you simply rushed some solution upstream to carry less
>> > >patches downstream but this time you got bitten again. Sorry, but I am
>> > >seeing a pattern from you here and I don't really like that.
>> >
>> > I not wanna to argue here.
>> > I DO care reputation. If I do something wrong, I will improve.
>> >
>> > >
>> > >> So I am wondering to extend the attributes of SCMI spec,
>> > >> Saying In SCMI spec(DEN0056E)
>> > >> 4.3.2.5 POWER_DOMAIN_ATTRIBUTES
>> > >> Page 44 of 210:
>> > >>
>> > >> Bit[26]: If set to 1, the power domain could
>> > >> wakeup the system with power state
>> > >> set as off.
>> > >>
>> > >
>> > >This is not what the above flag is all about. It just instructs genpd
>> > >to keep the power domain ON as the device attached to it could be a wakeup
>> > >source. They are not one and the same. If the device is marked wakeup in
>> > >the DT and it is both wakeup capable and is enabled, it shouldn't request
>> > >the power domain to be powered off when suspending. Why is that not
>> > >sufficient here ? What am I missing ? I am interested in knowing it as
>> > >it is important to fix the issue you are trying to address here.
>> >
>> > The flag must be set if the power domain needs to keep power on to have
>> > the wakeup capability.
>> >
>> > But in some case, a power domain no need to keep power on and it still
>> > have wakeup capability from hardware perspective.
>> >
>> > For example usb phy in i.MX95, its power domain is off, but it could still
>> > wakeup the SoC. But with the GENPD_FLAG_ACTIVE_WAKEUP set, the power domain
>> > will not be powered off, so more power consumption in suspended state.
>>
>> This probably means that the wakeup mechanism is not in the same power
>> domain but in another one that is kept on while the device is
>> suspended and the main power domain is off. Do you have more details
>> about this wakeup source that works with powerdomain being off ?
>> I vaguely remember some old discussions about inband/outband wakeup
>> source settings for devices which enable drivers to specify if the
>> wakeup source is in or out of the power domain and if we should keep
>> it on or not. But I can't remember the details; Ulf should have more
>> details
>
>Vincent, you have a great memory! :-)
>
>Indeed I tried to post a series (I can dig it up, if you want?) that
>allowed the driver to instruct upper layers, such as buses and PM
>domains whether the wakeup is managed in-band or out-band.
>
>An example could be an SDIO irq, being re-routed from a regular DATA
>line that is managed by the SDIO/MMC controller to a GPIO pin during
>system suspend. Another similar use-case with a potential similar
>wake-up configuration, is waking up from a UART console.
>
>My point is, the SDIO/MMC controller could be configured as a wakeup
>source, while it's actually the GPIO pin that is managing the wakeup.
>In this case, typically the GPIO irq can be managed from an always-on
>logic/PMIC, which means there is no reason to keep the PM domain
>powered-on for the SDIO/MMC controller during system suspend.
>
>At the moment we don't have any way to express this kind of
>configuration, I think.

Thanks for sharing detailed example.

typec chips using gpio to wakeup system should also be the same.

>
>>
>> >
>> > So I am requesting extending spec to give agents the information whether
>> > the power domain could wakeup HW system in powered off state.
>>
>> I tend to agree with Sudeep that it doesn't make sense to say that a
>> power domain can be off but the powered devices can still wakeup the
>> system. It usually means that the wakeup is not powered by the main
>> power domain
>
>I tend to agree. In general, I think we should always use
>GENPD_FLAG_ACTIVE_WAKEUP, but we are lacking a way to inform genpd
>(and other upper layers) that the wakeup-irq is managed out-band,
>which means genpd can still be powered-off.

ok. Would you plan to work on the feature? If you not have time,
I could do this, but need your guidance on the design. 

Thanks,
Peng.

>
>>
>> >
>> > >
>> > >> This is just an idea in my mind, I not
>> > >> write code to verify, just wanna to see
>> > >> any comments from your side.
>> > >>
>> > >
>> > >I wonder if we need to revert GENPD_FLAG_ACTIVE_WAKEUP flag enabling on
>> > >all SCMI power domains if that is not solving the problem you thought it
>> > >would.
>> >
>> > Revert the flag will cause a power domain not able to wakeup SoC if the
>> > power domain needs power state on to have wakeup capability.
>> >
>> > I am not sure other vendor's SoC design. To i.MX95, without this flag set,
>> > the NETC will lose wakeup on LAN capability.
>> >
>> > Regards,
>> > Peng.
>> >
>> > >
>> > >--
>> > >Regards,
>> > >Sudeep
>> > >
>> >
>
>Kind regards
>Uffe
>
