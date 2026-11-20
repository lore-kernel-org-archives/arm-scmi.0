Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163220;
	b=uEWsgzbyHd1tR8iF+8DRHlppO4ItvmKGRNguq30QcRb+BmD0N1yR7RIZh1VjylqYAKEU
	 yvAAwPbbwCKUjp+wsOe7QqIMbO80UL6d1sNO+Y3lCafNdo4ZzI1loJvDwPhZ1qtJF8uzy
	 KDwqnT/rIeDGZdSBmazlOMMZAWIwXoZ78MOX2RHppf2vf6oHHWOtLx5hWkZSxPmt3DKfj
	 sr0b/Ktv/4xhCf3/jvfLt0njvl8edgPW6a/AZDMKMYhGcwymFZMAzdJC3tva9ANnUwO/j
	 k0WWO3JuBDul68d6X3Xwa3XEpgCf9j6SqqC09K/KmkIP2lDqCG9qHThBrs3iam87dcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163220;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=OOnGsAGVoEs5x1m+oAWfOlWtzdwCIzVoBKrtW1ml1LQ=;
	b=MFbvhgaA7fvPNp5qESJP7Ss9OIVrskQSnCDNO9Z+GkJSVrF2krAdlZcv/e7tUGeFUX7j
	 Fb/XBgESfmkIPAZOaN2vI6Dh60AWvHBQPSpm2VwZC2iD00yLn7gGvj03hBIaUhak+PANa
	 lwh4E55C+f4fjJPIa2WymRdoXQRXuTqM8sM44M7B9UCYol6PlGVaTN04CGhA1aexiwaqr
	 rfycY1BDYheMVDBLJCj/btD9AkbU/olVMSaUKn0gOPrqoxR393rhEGK9DrbFGmI1FvXAU
	 aztTAzhHKc5OOW2XF5j9kyQPSkqHafbapJ5q0CExzNFZtvPAI4UYw1YO0DNf6uHo4qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D6B606A325
	for <arm-scmi@vger.kernel.org>; Fri, 20 Nov 2026 08:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1D6B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5eae1276409so208445e0c.3
        for <arm-scmi@vger.kernel.org>; Fri, 20 Nov 2026 00:26:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163219; x=1795768019;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OOnGsAGVoEs5x1m+oAWfOlWtzdwCIzVoBKrtW1ml1LQ=;
        b=Mod+LTW2+VjEGw3Ykko9zbtEkwi9PII1noI54wgvOOzh6hm/nlqjfuM3lK5b8yPsoR
         CjCbBOQK3VTQo46PYdXn5zdEitJCVqo1cAC0yGkkWPOGN9AV8Yh7KTf3+LLuYK5B8ghz
         qP/ulmB4kjeh4OgWFoTRc23SUV7elG2i/lRnwMy2c5r4JNZPj7V6ScSIRwJxUFsx4RSS
         HGA+qUWUfuiQscVQfprFxBsU5x6yfCJ3ODlZdPQRhr7FO1SXEKy7tLVTrYoTFcVj0hiw
         0Wf1CuUE6YgoZviyJe+6uBbLNj9VhTynOiAanPAaHyN/GGxILi08iCWTMHIq6z32GhKe
         Sicg==
X-Forwarded-Encrypted: i=1; AL+hErHvo4jul9jEQR9OojQrH4de46lgUzARRxFwKt867GcBR5R6iNTmo1ubkt26OxoQiy6NHqxmKdvuZQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z85iHrdqG6BR4CPYjdx5Hn14YGMDRU35eyrz8YJKoOIrhLz6pJt
	IvMfFlTZN3EupFtDG6LXriW2fythxWH9ulnbAtLIoW0kDr0l1ZC3LoriuPaiJ9fL
X-Gm-Gg: AZFdTZcdjs9Muba/qUjDXlkh9UW25jZEPo885xp8jsxksabZsTmf99MxyO9FBTfuuWJ
	CPovvfxFws2UB/wcNkXHQ3S8nZtgUJ6typW4pnO+NvJvVvPZgk37SdYKmWgO1Q7qCO1ktgulive
	iYYxYtl6szIIaPnSmSYI1EtK9rQw9x4ZlimIdxq0enbYX0gw/1Bjd2KiIAdivxW0JJIhO+krkca
	lVbO5rJ4dOKdU0vEI/X1EUVNSmT5A9QNgmvlNOpmVd70jN4286FrIGlBKkQo/xo96+oPrPXYt8r
	EOj1qZwum+dMxXFuCYpPdbZj++mMI0Po0FqDssYndPY0Sp181vfKjilni1ynLbb/Kg6Na6FQB74
	XwHTDBGLif0qQUsylpypfx93D6T45f4jC7AboxI+sucBQlwWKzscp05FZZ8N0dsxB2jfcH/k+Of
	l0vK8ysWYp9Zg9Itbif3qBgryuMps5hJwWjTil3USmfLN3kL6r6xwnXRryy75qKsnDwop6lkefT
	mrdV4uBxP0x8dh50yNFwowboFBDajTmlnjbfxA7DlfNWJoCRTTYc8j9kzmJbl0gqLMjDYy8M3mP
	YEXDgoWU26uF8ydfI69HfL+G86F/pLruOsWc9HcG9bZrSzWNuEJqG8yhA85MWo73/xg=
