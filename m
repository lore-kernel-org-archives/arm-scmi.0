Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B50F7580C
	for <arm-scmi@vger.kernel.org>; Tue,  8 Oct 2024 16:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728404282; cv=none; b=lTtm/++HgCY2urndjFS55OzvxXDJ+TMsmuDR36t2zKl0d6kSNhJUYrnBaOytImL7RzzB1YMXayKUo138LTUzaWIHYgjPsgKnYTvbR84cXzUp6wDAU2e7OKSJ3vCHi8MydBhV23GUuc7QeYDdinve4fV1J67drzP/ua42szynYME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728404282; c=relaxed/simple;
	bh=PanHZpXIuiX7MT5ijoJ1fuLpDLYPGgGmINwqQ2naH+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g6RHMIOd82/rDoR47gaqCQ0dtDap+SP/X0eA6bg4jub73leiPHsi8hZVCRXogi6wr4hWsm/g9ROSbduOcbkud7VR1xjuerQDOaIzSngI6UvZ5InwB/WAxZvNeAtF6jjn2Dc5xwZaIEI/s9giS6ouWCfptEvdqfzcH1DM1dHyDI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=axt7gJoT; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="axt7gJoT"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-45812fdcd0aso58896261cf.0
        for <arm-scmi@vger.kernel.org>; Tue, 08 Oct 2024 09:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1728404279; x=1729009079; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KyHSO3l7jU1JiX3rNBQoK4qnbaDMR9ik8Q0ZaFIc3R4=;
        b=axt7gJoT25Bic0eZoNm0fvGKk8V9LJuEzCk60il2IVcK4G4DHUMxuXu5LwJDNIO0JX
         yz0h/9+dM7CbAThReGTi5Sfi/v4nDli94vYS9bBr46JVWcsWBq9mLCQksR50DPf6j8on
         IjnnzCOTzn/q7NOKQbooPKWVb6+gpFGFpsKS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728404279; x=1729009079;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyHSO3l7jU1JiX3rNBQoK4qnbaDMR9ik8Q0ZaFIc3R4=;
        b=SO8rcEXWL6k9ZeW5uwjY8n9uVPw7f3jhBBYNWU5ZAw1iJzB8z83naG60MBv6yRtrHG
         C+bTfsTD5yVHtmNMCvDbIcDh/5nW/FeW2RsSL5QMUkArbQhiztmwB0QmqsLvqJlS1T1c
         63PV2X3Dx4SWp2NfLICsGxaYNMzOu5hGUy8NED3mVQddCwrfIJTIyFFlzy8tr/D8VMzu
         38GBXO7HHtgx/h/lj+ux5pcgV20nRKnsZpHiCybkBleRbH72IEMes7sAsSq12pblPUU0
         ds/TWt+1Gyq0/i8Aw7T29RawubXFeuWFZxkFhmHulubFn4RVLEpbZJ/LGss2aOzz03Yy
         MP2A==
X-Forwarded-Encrypted: i=1; AJvYcCVIoPVjTKUCtzDciLqLkZ8Fh2GvlMVKDLPJwpD16ih4wmLo1vfXdiz+17pllFfSoRicCVgENgivRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdV+UFoH0EuQNpRgb03BJadByz4oNyq4vBHPG+iXB5oX6y0XCd
	clwdQoLz+0cHBwo3Lru28WznS0cSbBhAQpAqHxDQ1pcJpdvkW0LnFQ/MbVxTkQ==
X-Google-Smtp-Source: AGHT+IERitmsX6szhCsG+OIGMgobawnUb7yldZnoAY340AKApYneXhvk5MuqCF3SqVyZ1gFVpneJwQ==
X-Received: by 2002:ac8:5f08:0:b0:45f:3d1:24ad with SMTP id d75a77b69052e-45f08a84ca6mr11689651cf.13.1728404279078;
        Tue, 08 Oct 2024 09:17:59 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45f0966f1b3sm128741cf.44.2024.10.08.09.17.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 09:17:58 -0700 (PDT)
Message-ID: <71a08146-4230-4ee6-9502-573ca3e210be@broadcom.com>
Date: Tue, 8 Oct 2024 09:17:55 -0700
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] firmware: arm_scmi: Give SMC transport precedence over
 mailbox
