Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BE32D63FA
	for <arm-scmi@vger.kernel.org>; Fri,  4 Jul 2025 12:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751632256; cv=none; b=VYc6N0hfGPBjqC7ff7yaipshY1IJWtsJ17WTSilgCd9V+OmCUsxyYOiqOqmuuXGee8fQnQ1fpBB4bkMfcLzeVX98SF81yYPgoC8ISUAKsGbRNkk5FcKMCcKMrJCeCxkNGz8ThEaukOO3jr9OkjiPVZMQMDRG0OpG1n+2sUTpUmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751632256; c=relaxed/simple;
	bh=K2d10XQLTG7Ul5SDwI/aJTOW6i7f7ldw3wQqMDGme4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iRIB9iQyG26idCqicvhW2Xbv/SjKPMbTY7mmeIM0yX8l8Pu9ctcEmlm2CIKzXxCltvEKKyoSQE5fdDkWzMsVYj0hN6+fe6r5cMUtG2tWaLyxULQADkKMZeI91H+sPqBxqL9WkE72AuSErE5j079Ju6e0Xz7wWYffuFPFd9zq93U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CMDea8ey; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CMDea8ey"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ade5a0442dfso137074766b.1
        for <arm-scmi@vger.kernel.org>; Fri, 04 Jul 2025 05:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751632253; x=1752237053; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3eL7ggN4EThqkSufl95lxEu7wvlLi27XNgIMFlyQ+U4=;
        b=CMDea8eyITN8Zy/7mqknUU590ksH5V2B1A752XAFWZe04ivpj1b3kAaNFYAjDj0oZZ
         nzDSSSYXY/WHxA+TmaebzbDOe36byZBvolIC6NpWXQhadYwT22d1N1eioIyb5p1eTaAC
         bV39mKM2bw280ICv2kOAZETNB3FItQznBkeBUxTgvpG926zSIlSgIp0JQ+Ix6ZPqstkD
         7IAD3bcFjc9WsHNL6XG9JSuSphGcNqybo4B+qutxqS/zrl41ZASh6iGGI7W4EcHC3oKh
         KtZqL0+2UAstB0MStPvoYda8ytPw5a43lE3FUKXTw1IxHO7caUScjhSuCvA21hlQXYTd
         f+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751632253; x=1752237053;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3eL7ggN4EThqkSufl95lxEu7wvlLi27XNgIMFlyQ+U4=;
        b=GhAtui7ttyuf6dkUFsH2NQfe7TEJxbPg6dwjVR9ikoPnkY1IOA4EKlrdhYD2oyNzcd
         5yUYePtyq5pbq8PDi+paC9acgrA+9HKqpvyIH/hQVGL2aP9mG3hxRKHfcAV6pTadPkPG
         nRtHPKAPyq+Ig54gAy9P1yUV3+Tgi3TTxAjgsSQOaKfHJm8JCgx5Nd9P7gIEelr22Rkl
         XYlkuCjWkzJneqVP4nEBs+1Pn+Z+q5UQpFJPoyWvRJqm44OSizvessNzVOCfFfOGnutA
         kFJl/zwX1PsxX4mp5kIhkDoJEcvE5DBtSlqgm804PTYnCuz1C6XIT1ktelWe/50pz1T0
         cp2A==
X-Forwarded-Encrypted: i=1; AJvYcCV4/jzrmg+j+Hg+GXT0/TrVasGzrJ0RO9UK8HE+T/jtj/4/6LHZlrOjehYONpsqUm5T7rDXX4p6aA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+csTwVbtlWp42gPe2G+nrbi3DKZvwbiYLl714ZI92TLxYcypd
	8iJ+KOm0aMQOocLIa4dPqRavdUjjjxws92DeJSL8/Or42YiFcxhxFvSjng0HBwdVhiI=
