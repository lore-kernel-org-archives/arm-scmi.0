Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388DF2595
	for <arm-scmi@vger.kernel.org>; Tue, 17 Dec 2024 02:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734401220; cv=none; b=T8xDKg1oLG6lQ1e2wcaYnG8Lv1teSDLV55peNW8YFeFL+TK7kDceG5Eq6ETgREmDIuNV3kr1Da243pg5gIYBcE5CTeElWxZO4y1D48y3uGaXUNejxbCNTutxPz/KcJWC3aQU6ymTPkZcZ0AmEGEXIb9CIHwUV64AQ2d4YJvww0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734401220; c=relaxed/simple;
	bh=UzXolnl7IR3ESiYkg+zAncx8rn0eORICVDNLoFujgX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UcVrze9Xta8kaU3ohFgUn7+xcOCR8SKMwIIqbmz6bXQpC3/efkW+7r2Pna/iJa50Qb+4LeJEZZmALUKJJrjPWjnvrSYKlV0Yqsa3Qlf8MdpQ4KuKZ3ocKZ7QQz/Ttu7iN4JoQ6NP5MR+3rQf4G/SS/hEhJjFTDuZ9C0rhdeVpEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z3KvP8Kr; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z3KvP8Kr"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7fd17f231a7so2747908a12.0
        for <arm-scmi@vger.kernel.org>; Mon, 16 Dec 2024 18:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734401217; x=1735006017; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EIN/h7uRleRuOPaWesWGXmjcSD2rqCCgng8WzwpjrR4=;
        b=Z3KvP8Krz7Wqy80NmC48kp/bBRQVxS4S60waVXdo7sy+OdjcS9fs5vmdpHBWFt2jnf
         Dn855XHpNXdQs5p1L1lEOkaDlCofIhp0NpgNS98kYz9RoJB9O2JZo+zI/hjz+QD5U7S6
         gmjfs88u2tML2dcGdv86w5KjgiGUqoXRI8od5olHYzXkQAbO81I0VTh2QK8/ooBqvw5p
         L5PwlKC9DlA9s3jIvKoLtz5X4VGasFV+QLoi4v8yQSKeCriHctNYEbC+dOMPfgu1aJqW
         cGx4vkMFMPuQ9tsZ+3VyGjafW787gq8F/basuUF9WhR1Y6/F7zqGRSYQinlO3xXcrgLe
         aTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734401217; x=1735006017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EIN/h7uRleRuOPaWesWGXmjcSD2rqCCgng8WzwpjrR4=;
        b=DJU6Al2gY+m+RXysAJQmzobMLwpo8UeiaVhT8hV9UL9VNUY+KsIPoaqUNdcyrAwMTl
         VAWgMuPwnyRd9jZD1esY884b1gsR4ddwTTUvhS/W+nYsBnTBr77dvQziZZEi+s+y1OIA
         hEUAHPqslskTju5sSG/EeO/aD3mb8xvtbeHQvhLZpLBE8xhUOxijJpVLgwPQUDrBn8sa
         5VVxE5WAVYKI5539h9CDsS7t+gs0bTcdy2U0kOZZptiCdSQ9w0PuRBU0Kfb20EOMIkc8
         jry5Z5VugUse32AlnoqAm1P6ryTbcR+3+a0mGNBtrDvlaLpzzqTdQVY19rY+W6tLQ0QN
         Hk0A==
X-Forwarded-Encrypted: i=1; AJvYcCX+iiawp/aaQ73OJh1viuLRZrlEULnvpuEwzAtfmk0bsXHIWqwIEJkdD28DbE8ihhLq3Zhy0cMxlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEwJwiAydnYKK+1n+f/AgTpu20P1k1KWgIBXcODYjlVbNyKAF3
	H9iWuKmgXB0Q5vj7bfFIjCa/1Zmtbl/Etf691nn7d3YZXqw7npdwB0HblQnJ8j9RMuLgOOfZ/J9
	fOnBGpJw+t+fJsC/FS5YW1h6LdLcjViNhsag=
X-Gm-Gg: ASbGnctGh9iFXnK/CjiSB3ZFBL1aIOfgN4IyIaomJW3GAPypY9AaKjPUStNrci+6oUQ
	vMh08XAgoYT98xuNnZwJZnzzVwfKoj+Rx6Y1h
X-Google-Smtp-Source: AGHT+IFTM+u99ByAMGYF6W0ILyoD1phxfeZM4zZP7X+sikySq+K1IeFxuV3WjGqrp+g/slaEeDRQbTQqBPtt0AYpniw=
X-Received: by 2002:a17:90b:4b51:b0:2ee:d186:fe48 with SMTP id
 98e67ed59e1d1-2f2900a6737mr18594263a91.28.1734401217267; Mon, 16 Dec 2024
 18:06:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216073745.2973317-1-guomin_chen@sina.com>
 <Z1_p0nU93PHJ4Sg_@pluto> <Z1_2rxJ7TOEIOMp7@pluto> <CAEEwsfRhe4-YAwe027huSXwFfkV-O-8w1GDNf=URa9efRsXiKA@mail.gmail.com>
 <Z2AEzHc5f6TjxErs@bogus> <CAEEwsfRKVBVR+DxhkYA5atxU7+6nsaL9X8-Yoa_DqB0YKEV1zg@mail.gmail.com>
 <Z2BQe3-zl2IN_Cjj@bogus>
