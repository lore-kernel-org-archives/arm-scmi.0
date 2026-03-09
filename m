Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E4C38236D
	for <arm-scmi@vger.kernel.org>; Mon,  9 Mar 2026 09:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773050023; cv=none; b=HkUXOsvGAkpUUUJTnVS9+IIpOdNu1/F/4DY9PvOD9GmIQfudd41ROlUr0X845hdfAIC007rQlwmcu+ts8d4QeVp2ejdTMQLr79oaBg5EDPkssOWmkK43zpB78G246Czcj+RQVOq2UHPPrz6BTX5BP0kXNexr1SyZj1hk9DIIsC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773050023; c=relaxed/simple;
	bh=j2aVzo7rFkW02rcf+ihIyIqw0q1K1o73hZeK6j1JlxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VINDuD0aH1iI7sjoVc/XLsTS/ZvA/NFnRpbwfbO33SRpq5FWSqf1oXStx1MpwWAuh8iJ0XPkJPL6DOYWKiSOKTxR5Qz3mKcQpvVivXdi15HdZRJs+9ve6BM4xnSW3XpVdi0Ff7GrJzjgZcXHi/m+2BNN752pm3Kr7AMA27aD1Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56af4e998d4so2833250e0c.0
        for <arm-scmi@vger.kernel.org>; Mon, 09 Mar 2026 02:53:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773050019; x=1773654819;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcPZnd6YTmJYCmkSo2/8CySFFnDwxQJW2YpHGqa6ioY=;
        b=N2qhPnySMpmWGkDVr8+5nDH1nS53UKRTL3c3pMSVmiFPh1FYzFFTUNJOucHDoQBBAr
         ynf8HBveTjRpI4fy4AT8FCRgIntd0zrsx6MDQEkRTYDaWARXtce5fbWR24nCX5lXOLWK
         I5E3VhxlpZUCh2xUsnBrjI56JPe3yWbEIp01D7xdlpBmU7wAJXvBf7LxMCVyUocxnPYh
         dpDQM79lVgevaq7155ztK03Nztpow2aA39czfx7fj99Qxbt+2MKRBGzZ+NesknqsUqv0
         ExcZGzRcGAHgMbZ28mVkaahHRqEWBDR+ei6pjYA5c31e83b8mhpIYBXlTXEATiLdZxe+
         02dg==
X-Forwarded-Encrypted: i=1; AJvYcCUbQjmDJhwXkX6ReSGIv5M/rWgF/Rc8Rdxhp9COvFdhmzTDwveIRv4NfX3aTxiZJc7YOcf/EOv+WQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4KnbhlgWfBTUm4QWpycni9w7ekNMgC/kc8xKdk3+iQusl3XF3
	b+uMhYwZIFCRr7XmcpTqA+RxmF8vLEL+7HVD3ftbddqrntLhmIkQOzOzeRKvKYdh
X-Gm-Gg: ATEYQzzM+YrlwSFU1mhIcaJEHUP9oWQnQfkhoYQtt4dAFoJccpmYMKpekveUOADAPZn
	LE848mMD06+vfb2DbXtB51bBhJfYfjldOBiMbdzXpFLFlngH9zGoLZAorN89iKRCHSbsHaiKicl
	aJtv7tAps2RtYtISK8oPvmzXZmW3ZC9KzPx3imyK6S+sFHshcM2FACstOz0IJp6H4FBdmTXzaVg
	jG3u9WGW+yhJOykzgdnfwRX4Ke5xeVHg0qDuIiwwzCqNMkTK11vwXCtxIeMCABeB4UoLJNLRCFn
	Dc++xEHmXH60MJb2pH7PH2za/wO95VSDHDAOm5jO7Os95zC8PKg2wnEEA5Yo+CVgu+WPDLk6Xlt
	yDTTlHtP3/Uf+WTj/8msKAmmy4KGHsEy8OBBpsbCBHjgXv7ilq7K/yN4Tr4XfJBrNhdx0f+8W4E
	783ckSWrstuVkyqf1XAvpS/3pjnKZKVnJESQr9r4odTkn1GSWlXF1iuKIJ5l/Yh4VnW5eoO5c=
