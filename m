Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889893EE1D6
	for <arm-scmi@vger.kernel.org>; Fri, 27 Mar 2026 13:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774617170; cv=none; b=tr4Zegag1/xgHSCwFLHSCmcU95+i610Dsc6/p0JVH9YRnSgpsIE95wsKRAF1PyA+WYf/kLD8494DXviXrEHOed2BFCoU7virf7TofdaoJkaWbgyGVVpB0agoUMZywxAkPFtVtofUFTlQf6VMJNc8N6KxizJNb6586aTrmMEGeBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774617170; c=relaxed/simple;
	bh=6oGJhNhZmGU+yJ7Tz1KcPPgsv6YSSjgbM1ypOImE1TI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kubGA4J1cI1/u02JWr7peDUEQDjTxzjJKgAjkCBoiMpi134xhqKC8/+WYfquoudRe4hkIFTOnNP+D7A1ojGT2mzJVGW9BuAofQfFLRv8SIO/ig0EfstRr6ZM3sVcepuKbVbxKW0kL4Zil1e778TG8uTzQgzX3PqYat9d/JNGF2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q0i+ur0Z; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q0i+ur0Z"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so21343105e9.2
        for <arm-scmi@vger.kernel.org>; Fri, 27 Mar 2026 06:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774617167; x=1775221967; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yFcQ4Sl0ZMU698JmoMJ07dM7B4EObVEuLCmaVE+8m2E=;
        b=Q0i+ur0Z16H4TR4Ps3EM14bMQBuLIn/p2ZBFYtnYACX0KLnpV7+xIOqcMVF/UDaDfD
         lCJu9iV4myghEewb/Bcu3i58Ybr934EjDNpoqKcsPURDDOsHhO5bzLhOKIFtN/OKHqc6
         xBedLiVeM0gsjJsTYXidV9zG7LB8kuIT8rC6MhnJqAjtYum1Ym0HThHUDtnC9Rkmkylu
         IempubHwk/RugfKcXr6SVIfohJGcfiX1V2jRg5iS9Ffa+D+lPN2t1qgCGHem21SJQc7/
         uZVOwAt5V3Ax7ENUuIVoLPHshtyFzK+25tvuNBJD6HcGimkbDYiJxEykdYshn1+NV3Zw
         8+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774617167; x=1775221967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yFcQ4Sl0ZMU698JmoMJ07dM7B4EObVEuLCmaVE+8m2E=;
        b=ApimosQOpuRyHNzRqfRmKoGkl7ZD4/0xfsTDfm8J/bWJWBUpsVN42SDHC6ZPJjyGXF
         vwLUpdxRK61Gtm/8f7Oz9Az75NIssoTDFu4WrvP6tDX+i915oC5sjUiBnVl6Jqzho4Z1
         06FgB4WABkfpqJnDVAxIixMrWu7HsJqQfkorJUFyH9AM5s1+Nuqt2PI5BN6ZVyxmuLVY
         56v7xezBExRUKkpnAR4ZPDOjiT391rVjkJg0aaaYr6WrNxgtr/qdxQ3mTgHVMYtTR7qh
         wtbHSGiZuB/hzqdK8kwUvkyvpN3BZawfFOsKoXGkPA5qdkuyATL7dpgq1jZDRFVAiNSi
         EwhA==
X-Forwarded-Encrypted: i=1; AJvYcCXQvPB7ZmZi/TGMlk4/PcFbusxRGpohSGO5jd9AlY8UQN/en0010zrn0uMjKIZwKoLdER4O2v75Og==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9nGo4CEeU4VorGAeWcVyqdi4fZGyBAA2R17VDIkCtkikicHBK
	3k0MzHf67b1zy4qBOhfy9AgIGzKsEEasr+qfFP/w/2E206pGUFYEC5IdPg7FkCRcajA=
X-Gm-Gg: ATEYQzzhpNk+kOtUMoXK2faxlRxKSxAtzFxvvHnVzRtsRtBgrpyMSaXXE4Vd2puxBs2
	+8gGYqZhtOfDSqbIF0FAWuuw2Lx6WBsPGzytUxDgNPE8K4JSjzhdcUsYcu0UyoHCFMFlddtuQT+
	X/6/yzncVz6byIHqzOY+aUek16t7KHRob7Vsh7TRLXEyiYolcwqGaXPlb383pna5Zp+R1MunV/E
	dyLpaBYwXH9cDYK0c+mLCoDAQIsLw0IvrMz1uG+JfB40YVhuweyolCqV836WrhCpFgueNhm8tnF
	4hIBYn/2cPklARx+HokHZ4FCqYNCWuNLlghy8GuowvH2pxADFqAI//94EdwgLn/MzhJJhmnZi6U
	KayrQNoNx/tLnXuuKqpiBK0q0OjdixqC+KGnJziKiQPdsCeRaWJUzHtW+9jiA+XMwY2JdBAJbnp
	7Menn800kkB58TyDtXsZ30R0SpAJZu
