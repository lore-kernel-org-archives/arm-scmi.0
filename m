Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013014.outbound.protection.outlook.com [40.93.201.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954ED3769EA;
	Mon,  5 Oct 2026 12:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203788; cv=fail; b=a69V6xda+pOWMkkjhZsuBpKOoOqmweO5+Dfy5maIGAxo7m/0y1OjSh81NOf1/8KGJpBQJi2kdfYbWFqp80kecdlFxgO5szOI3fEGnLWpsHglunJbdlemUVrcnX6Zl3xEcRDBwzuDE+JZrUf+BuJMvL/JlaMhdvhtmbJESKKoj0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203788; c=relaxed/simple;
	bh=+PkT9UXQSq2MuLWQeAMyrqleQjThJPWrTx04nmU2v80=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EvWoVKWb4uYKUtcO7uvSwZFRLPylHB3fEgk5VVayY1xtQorr/H8ZqglVCbDly9I3E0D1ickrFYysGQUlvmFEMDEPz4dox+m4fhn/4YTnl/8I5QzOiXeRYVXhEL/0nKLrWS9mYAXyUP3lOxPlbpQfDDAw+aZvb3p+QjoOjogJK8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LgmFRujD; arc=fail smtp.client-ip=40.93.201.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LgmFRujD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jF9uhFubjroBsPA3pYxl5D+0yQGp4KQHO99jztGxERW8vnqncOEvq0OKnCN3gppLlvRNTv8/0LFT1YrGv15ySzcdXg/LY6I40+mYRLgM9IdHeikFkldBJDIXBgumxeDYDx/6x+hreycvVe/RCMqWnR0gx6HluBrNYy2q6Da2ZWDlCjUiGKATvireHgNI3AR4St/z0MTj+F+gz9U0HI4e8RHxqosR3aztaz5MetFklpsSIpeXRwVqOXmDALcK+PGW5Xohn7m7l2eAUBifmtKffzg46QZPiJJZJmmYJpIEser43JNtD8xIyXB5+rJhc/Xux/SinUIXYm5rvFOQbVfxjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BG+5YBNP9Z3rH7F4HapNUkD3aDgpjQbJU5pKUZVOT84=;
 b=jlkebBenJYSw/An8Nj91u8RYK4diMDqjfI8aa95qfU9eNpTp7VVxv6hiBm0qqwWdcrihauHmAJ+csDIkhwBBdOF9WKc5kBpwJ3lLCP9oQlvywMMx/DEc5YCm4TQ/sLbFtrAnuaUOUgMpvW9vdVFgiBWvc+1KByDrn5lIgDcEi5tdjy7Y6W7b8zfOHjmamicqIgWcktvNBv0+J/c5Q0kNWvF4vBrLc0tx9WDyeaDwJ9gd2OoJpK7KJK1pvI3rFVVS7JUtIPdgwoy2/yAfaSKscYdJA1mQlNoQch7Bnvb8Amp7nvkyeWkvv6RbJEX6fR1PGTblM90ZL9+zSa4cgM9WNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BG+5YBNP9Z3rH7F4HapNUkD3aDgpjQbJU5pKUZVOT84=;
 b=LgmFRujD8LqoDzZtfXZnqFd9xBtuKqOujQZbCyODB4dzrA7F7v5e8VUdCTNnpeZjVAwoMUrvDV4jxXbVlbtj7Od3qE/Se9GVs8nojnX1RNzVYAWoJnbgCQ3ck6NHmXn33NekGODy5Ww4wOwQ7XyTbfLOLm99fTtelJCzBjAegD0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA1PR12MB7366.namprd12.prod.outlook.com (2603:10b6:806:2b3::8)
 by CH2PR12MB4263.namprd12.prod.outlook.com (2603:10b6:610:a6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 12:36:16 +0000
Received: from SA1PR12MB7366.namprd12.prod.outlook.com
 ([fe80::ec75:5e87:d973:77e6]) by SA1PR12MB7366.namprd12.prod.outlook.com
 ([fe80::ec75:5e87:d973:77e6%5]) with mapi id 15.21.0472.015; Mon, 5 Oct 2026
 12:36:16 +0000
Message-ID: <00a75d3c-f863-4ed2-aa3f-a6668e5f74f0@amd.com>
Date: Mon, 5 Oct 2026 18:06:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] firmware: arm_scmi: skip empty CLOCK_DESCRIBE_RATES
 replies
To: Sudeep Holla <sudeep.holla@kernel.org>,
 Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Cc: cristian.marussi@arm.com, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 git@amd.com
References: <20261001114538.671755-1-jay.buddhabhatti@amd.com>
 <20261001-persimmon-wallaby-of-popularity-c29bf3@sudeepholla>
Content-Language: en-US
From: Jay Buddhabhatti <jbuddhab@amd.com>
In-Reply-To: <20261001-persimmon-wallaby-of-popularity-c29bf3@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0034.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::9) To SA1PR12MB7366.namprd12.prod.outlook.com
 (2603:10b6:806:2b3::8)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB7366:EE_|CH2PR12MB4263:EE_
