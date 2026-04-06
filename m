Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BF1301717
	for <arm-scmi@vger.kernel.org>; Mon,  6 Apr 2026 15:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775489919; cv=none; b=YCZ9MkUtfnrwJp/gJJ9fAh8Kgx8aCmqXhehkpVVA+FajNcuceMnrx32Dgri2o6Nphc6S2khmqDUNGbYEvXolEgT5SSNi6dvNUaQgmuVaV25pTGVoYkVd1VBw46BPa31HtEwpnz816+OipvPW7SpYSza26wYpvgO9ZvecqekWj4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775489919; c=relaxed/simple;
	bh=49+ciCmPwibB8Kivb7U6s7rioMxVkCMH2tw+szOi/dI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=uIrNbWYcUJavJPTR+Wuj1Wa6Yr4W2Ekdd5WKBPz72XmbqkrOgPKdyKnwr4aVhiiOzbIkov4rGLjUUQPhzdU5H2k6yR910tHDMccP0nTYiDrTysDTffZedpwWn9RNdg1Qq7ANlhdwAOehSUwJeg4DjY8IaDibDF4MYJ4a2ZsUZz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hE+7lcrb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hE+7lcrb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775489915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v5Zet8J4rK0+1tdnDTvli0Ek2YpzZgM64BeAXaz+iIs=;
	b=hE+7lcrbCIrCYPnUlAOayIuHYA0ZZAqTbwNHHNawG47tsx7WuJYbcqTJ7Vf3SkjK8Rk5Ya
	KUG52t90s2y+XWkJLQX4y9DqPCYVWsDHz3r3Hpi2Is47QQftsVW6gpoAsw3IxrBvPZKoBT
	lyd5e2DVpLeTJAffyTD7Y+bHeDDxdtY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-DgFvUEEjNHq3vnNF0Rf3Qg-1; Mon, 06 Apr 2026 11:38:34 -0400
X-MC-Unique: DgFvUEEjNHq3vnNF0Rf3Qg-1
X-Mimecast-MFC-AGG-ID: DgFvUEEjNHq3vnNF0Rf3Qg_1775489914
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d7522f0ecdso238084185a.3
        for <arm-scmi@vger.kernel.org>; Mon, 06 Apr 2026 08:38:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775489914; x=1776094714;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5Zet8J4rK0+1tdnDTvli0Ek2YpzZgM64BeAXaz+iIs=;
        b=j63T054R9B7SCJeyi/xR+V4LClYI8bqo4Ly09WIsnpRxZLItoB1uQYe+PKYtxHK/9A
         hlo1oz2Ss7MHcWlqU/LMfl4I7Lw8MjjRAePhdXSFu4dJ8eO1qAeajOpjYZa3gMBSmye/
         l8jzhUSku8UHx5kEiA2qHinE6myOWVpdwApTgX9vbuwNXRbCEQfCGiLlxcDH18Nh2bfJ
         KPGGu3bryTxPKFPMvQxZdWhsRH9jRFgv6R6cb0lM5w2Q6UWu3eD1YoaFE+S2Y1j5Msu7
         eZQ6e5gqsWm/6ZCiZfyGDi/TM6NmaJh96UA9mBUl0Oqi3M8AU58cEIUj8iFKFH7PV0FR
         NZ7A==
X-Forwarded-Encrypted: i=1; AJvYcCV8JPITdjHwDUP1CnRl4NXoGoE1YFNq7e24KebZv9Z7btkhxWJLfUlQXWD8sHZ6Yz2UUpZeX3ex8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4Lh8RfUIJrAZ7n5kBr+EJQ1Fhh0CgQd2pqVEBpDQ/SEzrK6d1
	IY5o2dmhsRSbOxS44z3WHxD86bKXTU6W40ZQ7c5OciXy9ND+pq7+hccw4CiM80yXUYIOHF4RSvm
	fn3ZVmgeEiVgrrJEaKAi98BWfqPR7AfJGsxl/96UvjaSbl5XVoqC8qMMrSjA1
