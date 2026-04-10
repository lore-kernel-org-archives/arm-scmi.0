Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEF01C84C0
	for <arm-scmi@vger.kernel.org>; Fri, 10 Apr 2026 01:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775782904; cv=none; b=ZFqqHaT1j9VbnBNOcTR0xJbzHun+dJuF6KD+NgIPbbq9TL1ywkXfC+jb3MM9RsxX1nV9ZZp/MjnIpGjUKjrRep1CowTrmlX4bLfxelNSZjCwoEiyPDIRPhAAb4cfs3EDCKVTTurSTUZxlmJBAXugAqYVub8vAtZ0aC4ap3qF18Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775782904; c=relaxed/simple;
	bh=O1oqU5q5okVp6Eq7KhaJYRT8N5oZTYs7sw6L2W1OpmE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rwitWm0Z41galnkV5dNrLl9vbottMF4Gi4kgCyhAEpyG32dR9iqODhGzuDs4RnGK6LjJ9fFW9POXSsB8gW9hbei4HmqDrJd9LE2C48A3VNcQE+zXuMQnVJ7QmqaLnQdo1tL2yxoy4drSkhiDKGR+xz+KeNY7rWC5gqCKCXDHEVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=0zifnLjt; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="0zifnLjt"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82ce49785a0so709005b3a.2
        for <arm-scmi@vger.kernel.org>; Thu, 09 Apr 2026 18:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775782901; x=1776387701; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CDukKgIxUDFhviJEhQQl8OKCJeL8VtYjziTmoESltr0=;
        b=0zifnLjt59ENXbULyxV2hfv8CI1gn3xLGicwajRFjCR0S4mubP1/RgLFNpsSVVMHOP
         6K1X0S4laaWRf0e/4nlJ0SbA5ivP8Wmox39Uc5ShzkRH13RO7GdLd3cgatQRZX/OzSbE
         lKQArwm9HLiAzVZ1m9emyVU6V+hrs98vWWJS0zVCyrSTc1QvrWfMPLm1YiHEcMH1UM+Y
         CtmhkV5oOLnxSMGv/WkaIK4MXUAHKzvV0phgjhTKe5TSq/qNR+iryIAj8e87xVQ/5Rsr
         /1RVQhtNHSAFEGDTSRth+TMY3B5KFT6EuskVNG7bAENnmYSqEN8XF4Ecy3Pc7dBiZQAf
         t4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775782901; x=1776387701;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CDukKgIxUDFhviJEhQQl8OKCJeL8VtYjziTmoESltr0=;
        b=i1VFqvX7V/vTUMndbUXyCaFXQ7aDdqH+abHC3rQ8OO/UzuK3ZQFhFYL+UGnM9aV4H/
         Opvn71rQ0zUnKD30HMbiShdhRK5WCIneJkbWgttgCuCFUlQLjK+ZvPllbIPCBm5YY8XR
         Vs4qw4/DMVgQRxO+4sbpzldNiH0fKj0e8XuiUJ2gVXkK8KAIgIN+MhVPoQOc+Pjd0kZs
         RT2Tlf3EMCT0FhthoZIUAfOTtIDU6au54dE/eCvipRoi5CjgG5uWpD6AIzsPSlMsf2QU
         wYVGVxOGEk70JrQy42qqS85j5TcQBIh1f0WT8Qsl9mmSYr6CykrTK7BcCWW6S2rISHA9
         m02g==
X-Forwarded-Encrypted: i=1; AJvYcCWNnpV8OTufd/n9UgOMvec0CVv5DlsiRgUkDZjS/vJsC8cVk0wE4GhTNhy3xeY1im/Ph9MaqS4FXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtHjjwjoPIUMqrmIyQeScODQAVPnYZDFCNlCJBRwUYS7xhDlhx
	UJ4dbZXkgs/V7iCtQEmPyTcwb0VI2/rPD11Ed9TrMYr+9nl4Gm35+67BLMJt/D+s58M=
