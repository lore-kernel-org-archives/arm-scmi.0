Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C94F305047
	for <arm-scmi@vger.kernel.org>; Tue, 28 Apr 2026 20:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777408711; cv=none; b=sFUohCUMT/RJp4i2jI5PTx5B9vsKowzEwTdKLyzgD7XUM91RuF0f9+jK5v16qquNRmKtZ0kQOJYfImhnBisY3Q1JdqyihFGoB304xCbzXM57LIuWSKfl3wDc9hnDvk3aJR2rhY1TJpR2F2ZD+v5z+HqdoQh03l0SCcDP1bnuHUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777408711; c=relaxed/simple;
	bh=pDmse3ikNE1vwAD5KYJ0YIqBXCY+TX8S31byHNChdqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=QRvLBS5s6TdQpi7YzUyu/hGE92ImG9YYUptKHzKqQ2otJ5QLMdUo7VItQRORWufyLhQ69I0FOojJOPhHtBad8EeDqCgOReFjChc30qwP3hkkB/0thFBYEHL4Nl/nfHhIuS4/3sxHYKLcLgRtWTc4fzrr6LI3GjHyL/2ThmOb8tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V9YpFNj7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V9YpFNj7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777408709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b6d3l70lYqSnvJpMpEGZJLw4o8TwsL0Q+e8A9O8Mofs=;
	b=V9YpFNj7NGViHZJoAbmz5tpWQt77RUyGBSnHolY4IyUXf8NBhs+0QcQNVBLUacvQUpvdMp
	5eycBjG6iuYb+zLWGR9zza0Fy1hvIi9D1MOWKmwzjbcyRJKlUCWuJg9waxupndsCGWhfCt
	Ye02hBE0qzZJiao9X2Lk3X2MfEw0nvw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-SDXDgBM4Om6tcJ8HC9VIjA-1; Tue, 28 Apr 2026 16:38:26 -0400
X-MC-Unique: SDXDgBM4Om6tcJ8HC9VIjA-1
X-Mimecast-MFC-AGG-ID: SDXDgBM4Om6tcJ8HC9VIjA_1777408705
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8954803bd74so109904626d6.0
        for <arm-scmi@vger.kernel.org>; Tue, 28 Apr 2026 13:38:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777408705; x=1778013505;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b6d3l70lYqSnvJpMpEGZJLw4o8TwsL0Q+e8A9O8Mofs=;
        b=X50NtY/OqK3SQwiPQUSPlGV/QG3uCQ+rIdDdEetPHkrFsuP13itM94LWAJ/KRoRD1i
         5HymWpQDNvB6UVS7KS8taG5eTWpGNQplGoNR5iF1Xlb0/4baHVjs8X137TZt4q52zZsV
         GwoTIybx1tMUxR7ql8YRekhlLLV83wflB3+6gVpE6srRb7On4XtVRUeeiAfV5E02HD/Y
         YPCjKZwSIdlO8RtKSk3xwl39Y2yLXzDA+uRKNzqNzSTEqvCXnZxaXm6PuXUnsKhexj8w
         k7xjZxtOiGlHGEoxe2Jn4UVwEjvxy+eDNIAj7JVI6TqoAGWKdes03HL2Gq9RY3+fsqyK
         vmsQ==
X-Forwarded-Encrypted: i=1; AFNElJ9JUAcG8wqN3pzo5EWblYbmkGYJanw2n31ZNhoUMku8CWlIKXx2JVmH5/6hvyrQBdkMp2jopcXqEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAka9t5vp5LZVIVTEYgBwG9Egx3ApZbsrvfCTSAlBrtFN93cyz
	xbgAfHJANwCyhR22atHH0eqVi+mvFk18Z9bNkcJn7ndvvMMc9/vYZn3VsXZ9i8BT/4u/JktIcOG
	SCHA3rnp8XcWY259EenjIZMUpNslyX6CVNcPxAtlHy5iBPNoEFMvicoiouBOI
