Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FAE310799
	for <arm-scmi@vger.kernel.org>; Fri, 15 Aug 2025 16:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755276386; cv=none; b=omkv4pWCyxLGqY1p0QMzuhECTBqD1Ikv2JAQnogQ4NyU29ucc94Cs7dQnfcDfr7LAUut/uhM7hJTTwzadUhoQ65+cORDXFcpezriSPX1Y2QKqvJZvZVDe8wq05/DDLElpNVJpkg2ExZEtkfVfy2jllk/aFdNPjF2jGtt37sQkZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755276386; c=relaxed/simple;
	bh=C/Td9Bgde6R+tt02jHG/MMtYtEWcmB3eNZjcQkDwgyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sL35VuYc2WXN8KWf/TL72DR8NKzay6MrnLb9vvJKJXzoacLbW2aAUSe6ZXfGyKvXoQRAG8XhP2sBsETcrhbRlAQab7mWtiilTjXpRCxK4aXyOU5c4NfdKsJ/tvEHsFT3iYMOPVXYAq+Kevxoye82T+knKF2rVSkQK9n5SiJx+dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=LM63ZxS9; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="LM63ZxS9"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-24457fe9704so17153365ad.0
        for <arm-scmi@vger.kernel.org>; Fri, 15 Aug 2025 09:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1755276384; x=1755881184; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G+ZroGpNdJmwln/9q6Kw/hEokSx6KAAuSZ3AUY/4HU0=;
        b=LM63ZxS99ZEKSzn47DbA0bCkLEcll7oQCMIgjeT1SbMj4Ok15lJDJgiJgLdfdHw3/x
         A/xKOJ8YICIn0BJA9G9h+V1BzAICM0/JlsueGJV0TX2Tcd48FvsbMUa05VXcjwUwtSdW
         8qRiPlQicHxcEybKGjgzcRaLlUum7qrL2lyS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755276384; x=1755881184;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+ZroGpNdJmwln/9q6Kw/hEokSx6KAAuSZ3AUY/4HU0=;
        b=BOfyiQxo4rlLqlt0BhZdk7BxpBJBXskiWguaXd3LJNNGdefF59QpTXxwarVR6fsRyY
         +Bi1UsUuh1Yxt9sVL0ilsS1nlzp6UOv08lH/G+TcbBTEdDtStAJW7Lzno8luhuLg984c
         7Y6z2+nwej7nxwPO/oGp1tHcZnWFMD0+RU61lSGd/o5f86oP3mTtXVwCQgIIOJAwbu5D
         sWU3uZJH2+4jZAQsRD6Uj7VIaEypYb556TYflaMuL54ZW7WN+BJuf8aiTQhjaUcCLeno
         BdbHvJNyYKSo6Crg7dASzCPPqvKJm/1Gyo7x2G1LxeGXvn4emlgUAt3QMCDeXu85X6MT
         rkGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVLoHGwcSvKHhdX2pNg3J5nrLRKWKO67TnElQxt1BNMqaQYPJjVJWTV/RK58kRPfnUEyBm0KVS2A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz49HJsTWjwW5UvUmxj98BpgPjMYpYd9qQwetVG87Zn4hwKiZWz
	1ZbUqThSfO0ILo8/QTq69JQOKKWx4VC+scEVDgTGY9jGpJQZ9flmNW8ZFjf2ddbXGQ==
X-Gm-Gg: ASbGncsRqM+ewu1QCNLe5YpmmmC6bUSYaSWgySkTKdgR6urbDejt16IDofn6xGz1aHh
	RdDUrN8OISEbPpBtJO2Lw9E8+p7pCQbfoLl40F7NYW1U4LJ+XtOk5sC4WrV0tqV1Gpx+X0dYFYg
	gU2wQLNbwkHFVJIffIwgmSZhfLLeyKjvuvgwZ7hXPF+v945M/zRGQ2SIsBVrhyIrydhOnlqyGJC
	m9c3YS8tOjTwhK2b6InunoCtzHsumhsTBASKEvXN50juYm13rH/pb9eFY0ik2B7p6ZFonsnLVT8
	ScEeOuF4OlaxnQlceuCVP7hJSAwJd37t7NYrWpUXQU2loQajc8a8xP8WdcY+FIWs0Ye5pLka1Xa
	0hKLwV2FJgRvxWbnSP/ACMjjCN2LqblrZUlHVD+NjgPYh41a69sANdC2R5OZeNPc2zQ==
