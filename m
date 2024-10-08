Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F77723A6
	for <arm-scmi@vger.kernel.org>; Tue,  8 Oct 2024 05:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728363756; cv=none; b=i2T/lBzcrwKteinez3QRAN3jwTYr296p2c02mqSjUZLwWWzf3fEZhgdd0isq1J5UmwLUaqYbhbd0DJ4CnPwdR3p0rOg9fMJS2KdahJEdHyZ9O5aED2hvx1WkqJI7/m7bub7ojwVz5QprZIn6EBOrTokaC7LZDPksuVepO4T2kDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728363756; c=relaxed/simple;
	bh=vv8sTX+Yr9jiaV/nR/v7o5mn5+rBdQWkiE70EgotGD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BDjW/BoYmzyBDoroVA7w1nDHPWxa+VaTh8Q6E58vAu7acmr+50tJfmUhP+CrX0pJ1vRqIpsT25G5Ht7ugJw3wtAkqajTDH/zwW00zhvcK0zJVKkUSwjFbXbJo+KyutR63yweybHbci0tW0iSg3ggPVvYeuFidPzeu/xonynSAhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=TQGUZnma; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="TQGUZnma"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20b7a4336easo38167385ad.3
        for <arm-scmi@vger.kernel.org>; Mon, 07 Oct 2024 22:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1728363754; x=1728968554; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pxi2ug8hQ1leGmc2gZxWeO2a5Yus7SNrn9aUqgKLhvY=;
        b=TQGUZnma8yktfnhfoceJpwZfDonwwPb9syDfyWbNsefzihc0um8sxw68W5BnN+vfjc
         JMt8aHBwgBcFrU6DUMD91XrxFOse+ymuOxjgCVWs8wDh3zDEMvcL9iPDwj5YKAvx/ZRQ
         mY9RqhN24hxm756H4GKm1WYLlKF8cushvY450=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728363754; x=1728968554;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pxi2ug8hQ1leGmc2gZxWeO2a5Yus7SNrn9aUqgKLhvY=;
        b=O1BtOhK2+yonbUrEWwqzgr6oEEt5QhVqIuVF0XSSRleiX1H72BzWl7PjKxcpmUHb1w
         4gHpnrlFCW31vbPrhRebV4Iq3hMjLGogbaFWz9C1nTOVt4oQgfrmq7B5dJ6XxGB59SKS
         9AnbGY3mGmCtEmD56znq/Nqq+Py3ofu+osCdVjOmYxeBUEuHaK8nHEI2iSiwqrwD/z9+
         VjvqaNBKA/RHkdYvuj1nZd++x2c+tbI1B1PTvTQ6A97PWqaYqjmbL3gaOCRcDkI69Q28
         DqXf1J+dvx499D9GrNWsUK90umT4R9+ycHNj063qFmPFUnskbawJsSaxVoxqwq77lspC
         CEKg==
X-Gm-Message-State: AOJu0Yyhv1UcQtu9ySPFryyywfwQrKUOIDLiQDCC/rGcnqNhmUIr5nF1
	GErSHS8ztWswXytbgOry8GJm+GABS9NOJagiVeQ0O+6x6O6BmRKP3rmDXkWVJA==
X-Google-Smtp-Source: AGHT+IHQAo+KmmP+EUY6IKV7G7h/MEpeQjlzyOoQJ0+TpzBAm4RCGeQJG3vbYMnnym1G9bLx2tjQEA==
X-Received: by 2002:a17:902:e547:b0:20b:7be8:8eb9 with SMTP id d9443c01a7336-20bff04dbf4mr186119895ad.54.1728363753761;
        Mon, 07 Oct 2024 22:02:33 -0700 (PDT)
