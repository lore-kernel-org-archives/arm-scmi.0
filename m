Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1B23101B4
	for <arm-scmi@vger.kernel.org>; Wed, 15 Apr 2026 09:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776246501; cv=none; b=c213AQPOVHAoJYGRpG+k0jJgpnq2RUsWUjZDTruIpBt1wgJ2kRHtJny/J3jztG06prl0zeGnLNtud1bNe2g/rhBG9EDR9xt5xA9RaCyOw6eoZ1QdEnTdkGviUgWS4WPRJUsccfl7iDAyXi2L+9FipmKyy3zaf35XXzw9nM78qX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776246501; c=relaxed/simple;
	bh=VvlkYNhtQ90P8L6Jh3neMSGe+P0dfTI5qZzeTQ2bo2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m8wPWCXa0fxAUiu8HmsbDFDmtLEd2DxpOEFgVNIELKlsBDmGsTcGjdCI9mycNKo6WkBzRNavcmL9QOdp9M5uYoL9l1zCgY+Tw7XsbCOSyjuf5dcExPx2hHcYfZuz5Z/DvwYaz234M6hSWqQYo/aaeSDQvHbNf3SjGR2Dl5rcC9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=rkJ6kNVW; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="rkJ6kNVW"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso64494125e9.1
        for <arm-scmi@vger.kernel.org>; Wed, 15 Apr 2026 02:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776246498; x=1776851298; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jMeurbQVmsgoyeIbBvxMLfni9ENDDzoCLDA23lXz4qw=;
        b=rkJ6kNVWnXsk8gIL766WuQ9rrUNbYU5Jjr69mZ3ZPOYQRU/qH88xjrLo+MDU9Se5Am
         sR6l4aIBphXU/d76KNuNUvvb6Ix6hwW8w/4uGYCVaE3colMDsHw8AyQ8ULI99v+SVUMd
         s26CCWAf0uSYqosJxi+3Qd2EEHAT8nFmp0fFA4JMi2nYzVr2h8fZb6abmM39IqwUfsZ+
         DmLBZovsqRoIaUAKGY8zdDHae4LBqHKZO9D5r41b7UMtdnOFXewkTceLW+K5DL1OQ73D
         ri/n4XfSIUl8Z1AovKEQAAJN69dQo/UZMbi40vA2bnzKHy7yYDlr8KyBqJjAvIRo9/Hj
         LlWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776246498; x=1776851298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jMeurbQVmsgoyeIbBvxMLfni9ENDDzoCLDA23lXz4qw=;
        b=VxD51VU+eOSUAIPfgBJO9BNqsSJJDWqkSz+Uu3FoV4KkcGSdih+rwXDlKOxBBOgnKW
         4c0q1vY50pPz29DtyyNE7kVzuu/FPpqgi96xh/PHhIESvtEUc5Rgw5iOLjJGT3E9Hh54
         Km1BCapIGkDyS9TtDOcRzG3CHuh+FhxzQJv3G91wf0ex6Z5P3Y6rmAzje9XiGdlFOtkm
         trp+LdznP0IBJbsHe40czB0aGjDIAu6JyWpVr3MDS4Bpw04PyzbAfoNSCGOJMDTzjHWw
         Q0dquWTgwEusty5IPEyEY8tTDrK+V0kZYCSf2rhnuFBJf6Mj+2c4FGpjbfbFdNJ56hrf
         nh3A==
X-Forwarded-Encrypted: i=1; AFNElJ9yTKG2+e1dO8FAhDfQUKVe6/SV4Hu4gHoIOcOUbdna9Q1RRm6FKFj6XhIXysSUb3rtG6UP7xWxqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ/BXYIoO8Finiup0bpn2OCL2VJTeN9k8CAzQvhrpu5seDRDFU
	uJiW7Yt64BokZvnhN9paXHAXKT+M2xRCQGldkB7n++Nc4N8py0E8d2crmzayx6YAw6/RmUyYvii
	54fHs