X-MS-Office365-Filtering-Correlation-Id: ea24e382-f59c-4ac8-a4fb-08df22dd3fba
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|6133799003|18002099003|22082099003|10067099003|3023799007|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	z4rxymiBPn51fXgykJoga1p1F5xNv8XB+5F0udSiABsvV/MjeFtTWDHEoD/52Knstiu8K2vHZjq4no0ybtlxzX+v+OIQtkJfaMhS3T52kHfo8vCNh5q9pQ2sVtHEnsDIJqGMyi/qQommXf/NC0eIMTzaXWglD0LnSyDYavfpypFJZbnl1JLHKVu75QRJqcmpBLIVndriKO5tDwk/1t5EGctw1oUo1xP5lL+C9bGhk5QaCLQVf+1maIz2G9SiIAOe0HRsXOYHO0E05aM2ZZE6P6Ju/R71sChSAKgUOlJXOjjyeOdcUx/IUM9tpnkhQ7VeZbTgnBJi5PT0/NL7xi+sxVJ9orgIT+f56sq3RZBtVQ89Pxo8F/f+8QGGHOs02fkeU8zrfR2ueVh72NvQroNdmpARPy6PS+/nmOewBiIP01yGp/lhp+ZgAU8LdP4zrKYqenxvbPDLipnYsjccKLe4tG3Tv7T2WSWvFzLDvFYkfA1mJQAXkdjtyPvA7jtUCmVJlFrp2tz4e7amxPeuttqTz8bL126FQcWCOPuSHVw87s5XpwZi20edfRb5HHL0rQD8Vd7KLM7zeLDzrsP4sog0/ynO33KCO0qjpjzHVdUtfmhCew8hL4OqzpTYZRx3e/7FiPnfz6psvI6df82Hz9AlrUsh5oPMz2Rwch23jIfzZZk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB7366.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(18002099003)(22082099003)(10067099003)(3023799007)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkZrMzFaWFZSOUhlSmhHRDBkdytnWHBhc29iN2V4aGY0Vm1ualpuS2MvajVw?=
 =?utf-8?B?ZExsenZTd3Fza0lOOHhubkkraEhtTURoanNmMmxlQ2R3cm5BZTJMQUorL3NN?=
 =?utf-8?B?dkl4eVduZjRJdWt1SlJucTJBVzB6ZFdKMHNBVkZTRm9tYW9VUVh4Vzl0d0hH?=
 =?utf-8?B?OXc2enl2czdLRjFTQ3V6SG9xeHlRYWhXQ3kvcVpTdU9jY1BsZDlyY3FXOWxk?=
 =?utf-8?B?TWN3a0RnUmFlM0VSaTFvK0c2dCt1MHZLbWJTSmVjT1ZwVFBMQmVrL1pJQXFz?=
 =?utf-8?B?R2JxdUxNUWdhc2NhUHRoQW82U2ZmcUZjRzB1a3VIcFEyaHo0SmVIeHcxL1Vn?=
 =?utf-8?B?R1ByK2NPZUtRbWtFWEd2QUJvSkd3bWZFdGg1eEZQMVRqOWZKcjBMKytScVhN?=
 =?utf-8?B?TVdKYXhGQ2JBODFXdXNoaHUwQlJPYmo2V2orREtEeXpnTGZiQ3ByUjcrSlJj?=
 =?utf-8?B?Z0lRbXVveEJueGEwV1VGR0JJUkVGZVBaNTBxSTlxREh1dDAzQVFPdm9aM1BX?=
 =?utf-8?B?anVJM0pIM1RBNUVIWElnRmJwY0Y3alovNHZjMi9XdDA3RCt0cFNnZGJBLzlK?=
 =?utf-8?B?d2tHcklZaVd0MC9qeTVuZVJGT0FPMVBmTzdUL0xmMkRCNjREZkU2cVhTTHAw?=
 =?utf-8?B?MHA5eVhGMG82akJkWUYveWFkd3J4T3BKZzZFYWlGUDFyR21YWHdtcE9uMDJj?=
 =?utf-8?B?d2ZLWk9CbVlFSGJlT0hRVjM1WVVac3hPT0EzMHI1ZVhBVmdhQzV0Vjh1NTYx?=
 =?utf-8?B?ZHhQeEtaUjZCalhyeXZmcUJRN0FRWVhXYnhNeHJlZjFKZzdJRkZNbnV3Q0tj?=
 =?utf-8?B?V3FXRW52eTFBQmt1QmliUnBIQkgzMkh5d1RJR2daL1llVnN3cEVPRW9YaGFq?=
 =?utf-8?B?eVZreFhTQkxpaU5iNnNjRDhzZEtiRHFjaFdNNFB2TlBQWDdVR1BjeDArMDdP?=
 =?utf-8?B?TDc0ZE5ST0hSNG12MVYxeVIrL0pmVkVZamphZ2cvaFB5YXVFZTFValB5YjA1?=
 =?utf-8?B?UjlWNVc5TnV6bmxWREV1WnR6TlpBQndJNjNxU3ltYTF2NTh2b1luTkxidG1Y?=
 =?utf-8?B?RkxFb1lkckV2OVRDL2l1NWlXTFptRzF5K09TZFhTYWdhZUN2RXNLNlpaZERQ?=
 =?utf-8?B?WVZpT0lwMzh5TWtQZGl1UUcrdmpad3dvK3BueVpuMHQ5Y0hJQU1Hb2FTV1JS?=
 =?utf-8?B?NThuNDJaUGROVkl1NG1MTTd2TlNnLy8xT0VMMGZtb21weXFjelp2OEFvU1gv?=
 =?utf-8?B?dk0reGF1MlBhd0xiRGFScTk0aG4xMVdsQ0VnSGFPL0x1VTBwRHc1ZlF0MFNZ?=
 =?utf-8?B?L05rL2tYMUM1R2NnZVlEYWxjMURXWS9XWU9zdThsY0tMMkVUTFpXV3hMbWQv?=
 =?utf-8?B?c041NTBud3MyYVdCbW9yQXpQYldINHEwcUV6MVdZVEQ2K2xnU2Fwc2dONlJP?=
 =?utf-8?B?VGZjMU5JZFpFeVlxSzBDMU9idGpMNWRYa0J1MG1qZ1lOZFJLY0Fmb2VmZk9u?=
 =?utf-8?B?U29yL3dEZmlmNGpvendaUFlDelRsMC9NU3IzVithbjRWTVRQeXBsRW02UExi?=
 =?utf-8?B?SzNvdzBLbXRUM0hoaTh2ZS9qSXFieVR5NDRyTHlxVnV0aE9vYjJOTTBqRlRa?=
 =?utf-8?B?TmZSdkZyMmRPVkx5NEozbjh2TXRKMktkbGpZU3A1N0JVVjFUamZsd2QyMUp4?=
 =?utf-8?B?WDB0RVBzbmtTb0Nld2NqMVBCdENJYVorMjdjMTFOMWlFNkxtaHBrMU1JRmY3?=
 =?utf-8?B?MGV5M09xRHhUdkhWMnlPTVhoOTdBNW5jcGlRT2ZLQi9iZy9MSHdmRnFaYXlI?=
 =?utf-8?B?a3lSR2hsNDlxQU5ocTh1Y1ExcGRZM3NsRjk2Q1dXN2hkM25qd0VQRklwK0dI?=
 =?utf-8?B?d3lUSkFvOGlralp4UzZQQmdaendkRUhSelVOVG0vRmpqNXpYaXlYUE0vRzVG?=
 =?utf-8?B?MGZicGV6NG1Xc1pPbFROKzlhaTF4TEhIc3ltaHpjQTlFeUlvc2Rqb1pMK0gy?=
 =?utf-8?B?UVVmWndpTEFZWCs5ZU9iYkhva2ozY2J1a2c0L3UrZ2xmTWhaQm8rd2Z1dzlQ?=
 =?utf-8?B?M0hYNG9lTXBYS2FZUW1ZemEreDJMUWFMc2hZL3RkdUJVZC9PbUdxbWNSQk9E?=
 =?utf-8?B?RmRyVXF6OTVlTGttVlladFBvNndpOFRZem0rSlNWUFhJVHpkS0pKWmM4aHdh?=
 =?utf-8?B?a2dDWVA0eUZBZjFVdWxqN3dRbnhNK3ROWTZBa3ZYNnlyRStFeVBPN1BmZXZh?=
 =?utf-8?B?cXNyRUluWWhkK3YrRHVJZE9DNkdPSTVpQStCNVR1eVU1ZWQ5b01nQlYvbnNq?=
 =?utf-8?Q?G5QbpftHB8jd5I15yr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea24e382-f59c-4ac8-a4fb-08df22dd3fba
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7366.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 12:36:16.3986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ssRlJDFsMJOaui2xkqBlP2/2KRUbyKOShmM3j3/eWmZZY7x5iSEtqyVopHpX9khl4dAYaoBFeWuiJrxVjrAJXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4263

