Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C425018035
	for <arm-scmi@vger.kernel.org>; Wed, 22 Jan 2025 02:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737512387; cv=none; b=CYQi4YZuc9zXdSK9J8XdWJnVXLjSruFe3aE7pQnqaAg7RLSaw9nF19cNypMSpnKCbZRrPTaWTjSe9eNNr4DhZLIaDKaWaMyAgSNnRVVZ3x/rMkkFVOzH7EyzDRo1UJ373cwZcveaeeIoLyxm4Nl65H2en2biJYSKWPCHnoDAydI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737512387; c=relaxed/simple;
	bh=NKeEWaTJEZ1J2asH6x19pyuNluVDF1tOkAmKt3SbCG4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xrg5Dk4+Ai1pLbTfvUlmSLU/ATFacwtvQqW+PEfMG2KmuVXoOLrGoCv1X5vpUIjkcvQUFEkQ3VuOP2H3/m0DAzOcAIx152acvHCEIXVsBwUxwLh2lxJbK/h3bs0rApM0abVkaOVCzxxaQWrcHF7TMNLevB2oiTnzhQ9t1ey46GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bUIRYr1X; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bUIRYr1X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737512382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NKeEWaTJEZ1J2asH6x19pyuNluVDF1tOkAmKt3SbCG4=;
	b=bUIRYr1X/ka/VPFKIJb/7aj89vYQ2c4PlyLv3oifhbPBN6lHCPPhxQ0BgvWCjdmGia8e8k
	e31F7MmHTvEoH9Wpgx6PpAwsz6mZJhDnPOiB23qJLfrimMnGMDEIlI8gSURg+sYoxbiTM4
	P/WuM6UpOhU36Pcb3PG7JuB87lUo4t0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-gU6Gwqj-O6qxLCJXS14pNg-1; Tue, 21 Jan 2025 21:19:40 -0500
X-MC-Unique: gU6Gwqj-O6qxLCJXS14pNg-1
X-Mimecast-MFC-AGG-ID: gU6Gwqj-O6qxLCJXS14pNg
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b6ef813ed1so918268085a.3
        for <arm-scmi@vger.kernel.org>; Tue, 21 Jan 2025 18:19:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737512380; x=1738117180;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NKeEWaTJEZ1J2asH6x19pyuNluVDF1tOkAmKt3SbCG4=;
        b=GK7seDrVxLCwVHGBqJShs+C9ajRBAa7oESEBUOpOGXQU7es95/qnS53OGVUbibRIe+
         UM82oa8zPCLEsT45NC/xe3/pS30PwbdXbx7I1yxDl2Mvzphu0VBqGFG2lKdausgCKT7s
         xnFopvpe0kqgl8gPB3X5s3DRKa3AGHhPJUrffAwpbLYa4BQqYAXBWIxFygBTsebdpEJE
         eyV6Z8RI4zlZAQqyPCCvc+WyD9zQAnA2r4o/s823CYGps0mTSCJqGVHvQT31786Cmt8e
         3YhCMqXph0CBXLuo1FWAj/3w5pOba/2Ut7unfAuI2Y+XtL97oMenziPIeBb7H1FjxlRy
         Vz+w==
X-Gm-Message-State: AOJu0Yx6R+g0Zd4SrVZN6CIoSuZ/ZvDZdBygWBdCQ8mwNJcYqO6nnNXv
	JYDhrZn6C4cV2fKY+O8nIIWf6IpbfY1YJBz8cITUKpgg4pRX/M9yLYEAwr/maGX9PEVWPTsiTfF
	uY9dOEDpiuogfK27TD/EMxVnoQaHQvYEJIokVq97VNEBfpAxy7U1HUq5ildTEFGJ+
X-Gm-Gg: ASbGncsgvUpFRycbP4pCUdtUKiUtubIsdS252ZzdWgba1cukbi+/2ETfpo+V/Ty9i4w
	oyBWAkZhuDPAvVLOoDJZ0wNF1F1RJ6xZVMzmZx5zzbKdkvyjLowU8XcnRVmWokCaHDHoeT5fU7E
	mQWhJo3LsSs3DVX9PVqzab0IwDB7ZacENste/LEkj83vzWmRGndEr2yNMmY02BjkQK9aHSOVcnk
	QQAwC8Ezn2JE4HKAAwcq8DItV1KYDf6GIoHU1AkIwm2EwzKs5qd1N1qyhXRSaMT/EM4ublmRtLr
	OPZaXYvDnnhwAPvjPwD+DIu1xU558yNJwWzbS1nDoi9iUFl9UtXNlDkHsCMpTQ==
