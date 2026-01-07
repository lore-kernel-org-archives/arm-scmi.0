Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535E3227E82
	for <arm-scmi@vger.kernel.org>; Wed,  7 Jan 2026 08:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767776052; cv=none; b=KiKH+rLLQXg6QYrZsFqnqGAIJLiFN5B4uxfzsVU3qJM3E0+mXI3LxdP2BJrOo7f0Pb7JUC4nhdxUYjwBdvHFns2MeVfDmikdX1tEX09D6jqOHcRr5egQaAAnsqTWtozW6CShaImlOf5gtkQB0QbJ0Ncf84OqsAPTBMJ0+6zcQV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767776052; c=relaxed/simple;
	bh=yBxkdCt4OPqCLXEQh0jepO3pJwEIImhPYl56NHkRdHo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m0AbBYjy7LNzAFwR1qVX1FCul85+nlshTPb63nogoSpD9KTn6cdpNP1pA341pJPNZLDdNBQcN11iuvspruLQWBctl3qE3b+cjkBOZJRRK8KoYW3y10u188n3nf7MLw8tP2V4u/8iCt7bSzBINRd1vd6QvBHXRVYNfR6JpHqLR/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XexYLH9d; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XexYLH9d"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47774d3536dso5244255e9.0
        for <arm-scmi@vger.kernel.org>; Wed, 07 Jan 2026 00:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767776048; x=1768380848; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aoyJ6BnFwpqnavoZ8CzPTIRRwom/LZ65NZixogD3caI=;
        b=XexYLH9deT/tGKqgsxCVFwJ5Tku8o7Kyd40VCe3GNk7u1MAbXE40ru3efoii8Tq3Z6
         +wE0VOVup+TJP5KpxhnRBfrnLp+213gY/DvJCm9hj0bn/cc3CMMDpjE1rbFfDE5Y2RQY
         3ILm80wT1izNv1FeCv+SV+wNMG5zF3BBxjiSArq3C0K6HV9WLlhf/FKQg6VAQ49kNEZk
         +zi7DIIy66GNHlfWWMdwSwaoKcxT+x/j9X6qqKAL8GjyIzMcAMj5CkYKhjp1VC7uioHG
         w7DpCWoqChz0LG/TU3EFNvLUL0RMiyPxxURmJVuePJLCAsbOdRG2Y93iu2/nTY0Xww87
         LvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767776048; x=1768380848;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aoyJ6BnFwpqnavoZ8CzPTIRRwom/LZ65NZixogD3caI=;
        b=JiLIPWJ7aMiar6+zJzvie0UhW8i/ZK69d6jAnFsFRO574NuvsMjOjtktuIZVMiGFJr
         AkwehgmUyPy33uDIj0J5z0UNso5gFCMmfQk8DbJb4n4p0FJZBiwfAuHMuCZWKnU4JNi6
         u4pMJqrqd/SriAp7zD1hC5HpSv5WArmvOx6F5tc723x0t2mvoCVoW56j57vD9FaRUMTY
         qb3XrcuyuG7wXEcqm0FIM5jML1QBy0b5EFh4Xlaq5/SHkjZi2jvLjzuwsflthVMQ/htK
         BvMsqoZMk7bAHnLVj7mvVzKSOqvjnFfFX/goO+m3Ci0+IEjNlBBc+5GtDk9h/qOc3pRn
         ibbw==
X-Gm-Message-State: AOJu0YzfNXNELtuhT5r59cGLiIJGSbpOr+J6ia0TB8yXKR6R89yX7+mx
	Bt1WoJzHHdRE9sV+5ytQpbSxjmTx9CXHtzz+jLMSPpKJJWI/eS3y9VaedVwdHJ3K0URCsrPuEWc
	gN0BA
X-Gm-Gg: AY/fxX67ijPhSHzmGDmm+7l6ry9GBx4pKz4FdLAqRxGN+8bNUj+bAen35vde7gi/HZe
	ZvoquHxPtU9/QH2VUiOadjs0+JTYZK861DCszpFCAlF8oy2/tChatpWjbXSsvVVh7Bm0C2rmS0F
	qQZZk64fsiXuVVX3HVrhBOPHdY4t2pu6sDMJ8BKpoZMEgZwA7poy/97s9WTtF0spA0r4mQsypdf
	/ohNSCNqS11eEjK8BsoDFlpK7/kGMt4U9fRk/uNMDQcYJDDpOcr4QM/AevcTrlRoKQQR9u7foA6
	8kYa2jF+gNLc2Hqpa7OprHAZgBVRD+kK0OdEmy1hayluKg3IOI8T/m/LJ7oFzEniani4okl8znO
	8RBjehYeUMUuUtMpBBuMq1HWyxULEHlqJInlUEx0qgt1pycLYhpDv1imkTtOzSm7TpLea/PYDto
	1XcjmHMgfj97Dx0qW5
X-Google-Smtp-Source: AGHT+IE639xZu9dUin8m/xu4nCqh0zMd4ly9CEd4HoBZotIuWH3JAwLdau/QtehxLdPfX6hkZbPjMA==
X-Received: by 2002:a05:600c:348c:b0:47b:deb9:163d with SMTP id 5b1f17b1804b1-47d8484a329mr19227545e9.7.1767776048404;
        Wed, 07 Jan 2026 00:54:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d86c6ff40sm15459765e9.2.2026.01.07.00.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 00:54:07 -0800 (PST)
Date: Wed, 7 Jan 2026 11:54:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: arm-scmi@vger.kernel.org, Khaled Ali Ahmed <khaled.aliahmed@arm.com>
Subject: Release schedule for SCP?
Message-ID: <aV4fLSybWHibylC-@stanley.mountain>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Sorry, if this is on a web page somewhere...  The v2.16.0 version of SCP
was released on Mar 14, last year.  When will the v2.17 version get
tagged for release?

regards,
dan carpenter