To: Peng Fan <peng.fan@nxp.com>,
 "linux-arm-kernel@lists.infreadead.org"
 <linux-arm-kernel@lists.infreadead.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:SYSTEM CONTROL & POWER/MANAGEMENT INTERFACE"
 <arm-scmi@vger.kernel.org>,
 "moderated list:SYSTEM CONTROL & POWER/MANAGEMENT INTERFACE"
 <linux-arm-kernel@lists.infradead.org>,
 "justin.chen@broadcom.com" <justin.chen@broadcom.com>,
 "opendmb@gmail.com" <opendmb@gmail.com>,
 "kapil.hali@broadcom.com" <kapil.hali@broadcom.com>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>, Arnd Bergmann <arnd@arndb.de>
References: <20241007235413.507860-1-florian.fainelli@broadcom.com>
 <PAXPR04MB845905073FFB3B0967C7263F887E2@PAXPR04MB8459.eurprd04.prod.outlook.com>
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
In-Reply-To: <PAXPR04MB845905073FFB3B0967C7263F887E2@PAXPR04MB8459.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/7/24 19:14, Peng Fan wrote:
>> Subject: [PATCH v2] firmware: arm_scmi: Give SMC transport
>> precedence over mailbox
>>
>> Broadcom STB platforms have for historical reasons included both
>> "arm,scmi-smc" and "arm,scmi" in their SCMI Device Tree node
>> compatible string, in that order.
> 
> If compatible = "arm,scmi-smc", "arm,scmi", smc driver should be used.
> or I missed something?

That seems to indicate that the commit message was not explaining the 
issue clearly enough. Let me try again. While we had a single arm_scmi 
platform device/driver, we could match the above compatible string from 
most specific to least specific, and therefore the "smc" transport would 
be used.

Once the transport drivers each got broken up and became independent, 
and depending upon the order in which they are linked into the kernel, 
we will have mailbox.o being the first module_platform_driver entry 
attempt to match "arm,scmi" because that is the only entry it has in its 
of_match table. That matching succeeds, but later down the road we will 
fail to initialize the SCMI channel due to the lack of a suitable 
mailbox driver and set of Device Tree properties.

Because there is no fallback to try another transport, we just get stuck 
here.

> 
>>
>> After the commit cited in the Fixes tag and with a kernel configuration
>> that enables both the SMC and the Mailbox transports, we would
>> probe the mailbox transport, but fail to complete since we would not
>> have a mailbox driver available. With each SCMI transport being a
>> platform driver with its own set of compatible strings to match, rather
>> than an unique platform driver entry point, we no longer match from
>> most specific to least specific. There is also no simple way for the
>> mailbox driver to return -ENODEV and let another platform driver
>> attempt probing. This leads to a platform with no SCMI provider,
>> therefore all drivers depending upon SCMI resources are put on
>> deferred probe forever.
>>
>> By keeping the SMC transport objects linked first, we can let the
>> platform driver match the compatible string and probe successfully
>> with no adverse effects on platforms using the mailbox transport.
>>
>> Fixes: b53515fa177c ("firmware: arm_scmi: Make MBOX transport a
>> standalone driver")
>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
>> ---
>> Changes in v2:
>>
>> - removed downstream Change-Id
>> - s/SCMI/SMC in the second paragraph
>> - added details about what changed and how that affects the probing
>>
>>   drivers/firmware/arm_scmi/transports/Makefile | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/firmware/arm_scmi/transports/Makefile
>> b/drivers/firmware/arm_scmi/transports/Makefile
>> index 362a406f08e6..3ba3d3bee151 100644
>> --- a/drivers/firmware/arm_scmi/transports/Makefile
>> +++ b/drivers/firmware/arm_scmi/transports/Makefile
>> @@ -1,8 +1,10 @@
>>   # SPDX-License-Identifier: GPL-2.0-only -scmi_transport_mailbox-
>> objs := mailbox.o
>> -obj-$(CONFIG_ARM_SCMI_TRANSPORT_MAILBOX) +=
>> scmi_transport_mailbox.o
>> +# Keep before scmi_transport_mailbox.o to allow precedence # while
>> +matching the compatible.
>>   scmi_transport_smc-objs := smc.o
>>   obj-$(CONFIG_ARM_SCMI_TRANSPORT_SMC) +=
>> scmi_transport_smc.o
>> +scmi_transport_mailbox-objs := mailbox.o
>> +obj-$(CONFIG_ARM_SCMI_TRANSPORT_MAILBOX) +=
> 
> This seems more like a hack.

Yes, this is a hack, but it does not affect other platforms, and it 
helps us continue to test stable, linux-next and any kernel, therefore 
we would appreciate having this ability since we do provide testing for 
stable kernels, unlike other vendors.
-- 
Florian
