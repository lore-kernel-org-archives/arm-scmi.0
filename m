Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDF329A0
	for <arm-scmi@vger.kernel.org>; Mon, 14 Oct 2024 17:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728926494; cv=none; b=Gr3JYYcGJKKz1k4rpbrp6trXBQb+BlNyRRWsRtWQhrsphMC68pj3xULDQ/xJd5mdA8Zj48OvQhaMIdvZYnamNjZlOgN47mD189NZqE82DkFmuEAXA3g6Yzh2B99GOJCwgO772tGgkLpVBVDpm7a6k6fi+ygZ4AaUWjzcY6wiyD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728926494; c=relaxed/simple;
	bh=+hzou2MFXYI97o5PDMMPqsa8vn8v8mDg+7FzNY3obLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uXD1RC9Jmun28CFJXcjczamw1x+yKLe6efEtPIfLGwEeZxALb6SK0iF8kTo6z8EcC4dAnscTUROIJg18GpbGDuy3ND/ongd+rgjLDwALgM2tNRmafQ4bj5xWA4KAOwcFyCFPB1HqCrERNWxNoaFbiLIyJvXxcr21snBiP4hmQ8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Qf3YJUmw; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Qf3YJUmw"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2e3686088c3so655428a91.0
        for <arm-scmi@vger.kernel.org>; Mon, 14 Oct 2024 10:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1728926492; x=1729531292; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zzIm24xlDu8WPNe3MkSQzgf924XbQr4l2WzaBR9dWtM=;
        b=Qf3YJUmwSdPVVPwZ5FnlNmvj4TC+62S/ptbaEztlDZYnCkJIs+O4DoTOW4KPalELVB
         R7518/BiNhztjuxi1THTzWo1tKAzwn48Xhv42Lbow688TsuiUGI21+dLA41hdt+xCG5u
         HPf439mkhkZLfF/NA8d47MoRPO0oUEJy2+BmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728926492; x=1729531292;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zzIm24xlDu8WPNe3MkSQzgf924XbQr4l2WzaBR9dWtM=;
        b=TMTDDW5cWEr1pDceBCHITn5iOFDkZysbLvH/C0mV0oGdcWCvk1/WYOHdlZZdalS5XI
         fnqJZ3/NcB+DagL4BUF14xFRflrPW46XikuCKVpMT0WPnCoS3Lvm9iYH2TkvVHJ9EskD
         fA1wtygnsuhSZVjGQXhKUk8TZfzdQca9OEdyXiV3ClzLFvgm6EQ1SaMdyslUR23RugQ+
         1OKbGiXnCuLba5n8z6SYlfUJJHD4TL78gORW7E8vUqmIK86xbVDg/vZ0ZoxvWaSXZN4K
         EBkdTIT3AGGctKwdk4siUdbdl1J0ZDPkkx19b1tWyKcAZPRE4lb7C72GOGD1FIKIjrwY
         0e0Q==
X-Forwarded-Encrypted: i=1; AJvYcCX3aXxUNdHWUBbChNFLaaygOpRKV8v8dLmJikePWXGN/t8loOkUypHdKylmksGVnSfqixlUzTqVPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOODypsKxs53+ARwt+zwn3PuZmrivP/c/muGAi0gut51/fwA9e
	dvcjEOyrJYpcG7V2AFKQNhrJxvKbiERYh8pSV8Xzc3crQ1HXMc4+fA64lM+lmw==
X-Google-Smtp-Source: AGHT+IEILBnXLecSRXgZyFdiiBIZeZG70tJo3X0ijBb8mPdEd2TkWBNRiIzOR2wpGsSRTa0EOfRvHA==
X-Received: by 2002:a17:90a:eb01:b0:2e2:8d33:f79d with SMTP id 98e67ed59e1d1-2e2f0ae8d45mr14291214a91.19.1728926492370;
        Mon, 14 Oct 2024 10:21:32 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2a5712738sm11610417a91.31.2024.10.14.10.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 10:21:29 -0700 (PDT)
Message-ID: <58725446-d069-40a2-859f-0dd9ec6c3c98@broadcom.com>
Date: Mon, 14 Oct 2024 10:21:28 -0700
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] firmware: arm_scmi: Queue in scmi layer for mailbox
 implementation
To: Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>
Cc: Justin Chen <justin.chen@broadcom.com>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com,
 bcm-kernel-feedback-list@broadcom.com
References: <20241009192637.1090238-1-justin.chen@broadcom.com>
 <ZwkrVQOVJpUvhW4g@pluto> <50f4d2d6-dead-4053-834f-134d2df0d6bd@broadcom.com>
 <ZwuSTVFYAhwD2KYf@pluto> <ZwzqguhMBkW1_x2I@bogus>
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
In-Reply-To: <ZwzqguhMBkW1_x2I@bogus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/24 02:55, Sudeep Holla wrote:
> On Sun, Oct 13, 2024 at 10:26:49AM +0100, Cristian Marussi wrote:
>> On Fri, Oct 11, 2024 at 12:15:07PM -0700, Justin Chen wrote:
>>>
>>> Yes, I see the implementation. Looks like it returns the position in the
>>> ring buffer. I also confirmed with CONFIG_DEBUG_MUTEXES which triggers a
>>> warning.
>>>
>>> What about this?
>>> if (ret >= 0)
>>> 	ret = 0
>>> else
>>> 	mutex_unlock(&smbox->chan_lock);
>>>
>>> A bit easier to read IMO.
>>
>> Oh yes much better definitely...or, maybe, even more simply to read:
>>
>>   ...
>>
>>    mutex_lock(&smbox->chan_lock);
>>    ret = mbox_send_message(smbox->chan, xfer);
>>    if (ret < 0) {
>>   	mutex_unlock(&smbox->chan_lock);
>>          return ret;
>>    }
>>
>>    return 0;
>> }
>>
>> .... up to You...not sure what Sudeep prefers...
>>
> 
> I like this better. Also I was hoping Justin would send v3 soonish, I want
> to send PR for fixes soon. So I have gone ahead and fixed all your comments
> myself. I had seen the doxygen one from builder already and had fixed it up
> last week when I added this to -next.
> 

Here's his v3:

https://lore.kernel.org/all/20241014160717.1678953-1-justin.chen@broadcom.com/

we are on the other side of the pond ;)
-- 
Florian
