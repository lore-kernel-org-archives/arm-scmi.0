Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A57830BF7D
	for <arm-scmi@vger.kernel.org>; Mon, 18 Aug 2025 09:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755507840; cv=none; b=AmiVKJw7Tj9geF5Z90mziWeNNJDF/1MVxRrj3X4au4dqfrNeuIDyE4QoT4guUPthG1Z7QGGs92cP2iihiBVkht3XEb0HPHhf8TrNgfI2LwWMxLUJ475ZDrjQkjAUVFovx/ooDPb54yErHj64TwzEVumUJFmyiDbgAokP49M4V6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755507840; c=relaxed/simple;
	bh=m7oOCkrHmV3m6RPZPr4H1kZpkhVJDtpouU7lgw2AWTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BRjxqSLRMlHFYmKw7DsNWuqaDKUPNU735SyZtSwEkZSvhsrrj963tNriqHzJbRtdKt5REb+9WFaurK06GnCUzpm5FIZ6R5kGDaWWbBHfsOYKox/bvfRSZK3VHFsAyFao+6fusV09E62I3SzaATbKj6t2lKFsOi8+JmoZcE+cHLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pElY1WMd; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pElY1WMd"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-333f9145edaso28758121fa.2
        for <arm-scmi@vger.kernel.org>; Mon, 18 Aug 2025 02:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755507836; x=1756112636; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUwutcLP2TU0uZmoKGbkLCKDIFQshb+hzWxBL6xH0Wo=;
        b=pElY1WMdiB++dh7NcmzagwkoI7mcFzY1I5dMWBqyA74scurUnPnVCBpWlge9xN7r2Y
         GbCmLLf59Qbq9KYtbJfDwfURG2UQtdmlnKRNDPiLyQm2aB4lwdkga2Y7ZxWfgWZbkq0D
         jYrmFaHxLjC0U+4S8za1xhieRKgwsMsUhucn5UO8YTLH0eNGt1JokHvnwirDp4FQ1+BA
         PVUywFNWm1iL538hLXH1fH7CceBAWlZLYTOAKCQ/0NtjSFzZ7qOGIqS/2UDgHXzDspqU
         itPJPX47k8tgj061buRoHYP8QejjKWsTUsix4cqmen9M7CiC7NOfm6hjzE7r2teVT7eo
         YAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755507836; x=1756112636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MUwutcLP2TU0uZmoKGbkLCKDIFQshb+hzWxBL6xH0Wo=;
        b=bfVgBkVHvOvrWcafut9saZ1PV1ZccOu53bThNp4j/vcM1LTGJwaRQjNUPcQmCSMLAV
         6iykAuT8ZkTKNTZIhY0viNRl+2LVcHG2DUVS1Yi/naey909mmnJ2wmNqv2ApKxxvP1wr
         TQuZ/SX0NFHobS6yRXTlET/+NfaYTmauKtAdnAkS1ivaVBTDZ12Y0+SyilmBKh+jahCv
         jZ6FMb6M6CvG77EnjptzwaZu6oBOxc3vzi81Chd45kF1jmmN2QGWC+dmVF2PhBZjax0o
         Y5UCPHxz7Z1etqH7nUXqKPsFuYzWUt6H0AI2pj+MSid3d1an2CgH1MW3ScmLDu/QYtAe
         HJ4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWo6lCH/u/2LJhYsRgp20kTr44sATRjDnoF0LmMh6n50LVebULrDL1B+u7oBBWCg/iufpBRU8RmGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpxUhB2T0Z/SbXr5GQmEKa0g4vWYRY1+RmCm72z/YbkZMRNJOs
	MkY7wHC8qCROsKd6UCTBwZgBQ57vXUEjlowKuQK0zOz7CQVxecMhZG7NmiKlzUYWVm92hvIuoAg
	5FE5Hzvb/OJfNhjfzDScmo+3OArsv8JytuAI2RLdcVw==
X-Gm-Gg: ASbGncsd0Sohj3mnU7XnQAt2NYEejglMgx+f7RPJM64GpL7viZQNkk13A047EnG5ar0
	hVMZMy0MO5NzEs6k8Oh7hQ8sT79kxNAjfHenFpC38ABWFzGUKw/i8yPqtbqogbQWwm+S5N79orq
	ISltorOi0vX6K9SFgoQ4+q46Hp3F3gP/A05KYFJQOqz/8nlXG7xmEMBulH05U7iSs7BDCkfDBFW
	re8aVPrEzJ8kQIAfg==
X-Google-Smtp-Source: AGHT+IE9kamzF6h6Mj0Uthfqb51rMDCl6ApaA6r9yCxNefG5kg1EpxapoTSKZbjphVliY5NG5jt71S1DTJFc+QzXeWM=
X-Received: by 2002:a2e:be21:0:b0:333:bf9e:d75a with SMTP id
 38308e7fff4ca-33409809840mr30484411fa.6.1755507835692; Mon, 18 Aug 2025
 02:03:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1753039612.git.dan.carpenter@linaro.org>
In-Reply-To: <cover.1753039612.git.dan.carpenter@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Aug 2025 11:03:43 +0200
X-Gm-Features: Ac12FXwmdSMJ2XrjVzm-k9jfEa6zy3nIx6AoVfYXMCJMow6Cz5Q3z1FJ4deDBS0
Message-ID: <CACRpkdapzTTJhAvY1BL8GnUpCc_iHESbY9bFsNTE4Z6FjusiJw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/7] pinctrl-scmi: Add GPIO support
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: AKASHI Takahiro <takahiro.akashi@linaro.org>, Michal Simek <michal.simek@amd.com>, 
	arm-scmi@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Cristian Marussi <cristian.marussi@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sudeep Holla <sudeep.holla@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 20, 2025 at 9:38=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> This is version 2 of the RFC.  The main reason I'm sending this is becaus=
e
> there was a bug in the first version where it didn't calculate the offset
> correctly so pins and groups weren't linked correctly.

I'm thinking of applying patches 4, 5 and 7 of this patch set to get
some movement in the code upstream and make less work for you
to rebase the thing, would this be OK?

Yours,
Linus Walleij
