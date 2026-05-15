Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FE3386C28
	for <arm-scmi@vger.kernel.org>; Fri, 15 May 2026 11:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844582; cv=none; b=uybAodYALY6f/2XowzpTKDO9IxKWAkeefr0Lg3Y/pPsAtOm+bOBJKWsZZZtah93w93Y7/eXjtYQ/+AJf2A2w4RLkTOqo0gFjXN/V1juSZd5dbvtTt14rAQRq66+4/ipcFmJYfIEnhSXfyqKvPWzXa1a+SwoF4DU6LFnBmnVlxpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844582; c=relaxed/simple;
	bh=o6J54juue2hvBr7RHWfAAbvsqLecKYVaUKqGZPWak7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Am4mXSv2cMdOrEIH1Z0spSBqGm0Q25RC6JBFw4HtGftHkUreiT6isLyHOD35UGhFivIfUjDYSi0lLJk3LVvIdSWDWtTiAksxuwH3UWltm5/tCPJK0oe3075jztK+6eWNjDEfuXj1JQcYUMbj7EGptOQHAAA32SOnQQ/IlpJOdHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56a857578a8so3075620e0c.3
        for <arm-scmi@vger.kernel.org>; Fri, 15 May 2026 04:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844580; x=1779449380;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQILvaHK6HAMF4WWbXGYgrwUATMj459kIP6oFAIBqKE=;
        b=iAX3EemlprQoJ/nHJlFqOjIDMLRjK6J/4agmDmiusNZVpGz0Azd8u/lxPFPRjGpouA
         jIURKXpCGDaCuMpFjPxzpFix+v5bjFRZQ1gGG8DDFfaKGbdpiAIVNx4FqyxYI7BFOB7k
         i7FQi267J+5iTDBx/jzzdg8ONVoXasOflb4UAi6don+sxEmoVt4XtFEHDI8ieA2TryD8
         8i7NnAvM76SGXFijqpBR4FDa2eVNLwrhK7/8yAijA5zFsgJEF8/5gPBCXcH1mZd21lmA
         pRFyjHn9MedjstikblBcjo7nxxhdkB9Oy1Qzv0RKN8qivLNP2t0BTcaK1Q7KHmcfR65D
         7MVw==
X-Forwarded-Encrypted: i=1; AFNElJ9baxBDJObBj+bZGbOqmCkOmX9fNDNNZF8Jo5EnaKiJKMTZaY8DVZjPC50nxFYUIUJ3hGxADRBnxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMctKlFQEXe6tCGRBG//en/Oyi294npLPAa5Prqpi9+r87qy1i
	aUgVsSMVaYTjsoUAoAYR0tciKmbU8uyfhVGZEK1cikefdYpTuEzhH8kxW9ygz6h3
X-Gm-Gg: Acq92OGW50+7MHF2TpOXlB5utprrHdrPEn5NQdKaxFesnbOEPxehoPZr37xmJ45rlif
	fW0xkqGIuhPobDPQNo6NPPXW6IedMPjqHzkrqVdMT4eNCzE73Cv/HV80eRROQyfQzbRKqZHT6mj
	MP+/qCo8fcKqyrFEEYF6/nmSy2hLY0h72Ln7LfUszyoO8hh7JOYf3OwHWZpq7JrgDB5vJmbGflt
	DocsYvUy1PK0yUxyQ+et9KAkjFWYzVMB3uM/zK14jr7hRyO6bA91ZmJLPsHa3aJTuZCaIoVS9/0
	wk7PkxRAZg5jMRTOKxXCBk32D2q6z+uJ3d/GphKExyJE47/64BzNfprHKKj+EknqZ1c84g+o+QU
	Dn6NhRAqZ55pDGqky74gr4+Mdl39xgVrac9cxRr2dbLGe6uSpdQCS1Y7ONiGIzqY2iRAgNgEa0m
	+KRb+b1J2TKWwFXWdvtYOk9KUAGLrpY+NcoHdA62A9cC3dZ1sY7eJmQ0yIAqmnJhvAPk1NVH4=
X-Received: by 2002:a05:6102:3053:b0:633:4b2f:e8c1 with SMTP id ada2fe7eead31-63a404ac941mr1237419137.27.1778844579724;
        Fri, 15 May 2026 04:29:39 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-63ce6ecd76dsm578945137.7.2026.05.15.04.29.39
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:29:39 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-94dd01deb53so2550749241.0
        for <arm-scmi@vger.kernel.org>; Fri, 15 May 2026 04:29:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+o+keu94GcjvY+g4k5DF+UQjtizklivqi3ICCV+9LwC84+eyK98WnGFS2JJWSVKgCo0/INR3kZbg==@vger.kernel.org
X-Received: by 2002:a05:6102:800e:b0:634:92c:bdce with SMTP id
 ada2fe7eead31-63a3dc4948dmr1595206137.12.1778844579066; Fri, 15 May 2026
 04:29:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <75caae28bdffb55199a0bc6cac5df112a966c608.1778838987.git.geert+renesas@glider.be>
 <agb1Q6mrGyDwFdmO@stanley.mountain>
In-Reply-To: <agb1Q6mrGyDwFdmO@stanley.mountain>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 May 2026 13:29:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXreO-6xQ+e88AKQ_vSiwMPMnx=t8h5JChBAtuV4UDMEw@mail.gmail.com>
X-Gm-Features: AVHnY4ILblX8Kc7ouyA5FCpRoUCRbSH433_xQLSBPu5DFSlI9_3oTrxSlb8ISPQ
Message-ID: <CAMuHMdXreO-6xQ+e88AKQ_vSiwMPMnx=t8h5JChBAtuV4UDMEw@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: Fix OOB in scmi_power_name_get()
To: Dan Carpenter <error27@gmail.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

On Fri, 15 May 2026 at 12:28, Dan Carpenter <error27@gmail.com> wrote:
> On Fri, May 15, 2026 at 11:59:15AM +0200, Geert Uytterhoeven wrote:
> > scmi_power_name_get() does not validate the domain number passed by the
> > external caller, which may lead to an out-of-bounds access.
>
> Is an external caller an out of tree caller?  So far as I can see this

I meant a caller outside drivers/firmware/arm_scmi/.

> is only called by scmi_pm_domain_probe().
>
>         scmi_pd->name = power_ops->name_get(ph, i);
>
> where i < num_domains.

You are right. But this seems to be only API implementation in
drivers/firmware/arm_scmi/ that does not validate the passed domain
number.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