X-Gm-Gg: ASbGncsmBQi4xiHatrf1oliN0TQJkQ1Uh/oPC/liDAjWIXuyGQK+l9iHj1iTErQC4Ri
	S2qQUAez1av836N8xw8nJ4rfCpVdQAzGfoUzZZk+hra6SDB7J81UJE+hFEJW56XNS2GLomRbtap
	irD/o/zuKmOKedHfrJJEaNf1GHEIiRkVKP54lR89+VTL93gAWDT2eUkfRqpEvl/bqoLrFtBpOrG
	Jr4Q/3vkLfg7iL9mqrnLumhwIvSsMCGHi0fmLpOksiJVHacaQNnmfYbPUjyAWRR5/Mn/J5PcG8m
	/0tNm5PHT2tDsKNF65CZgIwheSWn57ecbtAbrpoEUIcDukl+tse3OVvWvu28d2S8uxXaZYfn
X-Google-Smtp-Source: AGHT+IENYDx1S+W/IKOLqqR+xnsrF1ri83aQkOzSqUBrg7yPi6OXV2SVSRqeMh1z0BCCs7zVMQSi2A==
X-Received: by 2002:a17:907:7213:b0:ade:7c6:498a with SMTP id a640c23a62f3a-ae3fbc4b041mr251129566b.10.1751632252576;
        Fri, 04 Jul 2025 05:30:52 -0700 (PDT)
Received: from [192.168.0.251] ([188.27.86.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66e6f25sm164849066b.20.2025.07.04.05.30.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 05:30:52 -0700 (PDT)
Message-ID: <fac9a5fb-7a39-4c12-9dca-d2338b6dad8c@linaro.org>
Date: Fri, 4 Jul 2025 13:30:50 +0100
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox: stop the release and reacquire of the chan lock
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: peter.griffin@linaro.org, andre.draszik@linaro.org,
 willmcvicker@google.com, cristian.marussi@arm.com, sudeep.holla@arm.com,
 kernel-team@android.com, arm-scmi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250606-mbox-drop-reacquire-lock-v1-1-d36d1a13d83f@linaro.org>
 <CABb+yY2HYgS25xouVJpq+Aia1M=b1_ocbHiyrnVqZcf0c0xcGg@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CABb+yY2HYgS25xouVJpq+Aia1M=b1_ocbHiyrnVqZcf0c0xcGg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Jassi,

Sorry for the delay, I was out for a while.

On 6/23/25 12:41 AM, Jassi Brar wrote:
> On Fri, Jun 6, 2025 at 8:41 AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>
>> There are two cases where the chan lock is released and reacquired
>> were it shouldn't really be:
>>
>> 1/ released at the end of add_to_rbuf() and reacquired at the beginning
>> of msg_submit(). After the lock is released at the end of add_to_rbuf(),
>> if the mailbox core is under heavy load, the mailbox software queue may
>> fill up without any of the threads getting the chance to drain the
>> software queue.
>>         T#0 acquires chan lock, fills rbuf, releases the lock, then
>>         T#1 acquires chan lock, fills rbuf, releases the lock, then
>>         ...
>>         T#MBOX_TX_QUEUE_LEN returns -ENOBUFS;
>> We shall drain the software queue as fast as we can, while still holding
>> the channel lock.
>>
> I don't see any issue to fix to begin with.
> T#0 does drain the queue by moving on to submit the message after
> adding it to the rbuf.

The problem is that the code releases the chan->lock after adding the
message to rbuf and then reacquires it on submit. A thread can be
preempted after add_to_rbuf(), without getting the chance to get to
msg_submit().

Let's assume that
T#0 adds to rbuf and gets preempted by T#1
T#1 adds to rbuf and gets preempted by T#2
...
T#n-1 adds to rbuf and gets preempted by T#n

We fill the mailbox software queue without any thread getting to
msg_submit().

Thanks,
ta

> And until the tx is done, T#1 would still be only adding to the rbuf
> because of chan->active_req.
> 
>> 2/ tx_tick() releases the lock after setting chan->active_req = NULL.
>> This gives again the possibility for the software queue to fill up, as
>> described in case 1/.
>>
> This again is not an issue. The user(s) should account for the fact
> that the message bus
>  may be busy and there can be only limited buffers in the queue.
> 
> Thanks