X-Received: by 2002:a05:620a:4502:b0:7b1:5089:485b with SMTP id af79cd13be357-7be632102e9mr2979975685a.3.1737512380043;
        Tue, 21 Jan 2025 18:19:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9onwWcyrIQrU+TRJMaLSNiHmIkK3L+iFdf8eGlCFxbDM16pBrTkhh5yoEhN1H2eh1gZpTzg==
X-Received: by 2002:a05:620a:4502:b0:7b1:5089:485b with SMTP id af79cd13be357-7be632102e9mr2979973085a.3.1737512379677;
        Tue, 21 Jan 2025 18:19:39 -0800 (PST)
Received: from thinkpad-p1.localdomain (pool-174-112-193-187.cpe.net.cable.rogers.com. [174.112.193.187])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be6148055bsm617909985a.43.2025.01.21.18.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 18:19:38 -0800 (PST)
Message-ID: <5806bbd198bc4361a41e06a02f93a157bd8eb7e8.camel@redhat.com>
Subject: Re: [RFC PATCH] firmware: arm_scmi: Support mailbox transports with
 no completion IRQ
From: Radu Rendec <rrendec@redhat.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sudeep
 Holla <sudeep.holla@arm.com>
Date: Tue, 21 Jan 2025 21:19:37 -0500
In-Reply-To: <Z497vnIasuJbVarg@pluto>
References: <20250120212418.889385-1-rrendec@redhat.com>
	 <Z497vnIasuJbVarg@pluto>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8Hg3JbRHb52LiLlaSqOHrIVhHxx2s05HDBaNzCSo5AA_1737512380
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cristian,

On Tue, 2025-01-21 at 10:49 +0000, Cristian Marussi wrote:
> mmm...I dont think you can do this....it is a bit tricky to explain BUT
> the optional txdone_irq in the mailbox subsystem is NOT a completion
> interrupt as intended in the SCMI world, I'll try to explain why in the
> following.
>=20
> The SCMI mailbox transport is defined by a mailbox and an associated
> shared memory area: when an SCMI client like Linux wants to send a
> message to the server it places the message in the shmem, set the
> channel BUSY bit, and rings the doorbell to alert the other side; at=20
> this point the SCMI server wakes up grab the message from the shmem,
> process it as it sees fit, places the reply back into the same shmem=20
> area, clears the channnel BUSY bit, and CAN optionally ring back the
> client with the mailbox doorbell: this completion IRQ is OPTIONAL, and,
> if missing, the client will have instead to revert to polling the well
> defined channel BUSY bit in the shmem area to know when the reply from
> the server is ready.
> The end result is that the channel is kept busy until the server has
> replied, and cannot be reused until we are sure that the reply is availab=
le
> AND that the client execution path, waiting for it, has comsumed such
> expected reply message. (or times out)
> Alternatively, even if we have this completion IRQ we can decide, client
> side, to start a polling trabnsaction and dont use the completion
> IRQ...but this is another sroty.
>=20
> Now, in the mailbox subsystem the txdone_irq, when present is meant to
> represnt a txACK IRQ, sent automatically by the mailbox controller, when
> the transmission has completed and the issued command has been read by
> the server(usually when the server clears some specific reg): it does NOT
> assure the client that the server has processed the request and that a
> reply has been placed into the shmem area, so it is not what SCMI intend
> of a completion interrupt: it is just a mere indication that the
> transmission client->server has completed in the mailbox and that the
> mailbox channel(doorbell) is now free annd available for another
> transmission.
>=20
> Indeed, such TxACK, when received by the mailbox driver causes the next
> enqueued message to be sent (i.e. the doorbell to be ring), and, while
> it is certainly useful in some other context in which you could use such
> TxACK to deduce that the channel is free and available for another
> transmission, it is not enough in the SCMI world to guarantee that the
> SCMI reply has come back and has been processed by the client.
>=20
> From another point of view, you could say that the problem is that the
> mailbox/doorbell/TxACK is only one side of the story, the other part,
> the shared memory area used for the effective message transmission, is
> unknown to the mailbox controller and in control of the SCMI stack, so
> you cannot let the mailbox subsystem decide when to queue new messages
> on the same shared memory area used for cmds and replies.
>=20
> In fact, such TxACk interrupt has no practical usage in the SCMI stack
> and it is even counterproductive to have it, since it can cause the
> client to mistakenly attempt the next transmission before the previous
> one has completed, so overwriting the in-flight reply.
> (..and our busy-looping client side on the channel BUSY bit does not
> help here...)
>=20
> The following commit, though, needed mainly for different reasons, should
> have indeed solved also the issue with mailbox controllers having a TxACK=
,
> since it introduces a global channel lock that serializes and inhibits an=
y
> further transmissions, at the SCMI layer, even on systems that has a work=
ing
> and enabled TxACK IRQ.
>=20
> commit da1642bc97c4ef67f347edcd493bd0a52f88777b (tag: scmi-fixes-6.12)
> Author: Justin Chen <justin.chen@broadcom.com>
> Date:=C2=A0=C2=A0 Mon Oct 14 09:07:17 2024 -0700
>=20
> =C2=A0=C2=A0=C2=A0 firmware: arm_scmi: Queue in scmi layer for mailbox im=
plementation
>=20
> In general, anyway, it would be even better, if possible, not to enable
> at all such txACK IRQ at the mailbox level when such a controller is used
> for SCMI: as an example, in arm_mhuv3.c, NOT even defining the txACK in
> the DT when describimng the mailbox controller does the trick.
>=20
> Did you see any specific anomaly regarding the SCMI stack when using a
> mailbox controller which provides a txACK ?
>=20
> Sorry for the not so short mail :P ... but if I am missing something
> and you are seeing anomalies, please let us know.

