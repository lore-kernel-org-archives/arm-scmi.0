Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F89A205E12
	for <arm-scmi@vger.kernel.org>; Mon, 16 Dec 2024 14:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734358254; cv=none; b=khIJZplBUDLn/JA8G0STJBnloXja2vZEC//JNC0GKYoXyOUze8OxZGxWuaYngH26iUsGTB8upmB37TXHspEc90TQnyrJrChFnvEFxiABr1qt/hFB2fsPiXgBiddg1QvhXYQomlF50RGHk5+yuIdAcJmYKOcf+QCbMBrstEC6818=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734358254; c=relaxed/simple;
	bh=EGqFuZ41RG9A+WK1N5Si9/JhvZl5VW3lABeaQWqOwk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kAcYck28BM4v1NVIFu7bc0WX/eQJl2ljbZpOrfATWM0i6susybUoRebswD/0DYGme3D27kCORvV9U2518RDwf2sgJDZ08wNiNMxXdqha9DAg5/PINqpnIHjZ+r/ugpucqlp+jdiJLCay0fEC5Y3RGpCxUuj/kEyzvS0c4bUjuCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GPW1kukR; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GPW1kukR"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7ee11ff7210so3114163a12.1
        for <arm-scmi@vger.kernel.org>; Mon, 16 Dec 2024 06:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734358252; x=1734963052; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESBxnGjQ6iIPamuzmkiLGEsgssX1xQExaa4qKj5XDLE=;
        b=GPW1kukR2gmWCTijLmn62Z8XbcgWxiC2DcqJAMlWUELtlKH9re4pM4DAclm3h2unMV
         Lh6yGXf8+Eykkx9rVj0EfC6Wvo2Nt9D1S7jmcjeqlxYPswTXFAABnVqZ3eNBewW4lfqQ
         3Cvd3u2/NK4VhDLVhFpclwP4Qn/GhM0iMpm2gwgKdKaeahdtdbEnlEuCzm6Ahf6ZkeHs
         WCkAj3dzarjztXJSBkaF0owZhLtqTiTk/mcXRMqS7a3+pdzTDBRk9C4FdU9A7wE9DAYs
         HZDxZfa9aiWZ+b47VxLLPu0oKJYPliAPc9Dkv1C/623QBGxcMpQpk3F1H1QrF00YT0CK
         2sWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734358252; x=1734963052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ESBxnGjQ6iIPamuzmkiLGEsgssX1xQExaa4qKj5XDLE=;
        b=Eo6OSpKx9tS3JCLWvlOqP/d70vtkkwiV3IzaJuZiQiMtAr5/7uC08gNRNvE/7LoJte
         fWdUyTRBNx+pFTDETEVo/5HMDpE635sUAMVu4esryrUORz8kz32wj6HB+RBp9LrLDjYl
         bazJhFEtTOWedyJH/zsIpz9l+e7iMdKMebrBvPQoGVGX6dMyp9vpXe9ZM0P9yPg4sbwJ
         VzBZ+U4Xm+qxIx65WGG48chukDkjoeTYitvCrLZpKwlfpd3B9DlszgC9TV8HMxeUpdhL
         m3FjmPvBD8aiwd1e+nShbOM/1rEdjKUsZ3Kudzo6gRzNTztyxC4QVWxsRThUNylk92KR
         +bMA==
X-Forwarded-Encrypted: i=1; AJvYcCW8u7T6yjh/jhVtU4McI0iNInq7YGNvbDK4zoiXPCxyYj87DH9/eyM9LpcO91mKCNdGJU5DzTh2ww==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqyAL0JOFuhpWP4UDRK1SUhcdJjZ2MKyHQH15iQCIpf+gAz9Fu
	C6i360f234O1mucncOtV0DPntPUZ+1H3nFJzNSkX18yABeWnpiFJqpv8XJx0WtKSifB32EvhIO1
	5rGdPReddLuAEr4IKfgqlK4axFBr4FI3/beY=
