Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FA93A875E
	for <arm-scmi@vger.kernel.org>; Wed,  4 Mar 2026 11:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772623541; cv=pass; b=d+CNWgJPEvgaE0h3ZJdapuvU/WoMJ7+T+C/w12SaQH4Xe95I4fFdNxcy0wMxKkRUoSd+p2XW8UaF2Z2GWMSuX5vAccl/u9y3Go6O5n2gCZGqdHBbTyNiiBdFX6SIwyFaNqCHFVjL9BcWe2xV42h2Se7tdBcADM1ghCwAvrdcMuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772623541; c=relaxed/simple;
	bh=BtRkwfk+PNdh4uDlD82Pllah5hbXu3rUufazzxcR51E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Au1r5nbe7MnT1g6kdWS1g++yNwFUdLYp5ppNubiw+M4uWSNGwBhCGegi+12GirhrN0AQZSxTHYnJBfQA5W4tIEXS8+AZdQnf9c+b//UCIi2kTiRB3hbCOTTuRoKGf8aU2R10dtXsdfuYY3CnEYZmHPyxnSghikH3ye8rYBHxa2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T5TSj4w6; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T5TSj4w6"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38a2cc31e20so10692671fa.1
        for <arm-scmi@vger.kernel.org>; Wed, 04 Mar 2026 03:25:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772623538; cv=none;
        d=google.com; s=arc-20240605;
        b=BJtuwWuGEusVN7mi3N/FyJK/wgqhR5KofutEZlMV2gBNwx2X0UWVK0kj/cEG89YFN7
         7PXHBBEBSGr6X/cU1kYIGPkXg/qUidLHTO0eSVyA9RUAG8HX1b72NDWFWdWr/aq7d9F+
         3FYL0a2LX5Lj66sKQfstYIVyBXPbW6+zZcgxbCvv8uBRvPL6hgcGIw1ER3pyCS2yAiAe
         beeoSttlbO90v/64t7TrhRfEpm8y+LP1A2IZZpEtK0ursGzcVnA4MCEz+Q7x0gN8y8gQ
         pevlPTFJgl0xsaHtKRFZ9BXSadVqQThZjQS9ymDqYNVLniXOSRg9VHRzhzmTsYzuTtsX
         5G8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BtRkwfk+PNdh4uDlD82Pllah5hbXu3rUufazzxcR51E=;
        fh=xi8+pmqQa05N9pXZp6zZetBkexvFR01MIs01OpOUmLM=;
        b=jVBbYy+PhDd942qlep/TTwg8mLDH9oXZolJlVGj0MFPBe9b07F0szk6k5VMvmfyynY
         8r9BUX4jnZ7C6c/KQSfx094JnxJocRaMF7pgKSs1wLgwUCXvUJ7Ca0CUOGe7jIecuA7w
         o+NtBf+MsyQ/pCW7TXcYQDpbHLgLBaiwJbjd8KhydwsTv2HF1D9ZhA/cKYju99kZYl82
         uKQCeaXONiP+VmlzGPowmyLxByq1wOGZkp1UB9q/Kh7pt75Yfi6Vj9GwUrnWpyk0bVjx
         EPxkValFgLiVoQimgESP7oLtGLB1TMYVppfVihXVbyoQyiVRUqb/75D1uD2No+FIVmKt
         L6wA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772623538; x=1773228338; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BtRkwfk+PNdh4uDlD82Pllah5hbXu3rUufazzxcR51E=;
        b=T5TSj4w6YCcC4FcTV6sQlVtlR/cP1rXYBQyMaBw4auw11Qxr5TsfT/b9zY0h/hxcCp
         WGzPCjDl9GNUYFje2mMmJrUfuCAORYICS+TveH0DmZWNu7ki540wkABoJ7+c41AOFuz8
         SYCslW0b23vF7nThUSsFxm7lpAmw+s00qxjGxIbwwSs5BL4kafcVq8bhyr7lXnZs7+bj
         635y9nXCQHzOGJeakmKJYh4FLYeN8/SYGT9onxMk1Q1Fi0op0oJ4mscr5QhnMsJCdzfJ
         smckrREdLSXLcbBS0cBGaMko/AvqF6t3iGrd3/CnuroLgTd5mllTqj4RB9OGxxzWksvQ
         Xksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772623538; x=1773228338;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BtRkwfk+PNdh4uDlD82Pllah5hbXu3rUufazzxcR51E=;
        b=WTVX6uSuhOJqJmMouPL0vdgTfp9NVykDMg882FhlzKnsG0f+6l3CnqxFcO1VYbVVb9
         0J8GSXMSA5L58OUW2gWr+GCiG9Kh6dlr5EpUS1XjBslwh24P8cYMwP8xq0oK0YxlCeM7
         ESlNmiQJP2sMa+SRM0XUz+NDX+pSvn5Y/OHfhOwl9EymaLoV+E8w1vKNSTdGHQM4x09t
         5584/IGoZpLC/HX6BG2NKO4vGtScdsjpulpmoo/rHVDqq/NAQd4EZoiD/6fJ7GewDOad
         0XOB6U86WxOQjsUEYtKVZqXU7GA6OSaE2j56bfQt2t9o15hH5qXbVYRFJaSnp7QkAosG
         PyGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVBvUao8nbdHh0rY6ebjrCpsOhELRZ85AON4nbmjbpLMsXYUXcl0inD/7DMchtEORkDqjdoG9wig==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvRfE01KvcMuo/eLxyzv+wBi0TeD9hw8uehmY3AzrT7gak4ccl
	WoTMrwwEwVv/UIx6pd3T8KUkg//pxwq0KMt5vvhmmC1Q95TB0Ol8SsulhR5hCxzQRuVDQDVUnI3
	oA9H3NfxkDQENMumg9wKbhqbxaABk1iHm9xj07UDGRA==
