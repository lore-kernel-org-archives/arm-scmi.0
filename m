Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE5D3F0777
	for <arm-scmi@vger.kernel.org>; Thu, 26 Mar 2026 12:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774526908; cv=none; b=M2UCJFinoJ6CoEjBe8gZXZe4WPe/tRDyNcRNjqRP6w26v/eD6fRJqLtuIQ5Tls3nakFlPBzUY6hfsDs5UYBTjk79EbVVokBhRI68NrzQlX2thrL0gjUh2wK1dgTSfeZIldhujgUkKWlZZgnTyf3Zfpvb+tUl0bK+IA9CBrsjBOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774526908; c=relaxed/simple;
	bh=2Z7dVYtlKlS90p+D8Teb963VJv2ABi+4CVgU8kMkYow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kfn500N5792GUOT0RDXTShLBbfzZL7YPLiVZRMP6leWnWpBgzY/u/kfU24Zpmbyfwamzl3jt7AHi5MWIAtNJpG8nsoComMToHoz+7xIPuONjmVUaCWRXjWhsPquVY/h86feg2jhj7H4Lhc4xDDi0DizU+Eogstuy9vH08sXYUZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mpaXq9hH; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mpaXq9hH"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486fe36cfabso10325765e9.1
        for <arm-scmi@vger.kernel.org>; Thu, 26 Mar 2026 05:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774526903; x=1775131703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gVQKnJrqFmndyfPGajYI2v1TJJhYYnjqTw5bKsVt/5U=;
        b=mpaXq9hHQt5hMuk7upVCvXr93rID2bzqCEpTHLhKuKVN536vCwAeoqW9jYWo+l50/w
         gYAgWrE6+nWkPp9wlvNBebk6sx7CL7IpjFqhSjWGJrm4otsaJXJNy6GSXWiWSy3d/4D2
         QFADdAYYJGf2aNZPAGjMpCfUkn3+X0DCSNkdcnjtP7BM25MGh+DpyCbO+7Tmeoo3LKTI
         +eXl4mUnmmsGsp40XG1fJAAFEg23MUqb+7vfXiP65xVNWe3/FZ3nKBUpYa68QDFB3xSG
         PpSMQjbIA8p4/obM1PHBIhl3NZTAPDw/OizNyraPpIE5bvex939URaxAXK3nOijo5cR8
         SzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774526903; x=1775131703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gVQKnJrqFmndyfPGajYI2v1TJJhYYnjqTw5bKsVt/5U=;
        b=nmHsR9IL/KOzIUfujUsBZmeo9a4nWx/J1HtG/vO51ZLMIVJuS8t9SSRXXafrn0tQYo
         cYlW/rl0VcP7YLfH7Q+PiaHBgbMM1810qcR5P7nwD9OQF72/8CkKBsZXhe6wR5f8dI7/
         rUX7vV0WiwWvlj5/SMYh0Jj2v1A7taH44by6jP6MN5DyQZHS3IhnFDQVfosTAOx5HRyN
         NTLaEf7VYOY8Wk9wEY2jaajIObQ/c/ZPUBq1J0sEfuCwAwwobh5XOXkR/QlWEqN1UroZ
         zMrfVm5bPQusltY+2G7I2VbJlsWqogLeIPfnq+AAj44X2LsCmo6nSuERC0okSb9ajMCY
         XecQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzpuCXGts2X5Qw0cCmN/BSnzNB5SMzMz5labOuN8fdwCza1atnoP40QS6Sn9JenseKh4sc5ilQcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YySfIlV9W4HNA778nG5FDqXD7sZGjsSEhkGayyUf7h/BAavj6YN
	fWkVLgr5JFLK7+OiOaiEmpqqcR/rB4teq9LfKc1lGqt29YifM8v+4EQRfKRyL9kEEOQ=
X-Gm-Gg: ATEYQzxw7I2+Q4Olohtwy3GgGb6bmuGOK3sy3n0gbfOlf+AZirb4lNuIj07lbSC54BQ
	GKeO7jgmyzbyBdkxaHcL5UIkNpip2uDfiENlxQ1B6k2mR05KX63I96kvaJmcBheoG5Hya1cYoqN
	7grJdYvs0AczPu1laPut9EfQpzPCRWT3Msj1GVn0zNSuzR4DuErK2FizQdeFU2o1wTMhVojD8ZF
	+4vG63k24EKMlchERs5rSN8SVHOEjBFlyRuFHcgvb1x5K2Juv/VPzxza85ceR7p+5MBdyeaR6/h
	t2HGxngFnTRyC2iXn1KPNA0U6cNYxUHwv6v7zBNxw7bn7UlrD+4DBvUlSOnD1kx0P1t0fD+NLZQ
	NbabmRM0eHJU5P6gGPvUQNZtdDTeVDd46NRAZmodSxQ5yyvOI/slWhE/BkGVCcQt/UFtlmG1Y6J
	bclT973WgUKcyF0Mgm5wZPAChl2jUD
X-Received: by 2002:a05:600c:4e4f:b0:485:50ac:b8cf with SMTP id 5b1f17b1804b1-48722ad3f0fmr22947665e9.0.1774526903352;
        Thu, 26 Mar 2026 05:08:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48720925591sm13483345e9.25.2026.03.26.05.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 05:08:22 -0700 (PDT)
Date: Thu, 26 Mar 2026 15:08:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>, Tom Rini <trini@konsulko.com>,
	u-boot@lists.denx.de, Vincent Guittot <vincent.guittot@linaro.org>,
	Michal Simek <michal.simek@amd.com>, arm-scmi@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH 1/2] firmware: scmi: Fix setting the function
Message-ID: <401560217b674c299cb0f344e6f24c271fa7583a.1774526652.git.dan.carpenter@linaro.org>
References: <cover.1774526652.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1774526652.git.dan.carpenter@linaro.org>

Set BIT(10) when the function needs to be set, otherwise the setting is
ignored.

Fixes: 1048331f5d3c ("scmi: pinctrl: add pinctrl driver for SCMI")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/firmware/scmi/pinctrl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/scmi/pinctrl.c b/drivers/firmware/scmi/pinctrl.c
index 47f7a8ad9b81..e670538c87f9 100644
--- a/drivers/firmware/scmi/pinctrl.c
+++ b/drivers/firmware/scmi/pinctrl.c
@@ -259,6 +259,8 @@ static int scmi_pinctrl_settings_configure_helper(struct udevice *dev,
 	in->attr = 0;
 	in->attr |= FIELD_PREP(GENMASK(9, 2), num_configs);
 	in->attr |= FIELD_PREP(GENMASK(1, 0), select_type);
+	if (function_id != SCMI_PINCTRL_FUNCTION_NONE)
+		in->attr |= BIT(10);
 	memcpy(in->configs, configs, num_configs * sizeof(u32) * 2);
 
 	ret = devm_scmi_process_msg(dev, &msg);
-- 
2.53.0