X-Gm-Gg: ASbGncsq0974zdYNPzz5CSqhh8OFgO1TW6iFAiWywDsVdd7UhezKR1jlx7HArIURDpb
	umBUGEcMXJv8Ycg6TUeZVpPMYIlMKk6UyNXkP
X-Google-Smtp-Source: AGHT+IHooDk2d2CvIKZ5M4nR76SBt2dDXzSYQuSOP4qV1b1v7Pgm4WhXRY5M08iYY3OwduTeED9Ovz3W2nd1vTTOPCI=
X-Received: by 2002:a17:90b:3c4a:b0:2ee:7233:4e8c with SMTP id
 98e67ed59e1d1-2f28fb522d7mr19148258a91.8.1734358251592; Mon, 16 Dec 2024
 06:10:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216073745.2973317-1-guomin_chen@sina.com>
 <Z1_p0nU93PHJ4Sg_@pluto> <Z1_2rxJ7TOEIOMp7@pluto> <CAEEwsfRhe4-YAwe027huSXwFfkV-O-8w1GDNf=URa9efRsXiKA@mail.gmail.com>
 <Z2AEzHc5f6TjxErs@bogus>
In-Reply-To: <Z2AEzHc5f6TjxErs@bogus>
From: gchen chen <gchen.guomin@gmail.com>
Date: Mon, 16 Dec 2024 22:10:40 +0800
Message-ID: <CAEEwsfRKVBVR+DxhkYA5atxU7+6nsaL9X8-Yoa_DqB0YKEV1zg@mail.gmail.com>
Subject: Re: [PATCH v2] firmware: arm_scmi: Delete the meaningless scmi_bus_id.
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, guomin_chen@sina.com, 
	Xinqi Zhang <quic_xinqzhan@quicinc.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sudeep Holla <sudeep.holla@arm.com> =E4=BA=8E2024=E5=B9=B412=E6=9C=8816=E6=