X-Received: by 2002:a05:6122:e44b:b0:5ea:98fb:e9de with SMTP id 71dfb90a1353d-5ee8adf3d10mr1153299e0c.3.1795163218700;
        Fri, 20 Nov 2026 00:26:58 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b556db7sm1884605e0c.4.2026.11.20.00.26.58
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 00:26:58 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-992f6d8cb51so135578241.3
        for <arm-scmi@vger.kernel.org>; Fri, 20 Nov 2026 00:26:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEpm4Blsfjaw2ZNjHGkmqjRM5qz/AilvySQnNkAwZnQCB6TIUYA8KiUAiWWcE8MQGg3gjJkVv8XhA==@vger.kernel.org
X-Received: by 2002:a67:e706:0:b0:7d2:7c63:5a08 with SMTP id
 ada2fe7eead31-7d739630203mr799846137.32.1795163218370; Fri, 20 Nov 2026
 00:26:58 -0800 (PST)
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107-arm-scmi-arch-dep-v1-1-514872e8ede4@iscas.ac.cn>
In-Reply-To: <20261107-arm-scmi-arch-dep-v1-1-514872e8ede4@iscas.ac.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 09:26:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUov1u3kXzBX3ZM8rRkBdLq_M8LwQ2VtxSEOH9w68Rr2g@mail.gmail.com>
X-Gm-Features: Aa3M54qI8mmq8jn4s299XQgo_FeZArEGNoWUlwaxQmcii1kzPDH4mMAcGfofjbE
Message-ID: <CAMuHMdUov1u3kXzBX3ZM8rRkBdLq_M8LwQ2VtxSEOH9w68Rr2g@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: Drop the ARM architecture dependency
To: gaohan@iscas.ac.cn
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Michal Simek <michal.simek@amd.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Han Gao <rabenda.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Han,

On Fri, 6 Nov 2026 at 20:40, Han Gao via B4 Relay
<devnull+gaohan.iscas.ac.cn@kernel.org> wrote:
> From: Han Gao <gaohan@iscas.ac.cn>
>
> The SCMI core and the mailbox and shared memory transports only use
> generic kernel interfaces. Transports that need architecture support,
> such as SMC, already carry their own dependencies.
>
> Drop the ARM and ARM64 dependency so that other architectures can use
> SCMI. Depend on HAS_IOMEM instead, for devm_ioremap().
>
> Suggested-by: Michal Simek <michal.simek@amd.com>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>

Thanks for your patch, which is now commit fe87ede443a15969 ("firmware:
arm: scmi: Drop the ARM architecture dependency") in scmi/for-linux-next.

> ---
> This was patch 1 of the Zhihe A210 SoC series [1]. As Michal asked, it
> now goes on its own through the SCMI tree.
>
> Since [1], it depends on HAS_IOMEM: Sashiko found that UML, which has
> no HAS_IOMEM, failed to link devm_ioremap().
>
> Build tested on x86_64 without OF, i386, loongarch64, ppc64le, riscv64
> and arm64. On UML, SCMI can no longer be selected.
>
> [1] https://patch.msgid.link/20261103-a210-scmi-v3-0-ee6b31580808@iscas.ac.cn

> --- a/drivers/firmware/arm_scmi/Kconfig
> +++ b/drivers/firmware/arm_scmi/Kconfig
> @@ -3,7 +3,7 @@ menu "ARM System Control and Management Interface Protocol"
>
>  config ARM_SCMI_PROTOCOL
>         tristate "ARM System Control and Management Interface (SCMI) Message Protocol"
> -       depends on ARM || ARM64 || COMPILE_TEST
> +       depends on HAS_IOMEM || COMPILE_TEST

Please extend the dependencies to RISCV (from the link above, I assume
you are targeting riscv?) instead.  There is no point in showing this
option on architectures that have no users of SCMI; one already has
too many relevant symbols to configure.
People who want to build test on x86_64 without OF, i386, loongarch64,
ppc64le, ... can just enable COMPILE_TEST.

>         help
>           ARM System Control and Management Interface (SCMI) protocol is a
>           set of operating system-independent software interfaces that are

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