X-Google-Smtp-Source: AGHT+IGaD7NipiYs8pCnXLAQK1a0gZQDqVBrHWQuhpKPItWLuIo1KSHzmEWzXChNb0FI2lLCfCq27w==
X-Received: by 2002:a17:902:cece:b0:234:f4da:7eeb with SMTP id d9443c01a7336-2446d5af738mr48517595ad.7.1755276384349;
        Fri, 15 Aug 2025 09:46:24 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d56d5bbsm17558665ad.147.2025.08.15.09.46.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Aug 2025 09:46:23 -0700 (PDT)
Message-ID: <79711a6c-8b59-43c9-bbbc-369be1608a49@broadcom.com>
Date: Fri, 15 Aug 2025 09:46:22 -0700
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: scmi: Add quirk to disable checks in
 scmi_dev_used_by_cpus()
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, james.quinlan@broadcom.com,
 Sudeep Holla <sudeep.holla@arm.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Peng Fan <peng.fan@nxp.com>, Mike Tipton <quic_mdtipton@quicinc.com>,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
References: <20250814225155.3519000-1-florian.fainelli@broadcom.com>
 <aJ7rBgce5eWSkkk3@pluto>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <aJ7rBgce5eWSkkk3@pluto>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/15/25 01:08, Cristian Marussi wrote:
> On Thu, Aug 14, 2025 at 03:51:55PM -0700, Florian Fainelli wrote:
>> Broadcom STB platforms were early adopters of the SCMI framework and as
>> a result, not all deployed systems have a Device Tree entry where SCMI
>> protocol 0x13 (PERFORMANCE) is declared as a clock provider, nor are the
>> CPU Device Tree node(s) referencing protocol 0x13 as their clock
>> provider.
>>
>> Leverage the quirks framework recently introduce to match on the
>> Broadcom SCMI vendor and in that case, disable the Device Tree
>> properties checks being done by scmi_dev_used_by_cpus().
>>
> 
> Hi,
> 
>> Suggested-by: Cristian Marussi <cristian.marussi@arm.com>
>> Fixes: 6c9bb8692272 ("cpufreq: scmi: Skip SCMI devices that aren't used by the CPUs")
>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
>> ---
>>   drivers/cpufreq/scmi-cpufreq.c     | 13 +++++++++++++
>>   drivers/firmware/arm_scmi/quirks.c |  2 ++
>>   drivers/firmware/arm_scmi/quirks.h |  1 +
>>   3 files changed, 16 insertions(+)
>>
>> diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
>> index ef078426bfd5..80647511d3c3 100644
>> --- a/drivers/cpufreq/scmi-cpufreq.c
>> +++ b/drivers/cpufreq/scmi-cpufreq.c
>> @@ -22,6 +22,8 @@
>>   #include <linux/types.h>
>>   #include <linux/units.h>
>>   
>> +#include "../drivers/firmware/arm_scmi/quirks.h"
>> +
> 
> I will post a patch to move this header up to avoid the uglyness of this
> include....

Sounds good, thanks!

