Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0A61F4701
	for <arm-scmi@vger.kernel.org>; Fri,  6 Jun 2025 09:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749202710; cv=none; b=QuMKboBWmqwF6Ja0r6VKu8/tApugrx7kNF+7YwMJM7JUZBZmePnu/1TxF4IQTSsZ8OU8FkSwgh3SZlQJmENvAuiEpJtEP/vVBFW3ARCZ3ojHOeW+rWCtO+qWd4UFiFJiXQX0K1ClUnisX5nPNA9dqa83KDlVFd6S5x+z7paZTkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749202710; c=relaxed/simple;
	bh=jZh8jvo3lyT78zBIAuub14qMFwnpBif3VNd4GueNpac=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=b/S/tnkPRf9Pqwjys26iTd+b/7anxXKK/ZZQcRTR5PsLg855VkgVmWBIo68Ja3J2dmZ8uXY3vfex/sXA3wUul9bXV4xQA8tcWziemqyKzT2yyHoDkDMwsEhxppPrdfBLK2Q2HesbelGeb3ox9CqEusUXK2PfQRC1euFS0I95lew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=alJUkdZE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="alJUkdZE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749202707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=26Ry3YWNg+Xx3lprVa5lk9OAapvgIQNkgZHWX4BPEr0=;
	b=alJUkdZEXXNer9Npn/vtBQg5TUtcT3EGNeFZ5DnjBMAtFeDsecnotY7fAjpU3FdaDE2sf6
	EGw0uUE+a4D47w3P8teknWgAHTkxxNfswXv3oXSjpAZcMOdrd8NfTohmU16neaNuXax/gK
	xV4/xxdRkIIBP43bLklakXaidO3EU14=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368--4Gf4CFGPEWFWmbSTavt2w-1; Fri, 06 Jun 2025 05:38:24 -0400
X-MC-Unique: -4Gf4CFGPEWFWmbSTavt2w-1
X-Mimecast-MFC-AGG-ID: -4Gf4CFGPEWFWmbSTavt2w_1749202703
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a5232c6ae8so866300f8f.3
        for <arm-scmi@vger.kernel.org>; Fri, 06 Jun 2025 02:38:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749202703; x=1749807503;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=26Ry3YWNg+Xx3lprVa5lk9OAapvgIQNkgZHWX4BPEr0=;
        b=ep4dREKeLluBdtnV+Uk7HY1HZ9Mw/KIq8F+Tp6JlI8rU0BQRUIXmyVMq/Bj/b2WTUa
         Kav2wZwdC7OaElBmJPl9aI25yEOz+Ji2U4al61fTqUsiQr7UhiUzt6PzehN3N3x3k3oN
         dZQZlEZHTphokfKhcitEwEt5qrELf3RNdqJAcot+4tXT208VHm16yQalascQvievOT7E
         fvWQ152GwynIZHBDU1FgARjmTzwmjOuHNj67e/YCNH3kdNCsS5ETjE299TIXfIH1x7i4
         N08zRIX6ysQZXfO0zHxAsOivyGG3S5vhVPkP0t6UbbuoKFD60z2G+fGt6RilVqE6hgda
         qJrw==
X-Forwarded-Encrypted: i=1; AJvYcCXjL3MTyH8zxpI8cMErCzlvjm/m+UxhuecURspwk/yj1sTEarnlu3lxISVaIw3U36i4uawzyTUhGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEKPh14s/9n8TjTkgK/+PKONELWbThBXRegnNJMwzifWzm5gMb
	ug1/cydMwjcA0+Lc5DKJ2ztgbxZ81LPfnBxT2QCBULDVEH/2QviXEWDKHcVVqvNMh61h8YyyhZa
	QfrREykMRjp6FKWb8gqJzCDxnPuQ+CPbaIw+iCbxUpa6SjaF7zwLFTQPkXs0J
X-Gm-Gg: ASbGnctRt/ofYTd2ws/gZTbRYnFjK7UdadEUTH9xxdR1lnk6nijOVRhOicY+iz/NrhH
	u5rVAiZ9wBmhDZ0RkC3GT0ZSzMMM/cw+Y1DuHtolTxBkFu2+xyB3IKOSUWJKc7ZDKjz4Xz4/1zl
	0jetkRQcl8yvOUlK3nk47+Wq3fFSgvlC1Y0EhHJXK9KbmuDxQav4ArrKJ3CFEGgXCu6mP8q3rw4
	TRDu6ehJ8AaA0Uq8g6h0Ec0HADatMAomRSxWZPmgQT8QUmMeOqVliqR9Q8wv1t/ZraKKmcuVJlW
	g8E4igmSHqLhrdG1+Uv7Fok/cPrUX3aJlEiE8uv11khUxp3DhD6LcFEPHYUp3puxGBALPQ==
X-Received: by 2002:a05:6000:240b:b0:3a4:f8fa:9c94 with SMTP id ffacd0b85a97d-3a531caa070mr2442153f8f.13.1749202703121;
        Fri, 06 Jun 2025 02:38:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2hgVVQ9Gk7GHogece0bM9/ZswNLeykZTGpNB8vcSGMUSbHrTwRCq1omPf2ID9eCFShi5YvA==
X-Received: by 2002:a05:6000:240b:b0:3a4:f8fa:9c94 with SMTP id ffacd0b85a97d-3a531caa070mr2442120f8f.13.1749202702694;
        Fri, 06 Jun 2025 02:38:22 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e056122sm15416265e9.6.2025.06.06.02.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 02:38:22 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>, Sudeep Holla
 <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, Ulf
 Hansson <ulf.hansson@linaro.org>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas
 Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] pmdomain: arm: scmi_pm_domain: remove code clutter
In-Reply-To: <20250606090802.597504-1-lukas.bulwahn@redhat.com>
References: <20250606090802.597504-1-lukas.bulwahn@redhat.com>
Date: Fri, 06 Jun 2025 11:38:19 +0200
Message-ID: <8734cddxbo.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: atoKr-dOy2iaill8DNOMB_58kgyfbR8-3K05QWBg4Kk_1749202703
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Lukas Bulwahn <lbulwahn@redhat.com> writes:

> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>
> There is no need to introduce the boolean power_on to select the constant
> value for state. Simply pass the value for state as argument. Just remove
> this code clutter.
>
> No functional change.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

