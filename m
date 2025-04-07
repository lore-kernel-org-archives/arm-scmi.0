Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEED801
	for <arm-scmi@vger.kernel.org>; Mon,  7 Apr 2025 23:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744068707; cv=none; b=hWRY/JNWM+0JaDJMJeeWIvfI1keQ6iFBGQgjjCTd9De+WxwBjmFK5WK/QHgUa1IXt9mZNzBL32LnxGFqBM0B1I6ms3HZZ3oAwYZVAu39wqmN9pDx8e29Wgiacjx86uzlexd0KjNnjiQJ+VUO/vkJBmuQpEALqN0Gu3fmnH0kxEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744068707; c=relaxed/simple;
	bh=as3FcW2B1DwNfm7A2cjGjY4esBnypPyZDLwZpgcHwzk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=POrzE8apHLckcZwFniuf7fRixO7JZOOIxNW1A1ORpU8j3MdQrBIU/Bhg7lhbg2EuDg4i3C55wCEWyVAnwfLjhFhD5HFMa411K0KyLUUky71HhlN0JcTxMYogYU3rO/q9RVBXFoG7YAOsmO5lBtJMUVREGOheV/zWF9Y1VEK+rOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZqwVH9TC; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZqwVH9TC"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-af590aea813so4560264a12.0
        for <arm-scmi@vger.kernel.org>; Mon, 07 Apr 2025 16:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744068703; x=1744673503; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dFh386Fk5y8kD7F2+x7hbidZ/L4etDEbeEo58Bwv6PM=;
        b=ZqwVH9TCmy/k6ypWVolLgD0ui1hsdp0vK+SCh6/ZqJO58Z167y/5sEFdmDwpBcCB9N
         zLaXW/YN+lQXkVvrTT+FM8YDjaQGAAx5ZnglZ0iPakSc2wnZpZYE+wXbC4epjirzfDQA
         kc5v7m5RySj1esivI+9UioBN+BcAuAqzGFknqhQNDgV147mUECT6/ufFSliKIiUf2EBg
         072OXsIwNyyCI2gXp8g42FdGkS+CZQDhIef3qT4+hfJXY0FLSSjtK/U8/qJTt4tDSgIg
         FUKgvafdZJ4dWUF/widkNi3RUj7Cn97uLT+FekbE5+9a+TbLHCHNGSNlYvHbdpCb2pmm
         if3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744068703; x=1744673503;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dFh386Fk5y8kD7F2+x7hbidZ/L4etDEbeEo58Bwv6PM=;
        b=oJ3x0t8s5MyQpTrUa3jdS+I4hLLF1XwO05q7Fufbp9EJTYJJ8eNUBndTUVDvuf2dUg
         JA7NaggKlrRbZe47fY8btD78DODloJMunoAOCNWMliYEJ05smcgxKHSCEqHEnDgfzbv7
         oWpq9ZETxBF1p15BN+0OKH7edlPkUUmyCAa7GfDpXj1DhEH7nqoyKuar0lomv/pg1BKS
         0Ynx0L90PFhyJwpjUVziRHkjyRJJjaR8cL9h6njWlIyeLG68p1vxfj7POgDrYIHmlRCe
         vXgTbHeOrIcuYRV/l+EBZyStn+Ns1vv4gN3CQlC2OaKc638yH7sk/7tko/PXkve5yWoZ
         9wPA==
X-Gm-Message-State: AOJu0YzSibGkvqjeJX1zacI+v8Yzfp8+nCPMzmEcScmoJ79n6q7rz45x
	5eBj2t9epkxKCImQwZCRP1Ga57XsnJa/GWWVs2d8p+OaAqZ9nU3lPB8RtiVdmuY=