> 
>>   struct scmi_data {
>>   	int domain_id;
>>   	int nr_opp;
>> @@ -34,6 +36,7 @@ struct scmi_data {
>>   static struct scmi_protocol_handle *ph;
>>   static const struct scmi_perf_proto_ops *perf_ops;
>>   static struct cpufreq_driver scmi_cpufreq_driver;
>> +static bool __maybe_unused scmi_cpufreq_dt_props_check_disable;
>>   
> 
> Not sure why you introduce an intermediate global bool to check...this
> defeats a bit the whole idea of the quirks framework which is based on
> static_keys and is supposed to be mostly transarent when quirks are not
> enabled....
> 
> Couldn't you just move the quirk inside the get_rate ?

Yes, I just had not realized that the execution of the quirk was already 
conditional, so it makes sense not to need any intermediate boolean.

> (maybe I am missing something around compiler behaviours..)
>   
> #define QUIRK_SCMI_CPUFREQ_CHECK_DT_PROPS		\
> ({							\
> 	if (true)					\
> 		return true;				\
> })
> 
>>   static unsigned int scmi_cpufreq_get_rate(unsigned int cpu)
>>   {
>> @@ -400,6 +403,9 @@ static bool scmi_dev_used_by_cpus(struct device *scmi_dev)
>>   	struct device *cpu_dev;
>>   	int cpu, idx;
>>   
> 
> +	SCMI_QUIRK(scmi_cpufreq_no_check_dt_props, QUIRK_SCMI_CPUFREQ_CHECK_DT_PROPS);
> 
>>   	if (!scmi_np)
>>   		return false;
>>   
>> @@ -427,12 +433,19 @@ static bool scmi_dev_used_by_cpus(struct device *scmi_dev)
>>   	return false;
>>   }
>>   
>> +#define QUIRK_SCMI_CPUFREQ_CHECK_DT_PROPS			\
>> +	({							\
>> +		scmi_cpufreq_dt_props_check_disable = true;	\
>> +	})
>> +
>>   static int scmi_cpufreq_probe(struct scmi_device *sdev)
>>   {
>>   	int ret;
>>   	struct device *dev = &sdev->dev;
>>   	const struct scmi_handle *handle;
>>   
> 
>> +	SCMI_QUIRK(scmi_cpufreq_no_check_dt_props, QUIRK_SCMI_CPUFREQ_CHECK_DT_PROPS);
>> +
> 
> ...removing this of course
> 
>>   	handle = sdev->handle;
>>   
>>   	if (!handle || !scmi_dev_used_by_cpus(dev))
>> diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/arm_scmi/quirks.c
>> index 03960aca3610..aafc7b4b3294 100644
>> --- a/drivers/firmware/arm_scmi/quirks.c
>> +++ b/drivers/firmware/arm_scmi/quirks.c
>> @@ -171,6 +171,7 @@ struct scmi_quirk {
>>   /* Global Quirks Definitions */
>>   DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL);
>>   DEFINE_SCMI_QUIRK(perf_level_get_fc_force, "Qualcomm", NULL, "0x20000-");
>> +DEFINE_SCMI_QUIRK_EXPORTED(scmi_cpufreq_no_check_dt_props, "brcm-scmi", NULL, "0x2");
> 
> Also, are you sure about using version as "0x2" ? That is supposed to
> indicate the (optional) SCMI FW Version to which this quirk will
> apply...and with that it means whatever FW versioning you use in
> Broadcom to identify build versions....it is NOT the SCMI Protocol
> Version, so that also means that if/when you will change the advertised
> version, this quirk wont apply anymore...or equally if there are older
> version than 0x2 that are buggy they wont be quirked...

It's a good point, we should actually be matching on <= 0x2

> 
> One more doubt I have (despite me having suggested this solution) is
> that here you are quirking against a malformed deployed DT really,
> not against some SCMI FW anomaly in the Broadcom FW, but using the
> SCMI Quirks framework you are tying the quirk to the SCMI FW Vendor
> and maybe some specific SCMI FW Version....

Yes that is a very good point, maybe that's abusing the quirks framework 
so to speak.

> 
> ...so what will happen when you will update/fix your DT in the future ?
> Will you also take care to bump the BRCM SCMI FW version to disable the
> quirk in the DT deployed by your FW binary ?

Yes we would bump the version number to indicate that the Device Tree 
has always been fixed, both go hand in hand on our platforms. Or, as I 
suggested privately to address the stable back ports, maybe it would be 
better to do something like this:

@@ -430,6 +428,14 @@ static bool scmi_dev_used_by_cpus(struct device 
*scmi_dev)
                         return true;
         }

+       /* Older Broadcom STB chips had a "clocks" property that did not 
match
+        * the SCMI performance protocol Device Tree node, if we got 
there, it
+        * means we had such an older Device Tree, therefore return true in
+        * the interest of preserving backwards compatibility.
+        */
+       if (of_machine_is_compatible("brcm,brcmstb"))
+               return true;
+
         return false;
  }


which would be more in line with checking the Device Tree only, and it 
would also allow for unmodified backports to reach the stable trees. 
Contrary to what I suggested privately however, this check is done 
later, so we leave a chance for properly formed DT to return "true" 
earlier on.

What do you think? I am now leaning more towards that solution that 
leveraging the quirks as I agree it is somewhat unrelated.

Thanks!
-- 
Florian
