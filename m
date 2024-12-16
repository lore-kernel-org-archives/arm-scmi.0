Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CD21CD1E0
	for <arm-scmi@vger.kernel.org>; Mon, 16 Dec 2024 10:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734345435; cv=none; b=GHHxivseGU/w7JiL2/AF/kUS+56EAc9C8NLwMOEcm3z99gwFliAV6RTZ71zGqBXzpXehdHY9ot7YDdCDWhvEppwVQqk3TxKi4I+7KPWLYOEBiAeiPCKL6c5fLNEwYRjE5QZraOsKs9UYsjNZE6ZWLh6dN4E8Hdn8nOnVTD31Pl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734345435; c=relaxed/simple;
	bh=4le6vxJ2IzTm7QTXudGVRO3U2HpSOTb9kLUyRCRuL2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iXc01cfhjjfdcAnwGp3PRJ5UR4pw9GOijs/6MNUy6mwlCSDf25v83IKUYji405tXtw7D9/Dk6fl/6Txd/J94Bd5KU30E4cQf5Hd3dupSMMVsOElfRD5dS5uPO4duhfEKzy7mYIYmKXZ2TM0Vga/5MfRXykbNncLZrhJsOsnAiQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IitjfqLL; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IitjfqLL"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21634338cfdso45975945ad.2
        for <arm-scmi@vger.kernel.org>; Mon, 16 Dec 2024 02:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734345433; x=1734950233; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OA+5NHNpYkR5jHDPlHiNbA4eDHZp6F0pnYCxfmtazPI=;
        b=IitjfqLLQ1HoaTpPhayuEma33fD9zJseo9wK/hK7F2owfjeeJf2ac3jaZlfOSEQuUB
         ZPoXmql4DZB99sLRKJ5iMgNiG2VZRVLOU9b92BAqz2JBdsnbzWg+fSFMqY/v1h/8ePIR
         64MNoowPH2qYl8TBc2orfhGtOgHQ9NPpZDEDLKtjCWaj8NADdGzSWOqCft8O4ao0ZBEe
         4FCoBOdSgL33fNqdUfXiqgOUrIKqg+IbvzrvZFOnOLAd2V3QNhXjPVLD6O/z5x925m9F
         VtAIW8HZ9za2svudl3DfvqaQtHi3oa72JNE+cBQeyzBZ9RKPCEels8sC6EAl/pE2oJcX
         26iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734345433; x=1734950233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OA+5NHNpYkR5jHDPlHiNbA4eDHZp6F0pnYCxfmtazPI=;
        b=tb0UdwQRtAQ3Ksp10FqEdWRnx6ntBN/3Hqgs+fxGQfPNWBqUdDsL6nThjDD/Oqm8Sz
         tcLeJGFYOdjw0XKNACg0D9pdfgVWJx2rpDKqlyc3CR+QPXX5pl48qlZ86ay0mdQxtk6J
         UhBKgW9cyEVZdLN+CfytzXWIVeKYQqPOBiKm8+CF/aSrCFNoshV1PBwwaPArsrBV3V/Y
         W0iI28fxSnkrtUgtdgQ7du3HlRw7vEdETFlN4VbAIctGztUG0mC5ThxeKXPSZ0Gc/AV/
         JfrKsPjH19j7vXOWlqySg7xO4c2oyp+b6LxfWnSjCFKIjDumisAVBkV+PeWlSKvYFaXu
         mSxw==
X-Forwarded-Encrypted: i=1; AJvYcCVlVR8PNTfAfWcxvLBUVfzi/JM4LGNXBUwr0P+aRTA1KJwL96x70rSZ8JrRV2aWgsaU/WF/f3I3tA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yze/D2eCRi/3UmQ6TIg2yTlrt9AILRV0gFNmZ0sgeXxnUM/aP61
	nnGUCmIC2KLrBisz66aQKLEzBJ9mR+eeKUtG8hJ6uCqN9BcAZ8q/Et1p2v1Y02gICbakHeJuzUK
	4MCx4YqGx6IJCTi88mYvEn6DLw6Y2b3yPQzA=
X-Gm-Gg: ASbGncvzqjycH0IzY1h4ZGHNXJJ1BWoHixRPOMlM4WgGV465htQgI1D64CmpO0aqd+Z
	05Vw8cKXWHHiJ5KfUiFd43t4I9Wr/fa5giJ/f
