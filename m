Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBDE2BEFE4
	for <arm-scmi@vger.kernel.org>; Thu, 15 Jan 2026 04:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768450379; cv=none; b=aylz58J5iPVioevmqiZrGidTcRO5uvqPWlzSp0lAbT1hFgZHd3qMSkSdZU208nSKW5RpUCrfQ5fteMvgB0C/BIqNw1tBrvazzC0Btjw/CufXL6r8rxz2qhlj9wozMd2ylYdptU5eFXJsGJE+Ox3bvj+z1I8dGlMmyT/IB/qdDQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768450379; c=relaxed/simple;
	bh=OicEOFECTwzUbejfKgH7ecJn1P3Je+2L1KYHGrJqAJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MqqCpYmJa2o2vfHw8BAIaot28MDPWQrLj1dPwqgjA4K0QVQhyhGtBH0BIv1Ch16neZPOJA+F0chyh+yWnqEwLhAoSLC+GVzWoNHsAmCmdDCEq3GBELNLvYw/P0h/pR4yOYxTJJWATWYB5GgmID/tF9GkXs0wqyn08OSsVvdTljs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JBFqk+vB; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JBFqk+vB"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-81e93c5961cso394449b3a.0
        for <arm-scmi@vger.kernel.org>; Wed, 14 Jan 2026 20:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768450377; x=1769055177; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+n8GlhqjGW9h/LpOBUoPhtr9TRrvBPIYxXAgf01A/8Q=;
        b=JBFqk+vBd+3bJ7k8aAqZxpt05oD+NT/aoIK8Eccm9sCYlcSGAv2EFGX8okCL+O7ZTj
         lwF9bvP65ZIoI1O11M2T+vtwoVa82Wo6mDhmZjUWGWypMXMPeO5e9cMqxi8DQblbPvJ0
         gOSEF+EY0fxo0YtH6Uveimjy6zazELSml33RopKK8NywTAyLdSCEu+0d1Tt0lg+dKKeq
         xgv8FIZdqomgRuLJ7FrmPv64OH3f1AfyAXqardHzT2NwV/vKhhx81iqh4bZy/Z2zDEDd
         Dy1jIEZIx+7ijUDPPeN8xRupQ9joteyzG5pypXyIKSJrTv7ShWOioAApnFKzwJb79+j2
         avJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768450377; x=1769055177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+n8GlhqjGW9h/LpOBUoPhtr9TRrvBPIYxXAgf01A/8Q=;
        b=ObUTuYnnx+YNAeUUnCgH634EClPxN2BKiB9dN0bqH6taH5NOsFXrzyK8vAn0i4Z5IX
         N9Kps4Nj23w62cI4zzCw8ROiBS881KieMUBaRYivdm4n2rhNMWOz8Z0FjI/jHk0Kkzow
         MhncYNIefqtN9/Mvmz4GHiYJ5H3nu2zUoGGnCS1nTEW3LmNK0H75JzoSAfYA2WtLAB6Q
         5YTmRCoQMNC3WTbDqA95CMw6UDuf3AHiWIqhvWxVaSVHpXGCSzCzu0obP9+i+kf2oC6c
         4XAoO5jN+KC5XoC9q/ucC4n77qMhiTtEmSbYiZLnoehaj/monpCv8MZb/3+VXd/NQta7
         mRnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqDO3LhSF72R2FpMK8BnSD5TXG8c8FZfsNTEmdQPJoG8CIYxee4SHI/k8PGSdP+lVtZDCS4GNQnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPUjXPXYFMUpMksnwoIPGuD2jIgHteD0mSOUFy4YvT4T6/IUk8
	aYrUAABRRzpr/MwDS794biL/wBfpGEQfUwPvm9BqCbTtAfR4lFqKovxrLIMJBDWUI8w=
X-Gm-Gg: AY/fxX53fi9dOT/PzDxf0V3eDx/1JgCLw9nivWITzOZl4AKDxcKkCHV5RpTUX1KHLLK
	yfZlhygaxaYJsyDeGYhanaDTNTEM1pCfQOW5CPmB9y/eW6g99Y3MskRCwtfJZT1Pru7LHBbvd/I
	w31lvypG4fRkyZTGAMng9/+HrSp5dLb24+wouof4xdzHRol8Bkp+CWl85uA5uo1AvFihXzlU0GN
	+kNdre5b7AzKaeD4AyLP2kXA9cSqKf1myr0jLPav7q6/xlZZUNoUbHHmIamsWbEdCOSEJe6eRY1
	8TqQUfa1+4hAHxnC+ZGvCLb7reFg7sPpTsqi0hUmni/iWEQsy3stzFNzUPZJSle5SHgCCBhrFwN
	ssluwMg7Mvx/rIoUAjCqbbCs1E88igmP8bP8+cMG6e9W4Jfn+riahNRjrcE98LTSESGUstw2ldm
	A1Io8Or/a8zi0=
X-Received: by 2002:a05:6a00:1d92:b0:7b8:ac7f:5969 with SMTP id d2e1a72fcca58-81f81ce46eemr5018354b3a.4.1768450376695;
        Wed, 14 Jan 2026 20:12:56 -0800 (PST)
Received: from localhost ([122.172.80.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f8e65097asm1012975b3a.37.2026.01.14.20.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 20:12:55 -0800 (PST)
Date: Thu, 15 Jan 2026 09:42:53 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sergey Shtylyov <s.shtylyov@auroraos.dev>
Cc: Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	arm-scmi@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] cpufreq: scmi: correct SCMI explanation
Message-ID: <reqgrcf6j4t5fxtuoe4fr7rygpfxaiapzyt5rhrpts45rdmaoj@wghppcuxvcuk>
References: <e6c2e7af-ad87-4d38-9dbb-f9d6ae81fe83@auroraos.dev>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6c2e7af-ad87-4d38-9dbb-f9d6ae81fe83@auroraos.dev>

On 13-01-26, 22:33, Sergey Shtylyov wrote:
> SCMI stands for System Control and Management Interface, not System Control
> and Power Interface -- apparently, Sudeep Holla copied this line from his
> SCPI driver and then just forgot to update the acronym explanation... :-)
> 
> Fixes: 99d6bdf33877 ("cpufreq: add support for CPU DVFS based on SCMI message protocol")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>

Applied. Thanks.

-- 
viresh
