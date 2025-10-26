Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC4B273D77
	for <arm-scmi@vger.kernel.org>; Sun, 26 Oct 2025 23:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761520583; cv=none; b=qzCs4i6CKnlI7woCxOAF/QYctgvCQsviKOe3ut0G/CcbqF5bEnBB0tEME6dfQasKu4Zqv7WkAoMyKf6clyZRloVUUwNPhIL/V6a3Z4CcxK8HUk4NnBP2Ms+ZOGZmp477WvV7oFb3nMy8YYKzKgS2/QWBOBJy2FUKdVPazrT1PvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761520583; c=relaxed/simple;
	bh=KQ6oL4hiz75C/A8/vFj2v/R+XXo7kpXKDEDVyBnk9ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=qFRTaQxsGM0Q1htVCjTJuWRTO5T5ZllwyObPNpYsg6cMz9XyYX/PrWQ2Q3x5GcHney3KeeWOJ3/WcvuQv4TuVseAqZo2DoBgUIdmqkf6D6XUrg5b8hMThqQ1/aPRzaUiaunr260GFVSbFK4pFADoQ9h6/SkXQ/zhCgddCmni8fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RPJDCQYR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RPJDCQYR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761520580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TM9g2J61qUgy8rn11tUgr2Kr+gynrxk9ajK18D17/SY=;
	b=RPJDCQYRhVLFsadMNhgBG19pz3iarfNc8xA24kPqVsz/1YivTlvNktdaKCQ9kaIOcLUxXM
	pCRsFOPGobAH6gKDiNfJSsJEkHxiKLSO3YYgGLBqyuydxaeMSmP/R5WNguJ5yYYrxc2k39
	qHYjdrBoNgur430TBoSwBdqDK4cq4uw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-HwjO4IUqMlem8falVRSWPg-1; Sun, 26 Oct 2025 19:16:19 -0400
X-MC-Unique: HwjO4IUqMlem8falVRSWPg-1
X-Mimecast-MFC-AGG-ID: HwjO4IUqMlem8falVRSWPg_1761520579
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8a2594fa114so256970985a.0
        for <arm-scmi@vger.kernel.org>; Sun, 26 Oct 2025 16:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761520579; x=1762125379;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TM9g2J61qUgy8rn11tUgr2Kr+gynrxk9ajK18D17/SY=;
        b=v2ff1q6OS1ZRB2flhINoit/jvkGmuhWqVStEJdNAhtNInhZeV/BmabkpRUBjKvVbu7
         Y3CmiDaAjSe0KCxnjSRYeL+5dpcfoCNbcrDgcnJj2DAsRNJK9YY+kvw5pR8+0lNcSvf3
         cSvN/M2+1KBZSa5qgT4LPiVL21oAScD4+A5PeSz1/zIoaxsOY5QTuMJiadiEQaWjkG6R
         YgUaNVSj9RnQUUtvYdjHB2ANBpDUhz64cpU47JVlCwlGaL1/SB2QV+X1SKdcYhgZHgHG
         M/+9UNERdfaz3icR0HtuZSsV1N2eaUq6i6WSUmrcOKoaZAXRoH+Z0KUznaLqQhfGBeab
         RdHw==
X-Forwarded-Encrypted: i=1; AJvYcCVV+V1IGEoc9QmWuR+0acdy1mn5oR9HMo1jNC40Q2XvB8ULPukYPYu+C6/nSdKpKDkGQMF9KRhumQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrKrQOWQdazgJIXdnv7XyUExpSIl7Y0jdafPPEoctX9yLQNORh
	A0v4M+2c7NZfCjVmsNxMSc2EjxLoKfhMYXYxvNEZPLsJTy9CryXMtprtUmh5p+IVt8Db+zoH3wu
	V7+1ZD8abv4QngL2HFDgxr4SJmZnxq/eHJ2NvRLDM0CbLdnVhmlHJ0XBQ4pTQ
X-Gm-Gg: ASbGncs1xl3JAAt/3fQsLPQWHuYbtai+SOlxZnbnqQVcS0Yz2sElQUwUFm0kMN2at+G
	4sFBMNhjzIEAPBYPkyVAay7Xo9Y6mSbn93J+MoGVNT32yCa8daeLZDJPJSev73/BMsgmmme7YMo
	YyQuaJbShAsJWiTdNClXBXxy+n/5eNhVGyfb0dXXnQgYkAfOwJvdvta2NyyMpTS3/eyzOl/w5fY
	pgAEf5rJ364UFdu5+IKnAXyB7gci3n4iDQR0EIZsE9Z8Z54+eeLzmgTnsUkNb2HCUdatubYIZ4C
	a8GDNln8wZJ+BcvX40LAXJAzGzEMdKtz0sqcJwo6qJM/X7w4mcQQEyCJsJvMnhAsxg3P5VOYWTO
	3ZTJAGSx4yw2sBnOt+lsKfdJTSr9S
X-Received: by 2002:a05:620a:4454:b0:809:b21:5421 with SMTP id af79cd13be357-89da1bae914mr1370444085a.39.1761520578744;
        Sun, 26 Oct 2025 16:16:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0exW7QsnW96XJU3LfmVTRq5OXRYKfDNXF9pTY84ykGNprSECOl2LKm846J2PimjM64qIFow==
X-Received: by 2002:a05:620a:4454:b0:809:b21:5421 with SMTP id af79cd13be357-89da1bae914mr1370441885a.39.1761520578329;
        Sun, 26 Oct 2025 16:16:18 -0700 (PDT)
Received: from redhat.com ([2600:382:7702:71bf:259:17c7:d468:3f55])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f2421fc6fsm435746185a.9.2025.10.26.16.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 16:16:17 -0700 (PDT)
Date: Sun, 26 Oct 2025 19:16:13 -0400
From: Brian Masney <bmasney@redhat.com>
To: Sasha Levin <sashal@kernel.org>
Cc: patches@lists.linux.dev, stable@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>, Peng Fan <peng.fan@nxp.com>,
	mturquette@baylibre.com, sboyd@kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 6.17-6.12] clk: scmi: migrate round_rate() to
 determine_rate()
Message-ID: <aP6rvQD-bwSkhfU5@redhat.com>
References: <20251026144958.26750-1-sashal@kernel.org>
 <20251026144958.26750-39-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251026144958.26750-39-sashal@kernel.org>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Zu2xl9UTjv_ZkWzLbcc_tsXvZE_Y2onQRuQq2w-BeBg_1761520579
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sasha,

On Sun, Oct 26, 2025 at 10:49:17AM -0400, Sasha Levin wrote:
> From: Brian Masney <bmasney@redhat.com>
> 
> [ Upstream commit 80cb2b6edd8368f7e1e8bf2f66aabf57aa7de4b7 ]
> 
> This driver implements both the determine_rate() and round_rate() clk
> ops, and the round_rate() clk ops is deprecated. When both are defined,
> clk_core_determine_round_nolock() from the clk core will only use the
> determine_rate() clk ops.
> 
> The existing scmi_clk_determine_rate() is a noop implementation that
> lets the firmware round the rate as appropriate. Drop the existing
> determine_rate implementation and convert the existing round_rate()
> implementation over to determine_rate().
> 
> scmi_clk_determine_rate() was added recently when the clock parent
> support was added, so it's not expected that this change will regress
> anything.
> 
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Tested-by: Peng Fan <peng.fan@nxp.com> #i.MX95-19x19-EVK
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Please drop this commit from all stable backports.

Thanks,

Brian