No need to apologize, and many thanks for taking the time to explain
everything in such detail. Much appreciated! What you explained makes
perfect sense, and now I clearly understand why the changes I proposed
would not work.

I have quite the opposite problem. I'm using a mailbox controller that
does *not* provide a txACK interrupt (or any kind of interrupt for that
matter), and the problem is that SCMI transfers do not complete because
scmi_wait_for_reply() times out.

I tracked this down to xfer->hdr.poll_completion being false, and
therefore scmi_wait_for_reply() taking the second branch, where it
calls wait_for_completion_timeout(). Looking at do_xfer(),
xfer->hdr.poll_completion is set to true if is_polling_enabled()
returns true, and one of the conditions for this to happen is that the
no_completion_irq flag in struct scmi_chan_info is set to true. But it
defaults to false, and in my case there is nothing there to set it to
true. This is what led me to the RFC patch I sent.

Even if now that you explained it I understand why the txACK interrupt
is different from the SCMI message having been processed and replied, I
still fail to understand how it's all supposed to work for the mailbox
transport case where the completion IRQ (which you said was optional)
is indeed *not* implemented.

Since xfer->hdr.poll_completion defaults to false, I looked at what
could trigger the completion that scmi_wait_for_reply() waits on, in
the case of a mailbox transport. The way it's set up is quite
convoluted but if I'm reading the code correctly:
 * core->rx_callback (in mailbox.c) is set to scmi_rx_callback()
 * chan->cl->rx_callback is set to rx_callback() (in mailbox.c)
Therefore, the (reverse) call path leading to completion would be:
complete(&xfer->done)
scmi_handle_response()
scmi_rx_callback()
rx_callback()
mbox_chan_received_data()

If I understand correctly, mbox_chan_received_data() is supposed to be
called by the mailbox provider driver when the mailbox receives data
e.g. the SCMI server rings the bell to indicate completion. But doesn't
this mean that the completion notification (through mailbox doorbell)
is expected to be implemented by default?

Now I get that the mailbox layer has no knowledge of the client layer
(SCMI in this case) and that the txACK IRQ in the mailbox layer is not
meaningful or useful to the SCMI layer. But in my (uneducated) opinion,
there should still be a way to set the no_completion_irq flag in struct
scmi_chan_info to true for the mailbox transport, for the case when the
SCMI server does not implement the completion notification. Perhaps
through the device tree?

Now it's my turn to apologize for a long email :) Hopefully it makes
sense and it's clear now what problem I'm trying to solve. Thanks again
for all the input provided so far, and I'm looking forward to some more
answers.

--=20
Best regards,
Radu

