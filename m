Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A86279907
	for <arm-scmi@vger.kernel.org>; Mon,  9 Mar 2026 08:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773044203; cv=none; b=IxEJRE+q6XoZ7OfRSnKlCLAoTmuQ+/METDJ9Mfv1EyDAV35AHLrsZ15Cm0eei2SXjMh4yWu2sBJl2LRuTGLUuy4SwjWOTDmouTNd0/pDyuKPjBX1O8yvnBC70KVR1DRSr3d7jfHQn+St/o5yfi8dZLzbt5eSUaYbABshizo6dq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773044203; c=relaxed/simple;
	bh=pGh04qh9Y9aOOG+amdLTzRizkrVAC/MdjrIzhCUrvcw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fz/1jlqWgolkcjx3jFtu13jM9+HyLY5umo6TQ+1Fy4DACq0rqpLX4m9YuNlnLjBGWoOX1FLNz331CUTjGO6eFbkKstLeyOeshj+l/7ucFf6zHrg1bQYY9u2LiCt3suaBSru96TzdtJPF4WH8kgub+9x2DFGbZqEiKCRvpN8cY9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56affe9f4c4so1355161e0c.2
        for <arm-scmi@vger.kernel.org>; Mon, 09 Mar 2026 01:16:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773044201; x=1773649001;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vDY6Fj7fj/w5+bjRx0OTlDzLgihUrZ9NyoCl0Dr8CM=;
        b=Q2UjFQ2AiNrbVdsk5oAyCZktrTKTiMGiYD/qufnSKwTS25MlR0dEKPsZlRH8q41E+z
         L0psNhv4Gsj9c/bLLZMUfEJ4Sa+JSgsLwcebIpzUbzrZ/dV7Qi5L3ZgxpYavlAQZCPnc
         zX9G8Yyjl/TeXxWBWxfl6wc7Fjp/BIVAnZwHlaKadaoekBpHSPvLzmC2KcjVk4KVCUnw
         E5F/Qr749pnhB86UTlkvZrqAqs79U1ScZFuLBEwrVZ1KDsJAkwvC2qXXcQeE+e5iMVPP
         rJ1mgxiUnji/NjZ3UIOgfBHrl2wKJ1shoyUPwHUkc+4wW8nvqVQHEyR85AwLP72SF+tI
         BQTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJIpgJuOObFEPk63aaBlXY+w+5ncqkXAm1n1n5An92Zq3ufMmCb0mQNOFIrdthIHlEI9hlbnXvYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNfSCyPewiumCbSsvVNfGoNhnfBNMz1RZ+Os5FaKhMkLlN0u7S
	GKg2fsNvrMAS+8J+Kybp6WQC7tXU5/T+cUzw4C/6Ut8CEPcRoa1oQt8cMUnzKd6w
X-Gm-Gg: ATEYQzzGbGXfXcIfOPO/mMTOEjoljszDvqWXy/R1XKmaeMXBmjSBoiXH7kgBVbez3CM
	kxg5AEPXaIIOliirNVyw8YVOFLnQoXbZGOkmdly0TCZaoRrSC9k+W1BrN5itL7ZiUCOf4FT52W0
	6OBoebrYGVstzPfHnRcTGWwVlZpQ0CbHzxtVuX2XhYfHVkOmy0wFF86Ib4WsQRwivga/R16codG
	xanUYRtZxmkH1gcv+fWULh2iZWm2JYS/31w/tNZVDPkmNS993rwf3OBcSm5WJZSBxikxDiC0cQZ
	YoYlzhLr6zQ0ouzwKaGeayffq7KTAYUbjfNnMebncIjS7/Nhou87s3XKLO/bIn3DwRVhGoKLD4O
	ZmsPNSWrdcr67jlQjiXSpRly+JBbGUlaDkvXrRmoSOs7cBwz8BFJEKhCTgI+Uuz6fEi7UTe2ZVv
	qbUF1MQQBTOKI76iVbxNcoCzT/VojNNYyI1txjenPxcKr/kphSCUB+Cb+oL5J/
X-Received: by 2002:a05:6122:8c0a:b0:56a:ff86:c91e with SMTP id 71dfb90a1353d-56b07d4e49amr3649734e0c.8.1773044201253;
        Mon, 09 Mar 2026 01:16:41 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b09b6ac44sm9347714e0c.19.2026.03.09.01.16.40
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 01:16:41 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5ffc1e25d6cso994605137.0
        for <arm-scmi@vger.kernel.org>; Mon, 09 Mar 2026 01:16:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXeEMPq5Ibz9RJXy5v3u4BEj2LyxrAytu30BJv9VfoNFBPBHIXV61W7ijsub/pPmQsVF7XKjQckUg==@vger.kernel.org
X-Received: by 2002:a05:6102:944:b0:5ff:c59d:67cb with SMTP id
 ada2fe7eead31-5ffe5f5e8a3mr3541635137.9.1773044200697; Mon, 09 Mar 2026
 01:16:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6735401861e0c2f3e5e680533cd6f71c4d6fd5eb.1771581270.git.geert+renesas@glider.be>
 <177297485599.1088487.13156698600769816077.b4-ty@kernel.org>
In-Reply-To: <177297485599.1088487.13156698600769816077.b4-ty@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Mar 2026 09:16:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXkyrDRLyDf77TFFjAX_Q_fnA_OwmbkoaEicd+F9JP2aA@mail.gmail.com>
X-Gm-Features: AaiRm51ocrPqb7jpQ7WG7J_Ckto5bT4cb6pqd-tn1P8a44yFS9mg7m3aB7Vz2cs
Message-ID: <CAMuHMdXkyrDRLyDf77TFFjAX_Q_fnA_OwmbkoaEicd+F9JP2aA@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: Spelling s/mulit/multi/, s/currenly/currently/
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Sudeep,

On Sun, 8 Mar 2026 at 14:01, Sudeep Holla <sudeep.holla@kernel.org> wrote:
> On Fri, 20 Feb 2026 10:55:15 +0100, Geert Uytterhoeven wrote:
> > Fix misspellings of "multi" and "currently".
>
> Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!
>
> [1/1] firmware: arm_scmi: Spelling s/mulit/multi/, s/currenly/currently/
>       https://git.kernel.org/sudeep.holla/c/4e701b47c3ba

Thank you!

BTW, I noticed some of your commits use the non-standard
"Message-Id:"-tag, while others use the standard "Link:"-tag (albeit
with the lore.kernel.org instead of the recommended patch.msgid.link
domain) to record the origin of patches.  Do you have different git
setups on different machines?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
