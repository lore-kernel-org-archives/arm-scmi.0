Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF541BF322
	for <arm-scmi@vger.kernel.org>; Fri, 16 Aug 2024 17:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723829987; cv=none; b=g6QPHHQ0FFI8WWydWvUbN7UsoWhJh1k8NULLEUlPa7/pNMdA8WlYwNRFJ+CHpb2KJH/anXBdO13mqDwcA1glOBkaoZH9SK8wkXPz9tPEV81vzSubPHrq1MNnlFNngzlw9nUOwn6GB5Or6EBUQqvZJok75khSdycgis+5P/G909Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723829987; c=relaxed/simple;
	bh=LEYhrYAmcTWEydTNdc8hiAp1iMoRCSse4/D8IB8DiRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nKS5UKrR/kv0sdUhrkRNlsgun3ks/z/2f5dqdtUmwLGvN0wmk8loBX2KzSQWtboRyW0rIKzjnJF1oHJ34ejJh87oWlXfZvk5ll2aDhaDRSFRwkcUNQ7Mf1OBFUXk4mn8UiSeL4FIh86sNixJjYD5l3+iYAN/5QIA/34BSjOZbZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Gd+r17vx; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Gd+r17vx"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-70b3b62025dso1559604a34.0
        for <arm-scmi@vger.kernel.org>; Fri, 16 Aug 2024 10:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1723829985; x=1724434785; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qd+nepfzAVl/w9Hny3aM260SBA3kiMeVt97gGRIgVIY=;
        b=Gd+r17vx8dE43J939M2FfysEPUCnD0hKICapX6k/V5bS8kP9y0Jmn9fVK1Ux2TMLsm
         bh4A1/rap83ZaFpA0joA3YEKxyhOIk3ef4zU+S+qWK3lavoohIoQ+Pl7r8IEQda8+sVh
         t/rG/oOaDXeGYsvDxYeMnpL7bXR+lnrHEyHfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723829985; x=1724434785;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qd+nepfzAVl/w9Hny3aM260SBA3kiMeVt97gGRIgVIY=;
        b=Wy2TMnPxuI1XiJqRCqhE9kdV+JXHD15XurtJnuF2buZcP1zUKPlVMWpYc8fn3+N2LS
         6iztma94T7MruLPmWbeUyW/8fZooCFvuAasAwMoRjKX7d7N1nujp6RKr4KgxwgjO6WO6
         aDfoPOJSxfFQZ7icft7JcJ+Yh7n9ya4pnAnlZaBTZbpy/kN2s/xMD0yp9E6yOkNvqDn/
         NANiKZHUppCBTCfksj8qxBaGItrdtv3yYdrkowA6Bb6gT6d5+vhX+CDtZIU0y2tP4bfc
         ZCYbu2A/nRA7kjgT9jgAsvvuQVy/neKCVQXLraIJTDIgm3eEm8CBvKwKkSZmhIr3J08X
         kwXw==
X-Forwarded-Encrypted: i=1; AJvYcCWOGLGBI2is3Jqw2+mWIUtVwn/IPNwv/wGMdQQ+/ai4FTUl5EkRbql+9ME9fJteno1BIyr8puc2fISR/IfPU/FVMd7wNQYWw40=
X-Gm-Message-State: AOJu0Yw5e6I/2rVBCMBpKOoJZasvWFSuRcQArc9+tf22THkd6jqNhDpb
	y5EjvmPab0oe/fwP3a2cUHbcS8yPVb0rZTNT3XBfdRl08Ot8/CRbie13iWW7Uw==
X-Google-Smtp-Source: AGHT+IF2ic1q163w/nEDiGmEdTz4MMQVMfCwPMi9rRTKxKvjMahEdZCXO0bmoMzW4Dwi74pqiDuzGw==
X-Received: by 2002:a05:6871:3422:b0:270:1d05:1add with SMTP id 586e51a60fabf-2701d05980cmr4298850fac.16.1723829984594;
        Fri, 16 Aug 2024 10:39:44 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b61dc929sm3265530a12.40.2024.08.16.10.39.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2024 10:39:43 -0700 (PDT)
