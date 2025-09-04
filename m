Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5162C11EC
	for <arm-scmi@vger.kernel.org>; Thu,  4 Sep 2025 08:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756975765; cv=none; b=EhzuUx+07rOBc5jAn3gReQVePECMfWN5c4E2ZvH0Fnrg8xR+CEg0jWgWqRm1Tv18M1IZwReX3eQGFa69uM0jJjiRr3N9HFSKvb+JBMEVmDPdtq/cjInnf/CNgDcMLrd/MQIVDwaANmaIdhn1KXKRioah+awhwt22wKP/FWgaPGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756975765; c=relaxed/simple;
	bh=FptIsGmqRbieFIdHGIh7ZvUvDOvc+p/QvsVq7Yc63QU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ssF7SvGAFCXG25xgRVFB21vgUc0AOvQaJOLLF7djedKc8hxmjTfQO2J9Qwht4UrMSeF9XHRxo2XMZzNEpsRdE/aTJD6A094+cpLn0ELsMSg5YCnWrALJ0R/OJsxKbhcFxF62XOYuM6bUo1EwDsyDPPQ4eeAKX94t5jUscqK5fbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FNG+gAH7; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FNG+gAH7"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45b7d87b90fso6278175e9.0
        for <arm-scmi@vger.kernel.org>; Thu, 04 Sep 2025 01:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756975762; x=1757580562; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UbFxI1nbUxvYttiFTOIOkRfkrktqt/DTjxu5fMg4KBU=;
        b=FNG+gAH7YxbXJCwO2DUDx2N7MCf5Y9lSptBbbK5OXsehhp8k32Noo9fQnoWdGN5wNL
         kq0sJM0DYVWaqpLQWmlygc7hGPtJ1+oCPXa37rm1+ybZYMlwZUWUNgcyCLTz0GAUUDlF
         HE3ZUWr8cDx6JE7VoH8E5rXvhyR1lHjDJnmK0gV7qIcqImsRbw4oZWacKiSRHAu8iDGE
         Bf71udxbuI6bcyc/2qOrDcfdt2lAwUZEHyd7AXKX7a22ZJolF1MCYhw5gzCl8hTYND/T
         wkjeso8wQAerizC6Ay6q7C/3k4jksnZzqsxgPnsOjz8ltGAUJrt+cve9az/TmFM94r8P
         QuRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756975762; x=1757580562;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UbFxI1nbUxvYttiFTOIOkRfkrktqt/DTjxu5fMg4KBU=;
        b=wNl6UPKDya9OfivT7ZyWT2mFxcqpekMgnZ9Jfx7H3bFL4FeaHwBxWkurKB1721tB+2
         HmstZry62PZqv9/L0KLp8R0NdkJTMbgMxUSaGcgbitZLQzhOMtGMELmUhiounLf/b+tr
         ADnKT1FqvPDAftOGkYdKzieNPptaroSGpcewIRGDPaHsB6nzi6TmjdCOqTIWxTkw57uu
         u3olLx+qureJxE08G92uIoR1IK9+VC4Rw764Kf8bapdBB4DY2CjUd47ksbtq1ItKW5IT
         FoDOD+8g0agEi/PEM7XIvq2r29/mmQSkoxY+dcWuypH7GMS/UVY9QmHdCERQ0L7wTH2U
         S5Uw==
X-Forwarded-Encrypted: i=1; AJvYcCXhxLgpY3lq+KVMYEPoCsgfVEwEkeU13wVE7hxZSGdOjw3ui5O1mpRLPqhHkmPUq+x8XSNWzR98BQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxH6d55YBoa2E34PeR42+n3bNKn9kNh3iLMbcQ+FKvsmRfqDG/H
	B466Fj84OXLMsI7oGn3VwIWrakLOEjXgulUQHQsPKFpAD+2+G9zU21OWBioQL0m3Npc=
X-Gm-Gg: ASbGnctzwpEVXDBMnsJqby/eITlMchAmZMfmRksFHt8IL8aZTM1cQKWudklFWT7sKgN
	A6O72ImqfWUydWgfWBDhVHmGx0iFqmySN1LuyARoWAu2xXjwEAav08+sKdxukdWCqaO9vVK8ewl
	D1OAE/1c29hN34HVHyARSODE9cx/gufFd9PWCvvM2Kl5agoZMJattFf90x5/UkOtLte2a2OxgLM
	Jc3TgjwGWSoKJ77/09Nw6Qn5747FvJrCmnTsg7IAwuSQHsSjkL929ZkBTU8W55TLkAk88SeCx4+
	cx7M3NeDDP8R8Z3HjfUzZ/XTIwgla3W1vyWETZ8J80CLEWYi7BUK42lPrLhlBjsQ2nilXamICbu
	R6BfYxbzNuxYrhRHfpLHz8zyHYhHiPj0TG3SpZA==
X-Google-Smtp-Source: AGHT+IEXzX+ko/VujNgyg1NkhNKGRrpRh4vT/RECxhIyLp2Rrc+Ao5e4p7lcyFLqt6liOn/R8Fm6cA==
X-Received: by 2002:a05:600c:1f06:b0:45c:b6d3:a11d with SMTP id 5b1f17b1804b1-45cb6d3a1aamr38609495e9.1.1756975761979;
        Thu, 04 Sep 2025 01:49:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45dd0754597sm12220685e9.11.2025.09.04.01.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 01:49:21 -0700 (PDT)
Date: Thu, 4 Sep 2025 11:49:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Michal Simek <michal.simek@amd.com>, arm-scmi@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH RFC v2 0/7] pinctrl-scmi: Add GPIO support
Message-ID: <aLlSjZX_l8ifxL_h@stanley.mountain>
References: <cover.1753039612.git.dan.carpenter@linaro.org>
 <CACRpkdapzTTJhAvY1BL8GnUpCc_iHESbY9bFsNTE4Z6FjusiJw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdapzTTJhAvY1BL8GnUpCc_iHESbY9bFsNTE4Z6FjusiJw@mail.gmail.com>

On Mon, Aug 18, 2025 at 11:03:43AM +0200, Linus Walleij wrote:
> On Sun, Jul 20, 2025 at 9:38 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> 
> > This is version 2 of the RFC.  The main reason I'm sending this is because
> > there was a bug in the first version where it didn't calculate the offset
> > correctly so pins and groups weren't linked correctly.
> 
> I'm thinking of applying patches 4, 5 and 7 of this patch set to get
> some movement in the code upstream and make less work for you
> to rebase the thing, would this be OK?

I think we need to hold of on 5.  I think patch 5 is the right thing, but
I need to make sure that it doesn't break anything.  I was hoping people
who care about it would let me know.

Applying patch 1 is pretty easy as well.  We could do that too.

Sorry for the delayed response.

regards,
dan carpenter
