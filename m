Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3E92550CD
	for <arm-scmi@vger.kernel.org>; Wed, 15 Oct 2025 18:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760551500; cv=none; b=n2nA0X00hnFMsY6JwzIJHv9k5U6+HQxtLSGq2W4BBQPd8Ttg0XyzRGWoXYKa9r1eIzJBu1qFOH2DrDjlerj6gfPsn1FP8zpM9L0OYHgke5Mh2PL4sUZHDzcCMcUYodZKXOdc1xsk0nmA2F2Pt0kJon+VACkjD2LLXZ7Ad7BidEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760551500; c=relaxed/simple;
	bh=bn2XbLIQg3pcl9DaDKEaIxRHVm5mvtIlEs1dUHpsv1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sIG3w3fu4R4eqqA6KvrBDBFdE23B9UVHNTwr2zoYzO+T+vtLMVAGoeEeWmibrRh7M609KksDqAbZx+CrCHsqpVegmUrgV9fMLc6e5waJ99jFqfn/dvjrq6dqjv3Eo2fT85aFyolOyELiP7gH5wEos49bFaxXIx7RbsZjwIxhre8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EPlcBqgq; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPlcBqgq"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-79af647cef2so3472644b3a.3
        for <arm-scmi@vger.kernel.org>; Wed, 15 Oct 2025 11:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760551498; x=1761156298; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YEscpRiAZP09a2JQp/IONW4mb8MPlVCjQKLrshEfpIA=;
        b=EPlcBqgq6CokSWIea5aFWta5ZBb0ee7NkpmsdOzeLAJm/eXI8mXpbOEX1ykWUdFHGn
         /u1OCkhwS49gwlyRNhvsUP3igfjeeIQcDPKhyqZKwrIwXbWctm4pN0emNcV3/3ac2iQ3
         5/vyffgZYulR74TKwUGOfjPAUYGSMjRsXAlLUvxInhCgKu2v6nm0OpzH4X9W2uNa2iX4
         z0+2XHx3a4zsSu0aMIlzQq14mdATg4AHL66oucGTOutQ72d1w11FKWeZJNg3HAlJTWzi
         uESJD6/Ux83z3j3wTUsZ72J7OyKOArGv9pjl7JXTnGAkX6N1mRZrz8Qhk0Qy2H344dE7
         BqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760551498; x=1761156298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YEscpRiAZP09a2JQp/IONW4mb8MPlVCjQKLrshEfpIA=;
        b=e++bIVlxn58+FoUDmUaeb8ju8wgUWugWXW1EG+G9FMXoQjB4BbFNw3XgVX6omt6X8y
         AxHwtMLDl9QZSBOaHu9RWpZBI1adQKihx5mH4mUZpt4MD+e70nTYtIdgASuid26+SHo1
         dQN6yElXspRTrMRvJ588btG1mY3JxnUYjT2Kn4uuW80+wkABjznHwriSiP74w6WQfk5c
         sUhhi4ZkGz/DQ5PutEpMEj7WXMlFApzXv5mleAYdkDqc6svQCw6UDU84hJroFOZwlMj9
         yWd5cBY+9xpyopsQYpugbqMGGILijcjDsbt06Z6pjPWXo1HFSeqzzrDbpT12IEL9A8N0
         notA==
X-Forwarded-Encrypted: i=1; AJvYcCVk6J07VnGpnpT+SADhsCIvpykBPMg5S/A3bAizV3P1HVwf6OpEWfHcrVLU4iX3em2wyGR3ZH+NJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8RnpCdtbBSx3SBXcFH5npfKDn6+RUj+9n7qVuFD4C4h6YBbGG
	n8dREI6o7nG2u/9bPpnEPetw5NKHrsByNluWd4j+TOvhrwW/rZpqK8wu
X-Gm-Gg: ASbGnct57RlaUIU+In7OlKAvZcjuxkS44yc8We68KQ18AkW+P87i6Yg+8AOfajLFDS1
	iOFfU4d0kaSZfCT0xksoJxKm9CNYWxmjE4tUY2zo8zK7VmPhwObwPeZxtLms7Q27SCrEmbNc+RD
	s5NcWwzlupCyODxL03rSc2XBzctzpKjYrJwr4EWy63s7VW2P0XNARF5pn+jjBpPAeXbsvuB5PV7
	EcV7spaZHwL7jQJ1wgOmYjsTlGlFlAeAmetqSoar7CGqErkey1iqFf/hEymOtAq1Sotnc2XZE/V
	xQY+UVJlvR7YqTetA21xFnAFgzgjsQ3j+/4RrmLWgcJpyaASzpPrL2CqlvoKu7WW3Q5hSjOvMFb
	J4UV10e85yMl7773SgaaoUI7k5nl79ejWWTfWN8HdVKo6OT897TFonwkl4IJ2mr4C
X-Google-Smtp-Source: AGHT+IE3JywhTW/hBqgapIqK/3OTonypN3JXftjp40udV4Uca3H7ZxC7Dvrc/BK+cWjLzKDvb/Bqww==
X-Received: by 2002:a05:6a20:729c:b0:2f3:f59b:3ae6 with SMTP id adf61e73a8af0-32da80c2d32mr37829511637.11.1760551497771;
        Wed, 15 Oct 2025 11:04:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a22b7bbc7sm252011a12.22.2025.10.15.11.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 11:04:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 15 Oct 2025 11:04:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, arm-scmi@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (scmi) Enable sensors to assure they can be read
Message-ID: <9191914e-9bd3-4760-a6d7-74c858ea1984@roeck-us.net>
References: <20251015114953.148706-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015114953.148706-1-marek.vasut@mailbox.org>

On Wed, Oct 15, 2025 at 01:49:28PM +0200, Marek Vasut wrote:
> The SCMI specification states that SENSOR_CONFIG_SET is used to
> enable/disable the sensors. The sensors can be disabled by default,
> which is the case at least on NXP i.MX95. Explicitly trigger the
> SENSOR_CONFIG_SET to enable the sensors, otherwise sensor read may
> fail and won't return valid data.
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>

Applied.

Thanks,
Guenter
