Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFF23E51E0
	for <arm-scmi@vger.kernel.org>; Tue, 17 Mar 2026 14:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773757667; cv=pass; b=OFifiFZuGslJJ9lk68v6m9/fXfwJ/dUyANm59JYc2CIqDRkE8evx0re6Y6sLVdnHlw8s8wWMLv0xh5+Id3Spx2GPnijIMrLeiq/1GG49Q2uBPlRWWnknPTp/HyPZUEgz7KdboQFOgeyxadKacyxBxTfPZdulJ4+0yKWC0qnyP/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773757667; c=relaxed/simple;
	bh=sZdhQBRrjnNfHh5syYuivaWeXKZt7RqvsGh/omDvP8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K/tF9X4dbbMzE9GnypCdIzRLQN/p8ji7az0/ho6ClYRS3zKeEP7A4+CeLezW3rMbSoUIWCCivoeVmbjBieROpwxaed96ebMEeImDd9fuspDSOSWix8TsRtM6ECe355aBoN9GCeP6SygO9B5+Kk9gmC6YLQLv2PgdTu3BJRe7lic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HBmsa1Fm; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HBmsa1Fm"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9358bc9c50so724683866b.1
        for <arm-scmi@vger.kernel.org>; Tue, 17 Mar 2026 07:27:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773757664; cv=none;
        d=google.com; s=arc-20240605;
        b=grGF9IkDeDFfOcNT4Iq2qCIr0piHYs5efh4RVfuZlm4tym3ulbV2OGI0Wihoww5LRL
         QPrHpzFWViMqFkty7bK7aQFEG9FAaDjnZS9ThBbNEc8L93OeBVdzVL7yJBDLvB+Hvs7j
         bmq5Nl8IeK700dxFfSNNsabH9htIDxP5amkVJoopCmk9wOMg8si9uxMMnG47fABbT0JI
         lRH5oWxOQDWJRskc9x32+ujh1eLbjIY18GF+uhc3TIfMWmhp0ga8MM8OguJc3xLrdLrM
         hnVY08h0mHvKFI3/zPxN6oSGLupo/zTq5u6L0L/6NwnSeHM5LuduzjYVBEnCddt86oQg
         resA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sZdhQBRrjnNfHh5syYuivaWeXKZt7RqvsGh/omDvP8k=;
        fh=unKYOBE3lfqADX6w/kIs0GYt9iYWEbg5RSPRBwYB4d4=;
        b=ZKPI2ZbSLmTZq1p+DPRnxPLEWYM9WuoyO+s4U618AmDn+ouvu30zlUpY9VD7Pn+hg7
         uI8Ekzrv5MpKYD80Cf/Aq/+iN0sNDED1loMMw0HpuyfI43WJXxOt1lCYs3FbOMpL81+c
         O7b/PVLdGaGcuOpHik7ayEqPEJl8TYrI914FrgsRpdbXIyUofLpoCNt7AKyTJvNGKJiX
         WP5t76mUww1FNQ7lhUfUcgV0foKySQLvhGFAM0sqhjMnPFssXtuL+MSmkq2vfP4g3qgJ
         YXeUtHObVEMl8SgipbJVBQKxFynXp953/Y85bIl/e6GX5AJ4AVoF+YHsrvtUqsrWJ0hf
         ni2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773757664; x=1774362464; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZdhQBRrjnNfHh5syYuivaWeXKZt7RqvsGh/omDvP8k=;
        b=HBmsa1Fm8UssACBDSm9+e+o03CdbqRT25QnMS35KnY+N5hOmyZM5OJR/NFAAI6C+0C
         0RfsL1BSuCFFNXJA1LrfRZyKU6T5bFJpzB+zwNkXXwgjnZBPgPAyRK+JE/GIQfHSgKG/
         cMTKtEbkXXS9E7j0GXuipIjtyvLwtfuGhswwmueuRBV6XdrAtqwdrQ1qp7zodfKDHdng
         sDl9PwxrtBYrXuQDuN+xZHH4WyQweTCwiBNAqX1yH2RqASp5rTISVkWmUla2YO1MC7aK
         Nud1hlgWKxbOkLd8a4sD2RoLKeEuTkF3Fu3zo7uo8KJQ8FNL1cDW51FjA4D4/IsubmFK
         sKAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773757664; x=1774362464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sZdhQBRrjnNfHh5syYuivaWeXKZt7RqvsGh/omDvP8k=;
        b=b+MBXsjLzgcktkmI/kvyGrMk87knVpFq9pu3EMtAL0AWetUT2pUNMz19F5R5bVXD7K
         kIeCncF6wkPFetWnpkdqyNvGyX6OEwKJW2nZc/adcbcKez1YR22jshsYpMp1t6MZBw2T
         MIzjQmLI5wezYKM6rEyVWibsnME4TM60omrIjDudsNH6MZMzWa2prQsiWXWfixQizqmw
         /WT5dwmP8tYU3kxHfORpStmxthRY4STi2Sdm3ouamU7fA5891WrIHVj6V0qvhgkZ0bGp
         cCktiwb0p5Qb9qNgtYhuLkPF+xMOCeUbr0Gf2Zi/q5D/DMtH2wKK8Ox0oZJAwgqsFeTI
         ht6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFUeC0y9AtGokhXp1PG3aOeAzN/filWMiHutcq1s2ykNDeKGry4WNkHyL1Zx2O+qWEeDA0ariOeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXI2lLijMYxc1IJW9VZ7lEq9QfU2EQ/M3aZDrwH9Su9/chK2sg
	WsuteydAb+Iane5D+2zGlZHmS3MLREVu5QLtVEJrV8102hCNEHhAfxnN1LytVR3CScxqxfhChJ7
	OZMIglCN8r4wyJSOhnmxa1z1/spRqqqk=
