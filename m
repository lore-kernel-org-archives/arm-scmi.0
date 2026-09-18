Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB674A3F33
	for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 15:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789743993; cv=none; b=GcoZcR43eHbM4HEufeZT7Hw5SzGwkzm3rmin6ZaSLwsevyGUyr6Beg1lCM7PSRn7r9mo1vclVMxl7PnaRoVPbwWJZXy8Bwla47gNTfcVRX9KiUq/Mxa6sCEB/LaHfAWpqqvJc+n6oaTxvp1b8e+5QpVGQ1PxCd8oXkAkHBU7JmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789743993; c=relaxed/simple;
	bh=19iCNcCPJa6h7SqIFmaDcjUE7HtusVN2AYJvdBzM+C8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l2GmjFpFUEB9A9oacWefIz1ZoTlciqApd2FwzfHzR54BbSC49RaDrKy8JBWUAlUsGvEfxZn1+uRZ8hkXTgl3VI8KqVYgiiZvgH3hB+D1EuIvWqRNZr5c3DQNWFSbxffUmd44EiZLWLB6TTCvYrtkGttZARuTSuJWs9Fl17/PB9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TdKaoR9w; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TdKaoR9w"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d90ba1d807so10309455ad.3
        for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 08:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789743992; x=1790348792; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BQGG8yXln03K6MK1Xes3T7st55EA/EQ+1R+tmJIGLy4=;
        b=TdKaoR9wKZcf/e9oYqSD87pj/2mLW/tmTNWrm9leCFwX/luD00VV95+plLzaKWnMhQ
         YCtlw+Dm1kt8DdhbGeNqJ+whe4DeBqUTQDpHkSDLMA2qSrXtZRen6knT8BQa4TtAjRw4
         BWW5PXnMdBfWJQRjcZKQIvcljii2EOC2a1nO7y24edxJX2NyRcoar8XZ+LAQLXRjjJJe
         3HyXHpphEoWps9I2yO4WNT+5fNmB3ix27uh2BDlaCS60zf93LwdTL8YYfi4Lwjn2a9AU
         /OWXQR5AfdLpj7CGKly4R2MyiOkNzmv8JLAPXfxES/BND3pgtW5dExh5IptfGlES+nNQ
         VrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789743992; x=1790348792;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BQGG8yXln03K6MK1Xes3T7st55EA/EQ+1R+tmJIGLy4=;
        b=CH9WCvz7vC6B5sYSzOsVD5nXLAj45q039xolnuF2BWGhHYi+opofrdCX2dYwCyQwkB
         F9w8/qI3e5jIFx8xOOt4WudmQxEUHLnC977YMacTJQoZRPg1MiwLmFLx01Ft5LfqGx5E
         +LqdXPhWD9juwzSR+YHCDTwdDspn8nnhpdv7tTzjJKphhdBYIKOsYoWM44jceHyhVgBu
         /T0EP/BiY+jrpSVGNlqsDNEwMcnfjrk+4Codf9zehjZVwIN8FaXIHerJpyHuqQMi2Xri
         UEdsXxJv+CT/bkmrDhsp0jEctjWr7Rx09tKqa2BgrY1zdNEoqEGjHMD7wO3y+1CZe/lQ
         2YLA==
X-Forwarded-Encrypted: i=1; AKwUvBy/2Mz4OJnlWOnBpIBwDluJCOy0T7Z+15pz4QIayVM7dzLi9MGeqLmx6OFkXFaXp+sR4hWDBx4Z6w==@vger.kernel.org
X-Gm-Message-State: AFuF++k2okSxYKY4w/9YTliYSyiSwrHHCiR9k0CTzq3HPcGFSrP+/tAX
	v2wpEKGtsxPrtvdNqXlJjNHHhGWpyjIwxN48SpKHi0iEaupyqrRMsvsMxI3jeYyP
X-Gm-Gg: AYBFou2fgdlcr0vE1tTfBIYY0ZOBS+mh9t1InQUVR2+NDpWSX6fvClqPd8vuwLNvx47
	dct/5f5I3jhVGGLxaf4vLWUsPbHrd0JaaPUW+CXABGy82VC/nERF79EBTJtQY0IehCb/6zs3etJ
	ZnzblnjmYnxAQl50P6Kmi/daNtMV5YqAMoRTTBLm9M/rbD+AhW27qA8Nc3jWjBm6u1eYhv7lilh
	nKGUYF8fPtdYThLRSlK0mfx+MtDZ1X7vCo96P80+VA5/uQqzEFQznA/thIKjDtSpx+zSCfnw3gF
	eJVR4Gu/nv1CfzqWLiayaY4Ct88IYYADxcECRiNkiFfvU2qRfeYg9BSLVdthV7LRwXbP2F1BtiQ
	aqhUjkPaKbvB3iSeevR+8VsGwldG/eqf5wJuL2eK2TD3RH16fj8uX0uncRk9hRFYsryFO2qhDkS
	KQYNGf7nAL4usNhMBLwyfgmHRg8fzaG+gLv9sn0GJIGiY3IXxkD8emkdbPggH4iCXQ/xSlMnCqF
	NPixw+rM3Kkk/0TuXnRxhw=
X-Received: by 2002:a17:902:c947:b0:2dd:ad73:c93a with SMTP id d9443c01a7336-2ddb1bca6e2mr61754635ad.27.1789743991725;
        Fri, 18 Sep 2026 08:06:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb75819d7sm10071215ad.54.2026.09.18.08.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 08:06:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 18 Sep 2026 08:06:30 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kees Cook <kees@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] hwmon: scmi: Fix info[] allocation type
Message-ID: <2d9e2846-23a7-4580-a1e9-31b81eb74577@roeck-us.net>
References: <20260917211344.i.911-kees@kernel.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917211344.i.911-kees@kernel.org>

On Thu, Sep 17, 2026 at 02:13:45PM -0700, Kees Cook wrote:
> From: Kees Cook <kees+treewide@kernel.org>
> 
> In preparation for making the devm_kmalloc family of allocators type
> aware, we need to make sure that the returned type from the allocation
> matches the type of the variable being assigned. (Before, the allocator
> would always return "void *", which can be implicitly cast to any
> pointer type.)
> 
> The assigned type of "scmi_sensors->info[type]" is
> "const struct scmi_sensor_info **", but the converted allocation type
> would be "const struct scmi_sensor_info ***", as the size was taken from
> "*scmi_sensors->info", which is one level of indirection too many.
> Luckily both element types are pointers of the same size. Take the size
> from the element type of the assignment target.
> 
> Build tested ARCH=x86_64 allmodconfig with GCC 16.2.0:
> drivers/hwmon/scmi-hwmon.o
> 
> Assisted-by: LLM coccinelle
> Signed-off-by: Kees Cook <kees+treewide@kernel.org>

Applied.

Thanks,
Guenter
