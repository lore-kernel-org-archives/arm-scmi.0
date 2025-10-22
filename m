Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B935288C2B
	for <arm-scmi@vger.kernel.org>; Wed, 22 Oct 2025 09:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761125773; cv=none; b=Eglv/2D/TfONoibI/Jnuhgt5NCMpGHkvBWal9o6cQTJCZBCAXWnsetTLPYYUZT91IxuxtsuigYT4dDgBZ9Y3LGojqcxtolVJpH2D51jz1X6R9dLzNzntsvFNFQrzpDC5sZhZTpg/FraAvFIQxymFu0FU19fTMtKkJN3QyVva0cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761125773; c=relaxed/simple;
	bh=C88xFCOXStXuP1GEmHHJ52O6btKAi7VYGysPrZNMuyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jk2h5I0O+BYJwwv9QitGSlrkBvBM3NtG/L+0Z2M3eGCw7GuOvQCU8tG1/HcrkVrGSC3mxiv0ZfwiWxsH371z6hkPkRGW23/Zz/AMj2+HcQA4rY69K42EIP/1aowHAsHsucC1b+eyw6ZFgaVgD4nKATlMq5Svi7Gi3My9M/1ZDK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GdaLuwN2; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GdaLuwN2"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-63c12ff0c5eso1857574a12.0
        for <arm-scmi@vger.kernel.org>; Wed, 22 Oct 2025 02:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761125770; x=1761730570; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C88xFCOXStXuP1GEmHHJ52O6btKAi7VYGysPrZNMuyg=;
        b=GdaLuwN2Ln7J4l/a0cfVhLr+vpRDxbQx8/6ccG2VSbNniqvgKt2bTcgj6oQuKjAzuD
         69aMJGcjlcZUgldDBuZQppyYjtQIhUwV3Bdby/CrgrbI8To3xt8WvxJ3NvoOOskMur3T
         1J8V1t+97plfvW4emgAawP3m1Vp500UAoAQJo4AwKZALo6i0gxPBhvLzxu3Jo5aTIUA6
         znwIVAuzS7GuwU6ZMiON5K72FQC9I+s/suyb05daG7gU51PT6aDYkrS9cUcgT7pISFua
         qLsjh6sUkq/PbLnr/FeTfVKvRy5LUOXJ2XHbM76YKeGB+/9QI0VhfmoNu0AVo6f5eM2R
         ruQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761125770; x=1761730570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C88xFCOXStXuP1GEmHHJ52O6btKAi7VYGysPrZNMuyg=;
        b=Qi/S8XyUf/FjIORPjAvrHEnhWhMHVATuIXQve1LPodxp1fJmYDO2M3uDnytWmysm0V
         xZ35U8lddsyF337M5IgsSrzWm/vINRSk5Pm3JnZI8JjqwOOmLUPLkcQWnXcBwDKCi/yx
         XNaSloUQJ9iH3XzN24cG8Y75T5RyLbJ4jBOuVri1DG1tIPW2/5FtzmZAs2kwuIZEkD/o
         2aYXvqASg5BsmirefB/nNf0wAlPLI4/PXmw2OVfgvQWDM3apOgMoiBF2R5CW7pYcMZse
         jDcAXKYp2OiGkyfZiR8m+LZzacf0olDlVoY45vMe9PxP8v4SNer0qKAGoJstwzv2LZx4
         2RkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGrDXeW4V+Wh/mBpfNAknCbk0bTA8eK1S6DLCS9fS4xpIuonqSWEii5Z4/cQ5KBfrkeVbesNA0oA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+cQZwS3LEyevn/waxwVDr4XM99R3JQA+iFHXzGbf0dqzWmEuN
	jlgaI5avtFs6s40E/cpN7n32k6PFVYL6uVZLvaLxNoqkWLA9HGisFrifi5HHpyzi6jEzx/2w16h
	o1YPqUmUXIVtDYC0CYd6Ewx/4LTB6UPk=
X-Gm-Gg: ASbGncvjhfVjaTQk/+0Srvr2rBkpGJ8U3NAV5r1/MZec3rMoqvqafMbtdyzbByYp8Vd
	UFMY9xZQa3GQ9AXOonR5u9OhHz6l+QaPKvS79s2P/8TC65TRoKlrZvtVIVPI4Ph7bnUcp7PKixV
	FOGFbBim47/RIOVRB+8l4NU9YBqkZd/6EH7WsemvOVaqQobM6baBCMKzpvcRUO7Q3RqTkBrjCcD
	NEtZOaCgdn81ic5QJyo0nV4TR97CdmbVH3fem+4EdppDOhJ5VvLZpI6Gr536Q==
X-Google-Smtp-Source: AGHT+IGto3EQlisuvoE7Sasg5zwzwjSEmlEE8ttsGQiw66ca1d04S75zETC5/PIhjoAM5dxY+M9aaYxATM6s/kFKsOM=
X-Received: by 2002:a05:6402:1454:b0:636:2699:3812 with SMTP id
 4fb4d7f45d1cf-63e169999c3mr2842093a12.0.1761125769618; Wed, 22 Oct 2025
 02:36:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021165212.749372-1-a.shimko.dev@gmail.com> <20251022-rugged-archetypal-wallaby-ecbecf@sudeepholla>
In-Reply-To: <20251022-rugged-archetypal-wallaby-ecbecf@sudeepholla>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Wed, 22 Oct 2025 12:35:58 +0300
X-Gm-Features: AS18NWD2CL-Yrxb3Tz9eDASZQ73ONHWrSw9NcQfoZQ6WrOD4sVc61IZW3QMRIxU
Message-ID: <CAOPX744QeM=5qsF0_ZrkvvuumH-EsmJPDMSSs=D04zP=tie3qQ@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: Add new sensor unit types
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 12:22=E2=80=AFPM Sudeep Holla <sudeep.holla@arm.com=
> wrote:

> It is still alpha, we don't add anything into the kernel unless it is
> of beta quality. Do you have a use or you are just adding to match the
> spec ?
Hi Sudeep,

I'm adding it to meet the specifications.

Trying to be useful

Thank you.

Best regards,
Artem
