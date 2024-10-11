Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1017F9
	for <arm-scmi@vger.kernel.org>; Fri, 11 Oct 2024 16:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728665890; cv=none; b=f5BU0QDBGtMsFSTn4mLHw7R6b0QG3nyeCEtAKKjdpCCZ4RerMlT5TCkwTE0Qpi3Ro8W5zQ6axNBEoEqTO+VoacnQT7f4hDfAxnNe5s4SVlAZGsVIOybJU7kpWW7Zuw29C4VDfNFdwZKt6ZBUucFnmbpHklooeE4JSPFGD+7HfC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728665890; c=relaxed/simple;
	bh=DXAziF3on6avLK3Hn2BISeeThJJuJ9MUhMCRsyvJoaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aUBIV/eSjvESKt6JAptipzgPqsWEykE7MaKK+MP0MRI+SZaCLqkuPMu2w3r2zYQBy+CZ6DHC2jSwdwowWEpSBDtJAQBjPgiuYyxHwJil3buU+P79wWrhNGhMU76sXVKSkQjtmktRpfX+9I1AgAdnnX/9d8Utfo4HfwizXyr7yXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=CwSMIEh1; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="CwSMIEh1"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20caccadbeeso6646885ad.2
        for <arm-scmi@vger.kernel.org>; Fri, 11 Oct 2024 09:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1728665888; x=1729270688; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iI7N4OmAYOmWK0C4nRDXxycd+i6Iyyi0uWNjLeMWscM=;
        b=CwSMIEh1WqkDxoCg/uyNgn+PYAgaUuJK9VJSY9FGVmR7arOlmxbbH57mLxvvAReot2
         u6y+10QgcqXt8dDlwQUs2F4AcpkAzH6ypzNJ7gM5oAtw0NZ+66LeMxI9lzL/j3o8m+8u
         reUq7ykVuwNV+JMyly6dcvShesEY/1jNMM+5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728665888; x=1729270688;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iI7N4OmAYOmWK0C4nRDXxycd+i6Iyyi0uWNjLeMWscM=;
        b=IyXn+qIOTy6YdVfexRFxMLKfyrDqzzaBuLOWujFRth/Dr7TGASOOQiZ+JzOP48YHSU
         VAKrJ+xa39tBPgTdDhOrBNYxwv+BllO1g2D0YPMKAUjkvigZ85r27rOKjy01ieXKJ8bE
         ab3WlyABDQiigpwPzfa3PubQyQeM43eLhzaAZc8uN4fJ2jdPjRZnhh72Pnz4E0QYKX0S
         uncItdyWYFPK8q0dc/HuiTL52Y/yeuocPn71yG2nSf/n2NWSNt6P/4p9roIdUX2mHA1z
         Q94I7OK0zrlIL66OyZ58RL5RiXx1k5bZmVQ/tkbe+CGXw2Ptr6i0Lx7a6vtqwrdSw2wM
         kOWA==
X-Gm-Message-State: AOJu0YxVS/84uq/geLYT9C6+Bu/vuGxu3ATyama4HZRyRz6EZiE5k1mj
	wxucamjE909Km2uckMBM2k85F+N2t/dl4v2gwNoqvTppESzf2fL2VAIyLS+hE/CZCnocXV9wSOE
	=
X-Google-Smtp-Source: AGHT+IGHpGb9qnExHSXE7Ai0AnGih96kwF4dzI85pSkdicKXW+NsNxJ6qrjE0frtXPOoPLFdNokcuQ==
X-Received: by 2002:a17:902:ec83:b0:20c:5404:ed69 with SMTP id d9443c01a7336-20ca167bbbbmr39073895ad.31.1728665888463;
        Fri, 11 Oct 2024 09:58:08 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8c345e46sm25233655ad.271.2024.10.11.09.58.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 09:58:07 -0700 (PDT)
Message-ID: <20b6d922-439c-4280-8376-6e1d2397a30e@broadcom.com>
Date: Fri, 11 Oct 2024 09:58:06 -0700
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] firmware: arm_scmi: Queue in scmi layer for mailbox
 implementation
To: Cristian Marussi <cristian.marussi@arm.com>,
 Justin Chen <justin.chen@broadcom.com>
Cc: arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
 linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com,
 bcm-kernel-feedback-list@broadcom.com
References: <20241009192637.1090238-1-justin.chen@broadcom.com>
 <ZwkrVQOVJpUvhW4g@pluto>
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
In-Reply-To: <ZwkrVQOVJpUvhW4g@pluto>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/24 06:43, Cristian Marussi wrote:
> On Wed, Oct 09, 2024 at 12:26:37PM -0700, Justin Chen wrote:
>> send_message() does not block in the MBOX implementation. This is
>> because the mailbox layer has its own queue. However, this confuses
>> the per xfer timeouts as they all start their timeout ticks in
>> parallel.
>>
>> Consider a case where the xfer timeout is 30ms and a SCMI transaction
>> takes 25ms.
>>
>> 0ms: Message #0 is queued in mailbox layer and sent out, then sits
>> at scmi_wait_for_message_response() with a timeout of 30ms
>> 1ms: Message #1 is queued in mailbox layer but not sent out yet.
>> Since send_message() doesn't block, it also sits at
>> scmi_wait_for_message_response() with a timeout of 30ms
>> ...
>> 25ms: Message #0 is completed, txdone is called and Message #1 is
>> sent out
>> 31ms: Message #1 times out since the count started at 1ms. Even
>> though it has only been inflight for 6ms.
>>
>> Fixes: b53515fa177c ("firmware: arm_scmi: Make MBOX transport a standalone driver")
>> Signed-off-by: Justin Chen <justin.chen@broadcom.com>
>> ---
>>
>> Changes in v2:
> 
> Hi Justin,
> 
> thanks.
> 
> A few nitpicks and one remark down below.

Since there will likely be a v3, the Fixes tag should IMHO go way back 
to when this problem has been in existence, maybe:

Fixes: 5c8a47a5a91d ("firmware: arm_scmi: Make scmi core independent of 
the transport type")
-- 
Florian