X-Gm-Gg: AeBDieu8t7uJ8eHK29HUM3CP8Q/NRy06NllAbeokqn7vflssZ6UUaTMoIh6Py8SX2oj
	qhW7NAvFvarcsw0Kj4JdblTK426EL7IYmXESwIhRk+mI5uwPpSH+Iv/RKzpT2OdIHo3p3gjA8l1
	WeP8r0u6lDPlW74d7CXJuUPyVAlJ04Qk9Xq8ZKi4ylpyEpXehkihd2CQ3xLZHFpx3XjOYrUYvzn
	XSZiJoSB6QyA4vicCQxtX1Sj07NZj1e2sot84UL5Ux/+OojhleeIT/JW6vEhvDCjjEukH07vkfh
	Fxon61AwfpLn8zFCJb6bLNJiAQY+y7lzYCNkMVpLsMVsuNp02km3knYEK0PW7ESWIxxXj0t1iTo
	wYpWxK+qcjJBNvu59ugRRt2FeKPAfVShUK4cKpgq/V9MJFhaQF5M8mtjFv8zw32rxoErjatov2E
	cEhvnSBngwTv37Xr/PPtY=
X-Received: by 2002:a05:6a00:1bcd:b0:82c:24d5:63e6 with SMTP id d2e1a72fcca58-82f0c169049mr1259317b3a.15.1775782900710;
        Thu, 09 Apr 2026 18:01:40 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c30f5c3sm731115b3a.3.2026.04.09.18.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 18:01:40 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Dhruva Gole <d-gole@ti.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] pmdomain: arm_scmi: add support for domain hierarchies
In-Reply-To: <20260313120707.jhkyd772wzuwmlhd@lcpd911>
References: <20260310-topic-lpm-pmdomain-child-ids-v1-0-5361687a18ff@baylibre.com>
 <20260310-topic-lpm-pmdomain-child-ids-v1-3-5361687a18ff@baylibre.com>
 <20260313120707.jhkyd772wzuwmlhd@lcpd911>
Date: Thu, 09 Apr 2026 18:01:39 -0700
Message-ID: <7hwlyfr5l8.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Dhruva Gole <d-gole@ti.com> writes:

> On Mar 10, 2026 at 17:19:25 -0700, Kevin Hilman (TI) wrote:
>> After primary SCMI pmdomain is created, use new of_genpd helper which
>> checks for child domain mappings defined in power-domains-child-ids.
>> 
>> Also remove any child domain mappings when SCMI domain is removed.
>> 
>> Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
>> ---
>
> Again, since it worked fine on my AM62L,
> Tested-by: Dhruva Gole <d-gole@ti.com>

Thanks for testing & reviewing!

> But I had some thoughts further down...
>
>>  drivers/pmdomain/arm/scmi_pm_domain.c | 14 +++++++++++++-
>>  1 file changed, 13 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
>> index b5e2ffd5ea64..9d8faef44aa9 100644
>> --- a/drivers/pmdomain/arm/scmi_pm_domain.c
>> +++ b/drivers/pmdomain/arm/scmi_pm_domain.c
>> @@ -114,6 +114,14 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
>>  
>>  	dev_set_drvdata(dev, scmi_pd_data);
>>  
>> +	/*
>> +	 * Parse (optional) power-domains-child-ids property to
>> +	 * establish parent-child relationships
>> +	 */
>> +	ret = of_genpd_add_child_ids(np, scmi_pd_data);
>> +	if (ret < 0 && ret != -ENOENT)
>> +		pr_err("Failed to parse power-domains-child-ids for %pOF: %d\n", np, ret);
>
> Nit: I think the style of this driver is to use dev_err than pr_err

Agreed.

> Also, maybe a dev_warn makes more sense since we're not even returning
> the error or doing anything different if we get certain error path.

OK.

> I am wondering if it makes sense to just abort the whole idea of
> creating power-domain child ids if anything goes wrong?
>
> Basically just of_genpd_remove_child_ids if we face a condition where we
> have different number of parents/ children or id > num etc...
>
> All are error cases where the system behaviour can go on to become very
> unpredictable if we end up making a false/ incomplete parent-child ID
> map.
>
> Thoughts?

I agree.  After thinking through some of Ulf's suggestions on the
different error handling ideas, I think this should really be "all or
nothing".  If we we cannot parse & add all the children in the list, we
should add none of them.  I think partial additions will be come
unwieldy to manage rather quickly, and require the pmdomain core to keep
state.

Kevin