X-Gm-Gg: ATEYQzx4qcO5stByRnqe9jrn7q7u18uPYn2MSaegqqUtT7BCd5SWop9lczUNl0JD+wA
	o4qzdhTqCv/OWeXf5UYDpOWCSVCebMMntPzcUCy7CTsEqoCQMDQClrSLY4mYifCx62XnjOo3bi2
	NVu14CEEGFCnIIRKgenerqCXEQk6fMgJqWbNZuROk9M2TO0tPBoti/e1yYdInWk8fqC7cvoM1DU
	XyjH/xHvq9DMj2eSiYLdboyd2BY7nzBgebRfDD9PljlKArjcFU1ktNB5gHyKCAqXoc0dhhT59Rx
	y/cKYzz4
X-Received: by 2002:a2e:bc85:0:b0:38a:291c:dbcc with SMTP id
 38308e7fff4ca-38a2c5b1e30mr14538301fa.19.1772623538449; Wed, 04 Mar 2026
 03:25:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304101457.7470-1-ulf.hansson@linaro.org> <aagINsZj6sgR7pNY@pluto>
In-Reply-To: <aagINsZj6sgR7pNY@pluto>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 4 Mar 2026 12:25:02 +0100
X-Gm-Features: AaiRm50EmpkkbwvQCpRktsjqw5A47RE-7PTWTUJApXKOBbCTS7pFpVE9W3izezc
Message-ID: <CAPDyKFqQQF1BJODNNuRLAathyM4oRFfXJfcx83Db2usRbxQPgw@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: arm: Add print after a successful probe for
 SCMI power domains
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, linux-pm@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Mar 2026 at 11:24, Cristian Marussi <cristian.marussi@arm.com> wrote:
>
> On Wed, Mar 04, 2026 at 11:14:57AM +0100, Ulf Hansson wrote:
> > It can be discussed how useful a print is after a successful probe. In the
> > SCMI power domain case it's seems valuable, as it let us inform about the
> > number of initialized power domains too, which is fetched from firmware.
>
> Hi,
>
> yes indeed we tend to print such 'summary' info at the end of a
> successful probe in other SCMI drivers.
>
> LGTM.
> Review-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks! I have queued this up for v7.1.

Kind regards
Uffe