X-Google-Smtp-Source: AGHT+IEfJuxZgByf8coZVShcY2o38RAmrG/Ekf/AwY+kg0lR0Tn82vhGRiBGnt/O4l6C6KpCfqPDXfWpy3rGQZ4zwTI=
X-Received: by 2002:a17:903:32cf:b0:20b:a6f5:2768 with SMTP id
 d9443c01a7336-218929f1d59mr182557835ad.10.1734345432525; Mon, 16 Dec 2024
 02:37:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216073745.2973317-1-guomin_chen@sina.com>
 <Z1_p0nU93PHJ4Sg_@pluto> <Z1_2rxJ7TOEIOMp7@pluto>
In-Reply-To: <Z1_2rxJ7TOEIOMp7@pluto>
From: gchen chen <gchen.guomin@gmail.com>
Date: Mon, 16 Dec 2024 18:37:01 +0800
Message-ID: <CAEEwsfRhe4-YAwe027huSXwFfkV-O-8w1GDNf=URa9efRsXiKA@mail.gmail.com>
Subject: Re: [PATCH v2] firmware: arm_scmi: Delete the meaningless scmi_bus_id.
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: guomin_chen@sina.com, Sudeep Holla <sudeep.holla@arm.com>, 
	Xinqi Zhang <quic_xinqzhan@quicinc.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Cristian Marussi <cristian.marussi@arm.com> =E4=BA=8E2024=E5=B9=B412=E6=9C=