Message-ID: <345aca0f-12f0-4a66-a760-3b8524fda7fe@broadcom.com>
Date: Fri, 16 Aug 2024 10:39:42 -0700
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] firmware: arm_scmi: Support 'reg-io-width'
 property for shared memory
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:SYSTEM CONTROL & POWER/MANAGEMENT INTERFACE"
 <arm-scmi@vger.kernel.org>,
 "moderated list:SYSTEM CONTROL & POWER/MANAGEMENT INTERFACE"
 <linux-arm-kernel@lists.infradead.org>, justin.chen@broadcom.com,
 opendmb@gmail.com, kapil.hali@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com
References: <20240813180747.1439034-1-florian.fainelli@broadcom.com>
 <20240813180747.1439034-3-florian.fainelli@broadcom.com>
 <Zr-GJts3Gu6GEkhC@pluto>
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
In-Reply-To: <Zr-GJts3Gu6GEkhC@pluto>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/16/24 10:02, Cristian Marussi wrote:
> On Tue, Aug 13, 2024 at 11:07:47AM -0700, Florian Fainelli wrote:
>> Some shared memory areas might only support a certain access width,
>> such as 32-bit, which memcpy_{from,to}_io() does not adhere to at least
>> on ARM64 by making both 8-bit and 64-bit accesses to such memory.
>>
>> Update the shmem layer to support reading from and writing to such
>> shared memory area using the specified I/O width in the Device Tree. The
>> various transport layers making use of the shmem.c code are updated
>> accordingly to pass the I/O accessors that they store.
>>
> 
> Hi Florian,
> 
> I gave it ago at this on a JUNO regarding the mailbox/shmem transport
> without any issue. I'll have a go later on an OPTEE/shmem scenario too.
> 
> This looks fundamentally good to me, since you moved all ops setup at
> setup time and you keep the pointers per-channel instead of global...

Thanks!

> 
> A few remarks down below.
> 
>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

[snip]

> 
> ... I may be missing a lot here...bear with me...so...
> 
> ... AFAIU, as suggested by Peng, you moved away from iowrite##s and ioread##s
> in favour of __raw_write/read##w so as to avoid the implicit barriers on each
> loop iteration...(I suppose..)
> 
> ...but should we place some sort of final io barrier (similarly to iowrite)
> at the end of the loop ?

There is no leading or trailing barrier with the ARM64 
memcpy_{to,from}io routines which is why this was carried forward as-is.

There is an implicit barrier with the iowrite32() in the tx_prepare(), 
so I suppose we are somewhat safe on that part. Likewise with the 
fetch_response()/fetch_notification() we have an implicit barrier within 
the ioread32() and then there is a data dependency since we ought to be 
consuming the response/notification.

For ARM 32-bit the implementation uses readb()/writeb() which does 
include barriers.

> 
>> +static inline void shmem_memcpy_toio##s(volatile void __iomem *to,	\
>> +					const void *from,		\
>> +					size_t count)			\
>> +{									\
>> +	while (count) {							\
>> +		__raw_write##w(*(u##s *)from, to);			\
>> +		from += amt;						\
>> +		to += amt;						\
>> +		count -= amt;						\
>> +	}								\
>> +}		
> 
> ...same concern here
> 
>> +static struct scmi_shmem_io_ops shmem_io_ops##s = {			\
>> +	.fromio	= shmem_memcpy_fromio##s,				\
>> +	.toio	= shmem_memcpy_toio##s,					\
>> +};

The macro might be a tad too much given that we only support one width, 
in case we needed to add a specific size in the future we could use a 
macro again I suppose, for now, just inlined the implementation for the 
4-byte / 32-bit size.

>> +
> 
> There are a bunch of warn/errs from checkpatch --strict, beside the volatile
> here and on the previous typedefs, also about args reuse and trailing semicolon
> in these macros...

I don't think we can silence the volatile ones, checkpatch --strict did 
not complain about the typedefs in my case, what did it look like in yours?
-- 
Florian

