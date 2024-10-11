Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACD61CFEDC
	for <arm-scmi@vger.kernel.org>; Fri, 11 Oct 2024 19:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728674113; cv=none; b=bM2Te3+yOVfqQpBq6d1Ay+x9sok4O5SqmmwiounfygkUxSBI/M7wNFXD4WXl4zAr2TAVfuHr0Ezt2DuY4fDIOYHdJnUZJEV8keX1Dcif9mXmLMTQ1MM71FqS9XOCrDDVBMjTK1kbsRqCfr1a2Sszy3AcW/W1CjS0o2W0QWDltIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728674113; c=relaxed/simple;
	bh=LcEPGYYRn86GrdHwEuQRdkF/+ExWu+5HnLIPMmQBYAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NMxur0Xji8SgA/PMpk+kBP7NQoOZ0Juh18Gf+V0BWMY8HKmOTRnsV3msZi4jsxei/feNqrbA1tPPT9vB2kRuFANLrhJViMACA5ZDIDn+ZPN7fdeO6P9nMMFi6jrlHhiBHFuwmvlMwlNeOzyoDKsByYjfkowvRWI8gdVF0yXJI0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=RN/RS3kO; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="RN/RS3kO"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4603ee602a0so17988671cf.2
        for <arm-scmi@vger.kernel.org>; Fri, 11 Oct 2024 12:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1728674110; x=1729278910; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LjFrsfEdmIwzQUjak3mQDZtLMhU12hmQ+DxJ5h/HQ10=;
        b=RN/RS3kOt1hMLpDYs7lA4nVg+/nnkM7/NuvBwlNhMQjws4VwMDDf+WvEE18P794c+8
         6qi7+uN+26uvUZAZBycvCvVAE6XPzdYNeigv4kaua8ReOPpBVrbAo3xhhheX5aZo+prD
         zTWPnzhpLCKPUXsCRFGV8xn+pweUzA4sCClhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728674110; x=1729278910;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LjFrsfEdmIwzQUjak3mQDZtLMhU12hmQ+DxJ5h/HQ10=;
        b=r02kwhb6r9tY9UPwlR2EKdeDGAOefqVf4Nr32ag1PHVCfIDjgA/8I1j5XzlaLM5ql0
         EfDee3OcOix66AZvHySjEpLRWWWdjvuVtUnl3i1y1EJ+U1fmjv2/c78N3krHhdJZVOxA
         VEiiotzHYjL6QZHLWCxuWeYiKyPTeHQjMJQUUeoQSxuA/dG37Ly87RHexub9NLcKffet
         JL4HEReCUHv9T19kBa6kPvVqK1n+b115L5e5evTEEQ2jgoWSUBZP2KnV+XIvdHD5wJM5
         DrNNXYJbkLCcLRiPmBrmJlD9tSD7qUu6voIVb6gEdV0XDJ9sOVYCAdkxrKKdB4phjVYA
         iC4g==
X-Gm-Message-State: AOJu0YyqGCSZl8+w1HDrZwjKY2GfxuqpbBWC1Q/JX1f9rgvKr0U3MuZH
	2YfWExcEavKa8+pPYWVgdlX6EOYRHH8+KTM2E4EwCT293et9AuizD3gc0+4Enw==
X-Google-Smtp-Source: AGHT+IHaD9B2lB3GvcRk/gnB22OjcUbBKHprjtQdmpjL9vfXeqWSM/4Z1IGg8qCLe70ABMu1NSQBNQ==
X-Received: by 2002:a05:6214:328b:b0:6cb:e9eb:2f51 with SMTP id 6a1803df08f44-6cbefef4ca7mr42219966d6.0.1728674109633;
        Fri, 11 Oct 2024 12:15:09 -0700 (PDT)
Received: from [10.69.69.40] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cbe8608d7esm17869196d6.100.2024.10.11.12.15.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 12:15:09 -0700 (PDT)
Message-ID: <50f4d2d6-dead-4053-834f-134d2df0d6bd@broadcom.com>
Date: Fri, 11 Oct 2024 12:15:07 -0700
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] firmware: arm_scmi: Queue in scmi layer for mailbox
 implementation
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
 linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com,
 bcm-kernel-feedback-list@broadcom.com, florian.fainelli@broadcom.com
References: <20241009192637.1090238-1-justin.chen@broadcom.com>
 <ZwkrVQOVJpUvhW4g@pluto>
