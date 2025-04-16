Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6B328373
	for <arm-scmi@vger.kernel.org>; Wed, 16 Apr 2025 19:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744831735; cv=none; b=LL93/jAiWxj0/LESns/gyt+3sf4x/2Qk7lxglOOlRGbGnE9sQJGVSvd8Tfjr9iN21fuxbnANTqMrLevz1me4ND6UmDn01NYB/79TFoTnUm/8HAag95VnKfhHsyHJT85RZbi5epnSwxRPEyPVSByu1M8WNkAOIBodvn38a10SU3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744831735; c=relaxed/simple;
	bh=e9IRh+S1USIl9YCRo3XlyrUAnR0avXRMFDfYzCvq+zk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Yt5Tw5Az7ITJHUqsQqNwhwVRF2BX/AcpiLlyMGFGxl4r3rqYdCJGUobk+REJsXl8ZWOhzGbmexwXbazUkvHaKl77EIbNXfUZQZ9MRWuqtVu/46x+8T1tTfs+tyLeb/4K6PRL75e7yXpehue21WRo4VzdnvCI7zZhpTXM7u9fHG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=BNQhF/vm; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="BNQhF/vm"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so3898287b3a.1
        for <arm-scmi@vger.kernel.org>; Wed, 16 Apr 2025 12:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744831732; x=1745436532; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tGSTtjn2gSck06hM1DrI5/VHuLEOpB+V5J184G5xSuI=;
        b=BNQhF/vmQlmR0hBdJtzgHYRHXYfwz9HotaYGVghW5faThbLxf4zP4zZgwK2sj49ZEd
         zGL/9aycuqfIyHhCik3Xwhl/JBXVuT5bFQXGesAR6rIt8q59YdjNUqpiP0OStQ12ZCqe
         HdJk2aFiAC5Rhklaq/MfvZzEMYaCUSOW8Y+1j/MRvUqtgJ6BeYOvLqP63CV76l28yPTE
         1AiEwdcB2HniKOw75YqSH8BZTB+0Nkx0ITqOOCRqkaC43MRD4QaTKo+4dPhxyJf0ufiu
         4ivdG319fQZFdnItrNEPOMwZwPmj6LcSnw7mMEY1coDGJzAdYVnkArj0tVxdYH74ZjD2
         wT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744831732; x=1745436532;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tGSTtjn2gSck06hM1DrI5/VHuLEOpB+V5J184G5xSuI=;
        b=Is92w4gPALv/LbM/hrCg5TfomTdUp0VSTfa7AceOkkWKz4TDCE/8bYhjNR0Owa3ypl
         FdN7BkiRn9vxPL2rS8weV8clcy4yUS7+PM1eFBVLpc7Kkw5cBjRcvm+/+Zgx3resNcxj
         GpqNy0JS03ch5RWgu+LNmtW8xUpQmqygDBmDdmfdhEd9oCpoPOCaojSsgtSnX1wEJztH
         DkgjH6dEwvlfuwsBF3S51vnSYc+i54GMun80M9D67+6fjolj7eK9q+CLkrRYLeEWH87L
         X1kUQjmrWK1LlMPk6O/BTDhpCZwm84nthx0Wd6BOTn+Ncsijqq3R41KsKEtkYcUZf1H/
         2nqg==
X-Forwarded-Encrypted: i=1; AJvYcCWVuUL770tXkEMacxfiyfd//xgZH3/ilaudRINRMmxBnbWS6cJ53Wa/Rh5EwA2rJwRyfaBfU8QIQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWEfziwjEOZgWZ6PISulNpKfVcRWuyjqFroAGM+YmD2f5L4tEV
	zYCS9uiNUS3EScwHgxD7YbDvE7dx3p//Llp6Uo+gte/540fEv6JS3vdH6anrlBAAmGHhOBxwXK2
	bdzA=
X-Gm-Gg: ASbGnctFaPKdBOQ23wvW7f3Jaz2j131WCMepUY5WZMyKYWS1u0sa87wVtHhWtDN+gMr
	JkvzP3G0kJYSg7pqfdsRq4jssKetOD6z+5yqnzukQPzIjnh3bv0S7u0BD8umv98Tfq/ZhUhbIN8
	Az3NjB8xx1WcdQmmbGvYVEefssz/ljVSe5PsMf/Ad9pAbHb1tJxWoU/cxltTEp5/aF5ncfb9FMj
	sv6exlsBfhv03ENyk5dUYbpIzgtTRFsly/qEoq6jPj7UImdkA7pXthXdMBJLToTWyRXHDPVN7SY
	xjow0r5JQcFvA6YTE3YUDC1ZCsVuHRGKuckkYpY=
X-Google-Smtp-Source: AGHT+IG0TdUhUGqs43hC0Wa5S6X3lQCflxnFk99mAjS0pbH/Uw2RykuCnZR5DZDaTfaij4DtMjSF6Q==
X-Received: by 2002:a05:6a21:e591:b0:1f5:75a9:526c with SMTP id adf61e73a8af0-203b3e9d999mr4639151637.13.1744831732147;
        Wed, 16 Apr 2025 12:28:52 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2198aa0sm10784627b3a.2.2025.04.16.12.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 12:28:51 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: "cristian.marussi@arm.com" <cristian.marussi@arm.com>,
 "souvik.chakravarty@arm.com" <souvik.chakravarty@arm.com>, Sudeep Holla
 <sudeep.holla@arm.com>, "arm-scmi@vger.kernel.org"
 <arm-scmi@vger.kernel.org>, Dhruva Gole <d-gole@ti.com>, Sebin Francis
 <sebin.francis@ti.com>
Subject: Re: mixing SCMI and PSCI power domain hierarchy
In-Reply-To: <7h7c3kcbg2.fsf@baylibre.com>
References: <7hecy3h7ky.fsf@baylibre.com>
 <CAPDyKFoLJ4zey6GNzCb9roAAJ5mS7B7exU1NEKtpLyyjD0aADA@mail.gmail.com>
 <7hikn5c5v8.fsf@baylibre.com>
 <CAPDyKFpuqk3jH91rkDDz_kejyJ5pFg5XH+=vdTA2aP8MJKUWrw@mail.gmail.com>
 <7h7c3kcbg2.fsf@baylibre.com>
Date: Wed, 16 Apr 2025 12:28:51 -0700
Message-ID: <7h1ptrdhxo.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Kevin Hilman <khilman@baylibre.com> writes:

> Ulf Hansson <ulf.hansson@linaro.org> writes:

[...]

>>
>> Attaching a single PM domain is managed by bus-level code via
>> dev_pm_domain_attach().
>>
>> If a device has multiple PM domains, the driver/bus for it needs to
>> manage that specifically, typically by using
>> dev_pm_domain_attach_list().
>
> OK, I see.  But in my quick experiment with this, I found that adding a
> 2nd domain to a devices power-domain property, it disappeared from the
> first domain also.  Any idea what is happening there?

Just to answer my own question, I found that genpd_dev_pm_attach() has
an explicit check for the number of PM domains a device has[1].  If it
is not 1, the device is not attached to any domain.

I had assumed that maybe the first domain would get attached and the
others are ignored, but in fact all the domains are ignored.

Kevin

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pmdomain/core.c?h=v6.14#n3035