X-Received: by 2002:a05:600c:a44:b0:486:fbf6:abd4 with SMTP id 5b1f17b1804b1-48727efc11dmr36124745e9.9.1774617166813;
        Fri, 27 Mar 2026 06:12:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725eb5417sm25845595e9.3.2026.03.27.06.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 06:12:46 -0700 (PDT)
Date: Fri, 27 Mar 2026 16:12:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michal Simek <michal.simek@amd.com>
Cc: Peng Fan <peng.fan@nxp.com>, Tom Rini <trini@konsulko.com>,
	u-boot@lists.denx.de, Vincent Guittot <vincent.guittot@linaro.org>,
	arm-scmi@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH 1/2] firmware: scmi: Fix setting the function
Message-ID: <acaCS0DdVEilbygK@stanley.mountain>
References: <cover.1774526652.git.dan.carpenter@linaro.org>
 <401560217b674c299cb0f344e6f24c271fa7583a.1774526652.git.dan.carpenter@linaro.org>
 <93019930-f082-445c-a3c4-90024aadbf60@amd.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93019930-f082-445c-a3c4-90024aadbf60@amd.com>

On Fri, Mar 27, 2026 at 12:45:00PM +0100, Michal Simek wrote:
> 
> 
> On 3/26/26 13:08, Dan Carpenter wrote:
> > Set BIT(10) when the function needs to be set, otherwise the setting is
> > ignored.
> > 
> > Fixes: 1048331f5d3c ("scmi: pinctrl: add pinctrl driver for SCMI")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >   drivers/firmware/scmi/pinctrl.c | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/firmware/scmi/pinctrl.c b/drivers/firmware/scmi/pinctrl.c
> > index 47f7a8ad9b81..e670538c87f9 100644
> > --- a/drivers/firmware/scmi/pinctrl.c
> > +++ b/drivers/firmware/scmi/pinctrl.c
> > @@ -259,6 +259,8 @@ static int scmi_pinctrl_settings_configure_helper(struct udevice *dev,
> >   	in->attr = 0;
> >   	in->attr |= FIELD_PREP(GENMASK(9, 2), num_configs);
> >   	in->attr |= FIELD_PREP(GENMASK(1, 0), select_type);
> > +	if (function_id != SCMI_PINCTRL_FUNCTION_NONE)
> > +		in->attr |= BIT(10);
> 
> hm shouldn't be macros to use for holding that value instead?
> 
> As I see GENMASK above is the same case.
> 

I think adding macros here would make the code less readable...  If we
were going to re-use them then, sure.  But really, the code is shoving
the num_configs into bits 2-9, there isn't any special meaning beyond
that.

> >   	memcpy(in->configs, configs, num_configs * sizeof(u32) * 2);
> 
> Another magic here.

Sure, I'll send this patch on Monday.

regards,
dan carpenter

diff --git a/drivers/firmware/scmi/pinctrl.c b/drivers/firmware/scmi/pinctrl.c
index e670538c87f9..2ae02ffc81b8 100644
--- a/drivers/firmware/scmi/pinctrl.c
+++ b/drivers/firmware/scmi/pinctrl.c
@@ -245,7 +245,9 @@ static int scmi_pinctrl_settings_configure_helper(struct udevice *dev,
 		.out_msg = (u8 *)&out,
 		.out_msg_sz = sizeof(out),
 	};
-	size_t in_sz = sizeof(*in) + (num_configs * sizeof(u32) * 2);
+	/* configs are type/value pairs of size u32 */
+	size_t config_size = (num_configs * sizeof(u32) * 2);
+	size_t in_sz = sizeof(*in) + config_size;
 	int ret;
 
 	in = kzalloc(in_sz, GFP_KERNEL);
@@ -261,7 +263,7 @@ static int scmi_pinctrl_settings_configure_helper(struct udevice *dev,
 	in->attr |= FIELD_PREP(GENMASK(1, 0), select_type);
 	if (function_id != SCMI_PINCTRL_FUNCTION_NONE)
 		in->attr |= BIT(10);
-	memcpy(in->configs, configs, num_configs * sizeof(u32) * 2);
+	memcpy(in->configs, configs, config_size);
 
 	ret = devm_scmi_process_msg(dev, &msg);
 	if (ret)

