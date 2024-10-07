Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F152AF00
	for <arm-scmi@vger.kernel.org>; Mon,  7 Oct 2024 17:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728323933; cv=none; b=Zt3uaysNyDO0MJlq7clajx/XwyEDh7j6WSh1YL4KTc5Ea8z3oFiOUmWrY8az5kxDJlSmpnvI/G5u/QPFQ/1NLIyE56lZaxBEZQ8haxtds8BKhVAkF/10lX7rs84RmFO4SwGMvLS6k37Qnwu8Uv0ppbyF7d+44mCsU9+u6ipet0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728323933; c=relaxed/simple;
	bh=VU38pcTrdtaQbFGkcvFS8V0I9To7HMhGctgLu6o7A1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HXYXUjmHPMMtBRdljZRDNtT+YKVfWvpdR/n6OrxcJG0ZdJKT8/sDUKl6Y3H0XMFTl0nbIoinlntw6vfYoASUJIgp185eDB5yNLSd11l0mA2JYG8Ny6P9us7/BsmAOgekiraHzKxcmZZZxgQ0Gb8HRr9RTFPOq9n/w/KMwlTvw1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=eC9U7XKW; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="eC9U7XKW"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6cb2ad51162so42719766d6.3
        for <arm-scmi@vger.kernel.org>; Mon, 07 Oct 2024 10:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1728323930; x=1728928730; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NZv5qbbJUkGv24unDjpJ20uMGTPMYfnrD1RMmIDanKk=;
        b=eC9U7XKWiENFBK/ZUZbuRA3SQ7hszKhl4Hm0bNNom2DlCAWp822/ih7OkXu+T/8qfd
         YjU16sXxgOMQ3tqDmWJ7SVudl0HgrJ2VKXSSp7cHOOm6T5ZCUJfhvchyKGcmwdpMsIc0
         J887WSoplB7QuTgIDGRfQeuWmOO4+2FIpJDI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728323930; x=1728928730;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NZv5qbbJUkGv24unDjpJ20uMGTPMYfnrD1RMmIDanKk=;
        b=ExCN4UywESzyIP9Hy3b3ZQBAmdM03TdjLrlo5penyDnWTcXORUFg/yww7FF3rHfaKB
         Eiu7hAOkjeYAie8V/RBtQS7On25+GN6LXGFfLi0gObTonxQ3u6Fl3UHacahx2KIN3j6J
         FghUYbS6djHq4H36O3kWgV+6SMDljenLBAoh+z6zmVU325JtqR0I6crFhcA4gfqdZJYt
         5isgP75g5N8etB9hsgPWPOF2qqx1Bvllt6CC31OWwi7i2MP0GMKVWjaO89JFxCPNYLC7
         duhwuvVW95K5OK1vwbqkRaraJWoh+TwYpF604GWmnJsOz2kpdKlAehsZglB9TSwo3Mgm
         szVQ==
X-Gm-Message-State: AOJu0Yyjv0tp+E6dK2SPL9z/BJDnqQpJB5wkIXsh8j8hrmGqXQKuzscl
	uySUrsIzr+5W9W971eKjzeo2zlm17UDoNCa+6MqAWUmOKtAAwmvlIUAOVbksNg==
X-Google-Smtp-Source: AGHT+IG+Fp5D/JcuEV8vkTjYnQODmiuNTAMoMah19yYazQ/VNwju3XNOspP8rkDijc8pJy/SYC2w6A==
X-Received: by 2002:a05:6214:318b:b0:6cb:2f11:6b9 with SMTP id 6a1803df08f44-6cb9a308154mr191960916d6.23.1728323930322;
        Mon, 07 Oct 2024 10:58:50 -0700 (PDT)
Received: from [10.69.69.40] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cba46cd225sm27918646d6.19.2024.10.07.10.58.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 10:58:49 -0700 (PDT)
Message-ID: <1ad5c4e9-9f98-40ab-afa4-a7939781e8cc@broadcom.com>
Date: Mon, 7 Oct 2024 10:58:47 -0700
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: arm_scmi: Queue in scmi layer for mailbox
 implementation
To: Cristian Marussi <cristian.marussi@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 peng.fan@nxp.com, bcm-kernel-feedback-list@broadcom.com,
 florian.fainelli@broadcom.com
References: <20241004221257.2888603-1-justin.chen@broadcom.com>
 <ZwPcSmRpTGrCdt6I@bogus> <ZwPd1Z2jl0A46hEU@pluto>
Content-Language: en-US
From: Justin Chen <justin.chen@broadcom.com>
In-Reply-To: <ZwPd1Z2jl0A46hEU@pluto>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/7/24 6:10 AM, Cristian Marussi wrote:
> On Mon, Oct 07, 2024 at 02:04:10PM +0100, Sudeep Holla wrote:
>> On Fri, Oct 04, 2024 at 03:12:57PM -0700, Justin Chen wrote:
>>> The mailbox layer has its own queue. However this confuses the per
>>> message timeouts since the clock starts ticking the moment the messages
>>> get queued up. So all messages in the queue have there timeout clocks
>>> ticking instead of only the message inflight. To fix this, lets move the
>>> queue back into the SCMI layer.
>>>
>>
>> I think this has come up in the past. We have avoided adding addition
>> locking here as the mailbox layer takes care of it. Has anything changed
>> recently ?
> 
> I asked for an explanation in my reply (we crossed each other mails probably)
> since it alredy came up in the past a few times and central locking seemed not
> to be needed...here the difference is about the reason...Justin talks about
> message timeouts related to the queueing process..so I asked to better
> explain the detail (and the anbomaly observed) since it still does not
> seem to me that even in this case the lock is needed....anyway I can
> definitely be woring of course :D
> 

Hello Cristian,

Thanks for the response. I'll try to elaborate.

When comparing SMC and mailbox transport, we noticed mailbox transport 
timesout much quicker when under load. Originally we thought this was 
the latency of the mailbox implementation, but after debugging we 
noticed a weird behavior. We saw SMCI transactions timing out before the 
mailbox even transmitted the message.

This issue lies in the SCMI layer. drivers/firmware/arm_scmi/driver.c 
do_xfer() function.

The fundamental issue is send_message() blocks for SMC transport, but 
doesn't block for mailbox transport. So if send_message() doesn't block 
we can have multiple messages waiting at scmi_wait_for_message_response().

SMC looks like this
CPU #0 SCMI message 0 -> calls send_message() then calls 
scmi_wait_for_message_response(), timesout after 30ms.
CPU #1 SCMI message 1 -> blocks at send_message() waiting for SCMI 
message 0 to complete.

Mailbox looks like this
CPU #0 SCMI message 0 -> calls send_message(), mailbox layer queues up 
message, mailbox layer sees no message is outgoing and sends it. CPU 
waits at scmi_wait_for_message_response(), timesout after 30ms
CPU #1 SCMI message 1 -> calls send_message(), mailbox layer queues up 
message, mailbox layer sees message pending, hold message in queue. CPU 
waits at scmi_wait_for_message_response(), timesout after 30ms.

Lets say if transport takes 25ms. The first message would succeed, the 
second message would timeout after 5ms.

Hopefully this makes sense.

Justin


