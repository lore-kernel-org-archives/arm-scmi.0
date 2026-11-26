Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795655133;
	b=Ni3jLAo4kvjrIaoiqQ5z+LsQ9P1hvXgs2YyfcwyceRq78K76I/GCHfCtCk6ZKbR9sIgl
	 05Wb0AKq04154xQM36AVSJK4uCqD/t76k4WFI7t1mrcNpFgT7pQa2Y9QhsDl8Viq+MfRm
	 wW4DO6MXLoWgXOqdfbxEn1FlSMIuW4izytdBMrLT0+wT1Hx3DSyLc62zloQQXVnQUXAHd
	 xyf63m0y7FM+PEJaPlLMpfKwJWDzLM3Vx2dC3qUMAX5Ox9TMSkgYADcMreEZm69tHkh5Z
	 yVwY2Ul7JxA8b22Bp6zb5fdmbyL0fw/QV+0ZICyOU5uL1TdBh59PS8n8tSIgaf20Ksw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=oZFbZu0+kSU0ykNmAfKFLTt1Nnu3oYAy3AIE96bAt98=;
	b=yFqgj9jnNTyTCQeznEvZCqtuxEa5sh9bSQ804e71TFnNo+fytlxDk8iG+Uw5qX4QWIZD
	 Umd318lFJUok8cutHQ5XT24gpqlGaViXRRU+cNX0knHnN/fliHcfgN9G3nrh+OU4piLb9
	 EsiLHEYON7r4G3ZKoUIANBcbPVnZHpbwsnY/keQ3kJAnmVTpgbBez5V5CLzlkNoKvQBJE
	 o5DLbyFAdb63ClOiYsNkoOCE6XpB0EVqTrdNU9AhIsPCID7G2cEsgLVd5+KtRBmtR6iVr
	 wTu3uzP/euoMwM7ZDHkPhEEZw/dZ2GFi6z2FsZKnGjlTCR3jWXolNtLoLHmOuNjxobg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cgoyLmaJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5228F606A323
	for <arm-scmi@vger.kernel.org>; Thu, 26 Nov 2026 01:05:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5228F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cgoyLmaJ
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-862d919fb1cso3159338a34.0
        for <arm-scmi@vger.kernel.org>; Wed, 25 Nov 2026 17:05:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795655132; cv=none;
        d=google.com; s=arc-20260327;
        b=hsthGQxnHZ/FcjHCuo71g7jgdXVT7tYW/gXuNJglZlP0xK/GJmI0eZKWKbx/hQmSqS
         GGqOC6RpWd1plOeogyUxiX6sUD5tvsTWFIdC5qwhY/gnE32mznznGP4jaczSkKsQgXiL
         0wpxt2OmBjmwJk11ZBp7IFRTxB2zYvOuj2yXej3ulDhuU0JunlJJgE8xWuS4LBWAgLEr
         KLhXS4dVGJW0CvNjV0FIF32Ntb3ZJO8XS7npHc9Bx1xNp1pXI7FvDGyvjXQaMQ0Ab+if
         wMbdL/lljSi7iD0c725vpvEIaYNBKER5Pz6PaSxhS3Krt+AhJsP1RmfkkTcEN9bfaKJy
         jB3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oZFbZu0+kSU0ykNmAfKFLTt1Nnu3oYAy3AIE96bAt98=;
        fh=7Z0kRUi8M7uwafxNmnEIgiw/ah1QzULLuJN1aWkhBOk=;
        b=TCS3cSnvwhWReRVduWv5EwnwcL7BTuBWDjE3Q1q1egT6hcraKlliRGaBCr61SUuA+b
         clErkKhlu99i9FklWiN3jt6I3oFZEg9b95Jntvd+6JDchTUXnQaLKC8/MjDYIfJphoE1
         8EFb6SjgnTo5FhXek/ZkhKI6IlDSv8DiUm+4sQe4UhDSICrbEnporuW6RnPgzyX3Pwpk
         L2w7OFSn2FBzq+emKotDf9VOI87sh2Q7q+DRZ60ipp5lhiswN6IhJNAdcNlbZMgiSIeD
         9h8nEhzXgFNmLqdXBHgQxlsEY23VT7Wj61POSL6aNcMFTQLq1iNQvNZDJE58K0ao7t5U
         o5cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795655132; x=1796259932; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oZFbZu0+kSU0ykNmAfKFLTt1Nnu3oYAy3AIE96bAt98=;
        b=cgoyLmaJMVDNVs+2Bkuc4Gq4+rP+DzY8TDkVwXQhjOAL+dp4qnzsQw8tWInOtDs9Mq
         UfCGt5aDesmtR99fdlhyjGFE9kcH+meWw8pUXjFyF8a1RVQj4OBSi4+qlisTXaVaqgIl
         MrliG4v4ek1mtcAZbQi/ZDUGtd/sOUBo42s/CcXIYbpBMonrrKUcXJLrTV1cUPei4yoV
         snDcKqQ1TfQK5lOBKjhZFnby1iBhoWTvyUsF9NmKO5vTZYskOK8pu1aA7GCOM5k3yfAa
         2yRXENBU1NR+BtcUWuJPXZqe/ek14dU8nj0xUic9ShVJ4x0nU3/Xr92BgafYQtw7+MG5
         XGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795655132; x=1796259932;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oZFbZu0+kSU0ykNmAfKFLTt1Nnu3oYAy3AIE96bAt98=;
        b=wuFfqdVgheSpFQuhqTgsyULnzsh7LjmqB5f0HJZ7qX/cUUX25dt5mB7au9Vxqu3dmC
         pnCeXf9/6Eojm6a4Y/voZM5Eg9Me0AUPkw06YNBTdZDxqgg03PTKmCwdVW9cQfTVok1c
         75NblivOdd7TqutzZ5ePLyYpV2eE+1ScAE/ddIQOG5/GNXZFteM0epb38C7tJSLXd6Sj
         bSb5u8sdll2OUjkNOw9DrG6kG49DzR4w2E+emZfBur2jG5EUau5Kb7N5WQnZcRisqXgq
         N9S4nYKyiQeI++nif9PZ28Hasoi21uZhtRB6zwPnKDXURjQBTLMacsfUjNwwd+DdyKaG
         mldQ==
