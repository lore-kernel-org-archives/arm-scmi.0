Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37FD2C2360
	for <arm-scmi@vger.kernel.org>; Mon, 27 Oct 2025 15:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761578309; cv=none; b=H3OUUN9UwDwtc3MzRK33jMaongXKib3AUQMGpFhcKuoQx8PAuvtgfdAFzq71J47RPeG63JKa35RzUwLBLaCViYLIt3jO42MnFKmH4lqfVOSWmM5V0rdg1FOv/RxLwp7SEllazFXofCxpcpataNvrLsvokeHUwbEXOC8aGy1AscA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761578309; c=relaxed/simple;
	bh=q2ebHg0FP5SJZw7LCfwFjACRYxvCtncQrxpN01n1tpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bGXvaE1VIwLtwIZ4uGP5dbQOsQ6i7KqtSI0E6tuhqL4DiApS8PZfkcH5uV416DY60qiOGZEX3K5nn2FikaHe+WJd/AYdXmdNhIwth+nQ7py7vKNExdW547+rjZahVx+DtJrDaZO1AlKDWzQHMupKiBzO4BfqXTMbzGZ4NWXXMYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wcmD5XqW; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wcmD5XqW"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4710683a644so40146925e9.0
        for <arm-scmi@vger.kernel.org>; Mon, 27 Oct 2025 08:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761578306; x=1762183106; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TZTFmK7GZ1TVUPmzZfwKDAML+TZOEpqWW3nJyVTGLdI=;
        b=wcmD5XqW2iZ13Gn1ejeWVbwwFAK4F33xho1Z4o3WYYQW1rC6jj8NlVcjCkSyl95ti+
         OjqqD+IjV5vLlyiRjm3b3E9LnqWi477LnGeqmOPy6ENOFrGApb9JyFJ66fMGOaaAZX+4
         wKNOFfLgl394/hWM7N70kDaMKcBsd2DW9Ye+vn0GNhwr4F56V1rAgS+TZJzi4+cdshPC
         EJ8TYhrta3KiNYJdqFA8O+Srfk9S0tAtP1LRtegXR9D9eu9a5MdAp0Ko0Hlh90rkSqr1
         tpxoquWMVQ+OnRXdGO6nwRevnCJl7fsQv5t/YhUQ5ZQHQvCC9yNpnn0m6+LQyljsF2TC
         vWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761578306; x=1762183106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZTFmK7GZ1TVUPmzZfwKDAML+TZOEpqWW3nJyVTGLdI=;
        b=nqFg8dBWqCmfWq7+swjm9Za/c4xTUOFn//qzPUn4uxGv8QhOMvMK4D1fALPvdEp6Dz
         2Hm1hYi/NlLZ1o0rl9lHtYsHEdlt4X/mhtPQ4yUbCqdHcuPReSM8EVkdvWO0bePVHgdf
         uM1ADl5eULxg02dje9ratgr0AMjNTYsLfAdVVlVmu3GLkw9ac4X7i+2+mDjK7qqZilfR
         4oI5d7jTKF6ICQzY0xcsVGTNCrbgLjl+Wm9AzeeH+8U8Up74StxogLJA8DIwyU0ecX5i
         VSdW0rTaM0anSEEHmX2I7KFXzuXGc+8/oP/sxtVl2HVo71jqjkPlqXBtVS9SjZepx23L
         OVNA==
X-Forwarded-Encrypted: i=1; AJvYcCUETWLBK6Iq2MHj+tq8tRWJe3P90uG4X0Yzxj7kZHDfY/9SWtZb+VtjmnIF/1ZJzMOPgHgAUdP7xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNsZ72IY/Uq/dOjSKdljyYg/de5VhnspJmrlguDOBgJre38kiw
	76dOiWP9dBXclnBszo8aY1sfY/jFDRy25x01yCvJO1wyMwDHJZcB9KDSymeIR5twCfc=
X-Gm-Gg: ASbGnctK5xKUrxWyjCFrNBqBvM9MT38X+tL3gqOwm1kfr2l45PN6YQrg2nHyVxvILke
	KPB+Gd3rmvpKsNJYTBdmADgFmfnxnAGyfNTfFoixjLXXCdvSaeFQWz3gapGaaYG5FDOTxJ3UJc2
	Xd/kbSVHAxPae/eR06PilIWlNQddB9jCsBQggmQKESe4ZLf3WK95cGe/608ULyb1QuuMT9aQXHJ
	lGi+pkbUnB8/Cr08xC+jNXVit0TqCccGXGSixt/KlP0yuitPHgUQgCsGm7PniUcVLyaKyXKWZNs
	J0KVV6Qp+A7pK60tu7wAz6bhb4Zek9BznXJupgSPalzDjeIfbTzfio145Na2BvzKD828AgyevHf
	yntEXIhPGdEc1bg5l4mbeHONWoPYheQtf6/l8oHutIhDf2BqDa3VT/jZKeIX591n8x1laC12OZM
	oo85AZsvuAqlSFdtEP
X-Google-Smtp-Source: AGHT+IGdQ3Pl8WJ0Jr9WgElxkVUFCnaBaIruVM1SpSmzXhkaMb4CpF22naG2Hn16N7UnuCwyffttJQ==
X-Received: by 2002:a05:600c:3150:b0:46e:1a60:c995 with SMTP id 5b1f17b1804b1-477175ab715mr4793705e9.2.1761578305934;
        Mon, 27 Oct 2025 08:18:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-475dd4783b8sm143053295e9.15.2025.10.27.08.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 08:18:24 -0700 (PDT)
Date: Mon, 27 Oct 2025 18:18:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl-scmi: remove unused struct members
Message-ID: <82a8a4b206ec02dd27a119d7f05d2bd6c8d2d3fe.1761576798.git.dan.carpenter@linaro.org>
References: <cover.1761576798.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1761576798.git.dan.carpenter@linaro.org>

The ->pins and ->nr_pins members are not used so delete them.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
I sent this as part of an RFC earlier.  In this version I deleted
->pins as well.

This can just go in by itself.  It goes through Linus's tree
since it's int the drivers/pinctrl/ directory.

 drivers/pinctrl/pinctrl-scmi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index d14528b9aa31..af3ac031e362 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -40,8 +40,6 @@ struct scmi_pinctrl {
 	struct pinctrl_desc pctl_desc;
 	struct pinfunction *functions;
 	unsigned int nr_functions;
-	struct pinctrl_pin_desc *pins;
-	unsigned int nr_pins;
 };
 
 static int pinctrl_scmi_get_groups_count(struct pinctrl_dev *pctldev)
-- 
2.51.0

