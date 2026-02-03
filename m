Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1ADD314D23
	for <arm-scmi@vger.kernel.org>; Tue,  3 Feb 2026 16:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770137707; cv=pass; b=EC1jfkQFQkqK7xClhhbZaX/0VhHNrN0W7jeIh/5YTkCd3m/vhrqi/rgVVY/dBzs7OVFWkwqFt94Xq0j9fytQLOhIzJfhfhI/ABYPKNTSLQrBZWWB7cd432Cy8TfoOJqdpOrse3+727W27Jx6eoIagWSjD+MiAuZx8ryQK4QR6+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770137707; c=relaxed/simple;
	bh=xkYhzZfre4pq0qEgWyM1EYuhZsO7qo77XZSJ27Ejf1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NZEK3cONxnv33v7w2xbG9cOwm0aJzu8lR6ehrMBxGu8AkvyHVrd9+KWeXfpft09g7UBqf54lS3bhaO2K7UGkcVtfjP/L0EySzQk9pvTm/g212ZNaFuscEX+WU/LAbO/sNUKX+1qBBuquW17ZRAG7KMoBqxe1ufznScJARs6b/rg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FyRdjX/r; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FyRdjX/r"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6581af9c94aso10749537a12.1
        for <arm-scmi@vger.kernel.org>; Tue, 03 Feb 2026 08:55:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770137704; cv=none;
        d=google.com; s=arc-20240605;
        b=OA+Eh2itNNCrC4Ea1YV70Cgb2O2DT13TYsa+SZNlf4eYo0tAqInpMlm6Bx5t9hpLE4
         3AY4zCbVqzXHsguAR11/ZetMymloq0ccNPOFTOCK0gaIE0WqVI1zfWlmFIP/AYJf1wOn
         df7vKkJtwia4Ub+pJVEg/tmE5pfx5tYyumAVfPkK7fD2j/JLW6vyxV9C122MP4S0O4Ae
         WOePJCw53lzVe2izvVXsLGD/ZrzyNXbu5+XX6nq6DExTcurNnOpdwEMMxWgkRZ+/u2rt
         etQ/LPg4p1F/sIacp6SeSnMHRVzjyRBbB8WUciFfZCQlRB+VNS7QSVLW9pK8/fva7tB7
         r9NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Oh7c5ZrGbVkNtlDGgPCsWmK0BvZ9p6QtCVprM62UDvk=;
        fh=gplOfWx0QFd5H70ZkC2kf0O3udqk+jwkNbGQNS7Qc98=;
        b=aEw4QJChfxXFQt1Z9NVl7RUBjLr3fOmIDIusbT5dNxgumUAHwkrp5EDpPtYuSAMhCg
         cz7yTvrTeav8D3brfJBzsC9FcM77wa4DkRMcJo6joqX+RuCSmuwjTIZqpgZ7m+JnzAh2
         kkHnxvetBiF/3TGjrSIwVyjM3+ULS19gig4XGPuMy6u3QETqIPrxqejIEZsXLqs+EeSz
         gDHxiySyL3228kGbVOZOnmi9MAuGrrUBiCpbXitgKz1xxyoU7VYB0nQkDdSKaLedBzmk
         9E23dyLbwgIwqaYvNpvSluT3254tGPQO/3KDw0lXMyiCdXkIah6pRTui4Dpnu1ZCVdjB
         ZA9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770137704; x=1770742504; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oh7c5ZrGbVkNtlDGgPCsWmK0BvZ9p6QtCVprM62UDvk=;
        b=FyRdjX/rR9iWV4oJljO74JD831NBgMuulDI13mXHnYGObq4rcwkDcILKJI5DXjGvYi
         uBDpZqgYPGtDEsE1uBoe7+i01e7a0qmJDmS+qeriV85tpCrmzkOMexwbXpRE76+EFyal
         HWhb70gTsyZrBAf6Gl+w7TtLJNgPYs4FuFS/VaJPde35hgSLby+jggsMvjuYTqyvnOaw
         YU1YLYcTaFbAhiLz+yKxNsseiqo6ig9MDDr7uPsKVzd/CbdTcY4GHEPjvk4vF+wusf5Y
         sO/xNFa93w7vzaD107QS87sPafvwbba6aBo9/ydDut5N4CVcZnMYlojVEdRaTVIjvkP2
         6J7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770137704; x=1770742504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oh7c5ZrGbVkNtlDGgPCsWmK0BvZ9p6QtCVprM62UDvk=;
        b=ntz+D6X9Chsi0z9U4ih7NnBXggwhpULyDDcvHNK+QbAAXkD8oqZVT8DMEGJwjPCjJU
         2tR2DuA90j2V7BfJzd22QR9NknWoxcYFkntwZwTQmwanqxXSL4tdxvyefQtkwsUQ6fp/
         yvN7lyj7auvbP7sld9X4VcV8GrI9m8GjGXG7dRB1Gt/Qf8lUZgd4pPamIEhOrKYjxGq0
         OwMQ+vRCiKV1UVUuLh5+4VWiXZjB/zZWiTPj07tum687mesp20Atu6xTKltgnNwEiE5f
         brzzHbDGQwUaYvzemLHH5M/OApFk0gAYB6j7mgfIvdSA2kgkNQ0ftYWgT1w6b8r9OqkO
         Ve9A==
