Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84453FAE13
	for <arm-scmi@vger.kernel.org>; Fri, 15 May 2026 11:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844982; cv=none; b=K/1NEb+KKwju14JQTOHyD/AMia46vfI+3cbRt2JQMOtlQ6BJhLQQsnQ92CYz50cQUflZfIVbFdXJTLHKKVuBbAqnEu7Lx2uCdsca50VhwfQFLnnAuulB+SIObJyahTWjh5B7GsfVt5XbMg4LgV+UcVPRyqdC22i64278NVhvl2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844982; c=relaxed/simple;
	bh=uAY04i7si7CzF2ofplxmgA6xM+wgTQXcak9iKdl1kzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gufE67wE+uHvl+pUpWbi1gIS/H+05h6CH2t9yDm5t2nzwZN1eY4+7aWc9DDb0pSNlbCJUSsaHcEBpEqdWn5VtlyO3wOGxq51qthTMkq6Zm8dSGC5dzFeZmwbSb6AnaACQNgCjekuncHI8I4wjMFwOZFsm+6VBS/tANygwkZeRZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHktvP3y; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHktvP3y"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48d102471a4so88822055e9.2
        for <arm-scmi@vger.kernel.org>; Fri, 15 May 2026 04:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778844979; x=1779449779; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yzXXcPatHUTECkq22Qox7RnVgD274dLeIoFpGjG0hKI=;
        b=JHktvP3ycT/JVEkRu4FEkZWenO+UzRHpny2YAC3Gea7beJncqBTm2zJsAvMyIMOb0t
         D77iF/vsrejAuHdtBgyuCx/Q+bH2cF09JnGomjTz1x1Rjp1xE5wmhMwyBa6w+vZldljI
         tRZs9rV7nqKLJQLj/O4BldRpkHmdJegXTjUQdlJwCpWko4tjJeCpE9LksFAn2pWtnKW5
         gEZqlLNCZOGsWDo7mEh4T3/IhfCi2cP3MyBicb/MYDeGl6UTJEB2g/GpMmQ+HMz1mz+P
         03Hdk0tAwEMU9MLM0LjiIbvaegP0LAlOdi3BiWe7UH9/Oz6EtKmTo6j9vrwi7mDxaQrC
         mw3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844979; x=1779449779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yzXXcPatHUTECkq22Qox7RnVgD274dLeIoFpGjG0hKI=;
        b=DCsrue/T+OrLH3vz6buRkIGbp/n0IiZsNRQB+8quUOMOMO+MVMZ8eX37o3clDV3jRb
         G0FZnphqcDzYmCq188NpeMpza9R3/hvGBnNmaKo3BUG+7CTYh9PszG4xNN8ubmkxJo+K
         pHgySWWWDKxDdYWEq2Hb+2rmCzu1f64BkTN2qeRqNN8kaiJpA/nXclO3SatMWrfMmnSQ
         RX+LkjWsYvr77mrtoltQtUCSE2aDsawZFI8gmu7PTiT7mnT2yK09jENs2AsrRK6BK54v
         Q5GRx0tXweVe6nmrkt4qPlibMUUQxq+sNetf4KogMtmSu05JujB9ULZHOS0G0LBJRPTS
         ttYw==
X-Forwarded-Encrypted: i=1; AFNElJ/DMJLTHu/GJ2CYDpz6wR4iL45jzpbXikyMqf+hI3873l8IbtYAMZ0fN5f3I9IZf54Fw6KMhb9sUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkCTAijqU7/MIexoemsRQUuW6OvaI2g5H91v0h+ANdyq6su9K2
	8ADi8hdOfUEnrnL+3sKonETSW08ukP9J/c06qXSjTXuKck1ymmb7cD6O
X-Gm-Gg: Acq92OHlw3xEB6jCyjbBovBmHs4s/yez2SBlwmQNbafekxPd6ip1YqKHy8hlmB1mzL1
	zquSh+zAhcqDvI3cvg9/otLZq9JiyeLg3UKRB+uUUp9FGhCzMIUSYb90I9tu6Dh40FHXZ2XZwvO
	ZchxcStr35rCUt8wAQExJf0XS5c/RQpWj10uwQJZwUIGQpzDx5pMHl2KR/IDboUUUKmDjPuaS4z
	oAqIYObZqb71AGwW71O3LwUwCC6OdSv6FCAn3Kp2UrfVpKNvqWINe96Xhs1FOxj+sOB5S6o9rn6
	cuArgx+WDcWuevrXERTLs3bjTw92Kbv6Oi6bN/BnDXosi7PvW/h0W45SbRABz0J/PtS8gKUGqxh
	UhUDw0d2g7LZ5b3e2I1Cfq0Rwx/SAv7UlpBckJpEFrHtb+3zVcDtiaqKHeYpF0HioC/P3jrzJiX
	NjcvCYWxNa7ruku0EjlPo=
X-Received: by 2002:a05:600d:8:b0:48a:5565:ec3d with SMTP id 5b1f17b1804b1-48fe61f7a92mr51272135e9.22.1778844979216;
        Fri, 15 May 2026 04:36:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe53804aesm52347505e9.15.2026.05.15.04.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:36:18 -0700 (PDT)
Date: Fri, 15 May 2026 14:36:15 +0300
From: Dan Carpenter <error27@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Fix OOB in scmi_power_name_get()
Message-ID: <agcFL0oFbx2GEgPJ@stanley.mountain>
References: <75caae28bdffb55199a0bc6cac5df112a966c608.1778838987.git.geert+renesas@glider.be>
 <agb1Q6mrGyDwFdmO@stanley.mountain>
 <CAMuHMdXreO-6xQ+e88AKQ_vSiwMPMnx=t8h5JChBAtuV4UDMEw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXreO-6xQ+e88AKQ_vSiwMPMnx=t8h5JChBAtuV4UDMEw@mail.gmail.com>

On Fri, May 15, 2026 at 01:29:27PM +0200, Geert Uytterhoeven wrote:
> Hi Dan,
> 
> On Fri, 15 May 2026 at 12:28, Dan Carpenter <error27@gmail.com> wrote:
> > On Fri, May 15, 2026 at 11:59:15AM +0200, Geert Uytterhoeven wrote:
> > > scmi_power_name_get() does not validate the domain number passed by the
> > > external caller, which may lead to an out-of-bounds access.
> >
> > Is an external caller an out of tree caller?  So far as I can see this
> 
> I meant a caller outside drivers/firmware/arm_scmi/.
> 
> > is only called by scmi_pm_domain_probe().
> >
> >         scmi_pd->name = power_ops->name_get(ph, i);
> >
> > where i < num_domains.
> 
> You are right. But this seems to be only API implementation in
> drivers/firmware/arm_scmi/ that does not validate the passed domain
> number.

I don't have a problem with the patch but I don't think it should have
a Fixes tag.

regards,
dan carpenter