Hi Sudeep,

Thanks for the review. Please find my response inline.

On 10/1/2026 8:14 PM, Sudeep Holla wrote:
> On Thu, Oct 01, 2026 at 04:45:38AM -0700, Jay Buddhabhatti wrote:
>> Some platforms advertise reserved or uninstantiated clock IDs that still
>> succeed CLOCK_DESCRIBE_RATES with zero rates. After dynamic rate
>> allocation, kcalloc(0) returns ZERO_SIZE_PTR and protocol init then
>> dereferences rates[0], which panics.
>>
>> Do not allocate or index the rate array when the firmware reports an
>> empty list, so unused IDs are skipped instead of taking down the SCMI
>> clock provider.
>>
>> Fixes: 62ba967595e0 ("firmware: arm_scmi: Make clock rates allocation dynamic")
>> Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
>> ---
>> The SCMI server is the source of this zero rate and successful response
>> and it should be fixed in SCMI server. This defensive check in Linux is
>> still useful because firmware responses must be validated before
>> de-referencing dynamically allocated data, The panic is a Linux
>> regression introduced by dynamic rate allocation; previous fixed array
>> tolerated the same response and other SCMI implementations could return
>> the same unexpected response.
>> ---
>>   drivers/firmware/arm_scmi/clock.c | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
>> index 0278705d809e..8934a95527e2 100644
>> --- a/drivers/firmware/arm_scmi/clock.c
>> +++ b/drivers/firmware/arm_scmi/clock.c
>> @@ -8,6 +8,7 @@
>>   #include <linux/math64.h>
>>   #include <linux/module.h>
>>   #include <linux/limits.h>
>> +#include <linux/slab.h>
>>   #include <linux/sort.h>
>>   
>>   #include "protocols.h"
>> @@ -484,6 +485,13 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
>>   	if (!st->max_resources) {
>>   		unsigned int tot_rates = st->num_returned + st->num_remaining;
>>   
>> +		/*
>> +		 * Unused/reserved clock IDs return 0 rates. kmalloc(0)
>> +		 * returns ZERO_SIZE_PTR and must not be dereferenced.
>> +		 */
>> +		if (!tot_rates)
>> +			return 0;
>> +
>>   		p->clkd->r.rates = devm_kcalloc(p->dev, tot_rates,
>>   						sizeof(*p->clkd->r.rates), GFP_KERNEL);
>>   		if (!p->clkd->r.rates)
>> @@ -505,6 +513,9 @@ iter_clk_describe_process_response(const struct scmi_protocol_handle *ph,
>>   	struct scmi_clk_ipriv *p = priv;
>>   	const struct scmi_msg_resp_clock_describe_rates *r = response;
>>   
>> +	if (ZERO_OR_NULL_PTR(p->clkd->r.rates))
>> +		return -EPROTO;
>> +
>>   	p->clkd->r.rates[p->clkd->r.num_rates] = RATE_TO_U64(r->rate[st->loop_idx]);
>>   
>>   	/* Count only effectively discovered rates */
>> @@ -622,6 +633,13 @@ scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph,
>>   	if (ret)
>>   		return ret;
>>   
>> +	/*
>> +	 * Some platforms expose reserved clock IDs with an empty
>> +	 * CLOCK_DESCRIBE_RATES reply. Do not dereference rates[].
>> +	 */
>> +	if (!clkd->r.num_rates || ZERO_OR_NULL_PTR(clkd->r.rates))
>> +		return 0;
>> +
> 
> I expect the Clock rate control bit to be unset in the permissions for
> these clock, else it may be dangerous to do this. Please add that check.

I will add that check in new version. If the Clock rate control bit is 
set, Linux clears its local copy by setting rate_ctrl_forbidden. The 
clock remains registered, but clk-scmi does not install set_rate and 
scmi_clock_rate_set() returns -EACCES. This avoids exposing rate changes 
when no valid rates were described.

Regards,
Jay
> 

