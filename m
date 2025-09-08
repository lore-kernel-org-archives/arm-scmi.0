Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F775313269
	for <arm-scmi@vger.kernel.org>; Mon,  8 Sep 2025 17:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757351571; cv=none; b=DME8vGemjGWW5tj6VpTDZYVRR8LeC1J3zl58pLEwmF/J6co5felmaE8JXza58bb0wVQhVnUed+JYnnJ9nqS7vZNDztKjkj39dccSF8VQ1Dl29uMCySYJAFNPo7T5IaMYrNKwawwxdg33ZZS7R1FA/MCtauC5z3CFAA74KVj18qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757351571; c=relaxed/simple;
	bh=9wENXREJWltOZIo5LsFs5L8jitKtQe8nqAyfDbsl9ys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=QkY55dIqB+PHgn2h+mjksO1Nu7LiE6cWymP/sybhHS5R/ZkLYTFY+rC4eSVlyQkLMw3ORun6t3NZnxbxWjSyIeAybO0l3e+l6S+sdGx3QAD8U1frmMeXXp+JCdFO/UeR0Jh8PkmmWhiZwPEYX8oNIGebuERP+9RVzpxKmtBfc9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IDJYzrtW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IDJYzrtW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757351569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7ITe2If+kWs1Wpx5tlRiHNQVWbTASg/lvnSb0pDekYg=;
	b=IDJYzrtWW1mW5btKMV3WgM8DI/B5y7Frhb1WxfoNub7NIo4XayvUWnJiQ4P/4Le76RacFc
	0Vp0bHwODbFj4kUaDfiwnO6p75j8i2SI4IDwv7PqPnekFDerUBO8rQ54MO+kOI4AhBvsFr
	fPPF1eZmLDuvyEmWSDq0v/D15yRwNPw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-tMs-y_rNNqKAHgXNu8OzCg-1; Mon, 08 Sep 2025 13:12:45 -0400
X-MC-Unique: tMs-y_rNNqKAHgXNu8OzCg-1
X-Mimecast-MFC-AGG-ID: tMs-y_rNNqKAHgXNu8OzCg_1757351565
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8063443ef8cso1933818385a.1
        for <arm-scmi@vger.kernel.org>; Mon, 08 Sep 2025 10:12:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757351565; x=1757956365;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ITe2If+kWs1Wpx5tlRiHNQVWbTASg/lvnSb0pDekYg=;
        b=TpJMyNTWqQDZlj6IbPMsmytiE26hd8adgFjK7GVnQodsv077uMyPApkb/V3SfsORVW
         DVwghwSLR+CEEKjXJMS1edT2iEwE6eL7lUMrUinbPdNSIXq1qm3g/g8IiOOLrlyyHHjQ
         2Nn4p63XNL3+Jow39ESr9Ubnyk78sUkWGKBLiQysOkGXdO/8+A4w8qfddSRsvfus/ke6
         9uGcTo6EEcJKEe2519sf6c56kia9BG9Mx9EO4zWOFdNynjQa/fAFZ3VdIB4EQgYwqcme
         7uBhiYcZUrnP0mb5jCH1cFh9du3Q1zSIoiHfz0bQ9kj72ZJSlecB92ws85pESo2mJ93z
         AOKw==
X-Gm-Message-State: AOJu0YwkcoBzvQsLl0UF+tY7fo0nGw8hJrEXdKDPxehxSQhXtIwcS85K
	JNHLjJDVQ1Zw1ZTKGJ6xuPqlupyF4eZRyMWeensbMDv6SS/04cD0m6wCXT/X32B0hlgYKbgYWCA
	C/VNhpho/WSrSNc58+H2Jmtg7dxyb2iMDbbzKRzNOihmaL0vyESm6rDFc3Q/p
X-Gm-Gg: ASbGncsFMzwEfRtP0DWtM4ZhM26RIkfLMZcpjAjFBImud5sOn8dmNlybBe06NN1ZVOS
	qVN1ZWgN+O2yFwFpOU58+mw/ylW6zCm5NpG9PO/NSf2RGaqWxjISMF1/KCijEvgweadAQQYckQs
	DVifcY93hRP1NQ12Fu6RiGYnR58twctyuxFrfSjrkxWlfyIR6caDM1VMKPDtIfFmkL311yaKf0+
	btDqoTeTCiVHEwQcJDoO71EAFIdRoFDHsSa867m7gI1Jfv4pM6tKLuVwB28UKvm+lqXozmmA7zD
	qKCxaMiTQyiZt+94ZhSqVcwJ9P6SWuiy8Mf2HeNWG3jhrsCOBLKgY+acwyE=
X-Received: by 2002:a05:620a:4714:b0:7e8:3fbd:4190 with SMTP id af79cd13be357-813bdf6a9c8mr829190285a.2.1757351564613;
        Mon, 08 Sep 2025 10:12:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwMZsEl4SQNKbeMqNXOZc4NyVlPYCi+ENDx/Vjfad/o+tQQ/qJhvSwRqRuWnLNVWOHla1Uqg==
X-Received: by 2002:a05:620a:4714:b0:7e8:3fbd:4190 with SMTP id af79cd13be357-813bdf6a9c8mr829186285a.2.1757351564056;
        Mon, 08 Sep 2025 10:12:44 -0700 (PDT)
Received: from x1 ([2600:382:8507:870e:b6f8:ee72:4f09:a16a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8138798dfcesm600461485a.34.2025.09.08.10.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 10:12:43 -0700 (PDT)
Date: Mon, 8 Sep 2025 13:12:41 -0400
From: Brian Masney <bmasney@redhat.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: scmi: migrate round_rate() to determine_rate()
Message-ID: <aL8Oifz8zR9nJ_Wg@x1>
References: <20250827-clk-scmi-round-rate-v2-1-3782a50835ed@redhat.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250827-clk-scmi-round-rate-v2-1-3782a50835ed@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1FetjG_kTQPhwl7NJFOxfBBwFT1yXa30cDfE-gqAK8E_1757351565
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 27, 2025 at 01:12:07PM -0400, Brian Masney wrote:
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
> Signed-off-by: Brian Masney <bmasney@redhat.com>

I included this patch in this pull request to Stephen:
https://lore.kernel.org/linux-clk/aL8MXYrR5uoBa4cB@x1/T/#u

Brian

