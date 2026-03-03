Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBEF20A5C4
	for <arm-scmi@vger.kernel.org>; Tue,  3 Mar 2026 04:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772511656; cv=none; b=DsTPxqyMlZOiMw9IlYNf5pQ2CfzSaRTQ6b8d6KxDzYKX4Fv9IpcBdbeqtm8xsftn7l+xtT5Vqy+/3oMw3Cmohrg94C8SbuqpEz1C2Tu55v1ivsgDZjAtc4CenPvW3NAvoG+FjhwdbCFccvF7/MZHCPs6gHKVLmj02L2ehnv1rH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772511656; c=relaxed/simple;
	bh=ZlweBBkTC0OCv962O061FeSDYVEi9pTQcwxBEDylOc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Se8dOd0d3cwhA9dlmulakmh9z6pJKmkOivjo6SUqkfwds8R5IYj0nt3QT+2PPQhx8QpGVnyU/S95Zi501jzfi+agXHq6l/JvDOkdas7unaAsuC1XGX7e/SHzQwOXLcgW993p/+va/Y8Fz/WkRaDLoC8ULgFHA5shJI3kWK7WvNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V7iDdk/k; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V7iDdk/k"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-824ac5d28f9so5285748b3a.0
        for <arm-scmi@vger.kernel.org>; Mon, 02 Mar 2026 20:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772511654; x=1773116454; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RjlYlr+TitWbiFWv5AnEceJILSm/y3zmJ+HZjyFCTd0=;
        b=V7iDdk/kExmwTCM53YXPZBPilfHAy28voolH6ZeOXrkI0rmAnprgmf/Adh2eMgs0MP
         WlsPeXer3GjifrZ0/nRjMlNlcFrR1r+aYptMw+iv2sx2uxor+y5prgDeTyZchU+HdY92
         SK2S6Zu0PeG3fujmBlpPSkpFb54VR0PYTZarI9gku8tFfCVx1G94Ql+97VPEkVmPXyev
         p/g4+7QqzbpGnCsQt/RhXQoNisUJdBwvFRgzzj8MzTTxuNtyHOm7EGd68LiGeLL00SeT
         pSqQcLw7wG07axfvzjLEmvbg9e8rdl1VHf1MqrOpOVyTEyLPikOrpSHJWnzRmewPdvik
         i5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772511654; x=1773116454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RjlYlr+TitWbiFWv5AnEceJILSm/y3zmJ+HZjyFCTd0=;
        b=JQQFG23i4B17QKxf5hc82WcE+Op/UFxK9veDKibl+qvVtJJKE9ntuKJD1DU2udVNjF
         h63lpawp1MZKV7pDpWkh2p9Xw54lQOZ7oMNSqDC+ufwwvi457l02EK3U1nh+v+4O4gtJ
         pp/seYLIX2vhOME4AW/QvSgn7nYDlAE4uujLq23SrMA3m83aZTL0QUYrX6mIIh+Bpnb/
         bFYHOPUEi7BexdGY6lilS5wTtwqvIvzCrQK89DGONdbHXAaujPcmmIPAucQkvnr9gGCa
         4DKXkSPgxQvST12ZfvIf1opfdEvBdRXP0A7VokUJxXWxkLIqiqnyQu11hmfrmTmBlSNg
         Y53g==
X-Forwarded-Encrypted: i=1; AJvYcCW/9pMUJ0yOeF9EX+WyLtpnzKLJ0Q7f9UZHh+4+39ZffJ7sU10IuOtwY/0hSnSgwXzhVE3sM6YYXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyM4JQPHCtm0iSe1/udHRyOs/snJHLR2otobR9/3pnN3kORIr4F
	JJLK41M0QdAEcu4fnroI9t0pP7FHsQyog9PXXZaA+gVqlWPXiWgIRcPnP25Lm5aI7VM=
X-Gm-Gg: ATEYQzyOr5rdT3GzU0+M5xCtfqVfU7nGbeFuiMKidwDe/zN95jCvedP7/0hKmAPi11G
	rAS6i17dTdjUsEHjax1T0gN8HWZ9FRWpxpgO+er0CL6V3FfS56dUjLW9iLVbESu9WW84cNjcgL9
	ccvFEU+Onvoz2rPX9C60lUQa+Bz2MptvnusGczuX7PQrSi1XdOb+zJzr6oHT3y1cYvuG/Jy722y
	W23lRwiklsuic+JEDWFGMY/XrTECHTODoNzStw9zW+i53Y8YUkzhjGdDPIeTgymNzu1+rsZEm5k
	tOcV/eQsmHgf9257WjypLauLU+Q4rnwlceKFdM0V0CjIpj49JE/Q5TEQtFZD3hYF04Rxbrjp/d+
	PNpmfFN70lCJ19kyzuhbo6XBka22LACsm3qon/u4h3AqgVmaSMVktwM/aRaHa6iVKq+sSdLJMHh
	ttaH5m3QNCMwbfs0Dexvvj/5Br
X-Received: by 2002:a05:6a00:2ea5:b0:827:3d52:5d1a with SMTP id d2e1a72fcca58-8274d7927ffmr14626637b3a.0.1772511654084;
        Mon, 02 Mar 2026 20:20:54 -0800 (PST)
Received: from localhost ([122.172.81.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d8805esm15330809b3a.16.2026.03.02.20.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 20:20:52 -0800 (PST)
Date: Tue, 3 Mar 2026 09:50:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Hans Zhang <18255117159@163.com>
Cc: sudeep.holla@kernel.org, rafael@kernel.org, cristian.marussi@arm.com, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: scmi: Fix of_node use-after-free in
 scmi_dev_used_by_cpus()
Message-ID: <4lbgs3xszh75i4nucdhkbi2j33xvu6y3qfkilrshswbn73kpo4@kp36dhmrpogk>
References: <20260302155348.26374-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302155348.26374-1-18255117159@163.com>

On 02-03-26, 23:53, Hans Zhang wrote:
> In scmi_dev_used_by_cpus(), the code previously released the of_node
> reference via of_node_put(np) before checking whether np equals scmi_np.
> This could lead to a use-after-free if the node pointer was accessed
> after being freed. Reorder the logic to perform the comparison first
> and only put the node after the check, or immediately return if they
> match. This ensures safe reference counting and avoids potential kernel
> crashes.

It shouldn't lead to a use-after-free problem as we aren't using the `np` for
anything apart from simple comparison of value.

-- 
viresh