X-Forwarded-Encrypted: i=1; AL+hErGroICF7cy0c+yHkpSwGjacQKDLLtNqjIelgInh1M1QdYoYbUVGkUcnXizik3NPD8+yDAdpwRtbZQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/rhB7KdiXr+od5D+O5Y3ZmQQX1UVnlrp2lTgJGKURqHNtk4IP6
	kO7DA0CkDCJKnsepwTLQ9w9p0Q0S2eQBU49Qs/BSLjefLJVHn00ktdpFzi1mZwu4ig6b27vq/aY
	EY8A5n4OjHsNwh6wKL8hQUlL68HtNp/47UvYYvloHUg==
X-Gm-Gg: AZFdTZeMdtbX8D7ZRCqlZbjdfEpsgx95aqipYVPOF78gFmvGI+IzDEkCJmOGLpuP2ZT
	8ZlT4JsIwcmH1fBRo5wk8S/IHqo8rjZYui4Te47NOjyP8B5z0Zny8JpQhsLgt6a5c5UA5l0oVbb
	uolQlAX5+Ev+1R13hQAmflJwnUI4zDHSyMfHddTAgI+ArfHxfMX0ICwE1/ykmCjOMz1JVnTBjdv
	9sI5EP/xdzX7LhZiNaEeeV049WSrZW0y8h8p8YCPfeoryIFT3rZZgm5srYLdKmQJvXUhjUky9R1
	HPDOrFsAYhiTx6qggA7NFtuS0nrcLWi36TZpHxFUwb1oavaNhiS6BBNgh5127w5I5CveCeLliIe
	5QELtzhlevUNyhN3GFP5LjiBQGynGm1ZapfNe1pDn/rx+5tK3hdh+SAVSg24dV//qC8zdv1NiFW
	Uzb+PKGXEH6ibsrg==
X-Received: by 2002:a05:6820:c5cf:10b0:71b:82fc:ad8c with SMTP id
 006d021491bc7-71b82fcb56fmr1443500eaf.44.1795655131818; Wed, 25 Nov 2026
 17:05:31 -0800 (PST)
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121-sp11-noturbo-v1-1-37e1083cec5b@gmail.com> <20261123-eccentric-ludicrous-roadrunner-0a7efe@sudeepholla>
In-Reply-To: <20261123-eccentric-ludicrous-roadrunner-0a7efe@sudeepholla>
From: Dale Whinham <daleyo@gmail.com>
Date: Thu, 26 Nov 2026 01:04:55 +0000
X-Gm-Features: Aa3M54oTuIZ-TKok2yilEFNywBJAakQOAVzcdKFaeMZPoEEMc6Y-VCIDW_86pZY
Message-ID: <CAFcmK8g+Udyp9h24WSEx2RepBA=rZpEQs==1hTi83A+_zF-GOw@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: Don't mark OPPs as turbo without a
 sustained frequency
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Dhruva Gole <d-gole@ti.com>, 
	Haipeng Lin <jimmie.lin@gmail.com>, Charlie Garner <charlie@akao.au>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 10:26, Sudeep Holla <sudeep.holla@kernel.org> wrote:
> Charlie had posted a fix for this a while ago but never got back to my
> comments.[1]

Apologies, I hadn't seen that patch, but I'm glad you are familiar
with the issue.

> I worked out something very similar as a solution. Anyways does it work
> if we also add the check for non-zero dom->sustained_perf_level ?

Haipeng Lin has an X1P machine so hopefully he will be able to confirm
soon if adding a check for non-zero sustained_perf_level into the
chain still works.

> No need to repost if you agree, I will fix it up while applying ?

Absolutely fine with me, thank you.

Best regards,
Dale
