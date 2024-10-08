Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344D28F6D
	for <arm-scmi@vger.kernel.org>; Tue,  8 Oct 2024 19:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728415413; cv=none; b=KGDtSb1TTcwUGs3Z8rw6Nu1yGDojsfSlJq08+q9N69aSQfj/uPFKWEYgc0q3qQwClwscvUofjHXMsn6hTkjKonCRU5CpcD5D4p2SailukQUnZa9RLAS1Q/UvdeFPCY03BOAPdf5V8yc32GdgijlfsElH1T1MrZByiTXXvMqGT6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728415413; c=relaxed/simple;
	bh=3kqz7cKZ0GboNB9rIGGbz60vaZKFYw31s+vdU9ne+N0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nrCuo/sSg0fZv4GWwesK9vfec4VxvarZm7EXYdJJ5XSc7PUPhF4RgtWK8ieOVISKjHjk+uRSgeGDZwu9RtNi4NTi2MrON7YWxuRAl7pCPuRDnN1n/N2DkwzXDls87uXfj4w4CBUsPKI+XdujU4/GF8joaWnoUWv+q35HXp1+TUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Gi/NoGtI; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Gi/NoGtI"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20c544d345cso1120645ad.1
        for <arm-scmi@vger.kernel.org>; Tue, 08 Oct 2024 12:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1728415410; x=1729020210; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tP/44csl894TIT2SAvjUKUFa5xLBVseL561nlYqxDg4=;
        b=Gi/NoGtIcEdQifsyh4qb+vKYTIfRQ7GgoUu/JPjgjcp8USbqtH+3bivSWiJvN7yNzx
         TfqJX+NXcgVsFTsHA5sfgvdhovqoPNHgoKhYO1Xqj4GVk6bdpLAjQ7SqjL95yBlrkQDf
         HinM/Z6+/YblVE4ucgpaNSRAEm8buIEsBsCeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728415410; x=1729020210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tP/44csl894TIT2SAvjUKUFa5xLBVseL561nlYqxDg4=;
        b=D3gxb+t5WVYaNk5WR04wwRmDtLHnwKc8gJtwbvXVKQoH2fyigtaxBWzsFOZiRqCwFA
         fqMhxCJvhshV0/fjTEYtRzjBnC3Zw2RoCP/txoLSTqP5OEBXrJavsSai6BiMqr8N4yy9
         9ZHV47YnPOXk6EI5etMeMjaTxKNKSpa20z96JB0CP0XnN0njMwvRO7oNf/z1G7oo1L1y
         DOZ+iF1cONXvJnCGMkylaQEuofOSG24xP8anWfjUdXvyMKYXRcdR5UdEft8Hr1lB7V7R
         15+ynBn5vL6Gdpt6w6LZEQADQQG2MOTvajXoOIkXTC9JtItoc7Ub5HrHW6j0hZfRe+zz
         vzTQ==
X-Gm-Message-State: AOJu0YwghPEfekMk89/KQpfHHh3/KzJe54ddnCjwDy+zPnraqkC2FQtS
	L8SRj6N6IX7zmpHxQaxxUtcjk+WhIOBEN8RWgBWrrN6g4wr0WaevU/SpUEIThg==
X-Google-Smtp-Source: AGHT+IEoV875Uu6dqXuhg2GK08E5fwLbpvVmEftd4HuP+k6S9fyfzXquB9sQ4QlYL03J98CdBv8h/g==
X-Received: by 2002:a17:903:2343:b0:20b:7902:3456 with SMTP id d9443c01a7336-20c6316516emr2650175ad.1.1728415410305;
        Tue, 08 Oct 2024 12:23:30 -0700 (PDT)
Received: from [10.69.69.40] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c54056b07sm14933485ad.64.2024.10.08.12.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 12:23:29 -0700 (PDT)
Message-ID: <ed8b9825-c655-4712-806e-fee22f30c113@broadcom.com>
Date: Tue, 8 Oct 2024 12:23:28 -0700
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
 <1ad5c4e9-9f98-40ab-afa4-a7939781e8cc@broadcom.com> <ZwUhP0SYEXUKpRG-@pluto>
 <ZwUyNCnXmjtVbhai@bogus> <ZwU1A_R81_ed4L8o@bogus> <ZwU1m4Uj9uF2bzoE@pluto>
