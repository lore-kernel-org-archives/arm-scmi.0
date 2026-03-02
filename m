Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B740A42EEB0
	for <arm-scmi@vger.kernel.org>; Mon,  2 Mar 2026 17:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772471487; cv=none; b=On6Ge0+M9O6i+3O9zkvIkcg7otSJD2j48yYtbcOz9HbVtRPpdqYfNkq0V3SzApJdMuryALFKx60Y2tasnk2ZFhEU5ql84A9fF6qfm7S5eIqkfUVV1coP24AsJbKiubITVbUhB0g/hIs+dwKFZBbLcQcSHfWPeYhHoZdP5q6AAJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772471487; c=relaxed/simple;
	bh=Lds6rOZ7X/3g6xC/UqVG/xiT2+rkqLBII+J5UpiKeEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=aXPcxXoIal34Qs+wLLpFR/9RcS+2uKb6eApeMS3cOVUml8j/oQ7o1SM/1L/UB9+r6XoNcL55hPq3mw2QcmaDiplMbsRv1AeTzE5KE8VcigTNLjMfwD/tiGTSrpQhNxms6v7PKhVgHPOD/7M9J+PJCHvpFj4I9yXeZ0GzUmNB01c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A3ZOVilY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A3ZOVilY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772471480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dTT0P65qbG5CTQSoBKTT9PgPPtpnw8OX1DWXnZ+KTiU=;
	b=A3ZOVilY2d98ppWsTwrVLfdOqYhWl9KF8Ob1FvP3OK5Xx6l6XNSrwbdK4qFpggrGLeONwf
	w3dTZLE7wuXyDYpFeM7KfPXYWoTRZKiTvVIsPILFjBEwQ9RV0T9chOUdy3UodMereadq9G
	g/VseJjy02GGvOJypLe41tUKM/BgJxM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-uQ70U8ayO8meYf61BtKO3w-1; Mon, 02 Mar 2026 12:11:19 -0500
X-MC-Unique: uQ70U8ayO8meYf61BtKO3w-1
X-Mimecast-MFC-AGG-ID: uQ70U8ayO8meYf61BtKO3w_1772471479
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cbb8040f48so3924191585a.0
        for <arm-scmi@vger.kernel.org>; Mon, 02 Mar 2026 09:11:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772471479; x=1773076279;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dTT0P65qbG5CTQSoBKTT9PgPPtpnw8OX1DWXnZ+KTiU=;
        b=xGA6IjyT9/oCzd54+REhcEdkS06rcBh5rOzHTG70bMZg7hG2CNfccmLdUVKpJ8ouWs
         lY81ZN4LxqWD0rrp98+uDkF1lADLaP3XHAA9YgDIdBowMC0Wp7u4738/Ph3dhUgQUv3+
         ZtMnJP0TfEIM/oZUphd5EWcgXkbSk2S08JaiK2VvpZAbK5nBQyaKwfQw6PFrD2cwGYFU
         yuqrTVktXPnAEaoKzdxsklu8CnNoaHZRL6plP+McAT0Rgs4TvBtbM9g9n41ieu5C8bF1
         sLTTMdU3lLdrO4GxWydU0fy/StDEA6+gBwEkCcqb/oELj6npEWSPEBpDn7BYUpoNZ6CX
         eAPw==
X-Forwarded-Encrypted: i=1; AJvYcCUADj7tGtggAM6+LhgSBq8kt3hARQ00pg9da1WKwrPtxCpJM2U6r8nA+Ko/CYMy8WL0fhRRnr8kFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrxabVm6BH2+XBhQQ3tbwjkAbfZ9qRd3XriWlPnYJ0tVsTxATk
	E/9eiMZCX/QKPDdcgoGwecUESmuFBu0UuS8HU2hryxLGQXjpDiMdAgTKWfr8htm/rrWMGDm8Z0x
	5cQW13d6E1wwTSoIoI6Zua8x7PtZ3bGK/Bh2PMU4RxTq5A2w6pSc4LAiz+9oZ