X-Forwarded-Encrypted: i=1; AJvYcCVPuTmluchAunqcYngL1uzY1fL0s7lBbu/wJK1h4RVaHrfRQc/TwLYCdKXNlG9/ed/gzGHdIZEJSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPDu4tf6jEykLSex/BJbF3p8ch6HCqHbLZkZptVI2YPdyOm9S7
	kbMmTKOzW4pXfRAYQ3dsOJfNmkN9gpeu5kQxFgNcSNsGBR1FFJmMpFYUAnopviORNrRF8OA5Es/
	Ku2jtg9r90dgbXX1959NX/gm/Zzh3aRg=
X-Gm-Gg: AZuq6aJ3vLwSYISDjbYp83KvAUn+4T2Z6Z8r0Jk32+Ron8j40zW3X98ofS3CLGzM4c+
	C6W1b12Wj6+TpluqCAUF4xrB59s/U0E91ENr7naKvObkea7PFni1N72/QnR+rrlLUOiRoeLuJHM
	Ljz/71/BC3BE8L9Mxy6RXoh/nr6o4mv4ABeiYIt8G3yRNlo0MuERzHYUO2NytzMZcrUFtv44rdC
	BlSzdOT0nM5+G063VuA7Q6+YRDxB6a2P4OFfufYZAMvq7uUaj7wBvbY3IF4NatnrMWskQ7MqQ==
X-Received: by 2002:a17:906:eecd:b0:b87:173f:61b with SMTP id
 a640c23a62f3a-b8e9ef2c012mr11849066b.9.1770137703947; Tue, 03 Feb 2026
 08:55:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021165212.749372-1-a.shimko.dev@gmail.com>
 <20251022-rugged-archetypal-wallaby-ecbecf@sudeepholla> <CAOPX744bwwZHEODktumJbE1MUyfDgYj3vrexT7GRBZ6BTrECXw@mail.gmail.com>
 <20260203-gregarious-intelligent-crayfish-6bceec@sudeepholla>
In-Reply-To: <20260203-gregarious-intelligent-crayfish-6bceec@sudeepholla>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Tue, 3 Feb 2026 19:54:52 +0300
X-Gm-Features: AZwV_QjfekTZzde54amai5WOPKsOZWNirj4agaTKqrszEPOHIlfhExZ8j_ZjLlc
Message-ID: <CAOPX745MVJ50bPPeOjKvyO9N=NZKtpUZNcEN4_bFQ4sCAnvUUA@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: Add new sensor unit types
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 3, 2026 at 5:25=E2=80=AFPM Sudeep Holla <sudeep.holla@kernel.or=
g> wrote:
>  Let me know if there are any users before that.
Hi Sudeep,

There are no users before that.

Thank you!

Regards,
Artem
