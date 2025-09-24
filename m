Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02331246BC5
	for <arm-scmi@vger.kernel.org>; Wed, 24 Sep 2025 15:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758728032; cv=none; b=s1GHTJ20eUF08Y1yvwoeOWxOh5bTBIOf94l/W0kzPMy8dPTmiToWCtlVp2jlJcRImfy4936eCusR8vwJuzP2Xb5EPkOmZsGEVSLFTssTEciMxGy9gbELEpo2OMp0UbY5Lz4qsr1OXgYDPtZ+E/SxDBfym5amfx/Z8PQp07qQ4Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758728032; c=relaxed/simple;
	bh=wRch98PTr07OsPbOEWFR6ZR70W6lFXly25dnPdzBGHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=bJSMe5duNqQTvuaolewQev4i7lR7Fe8TJb5DFrTQ9I4Azwk54MXOLSvJkwicJh38RPpEfRFAyPiqftHVmpjhzvDCA/zJwX18huMzZfcr5mmyNots4yu46LWj8fd5qR6o/Oov1nhjoTpr/QH60sEjoERTt2RGJ/lsBlSpp7gky8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FrVbhAZj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FrVbhAZj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758728030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ic7zvcyBVtaZcEmsf3hW05wAfmOMNZ5JL2VpkYQoXsc=;
	b=FrVbhAZjnj+3afecM9iyrE8dm4m7eM3bO9kNMWMYSajELoQ3LWp+5t/KXwf0DRetEtgIYJ
	9tvyr63oCjkhBxIpB7FEQtNngbjeciwlUJtVZXsW0/6ERUDfM5c3Mh7rIcDIR9VY98+h3q
	XauT2v1//eTopNsr1NuRTAn9tnroQxk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-yP7zbkiRMNmE00ekH60rig-1; Wed, 24 Sep 2025 11:33:48 -0400
X-MC-Unique: yP7zbkiRMNmE00ekH60rig-1
X-Mimecast-MFC-AGG-ID: yP7zbkiRMNmE00ekH60rig_1758728028
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-856d34460a3so2804985a.1
        for <arm-scmi@vger.kernel.org>; Wed, 24 Sep 2025 08:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758728028; x=1759332828;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ic7zvcyBVtaZcEmsf3hW05wAfmOMNZ5JL2VpkYQoXsc=;
        b=dLC79wGGX9rD82cVkeKFUsTLptS5hh4opxpzRmBz0Ae759/v31dzbSbQQE8t2Z7Ggc
         gmgr3FFLvEsGacHHV8OvvapBMC7rG5o9pfwwvCJblgzYA/3J/D0RJdnAXf1cpIejpKBE
         xg1tFVh44rXomyixVVnYuAsTqryNYe2MxBwsCoH+3TneN36ft06q1VCeW1GOIRPvbj0a
         4HSOu3fQ5Aw0TiOsKB3Wv4h4MiB9lx/efHjEEDkRcqYRWaDPUXXgqIqsnJvR6Nd59TrI
         oWkTeWqOvpasP9c9I0wZBKLjN30ZObnqSNDnwDoJ/qej+T0xfg0HYeZQf6hApdJwmZ6I
         UZWQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2DKsB6tod3+UwXT3F4zE30GdEDGdhQggh2latj5iGMaz+x0iQ2qcWU7mlONU/3ajPdALmiRVyNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxW4gU3GJbUHLhdNPKjXt+AN4ACom/cdDi13WGkyWiBrD0v+2HY
	0DkCek1j7lWkotmFpcnJdwiXNmZoPj0sG80u+BKhQfifgSV9+SCG38jLqSua5Zlief+6DbM+/XD
	cOoX7sQ8s/ODDqfVrPlm5Fb4NNq0Cwf/hruJ0lvCpIflsC/VsaVffx1O5Iz4C
X-Gm-Gg: ASbGncsJr8gJEIFSta3W21mqHm3jhozSg28k3+jzveBQFnlnia5uULmoc25dbYDPL6G
	4YNhfgs36zH8dLjkLvxQwb+NGoYWOAiz35f6XNyP/4v3XRsW9jnXpmoA0zZyoSgeSFX/2CHQQiF
	0dIkRQ23Ko+AZNPcIjjXdDBuUZ7SqQL36txBx101ceGXXdNwt80xDWyAG+Evoh0tEQC+9usdBsF
	J0wZNDJeTNxIQ/TsqDPSiro7jdspOjsp4N3iyEco3KhS3nqFn4LRHw5CS4MsVVWTFvooLqvml9K
	u0wltimevaBmurCKvXNChhNhJnQnEKEhqISH8xe9EDWOfeQZuLJLrpg/nGID81vgPl1tUg==
X-Received: by 2002:a05:620a:1a89:b0:828:1529:d028 with SMTP id af79cd13be357-85ae7cd4ac1mr7327985a.61.1758728028099;
        Wed, 24 Sep 2025 08:33:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7m0/cbnvCoTKElfyKlC9Akk8QQ848roxwkCAlIQudXokrBobnZdaunrFKeYAlTGXQPxdHhg==
X-Received: by 2002:a05:620a:1a89:b0:828:1529:d028 with SMTP id af79cd13be357-85ae7cd4ac1mr7322385a.61.1758728027583;
        Wed, 24 Sep 2025 08:33:47 -0700 (PDT)
Received: from redhat.com ([2600:382:8504:5608:ca95:838:d4f0:316f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8363198b0fbsm1167921585a.50.2025.09.24.08.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 08:33:46 -0700 (PDT)
Date: Wed, 24 Sep 2025 11:33:44 -0400
From: Brian Masney <bmasney@redhat.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 0/5] clk: Support spread spectrum and use it in
 clk-scmi
Message-ID: <aNQPWO6pfA_3mmxf@redhat.com>
References: <20250915-clk-ssc-version1-v4-0-5a2cee2f0351@nxp.com>
 <PAXPR04MB8459265997E9822F17AD2BC0881CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <PAXPR04MB8459265997E9822F17AD2BC0881CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0hHOE7qHx32bWqqE0jMZXqOOzl244VplF9lPWRqd_Ks_1758728028
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 24, 2025 at 02:44:21PM +0000, Peng Fan wrote:
> Hi Stephen,
> 
> > Subject: [PATCH v4 0/5] clk: Support spread spectrum and use it in clk-
> > scmi
> 
> Since clk-scmi.c for spread spectrum support needs some big changes,
> we may need to change scmi framework to make OEM extension
> in an elegant way. This will needs some time.
> 
> To patch 1-4, do you think is it ok to be in linux tree without patch 5?
> If yes, I will post V5 soon with your comments in patch 2 addressed.
> Otherwise I have to carry patch 1-4 in future clk-scmi patches.

This adds a new API, and there wouldn't be any users of it at this
point. Personally, I think it should probably wait and be merged as
one series. Unless there's another vendor that's ready to use this.

Brian

