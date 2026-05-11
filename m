Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5753FD135
	for <arm-scmi@vger.kernel.org>; Mon, 11 May 2026 14:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778510699; cv=none; b=EJjoEsW6bxqZRq4YeOXdEd5RwHgZziDUtDrTZdt7bQI9Ib/6kzOcVmns9bji/HF5ZqLZnAQWsTPCw9XtNROgjAA18vBfQGsWKSYnZNXcP+7eey96HuKIn3KKahFq1EZxof8bZT+HDFkJNBcdmFjGFcKujt2tZsp2kgtr8tt9aNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778510699; c=relaxed/simple;
	bh=MFiTN0Yfk5929QM8ZG3xqo3c4QVdL3MMPUViXHHZdag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=BB/4i7BIH3kXKSiowROeU3ZSkBMIuph1f39lWaoiI4a3lHBOQz69Q8HjgwXHDeQlLFbieMVKQ16kXNn3myItIV1ud0gMY3ZUcgnVh5j47QcFv/8GRLql99DBp7dhZl6uoi/kAurTaxsAMOU1b+xo6zCaCkZv3sBzZ90dx210K6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I+5KAHlp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I+5KAHlp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778510697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FU31spM6LjzcyHuFHmDris1Hu7nsA7C7uZ0OzEouoRE=;
	b=I+5KAHlp8+yv3JdACpupEtPAaer5R3en+mJ5BW/QdJNmNdp/dF+KS4Xvqg2mVuvP4GjZIK
	F3hncqN9/CNuKLmGENGZFgmGZ1aX9wU3DAkrM7jsd5Hpq7GpBIn1Rf1IOuARddwbWRXxBC
	9bF2S0r8xCn2RP85urZgf4pOBTgBBQg=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-NSTUiJ4PNYyFDnraH0WnSQ-1; Mon, 11 May 2026 10:44:55 -0400
X-MC-Unique: NSTUiJ4PNYyFDnraH0WnSQ-1
X-Mimecast-MFC-AGG-ID: NSTUiJ4PNYyFDnraH0WnSQ_1778510695
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b220c72bbso74211891cf.1
        for <arm-scmi@vger.kernel.org>; Mon, 11 May 2026 07:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510695; x=1779115495;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FU31spM6LjzcyHuFHmDris1Hu7nsA7C7uZ0OzEouoRE=;
        b=TInRdwgwyms8C7fdyDxPLU/0TPSSSm/Fl/Pxmto+zyn8IPQrR/6hmVr2kiL5JGrdCR
         404K2Tk+Mk+/QQoiHLUhzdyyM5ZY0SzVYq3xpT+JI50UMWKoOJAFhwEOH3OQB857jxFY
         i+uAJkWVzxeaLufRsokOue4ErXIft10s+4ABelwL1REDkueBukq3oQbhY8RtbK4BiPnU
         ypns/kFH1uRA6at28exxmE8nLZYlHhFlp20qk1piMjqodUQQMWgrpDBAdskUziNxeiGf
         1OotEy3DVAZ84aIMjX/HfEZFy8I+/+0esIrlqJepskwR/8tLsllXPE7BWENO/6uNckKW
         Y7fg==
X-Forwarded-Encrypted: i=1; AFNElJ/gz6HP44QUOjWHrQYCM/zdGWSYWl/j5zsWE7Rk6QQSRWPPFzMNNbs4WdrBbNFRaE7Clg1JMX+0Yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDagJtqHULmi04Hh2AeOgqq+942+Jq3YbAAG/hKhDYtsEJgKjb
	CunX4dtRlEgwbq8HOAC62BkBwf3DcpMnaLl3NqdxrZripNQxpylPqTECP3biaz0ABtRRvySU1Rp
	1JPqBSY0qHjJH3an2uJ2K3sdVlHmPt/HimL3B3hmbDm23S9yGP6nxe2zre3GL
X-Gm-Gg: Acq92OHWB4iCvC9+WdVvMkC6eXEaMuhnzcbt4C+jA2yzuZ1zLs+xvhHhMjIjDYyKrRn
	D6yPpbk0H305TCCcLECWkZuNz/0d+z9sJzW2CzzitmpxM02ojo1+v3S+blQJ607emNZPg1yrsE0
	jFioHF+Zve3+KoGU4yP5Oe23tuNaydSbH2nLq6iZvOVIKl7ErCneaic28jd5tQew76xc/38EYJV
	rEFiKoCKDZKuw1c4faoZXT+OwT6HEcV/BaP99i6GRj6z0qUQwNP+/tvwzQ4OMmI9reRcmRf8lVc
	Kdqvt8DhQcLDCVg6biLtb1TEsIAd9t0kGYLKVb5dFxzCO/wkL0OiHjzkbS0grffgNfeQMNcMuDM
	cvVsYsy2V8X+XQgTEECCjU8Cknfm9r2Igm1LnxTmvK9C9ovFRvO6YFm2q
X-Received: by 2002:a05:622a:550e:b0:50d:6b06:a453 with SMTP id d75a77b69052e-51461e4fdcfmr344798831cf.18.1778510694819;
        Mon, 11 May 2026 07:44:54 -0700 (PDT)
X-Received: by 2002:a05:622a:550e:b0:50d:6b06:a453 with SMTP id d75a77b69052e-51461e4fdcfmr344798201cf.18.1778510694263;
        Mon, 11 May 2026 07:44:54 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf39c82420sm105737256d6.33.2026.05.11.07.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:44:53 -0700 (PDT)
Date: Mon, 11 May 2026 10:44:51 -0400
From: Brian Masney <bmasney@redhat.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, peng.fan@oss.nxp.com,
	michal.simek@amd.com, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 03/15] clk: scmi: Use new determine_rate clock
 operation
Message-ID: <agHrY52NvBCWA2fi@redhat.com>
References: <20260508153300.2224715-1-cristian.marussi@arm.com>
 <20260508153300.2224715-4-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260508153300.2224715-4-cristian.marussi@arm.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: l8VTblnyO93lcGMjBiRm0tEqu0kY75XtKScrazw1ZH4_1778510695
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 08, 2026 at 04:32:48PM +0100, Cristian Marussi wrote:
> Use the Clock protocol layer determine_rate logic to calculate the closest
> rate that can be supported by a specific clock.
> 
> No functional change.
> 
> Cc: Brian Masney <bmasney@redhat.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