=97=A5=E5=91=A8=E4=B8=80 18:45=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Dec 16, 2024 at 06:37:01PM +0800, gchen chen wrote:
> > Cristian Marussi <cristian.marussi@arm.com> =E4=BA=8E2024=E5=B9=B412=E6=
=9C=8816=E6=97=A5=E5=91=A8=E4=B8=80 17:45=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Mon, Dec 16, 2024 at 08:50:26AM +0000, Cristian Marussi wrote:
> > > > On Mon, Dec 16, 2024 at 03:37:45PM +0800, guomin_chen@sina.com wrot=
e:
> > > > > From: guomin chen <guomin_chen@sina.com>
> > > > >
> > > > > Currently, scmi_bus_id is only used to set scmi_dev.id,
> > > > > which in turn sets the SCMI device name. After removing
> > > > > scmi_bus_id, it is clearer and more meaningful to directly
> > > > > use the unique tuple [Parent name,device name, protocol] to
> > > > > set the SCMI device name.
> > > > >
> > > >
> > > > Hi Guomin,
> > > >
> > > > this same pTCH was NACKed(Rejected) a few days ago:
> > > >
> > > > https://lore.kernel.org/arm-scmi/20241211134505.2218386-1-guomin_ch=
en@sina.com/T/#u
> > > >
> > > > ...and you agreed that is not a simplification we can do (not to br=
eak
> > > > multuple instances...)...
> > > >
> > > > ..so why you are posting V2 now ?
> > >
> > > Wait...you changed slightly this indeed....you are using dev_parent..=
.my
> > > bad...but please when you post new version of a patch add a summary o=
f
> > > changes between versions...
> > >
> > > >
> > > > Thanks,
> > > > Cristian
> > > >
> > > > > Signed-off-by: guomin chen <guomin_chen@sina.com>
> > > > > ---
> > > > >  drivers/firmware/arm_scmi/bus.c    | 17 +++--------------
> > > > >  drivers/firmware/arm_scmi/driver.c |  4 ++--
> > > > >  2 files changed, 5 insertions(+), 16 deletions(-)
> > > > >
> > > > > diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/a=
rm_scmi/bus.c
> > > > > index 157172a5f2b5..800e8ec9357c 100644
> > > > > --- a/drivers/firmware/arm_scmi/bus.c
> > > > > +++ b/drivers/firmware/arm_scmi/bus.c
> > > > > @@ -20,7 +20,6 @@
> > > > >  BLOCKING_NOTIFIER_HEAD(scmi_requested_devices_nh);
> > > > >  EXPORT_SYMBOL_GPL(scmi_requested_devices_nh);
> > > > >
> > > > > -static DEFINE_IDA(scmi_bus_id);
> > > > >
> > > > >  static DEFINE_IDR(scmi_requested_devices);
> > > > >  /* Protect access to scmi_requested_devices */
> > > > > @@ -341,7 +340,6 @@ static void __scmi_device_destroy(struct scmi=
_device *scmi_dev)
> > > > >     if (scmi_dev->protocol_id =3D=3D SCMI_PROTOCOL_SYSTEM)
> > > > >             atomic_set(&scmi_syspower_registered, 0);
> > > > >
> > > > > -   ida_free(&scmi_bus_id, scmi_dev->id);
> > > > >     device_unregister(&scmi_dev->dev);
> > > > >  }
> > > > >
> > > > > @@ -349,7 +347,7 @@ static struct scmi_device *
> > > > >  __scmi_device_create(struct device_node *np, struct device *pare=
nt,
> > > > >                  int protocol, const char *name)
> > > > >  {
> > > > > -   int id, retval;
> > > > > +   int retval;
> > > > >     struct scmi_device *scmi_dev;
> > > > >
> > > > >     /*
> > > > > @@ -387,20 +385,13 @@ __scmi_device_create(struct device_node *np=
, struct device *parent,
> > > > >             return NULL;
> > > > >     }
> > > > >
> > > > > -   id =3D ida_alloc_min(&scmi_bus_id, 1, GFP_KERNEL);
> > > > > -   if (id < 0) {
> > > > > -           kfree_const(scmi_dev->name);
> > > > > -           kfree(scmi_dev);
> > > > > -           return NULL;
> > > > > -   }
> > > > > -
> > > > > -   scmi_dev->id =3D id;
> > > > >     scmi_dev->protocol_id =3D protocol;
> > > > >     scmi_dev->dev.parent =3D parent;
> > > > >     device_set_node(&scmi_dev->dev, of_fwnode_handle(np));
> > > > >     scmi_dev->dev.bus =3D &scmi_bus_type;
> > > > >     scmi_dev->dev.release =3D scmi_device_release;
> > > > > -   dev_set_name(&scmi_dev->dev, "scmi_dev.%d", id);
> > > > > +   dev_set_name(&scmi_dev->dev, "scmi_dev.%s.%s.%d", dev_name(pa=
rent),
> > > > > +                   scmi_dev->name, protocol);
> > > > >
> > >
> > > So now you are using the parent top node SCMI device to create a uniq=
ue
> > > device...and it probably endup in a name like:
> > >
> > >         scmi-dev.arm-scmi.0.auto.genpd.13
> > >
> > >         scmi-dev.arm-scmi.1.auto.genpd.13
> > >
> > > ...that certainly is more readable but is bulky and anyway giving uni=
que
> > > IDs to devices is pretty common and you lookup which device is which =
by
> > > simply looking at the drivers/ link....not suure what's the benefit o=
f
> > > all of this...just to avoid an IDA table ?
> > >
> > > > >     retval =3D device_register(&scmi_dev->dev);
> > > > >     if (retval)
> > > > > @@ -413,7 +404,6 @@ __scmi_device_create(struct device_node *np, =
struct device *parent,
> > > > >     return scmi_dev;
> > > > >  put_dev:
> > > > >     put_device(&scmi_dev->dev);
> > > > > -   ida_free(&scmi_bus_id, id);
> > > > >     return NULL;
> > > > >  }
> > > > >
> > > > > @@ -526,7 +516,6 @@ static void __exit scmi_bus_exit(void)
> > > > >      */
> > > > >     scmi_devices_unregister();
> > > > >     bus_unregister(&scmi_bus_type);
> > > > > -   ida_destroy(&scmi_bus_id);
> > > > >  }
> > > > >  module_exit(scmi_bus_exit);
> > > > >
> > > > > diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmwar=
e/arm_scmi/driver.c
> > > > > index 1b5fb2c4ce86..bbf1f05f2be3 100644
> > > > > --- a/drivers/firmware/arm_scmi/driver.c
> > > > > +++ b/drivers/firmware/arm_scmi/driver.c
> > > > > @@ -2641,8 +2641,8 @@ static int scmi_chan_setup(struct scmi_info=
 *info, struct device_node *of_node,
> > > > >     cinfo->max_msg_size =3D info->desc->max_msg_size;
> > > > >
> > > > >     /* Create a unique name for this transport device */
> > > > > -   snprintf(name, 32, "__scmi_transport_device_%s_%02X",
> > > > > -            idx ? "rx" : "tx", prot_id);
> > > > > +   snprintf(name, 32, "__scmi_transport_device_%s",
> > > > > +            idx ? "rx" : "tx");
> > >
> > > I agree on what Dan said AND also this results in having the same nam=
e for different
> > > devices across 2 instances if you have a per-protocol channel because=
 you havent anymore
> > > the protocol_id bit.
> > hi  Cristian=EF=BC=8Cand dan
> >     Because I used a 3-tuple [parent name, name, protocol] when
> > creating the SCMI device name, I removed the prot_id from the
> > parameter =E2=80=98name=E2=80=99 when creating transport devices. This =
way, it avoids
> > the repetition of protocol ID in the SCMI device name.
> >
> > > All in all, I would drop this patch and keep naming as it is because =
I dont see a real benefit
> > > here....up to Sudeep decide.
> >      Yes, it does not have real benefits, but from the perspective of
> > the device name, this change will be clearer and more meaningful. And
> > the code is more concise.
> >
>
> I would like to understand the motivation behind this change. What is the
> goal ? Do you prefer to fetch the name and protocol id from the device
> name itself ? Is that your requirement.
>
hi Sudeep
    Okay, the reason I want to change names like 'scmi_dev.3' to
'scmi_dev.firmware:scmi.perf.19' is because when I was migrating the
SOC's kernel from v6.1 to v6.6, I found that the context for creating
SCMI devices had changed (commit d3cd7c525fd2: firmware: arm_scmi:
Refactor protocol device creation). This change meant that device
creation shifted from being directly created through
scmi_protocol_device_request during SCMI driver registration to being
created via scmi_device_request_notifier. This shift results in
changes to the order in which devices are created, causing the ID in
scmi_dev.id to drift.

Additionally, I encountered some cpufreq errors here=E2=80=94because both
scmi_cpufreq_drv and scmi_perf_domain_driver use the same
SCMI_PROTOCOL_PERF, this results in two SCMI devices corresponding to
the same device node. However, device_node.fwnode.dev only points to
the first registered scmi_device, causing other consumer devices to
find the wrong scmi device as the supplier. So I would find a
multitude of other consumer devices waiting for meaningless device
names like "scmi_dev.4" instead of meaningful names such as
"scmi_dev.firmware:scmi.perf.19" or
"scmi_dev.firmware:scmi.cpufreq.19".

Although I could further determine which specific driver it was by
looking at the driver links under the scmi_protocol bus directory, I
thought that if the logs directly displayed device names like
'scmi_dev.firmware:scmi.perf.19' instead of meaningless progressive
IDs, it would be more convenient and logical, and thus more
meaningful.

> From the commit log, I get a sense that you looked at the code and though=
t
> of possible improvement but when we mentioned the limitation you just
> improvised by adding parent name. Do you expect any userspace to parse
> the name as that will end up being ABI and we can't break it. I need
> real motive to be explained here in detail.
>
I did not use userspace tools to parse this SCMI device name; I simply
wanted the name to reflect the possible logic of the device.
I did not remove scmi_dev.id (This scmi_device structure has not
changed.=EF=BC=89; I just no longer assign values to it using scmi_bus_id, =
so
it should not affect the kernel ABI (kABI).

Thanks
guomin.chen
> --
> Regards,
> Sudeep
