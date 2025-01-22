Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469BE1AF4EA
	for <arm-scmi@vger.kernel.org>; Wed, 22 Jan 2025 21:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737580255; cv=none; b=XsPxm/Zgg4LGkls8C1cafZUBPcS/EDxF7muk9K5eC4bBD/fPsVZKyC8K38a4isTw13tv3ohNkbcbrNxa9TFnhUF949MuWGPfsBf5EAMwUF7/lPFS7yqKz1GiHg/1fWLNkX/43R9p2pyQGVJYrEU/XlDj1huiB/vlCPMGsKxjq3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737580255; c=relaxed/simple;
	bh=/LPip9INyx0hMxVMYz3aL9YtG8UsdvOgoYZvWEoMCXg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JZriCdtZE7u3q/m+2FL2pw/bXYFCnKWSjpUXcH1i/B7QoMtQEc+gjhPJGrm55KWIwgFbbjhu0BQX0O4wVtGUWiwJvYyOOr26zsbkjcVDHEoLT3dm1O2Q6zD9RDfPhbaFkiY0AIXkThUgCWPkDcY7BpJHtHVvIJ/j0K2w2HbkaF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NR2Zzlu0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NR2Zzlu0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737580252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/LPip9INyx0hMxVMYz3aL9YtG8UsdvOgoYZvWEoMCXg=;
	b=NR2Zzlu0WuLpT+p8/UXBH/H/4gTXrR4b1F/NbRDG9FLnxRGLZjD+dEk2Q6WacKUAk6bmh3
	tjZc6YbbYEwBxZouHztc2/jWRwqpmU6RKSQq7adFt81w4nBKwwZiS32E+qZlwwtBHDTlzL
	TC9jmE3Z6DkwjWTFezeXzNLD4lLJ9KQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-TVpxTZCFPg23GJ1VSRxQsQ-1; Wed, 22 Jan 2025 16:10:49 -0500
X-MC-Unique: TVpxTZCFPg23GJ1VSRxQsQ-1
X-Mimecast-MFC-AGG-ID: TVpxTZCFPg23GJ1VSRxQsQ
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-467944446a0so3248541cf.1
        for <arm-scmi@vger.kernel.org>; Wed, 22 Jan 2025 13:10:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737580249; x=1738185049;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/LPip9INyx0hMxVMYz3aL9YtG8UsdvOgoYZvWEoMCXg=;
        b=i2eTkhBm6qZ60+On699Zihg+BXhjwEI07WFjKH6d6nCuTIkgTlUuRKPakU4SeyLYoY
         HyKHAddtTqa0QVKtV5+CVAyqGqPsVUVx1lYAm5XIOsNLcZp1vTQyRq0V5cStNxrE03Qr
         CP83SoxO6QZ17slUDXrvUyC9Hf9BYil0WKRYKOzKS62VLPRX3GE7dL5Qhea2iHEp5P/S
         B+JZHr/nEJnsEHZZdASo9ppDxKmt/pbHVRCupwkQgT1k8W+sOl3KGn+Ohq3aazP59jQs
         JZLj7pcl5We0+MdM9cS8o8uvz7D37brQ+hCastxfEsu/wEyBg9dDJKo79K/ZhIlbaQCE
         ku3g==
X-Gm-Message-State: AOJu0Yww1HN/Ld84iYvIZpkdg7vupSH0XCMFTwR3ig2s6wmLTf8PPA+G
	ufRoxPjTMUvtSMSO0AMi9eEgl6rGW9iwuIDx+PfKH6drCDUmhbB1mBni7L7ELTq5mbNjWw/8JR1
	Jaek60xX9HA+Fz1OvDQ1bYGTsf3WqFQhL2b14XKGhrQc6+03cGOJDACFV
X-Gm-Gg: ASbGncs1XDHLBk754N0p0SCnd/Gm9r6/urLcZgtgsPnMffBsxefydcNGsJF7drPVlNc
	aSgKbsfstB55pmts3ZI2FOZg5wvRhOxukpv1w2v43rqNIi1M+2+H0B1/swRr9mzusiYJDa0+2P9
	dmCua+/tXiD3nuHfqpNN8HMenO28/O61+jJ7g8+Ex/LmTRJ3WuRYdN7Yomhg451JNpICZAkoTe7
	2k4E8i5u8FtfLG/8I94Tq1JNj0BfFStWL9rBuR54uKwUcs3Ik1ApnP3qxsLZoi/K9yHLMfBfnEe
	szfL5slD0buhD03g/9dJ9ybIg25Mn+0oxujihMa9cdi4erzi27rOWSfnmhnTKA==
X-Received: by 2002:a05:622a:145:b0:467:7109:c783 with SMTP id d75a77b69052e-46e12ad54d5mr330823331cf.3.1737580249253;
        Wed, 22 Jan 2025 13:10:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIx94YBqc4qrrHCRZNRccCQJQGXTMRVaSSjkJYJ/5qoiU2LazPB321YR2OOYrONvFimVvXCQ==
X-Received: by 2002:a05:622a:145:b0:467:7109:c783 with SMTP id d75a77b69052e-46e12ad54d5mr330822951cf.3.1737580248848;
        Wed, 22 Jan 2025 13:10:48 -0800 (PST)
