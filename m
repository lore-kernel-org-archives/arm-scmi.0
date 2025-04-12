Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054BC14AD20
	for <arm-scmi@vger.kernel.org>; Sat, 12 Apr 2025 18:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744482671; cv=none; b=C5iwyizXFLauU6C0MgnBpEO0XkGzVm/suKgRBDXHvT129FMYDprac9xoC/QIBGK7cwIcPUmlhfurtvXBH38bUvLRsBH/R2fTEztK2Mzn+qtS3ifuGd239Cq4VHqooj/K+Oh1OqUNueRp1Rz+p3FIPCKowio60eQ6nbjOLxfu3eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744482671; c=relaxed/simple;
	bh=UXWTbPpVMi3wyEEzFn8t+68PK89c4a+mJ8HY7oopugg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GsMceZxdydRLHnvHP89ToqFk/jKcFAdgFYewhQgdr4A8wKRpoMhhxR8uMX8wlDa6iI5i3CSJX6RToGCY6IRgEfOGOnmE/F7QV6WNeM6+bDI5GFZ8/YBIzp+neRNTU/FLcrVocphkHZxLImzG0Yul+aG0By+NT2R2MHpEEW6ZmG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VPnnyI7Z; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VPnnyI7Z"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso15932865e9.0
        for <arm-scmi@vger.kernel.org>; Sat, 12 Apr 2025 11:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744482666; x=1745087466; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3CyrR9KNkaoIb+djhhX7+16j+DQ68McNR1nNH1QOCtU=;
        b=VPnnyI7Zyl95p1eP3iF0Rjo7IgOUK/ixCTmtTrln3TQLOQX+lTXVj6OWA5jY61Hgtx
         mVJ6YLixpcayFjWddRu9kNNyQkUiSac0r6nWck054BLWZusYkyuNBCTEgpDbVPlheIXT
         CYHvFjp9jQ7J4au5tDMVReIlQ3e0L8nk0DraehaQPa9RvpkMSLm0AP08PbmHcvDJKuxp
         XCFuHz1CIngXkL8XBIsGEHaaWfXKtk6/oEFnva5MlRCABxmu8SHTnKJZzV0W7du/HS9p
         DpmXm4TaUEfa538XDTn8aUNbLxn0VAGzco5iM+Hbs0Asmwkhd/i0P3guwKCLb8AlMK/J
         vDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744482666; x=1745087466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CyrR9KNkaoIb+djhhX7+16j+DQ68McNR1nNH1QOCtU=;
        b=iH+BMp8v22uRgBH//Q3bK7VxA3wvh8fSmkOdyNi1j89hr050VrozEVmaKgTSE8E589
         1SdGhQMcTJI/DcS633ErQqBX3SI954Lgq49BQ0TqpgqWD8Tu6atwrcfF6dXklszaFrWj
         Z2p9Ab3Js92TT+69rPWUeXpV2KHMYlMDvRkeZ93Af3NVCSAXccxyF2dx19TO/m7f7sSX
         xwoO1LSfiY9As5djwFSaPo7MoUdgnGTATS6K0Y7Thd/VGDyyR3lkUjmgAlSqdrINDMGf
         QJyxJJHRREJ7jzV7B/CfCjSvgugDrafzua7VdEtSrtqF67I6KRO+E7J8/FIORujA9Zii
         6VYw==
X-Forwarded-Encrypted: i=1; AJvYcCVrac6gpN6C6cxOhqA6nSu288KTDQVlPzqUJZpEptZp2Layi3nK5VGFLYa9C1x/2oeuUPOWPLV2Ew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj2DDxs9MpQpU9EIHfVzxzUXn3gNlyXhXalZSr2VQrL5zjdOa5
	zXGtHOBYrqIQtDWF1sq1o2auHTDpfRORImVaCEoZm8bkVFGmDfp0A27E4ooLGVg=
X-Gm-Gg: ASbGncvnHL0VZe38fFzaEUqNUEGV5D/ZU6zBnnWTamSnRdh1drSz3TvXe9tY2FhEDZS
	egMC/aaGK6pD0UgHHyFRoS+xM3+/T2aY1s2qrSd7Uw7bPwQP6Mc/yFZ9zIUNjTueFFVqOfRNNQm
	hfoDNmlQmrEAwgkkqKKAvmChXgSBumYjGw96FqBKpHpqhreACRst4IjXKKKfSoWfwIgtLiZjBy1
	EkhYOl81fHPZMPM4n/8/syRs8yO1kFYFC/8Syn4fuYTTqgwfKoL0TdTpTu/kF6WmO2jZfon89Hl
	PX8q6Z2k73Q27AT1mv9Q1rxsN+BlB+W+zxo9fpGyd46+/g==
X-Google-Smtp-Source: AGHT+IHARGq36rcwuoUqKZ76aegRkcgHirTp4EATHkOfGBZZRYyZYhGL+bYneAm7wceJLq4bHfWKmA==
X-Received: by 2002:a05:600c:a53:b0:43d:fa58:81d4 with SMTP id 5b1f17b1804b1-43f3a9afbbdmr59892105e9.33.1744482666250;
        Sat, 12 Apr 2025 11:31:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eae96407esm5776966f8f.17.2025.04.12.11.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 11:31:05 -0700 (PDT)
Date: Sat, 12 Apr 2025 21:30:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, rafael@kernel.org,
	viresh.kumar@linaro.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: scmi: Fix possible null pointer dereference
Message-ID: <0081fcd8-da99-47b2-b136-3ea04232046a@stanley.mountain>
References: <20250412180831.3252963-1-chenyuan0y@gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412180831.3252963-1-chenyuan0y@gmail.com>

On Sat, Apr 12, 2025 at 01:08:31PM -0500, Chenyuan Yang wrote:
> Check if policy is NULL before dereferencing it.
> 
> This is similar to the commit cf7de25878a1
> ("cppc_cpufreq: Fix possible null pointer dereference").
> 
> This is found by our static analysis tool KNighter.
> 
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> Fixes: 99d6bdf33877 ("cpufreq: add support for CPU DVFS based on SCMI message protocol")

Henry Martin already fixed this in commit 484d3f15cc6c ("cpufreq: scmi:
Fix null-ptr-deref in scmi_cpufreq_get_rate()").

regards,
dan carpenter

