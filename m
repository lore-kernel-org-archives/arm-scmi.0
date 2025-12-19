Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579DF34AAE8
	for <arm-scmi@vger.kernel.org>; Fri, 19 Dec 2025 19:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766173745; cv=none; b=MVIVqIF7pUOwG5HUeoca4P56+9kq43wD2RE8mgm2JNd1iqGjAYfShLxbuTmJFsMvT/8lOAH9V/8YBXrzq1TThTPhyCzb2EkDdqwv7Ix+C7B6yfnH/XZK71HP9P3gV7RmqFNw6jTkof3Wlilv83xSxW1QWX27eZGuLMmM1+/Wnmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766173745; c=relaxed/simple;
	bh=7QHParoqmwM/fv693piLNFSOhOcM5vYfUKurXmOY6eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=U0DGJt4REwSilJBCNLdBIaGVjXvZMRo0QsuKLiosanOHzvMZrfvvuA3qGcQTfZALlEaNVt3TeSyBAJV1N4sEcpru6l3bYz1K0qSaLdxgxeovMi6fzS1P7j8n0fcWya7EnxhC36ntHVyUV4ey9Vaacsxhd9c+GWWL/NDTmVk4Vqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KAqaGfMJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KAqaGfMJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766173743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7QHParoqmwM/fv693piLNFSOhOcM5vYfUKurXmOY6eg=;
	b=KAqaGfMJVNLAaVtN0ua6ijH2K2pMSy+o3HSVnerXsRxOt0HNrTupBwCJgJdXloFPznD20s
	qevHKGSwJBJXo6LZUi3wlHpfBXRTCMI2knSsYSuWLK5MuJsZzU9ZgOYXOfsTdTbNbdIJ7U
	3ajFEcTtRgljnso56mrpH234CUvWLT4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-ILLYFWUxMBKpx1oIPXtnXg-1; Fri, 19 Dec 2025 14:49:02 -0500
X-MC-Unique: ILLYFWUxMBKpx1oIPXtnXg-1
X-Mimecast-MFC-AGG-ID: ILLYFWUxMBKpx1oIPXtnXg_1766173741
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b9fa6f808cso568726285a.1
        for <arm-scmi@vger.kernel.org>; Fri, 19 Dec 2025 11:49:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766173741; x=1766778541;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7QHParoqmwM/fv693piLNFSOhOcM5vYfUKurXmOY6eg=;
        b=NkaPSz2xj31BnyPVRe1bdreo2yqfKqvk+BpQlVZxhiTZDWMU2fxw5oHrRFMgTKGWGs
         diI1OERvb++i3+ORYpwI8T5Wa4HDP+CgOzDAhgRg2kxDQZIWQin3C5clQ9COd628nUGO
         iH+KtRLr9C3EjbVV3qSA3THbGeN7yKOsuH5sJEqx0Q25soQDoEURc70hUUinJa6ieASZ
         Y4riSYKNeMOejLYMSSck48S2JBCguGg8C2sIQamh4pxI8xsQtxdy0DCyjERng5ADB5vz
         lBnChZX9SqLbUeWxO3zUjXtemEvP2jdo0u10ms+t1QkvuM6KVAmNEgDXuxBiXAybblyV
         Lc/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWHWQ1TNapvP/fhMcgI9rkaKOmFwAAyerikfMOIJgtIWXWfgYUfuD1eYOueH6O38AlkDCqS4gWD8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWDIcrC6R3E7YxNmyq/ZozaYIcc/Q1WAPvzQBbU69tBaSFFsBU
	HDCNEZXFM77S7r1o/RR3EZb5NA91bIZ1gtLXXkcCFjsYDAMhqwi0x8Ww64cR2+4Z4KTC/l5p+jD
	8zVVsD4760Lu379/oyreQbguGdTrX/70ImnEBJnIlsCvxHgKlYjQbp48G2Nti
X-Gm-Gg: AY/fxX7ZS0nUxnr6nYUcmnujvs2AU9sEuYT9t+Je4SDwbyKNh2SrOkzibeVOTIgCotn
	IBwdjEwLNT35ftc5hhMj8Vv6FlRc6IkWZUTDiol78WxX6Zz+pqXpi0Yg/0CQXoxCuCBCfNHE55N
	44o4/p1YnUneTuDukgnveSpbquQO4x11tMAyLlDkSI2BrfXmzxVVMAq4X+EyK6XmoUEnewQ4ruk
	Us2xthoKbrGU7WZ7iJ3Jb1rsy4naaxWwRejN73iGgniobITcQ/Y9L0CaTDueuTetXXxqsr2U7k/
	tAmy1DXQ69xkiFWyOsMhO49FUpqH3dw9fLia5i2W1x0H7CFAcSUxcGUtLYI3YhOfJO0oOJyC3XG
	nK3gTPQL6
X-Received: by 2002:a05:620a:2915:b0:8b2:e922:5282 with SMTP id af79cd13be357-8c08fbde546mr650956385a.26.1766173741563;
        Fri, 19 Dec 2025 11:49:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhmkU84dkGCcwT8u/xbGrBML5VLUNpWzlUIRhCANoKaN5hf3mFDRW42eqFLJM185p9R9rh3A==
X-Received: by 2002:a05:620a:2915:b0:8b2:e922:5282 with SMTP id af79cd13be357-8c08fbde546mr650953885a.26.1766173741234;
        Fri, 19 Dec 2025 11:49:01 -0800 (PST)
Received: from redhat.com ([2600:382:8519:53fe:9d9a:13fe:abf1:fb80])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c096783a81sm248019585a.9.2025.12.19.11.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 11:49:00 -0800 (PST)
Date: Fri, 19 Dec 2025 14:48:56 -0500
From: Brian Masney <bmasney@redhat.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sebin Francis <sebin.francis@ti.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v6 0/6] clk: Support spread spectrum and use it in
 clk-scmi
Message-ID: <aUWsKAMDm9_5jxsg@redhat.com>
References: <20251128-clk-ssc-v6-2-v6-0-cfafdb5d6811@nxp.com>
 <aTvpmQAPE6HfIy+r@shlinux89>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <aTvpmQAPE6HfIy+r@shlinux89>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9r1S2zqOGzTVv72LvU3vLczjRouHV1FAFy_i1S1G4MU_1766173741
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 12, 2025 at 06:08:25PM +0800, Peng Fan wrote:
> Sorry for top-posting. There is only one comment from Krzysztof regarding
> cleanup API usage. Since 6.19 rc1 still not out, I will wait two more weeks
> to collect comments, then post v7. Hopefully, you are ok with current
> clk-scmi-oem stuff.

I can't speak to the SCMI OEM extensions, however the other clk patches
look good to me FWIW. My Reviewed-by tags still apply.

Brian

