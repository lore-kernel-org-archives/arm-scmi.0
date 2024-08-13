Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B4822F11
	for <arm-scmi@vger.kernel.org>; Tue, 13 Aug 2024 05:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723525240; cv=none; b=NfXDyMwehWzkF4XJcBk5FWlJ6cTfTtxsNsc6Maywm4CPAK9+W1/ItHEXay11Kf3VV5jT3NiP9hgH/UOkokD6zYIn8pcmBnxX1+nZ4fB+T191wn4kvOV3gDhgGUd88DUBQ6n37StQyfbEwhA8jieg2cL+JFbvWnBSM9G2kedTg6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723525240; c=relaxed/simple;
	bh=yiYbIaIB3lRIh11Y4heg2twoT9Od+PRXyjsBP87NqWM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=gJwwWyV8+kjovc3X2uZD4A+QBf1w0fH/rGB5pqk3mfhvykWI0XUG38NCcGRkQwymz1VWCzFQ985R7mwQc2UDkQz6blGH2NQLZAsLLL9pMRr3eJbwWsF2dRYN1arGGxBE2R4BPtN8KELLILIKA6vnj7n0W0TnXD/BLh77E5+9dV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ER9ycBce; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ER9ycBce"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1ff3d5c6e9eso35298425ad.1
        for <arm-scmi@vger.kernel.org>; Mon, 12 Aug 2024 22:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1723525239; x=1724130039; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RhqrlQzuYBLcUmZ958prMchEDTE/clI7Rwj35VRtOrU=;
        b=ER9ycBceTtDmEGUNyLb3jdz+f41u2CNysVCBE7oH7Nmwab1XDhnvDA7g+gjfKseIv1
         lCGUJYtogf9KO2QNWnyehdxUSkAgOwVTKxBBi7Wgr4mo0gCQsvZZGr4xAhQp9FEx169D
         tJOjJI8d5yntywKYc+yka7tM3zRkjE1VGiC5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723525239; x=1724130039;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RhqrlQzuYBLcUmZ958prMchEDTE/clI7Rwj35VRtOrU=;
        b=v2/89aqHF0wUOLXlMGtmlh+JZS2Zq+cAfTbqbsXAOrMzFoiHDWw6mECxIlSN+9cl6B
         9+OgiO6fqzocqdSvtrxfZxvQ4Cz5n72abUK3vvf6XtJ+YRTbwRf/8JT06ZPoxY/8RDyJ
         DTHjfs8hWSSUzAeC+cH3G1tcXfqcEtxRZmtMC4b2YllWskrWCoRI66/vDhGWW9VuS7gX
         UubAbGJ3HKFgZRp7pldHzT4bsMdZCBiur8ha0CiogashVX6Pjzxpqr/3nNFFmG9wCcqu
         4MDeFFpOa9FVw8jjR2ixkdQLPYIDC1nfn8MFZ084BH2WlN/QS4LLjhORL1JPJL3ujFSd
         J6hQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAQXmDxmcojftdvSPeuOpOEV5kbyrKcG/KbAytmHZNygnUnLMs4edeZRQI7GlDo5+fek7zIyhxIq+8kf3pERvBFgToSv3ENek=
X-Gm-Message-State: AOJu0YwS9S5k19DT7pD0xg6+2R082Dg8in4T3pvwdPomUP59RrhpWLxw
	t41ynz80Aa2S3yeCpYggTP8NKe75DaW+bQQPcFs9EuBDSgW02M2B0MqHHA5OQg==
X-Google-Smtp-Source: AGHT+IEOqSVhEavENGDGII0Je9hl0TxgLwVS41Duz8KARwPtXR/yAM4SbOVyp9hPr5LwCrFj8OiGAg==
X-Received: by 2002:a17:90b:4acc:b0:2c9:6f53:1f44 with SMTP id 98e67ed59e1d1-2d3924dce99mr2695550a91.3.1723525237077;
        Mon, 12 Aug 2024 22:00:37 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1fcf275aesm6099523a91.32.2024.08.12.22.00.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 22:00:36 -0700 (PDT)
Message-ID: <70ce6ecd-a5a0-42a7-9063-2982f18078cc@broadcom.com>
Date: Mon, 12 Aug 2024 22:00:35 -0700
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] firmware: arm_scmi: Support 'reg-io-width' property
 for shared memory
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 arm-scmi@vger.kernel.org, james.quinlan@broadcom.com,
 justin.chen@broadcom.com, kapil.hali@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com
References: <20240810214621.14417-1-florian.fainelli@broadcom.com>
 <20240810214621.14417-3-florian.fainelli@broadcom.com>
 <ZrpD9rEyw37DV1J1@pluto> <40cd771e-5dab-498b-b77d-e0de4281fce9@broadcom.com>
Content-Language: en-US
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
In-Reply-To: <40cd771e-5dab-498b-b77d-e0de4281fce9@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/12/2024 10:46 AM, Florian Fainelli wrote:
[snip]
>> what about these (and other) header reads if reg-io-width is defined 
>> as < 32 ?
>> Should not these accesses be size-wise too ? or I am missing smth ...
> 
> Good question, I suppose it depends whether 'reg-io-width' means that 
> this must be the strict access width we use, or if this is the minimum 
> access width supported. If the former, then yes, we do have to make a 
> whole lot of changes to support the only access width being supported, 
> if the latter, then we ought to be OK, because doing a 32-bit access 
> should drive more byte enables at the bus level, yet still return the 
> expected data.
> 
> A minimum or only supported access width of 64-bit would be quite 
> interesting, and not somewhat compatible with how SCMI is defined, so 
> maybe that one should not be supported at all, even if this is how 
> memcpy_{to,from}_io() decides to operate on parts of the memory that are 
> 8bytes aligned.

I am inclined to dropping support for doing 1 and 2 byte accesses, and 
support only 4-byte accesses, since the existing SCMI code makes use of 
io{read,write}32 in many places, unless you feel strongly about it.

1 and 2 byte accesses only do not quite make sense for a SRAM IMHO, that 
is, if you can support 1 byte, then you must support 4 byte, too.
-- 
Florian