Received: from thinkpad-p1.localdomain (pool-174-112-193-187.cpe.net.cable.rogers.com. [174.112.193.187])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46e102ec2d9sm67756121cf.12.2025.01.22.13.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 13:10:48 -0800 (PST)
Message-ID: <4ba9c0d259e35960425ff278d20446a133853238.camel@redhat.com>
Subject: Re: [RFC PATCH] firmware: arm_scmi: Support mailbox transports with
 no completion IRQ
From: Radu Rendec <rrendec@redhat.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sudeep
 Holla <sudeep.holla@arm.com>
Date: Wed, 22 Jan 2025 16:10:47 -0500
In-Reply-To: <Z5DhE3-SGOP9O4NZ@pluto>
References: <20250120212418.889385-1-rrendec@redhat.com>
	 <Z497vnIasuJbVarg@pluto>
	 <5806bbd198bc4361a41e06a02f93a157bd8eb7e8.camel@redhat.com>
	 <Z5DhE3-SGOP9O4NZ@pluto>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KYGuNxtJzQJiLkvxfUvMvCHyau5X-ggU5-C7cEGqR10_1737580249
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cristian,

On Wed, 2025-01-22 at 12:14 +0000, Cristian Marussi wrote:
> On Tue, Jan 21, 2025 at 09:19:37PM -0500, Radu Rendec wrote:
>=20
> > On Tue, 2025-01-21 at 10:49 +0000, Cristian Marussi wrote:
> > > mmm...I dont think you can do this....it is a bit tricky to explain B=
UT
> > > the optional txdone_irq in the mailbox subsystem is NOT a completion
> > > interrupt as intended in the SCMI world, I'll try to explain why in t=
he
> > > following.
>=20
> [snip]
>=20
> > > Sorry for the not so short mail :P ... but if I am missing something
> > > and you are seeing anomalies, please let us know.
> >=20
> > No need to apologize, and many thanks for taking the time to explain
> > everything in such detail. Much appreciated! What you explained makes
> > perfect sense, and now I clearly understand why the changes I proposed
> > would not work.
> >=20
> > I have quite the opposite problem. I'm using a mailbox controller that
> > does *not* provide a txACK interrupt (or any kind of interrupt for that
> > matter), and the problem is that SCMI transfers do not complete because
> > scmi_wait_for_reply() times out.
>=20
> Do you mean a unidirectional mailbox controller (like ARM MHUv3) that
> allow for bidirectionality ONLY if you effectively use a pair of them,
> one for each direction ?

Yes, that's what I meant. But I had a very distorted understanding of
how that worked, and now it's much clearer after reading your email,
looking at arm,scmi.yaml and staring more at the code :) Please see
further details below.


[snip]

> > Since xfer->hdr.poll_completion defaults to false, I looked at what
> > could trigger the completion that scmi_wait_for_reply() waits on, in
> > the case of a mailbox transport. The way it's set up is quite
> > convoluted but if I'm reading the code correctly:
> > =C2=A0* core->rx_callback (in mailbox.c) is set to scmi_rx_callback()
> > =C2=A0* chan->cl->rx_callback is set to rx_callback() (in mailbox.c)
> > Therefore, the (reverse) call path leading to completion would be:
> > complete(&xfer->done)
> > scmi_handle_response()
> > scmi_rx_callback()
> > rx_callback()
> > mbox_chan_received_data()
> >=20
> > If I understand correctly, mbox_chan_received_data() is supposed to be
> > called by the mailbox provider driver when the mailbox receives data
> > e.g. the SCMI server rings the bell to indicate completion. But doesn't
> > this mean that the completion notification (through mailbox doorbell)
> > is expected to be implemented by default?
>=20
> Nope because when the SCMI client requires a polling transaction, beside
> the busy-looping on the channel BUSY bit on its side, it will also ask
> for a polling transaction by setting the proper bit in the channel flags
> (as detailed in spec chap 5.1) of the shmem area, so that the server will
> know that the completion IRQ, even if existing is NOT required for that
> transaction: in any case, polling or not, the server will clear the chann=
el
> BUSY bit when it is done, since that is the mechanism that is used by the
> client and server to pass back and forth the 'ownership' of the channel.
> [BIG RED WARNING: I never remember if the channel bit I blabbed about
> above is defined as a BUSY bit or as a FREE bit....so the logic could be
> reversed.]
>=20
> The above backtrace is only for the IRQ path...if you are polling, you
> are indeed busy looping inside scmi_wait_for_reply() and if you dont get
> a timeout (or an out of order invalid reply) the reply if picked up at
> the end of the poll loop by a fetch_reponse() inside that same
> wait_for_reply....since polling anyway is meant to pick up Delayed
> Responses OR notification that does on the P2A channel (RX in the SCMI
> stack) which needs to have an associated IRQ to work at all.
>=20
> Beside your scenario of a system lacking a completion IRQ, polling
> transactions can be asked for a speficic SCMI command at will like to
> issue a clock_enable(), so polling is generally working as far as I know
> and tested....you can easily test that also by just enaboing
> force_polling flag in the transport desc (for testing/debug purposes
> only)