X-Gm-Gg: AeBDiesKQ7z4d2BmheZOgHU1NWsTzCvWh9XVZ2607ooe2Base+7wu10vCLX20p+Xd7v
	d5i44xr8f19ttcVLjVw88rzXCQC0vIjvEOXHKNdk0ymaYy272tMEtpVaENJq/pzp+YJ+nHQ0pC5
	r959lYsKmdk6fIjnK9SjtOCVBSZF7f9PKpDsajCcK+mcL91P1NsfkO72pgTcXu/SJI1Yz/AklSH
	wAL90O0/aoUVJ/mKN2sIsSDSCJuc1l9zJXlPFEQA/Nw6yLWv4cDc54kU9ruzRU2uCvGnYYyXhDa
	atDIJ9gsXhfAdf9OUqX2IsA2IWtXeBnAqapDTJXUcRuNfCF6wKGZ95iDcbR4PCgcwXGkbyeQwkz
	1nK3uUAQTeGQDAx0n+BOmywfHZnRdkZY=
X-Received: by 2002:a05:6214:318d:b0:8ac:a914:c2da with SMTP id 6a1803df08f44-8b3edcea9a6mr22408086d6.2.1777408705541;
        Tue, 28 Apr 2026 13:38:25 -0700 (PDT)
X-Received: by 2002:a05:6214:318d:b0:8ac:a914:c2da with SMTP id 6a1803df08f44-8b3edcea9a6mr22407456d6.2.1777408705068;
        Tue, 28 Apr 2026 13:38:25 -0700 (PDT)
Received: from redhat.com ([2600:382:8104:bdc6:d862:7b9c:1d01:62e0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ef7ef50fsm699056d6.32.2026.04.28.13.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 13:38:24 -0700 (PDT)
Date: Tue, 28 Apr 2026 16:38:19 -0400
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/12] clk: add new flag CLK_ROUNDING_NOOP
Message-ID: <afEau1Ny-7RTz4vc@redhat.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lKKBVmpkIOuHbRylO8I7sTPJnAn3NRtbuug3BzItQTg_1777408705
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

On Mon, Mar 09, 2026 at 10:38:39AM -0400, Brian Masney wrote:
> There are some clocks where the determine_rate clk op is just an empty
> function that returns 0. This can be either because the rounding is
> managed by the firmware, or the clock is capable of any rate. Add a
> new flag for these type of clocks, and update the clk core so that the
> determine_rate() clk op is not required when this flag is set.
> 
> Based on discussions with Stephen at Linux Plumbers Conference, he
> suggested adding a flag for this particular case. So let's add a new
> flag, and update the clk core so that the determine_rate() clk op is
> not required when this flag is set.
> 
> This series adds the flag, some kunit tests, and updates all of the
> relevant drivers under drivers/clk to use the new flag.
> 
> Once this is merged, and in Linus's tree, I can update the few remaining
> clk drivers that are outside of drivers/clk via those subsystems at a
> later time.
> 
> Merge Strategy
> --------------
> All of this needs to be directly merged by Stephen as one series into
> his tree. Subsystem maintainers: please leave a Reviewed-by or Acked-by.
> To reduce the noise, I am only CCing people on their respective drivers.
> 
> Note this series depends on 3 previously-posted patches in this git pull
> to Stephen for v7.1.
> https://lore.kernel.org/linux-clk/aZuK4-QJCXUeSxtL@redhat.com/
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

We talked about this change at LPC in Tokyo, and you were the one that
suggested adding a new flag. I initially wanted to add a new shared noop
function to drivers/clk/clk.c. This series implements everything we
talked about in person. The only thing that we didn't talk about in
person was the name of this new flag.

Anyways, let me know if you are interested in this change, and if you
want any changes. If there's no changes then would it be possible to
pick this up?

Thanks,
Brian