Content-Language: en-US
From: Justin Chen <justin.chen@broadcom.com>
In-Reply-To: <ZwU1m4Uj9uF2bzoE@pluto>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/8/24 6:37 AM, Cristian Marussi wrote:
> On Tue, Oct 08, 2024 at 02:34:59PM +0100, Sudeep Holla wrote:
>> On Tue, Oct 08, 2024 at 02:23:00PM +0100, Sudeep Holla wrote:
>>> On Tue, Oct 08, 2024 at 01:10:39PM +0100, Cristian Marussi wrote:
>>>> On Mon, Oct 07, 2024 at 10:58:47AM -0700, Justin Chen wrote:
>>>>> Thanks for the response. I'll try to elaborate.
>>>>>
>>>>> When comparing SMC and mailbox transport, we noticed mailbox transport
>>>>> timesout much quicker when under load. Originally we thought this was the
>>>>> latency of the mailbox implementation, but after debugging we noticed a
>>>>> weird behavior. We saw SMCI transactions timing out before the mailbox even
>>>>> transmitted the message.
>>>>>
>>>>> This issue lies in the SCMI layer. drivers/firmware/arm_scmi/driver.c
>>>>> do_xfer() function.
>>>>>
>>>>> The fundamental issue is send_message() blocks for SMC transport, but
>>>>> doesn't block for mailbox transport. So if send_message() doesn't block we
>>>>> can have multiple messages waiting at scmi_wait_for_message_response().
>>>>>
>>>>
>>>> oh...yes...now I can see it...tx_prepare is really never called given
>>>> how the mailbox subsystem de-queues messages once at time...so we end up
>>>> waiting for a reply to some message that is still to be sent...so the
>>>> message inflight is really NOT corrupted because the next remain pending
>>>> until the reply in the shmem is read back , BUT the timeout will drift away
>>>> if you multiple inflights are pending to be sent...
>>>>
>>>
>>> Indeed.
>>>
>>>>> SMC looks like this
>>>>> CPU #0 SCMI message 0 -> calls send_message() then calls
>>>>> scmi_wait_for_message_response(), timesout after 30ms.
>>>>> CPU #1 SCMI message 1 -> blocks at send_message() waiting for SCMI message 0
>>>>> to complete.
>>>>>
>>>>> Mailbox looks like this
>>>>> CPU #0 SCMI message 0 -> calls send_message(), mailbox layer queues up
>>>>> message, mailbox layer sees no message is outgoing and sends it. CPU waits
>>>>> at scmi_wait_for_message_response(), timesout after 30ms
>>>>> CPU #1 SCMI message 1 -> calls send_message(), mailbox layer queues up
>>>>> message, mailbox layer sees message pending, hold message in queue. CPU
>>>>> waits at scmi_wait_for_message_response(), timesout after 30ms.
>>>>>
>>>>> Lets say if transport takes 25ms. The first message would succeed, the
>>>>> second message would timeout after 5ms.
>>>>>
>>>>> Hopefully this makes sense.
>>>>
>>>> Yes, of course, thanks, for reporting this, and taking time to
>>>> explain...
>>>>
>>>> ...in general the patch LGTM...I think your patch is good also because it
>>>> could be easily backported as a fix....can you add a Fixes tag in your
>>>> next version ?
>>>>
>>>
>>> Are you seeing this issue a lot ? IOW, do we need this to be backported ?
>>>

I wouldn't say a lot. But we are seeing it with standard use of our 
devices running over an extended amount of time. Yes we would like this 
backported.

>>>> Also can you explain in more detail the issue and the solution in the commit
>>>> message....that will help having it merged as a Fix in stables...
>>>>
>>>> ...for the future (definitely NOT in this series) we could probably think to
>>>> get rid of the sleeping mutex in favour of some other non-sleeping form of
>>>> mutual exclusion around the channnel (like in SMC transport) and enable
>>>> (optionally) Atomic transmission support AND also review if the shmem
>>>> layer busy-waiting in txprepare is anymore needed at all...
>>>>
>>>
>>> Agreed, if we are locking the channel in SCMI, we can drop the busy-waiting
>>> in tx_prepare and the associated details in the comment as this locking
>>> voids that. It is better have both the changes in the same patch to indicate
>>> the relation between them.
>>
>> Actually scratch that last point. The waiting in tx_prepare until the platform
>> marks it free for agent to use is still needed. One usecase is when agent/OS
>> times out but platform continues to process and eventually releases the shmem.
>> Sorry I completely forgot about that.
>>
> 
> Yes indeed it is the mechanism that we avoid to reclaim forcibly anyway the shmem
> if the transmission times out...and we should keep that to avoid
> corruption of newer messages by late replies from the earlier ones that
> have timed out.
> 

Yup. I saw an interesting interaction from this. Since modifying shmem 
and ringing the doorbell are often two different task. The modification 
of shmem can race with processing of timed out messages from the 
platform. This usually leads to an early ACK and spurious interrupt. 
Mostly harmless. We did see lockups when multiple timeouts occur, but it 
was unclear if this was an issue with the SCMI transport layer or our 
driver/platform.

Thanks,
Justin

> Thanks,
> Cristian

