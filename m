Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2053.outbound.protection.outlook.com [40.107.20.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FEC241136
	for <arm-scmi@vger.kernel.org>; Tue, 18 Feb 2025 12:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739880212; cv=fail; b=l3iq1c7kw2oK9OqERBYDz611mEVVEwe12psDD6HiBKulbzgyeAA+ogEQvjAgSmLEN7oqTRRCPWnDualBHICM3ra0w+ck58PRJUsKZaYWuWmEaFa4wtOZLACPncYoV6ug6F+jeDQrZeLa3XInOlOsrLZ1dZndd1knD331Z17YIio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739880212; c=relaxed/simple;
	bh=AGyjqL7zlGZVBzg+0VjqZv0Dc4l6mKB+H1Z7PS7xOmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XsXC//UIzw12IOJ3MTqdiwdA7PGgeOSW0Ah6jgQSYkZ8vPvS5V2uepIgpgCXDKpvQ2GXcAJjfZQ64h2X/1dZyEt/6tIf99/gFIuG2iCw/legun8EiHoChZwK2JoeANNDANBzoRormRUMhCovQ1BrhDS2bEdP8OyeH8u5aQSECOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YuSAUQbI; arc=fail smtp.client-ip=40.107.20.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YuSAUQbI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=anpbOo9ZYDUADON10C/7vbrOf/pXOUn2mToHrYNAt7JFOBQwMoXf8VEJCyO+g+2J+felgWmFC9Sn72aZfoYiqPi7YcF065ZI7Cn2cAH/uFD56XjZVMbDskWsLP27dNpWRENWNcFicDOIK8zeJzF6oVqyNE0WoZa9Z+T37iDFH2CiEtlJur/0obzC0ii2RPZ/A+ND8M1gAoPsZ0u8icHmMP9QVmsn/dT10XDlxI4cMRcdaQuhqyXfs4bHC3dVaWCzVRV8xdh3AQJjeYJaODNqYxeZ2tsRmr/HIFHvyvRajFsw7jkI2DV5wZC+HWLbYfgyc3jVWf0s2OM9uRqjOp8PBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8DkXnreHrbsZY5mgM90XBNMhAFcxrvNzd2XIkUyf8Dc=;
 b=ZFV4N+Q05dFbSF+BqbrYW3HX/16+xWRWeuaPFUjSul40DU4baOAABw8/zJ2jWT+bDsGm8LfDDeET4OUQ9/fxpaM7NmBaP39+yWnhWK0RaGoTFB6e+caM10Fb44gwf2g8Pj4xE/cpkQ3CZc7P6jPQewv8nJH5UPWd2Jj84v/huvnPPjPx578rB3EcMzvAMw4mxlvo5r6pIqXqYXM6ZnFDXfE+cm9vWW32xgCjvRib652THUZ0RQwcmIiU7v8n+kh/YoT7x1swFZqI6E+hrYzv39cYpuRIE04GP29lpSshYrkmBzOP+IIA3Uw2DAOfSUQvKA2uN+nJlDT9AjsK3kH9mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8DkXnreHrbsZY5mgM90XBNMhAFcxrvNzd2XIkUyf8Dc=;
 b=YuSAUQbIKvi/e3e3tlyDkKF2jvagOHFZB3pXG1G7WBLtxRGdPLYlJAAPOfCmVFP2OZcXi2ynxFRh+vmI8mZuOhFeegbAyhy5dKkQhUmXzKvCpP61b44Sj2VWPgTTsEG06oOf/5erEYwEpp0t9YwV6LBYcImeCFuQScO1uYIeKXe1LkrPXIoinAdQ8axvPwjwdhnVWsQ5nKwVZjNpyhnXzsijxBFKiYHf1OUCQ7GxeBVVUJEGv4lS0xUn+e/4OfJu3fXMCW0xFfWgvTdTRRcpxRV8h1LRZIN5orkP86cOBQXmAZW/3ZD+G563HOB4ZkNMwvMnPt25tE2cW+atTA7K5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by GVXPR04MB10149.eurprd04.prod.outlook.com (2603:10a6:150:1c2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.20; Tue, 18 Feb
 2025 12:03:27 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 12:03:27 +0000
Date: Tue, 18 Feb 2025 21:08:23 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	"cristian.marussi@arm.com" <cristian.marussi@arm.com>,
	"souvik.chakravarty@arm.com" <souvik.chakravarty@arm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	Chuck Cannon <chuck.cannon@nxp.com>
Subject: Re: POWER_DOMAIN_ATTRIBUTES in SCMI
Message-ID: <20250218130823.GA17099@nxa18884-linux>
References: <PAXPR04MB8459E8D1A82DE43C08B6C26788FE2@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z7Rjyy7_Jg66vqCf@bogus>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z7Rjyy7_Jg66vqCf@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR04CA0155.apcprd04.prod.outlook.com (2603:1096:4::17)
 To DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|GVXPR04MB10149:EE_
X-MS-Office365-Filtering-Correlation-Id: 73ed92cf-1c8c-46c0-ddd1-08dd50144068
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?emxKcXphY1dkcXRtNDFOL3ZaVjQ1UWRYL2FLeGt1cmNMM0RudCtTSTR6OVNN?=
 =?utf-8?B?MDl1SXhmUFhPVUJTalEvb205aE01THdNRDByZTBKYldDbHNOdms1RUJFR2Ja?=
 =?utf-8?B?NDlrQlRuN1dVbXlWTUVyZ3FNcXJneUVWRVpWQ0I3TnRPbzBmUkdjTG1jSXRT?=
 =?utf-8?B?U292TDMrME9wZFE4bTN5cnltSi9JUzN0Vm0zZmlwUkZpOThJZVBuMmNSMjBB?=
 =?utf-8?B?OTMyRUVUZVA2UGQ4R0Vidjh5WWdWUnhBUlI1alQvLzkramQwSHpyYWVsUzBl?=
 =?utf-8?B?emlFa1VxSnA1Wm82U0VHOUlpQXpmRitCdzdudHJFQjlDdjIzcVg3Yy9IVWZO?=
 =?utf-8?B?UTQ0djJ3eUhaTFVobmx5Z0ZOMC9oL3dRTjduQzdCQlJkMWtra3pUSlJGTTFj?=
 =?utf-8?B?ZENBK1dRMW9SZEN6Tk9aQnVpNENySVFmb211aWxmWXdDVURsVzY3NlRsZVlG?=
 =?utf-8?B?TFdFWnhXOHY3bDUwTXQ4UDRoQzJ0YXozMzgyMVRKd0NTMi9ydWtuYWRNQXhs?=
 =?utf-8?B?NUhBZEpUWWllaWxLNUg1ck5CdTZvbFc2SGFwS3ZmQ3J4ZHY5TGVScnRpTEtN?=
 =?utf-8?B?aFpFZFBNclZlYkxZTHBnR1pKNlFUdkhzdlB5eG5jS01RbWxBVkE1QitnYXh2?=
 =?utf-8?B?TGpKQzRyT3dvQzJKSTFaUFRIM2pIL1RWQWFWR3BsdXJjOW5Sa0wvOHpnVmVC?=
 =?utf-8?B?YlMrWkJuZW9lQUlxUW8rL3g1MEtNT1U0MGhmZ3Q3UTFNYXFwMmZzRHNGNE4r?=
 =?utf-8?B?azhLQXQ0M25lL05PTVhQNWtvZVViQU9IZ1kvRThFR2lkODBqZDBQWStxSHVR?=
 =?utf-8?B?V3h1QnpXcklkUFRKbFcvK1dzTzhkV3FDVVU3ZGlYZTNlM3E1QnRTSHBIbG90?=
 =?utf-8?B?dW4yVkN4OGZrbXprTG5tYXBXcWhQWDRiNTZyMC9waEVueERVVWxCL2I5RlFM?=
 =?utf-8?B?SnZHQkQ5K0MxZUc2TGNjK1FJY3NPR0VQcEM5YWV2NGQ4TDhnMzB0cTJhMEhI?=
 =?utf-8?B?U1BUeXhnaVJqbStSY29tUk0zS1EySm1lT0JueUY0U3FCV1k5bW4vTnl4OXkz?=
 =?utf-8?B?am0rbG1kZjVyREhSeUZDbDR1UzQzNDh5ak44dVQ3YTVJeDJCSEpiVURnbGlS?=
 =?utf-8?B?VlhnTmluRm5ZeWRERlFXQnpVbng1dHZWeVc2UzBuKy9yNHdkUGYvalVtemtx?=
 =?utf-8?B?OUFhODM3UEY1YktIelRKT0dDVGQ5RWNnaTV0bDZXOFJuQStaZk15MkFZVEdN?=
 =?utf-8?B?aUxGK291WEFCUTZSVnJMMTNFeG8xeXZLaDNHZVBMMitOVkJ3MWZ2NW9VbmZl?=
 =?utf-8?B?VC9FZmhsMk8xSWo2MHh0enk0cDZZYzZ1bW5hM2diNERaMnpYVHVKNDZZUlUz?=
 =?utf-8?B?bHErbE1XMGpSZjh5NlQrOWNxOXlnV3hjWE1vYys1dWFPOGIyMWhTS3JpcmxR?=
 =?utf-8?B?MWtjRnlNcjhzQnVCaUZsSUxBQ2VITGRuaGVUN0lKSmRPWWRZV28rVFoxajZj?=
 =?utf-8?B?YjdUWFQ0UVZ6aGlpcU5vOU5nbEVPNUxhd21ZRjdoQVBBbXNTTUpMYXRoNHcw?=
 =?utf-8?B?a3VUOUZyWjhZbE1VTHRNaGIvclBSRkdoZUJQRU9NTjhibmkwS3ZpaUZRbXBp?=
 =?utf-8?B?bVVGVFBOYXk0QzhZejUrODdCY0RpSGRsUFk1VnY5VE10YW1qdUdkeVoySEF4?=
 =?utf-8?B?RnNqNmJTb0hzTDZtRndicXNjQm5HVFNuZkFRYlExNVhNUnYxZnNoQ2F5clVw?=
 =?utf-8?B?VnFsb1o4UUR1cWlhMVRIVmV5ZytWM0Y1U0ZtdGN4eHNvU0pRc25pTGZrZkRp?=
 =?utf-8?B?dkplOXFFcEhZSTl0cG8rV2dSY1ZteGZZUlRmTmNCRXlxdUtaM0FHVGpqdkpK?=
 =?utf-8?B?a3MvUVlyejNTMWRKVUd3YTV6dFRVb0hTaUl6SGZhQVpxMjEvYkpJb2cwbWI1?=
 =?utf-8?Q?lZltwZtPwjIRNC98Su3unQ4cBtbTIS5W?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Njh5ZjBZSHJQeHNWU2NKRllSQzMrRVp2WjhYYU9TTm1oZjZUTkFpSzMvN2tv?=
 =?utf-8?B?TW1BOGNGT1FyT1lZSE82ZWN3UlZaVlFKOUVTK2xJNVBEM1VTWmwrT1lTeTMr?=
 =?utf-8?B?bk4wTVNFU01iUWwwNTJGelI2bHZJYUxwOEFkQitQUkxsdCt2NUpwblNpblNk?=
 =?utf-8?B?WDVXaGxIQXIwQjBDckZrVHYxUUN3eXFYQm96Qyt5dUxqMEc3YnFYOWhvN2c3?=
 =?utf-8?B?T1l4UDJteDMyMnVRcUFyRmMyV3pIRGF1SGk2RkwwT2tlaXc5UE9UejRLK2RX?=
 =?utf-8?B?Q01BSE0vbk5mTU9ZUjJRcmFpUUk0cnlJWVZkbGZ0ZlpDZkJORUZyZTh4dmlE?=
 =?utf-8?B?azNKVnhSQ255UzBiS0UwditEM2xRREVnTE9mTWc3TDV3YUVDR0g0eU9HaDlp?=
 =?utf-8?B?aXlUbTNSV3JwN2hybnNBSFNSNmxrUjhrN0crVVV5QzhzYTBZVTZnemNkNVNm?=
 =?utf-8?B?bUtnVkhFU3JtVmNMSnRheVVWZG1sWUxGWGZMTmhNTWVWOERHYis1Ylo1YXFO?=
 =?utf-8?B?T056MjBNaE9acmVDUVJlVDRrYjRKV0c5TytjUzZLa0JMbEU4eW5LT0ZKU2VE?=
 =?utf-8?B?SzdZZGFXd2ZFd0Z4ODNrbTJoSkF5WlVxK2JGSTRvcEttU1o4aFk4SC8yd2NC?=
 =?utf-8?B?NTFIbktsd2pFSVk5SVF6Y1RsakZhQUFwd2piWHFtcUtPZjVtQzMyTTR3WTR4?=
 =?utf-8?B?NmhiZWZiQ1V0dncxMloyK25qMHh3bzhXR0tna1lFeFhRSHNCWDI2UGUrdzJF?=
 =?utf-8?B?NFZNM0tDeTNzS3RqY01IeEtFdGkxMzcxMTlWakxSbWpxek43YUVJT2NSSXAv?=
 =?utf-8?B?dUJXZTJ4a25DR1cwTUdOMUxwcmxYS0JzUWdMVit0OTNXV09VZEc3T2Q0b0tP?=
 =?utf-8?B?SWZzc0ZzY0lRVlI4dWhoNnZmcStNWFUvZStDcXhuTm9NNnVKNFRsQUExSERl?=
 =?utf-8?B?WEpUTHcxSHlTeFg3dEcxN2xadkxkemxnRDdneU5iUWJhaVJBRGZzVStZN0I3?=
 =?utf-8?B?Ulp4QnU3UVAzOE1tR3hJQTdFcWpQRDRxU1FKZ0tFNkIybVdEZk9FYnp4M2NG?=
 =?utf-8?B?N3ZabmlBTFlHK2FLdWhYK0FSdFc1RzBOOVpvVnVuQ1dwb3laK2xFTWIwWFRF?=
 =?utf-8?B?RnFtRXZpS1hPVGZoc2wxTDJkSmhCQzV3bmxRd0g4aHBucGUxQXcyQy9UMnJh?=
 =?utf-8?B?LzJVM3lSWEpIaGFvU0xmZCt4ZmlnemxXT0lXOGU1TkRNTkpXbmV4YWRyVWdJ?=
 =?utf-8?B?b2JWeng4OWY1WlhkT0FETjBRNnJIcG9wc2duTi83UVdjUUxpRnRkaWFidysy?=
 =?utf-8?B?QUxBNmt1U3hBZXJmYjFMaTZyTmsxV1hGd1JaWm0wa1ZGNng0OE1pcENVOEFW?=
 =?utf-8?B?REpqS2w1RVBleDRYUStGUE5OUks4RjA5bE0zVWNzTWtVREV0bnY4bWVISFV3?=
 =?utf-8?B?QjZxZTFFcTBWbVFpOXJ1dUl3R28xbk5KbXVQdXlXbkkzYVlMUUpJaDdERWth?=
 =?utf-8?B?bFhuREtIdzk4cHZ1WmwzbUNzWUJJMFlVaUpUQUEwb1puRUN5TXJNWjNQd05M?=
 =?utf-8?B?ZHYrSFlHNXh0RXNZbWRCQXQ0SHdCY2FFdys2WGdaMEIyT09QLzVFbC85U0hu?=
 =?utf-8?B?RHFKM0NrUWFmTHhtdERNcWh4RkdKUWJRcmZMN2k1RUR0K2loMkUvK2dIc1JF?=
 =?utf-8?B?TURYdlNLYUlWRy9aRjF5bVlLdWZIa0ltUjkzZkRMTXFXR2UzWEg3cVZ3a1Bt?=
 =?utf-8?B?LytjajVXOUxFUmZmSHlPa2FOME1ocXo1VEpnYlhhaWowTDhUV0twOExEK2Vq?=
 =?utf-8?B?cFdKSDF0RGJpaDdSa2tqeHdpK2U1eTRGSTFLdWpZS09wU2V5eEFjTmVMdXNh?=
 =?utf-8?B?UUNZam9EWlhKLzlRZkpOOWx0MStiUDY3UkJtbzVhT3JnQW56eTdQSTdBdHl0?=
 =?utf-8?B?WENoZTVpZCt0RkhjZC83UmM5SDRYRGlKcUVSakEvVVFrRkhjNUx1am1pWTlp?=
 =?utf-8?B?RDBYai8rL2JQYVJBN1pSdVhHZjd2dWlRNjFRWncvS0lzS0lTN1dlZ2hmclNX?=
 =?utf-8?B?eSttakZKUHRSSE5QRlR1TTNnbDcvdyszWDR4aGpxMjYwcjJUaHo1UzdweFh6?=
 =?utf-8?Q?SoC4J7Qr0zMOqQANF0YAjkodr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73ed92cf-1c8c-46c0-ddd1-08dd50144068
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 12:03:27.0292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rib0U/N2MHqYr190uo/NHb0AGtnLInasuwvTBpKhonk8Tul+5w24C7CjlG7VLlDHUpQzjgPSjhVNeb/849vMyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10149

On Tue, Feb 18, 2025 at 10:41:15AM +0000, Sudeep Holla wrote:
>On Fri, Feb 14, 2025 at 09:20:27AM +0000, Peng Fan wrote:
>> All,
>>
>> Previously I posted a patch to linux to set all power domains
>> with "GENPD_FLAG_ACTIVE_WAKEUP" set in
>> drivers/pmdomain/arm/scmi_pm_domain.c
>
>Yes, I remember ACK-ing that and now I am thinking why 😄.
>The description of the flag GENPD_FLAG_ACTIVE_WAKEUP says:
>"Instructs genpd to keep the PM domain powered on, in case any of its
>attached devices is used in the wakeup path to serve system wakeups."
>
>Does that mean all the SCMI power domains remain powered on with this
>flag ? If so, that sounds wrong to me. I hope it is not the case and it
>is effective only if the device attached is wakeup source.

Only when the device is setup wakeup source, the genpd framework
will take this flag as keeping power domain on.

Without this flag, even if the device setup as wakeup source, the
device's power domain will still be powered off.

>
>> But in the end we find that some power domains
>> could be in off state while it still could wakeup
>> the system. And we have a downstream patch
>> +               if (!strcmp(scmi_pd->name, "hsio_top"))
>> +                       scmi_pd->genpd.flags = 0;
>>
>
>There you go, so you simply rushed some solution upstream to carry less
>patches downstream but this time you got bitten again. Sorry, but I am
>seeing a pattern from you here and I don't really like that.

I not wanna to argue here.
I DO care reputation. If I do something wrong, I will improve.

>
>> So I am wondering to extend the attributes of SCMI spec,
>> Saying In SCMI spec(DEN0056E)
>> 4.3.2.5 POWER_DOMAIN_ATTRIBUTES
>> Page 44 of 210:
>> 
>> Bit[26]: If set to 1, the power domain could
>> wakeup the system with power state
>> set as off.
>>
>
>This is not what the above flag is all about. It just instructs genpd
>to keep the power domain ON as the device attached to it could be a wakeup
>source. They are not one and the same. If the device is marked wakeup in
>the DT and it is both wakeup capable and is enabled, it shouldn't request
>the power domain to be powered off when suspending. Why is that not
>sufficient here ? What am I missing ? I am interested in knowing it as
>it is important to fix the issue you are trying to address here.

The flag must be set if the power domain needs to keep power on to have
the wakeup capability.

But in some case, a power domain no need to keep power on and it still
have wakeup capability from hardware perspective.

For example usb phy in i.MX95, its power domain is off, but it could still
wakeup the SoC. But with the GENPD_FLAG_ACTIVE_WAKEUP set, the power domain
will not be powered off, so more power consumption in suspended state.

So I am requesting extending spec to give agents the information whether
the power domain could wakeup HW system in powered off state.

>
>> This is just an idea in my mind, I not
>> write code to verify, just wanna to see
>> any comments from your side.
>> 
>
>I wonder if we need to revert GENPD_FLAG_ACTIVE_WAKEUP flag enabling on
>all SCMI power domains if that is not solving the problem you thought it
>would.

Revert the flag will cause a power domain not able to wakeup SoC if the
power domain needs power state on to have wakeup capability.

I am not sure other vendor's SoC design. To i.MX95, without this flag set,
the NETC will lose wakeup on LAN capability.

Regards,
Peng.

>
>-- 
>Regards,
>Sudeep
>
