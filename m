Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3592520C47A
	for <arm-scmi@vger.kernel.org>; Fri,  7 Mar 2025 09:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741340060; cv=none; b=ZiOHqqI/DefEsiY27mkahZSeLdTGhb3xsWzfuNP8IJjiPKtCQUnVVlb/nei6b8On9UwpdBfWV/Cikwgoc1J+9zIJulEyerqdgSkoerE7UZaIRfzTYCDs4+PgLAfWxx+R2xlbqG/QnpFHulJJW22y8Rnf9XBpVrYD4HFGSERaL+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741340060; c=relaxed/simple;
	bh=G4ZdZ3jn8XixgDv3LYH+FbkhXka89hw0bw5VeQ0/00o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ISQWm3DE13FLfZihRO95D2KcCb8kkMTPIA081tz1T1nlGnMsaEEvoJ0a9kc6rokYoon1ayaW+OzGQi/8x5PY04skaVsBwPk6UTaM6Zm2C51i4ZcWjZrYRJn+eUgZHvbHNdP3VRUacb1Y+jZThfsPD+wiW85ZinchLipX/5JQO0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=09Icbpot; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="09Icbpot"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43bbbb00891so6916485e9.1
        for <arm-scmi@vger.kernel.org>; Fri, 07 Mar 2025 01:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741340057; x=1741944857; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=R840fbpOCY97ygCHkbEX+Ner86gAnwGHvg1aopa7qhQ=;
        b=09IcbpotA4T2sxZgOfjiIL6siNgiXYZ8TmTjdleZFOClycRpzcv9+vGTJXkIAe5d6t
         eME7KZ/bVpoO3fERN9mH04mXVj1hDNDChLykDg2PXzNCWvXZbwLcrope9H1PSHEFaRek
         rgPDL7dJ0FtgnBzZT5/fowxyh2b72N7AlytgRYCmjdyiiJ4kYoTkqR0fKc4k5upBAzWa
         SBMGsyyybtM8vJ2Jrn1n3JZfLlofS1eV+1vIM8UlnkmZ+WpIebkOxOtCSi9jT3C5S9to
         QBK/p//VNYjzzwlBudC3j/KsVcK+/Z+XTTLvRZlVauBNYMa5pihypAmNrov4o8NW8aen
         ATeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741340057; x=1741944857;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R840fbpOCY97ygCHkbEX+Ner86gAnwGHvg1aopa7qhQ=;
        b=ENLIHiFDiu0Cs1SxU7DFszIamUu5ldZPUJkdWKyIbH0XGY8zwmsz9Pdq4cTCoQH01X
         Fgi+H863ol+eHWtoPrXGdBdCwJZK2CiPhJgp6cAQGo4gZddEeS8bW4PGhEzO55yLU0oU
         tNE26VmQcBLXiLa5qSfAbzxhmIrU5L7NUiLUfGyC6D5ekEHoAP3zcPuFyPPJopD3Bmqa
         U7Lh6LsVuTAzZMd07KAa2d+IfQOLvwxGEUb/18CeGey8T/IzhKfozSq0pvS5rsTnCouZ
         9uzVPh2lChfga2d/bef5v7a/g0DHKYWkQRlasTP0IErCdNYQJNneEnahF8HUu2UjEaXo
         tMHA==
X-Forwarded-Encrypted: i=1; AJvYcCUKT4eVwlrTyJZXUQfUZVmTaplf7lYpctalKYQuYQvqaxJ6i7U72V5hMhdJgjLaOOAeO3WfQpM5Sw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/hBXlG9g2/pUPgJ5lk0ry7RVHsbST0vqM4DKbmEsT9QDOL0Mc
	/l2hUOEllUaZOafE6I4wjxxe+F5kWvqxOAQQDQ4tHJZOn69THCq1C9qHAcKbTUd3LeIgIP30q+n
	nTZX0Ku/CfJaGRg==
