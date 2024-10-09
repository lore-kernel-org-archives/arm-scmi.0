Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552B817798F
	for <arm-scmi@vger.kernel.org>; Wed,  9 Oct 2024 19:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728501651; cv=none; b=FVgZTaa3Tce3QmP82CEySGPiUOiRhK1vd9CPCq1AXOEe5p1ezzzDr1MXoBzlYF7Ifs355kompwolBrF/YKMlHbJw1R18lk/x0CgiIcZWX3FkYevwyARV4bvU1sHcNk8qlJzmyYGKlgagB++EvHXOMQawTwnMFIAXAC8efCuIomE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728501651; c=relaxed/simple;
	bh=vBZeIJE3CGkBLCuRhgoME/MJ8Tqp0D9I3mEf6AZ210s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hhtNb9vR/09oy4z/CQBMvxdz7ibzjmdzf7QZ07cY1bn2fhOkE8GhZV6jfUfLAU3fq+Sszn05i8YGVWUuuiMUzUp7kXzueaOnrdZeSEU035A1BmgW0KHIjpKiLiQIktawxPaT5HrpRBEx41FD70GxkYlXtuPOlLL6UVufHCr+Ygo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=A8KAWTfp; arc=none smtp.client-ip=209.85.160.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="A8KAWTfp"
Received: by mail-qt1-f195.google.com with SMTP id d75a77b69052e-45effbc3348so1596781cf.2
        for <arm-scmi@vger.kernel.org>; Wed, 09 Oct 2024 12:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1728501648; x=1729106448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QC4iyrQCc29xqoyIK8hs1g1UmoTbdeAtwVRtUIjdovM=;
        b=A8KAWTfpHaeNZqXjqOSL8ITRz2bTg2MyWlwqbrHewsXsjMoUha0A4AVsWlGEfoBEXW
         WI6Q3GrqCfZsQSxJo74msMAWZ42iorR7UVz25QFgi1XQe8Aq/AOYOPrWoB/YEoFDy1xY
         CmtZOzkDcKItvISqW3PsQ2peYvrv32NkYaF8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728501648; x=1729106448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QC4iyrQCc29xqoyIK8hs1g1UmoTbdeAtwVRtUIjdovM=;
        b=QZAF18YyWfmt/Uw8IS3rofXUXfYj6+3Zk9o5b5qChqKtMF3N2/mPMy9KVQqL5ZYTGd
         4aAFw6U6qqb6f3a8xL1QTWEMds2vKcQUNd+PODSBmf718LEqxQh8kZG6bjMBa0fxDkID
         PxZagIxEUSQ4fBy6ngwWdwm0ZibZelkrRw/4bo5HVJ5RgLGleLZOe8DtBa5UUE0W+uG5
         6swLpKQGiVG64LBZKd6kxqqgu+Db2Zxcj9ARp6x4co37O9Pk56/kBgenVxZdA5X0VC2O
         Poo7C5kNrkHQbfWY8q6hmm+UHaVJkb3y1cQy+FWZxEqIj3rwSj6GlpU8P2h9wm5Hpnz1
         C6AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcea47XqYFU8rNOlpHEf9oi5Qqaj1EW9r1Bl7Dr6lw7p30em+b4v9ajOArDMNZop5ADgMfxsMH7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpNLuZ4IWi3fjbj+T6DxHtNhh2D6NkupNyUwhUaoNq5nK/ZH1z
	AROaWaXew/1gaK6/7FuW/VihCYudw6sEx0XpizC0T4foW03tV/BR6SiLy9+N0g==
X-Google-Smtp-Source: AGHT+IEHkpKuLHIzweOclcuS1w+ydNVY+EW5dw1R/cdDKBZgrPXGHLcodKF5UpmacARcyrjJxiRQ5Q==
X-Received: by 2002:a05:622a:2b09:b0:45e:f2df:2ed3 with SMTP id d75a77b69052e-45fa5f03547mr62390651cf.32.1728501648020;
        Wed, 09 Oct 2024 12:20:48 -0700 (PDT)
Received: from [10.69.69.40] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45da74b3f6csm49226581cf.16.2024.10.09.12.20.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 12:20:47 -0700 (PDT)
Message-ID: <73c69285-57ad-4628-b72e-9cae4ebff574@broadcom.com>
Date: Wed, 9 Oct 2024 12:20:45 -0700
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: arm_scmi: Queue in scmi layer for mailbox
 implementation
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com,
 bcm-kernel-feedback-list@broadcom.com, florian.fainelli@broadcom.com
References: <20241004221257.2888603-1-justin.chen@broadcom.com>
 <ZwPcSmRpTGrCdt6I@bogus> <ZwPd1Z2jl0A46hEU@pluto>
 <1ad5c4e9-9f98-40ab-afa4-a7939781e8cc@broadcom.com> <ZwUhP0SYEXUKpRG-@pluto>
 <ZwUyNCnXmjtVbhai@bogus> <ZwU1A_R81_ed4L8o@bogus> <ZwU1m4Uj9uF2bzoE@pluto>
 <ed8b9825-c655-4712-806e-fee22f30c113@broadcom.com> <ZwY_nrvxCEkDgN8u@pluto>
