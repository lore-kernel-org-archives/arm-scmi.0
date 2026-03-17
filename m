Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C714B3E8683
	for <arm-scmi@vger.kernel.org>; Tue, 17 Mar 2026 14:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758457; cv=none; b=lJF1qBuUDDCdSwgKj55wEKkZkbzFaUZQAVJqxw6MB6f5OGDCKas0JANP2QnB2ryPVu+0ACntdfsrDra6klKWwESgBqgaisBf4q4Shni5XSEdMWzsjVHBicb6c0sH3baxFT9Zf50X8IhFXh/Y5B5IxCAw8Fc7cia+7R+5ZaaYSlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758457; c=relaxed/simple;
	bh=oPCxjt4ZglPl8FoPqS5zHJsj9PgEDc57nito/qfRjsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iI8gGqdr5tskyC2L9nV/4IfmGKcuBjDwJns83E7KnUykac2Z3fVVIAC0xCxXnXVcvP1CY/dZjKUL/aIwkpNK7Qknd/iHf9xjbQ841miR3kZiXfummPyKm2mIgWPcwlwtGG0edxicY/saVaf/JVxbOUnB/lmlb8pulD9DMR9erF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cGSCG8Zt; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cGSCG8Zt"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-485445e80bdso51062065e9.0
        for <arm-scmi@vger.kernel.org>; Tue, 17 Mar 2026 07:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773758454; x=1774363254; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1C8bQzpx/uEkLcacI23jZqCv23os2UdSq0AA05SZO0k=;
        b=cGSCG8ZtVhqWQw4H4wZBwM70A16nHRNqpboTGe6wTZD1izRvQvbOFXDvclO9dLpvA0
         Joys7WJvE6GsBkS7iiO0mM/f/3v/XcR4JtEiG+4Iy28V1wDgLXEocbG9j18TpkP/9qb6
         M+Y7WnbJODLGJpo6mtluXbQpZSbFou0Qol6l/3bGpR6z8p/xfaBSUWhSmJXSp+Z9eOVG
         nc4Q195GvB6A4KqtXJxxmyqOGoy8+XPuXhzYphloWZ7An/XGu2mULhIbVzWDIcDiZ7f8
         j+8CCo6BrFVvsjAwq9+p7+mlXe+KRj/KtWDEpBJcTE7HbJkZviw3fUWpgYDzY2HVoIkb
         lqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773758454; x=1774363254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1C8bQzpx/uEkLcacI23jZqCv23os2UdSq0AA05SZO0k=;
        b=Yp0pEa2JFDRozB1/N2lYDSvPyAbEtJomH0+bbrByAhR9F6WA6yOr4F+Hl7x8kG6XCw
         WeUnw0whQYM7PVfwETnbQQqWEon2Mrgu+2D6fPhy/w33wBJMRcxrSX/8iNf2YIqByE1h
         LP4vCp2TeoCNZfcKX+wyY9uiWrlENwTFGPqQ/+0/JchHbCNw6JsnJYb4IKrpEArWtAAC
         /VFvsfQOKdAboHp1t3EynGZEFRJEc4fu6EEacxO98fXOBfGXm5P+lQCjHsCp2lqAYHiD
         k+b2WnFtE4pem9R6yfkJZ+MWuA6vR9dC54X2LJ0g9HbEfBRfzxyIG5LSuHSAlapdqf8X
         onfA==
X-Forwarded-Encrypted: i=1; AJvYcCUcaf0XWJxAzTg2ivEn2GtrdRRuA2HiREZWOO+GyQYAz3bOQ1Upt5pMBmBuyECDs64zR/YNqSeTXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzB9WFByR42UfDbu5pNC0VfoaCXCFVpWCPYIfGWteO8d0E0BNyO
	KAr4OSa4S6kQX28JVFx6esUG//JS9pdyJC80SyUcMrVAi4xLrys2VbQDd01P+LWDG+E=
X-Gm-Gg: ATEYQzxr1MctOt1HLjJB/9WasK4pDyULjKXcNKqlpdduxUFsfpSYtQw+QemFJVxTKo4
	3Xz2UIqOg+8j6oeW22tWblTWFOoRm5pYn2jjBM++VR66csySvuSECQCJMG0HOIgkEzzYJ+Ab881
	6vuXnw9Ypj2gToHM4v9muBAXO4plmvjl2mAODVXaVZohirazGbPmv0VpV4r2Cxh7kRWuLr875xB
	FfQCWclMdqQ2jGFIIAqH1ZzabpLoToWm+pQ7xNKvld0BFouBLF4UTL9mtu6EysPO0R/ohXgV3tS
	byFWPkFUr30jp9vIbiX6r9MXdkdtyfJupMrTz0wFjh6J5GoOLRtcX7DlJyoFCt2yyFFjiPl4X3j
	F3nL1Ph8eO2Tbddwx5WTR4NkFZPMzxe1udQyfi0eEos9ASiWMU2Hx6o5SSFv3HFTeFQMZjkpVDS
	6mKIWNo6MF+rzDXAF8jmR7WlH1KUGn
X-Received: by 2002:a05:600c:3b90:b0:485:345b:ccb1 with SMTP id 5b1f17b1804b1-48556720f86mr269439545e9.27.1773758453766;
        Tue, 17 Mar 2026 07:40:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4855640d915sm118222495e9.4.2026.03.17.07.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:40:53 -0700 (PDT)
Date: Tue, 17 Mar 2026 17:40:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v4 5/7] arm_scmi: pinctrl: allow PINCTRL_REQUEST to return
 EOPNOTSUPP
Message-ID: <aee820fd35412fc8679558e7df4a912f1fe27f5f.1773757772.git.dan.carpenter@linaro.org>
References: <cover.1773757772.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1773757772.git.dan.carpenter@linaro.org>

The SCMI protocol specification says that the PINCTRL_REQUEST and
PINCTRL_RELEASE commands are optional.  So if the SCMI server returns
-EOPNOTSUPP, then treat that as success and continue.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/pinctrl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index a020e23d7c49..42cb1aef1fe1 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -578,6 +578,8 @@ static int scmi_pinctrl_request_free(const struct scmi_protocol_handle *ph,
 	tx->flags = cpu_to_le32(type);
 
 	ret = ph->xops->do_xfer(ph, t);
+	if (ret == -EOPNOTSUPP)
+		ret = 0;
 	ph->xops->xfer_put(ph, t);
 
 	return ret;
-- 
2.51.0

