Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51DB3090D9
	for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 21:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773266156; cv=none; b=lYw18uz5ER7TSZ0BdTXP9v9e5xexKM7b6Nf9XwBJcudpsOTa3RAZxzofpH1JzQZJDE71BFYPXhWLEWqnLRWpdmVn2IKGpi4XT2lRaqfqKaCr5yt7m1EzV+4ekLRD9A3J0yZ5s/M2aWk8npSO1/oojoTGmzhzXUFfFxG9pTZJHoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773266156; c=relaxed/simple;
	bh=MYtvZO/BbGRyaUtiW1CaWPpzpku2kkMqM5HlcgVgoSI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZkZmU8xzFqbZDD6A1HGMUamgCPTjyQ64Ide8m5nazycEBNAdvIPGMKkarYh4Eek4oyCyKQti5SuJVsxLHq08QJw9B4ubhDROE9UVEDqoQCbDqUF1PTUHB8WLLIzYA8Y6606B19i2R3o4bPN6fsWt/7i8bkHiBp1Z0Qi08vdJYZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=smYkHPYU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="smYkHPYU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84B80C2BCAF
	for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 21:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773266156;
	bh=MYtvZO/BbGRyaUtiW1CaWPpzpku2kkMqM5HlcgVgoSI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=smYkHPYUlFwTM5QRETvAHmwsCpK3apejoNl7mKwM0p4/MMt4yeU/4yodIMc6VTu7/
	 0adoupBbz6pWT6lQ5/tRQ4AzV8vWljqiBu3Mw+BGNjXY/WcetVmqmNI4r1B1//a3mN
	 /i8zM7s90CgWHe3l+RmwFv/YkYQwxRHDaaFJqaik78TFfl1l+0/PI7z+nROjlg06wE
	 1SXYvNIhOTfrf7qyI/+a8WkYXbyZgpIyQmOJFxlkHutfv0IoUul6hYkCyur+LcNJ+0
	 aTTM1B8iDQwF1V0p4/NJMcDfkWalcfIfgsiNTfx02z7IoYJpzp+ohkzf8GelVY/cZn
	 0hRVRPoGAO1NQ==
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64ad46a44easo454133d50.0
        for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 14:55:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVFbywPF52t8rqcgBY+bhXcOc2p7l9pUoylZcEUW+IP4sVI6YT1BGpFC6cx6RWraCbj5dIUEK3uSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuWuU369F8FfIurNndpIfxXKE9QcMZvxDLgBSlcK/YKrJUwYPx
	hijOX7JbTYc8jLX4SPnyHRQTyJOF1J5RNCRPcwQvE+k79gX7GseXDo66DKCq5sbpAnPYZ/RT/np
	ialjj3qhmkJvXGHtGRhX2aRC3rx1Ide4=
X-Received: by 2002:a53:ac94:0:b0:64c:b7c9:dffd with SMTP id
 956f58d0204a3-64d657857e8mr3936645d50.58.1773266155816; Wed, 11 Mar 2026
 14:55:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1773150895.git.dan.carpenter@linaro.org> <93920f541564bc4e6aaf0f2b6df2f5aca721d452.1773150895.git.dan.carpenter@linaro.org>
In-Reply-To: <93920f541564bc4e6aaf0f2b6df2f5aca721d452.1773150895.git.dan.carpenter@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 11 Mar 2026 22:55:44 +0100
X-Gmail-Original-Message-ID: <CAD++jLnxGiObvKanE37GqNutfb-tuND6yejoBX1vU07OfXGMZg@mail.gmail.com>
X-Gm-Features: AaiRm52MUn3UfXYMxhfr4nz1DHo7Fg3cEkhE01vyGrUyMO2BVykJE1yhFqO9Bq4
Message-ID: <CAD++jLnxGiObvKanE37GqNutfb-tuND6yejoBX1vU07OfXGMZg@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] gpio: add pinctrl based generic gpio driver
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: AKASHI Takahiro <akashi.tkhro@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, arm-scmi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 8:39=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> From: AKASHI Takahiro <takahiro.akashi@linaro.org>
>
> The ARM SCMI pinctrl protocol allows GPIO access.  Instead of creating
> a new SCMI gpio driver, this driver is a generic GPIO driver that uses
> standard pinctrl interfaces.
>
> Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

To me this is as pure as a GPIO-on-pinctrl can get.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