Received: from [192.168.68.79] ([136.52.15.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c54010718sm4133905ad.240.2024.10.07.22.02.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 22:02:33 -0700 (PDT)
Message-ID: <ad158a37-5bba-40d9-ab45-8039d1cc68e0@broadcom.com>
Date: Mon, 7 Oct 2024 22:02:32 -0700
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: arm_scmi: Queue in scmi layer for mailbox
 implementation
To: Peng Fan <peng.fan@nxp.com>, Cristian Marussi <cristian.marussi@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>
Cc: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "florian.fainelli@broadcom.com" <florian.fainelli@broadcom.com>
References: <20241004221257.2888603-1-justin.chen@broadcom.com>
 <ZwPcSmRpTGrCdt6I@bogus> <ZwPd1Z2jl0A46hEU@pluto>
 <1ad5c4e9-9f98-40ab-afa4-a7939781e8cc@broadcom.com>
 <PAXPR04MB845987450029059DDF5DE4C8887E2@PAXPR04MB8459.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Justin Chen <justin.chen@broadcom.com>
In-Reply-To: <PAXPR04MB845987450029059DDF5DE4C8887E2@PAXPR04MB8459.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/7/2024 7:43 PM, Peng Fan wrote:
>> Subject: Re: [PATCH] firmware: arm_scmi: Queue in scmi layer for
>> mailbox implementation
>>
>>
>>
>> On 10/7/24 6:10 AM, Cristian Marussi wrote:
>>> On Mon, Oct 07, 2024 at 02:04:10PM +0100, Sudeep Holla wrote:
>>>> On Fri, Oct 04, 2024 at 03:12:57PM -0700, Justin Chen wrote:
>>>>> The mailbox layer has its own queue. However this confuses the
>> per
>>>>> message timeouts since the clock starts ticking the moment the
>>>>> messages get queued up. So all messages in the queue have there
>>>>> timeout clocks ticking instead of only the message inflight. To fix
>>>>> this, lets move the queue back into the SCMI layer.
>>>>>
>>>>
>>>> I think this has come up in the past. We have avoided adding
>> addition
>>>> locking here as the mailbox layer takes care of it. Has anything
>>>> changed recently ?
>>>
>>> I asked for an explanation in my reply (we crossed each other mails
>>> probably) since it alredy came up in the past a few times and central
>>> locking seemed not to be needed...here the difference is about the
>>> reason...Justin talks about message timeouts related to the queueing
>>> process..so I asked to better explain the detail (and the anbomaly
>>> observed) since it still does not seem to me that even in this case
>>> the lock is needed....anyway I can definitely be woring of course :D
>>>
>>
>> Hello Cristian,
>>
>> Thanks for the response. I'll try to elaborate.
>>
>> When comparing SMC and mailbox transport, we noticed mailbox
>> transport timesout much quicker when under load. Originally we
>> thought this was the latency of the mailbox implementation, but after
>> debugging we noticed a weird behavior. We saw SMCI transactions
>> timing out before the mailbox even transmitted the message.
>>
>> This issue lies in the SCMI layer. drivers/firmware/arm_scmi/driver.c
>> do_xfer() function.
>>
>> The fundamental issue is send_message() blocks for SMC transport, but
>> doesn't block for mailbox transport. So if send_message() doesn't block
>> we can have multiple messages waiting at
>> scmi_wait_for_message_response().
>>
>> SMC looks like this
>> CPU #0 SCMI message 0 -> calls send_message() then calls
>> scmi_wait_for_message_response(), timesout after 30ms.
>> CPU #1 SCMI message 1 -> blocks at send_message() waiting for SCMI
>> message 0 to complete.
>>
>> Mailbox looks like this
>> CPU #0 SCMI message 0 -> calls send_message(), mailbox layer queues
>> up message, mailbox layer sees no message is outgoing and sends it.
>> CPU waits at scmi_wait_for_message_response(), timesout after 30ms
>> CPU #1 SCMI message 1 -> calls send_message(), mailbox layer queues
>> up message, mailbox layer sees message pending, hold message in
>> queue. CPU waits at scmi_wait_for_message_response(), timesout after
>> 30ms.
>>
>> Lets say if transport takes 25ms. The first message would succeed, the
>> second message would timeout after 5ms.
> 
> Each xfer has its own completion, how the 2nd impacts the 1st?
> 
> Regards,
> Peng.
> 

Hello Peng,

The mailbox layer queues messages and doesn't block when send_message() 
is called. So we can have both xfer waiting for completion at the same time.

Lets assume a message takes 25ms to complete, with a 30ms timeout.

0ms Message #0 is queued in mailbox layer and sent out, then sits at 
scmi_wait_for_message_response() with a timeout of 30ms
1ms Message #1 is queued in mailbox layer but not sent out yet. Since 
send_message() doesn't block, it also sits at 
scmi_wait_for_message_response() with a timeout of 30ms
...
25ms Message #0 is completed, txdone is called and Message #1 is sent out
31ms Message #1 times out since the count started at 1ms. Even though it 
has only been inflight for 6ms.

Thanks,
Justin

>>
>> Hopefully this makes sense.
>>
>> Justin
>>
> 