X-Gm-Gg: ATEYQzxjGvav++l9QtEgqSlLpD3YuMB/BzCiOvb9461TFQ2FcKF3EYw3xxJpseqIW4R
	EIs1/eN/whwU6nNfPTfvx6664Rs8IQRdgy7Ty1lSGTlNKKXmePyjGQmISfHuUfZG3d2r1/ZDh08
	8WgHjbjW+lH2fey7yLpokP6BGAgT2Xvu/nWm8l9lsdlsV8D2yMxu2SfN2Q0LsAhmTBT2nLpL7RI
	3+HKSSxBZa7woAHL8xC9M5ugZPcYIWGRnYY0KIgpIoKATLFO23tr9EINCeGzmP6KI7bascf7275
	WhwOcvPIqA==
X-Received: by 2002:a17:907:94d4:b0:b88:6164:6421 with SMTP id
 a640c23a62f3a-b97650d9279mr1182813266b.16.1773757664000; Tue, 17 Mar 2026
 07:27:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122161728.1225583-1-a.shimko.dev@gmail.com>
 <CAOPX745OsSOuZirpvW5nXDEbjpZXbmXtgQ6zB=dMX2tP+jhgaw@mail.gmail.com> <20260317-innocent-prawn-of-acumen-68c2ca@sudeepholla>
In-Reply-To: <20260317-innocent-prawn-of-acumen-68c2ca@sudeepholla>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Tue, 17 Mar 2026 17:27:33 +0300
X-Gm-Features: AaiRm515q4nQzSDknmOaXFlze_3MBk3DCZcAsjaCwTqJDRtX0MROUuDo1ELQt6c
Message-ID: <CAOPX745v3qF6r6m0fXiysJ4WDr5L0EsFHKdKChZqRbGSvzMa3g@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: extract domain ID validation helpers
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sudeep,

On Tue, Mar 17, 2026 at 4:37=E2=80=AFPM Sudeep Holla <sudeep.holla@kernel.o=
rg> wrote:

> I applied and then realised it is not necessary to churn so much to just
> unify the domain ID validation. So I dropped it.

Got it.

Thank you.
--
Regards,
Artem