Content-Language: en-US
From: Justin Chen <justin.chen@broadcom.com>
In-Reply-To: <ZwkrVQOVJpUvhW4g@pluto>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/11/24 6:43 AM, Cristian Marussi wrote:
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
> 
>>
>> - Added Fixes tag
>> - Improved commit message to better capture the issue
>>
>>   .../firmware/arm_scmi/transports/mailbox.c    | 21 +++++++++++++------
>>   1 file changed, 15 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
>> index 1a754dee24f7..30bc2865582f 100644
>> --- a/drivers/firmware/arm_scmi/transports/mailbox.c
>> +++ b/drivers/firmware/arm_scmi/transports/mailbox.c
>> @@ -33,6 +33,7 @@ struct scmi_mailbox {
>>   	struct mbox_chan *chan_platform_receiver;
>>   	struct scmi_chan_info *cinfo;
>>   	struct scmi_shared_mem __iomem *shmem;
>> +	struct mutex chan_lock;
> 
> Missing Doxygen comment....
> 
> arm_scmi/transports/mailbox.c:39: warning: Function parameter or struct member 'chan_lock' not described in 'scmi_mailbox
> 
>>   };
>>   
>>   #define client_to_scmi_mailbox(c) container_of(c, struct scmi_mailbox, cl)
>> @@ -205,6 +206,7 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
>>   	cl->rx_callback = rx_callback;
>>   	cl->tx_block = false;
>>   	cl->knows_txdone = tx;
>> +	mutex_init(&smbox->chan_lock);
> 
> This could be move at the end of this function after the channels are
> requested and it is no more possible to fail and bail out....messages
> wont flow and lock wont be used anyway until this chan_setup completes...
> ...BUT I have NOT string opinion about this....you can leave it here
> too...up to you
>>   
>>   	smbox->chan = mbox_request_channel(cl, tx ? 0 : p2a_chan);
>>   	if (IS_ERR(smbox->chan)) {
>> @@ -267,11 +269,21 @@ static int mailbox_send_message(struct scmi_chan_info *cinfo,
>>   	struct scmi_mailbox *smbox = cinfo->transport_info;
>>   	int ret;
>>   
>> +	/*
>> +	 * The mailbox layer has it's own queue. However the mailbox queue confuses
>   				  its own queue
> 
>> +	 * the per message SCMI timeouts since the clock starts when the message is
>> +	 * submitted into the mailbox queue. So when multiple messages are queued up
>> +	 * the clock starts on all messages instead of only the one inflight.
>> +	 */
>> +	mutex_lock(&smbox->chan_lock);
>> +
>>   	ret = mbox_send_message(smbox->chan, xfer);
>>   
>>   	/* mbox_send_message returns non-negative value on success, so reset */
>>   	if (ret > 0)
>>   		ret = 0;
>> +	else
>> +		mutex_unlock(&smbox->chan_lock);
> 
> I think this should be
> 
> 	else if (ret < 0)
> 		mutex_unlock(&smbox->chan_lock);
> 
> ...since looking at mbox_send_message() and its implementation it returns
> NON-Negative integers on Success...so 0 from mbox_send_mmessage() also means
> SUCCESS and we should not release the mutex (I think the 'ret' returned
> here is the idx from add_to_rbuf...so it will become zero peridiocally
> on normal successfull operation)
> 

Yes, I see the implementation. Looks like it returns the position in the 
ring buffer. I also confirmed with CONFIG_DEBUG_MUTEXES which triggers a 
warning.

What about this?
if (ret >= 0)
	ret = 0
else
	mutex_unlock(&smbox->chan_lock);

A bit easier to read IMO.

Thanks,
Justin

>>   
>>   	return ret;
>>   }
>> @@ -281,13 +293,10 @@ static void mailbox_mark_txdone(struct scmi_chan_info *cinfo, int ret,
>>   {
>>   	struct scmi_mailbox *smbox = cinfo->transport_info;
>>   
>> -	/*
>> -	 * NOTE: we might prefer not to need the mailbox ticker to manage the
>> -	 * transfer queueing since the protocol layer queues things by itself.
>> -	 * Unfortunately, we have to kick the mailbox framework after we have
>> -	 * received our message.
>> -	 */
>>   	mbox_client_txdone(smbox->chan, ret);
>> +
>> +	/* Release channel */
>> +	mutex_unlock(&smbox->chan_lock);
>>   }
>>   
>>   static void mailbox_fetch_response(struct scmi_chan_info *cinfo,
>> -- 
>> 2.34.1
>>
> 
> I gave it a go on a couple of JUNO, without any issues.
> 
> Other than the above, LGTM.
> 
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> Tested-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> Thanks,
> Cristian
> 

