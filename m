Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB28230272
	for <arm-scmi@vger.kernel.org>; Sun, 20 Jul 2025 19:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753040359; cv=none; b=SQknWBxiXqJv8uYNUhEfsJciCXxi+L/KZHTFOnYWdTPTy1wDbzWxMQGT8IX8A+TiFkRDPgOuj6NVXWtKtJyyMohN0kw+nFPVAAkUVAtq3f72azpBTmcqc8i+TtQDbMvOgP2UTLPdr7DlBWm+9PC6A5QV5PwNND4aZocS2qwN8mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753040359; c=relaxed/simple;
	bh=pZLfQFK+iDMmtewhGnGO/1SaOgqUaWhiuxkwGFO9BrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bPcx4dNClJKB2gVNV0bp2eDYB+KS1hlN9YA3aLeJCvCmvb9MxgJKVstns19bPwFBOr+8ZJg4+6OsjuNE7miA5ZDMmpgyQ918LH9G4dzQBHIJmfceVLNAyGUGi0Ch/b+9yDS+RD1YDeYIVCQWL6sosixc9Fwm3ViPPm1c4+eL6xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E8F7ju5j; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E8F7ju5j"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-73e58d51060so912361a34.0
        for <arm-scmi@vger.kernel.org>; Sun, 20 Jul 2025 12:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753040356; x=1753645156; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7qmI92MLlIBwFrbUrwXTt/2+OJ1ahYjNp50nlsYvpao=;
        b=E8F7ju5jPsBgq+NLTWbjJBo1YcC8lwER0ZNuqFA7XBH7HBtRqeKDMvy2nIxcc3WlTe
         g6EF1SYLVCtE70FFkGebGztWpHWKFZJ6oSbNUpRP2/xPUeJmWtTujlZY5s+GhYKudEP6
         w3vpbjeWj0Ux4XnSPk4BJKCJgyDGmc88y81dusWy3qAUxsUuZ8qTRkuDetO4Xt2XJkCc
         9BXOInxidoNOY1X5kCR1jjlv/CycQ2XChWUZso+KIYG9QxhuUKG2rxR1bAki7++SvwSi
         Ygf+eg03dS8NMerFdzgFYSNoyXYU4g0iWmNdPAnh4Akkez2j9EtQfH8jFWp9fdm20oVJ
         z/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753040356; x=1753645156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qmI92MLlIBwFrbUrwXTt/2+OJ1ahYjNp50nlsYvpao=;
        b=BMr9U98PrQU6NYpMuZxONxMxSjSuXh6x5Xr5H9qDLLNaLBpGEbjnfcbpnaZ5G3Gaac
         kJxWanncIRkCrLK+zCsmdG6AzloO54yJyWr1UcjYCNEah1g//Isi/4f24WpI3hpb369H
         gwhE1A0Ruk0Zq4mtGU4wILbAFk6T+DHC7NUa3+RvA7EHLt2PjzzR03T+ETkDXyKl3DW+
         5lhYq9HPUu0gZK/zci2Mv/QhbuVuqv+yoRWqJ2rdA6DnOMN4g/2xZ50BI/bzxqElMna/
         DvGiSrhs4z2sMuvIOHpY20djcHyZMqTCUAnE2r42PVs+eQID9uiVQ1bfevt9uByzBsI9
         L7Tw==
X-Forwarded-Encrypted: i=1; AJvYcCXVOgecAPnhJw8Qf5g0TZnhy/QdII6KUhqn1H0FWY8XCQphSC7oMb8bS8G0+8A0Lg+bSAhBuvg8+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTCscC2xyloL12edUsk55LOg+/PGCXExpXcz48vi0E+fjisd3x
	tGyVfkrTMR9YigE6CZKmSPW8voUBSu/ruVUi21zHeM5bikaW+xkpDt+WGk9GyYoDiqw=
X-Gm-Gg: ASbGncsti4k388EQ0Jy4XXYpvGW4LGXDZId3KfBOPoYoXa23/YucnKu0q1sc19JkfMj
	NOo5AsO6itrZyvM9ZdegtHM0URlXeKp68GWZif/RihjxxP0RkJsuJB3O64aYHJTWURLOf7Redaq
	48FktpLCP/T6++FIIkJoEDNACc0JKNlVw7QHaJMT/8xXgIAIPm70J18w0/reqoIScin4J+e+3oi
	xbMVU4UVfh+MGPZ6hAjpeSrEO+DA5hr6Gqda1h7ZqKQ3Q1Px8SAUKIt3YmvpM9uxnbKUxrMeif3
	fnWesZJEFKKpBU3QI9xgzT6cRmLCKBkSEwxp4lnIj0Y8/gwxHOoF9GVzUkwDrKMQoLFNaMxRF4v
	DCPh2kvh9zvw=
X-Google-Smtp-Source: AGHT+IHdyoPC+reGPO2928s8eY4VkIUqzrYH+Trvh6vGBElbMDvsyr9bGCnwye0zSGLIyzetZNTdGw==
X-Received: by 2002:a05:6808:10c5:b0:3f8:3eeb:1192 with SMTP id 5614622812f47-41f98e4cbc4mr6102894b6e.27.1753040356463;
        Sun, 20 Jul 2025 12:39:16 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::1fec])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-41fd19b3e74sm2025039b6e.15.2025.07.20.12.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 12:39:15 -0700 (PDT)
Date: Sun, 20 Jul 2025 14:39:13 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC v2 7/7] pinctrl-scmi: remove unused struct member
Message-ID: <27a80ed0-65a3-4a41-994e-9c2d3bb76b54@sabinyo.mountain>
References: <cover.1753039612.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1753039612.git.dan.carpenter@linaro.org>

The ->nr_pins is not used so delete that.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/pinctrl-scmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 9a947ced0df7..372fa67589fb 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -45,7 +45,6 @@ struct scmi_pinctrl {
 	struct pinfunction *functions;
 	unsigned int nr_functions;
 	struct pinctrl_pin_desc *pins;
-	unsigned int nr_pins;
 	struct gpio_chip *gc;
 };
 
-- 
2.47.2

