Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBC52D8798
	for <arm-scmi@vger.kernel.org>; Wed, 18 Mar 2026 07:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773818350; cv=none; b=HeBpfTM9vE4X3OxoCPdO4XOgLbPasan/cuk02IGGbe+iW1XiKIJcMk/jXyzxEGKb/ZCoH6wWh9DJUzB8kwz0dumVf30u987kwseiBs4KTEahVocXNvfzvrOvZrToaVdtec4GK1cvddJDrj3LVE0dNggUDDJEP6jJQ0cWHtRgCXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773818350; c=relaxed/simple;
	bh=ol8Ym5CKcekMlFDOEvyJrm6wbK1e1Xmsg6jJtPQ6+IM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CERb1EcK/zsjyfID7XYq3ETVh7MZgH3K8w/jwdqH7llsaF0SYivo/jjHh8f0CyIYzZkT6gPvXwkG1o8RVsjwkYNIDfz/UckDePks7s4HXV8KQPD281iEJyOOqyeYxWXfhzSo//EdqIAyM0K1uSXOALkATQeeImigroELuckOqbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lw1Sj6ov; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lw1Sj6ov"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-485409ab264so4272885e9.1
        for <arm-scmi@vger.kernel.org>; Wed, 18 Mar 2026 00:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773818348; x=1774423148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RrTjxBzkA8E/8TnT5udli/s694DpyD1FsJpsEGO43Ls=;
        b=Lw1Sj6ovj9EIZhyKaLbnabAY1o1VzAT/nfq+ZEVdU6YNAujwH/cghfTUdxErYUhFVP
         fTlLKvyQVQk0JmBb0aeTYrlOylaCcwsSokyMvC4/4C4CTlQyGntCd8uK3UtdXldP4d0L
         IeVuqrnsYKkVLgtnuKajimE+mDQvyjuFhNiZKMNaudfeWNoNa9iWlGTxmhNXzOFXKJhg
         E9WsSdVC7xhcSaaw7f+IKKVQXIzce9f7A8+1ziVoQ7zNmjS4aIdNuZb20q7E/w1uopWd
         aVz+1QDBPflkKycQSQZbuvUfh8HFE9TFTf58+1aMK8qwBcr4QCjRCyRifUez+aQrC4A0
         cjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773818348; x=1774423148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RrTjxBzkA8E/8TnT5udli/s694DpyD1FsJpsEGO43Ls=;
        b=h/Ap4EAks+XA31kItsG/HhDYixsbbqhFiLH0oPkunpHmnANbYKJmqfjFMb9cNxJIde
         9TzaN/AI7yHF1inZRPT2OLJ2RSjTWRy4O1sUWkmpbF4sRVi2rg8Nf0bNWMKBn5Kl8Y32
         3YHZyTyrdk4iTzlcxz1IMu3lQenGCnfVOJ3IK7kcrUBijWghJqpA56l1VHhq5Z4NIH7n
         Has6DjwO3UULpaNP3KHrTVXw8SL/o8p/R9ImzKWINXQgoFcfgAYByJLp/36WalToiure
         2OQLiqGIKIwof2Br4OiZf+T8Cw9aZVHxMNYYWPrFbl8y7hMa3z14Er5AHu11G/tpIAs1
         Gr2A==
X-Forwarded-Encrypted: i=1; AJvYcCXgTW8zyzeN0zzBVy8v8jacNX2mLbSJJeJ4EjtZMfUoEqTynxZpDd6p76sPSJWA5c0Zum3ppsftug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0dPryK8cidVL2lBuP4QtOEBLmGQkbbMqBGpmIXt3k5C46LX0r
	AVYduUHlpcOzkgee3Ttq+0u+Xcq2YIxsb53c3S2KYUh2/lDPCeojcoDfg6z6KSgsHW0=
X-Gm-Gg: ATEYQzyFec8qeuWBTxc5NqVr1JhvIz8qkC/F5dg1YDwODidVaqWeeZrHQo1X0cqd6FV
	XLY8hZkTRWyDi6zZKLsKzgIHVJPrM/XTZbLH9LOfbRF6FX2bCEw/35IWiZgzHXMj5hP9FjOfFEg
	XqHTfGKbipvjSKQsJjnp40kspPGNu0yWCs9OYJEY+hfsby3Adng7DTQ7cnb/EyU0O45DkY+YODB
	ylcMfB7de+5cdfCAmw9EHn/aLIf1sAkvbinLLiPs4n12qk03T9dSXvHz9evBeukLfQOkBPSqmGX
	3UaEYJRlohypai3ADWjFPNsTlD/oRoJ0jnQckbzwuSkZru645iqrQVKY6e62YwIaIO+lZooe+dC
	3HBqY2qaBGhgKN7p/xx0V/qN6SOSSA8LKehOKFwTs89wRYbwlJlcdZvUo9QPJ+wBPLF++ojRbCM
	aYjojLK8tiBqnfJx330j9nm0/PnmuX
X-Received: by 2002:a05:600c:c4a4:b0:485:3c11:de84 with SMTP id 5b1f17b1804b1-486f40c9015mr31500395e9.14.1773818347740;
        Wed, 18 Mar 2026 00:19:07 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4bbcd78sm12200225e9.26.2026.03.18.00.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 00:19:07 -0700 (PDT)
Date: Wed, 18 Mar 2026 10:19:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH v4 2/7] pinctrl: scmi: Add SCMI_PIN_INPUT_VALUE
Message-ID: <abpR6N6_4JgQTB4M@stanley.mountain>
References: <cover.1773757772.git.dan.carpenter@linaro.org>
 <940ff48bd53e35e19a4cda081170d9198c20675e.1773757772.git.dan.carpenter@linaro.org>
 <abl1fPQEDE38KZQN@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abl1fPQEDE38KZQN@ashevche-desk.local>

On Tue, Mar 17, 2026 at 05:38:36PM +0200, Andy Shevchenko wrote:
> On Tue, Mar 17, 2026 at 05:40:27PM +0300, Dan Carpenter wrote:
> > The PIN_CONFIG_LEVEL parameter represents the value of the pin, whether
> > reading or writing to the pin.  In SCMI, the parameter is represented by
> > two different values SCMI_PIN_OUTPUT_VALUE for writing to a pin and
> > SCMI_PIN_INPUT_VALUE for reading.  The current code translates
> > PIN_CONFIG_LEVEL as SCMI_PIN_OUTPUT_VALUE (writing).
> > 
> > Add a function to translate it to either INPUT or OUTPUT depending on
> > whether it is called from a _get or _set() operation.
> 
> In three consecutive patches against the same file you have three (!) different
> prefixes. Please, align with what is being used most in the driver and/or subsystem
> (the driver seems has no consensus with itself, so subsystem then, something like
>  "pinctrl: scmi: ").

Oops.  Crud.  You're right.

regards,
dan carpenter