X-Gm-Gg: AeBDiesQ3KqALybYzTmvaWDKZLC7YqtKqp1IYHoxiyBcRhWwz8EA0t9iryJyzXa5i8X
	Ki7g19LlywjzehaPJQW+Btb+L43a1PjO3nshzEP2FfzkuOFSSSXVUEUW+AGx3GxdnbiJDxGa8cF
	dhDF0ceD8ngKkHE7bsEmmIZ7mxKt3PrNfs8clkPxQAPmdLJzCVdfpP2sU7UDabxjMTBzgorqoNI
	B7mFH35EG1YTCHsZ8UemvEFB9Z1EZqmOd4KoMh5JP304H62jJxsDWYPlc9Em285ivlH2z8avC2r
	FYSUZ90uFeunuNXKw/Si5GG93yHGAxIf9C6IDTmYbEZhFzC9jSNHzAEG/n40LG/iBPshDjp9xo9
	9z3mp3NKBPuMn11Lo2f1dvzH36oUDbN/j+TKuMRzeRv9hs8OdYX5zJ6ra
X-Received: by 2002:a05:620a:4490:b0:8cf:d510:3b5f with SMTP id af79cd13be357-8d41c8a82a0mr1883134585a.31.1775489913883;
        Mon, 06 Apr 2026 08:38:33 -0700 (PDT)
X-Received: by 2002:a05:620a:4490:b0:8cf:d510:3b5f with SMTP id af79cd13be357-8d41c8a82a0mr1883128785a.31.1775489913310;
        Mon, 06 Apr 2026 08:38:33 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d2a5393a07sm1099166585a.4.2026.04.06.08.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 08:38:32 -0700 (PDT)
Date: Mon, 6 Apr 2026 11:38:30 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC 0/2] clk: scmi: =?utf-8?Q?D?=
 =?utf-8?Q?T_support_for_SCMI_clock_rate_rounding_modes_=28per=E2=80=91clo?=
 =?utf-8?Q?ck?= policy)
Message-ID: <adPTdg4RJpkjc4Cg@redhat.com>
References: <20260306-scmi-clk-round-v1-0-61e2a5df9051@nxp.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260306-scmi-clk-round-v1-0-61e2a5df9051@nxp.com>
User-Agent: Mutt/2.3.0 (2026-01-25)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WKrKuHSsMIJ5lRHHwjdL5MsDVt-Zc0E-LRyJrPR8xqQ_1775489914
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Peng,

On Fri, Mar 06, 2026 at 02:20:11PM +0800, Peng Fan (OSS) wrote:
> The ARM SCMI specification (DEN0056E) defines rounding‑mode flags for the
> CLOCK_RATE_SET command, allowing a client to request that the firmware
> round a requested clock rate down, up, or autonomously choose the
> closest achievable rate.
> This series introduces DT support in the SCMI clock provider to carry a
> per‑clock rounding policy from the device tree into the SCMI protocol.
> 
> Patch 1 adds dt‑bindings constants for rounding modes:
> ROUND_DOWN, ROUND_UP, ROUND_AUTO.
> 
> Patch 2 extends the SCMI clock provider to optionally support
> "#clock-cells = <2>", where the second cell encodes the rounding mode.
> The first consumer that references a given clock latches the per‑clock
> policy. Subsequent consumers of the same clock must specify the same
> mode; otherwise, the request is rejected to avoid non‑deterministic
> behavior. The selected mode is passed through to the SCMI Clock protocol
> and mapped to the corresponding CLOCK_SET_* flag.
> 
> Patch 2 includes changes to drivers/clk/clk-scmi.c and drivers/firmware
> arm_scmi/clock.c, it is hard to separate the changes without breaking,
> so I put the changes in one patch.
> 
> This design adopts a per‑clock policy model, not per‑consumer. The rounding
> mode is applied by the provider per clock (index).
> All consumers of the same clock must agree on the rounding mode.
> Conflicting per‑consumer requests for the same clock are invalid and
> are rejected during phandle translation.
> 
> This avoids silent clobbering and preserves deterministic behavior.
> 
> Existing device trees using #clock-cells = <1> continue to work and
> default to ROUND_DOWN, exactly as before.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

My high level feedback about this:

1) Since you are making changes to the DT schema for the clock-cells,
   does the SCMI DT schema document also need to be updated to allow
   clock-cells to be 1 or 2?

2) For the ROUND_XXX constants, I would prefix them with something
   since the existing ROUND names are fairly generic sounding. Maybe
   CLK_SCMI_?

Brian

