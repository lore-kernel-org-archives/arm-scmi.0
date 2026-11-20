Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795178243;
	b=bAxbSWkWT2mjWkiF4M/IAZ+TbMz6OVW5bWeZQba9ONfzboNsWF3shzeTQdzIhwWdKrlX
	 bSJWbuaAVE+iycg90vXpH5esKxDdvKjeoQXumuIcl6MhRE778r5Weh8n10ZNFpc0BwxUb
	 BwhKDqw3UwzOxa/NvkZ9nFBtuxyctsOGpDPynWhyA5NBcxhrmwPHaSZMs78RocKH3Ow+J
	 pPm4IA0Zr7auItnHwgLeafACl9IBRyvoc+IG0lYNGfCYQWotclB1LOw9hKlE4zv1LOu+O
	 9l9KusJUIkNmWS9S9tAWiX6FH8SzF9dTIgxYVczMJ/7BlMY+wf8JOURN6Su1DJr7wdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178243;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=wJrI+9N4MzZqIQRG1f8LAJK4L2eEZlfK6cDW6Wa1rWw=;
	b=LBFzMRXYyDlhilpAp3ijEY+T3E2WosMuUNiG5JbQScyHVGwdHz8UXkl6+RWDE4+LG4MX
	 JaMT3HR7CcvODVZEObTggu6jSo9L2iy64bHpBTMA5Tx7sWTWSgAcdv0cOiqg/bN2dkFPy
	 t6p/7Q2AS7w0QivH5LUl9ctErNEImZ1RMx4rJkXqjPrNVhEZsrAKQQzT6q0Gpas9SCvc6
	 thhSwa0Ytl1oK7YPv3DmoNqaEfjOac+SYssNua3mWQhfqgD5Qd0JnhwUv/XM33doJG3EB
	 r7WeMHnmmRd0TMu1VNFOTvLDPStuZYQbHpLh7wUAoDhVMZFXCP2OhVUTW/bWGeNdguA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ynXBeZRt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.49
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012049.outbound.protection.outlook.com [40.93.195.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D53606A326;
	Fri, 20 Nov 2026 12:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8D53606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ynXBeZRt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RQJ2Z/BCeYgjTKOc2EKUDygEmr5bCSz8k14430OidHEug5jcm9c/F5Hio41/chjTn62e6TYYVpcd87Nu+OADQsLSGnKyDUN/iv22CuJO59CNMDv+/GN5coy2hq0pCWZTU6SLS08x8ste5TCK5W/o04Hlvrmwz6uAxen6l0+dfWyztPMBbzfrxEq09gxuRhhxruzfYbwVzgO7U30Iet304+nJ38sb1xBHgMHCOTiepVYxys6sOJ7OQdMazn8r7thK89Oi/FRYNn0vn4vA9LytjD1mq9KAZtkQ/aYy4sZbJGGVY6lUF1JfkFYX98cqkpqqw3/Tbxo314hs0bo3l71GsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wJrI+9N4MzZqIQRG1f8LAJK4L2eEZlfK6cDW6Wa1rWw=;
 b=I9h6NCKDOw7p/kWnUvk0WiszR0uYl/kqNFL+7TL9COEPS2MT32Lit76JTOyMmfTCZe5u8zpDfC8t4gTrMYYCMOIxyI6Ph/rdwsAGAVRuNLGjGbGmPHgsEjgMjrJNwfGtnRlrfqzCe/HxC03sP+pwjzMv5guVFeH1/Lq7D4L6p8PsGczaGmc7EiZpei608XkkCAufTe/TyFkJ15q8k29PiAGssBEzO5iULQ6JxO4gZ+uXhK6ZJHQYM5ktXUkaN0agZ6+WLX/yG4lub2PY3VyyVaHB8vrSV8NufwZYFtwWHoVBNEEEpQ4H1c1ffPgaL24Q9vxU1GkSyFHVoyJNCV6w3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJrI+9N4MzZqIQRG1f8LAJK4L2eEZlfK6cDW6Wa1rWw=;
 b=ynXBeZRt9gdlTW+2Ub2khj4hsk2Ia21mDhUPtJxcen4Gz9ePMO0gTWcKxo5I10CBW8UXhJQKC+CA/jMSwXmdEUAft4qdgHwmS24sFzQ6jT+5raJfQiYR70wC8vHR/xMNYBC/pmj2qTi6IaOpriKpRjv6XJ0C04zg2saJxvDn1qE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by PH7PR12MB7891.namprd12.prod.outlook.com (2603:10b6:510:27a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Fri, 20 Nov
 2026 12:37:19 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 12:37:19 +0000
Message-ID: <90f6f5f1-ac62-4dd0-828d-d16fc9dc773d@amd.com>
Date: Fri, 20 Nov 2026 13:37:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: arm_scmi: Drop the ARM architecture dependency
To: Geert Uytterhoeven <geert@linux-m68k.org>, Han Gao <rabenda.cn@gmail.com>
Cc: gaohan@iscas.ac.cn, Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <CAMuHMdUov1u3kXzBX3ZM8rRkBdLq_M8LwQ2VtxSEOH9w68Rr2g@mail.gmail.com>
 <20261120084335.3492524-1-rabenda.cn@gmail.com>
 <CAMuHMdUrCkbjJW3Ld1nFbfj_Dfa4YwhUoK5g7rAn89yz=bYy4g@mail.gmail.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <CAMuHMdUrCkbjJW3Ld1nFbfj_Dfa4YwhUoK5g7rAn89yz=bYy4g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0090.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::35) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|PH7PR12MB7891:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f4072f0-db57-4a04-ad50-08df4703042d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|6133799003|22082099003|18002099003|3023799007|261009223027099003|4143699003|56012099006|11063799006|261026140227099003|261102123227099003|261028144727099003|261021121427099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	0NCZiz44TSLPA7MGqtLm2T9MFGtGIFjjXaoWB7PimofPSKM8QdyyC+H2+ReSNz3xSP5SY0BIbq/ZQ2ExIUAIjckqhDQMpd+Baq+j44wM1jikR0/IRFzip9SnE0QSlLVQ+Vitq0t7FU85Sp2uprpGEcqt+RwXkl4hEKDBmEqAYA066Z7s53Z9wrpcBx7zBul/vmIDlFnr5gIpO32a8Ce/vA6QRK6ropZdhKLTUL46qQaidZnmr00optdNgEjYjA7pjLy4vxXnpn6hymX1ZLhzm26QxKWog43AY4Ch9X6pyI3dErlO7Vi8/J8d7GZS6rK0Luh5R8/o5dpln6yE8iJhLRpKo5PqTNSHW1GW0gvZiQioLlzlXvHeZtur1JMFsXehL2Vkye1yhfieqhc5Qdu03Jo2Gy3AdIFOTEu5YNbaBS+D9Ymy4qesWKXkIvkAHXySFFI9c5OxuuicBENsFR3jLPooGVuHBEy9dyxQdG6HpySwddXrwiYAQPhmXbjjKqqAXSjqNdccxhkJ46Xt1nNplRGFIXDHzwFVkWW6R1zaPkTdtY1WThUhIS9AV0Mu05FvhEWm0kwiubcA6hSowd7qfn3WYVXNmcGp1VjfrqsvoQOyQMG8WTVc1xgnn6BPvPVJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(22082099003)(18002099003)(3023799007)(261009223027099003)(4143699003)(56012099006)(11063799006)(261026140227099003)(261102123227099003)(261028144727099003)(261021121427099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUlEYytvVysrUjhsRG1XNEEzZVFxTk1NUlc5dzRpU3pCZGpWZWdBaS9EVURh?=
 =?utf-8?B?Q1RIOEVFQXRTK1F5aFBaQWU2TW9kUWJmc1dFQzcwT3Q4RFhER3NVZUhLT0Va?=
 =?utf-8?B?ZzZSbkhlTTNrUXJGOWlQNTlzWU9rVlhUeFo3VDJwQTBNRHZvMHZTS2hMc2Qv?=
 =?utf-8?B?OVB3Snk1M1Q5WEVFVExiNXNENUZFRENoZyt0YzhHT2FqNWM0Uk8vckFnMU15?=
 =?utf-8?B?WEZMcFZyejJoZlRkTGhiUy9XR2ZCbE4wcHVxam0yYnYwWlFZN2QxNGN4bEls?=
 =?utf-8?B?UFkwVUltbkFxcUNhL0VCdnE5Y2RYdGJFUXRwaFJBNzFiY3NmVUhNOG1DbDZL?=
 =?utf-8?B?dEgySFVLSVJSMmxXTHUxWDhiUHRhS1F5VHZ2VEdIMUZlTkZ0ZHUwYnpNL3hZ?=
 =?utf-8?B?aVAza2FwdXpPd2V6SHZybldhNlJmTkM0VmNSNUdOM25KNU5CU01SYjFUUjJB?=
 =?utf-8?B?dFJsRTVxTU5VcHBVV2xBVW8waERMdmhkd1QzbE13NkV0YzVPL1NvTEE4S1Ar?=
 =?utf-8?B?QmZsZThtbDhWZjRZMGgyR21ETnFEY01xWndyUFZYYjJ2ZzhpajlMS3A0UkZq?=
 =?utf-8?B?UHlHNDhJUWV1SWkzZENZUkdWcGp5Y1RlT09YVDdyTDB4Z1JIdzZaVjBTbjJ1?=
 =?utf-8?B?SXNzblZsM1Y4dit0NFRjZjYzS3ZiVm1OY0RTcGtiMUV0MDFleDFwWVU2MEJx?=
 =?utf-8?B?bkZIaWl0Zzk4UlY0SUx3SXNlSW1TSHJSOVZ5bWkreGwwdEVYSit0eHY2dUV5?=
 =?utf-8?B?QUt2eVRJSUhVNmFXc3NNd0k5WXBFSno3VDBST3hpR1h3K0lpVDYxbFJHamNZ?=
 =?utf-8?B?Yk00MzRFSEZTUHFFZ256ekRMU2ViN0l1d0lWQVA4UHcrbVU5S3JWRUkyQVZW?=
 =?utf-8?B?VWlYV1F0ZDdSajBBM0J6LzVPZGU2a1dVTXR6eFZDekZ0TWdQUTlidEZaTThP?=
 =?utf-8?B?NWhXRXFOVTRUN0ZDN3RPM2JFMFpmN1RUS2Z1RWhRWEZEejQyUmlNZkxTSkQr?=
 =?utf-8?B?VUpqZHFXcWh3dEdxeWMxNUJvK0JlU0MrYkJvWEQzYmg5REpTdGJPMlRlazFV?=
 =?utf-8?B?ZFZLSFJiMG11elE3UVR0bHB1YnU2dzZ6WkxRTllZR1Q1bTdaZVdJaFg1RlpF?=
 =?utf-8?B?cThJYkxDN2tFLzNPQ1k0RWs2REcxNjVGQ1hyWTBoMGJSTGtsODFWY1lsMldK?=
 =?utf-8?B?M21rWFUwVGZhK0FpYkJSNTdkdWk1cWpSUWh4am5SSCt1MVZsQTFyWnFNMGJj?=
 =?utf-8?B?YlhwcnFVVnhqcUhxcVl0dDA1eFlkWDFYNVpkWktOVUFxNXZDSmo5OGdHZ3Z5?=
 =?utf-8?B?S1pCZDJkMzRtck85V05sYkJEZDYvQy8xVWkvWjhjRXMvL0dkSEVtU1NBVGZj?=
 =?utf-8?B?VE5rY2hnanRCNnNSWHdsL3V3Q1dyQlhMQlhCYktwZWZNNXY5aGRHRHY4dE5W?=
 =?utf-8?B?TDlwWVQ3NVNwcldZT3FiRkZSMDYrMGhjVXZ2bGt0anpQdE5QK09OT0V3VmZW?=
 =?utf-8?B?ODJZVmRuZVV3UGVtZ2RSK2pIMGpqY3hpL1RQY2kxdTRzbXIwTk9NMHBjNExN?=
 =?utf-8?B?U0tFVHArWjN0QVBlU1hGVnZ1VUZrUyszUjNNUXhsZ092QjJwcXhmRnN1ajdk?=
 =?utf-8?B?QlpDSWRjdlBXUVZ6MTVMVVZ5VzBsY0VqRm9FTU1pN0dnazBJMXBOSjdUQWla?=
 =?utf-8?B?c25ZT1JtNmFZMHpLbG5md0QyMk1QN2FWR28rUWtwa01QM3h0SnJSYU1TMlRE?=
 =?utf-8?B?WGxZQVFzSDFUUGRvbmxxYnJmWEs2ZzBwY25yOWpSVm9MUGZjUVlETlR1QXN1?=
 =?utf-8?B?QzJObG41YVcxSzlNV0pHN25lUWpiUmRVbjFpUmswMVJoNVBlaGI2ZkczT3h4?=
 =?utf-8?B?MENHY0RXMGFkeGt6anRpVzFDa3FtWEVPcncxdnVkcWFVcmJzVTlOcGJuUGJv?=
 =?utf-8?B?cTByTlhBcHpTSHF4bjRiM040ZVI1NXJaZEJ3aHE2dnBGTExIUDZUNkViSW9E?=
 =?utf-8?B?cCtaQWNnQUJJdUt2MFgrRzVpaVl6aUMzaE1mNTNra1h1U0FKZnBpYzEvQVNY?=
 =?utf-8?B?SUgvYjJhejlkNUxpT0hyZXhMMzd2eWpNS0tLOXM0bGNUTFZvcHpPOUcyLzdJ?=
 =?utf-8?B?RmdvZmhQaWhPTkY3YWV3eUxERmIwUm5RNnl2UGZtd2JnejAyTFFvREdtTHQw?=
 =?utf-8?B?S1dLSEZXOXR0WHJuYlMwOWtxRUJveUlaaDJVKzZ4R2xvb2FwYjFLNWFZaHZC?=
 =?utf-8?B?NnB5dE1DbGRBem82eE1MN0NDSU1hRzQ1SjgxUHZKQmh6VzIwSDJya2hRWTND?=
 =?utf-8?B?Uldjc0xoL2NFbncveDhjQThDKzRtRnlSZjlhN3h1NzduemswdzJJQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f4072f0-db57-4a04-ad50-08df4703042d
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 12:37:19.2763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aGkf5NPD2VXGJ/U6Vf+iGTmD2QOXRfBmf/WA9q/hVcvl+nNQ+jw9MBKWMtv9QFis
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7891



On 11/20/26 09:51, Geert Uytterhoeven wrote:
> Hi Han,
> 
> On Fri, 20 Nov 2026 at 09:43, Han Gao <rabenda.cn@gmail.com> wrote:
>> On Fri, 20 Nov 2026 09:26:47 +0100 Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>> On Fri, 6 Nov 2026 at 20:40, Han Gao via B4 Relay
>>> <devnull+gaohan.iscas.ac.cn@kernel.org> wrote:
>>>> From: Han Gao <gaohan@iscas.ac.cn>
>>>>
>>>> The SCMI core and the mailbox and shared memory transports only use
>>>> generic kernel interfaces. Transports that need architecture support,
>>>> such as SMC, already carry their own dependencies.
>>>>
>>>> Drop the ARM and ARM64 dependency so that other architectures can use
>>>> SCMI. Depend on HAS_IOMEM instead, for devm_ioremap().
>>>>
>>>> Suggested-by: Michal Simek <michal.simek@amd.com>
>>>> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
>>>
>>> Thanks for your patch, which is now commit fe87ede443a15969 ("firmware:
>>> arm: scmi: Drop the ARM architecture dependency") in scmi/for-linux-next.
>>>
>>>> ---
>>>> This was patch 1 of the Zhihe A210 SoC series [1]. As Michal asked, it
>>>> now goes on its own through the SCMI tree.
>>>>
>>>> Since [1], it depends on HAS_IOMEM: Sashiko found that UML, which has
>>>> no HAS_IOMEM, failed to link devm_ioremap().
>>>>
>>>> Build tested on x86_64 without OF, i386, loongarch64, ppc64le, riscv64
>>>> and arm64. On UML, SCMI can no longer be selected.
>>>>
>>>> [1] https://patch.msgid.link/20261103-a210-scmi-v3-0-ee6b31580808@iscas.ac.cn
>>>
>>>> --- a/drivers/firmware/arm_scmi/Kconfig
>>>> +++ b/drivers/firmware/arm_scmi/Kconfig
>>>> @@ -3,7 +3,7 @@ menu "ARM System Control and Management Interface Protocol"
>>>>
>>>>   config ARM_SCMI_PROTOCOL
>>>>          tristate "ARM System Control and Management Interface (SCMI) Message Protocol"
>>>> -       depends on ARM || ARM64 || COMPILE_TEST
>>>> +       depends on HAS_IOMEM || COMPILE_TEST
>>>
>>> Please extend the dependencies to RISCV (from the link above, I assume
>>> you are targeting riscv?) instead.  There is no point in showing this
>>> option on architectures that have no users of SCMI; one already has
>>> too many relevant symbols to configure.
>>> People who want to build test on x86_64 without OF, i386, loongarch64,
>>> ppc64le, ... can just enable COMPILE_TEST.
>>
>> Following Michal's suggestion[1], I'm dropping ARM/ARM64.
>>
>> [1] https://lore.kernel.org/all/3d38c4a5-1a12-4af1-ac2e-413a457ce4c5@amd.com/
> 
> Yes, I read that.
> 
> For reference, other firmware interfaces are also not exposed to the
> whole world:
> 
> $ git grep -w ARCH_SUPPORTS_ACPI
> arch/arm64/Kconfig:     select ARCH_SUPPORTS_ACPI
> arch/loongarch/Kconfig: select ARCH_SUPPORTS_ACPI
> arch/riscv/Kconfig:     select ARCH_SUPPORTS_ACPI if 64BIT
> arch/x86/Kconfig:       select ARCH_SUPPORTS_ACPI
> drivers/acpi/Kconfig:config ARCH_SUPPORTS_ACPI
> drivers/acpi/Kconfig:   depends on ARCH_SUPPORTS_ACPI
> $ git grep -w "config EFI"
> arch/arm/Kconfig:config EFI
> arch/arm64/Kconfig:config EFI
> arch/loongarch/Kconfig:config EFI
> arch/riscv/Kconfig:config EFI
> arch/x86/Kconfig:config EFI
I can see it's usage with x86 too.
Microblaze is another one which can also use it.

SCMI from my perspective should be open for any architecture that's why no 
restriction make sense.

Thanks,
Michal