I'm sorry, I didn't phrase the question very well. Polling does work as
expected, and it was clearly proven by the fact that I actually got the
SCMI communication working with the patch I sent initially - because it
was forcing the polling mode (even though the patch itself was wrong
and had no practical value).

The backtrace I mentioned is clearly for the IRQ path. What I was
getting at was that it seems to be the only way for the completion to
be completed. And since in the default configuration (with the default
flags) scmi_wait_for_reply() takes the second branch, where it waits
for that completion, it means that by default the completion IRQ needs
to exist for the kernel to know that the transfer has been replied to.

What I really meant to ask was this: does it mean that in the default
configuration (with the default flags) the completion IRQ is required?
And I think you already answered, indirectly :)

> > Now I get that the mailbox layer has no knowledge of the client layer
> > (SCMI in this case) and that the txACK IRQ in the mailbox layer is not
> > meaningful or useful to the SCMI layer. But in my (uneducated) opinion,
> > there should still be a way to set the no_completion_irq flag in struct
> > scmi_chan_info to true for the mailbox transport, for the case when the
> > SCMI server does not implement the completion notification. Perhaps
> > through the device tree?
>=20
> As I said, the flag is NOT settable, since it was a scenario that was
> never needed....but you are right.. you will have to somehow set that
> flag to handle this kind of setup.
>=20
> Now, I was hoping to be able to somehow handle this with the existing
> bindings, because if you look at 'mboxes' definition in:
>=20
> =C2=A0 Documentation/devicetree/bindings/firmware/arm,scmi.yaml
>=20
> ..you will see that we try to handle all the possible combinations of
> mailbox controller types implicitly by deducing the kind of controller
> by the combination of the number of defined shmem/mbox. (this is because
> unfortunately we cannot rely on naming for backward compatibility issue
> since mbox names was NOT required prop from the start).

That makes perfect sense, and the description in arm,scmi.yaml (which I
should have looked at in the first place) was a real eye opener. Thanks
for that!!

> So, I would have loved to be able to deduce in mailbox_chan_setup() that
> in a specific configuration there is no completion interrupt and set
> accordingly the no_completion_irq flag using the existing bindings....
>=20
> ...but seems to me that it is not possible since there is the assumption
> that unidirectional mailbox are always used in pair to provide a completi=
on
> IRQ....and we run out of possibilities to exploit this implicit info
> (again because we address the most common case with the current bindings)

True, but maybe the assumption is wrong. In the scenario I'm describing
there are 2 shmem areas and only one unidirectional mailbox for Tx. The
Rx mailbox does not exist because there is no completion IRQ, and the
only way you can implement a Rx mailbox is through an IRQ. So in theory
you could infer this configuration from a "1 mbox / 2 shmem" setup,
which is not one of the currently supported combinations. But it would
probably not scale well for the more general case.

> At the end, yes I think we should be able to describe this particular HW
> configuration somehow, so a new binding could be the answer, since this
> is exactly HW description, the tricky part would be to add something
> that can cope well with all the above existing implict combinations
> (maybe is not a great issue eh .... I have not though about it...)
>=20
> ...BUT...before all of this, just to be paranoid, I would check to make
> sure that your HW is really unidirectional in nature and not that, instea=
d,
> is a bidirectional mailbox controller, where the SCMI server is really no=
t
> taking care to ring the doorbell back ? (which usually is the same
> doorbell used in the client->server direction)

I think you nailed it. Looking at the mailbox driver implementation
(which actually has an IRQ handler that calls mbox_chan_received_data)
and the way the SCMI configuration is described in the device tree, I
think that's exactly the case. And the completion IRQ doesn't work
either because the SCMI server doesn't trigger it or there is a problem
with the IRQ plumbing along the way.

Unfortunately, because the mailboxes can be either unidirectional or
bidirectional and they are not necessarily mapped 1:1 to the SCMI
channels, it can be very confusing for the uninitiated eye (like
myself). If I had known everything I know now, it would have been
pretty obvious from the beginning that there was something wrong with
the SCMI server (or completion IRQ routing).

> (I ignore which server implementation you use...so just to make sure...)

Unfortunately the mailbox driver is not upstream (which is always a sad
thing), and that's why I didn't mention what it was. It's also based on
a 5.10.x kernel but simple enough that it compiles cleanly with the
latest upstream. With everything I have learned, now I can tell that
ironically the driver itself seems to be OK. For what it's worth, the
BSP kernel where this comes from includes an ugly hack that changes the
initialization of xfer->hdr.poll_completion to true instead of false to
force polling mode and cope with the broken completion IRQ :-/

> > Now it's my turn to apologize for a long email :) Hopefully it makes
> > sense and it's clear now what problem I'm trying to solve. Thanks again
> > for all the input provided so far, and I'm looking forward to some more
> > answers.
>=20
> ... better stop apologizing here and now, given the average payload size
> of these recent mail exchanges :P

Fair enough :) Instead, let me thank you, again, for your time and
patience, and for all the detailed information you have provided.

--=20
Best regards,
Radu

