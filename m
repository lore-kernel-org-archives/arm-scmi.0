Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7B31D86FF
	for <arm-scmi@vger.kernel.org>; Mon,  3 Feb 2025 07:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738566346; cv=none; b=WW760QTcSGfxBaJsxWPVl/W0N/k5uoKb/dPIuEDTG16N8AlUl9njmxRvvo5HQ/aEodDhUQM6h1IipXYfZRdCjWWo9jRqSkRvDV3CNepFJXFUTjhqH2YTUBZKxdab8W9DCX2G4x8ewFBLQPxK5xwznj8sXsvyUGKQvr1DKvoYQV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738566346; c=relaxed/simple;
	bh=EIHC3IxNHU7cs62C46z1n3NfWeUA613AdA4UGtQe9kk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oR0CCWvqjoVu+aBngXXUNvco1NuvXr9OXqooVuTtxHbkJsZca2Fvc3+0+xcT5GJfaatWXLTqW/iD9VE60fIlKsVERUVXNksu+85HfMR/MuK5cheObGBnb/WkTkU3tuLFi2xc+0e7PQ5a+wVekkIi3WSM3mtl9fMEyJoNfDh2ieY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=va3VlwHt; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="va3VlwHt"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d3d0205bd5so6194145a12.3
        for <arm-scmi@vger.kernel.org>; Sun, 02 Feb 2025 23:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738566343; x=1739171143; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EIHC3IxNHU7cs62C46z1n3NfWeUA613AdA4UGtQe9kk=;
        b=va3VlwHtlqlmXrM8etS7vPGKVBhQ378Hf2R4uYHlq6KBNevWOkxb4vUoGBon8kmapj
         3S7kEue1cuR8ldMAJ1gX8cYwLXTCx4ez5xpg3GsFj0t3y2W4FTTDXq+Zsb3MQ6NLlsdf
         sbQMVTn2ujdtSK1TCYtEUOUrcG0Sdw2gorIOiZC09PEUzRNYuXtgM+GuYaGuYsAOmKoD
         ZNd8CaeCwAIcJzVJHaWG4kMVkYDHoEc83vDRDyknF77YTBbjjvF3usOzsFK2phbeFJQY
         G8zZ2zZfCmizNbMDYZqfbKrOCCOX5BXhyjBsRdnSYUs1zTgRUwGaurPRpqcVy70B16HJ
         GC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738566343; x=1739171143;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EIHC3IxNHU7cs62C46z1n3NfWeUA613AdA4UGtQe9kk=;
        b=Kylzjawc7cx7JYZMz3dPUPyFQd67u0eg6Jf2Dmru52QcctWXEOy67toYohA2jyqxRW
         dH+jTGO1fg3r5ezEPkEzrMDXcMM7LrXjbeBgnLlrzLx0TWC9s+O2qIn0e9rK7Z3hblfY
         cEQQfby+H0t9GrhudXXgEkGGigiejZPYcII3/4M9fS6bHBhzL7RqaH49zPgY5MurCYXd
         wVb8g7OBQGz4JMGZySX2v+4tQimD9uGItnLdJTD39uoeq5yspVa29szr/OJ/9OAyUu4u
         4dsK4mnpAJl2c+kEiLdpdMuJYu+eGEMznt7MJgF2KLRDU2QNIGClsSNEAFPjIcQIGeHA
         gjOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHf/gUrSDZ0yWVISFd9wuGpVfhH+mBGdkX6+7wlBgJV41AHX4qwACn6Wxxr24PGQQv+1GotvY1yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxC0yKdeuBvAh/IU4slPv9z3DoyTr24Djiv6vz1mhtxvjlDOLxZ
	xKNb15FQZ0iE+3t8qwuhndq9Rk+eepwlzJIEIHXpULlXk6dv90Ibc+KG0Nnq6AGJgXZn+hWguVa
	l7aJ9MAXzzLfTGzwCdUN+nOFlYhukmdtYeRMreQ==
X-Gm-Gg: ASbGncv5vSa/aa5m+dxIUB710YwoQERop5vbgnG5ssO5IJvpmj13w/hlY69ed3ah8fB
	BG2oW+p5z5TCoaJUGkslpRqv+D4AzJcQh8MTxHUVh5I4F8kf7MD/CVYWSEQ/RbmLd3xOyNAQjfD
	1+ex9QHvFv54s0jPUCoUFrGl7CCw==
X-Google-Smtp-Source: AGHT+IGcqOcPFr2mnCqRyCzipP3l3T8ytniqYEIuVuuMpJ5JEHNTnOzXMQhDWBGZsmq4wVfpA3hkH+4U1FLVWyeUWR4=
X-Received: by 2002:a05:6402:1e93:b0:5da:d76:7b2e with SMTP id
 4fb4d7f45d1cf-5dc5e6d858bmr23485697a12.0.1738566342844; Sun, 02 Feb 2025
 23:05:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a72847fb-afa7-412d-baaf-52da8b0e6fcc@stanley.mountain>
 <GV2PR08MB795555EB6766B147C5420371EBEA2@GV2PR08MB7955.eurprd08.prod.outlook.com>
 <5b4e131e-8060-401a-b272-9e05c694d58c@stanley.mountain>
In-Reply-To: <5b4e131e-8060-401a-b272-9e05c694d58c@stanley.mountain>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 3 Feb 2025 08:05:30 +0100
X-Gm-Features: AWEUYZmNOLPFm-S--UH23RchQxHxihT-PstCqG17mj3NDfyEzYzWBYkQNg-JOvM
Message-ID: <CAKfTPtAJe5E2RdLvhEzE0vcKhy_0uQ_8x4STfcT_teLam6PuBw@mail.gmail.com>
Subject: Re: smci: how do reboots work in scmi?
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>, 
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>, Girish Pathak <Girish.Pathak@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Feb 2025 at 07:25, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> On Sun, Feb 02, 2025 at 10:12:17PM +0000, Khaled Ali Ahmed wrote:
> > Hello Dan,
> > the following message still has not been implemented yet:
> > - PINCTRL_REQUEST.
> > - PINCTRL_RELEASE.
> > - PINCTRL_SET_PERMISSIONS.
> > - NEGOTIATE_PROTOCOL_VERSION.
> >
> > thank you so much for your attention and participation.
> >
>
> Ah right, I was thinking of PINCTRL_SETTINGS_CONFIGURE.
>
> When the system reboots, it would be nice to have a hook in SCP to just
> reset everything.

Maybe BASE_RESET_AGENT_CONFIGURATION :
" This command is used to reset platform resource settings that were
previously configured by an agent.
Platform resource settings refer to power domain, performance domain,
clock, sensors and other
settings associated with a device that the agent has access to. This
command can also be used to reset
agent-specific permission configurations to access devices and protocols."

>
> regards,
> dan carpenter
>
>
>