In-Reply-To: <Z2BQe3-zl2IN_Cjj@bogus>
From: gchen chen <gchen.guomin@gmail.com>
Date: Tue, 17 Dec 2024 10:06:46 +0800
Message-ID: <CAEEwsfSYMx6Kdf2TK3hMN_TyoqEBbQXkCk_zPb+6-i=omZU_Fg@mail.gmail.com>
Subject: Re: [PATCH v2] firmware: arm_scmi: Delete the meaningless scmi_bus_id.
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, guomin_chen@sina.com, 
	Xinqi Zhang <quic_xinqzhan@quicinc.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sudeep Holla <sudeep.holla@arm.com> =E4=BA=8E2024=E5=B9=B412=E6=9C=8817=E6=
=97=A5=E5=91=A8=E4=BA=8C 00:08=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Dec 16, 2024 at 10:10:40PM +0800, gchen chen wrote:
> > Sudeep Holla <sudeep.holla@arm.com> =E4=BA=8E2024=E5=B9=B412=E6=9C=8816=
=E6=97=A5=E5=91=A8=E4=B8=80 18:45=E5=86=99=E9=81=93=EF=BC=9A
>
> [...]
>
> > >
> > > I would like to understand the motivation behind this change. What is=
 the
> > > goal ? Do you prefer to fetch the name and protocol id from the devic=
e
> > > name itself ? Is that your requirement.
> > >
> > hi Sudeep
> >     Okay, the reason I want to change names like 'scmi_dev.3' to
> > 'scmi_dev.firmware:scmi.perf.19' is because when I was migrating the
> > SOC's kernel from v6.1 to v6.6, I found that the context for creating
> > SCMI devices had changed (commit d3cd7c525fd2: firmware: arm_scmi:
> > Refactor protocol device creation).
>
> Correct. That's the beauty of Linux we can adjust the internals to enhanc=
e
> the features without breaking the user-space.
>
> > This change meant that device creation shifted from being directly
> > created through scmi_protocol_device_request during SCMI driver
> > registration to being created via scmi_device_request_notifier.
> > This shift results in changes to the order in which devices are created=
,
> > causing the ID in scmi_dev.id to drift.
> >
>
> What issue does this drift cause exactly ? I mean the order in which
> the devices are created should not impact on anything if the dependency
> on the order was not created. What was that dependency ?
>
Yes, my issue is that the loading order of the scmi_cpufreq_drv and
scmi_perf_domain_driver drivers causes other consumer devices to find
the wrong SCMI device as the supplier. Since both the scmi_cpufreq_drv
and scmi_perf_domain_driver drivers use the same device node (the same
SCMI_PROTOCOL_PERF), device_node.fwnode.dev will only point to the
SCMI device that was registered first.

Thanks

> > Additionally, I encountered some cpufreq errors here=E2=80=94because bo=
th
> > scmi_cpufreq_drv and scmi_perf_domain_driver use the same
> > SCMI_PROTOCOL_PERF, this results in two SCMI devices corresponding to
> > the same device node. However, device_node.fwnode.dev only points to
> > the first registered scmi_device, causing other consumer devices to
> > find the wrong scmi device as the supplier. So I would find a
> > multitude of other consumer devices waiting for meaningless device
> > names like "scmi_dev.4" instead of meaningful names such as
> > "scmi_dev.firmware:scmi.perf.19" or
> > "scmi_dev.firmware:scmi.cpufreq.19".
> >
>
> Yes this was reported. I think most of the std protocol may not use that
> node and need not be assigned. But I think vendor extensions are adding
> info to the DT that may need this.
>
> > Although I could further determine which specific driver it was by
> > looking at the driver links under the scmi_protocol bus directory, I
> > thought that if the logs directly displayed device names like
> > 'scmi_dev.firmware:scmi.perf.19' instead of meaningless progressive
> > IDs, it would be more convenient and logical, and thus more
> > meaningful.
> >
>
> If the issue you encountered render your platform into boot issues ?
> If so I would like to know what exactly happened. If not, I can think of
> alternate solution if possible.
>
> > > From the commit log, I get a sense that you looked at the code and th=
ought
> > > of possible improvement but when we mentioned the limitation you just
> > > improvised by adding parent name. Do you expect any userspace to pars=
e
> > > the name as that will end up being ABI and we can't break it. I need
> > > real motive to be explained here in detail.
> > >
> > I did not use userspace tools to parse this SCMI device name; I simply
> > wanted the name to reflect the possible logic of the device.
> > I did not remove scmi_dev.id (This scmi_device structure has not
> > changed.=EF=BC=89; I just no longer assign values to it using scmi_bus_=
id, so
> > it should not affect the kernel ABI (kABI).
>
> I understand the change, just not the possible impact w.r.t user-space.
>
> --
> Regards,
> Sudeep