X-Google-Smtp-Source: AGHT+IFY1Xk8hcEAqu7olINreEmrik4Yk5IQrPDjwNCaSq6h11n3n3dB0r47iG1PlbW7axsMkqZodWf0on/+u8o=
X-Received: from wmbfl19.prod.google.com ([2002:a05:600c:b93:b0:43b:cfc3:aabb])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f8b:b0:43b:d12a:40e1 with SMTP id 5b1f17b1804b1-43c5a611738mr17712685e9.18.1741340057664;
 Fri, 07 Mar 2025 01:34:17 -0800 (PST)
Date: Fri, 7 Mar 2025 09:34:15 +0000
In-Reply-To: <20250306185447.2039336-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250306185447.2039336-1-cristian.marussi@arm.com>
Message-ID: <Z8q9l0vDTLpbo8UR@google.com>
Subject: Re: [PATCH] firmware: arm_scmi: Balance device refcount when
 destroying devices
From: Alice Ryhl <aliceryhl@google.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="utf-8"

On Thu, Mar 06, 2025 at 06:54:47PM +0000, Cristian Marussi wrote:
> Using device_find_child() to lookup the proper SCMI device to destroy
> causes an unbalance in device refcount, since device_find_child() calls an
> implicit get_device(): this, in turns, inhibits the call of the provided
> release methods upon devices destruction.
> 
> As a consequence, one of the structures that is not freed properly upon
> destruction is the internal struct device_private dev->p populated by the
> drivers subsystem core.
> 
> KMemleak detects this situation since loading/unloding some SCMI driver
> causes related devices to be created/destroyed without calling any
> device_release method.
> 
> unreferenced object 0xffff00000f583800 (size 512):
>   comm "insmod", pid 227, jiffies 4294912190
>   hex dump (first 32 bytes):
>     00 00 00 00 ad 4e ad de ff ff ff ff 00 00 00 00  .....N..........
>     ff ff ff ff ff ff ff ff 60 36 1d 8a 00 80 ff ff  ........`6......
>   backtrace (crc 114e2eed):
>     kmemleak_alloc+0xbc/0xd8
>     __kmalloc_cache_noprof+0x2dc/0x398
>     device_add+0x954/0x12d0
>     device_register+0x28/0x40
>     __scmi_device_create.part.0+0x1bc/0x380
>     scmi_device_create+0x2d0/0x390
>     scmi_create_protocol_devices+0x74/0xf8
>     scmi_device_request_notifier+0x1f8/0x2a8
>     notifier_call_chain+0x110/0x3b0
>     blocking_notifier_call_chain+0x70/0xb0
>     scmi_driver_register+0x350/0x7f0
>     0xffff80000a3b3038
>     do_one_initcall+0x12c/0x730
>     do_init_module+0x1dc/0x640
>     load_module+0x4b20/0x5b70
>     init_module_from_file+0xec/0x158
> 
> $ ./scripts/faddr2line ./vmlinux device_add+0x954/0x12d0
> device_add+0x954/0x12d0:
> kmalloc_noprof at include/linux/slab.h:901
> (inlined by) kzalloc_noprof at include/linux/slab.h:1037
> (inlined by) device_private_init at drivers/base/core.c:3510
> (inlined by) device_add at drivers/base/core.c:3561
> 
> Balance device refcount by issuing a put_device() on devices found via
> device_find_child().
> 
> Reported-by: Alice Ryhl <aliceryhl@google.com>
> Closes: https://lore.kernel.org/linux-arm-kernel/Z8nK3uFkspy61yjP@arm.com/T/#mc1f73a0ea5e41014fa145147b7b839fc988ada8f
> CC: Sudeep Holla <sudeep.holla@arm.com>
> CC: Catalin Marinas <catalin.marinas@arm.com>
> Fixes: d4f9dddd21f3 ("firmware: arm_scmi: Add dynamic scmi devices creation")
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

I was not able to reproduce the memory leak after applying this patch.

Tested-by: Alice Ryhl <aliceryhl@google.com>
