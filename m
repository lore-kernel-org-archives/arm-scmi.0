Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094B430DD30
	for <arm-scmi@vger.kernel.org>; Fri, 12 Sep 2025 14:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757685710; cv=none; b=esL1DoRUHF58qpgzXY2DxGwUeZScm+NOX1kZqodObvYEVC1M2A+y+lQJCJe7ZipeGYDYT3nW4IeR2oSKgFJCXoxnko+qwlh2edjljoTqikFqjr6g90M4/Lrv5wtiLIGaGV8UPGXqG8AsAGqPDtJbvLEc9E2h416G0b4djZeKgmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757685710; c=relaxed/simple;
	bh=PRjCguMUk1s7Xp+w5iYJEY/+KMZLBNSqYFI/vEqfPmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=bFbOIl5K7pna55GRmkiwDKTiaCyC0RTDbqEKd5Cheray2Ih2vcw9TLcwf6b20gBF4kYt1aZX7nKa8EQww+On141cLnKKot4TRBTPOwmE/9cZskNtySKlg1fyh4KI9PXRE6pFfw9++O/BUWDkGPG970U3T5ivyO9zTihSJei7UpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hvkHjNwE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hvkHjNwE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757685707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MqqpI2kMloNbQrwtAbrBDd+hBQn+g4T03pkyyFvQVUY=;
	b=hvkHjNwExbsgYxcSmbDubn6kipfCCEtFbX44YwBlCTtnbCqmUbupihbFUqerfmbP7wv/e3
	+wOLR8gOXBureIe4lrm3E96BRSuyoWpR+mj/BBgKeU7SfT8bxP63lUNc/QIq2sGY05tKkp
	fYNM5aQlfFd6d3lNglBCw94zQCAs1m4=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-gUGJcQODNZyJ2HkfjRIQTg-1; Fri, 12 Sep 2025 10:01:44 -0400
X-MC-Unique: gUGJcQODNZyJ2HkfjRIQTg-1
X-Mimecast-MFC-AGG-ID: gUGJcQODNZyJ2HkfjRIQTg_1757685703
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-74b64da4a81so4386690a34.3
        for <arm-scmi@vger.kernel.org>; Fri, 12 Sep 2025 07:01:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757685703; x=1758290503;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqqpI2kMloNbQrwtAbrBDd+hBQn+g4T03pkyyFvQVUY=;
        b=ey93j2Vck+Q0mFOz51c7JUcuQShN3Gtt6MdwsDR5N2S6OA2mlpr0Zxwj9YVUCil+fZ
         Cd9tyyfCGMEZc4jASCg/xBAEAhFW2sPLCtEPIRyKjuU1y9Sbdqik0iczp6Q8yWdmMN8I
         pClKaip2IqfGYYQrGzxdfZqFssah5/4zFDseWoYEAP2qyOWIQso53utemUx5Bgw9H2Aw
         T3dxQT/x9b/KPg3B0gvXjSgrbxwT7bQ/ESRqO2brBFNXk1yLiUEQvqXkOHkgh5wcip2D
         rBiq39lFkQQH/pr3cab344N2JNV14NAfRPzAwAQtwqY9MKJFgnAwK/c/6OyIgMYPLfsA
         TKgg==
X-Forwarded-Encrypted: i=1; AJvYcCXInNYkhO+dPRG++XEukBh4HfRNKLg1oMXrcXvm/XbudbkRCONLu9zY49ud170Lnw6X2suCB/O12g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOCfanHPXytXN5tuA9n1JYRXcAFspcDKdzuJWPTc/rV8C/F9yt
	+81tdv4XznkNxa/wiQh73BK1w10EQccaQkiftJuuoT91j8oEhOM00b+DHAcxgMTt7xZx1+YVTK+
	OxRy6Jic22o583qHfcsV6OAPf62I4OSI4VuxHTtBw9I2tVdw7aQ/U/QIYtQB5
X-Gm-Gg: ASbGncuZ29jzF8bz5Vu6KQ2QDaPrAD6NokmeJnGnj0pR5YTPDhkPQPdd413fuqAPNsW
	wYfhBeWCHPzyMgPvyY/duOBbTcV4veLkLZcIHFVG2rYLGcjoEPllMT4cXw4aDZO3LAtSoqfq0sb
	7g/uYg08UuvHoTrIBO8KQPYIdH/fWQ29Xa2N/uLSPNeEkX2Sh3iLXTkdUO3AKJC10evaQn/8gj8
	DK8wp80FtYS7tl+GtQCAS37TIgo9F1qZklG2+URjbRFvJcX03Pq3CdWd1dbdsq/r5NivwrTBjai
	GN6pP7MbmVW3VSBuViCYWZrQ31wNx+SRS96j99W64Bki2lF73EJPICRfwO0NSVa7U2zY+/cZdH6
	StGvnxpgLgizqiD43ELGzrmFegbmJMw==
X-Received: by 2002:a05:6830:921:b0:749:32a:6e79 with SMTP id 46e09a7af769-75355ac0c40mr1629162a34.29.1757685702765;
        Fri, 12 Sep 2025 07:01:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5yxEH3wh5uzqiZ9fHV5ltsysfaNN7LLcUgGKgcfhcmP2GCkP3kLrFAt6qiJu3nESHP/mhlA==
X-Received: by 2002:a05:6830:921:b0:749:32a:6e79 with SMTP id 46e09a7af769-75355ac0c40mr1629088a34.29.1757685702145;
        Fri, 12 Sep 2025 07:01:42 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b639de9a69sm24487811cf.46.2025.09.12.07.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 07:01:41 -0700 (PDT)
Date: Fri, 12 Sep 2025 10:01:37 -0400
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
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/5] clk: Introduce clk_hw_set_spread_spectrum
Message-ID: <aMQnwU3UA5xe-Eou@redhat.com>
References: <20250912-clk-ssc-version1-v3-0-fd1e07476ba1@nxp.com>
 <20250912-clk-ssc-version1-v3-2-fd1e07476ba1@nxp.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250912-clk-ssc-version1-v3-2-fd1e07476ba1@nxp.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KqXi8pjBsxX0ahxSxi0kQZwLilb_UnZHDN_95kvn5mA_1757685703
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 12, 2025 at 11:35:51AM +0800, Peng Fan wrote:
> Add clk_hw_set_spread_spectrum to configure a clock to enable spread
> spectrum feature. set_spread_spectrum ops is added for clk drivers to
> have their own hardware specific implementation.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

