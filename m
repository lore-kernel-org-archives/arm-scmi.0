Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC0F1E04A0
	for <arm-scmi@vger.kernel.org>; Tue,  8 Oct 2024 19:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728416440; cv=none; b=eIj9rxi3pSv3KB22nBZA/BD1iN1ozZpyHnnIBzmWTAfibQXBB5gxaTROKzzzYLMtPgqgG4UPiAxHLaynze35S+caGObIifNDeZ4atN4lEZrGDrSLPGhxYyuwqrMJdclo45Xmxugzq60cEqrFsAgfy6ueiOCrWI6eaPvIMvpNBvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728416440; c=relaxed/simple;
	bh=aLolKOL40XLkO5ssLgGhw3pk7VGtm07BA+I8rYOr3YE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Fhw+izjF7FhoDQtnQlnn5mR2YFvVNWoOCsRaPTnGyChmIvCyWYZUx26bn4NPxodqBEIprgmbexLSYneC4BIen0A8gyiuDT88vrfm5GA8AF98MEYRUZId8YDvKmSPTSR2E32B9EZhdoiVRgk5grHB0z/yFHtU53NWP4u0N5PAgAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=HkURmQGi; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="HkURmQGi"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20ba8d92af9so46146595ad.3
        for <arm-scmi@vger.kernel.org>; Tue, 08 Oct 2024 12:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1728416439; x=1729021239; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dXD5jbEF7TBtPzV3enOnwQwebN+HoFp78mk6IJcIZHw=;
        b=HkURmQGi8cJFqz76pDMo1rcxkySBk8PBmQ9V11KFlG6OEAISnIUxYgsbMdvco8EbwH
         /iFwXMwra7qNw1CLs54z52pbE+4b4MHUOnGsxQdTd+lkkEErK6Uwh5LDChLk+xWbFbrf
         1VRju3lHCooHytV4sxlS9TSOGSkJGu6ukTawk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728416439; x=1729021239;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dXD5jbEF7TBtPzV3enOnwQwebN+HoFp78mk6IJcIZHw=;
        b=RhKcOxx6J1QP3siE/SjDeb+yPY69xMVjA3GK6qAjz+4MCDp24jJl3Xx/Wjd4MT9K+O
         SJO5RaxcLURHtDf1Dv42Z5NDO/6z6AMRlJC2vUGn6JOwCIDbs4QRQFhJVHZ1pG5FJkaj
         tWja3z3GHQ8ceZ4ekuIDOWhbWxHOvPJpE/WbsA7bZ64i3CrrLPfpNKXyGZTA4VY7JNI8
         vJlUC77Zq/hjaaOHf+N/KIy3t0/62uD7JwJeUlLUG91jxNrxi4Z2jOxDZfLltgHmVQcy
         INmeJGQKxpxuRajYgpH/vmx/2DeUoDKi/4LngdiO6DRNvMCBCpmVc/IHFiWwjWI8tZWU
         YjMg==
X-Gm-Message-State: AOJu0Ywv5i7yaIm8gyChLysDCID8i5Q5IsvM/DjTn2ISsdQ9mQQMy7BV
	z9NgEpe3uKkSWp8Vpbz/PgFnUPKRkpEXen/pz2J5pVo7qBMotEWNOLAPIMhEhw==
X-Google-Smtp-Source: AGHT+IHbgqBDXjQU1Boquz7ZlU7Y9QW1WgIfO5pEmEsB2Cw8p/omvogvQYCfksQhpWLK29AHzqgO7g==
X-Received: by 2002:a17:902:d491:b0:20b:983c:f095 with SMTP id d9443c01a7336-20c6378fc02mr1471115ad.51.1728416438782;
        Tue, 08 Oct 2024 12:40:38 -0700 (PDT)
Received: from [10.69.69.40] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c590b44fasm13534055ad.225.2024.10.08.12.40.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 12:40:38 -0700 (PDT)
Message-ID: <8f671ba8-db6e-4370-aeb8-16ec733eeb09@broadcom.com>
Date: Tue, 8 Oct 2024 12:40:37 -0700
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: arm_scmi: Queue in scmi layer for mailbox
 implementation
From: Justin Chen <justin.chen@broadcom.com>
To: Cristian Marussi <cristian.marussi@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 peng.fan@nxp.com, bcm-kernel-feedback-list@broadcom.com,
 florian.fainelli@broadcom.com