X-Received: by 2002:a05:6122:1aa6:b0:567:2200:a6d6 with SMTP id 71dfb90a1353d-56af44b3d71mr3993172e0c.7.1773050019365;
        Mon, 09 Mar 2026 02:53:39 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b09a261c9sm9632124e0c.8.2026.03.09.02.53.38
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 02:53:38 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-94dd05a4b44so6753190241.1
        for <arm-scmi@vger.kernel.org>; Mon, 09 Mar 2026 02:53:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWqOsZoBTz+3W5L8FxdearUHYNuAAxryrM28SL37t5qbk2+KwIa/mpSyrojzbooN2m9rH9UEpaThw==@vger.kernel.org
X-Received: by 2002:a05:6102:3050:b0:600:ac0:ce33 with SMTP id
 ada2fe7eead31-6000ac0e677mr2034235137.5.1773050018562; Mon, 09 Mar 2026
 02:53:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6735401861e0c2f3e5e680533cd6f71c4d6fd5eb.1771581270.git.geert+renesas@glider.be>
 <177297485599.1088487.13156698600769816077.b4-ty@kernel.org>
 <CAMuHMdXkyrDRLyDf77TFFjAX_Q_fnA_OwmbkoaEicd+F9JP2aA@mail.gmail.com>
 <20260309-bold-space-ibis-fbff63@sudeepholla> <20260309-frisky-proficient-gecko-b8d7be@sudeepholla>
In-Reply-To: <20260309-frisky-proficient-gecko-b8d7be@sudeepholla>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Mar 2026 10:53:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUkJzSLiAO4cwCFSFg73q9hCYQ0fCM5_HEdwKxxgP8aoQ@mail.gmail.com>
X-Gm-Features: AaiRm52STTVZn_OJ0AxO1KKzepN_Qh5JalPfQF_WP1CiVNHMvNp-jxwNr7ERlYI
Message-ID: <CAMuHMdUkJzSLiAO4cwCFSFg73q9hCYQ0fCM5_HEdwKxxgP8aoQ@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: Spelling s/mulit/multi/, s/currenly/currently/
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Sudeep,

On Mon, 9 Mar 2026 at 10:38, Sudeep Holla <sudeep.holla@kernel.org> wrote:
> On Mon, Mar 09, 2026 at 09:29:29AM +0000, Sudeep Holla wrote:
> > On Mon, Mar 09, 2026 at 09:16:29AM +0100, Geert Uytterhoeven wrote:
> > > BTW, I noticed some of your commits use the non-standard
> > > "Message-Id:"-tag, while others use the standard "Link:"-tag (albeit
> > > with the lore.kernel.org instead of the recommended patch.msgid.link
> > > domain) to record the origin of patches.  Do you have different git
> > > setups on different machines?
> >
> > Not really. I used to use "Link:" and switched to "Message-Id" a while ago.
> > I use only one setup and if you are observing something like above, I am
> > doing something different. I need to check what is that, but the intention
> > is to use "Message-Id". Let me have a look.
>
> OK, did a quick check and see last time I used "Link:" was an year ago and
> that's when I saw some discussions about use of "Link:" for other purposes and
> switched to "Message-Id". Let me know if I am messing up something still,
> happy to look into it and fix it up.

There was indeed a fuzz about the Link:-tag[1].  In the end,
it was agreed that the Link:-tags are fine, but please use the
patch.msgid.link domain, to distinguish it from discussions (which
should use lore.kernel.org).  Unfortunately I can't find a link to that
(too many trees in the Google forest).

About Message-Id: I totally agree with [2] ;-)

Thanks!

[1] "A policy for Link tags"
    https://lwn.net/Articles/1037069/

[2] https://lwn.net/Articles/1038003/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