X-Gm-Gg: AeBDietioHQ3en3ptU55u9+ITl/h2CIFFGu2+AniysFCI38xZpRpIovthEiXe2ETZTQ
	evGiWSJUn3VSeJlJKk7mmq2hG6FzJOqie9tP7VYFUwzpSV1IHJbSljbA11FPXgyEqlezjVC87K8
	2zXDjXYkuJnJesSi7bfA1RAjxOhRFYmvq4zBaX5Dm8vCGb1bnC59Yv2DFtZJnMXEVOruhcBn5VZ
	MyZyDfEtfUVLh9sUpuRqbahccgKNWzXH+Mpoqt7HCFF/83AqDY09OHXG6A62op9B0isMFwHNp3w
	LisQZrOSm6NJnDgrL85mpvpYC/UAhy2vq26lLJpN5qoUzxy0Mn0LGZtoPv1HmVmjlGcdoeN0zE4
	r9M4tbMGSvLRrdCpTtpUPg9QBc63QOtjQ9/3Nd/IZQH410vAC4nTHX2bwscn39Qax3qVoj0o6XD
	mRDO8q/QcksgwsBkFgYi19noCXFZSzZcR2KM7iqG9oHYjBHMMQMEumjojSGNgWeKR9JJK3PZ3oW
	bMv1fM4GP1TWpw=
X-Received: by 2002:a05:600c:674f:b0:488:a82f:bb9b with SMTP id 5b1f17b1804b1-488d68cb47amr301649165e9.30.1776246497313;
        Wed, 15 Apr 2026 02:48:17 -0700 (PDT)
Received: from localhost (p200300f65f20eb083bb4a87bdc7af3c6.dip0.t-ipconnect.de. [2003:f6:5f20:eb08:3bb4:a87b:dc7a:f3c6])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-488ee042ff9sm133558095e9.14.2026.04.15.02.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 02:48:16 -0700 (PDT)
Date: Wed, 15 Apr 2026 11:48:15 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	"linux-kernel@vger.kernel.org Sudeep Holla" <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org
Subject: Probe function registering another driver [Was: Re: [GIT PULL]
 Driver core changes for 7.0-rc1]
Message-ID: <ad9cglZCwtsVsGmq@monoceros>
References: <DGCIBIK52SF8.3FVF3GR1R2302@kernel.org>
 <CAHk-=wgJ_L1C=HjcYJotg_zrZEmiLFJaoic+PWthjuQrutrfJw@mail.gmail.com>
 <ad6IJwpp5AA0-fAW@monoceros>
 <DHT95ARBC9W8.37Z54YM70UCT2@kernel.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sw57f7aismwd3wn2"
Content-Disposition: inline
In-Reply-To: <DHT95ARBC9W8.37Z54YM70UCT2@kernel.org>


--sw57f7aismwd3wn2
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Probe function registering another driver [Was: Re: [GIT PULL]
 Driver core changes for 7.0-rc1]
MIME-Version: 1.0

Hello Danilo,

[expanded Cc: a bit for the affected driver]

On Wed, Apr 15, 2026 at 01:04:47AM +0200, Danilo Krummrich wrote:
> On Tue Apr 14, 2026 at 8:39 PM CEST, Uwe Kleine-K=F6nig wrote:
> > does that mean that there is a driver involved that somehow violates dr=
iver
> > core assumptions and should be fixed even without the consistent lockin=
g?
>=20
> Most likely. There are two known cases where interactions with this commi=
t are
> expected.
>=20
>   (1) One of the drivers probed on your machine gets stuck within probe()=
 (or
>       any other place where the device lock is held, e.g. bus callbacks) =
for
>       some reason, e.g. due to a deadlock.  In this case this commit would
>       potentially cause other tasks to get stuck in driver_attach() when =
they
>       attempt to register a driver for the same bus the bad one sits on.
>=20
>       This is also the main reason why we eventually reverted this commit=
, i.e.
>       despite not being the root cause of an issue, it makes an already b=
ad
>       situation worse.
>=20
>   (2) If there is a driver probed on your machine that registers another =
driver
>       from within its probe() function for the same bus it results in a
>       deadlock.  Note that this is transitive -- if a driver is probed on=
 bus A,