Content-Language: en-US
From: Justin Chen <justin.chen@broadcom.com>
In-Reply-To: <ZwY_nrvxCEkDgN8u@pluto>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/9/24 1:32 AM, Cristian Marussi wrote:
> On Tue, Oct 08, 2024 at 12:23:28PM -0700, Justin Chen wrote:
>>
>>
>> On 10/8/24 6:37 AM, Cristian Marussi wrote:
>>> On Tue, Oct 08, 2024 at 02:34:59PM +0100, Sudeep Holla wrote:
>>>> On Tue, Oct 08, 2024 at 02:23:00PM +0100, Sudeep Holla wrote:
>>>>> On Tue, Oct 08, 2024 at 01:10:39PM +0100, Cristian Marussi wrote:
>>>>>> On Mon, Oct 07, 2024 at 10:58:47AM -0700, Justin Chen wrote:
>>>>>>> Thanks for the response. I'll try to elaborate.
>>>>>>>
>>>>>>> When comparing SMC and mailbox transport, we noticed mailbox transport
>>>>>>> timesout much quicker when under load. Originally we thought this was the
>>>>>>> latency of the mailbox implementation, but after debugging we noticed a
>>>>>>> weird behavior. We saw SMCI transactions timing out before the mailbox even
>>>>>>> transmitted the message.
>>>>>>>
>>>>>>> This issue lies in the SCMI layer. drivers/firmware/arm_scmi/driver.c
>>>>>>> do_xfer() function.
>>>>>>>
>>>>>>> The fundamental issue is send_message() blocks for SMC transport, but
>>>>>>> doesn't block for mailbox transport. So if send_message() doesn't block we
>>>>>>> can have multiple messages waiting at scmi_wait_for_message_response().
>>>>>>>
>>>>>>
>>>>>> oh...yes...now I can see it...tx_prepare is really never called given
>>>>>> how the mailbox subsystem de-queues messages once at time...so we end up
>>>>>> waiting for a reply to some message that is still to be sent...so the
>>>>>> message inflight is really NOT corrupted because the next remain pending
>>>>>> until the reply in the shmem is read back , BUT the timeout will drift away
>>>>>> if you multiple inflights are pending to be sent...
>>>>>>
>>>>>
>>>>> Indeed.
>>>>>
>>>>>>> SMC looks like this
>>>>>>> CPU #0 SCMI message 0 -> calls send_message() then calls
>>>>>>> scmi_wait_for_message_response(), timesout after 30ms.
>>>>>>> CPU #1 SCMI message 1 -> blocks at send_message() waiting for SCMI message 0
>>>>>>> to complete.
>>>>>>>
>>>>>>> Mailbox looks like this
>>>>>>> CPU #0 SCMI message 0 -> calls send_message(), mailbox layer queues up
>>>>>>> message, mailbox layer sees no message is outgoing and sends it. CPU waits
>>>>>>> at scmi_wait_for_message_response(), timesout after 30ms
>>>>>>> CPU #1 SCMI message 1 -> calls send_message(), mailbox layer queues up
>>>>>>> message, mailbox layer sees message pending, hold message in queue. CPU
>>>>>>> waits at scmi_wait_for_message_response(), timesout after 30ms.
>>>>>>>
>>>>>>> Lets say if transport takes 25ms. The first message would succeed, the
>>>>>>> second message would timeout after 5ms.
>>>>>>>
>>>>>>> Hopefully this makes sense.
>>>>>>
>>>>>> Yes, of course, thanks, for reporting this, and taking time to
>>>>>> explain...
>>>>>>
>>>>>> ...in general the patch LGTM...I think your patch is good also because it
>>>>>> could be easily backported as a fix....can you add a Fixes tag in your
>>>>>> next version ?
>>>>>>
>>>>>
>>>>> Are you seeing this issue a lot ? IOW, do we need this to be backported ?
>>>>>
>>
>> I wouldn't say a lot. But we are seeing it with standard use of our devices
>> running over an extended amount of time. Yes we would like this backported.
>>
>>>>>> Also can you explain in more detail the issue and the solution in the commit
>>>>>> message....that will help having it merged as a Fix in stables...
>>>>>>
>>>>>> ...for the future (definitely NOT in this series) we could probably think to
>>>>>> get rid of the sleeping mutex in favour of some other non-sleeping form of
>>>>>> mutual exclusion around the channnel (like in SMC transport) and enable
>>>>>> (optionally) Atomic transmission support AND also review if the shmem
>>>>>> layer busy-waiting in txprepare is anymore needed at all...
>>>>>>
>>>>>
>>>>> Agreed, if we are locking the channel in SCMI, we can drop the busy-waiting
>>>>> in tx_prepare and the associated details in the comment as this locking
>>>>> voids that. It is better have both the changes in the same patch to indicate
>>>>> the relation between them.
>>>>
>>>> Actually scratch that last point. The waiting in tx_prepare until the platform
>>>> marks it free for agent to use is still needed. One usecase is when agent/OS
>>>> times out but platform continues to process and eventually releases the shmem.
>>>> Sorry I completely forgot about that.
>>>>
>>>
>>> Yes indeed it is the mechanism that we avoid to reclaim forcibly anyway the shmem
>>> if the transmission times out...and we should keep that to avoid
>>> corruption of newer messages by late replies from the earlier ones that
>>> have timed out.
>>>
>>
>> Yup. I saw an interesting interaction from this. Since modifying shmem and
>> ringing the doorbell are often two different task. The modification of shmem
>> can race with processing of timed out messages from the platform. This
>> usually leads to an early ACK and spurious interrupt. Mostly harmless. We
>> did see lockups when multiple timeouts occur, but it was unclear if this was
>> an issue with the SCMI transport layer or our driver/platform.
>>
> 
> Are you talking about something similar to this:
> 
> https://lore.kernel.org/all/20231220172112.763539-1-cristian.marussi@arm.com/
> 
> ... reported as a side effect of a spurious IRQ on late timed-out
> replies, it should have been fixed with the above commit in v6.8.
> 

I had these fixes and saw these warning message. With these locking 
changes, I no longer see the lock up. Guess they were related somehow. 
Either way, Thanks for the review. v2 incoming.

Justin

> Thanks,
> Cristian