References: <20241004221257.2888603-1-justin.chen@broadcom.com>
 <ZwPcSmRpTGrCdt6I@bogus> <ZwPd1Z2jl0A46hEU@pluto>
 <1ad5c4e9-9f98-40ab-afa4-a7939781e8cc@broadcom.com> <ZwUhP0SYEXUKpRG-@pluto>
 <ZwUyNCnXmjtVbhai@bogus> <ZwU1A_R81_ed4L8o@bogus> <ZwU1m4Uj9uF2bzoE@pluto>
 <ed8b9825-c655-4712-806e-fee22f30c113@broadcom.com>
Content-Language: en-US
In-Reply-To: <ed8b9825-c655-4712-806e-fee22f30c113@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/8/24 12:23 PM, Justin Chen wrote:
> 
> 
> On 10/8/24 6:37 AM, Cristian Marussi wrote:
>> On Tue, Oct 08, 2024 at 02:34:59PM +0100, Sudeep Holla wrote:
>>> On Tue, Oct 08, 2024 at 02:23:00PM +0100, Sudeep Holla wrote:
>>>> On Tue, Oct 08, 2024 at 01:10:39PM +0100, Cristian Marussi wrote:
>>>>> On Mon, Oct 07, 2024 at 10:58:47AM -0700, Justin Chen wrote:
>>>>>> Thanks for the response. I'll try to elaborate.
>>>>>>
>>>>>> When comparing SMC and mailbox transport, we noticed mailbox 
>>>>>> transport
>>>>>> timesout much quicker when under load. Originally we thought this 
>>>>>> was the
>>>>>> latency of the mailbox implementation, but after debugging we 
>>>>>> noticed a
>>>>>> weird behavior. We saw SMCI transactions timing out before the 
>>>>>> mailbox even
>>>>>> transmitted the message.
>>>>>>
>>>>>> This issue lies in the SCMI layer. drivers/firmware/arm_scmi/driver.c
>>>>>> do_xfer() function.
>>>>>>
>>>>>> The fundamental issue is send_message() blocks for SMC transport, but
>>>>>> doesn't block for mailbox transport. So if send_message() doesn't 
>>>>>> block we
>>>>>> can have multiple messages waiting at 
>>>>>> scmi_wait_for_message_response().
>>>>>>
>>>>>
>>>>> oh...yes...now I can see it...tx_prepare is really never called given
>>>>> how the mailbox subsystem de-queues messages once at time...so we 
>>>>> end up
>>>>> waiting for a reply to some message that is still to be sent...so the
>>>>> message inflight is really NOT corrupted because the next remain 
>>>>> pending
>>>>> until the reply in the shmem is read back , BUT the timeout will 
>>>>> drift away
>>>>> if you multiple inflights are pending to be sent...
>>>>>
>>>>
>>>> Indeed.
>>>>
>>>>>> SMC looks like this
>>>>>> CPU #0 SCMI message 0 -> calls send_message() then calls
>>>>>> scmi_wait_for_message_response(), timesout after 30ms.
>>>>>> CPU #1 SCMI message 1 -> blocks at send_message() waiting for SCMI 
>>>>>> message 0
>>>>>> to complete.
>>>>>>
>>>>>> Mailbox looks like this
>>>>>> CPU #0 SCMI message 0 -> calls send_message(), mailbox layer 
>>>>>> queues up
>>>>>> message, mailbox layer sees no message is outgoing and sends it. 
>>>>>> CPU waits
>>>>>> at scmi_wait_for_message_response(), timesout after 30ms
>>>>>> CPU #1 SCMI message 1 -> calls send_message(), mailbox layer 
>>>>>> queues up
>>>>>> message, mailbox layer sees message pending, hold message in 
>>>>>> queue. CPU
>>>>>> waits at scmi_wait_for_message_response(), timesout after 30ms.
>>>>>>
>>>>>> Lets say if transport takes 25ms. The first message would succeed, 
>>>>>> the
>>>>>> second message would timeout after 5ms.
>>>>>>
>>>>>> Hopefully this makes sense.
>>>>>
>>>>> Yes, of course, thanks, for reporting this, and taking time to
>>>>> explain...
>>>>>
>>>>> ...in general the patch LGTM...I think your patch is good also 
>>>>> because it
>>>>> could be easily backported as a fix....can you add a Fixes tag in your
>>>>> next version ?
>>>>>
>>>>
>>>> Are you seeing this issue a lot ? IOW, do we need this to be 
>>>> backported ?
>>>>
> 
> I wouldn't say a lot. But we are seeing it with standard use of our 
> devices running over an extended amount of time. Yes we would like this 
> backported.
> 

Any advice on what Fixes tag to add here? Since the driver was moved to 
the transport folder, I assume this is going to be a manual backport. 
Not sure if the Fixes tag should be when the SCMI MBOX transport was 
moved to a standalone driver in the transport folder or the very first 
SCMI commits since the MBOX transport was added then.

Thanks,
Justin

<snip>