>       which e.g. deploys devices on bus B that are subsequently probed, a=
nd then
>       in one of the probe() calls on bus B a driver is registered for bus=
 A,
>       that is a deadlock as well.
>=20
>       For instance, this could happen when a platform driver that runs a =
PCIe
>       root complex deploys the corresponding PCI devices and one of the
>       corresponding PCI drivers registers a platform driver from probe().
>=20
>       Anyways, for the underlying problem this reveals, the exact constel=
lation
>       doesn't matter.  The anti-pattern it reveals is that drivers should=
n't be
>       registered from another driver's probe() function in the first plac=
e.
>=20
>       I fixed a few drivers having this anti-pattern and all of them had =
other
>       (lifetime) issues due to this and I think there are other potential
>       deadlock scenarios as well.
>=20
> > Hints about how to approach the issue (if there is any) welcome.
>=20
> For (1) I think it's obvious, and I think it wouldn't have gone unnoticed=
 if any
> of the drivers were bad to the point that they're getting stuck in probe(=
) or
> any other place where the device lock is held.
>=20
> As for (2) I think the best way to catch it is lockdep. Unfortunately, lo=
ckdep
> won't be very helpful without some additional tricks, since the driver co=
re
> calls lockdep_set_novalidate_class() for the device lock to avoid false
> positives.

Thanks for the patch, indeed it creates a lockdep splat on my machine:

[    2.151192] optee: probing for conduit method.
[    2.195336] optee: revision 4.9
[    2.203597] optee: Asynchronous notifications enabled
[    2.203937] optee: dynamic shared memory is enabled
[    2.218444]
[    2.218466] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[    2.218474] WARNING: possible recursive locking detected
[    2.218484] 7.0.0-dirty #32 Tainted: G        W
[    2.218496] --------------------------------------------
[    2.218500] swapper/0/1 is trying to acquire lock:
[    2.218510] c2035cb4 (dev->mutex#3){+.+.}-{4:4}, at: __driver_attach+0x0=
/0x270
[    2.218565]
[    2.218565] but task is already holding lock:
[    2.218570] c2035cb4 (dev->mutex#3){+.+.}-{4:4}, at: __driver_attach+0x1=
30/0x270
[    2.218601]
[    2.218601] other info that might help us debug this:
[    2.218607]  Possible unsafe locking scenario:
[    2.218607]
[    2.218611]        CPU0
[    2.218614]        ----
[    2.218617]   lock(dev->mutex#3);
[    2.218631]   lock(dev->mutex#3);
[    2.218643]
[    2.218643]  *** DEADLOCK ***
[    2.218643]
[    2.218647]  May be due to missing lock nesting notation
[    2.218647]
[    2.218651] 2 locks held by swapper/0/1:
[    2.218659]  #0: c2035cb4 (dev->mutex#3){+.+.}-{4:4}, at: __driver_attac=
h+0x130/0x270
[    2.218693]  #1: c2690cb4 (dev->mutex#59){+.+.}-{4:4}, at: __device_atta=
ch+0x34/0x200
[    2.218728]
[    2.218728] stack backtrace:
[    2.218738] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W    =
       7.0.0-dirty #32 PREEMPT
[    2.218757] Tainted: [W]=3DWARN
[    2.218762] Hardware name: STM32 (Device Tree Support)
[    2.218770] Call trace:
[    2.218780]  unwind_backtrace from show_stack+0x18/0x1c
[    2.218814]  show_stack from dump_stack_lvl+0x68/0x88
[    2.218843]  dump_stack_lvl from print_deadlock_bug+0x370/0x380
[    2.218871]  print_deadlock_bug from __lock_acquire+0x1498/0x1f38
[    2.218895]  __lock_acquire from lock_acquire+0x138/0x40c
[    2.218918]  lock_acquire from __driver_attach+0x40/0x270
[    2.218939]  __driver_attach from bus_for_each_dev+0x78/0xc8
[    2.218966]  bus_for_each_dev from bus_add_driver+0xe8/0x238
[    2.218996]  bus_add_driver from driver_register+0x8c/0x140
[    2.219022]  driver_register from scmi_optee_service_probe+0x150/0x1f0
[    2.219053]  scmi_optee_service_probe from really_probe+0xe8/0x424
[    2.219079]  really_probe from __driver_probe_device+0xa4/0x1fc
[    2.219097]  __driver_probe_device from driver_probe_device+0x3c/0xd8
[    2.219117]  driver_probe_device from __device_attach_driver+0xbc/0x174
[    2.219136]  __device_attach_driver from bus_for_each_drv+0x8c/0xe0
[    2.219160]  bus_for_each_drv from __device_attach+0xb0/0x200
[    2.219184]  __device_attach from device_initial_probe+0x50/0x6c
[    2.219203]  device_initial_probe from bus_probe_device+0x2c/0x84
[    2.219228]  bus_probe_device from device_add+0x618/0x87c
[    2.219257]  device_add from optee_enumerate_devices+0x210/0x2cc
[    2.219286]  optee_enumerate_devices from optee_probe+0x8a0/0xa14
[    2.219311]  optee_probe from platform_probe+0x64/0x98
[    2.219335]  platform_probe from really_probe+0xe8/0x424
[    2.219355]  really_probe from __driver_probe_device+0xa4/0x1fc
[    2.219374]  __driver_probe_device from driver_probe_device+0x3c/0xd8
[    2.219393]  driver_probe_device from __driver_attach+0x13c/0x270
[    2.219412]  __driver_attach from bus_for_each_dev+0x78/0xc8
[    2.219436]  bus_for_each_dev from bus_add_driver+0xe8/0x238
[    2.219465]  bus_add_driver from driver_register+0x8c/0x140
[    2.219490]  driver_register from optee_core_init+0x18/0x3c
[    2.219519]  optee_core_init from do_one_initcall+0x74/0x424
[    2.219548]  do_one_initcall from kernel_init_freeable+0x2a8/0x328
[    2.219574]  kernel_init_freeable from kernel_init+0x1c/0x138
[    2.219599]  kernel_init from ret_from_fork+0x14/0x28
[    2.219620] Exception stack(0xdd811fb0 to 0xdd811ff8)
[    2.219634] 1fa0:                                     00000000 00000000 =
00000000 00000000
[    2.219648] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[    2.219659] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    2.221255] arm-scmi arm-scmi.0.auto: Using scmi_optee_transport
[    2.221289] arm-scmi arm-scmi.0.auto: SCMI max-rx-timeout: 30ms / max-ms=
g-size: 104bytes / max-msg: 20

The anti-pattern here is that scmi_optee_service_probe() calls
platform_driver_register(&scmi_optee_driver), see
drivers/firmware/arm_scmi/transports/optee.c.

Best regards
Uwe

--sw57f7aismwd3wn2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmnfXt0ACgkQj4D7WH0S
/k7+Xgf/VIX2gzUy/gM3RP/xqqj5s1HxYJLwTHX4tTocpq0RSH/xzfT4fEUZo/S4
Yo22SawptMwBDPAC0+I+4m8g6JNoI/LONGFp6fCv59gjicha+STtNhpKRB0z9tNq
ES8ZDRyNXE9ieyJGCT0zzxCUPv4jlvNSLR7OP2s9jaoDdXP+0tH0pQbsMfr0w5QF
3uj9zu/ScMNzCGMithmg9FgpoCHXX/W/fW94OGn+YlZ1LwVfVGklUwvpomA2ZUXK
jXn9CSw7O3kTzFttNjQVVVRR60cML7tCuMe1NZa0eDwdwMdtbRIR5Y5BXnDCGdY7
TzJ3EMql4uVK3HX0GBx03Z3PztFFWw==
=GQBb
-----END PGP SIGNATURE-----

--sw57f7aismwd3wn2--