=8816=E6=97=A5=E5=91=A8=E4=B8=80 17:45=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Dec 16, 2024 at 08:50:26AM +0000, Cristian Marussi wrote:
> > On Mon, Dec 16, 2024 at 03:37:45PM +0800, guomin_chen@sina.com wrote:
> > > From: guomin chen <guomin_chen@sina.com>
> > >
> > > Currently, scmi_bus_id is only used to set scmi_dev.id,
> > > which in turn sets the SCMI device name. After removing
> > > scmi_bus_id, it is clearer and more meaningful to directly
> > > use the unique tuple [Parent name,device name, protocol] to
> > > set the SCMI device name.
> > >
> >
> > Hi Guomin,
> >
> > this same pTCH was NACKed(Rejected) a few days ago:
> >
> > https://lore.kernel.org/arm-scmi/20241211134505.2218386-1-guomin_chen@s=
ina.com/T/#u
> >
> > ...and you agreed that is not a simplification we can do (not to break
> > multuple instances...)...
> >
> > ..so why you are posting V2 now ?
>
> Wait...you changed slightly this indeed....you are using dev_parent...my
> bad...but please when you post new version of a patch add a summary of
> changes between versions...
>
> >
> > Thanks,
> > Cristian
> >
> > > Signed-off-by: guomin chen <guomin_chen@sina.com>
> > > ---
> > >  drivers/firmware/arm_scmi/bus.c    | 17 +++--------------
> > >  drivers/firmware/arm_scmi/driver.c |  4 ++--
> > >  2 files changed, 5 insertions(+), 16 deletions(-)
> > >
> > > diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_s=
cmi/bus.c
> > > index 157172a5f2b5..800e8ec9357c 100644
> > > --- a/drivers/firmware/arm_scmi/bus.c
> > > +++ b/drivers/firmware/arm_scmi/bus.c
> > > @@ -20,7 +20,6 @@
> > >  BLOCKING_NOTIFIER_HEAD(scmi_requested_devices_nh);
> > >  EXPORT_SYMBOL_GPL(scmi_requested_devices_nh);
> > >
> > > -static DEFINE_IDA(scmi_bus_id);
> > >
> > >  static DEFINE_IDR(scmi_requested_devices);
> > >  /* Protect access to scmi_requested_devices */
> > > @@ -341,7 +340,6 @@ static void __scmi_device_destroy(struct scmi_dev=
ice *scmi_dev)
> > >     if (scmi_dev->protocol_id =3D=3D SCMI_PROTOCOL_SYSTEM)
> > >             atomic_set(&scmi_syspower_registered, 0);
> > >
> > > -   ida_free(&scmi_bus_id, scmi_dev->id);
> > >     device_unregister(&scmi_dev->dev);
> > >  }
> > >
> > > @@ -349,7 +347,7 @@ static struct scmi_device *
> > >  __scmi_device_create(struct device_node *np, struct device *parent,
> > >                  int protocol, const char *name)
> > >  {
> > > -   int id, retval;
> > > +   int retval;
> > >     struct scmi_device *scmi_dev;
> > >
> > >     /*
> > > @@ -387,20 +385,13 @@ __scmi_device_create(struct device_node *np, st=
ruct device *parent,
> > >             return NULL;
> > >     }
> > >
> > > -   id =3D ida_alloc_min(&scmi_bus_id, 1, GFP_KERNEL);
> > > -   if (id < 0) {
> > > -           kfree_const(scmi_dev->name);
> > > -           kfree(scmi_dev);
> > > -           return NULL;
> > > -   }
> > > -
> > > -   scmi_dev->id =3D id;
> > >     scmi_dev->protocol_id =3D protocol;
> > >     scmi_dev->dev.parent =3D parent;
> > >     device_set_node(&scmi_dev->dev, of_fwnode_handle(np));
> > >     scmi_dev->dev.bus =3D &scmi_bus_type;
> > >     scmi_dev->dev.release =3D scmi_device_release;
> > > -   dev_set_name(&scmi_dev->dev, "scmi_dev.%d", id);
> > > +   dev_set_name(&scmi_dev->dev, "scmi_dev.%s.%s.%d", dev_name(parent=
),
> > > +                   scmi_dev->name, protocol);
> > >
>
> So now you are using the parent top node SCMI device to create a unique
> device...and it probably endup in a name like:
>
>         scmi-dev.arm-scmi.0.auto.genpd.13
>
>         scmi-dev.arm-scmi.1.auto.genpd.13
>
> ...that certainly is more readable but is bulky and anyway giving unique
> IDs to devices is pretty common and you lookup which device is which by
> simply looking at the drivers/ link....not suure what's the benefit of
> all of this...just to avoid an IDA table ?
>
> > >     retval =3D device_register(&scmi_dev->dev);
> > >     if (retval)
> > > @@ -413,7 +404,6 @@ __scmi_device_create(struct device_node *np, stru=
ct device *parent,
> > >     return scmi_dev;
> > >  put_dev:
> > >     put_device(&scmi_dev->dev);
> > > -   ida_free(&scmi_bus_id, id);
> > >     return NULL;
> > >  }
> > >
> > > @@ -526,7 +516,6 @@ static void __exit scmi_bus_exit(void)
> > >      */
> > >     scmi_devices_unregister();
> > >     bus_unregister(&scmi_bus_type);
> > > -   ida_destroy(&scmi_bus_id);
> > >  }
> > >  module_exit(scmi_bus_exit);
> > >
> > > diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/ar=
m_scmi/driver.c
> > > index 1b5fb2c4ce86..bbf1f05f2be3 100644
> > > --- a/drivers/firmware/arm_scmi/driver.c
> > > +++ b/drivers/firmware/arm_scmi/driver.c
> > > @@ -2641,8 +2641,8 @@ static int scmi_chan_setup(struct scmi_info *in=
fo, struct device_node *of_node,
> > >     cinfo->max_msg_size =3D info->desc->max_msg_size;
> > >
> > >     /* Create a unique name for this transport device */
> > > -   snprintf(name, 32, "__scmi_transport_device_%s_%02X",
> > > -            idx ? "rx" : "tx", prot_id);
> > > +   snprintf(name, 32, "__scmi_transport_device_%s",
> > > +            idx ? "rx" : "tx");
>
> I agree on what Dan said AND also this results in having the same name fo=
r different
> devices across 2 instances if you have a per-protocol channel because you=
 havent anymore
> the protocol_id bit.
hi  Cristian=EF=BC=8Cand dan
    Because I used a 3-tuple [parent name, name, protocol] when
creating the SCMI device name, I removed the prot_id from the
parameter =E2=80=98name=E2=80=99 when creating transport devices. This way,=
 it avoids
the repetition of protocol ID in the SCMI device name.

> All in all, I would drop this patch and keep naming as it is because I do=
nt see a real benefit
> here....up to Sudeep decide.
     Yes, it does not have real benefits, but from the perspective of
the device name, this change will be clearer and more meaningful. And
the code is more concise.

Thanks
guomin.chen
>
> Thanks,
> Cristian
