Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DEE25179A
	for <arm-scmi@vger.kernel.org>; Wed, 29 Oct 2025 14:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761747489; cv=none; b=OyAbDPUtD/p6yokrTkyeW8c5OyWZ3NVcI+Rt4Mkw88IO6ykavMzJtFwyLh4H0fyYm9xHC+OMbWSTYRo+vOCWMC+P5Sg6WemB58TK1AjLh27ugpMiOHRvvKlFW5PCu8Cly2p3SCm8mfj2xPzWOV9HPjPirjgqEIM+IWRThnll7FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761747489; c=relaxed/simple;
	bh=frTWN0cj1Au3rEU4gpiwgwDW+TjseVAAzDE0208pNEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D2hkwZwMmntRYnu61o5je0pNriJJ/gOrj2hh+5RuAoFLlpnK55npUdc/bmso4xylf4yprsz9TJ9h9bLVWmdvedNpqDCGPBhs6EKlk1tunYqmHBG5/zkTPTjfeBCNadG574i6iVN/cHI/e/U6Bw5MVWL4p26Wu+0ULGIq89qrcwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fNNBHgiM; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fNNBHgiM"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59052926cf9so3443692e87.1
        for <arm-scmi@vger.kernel.org>; Wed, 29 Oct 2025 07:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761747486; x=1762352286; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frTWN0cj1Au3rEU4gpiwgwDW+TjseVAAzDE0208pNEM=;
        b=fNNBHgiMNI0TIlvEx6R6wRfbghAfSTazTR3aa08KdX5HGuHK8iWNWJCjUpzUuBXaR6
         yeQjhRM8DHkD+vh4DMZLHWCxMsWrj1twIaM0jL8JmhfpU2WvBpXYXSRWZJrYwgzpoVc2
         7m/Cz0PSY8P/KI/yhSXivQIdTCdLOAzX/vjVKuHaI/nGZ7+riZq6LKuDnwrtH6IK+GAo
         mubYsufFVqczHa5FdZk57qwU+oyQGqsm5pwnNgCxATNyWpro6XFhX8FTfLg5zWlJ0mHU
         ZXRdy0DRfuSxFtLmvXxe8A6Ym4EYdIyPG6mtzFvABxDKnrEu1KGIVju3KeVhi5/TcaIs
         nWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761747486; x=1762352286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frTWN0cj1Au3rEU4gpiwgwDW+TjseVAAzDE0208pNEM=;
        b=Ub2xAJR9x8Go2WPRw0lbI6nCqqBlFHLQ68z0lqwNgYPsmIyt62lcaiYCNXFNTrE9JV
         hXk9iubwUqYwg2KnCRiGl2upWABewAnkUZS1KZ+Oh3S6zRcwNkFOBhFgzuIMVSrpmUhw
         VwKCZh2QZmuFuGVXXr/nkQuMzFla4nru5shYCtit1GQf1XUN3ODPQXxGFu8DUnWobvsR
         dT+VLEUnIlIPMBOyNqUZrfR2f4l7rZr7R77NHJHI4bpAoPo3A2hSSJEYO00ykdotFrYO
         fk6/G8RdVjGws7/P+gL2yGagAFKGvKDfiFcTGa75R26Cfj1t8CJzCOlcEsUwBNtiilvx
         k4Yw==
X-Forwarded-Encrypted: i=1; AJvYcCUwbKtnpwbONslswiTmKaUrxq2KPdExayZ0C8XxNiOfLPUcTiTa8RZJS4KoplSClnqlIOE6MPmp9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcTIYzFhfnka89W3hKHoh8VeTxGtndz26fNRGR/0m2tSsLWyjY
	uUdiUW7gc6XH4b5PAJDd2gI7A7SPypEnkvP7CvpAChItb+i5MWO52BtvasLL/pVrWe0vRgDsADL
	8q/Myr6WesT2+Y87QlTkrfoxzxTL3xDeZ4EWvgS4mOg==
X-Gm-Gg: ASbGncs/ZHpEd5AFC1Kkdl50d2g7BpDlOLyIMeKRyg+WzZv6W2hNisXiNPnfz5iw+1i
	4Ch8irEg0vtgMR/MZftdqITaQlDKxBvyd4ENPFLIjZUOBj0tkmKzpgQXl3NhxeAIYNu8nZD+HGo
	xukRAwo6lgOeUdB3NYyiXnHYH5W1RVkrmNoXmdUdmRFZGpyNgbiyOyDEtvi5/8BO+KKjmh/VC/k
	QGKop31tr0YmPbARkty78Jg6GDuPztMeIgH8BzeVh9c1QO4WPTj5igKyEyrz+JyEspWjQkUIoqN
	67v1Jw==
X-Google-Smtp-Source: AGHT+IEZ48qPNDXi/VZK0viwyJMlNZCVVeDAAKNtz0dWhXoCt8yrbWYQfSCBbIwkB65d0mwMlwxIaale+Ln0IHl2XVM=
X-Received: by 2002:a05:6512:1253:b0:55f:4efe:42df with SMTP id
 2adb3069b0e04-59412c47659mr1221054e87.40.1761747485600; Wed, 29 Oct 2025
 07:18:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761576798.git.dan.carpenter@linaro.org> <82a8a4b206ec02dd27a119d7f05d2bd6c8d2d3fe.1761576798.git.dan.carpenter@linaro.org>
In-Reply-To: <82a8a4b206ec02dd27a119d7f05d2bd6c8d2d3fe.1761576798.git.dan.carpenter@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Oct 2025 15:17:53 +0100
X-Gm-Features: AWmQ_bkpWoC7MJl6ilguYr2pkMyaF1lhvihQmCr9qcCK8P7laPbsgsH7ZdH72KA
Message-ID: <CACRpkdZMQh2ozd_YTjRgUvVwdAwHpDz9G+ZYYHBQ456GLjPZZg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl-scmi: remove unused struct members
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 4:18=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> The ->pins and ->nr_pins members are not used so delete them.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Patch applied!

Yours,
Linus Walleij