X-Gm-Gg: ASbGncvjgqrLgkWsj/AWKIZJmmWmSen40ZpHPmmWGB0GAG/AG7PsfzfyZBPoHUSG9w9
	Vua1du5FWz0hJhCMTW9HTnRInDYyxu/Pr0w/YjF4Nng/0dDYicLzfy+GOTMAJ61PcjB357G/J2p
	7hvxr2qMWYHMBl3Xzr/PHmymK7O6kh1n5XtwyobYfsccZeIdlFsk1vOqOPJKciKdQd5uAnB26OX
	ivczk/F/U8VMCO8kiJZtpK1fRFvsILPoC7x6e4a5X/DwWfPwrTETmfbx6aiVbxJvNUBi3/hDMU6
	uQ0v5OIoatAAa1yhN45uXy5JkBiqUMS81DM1np6QNWE=
X-Google-Smtp-Source: AGHT+IFNUIU7AvSSX9P4uHDES7JGlMKN7ji6NOj7M4buYD2WcR/tSUM7QadyKMneNKLfp0O8NmIDFg==
X-Received: by 2002:a17:90b:1f83:b0:2f9:d0cd:3403 with SMTP id 98e67ed59e1d1-306d0d03260mr1874966a91.16.1744068702863;
        Mon, 07 Apr 2025 16:31:42 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306cb65c1fasm1793895a91.2.2025.04.07.16.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 16:31:42 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: "cristian.marussi@arm.com" <cristian.marussi@arm.com>,
 "souvik.chakravarty@arm.com" <souvik.chakravarty@arm.com>, Sudeep Holla
 <sudeep.holla@arm.com>, Ulf Hansson <ulf.hansson@linaro.org> 
Cc: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>, Dhruva Gole
 <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>
Subject: mixing SCMI and PSCI power domain hierarchy
Date: Mon, 07 Apr 2025 16:31:41 -0700
Message-ID: <7hecy3h7ky.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hello SCMI folks,

I'm trying to figure out how to model a power-domain hierarchy when
there is a mixture of SCMI and PSCI domains.

Let's say I have a top-level PD, managed by PSCI, but inside it it has
both a CPU cluster (with cluster & CPU PDs controlled by PSCI) as well
as some other sub-domains for leaf devices that are controlled by SCMI.
A simplified version looks something like this:

SOC
 |
 |- TOP1_PD (PSCI)
     |
     |-- LEAF1_PD (SCMI)
     |-- LEAF2_PD (SCMI)
     |
     \-- CLUSTER_PD (PSCI)
         |
         |-- CPU1_PD (PSCI)
         \-- CPU2_PD (PSCI)

             
So the main question is: how do I describe the SCMI part of this today
in DT?  Currently, I have something like this for the SCMI-controlled
PDs:

	scmi_pds: protocol@11 {
		reg = <0x11>;
		#power-domain-cells = <1>;
		bootph-all;
	};

and the leaf devices under LEAF1_PD and LEAF2_PD would have
`power-domains = <&scmi_pds N>` properties, indicating their PD is
managed by SCMI.  That part works fine.  And I'm also able to model the
CPU PDs and CLUSTER_PD just fine, including using
domain-idle-states... (Hi Ulf ;)

But... how do I describe the relationship of this hierarchy?  In
particular, when the SCMI-controlled PDs are actually subdomains of a
top-level, non-SCMI PD.  I tried adding `power-domains = <&TOP1_PD>`
inside the scmi_pds node, but that property seems to be ignored.  So it
seems that currently it has not been considered to have SCMI PDs as
sub-domains of other PDs.  Is that correct?  Is this something anyone
else has considered adding?

The hierarchy I describe above is not made up, it's for the TI AM62L
SoC, which is in the process of being upstreamed[1], and we're trying to
figure out the proper way to describe the power domain hierarchy of this
SoC in a way that can support the multiple low-power idle states that
the SoC family plans to support.

All suggestions, redirections, corrections welcome!

Thanks,

Kevin

[1]
https://lore.kernel.org/r/20250109-am62lx-v3-0-ef171e789527@ti.com