X-Gm-Gg: ATEYQzzg9W7ToFvkJDDcjS50s0UiRf8/ZruG4hammA/MlKBqQOBshQbRzojSKUXcAWY
	s9tyac4dCH3h+l5LvNRNiBAK7uu2h+TzEqpV8FfZYrKPc2WcGppNawOsRHrQCsCT2DxsOWX027q
	5RIEXqcvb5Dyub/WJmVJpuFm5yyp3CuBysckjjZdPlkdkGK/Vr82KZGZ7FSZcoD2M9LexOPCNp9
	awEHOLij+FLFSsEDZDxLJkyFZbcFrfml43axgaogR2m1gxb/iAsrmz4hwG+sMBknjxIhR3XJfyu
	93KTp69tIQKjsmoJ2TCYDrZcgKTZ50BIJGIuyutdifTLNBHe0/Jhp3G0zvjYiLnPUQAOg0M0Mzf
	aN7nY0b6npUFnj7EY0cpiTg8NmZoHas6CtK+YFtMK5kcz62oUTKquWtJV
X-Received: by 2002:a05:620a:28d6:b0:8c9:fb0e:ca43 with SMTP id af79cd13be357-8cbc8deb20fmr1599861185a.24.1772471478988;
        Mon, 02 Mar 2026 09:11:18 -0800 (PST)
X-Received: by 2002:a05:620a:28d6:b0:8c9:fb0e:ca43 with SMTP id af79cd13be357-8cbc8deb20fmr1599855585a.24.1772471478512;
        Mon, 02 Mar 2026 09:11:18 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf6534f3sm1172998185a.5.2026.03.02.09.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 09:11:17 -0800 (PST)
Date: Mon, 2 Mar 2026 12:11:16 -0500
From: Brian Masney <bmasney@redhat.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 02/11] clk: scmi: Use new determine_rate clock operation
Message-ID: <aaXEtNilpRYhwmYc@redhat.com>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-3-cristian.marussi@arm.com>
 <aaI9JBwWaMmfBbd/@shlinux89>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <aaI9JBwWaMmfBbd/@shlinux89>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NWi-2PzPbJRp1NbAv0Z_Xi2Dsc1iChzz3sFQKasDSxc_1772471479
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 28, 2026 at 08:56:04AM +0800, Peng Fan wrote:
> On Fri, Feb 27, 2026 at 03:32:16PM +0000, Cristian Marussi wrote:
> >Use the Clock protocol layer determine_rate logic to calculate the closest
> >rate that can be supported by a specific clock.
> >
> >No functional change.
> >
> >Cc: Brian Masney <bmasney@redhat.com>
> >Cc: Michael Turquette <mturquette@baylibre.com>
> >Cc: Stephen Boyd <sboyd@kernel.org>
> >Cc: linux-clk@vger.kernel.org
> >Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> >---
> >Note that the calculation logic in the protocol layer is exactly the same
> >as it wes here.
> >
> >@Brian I suppose once your CLK_ROUNDING_FW_MANAGED sereis is merged I can flag
> >such SCMI clocks.
> 
> Per my reading of Brain's thread, if ->determine_rate exists,
> ->determine_rate() will be used.
> 
>  	} else if (core->ops->determine_rate) {
>  		return core->ops->determine_rate(core->hw, req);
> +	} else if (clk_is_rounding_fw_managed(core)) {
> +		return 0;
> 
> So unless update scmi_clk_determine_rate() to something:
> --------
> if (clk & CLK_ROUNDING_FW_MANAGED)
> 	return 0;
> 
> return scmi_proto_clk_ops->determine_rate(clk->ph, clk->id, &req->rate);
> --------
> 
> It maybe better to update Brain's patch to move clk_is_rounding_fw_managed()
> above the check of core->ops->determine_rate().

The clk framework has some basic sanity checks in place that are called
during device probe to ensure that various ops are configured properly. I
could add a check that if CLK_ROUNDING_FW_MANAGED [*] is set, and a
determine_rate() op is set, then it gives an error.

[*] Note: I am tentatively planning to rename that to CLK_ROUNDING_NOOP
in v2 in about a week.

Brian

