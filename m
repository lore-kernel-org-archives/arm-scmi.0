Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0097B224D7
	for <arm-scmi@vger.kernel.org>; Thu, 15 May 2025 13:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747315005; cv=none; b=gcpl4c8zqj/hREQoZS6c23y0/EtYJ/bD9Yf158ymFMY06glnAGVvweoIqXSmYKoJaH97+KFazwd1iOHAXkkvbaKNO51E4DjbxoDznK5l6YcIcskvk21pTXtsL0QwtbXiT4TA/Hog+tbC5m9XbuDHmLIVsUBxZNprKQUFYEFEQSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747315005; c=relaxed/simple;
	bh=CtoTKRl6rcm+Kyu8j/4hENkSu9gJjRpE9Z4Ou7rhhiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KNmjnp6k5k10M64IruAMhiBro3kc6p3gpe9mEfzXAAEHXhKNeVEmuBiJVJOj5lSdNXFmtlsvGvqnJTzfFTIbzfgi7Fr4FLV304tntvvBlBYGzVi69gYNPX+M8N6aFKT2wI95JOIP/yorodv3eoC8M7Ce2QNMNsyddRJEcOSe1L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hdLjLtow; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hdLjLtow"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54298ec925bso1343646e87.3
        for <arm-scmi@vger.kernel.org>; Thu, 15 May 2025 06:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747315002; x=1747919802; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HsRjF6iBA0jVUvpTn7ZmwcFOLlij9sfjwslA/3l3Yjg=;
        b=hdLjLtowdbwniYOIL5aB4OaKGQftH1kyFzXv0UbdorKUTTZGpL2Gu1rYxRQAWZwJZ4
         EYhLSegXn0YLAd9uPKYM6KW2QABpCl9PuDQn/nZjV07uUdIQ0TF3m9BuPtF3KwXaM7/2
         p/7fv25KrSAASto7mG9hF0NwbdfsAGEKFaknEebsk/kkiCMW6QD+lzGHJR0B++EP3Nab
         HQyF9wfcSYc79MWb/IiXnRh1jp8BIyppbK3wVjS3NBFL3lPhIPod7uvIdoogsLpTlYio
         jvf9VZJsYldDaC8//x1UViH1VALBB2qiQ2fetOFvJLtCc+5n5MhwO8SfvrWz+ZpUiomJ
         UEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747315002; x=1747919802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HsRjF6iBA0jVUvpTn7ZmwcFOLlij9sfjwslA/3l3Yjg=;
        b=tUJB4g41UvNnaGcQs43pcNiBQRQHpw2Z/sPO+qKk3RYjMHV9AlrpesmvzD8pIbcMLJ
         c5RzDumyyS5zpBoLRfukvnYlz7VvRjqfm48NzSp7kNDJllE2tyFhRtRjW7Ty51dGay1E
         I8YtxAIovgYMEbcdR0lKQH17ChVVihdPJKQSlN4+Gpb+Sn/ZwfzlKC6TBfP49Ei9pQjd
         9im4wFMpQOgeerEWTHQ85NpDztCTGM7G2dakCOCfo0i+WMdCjUKe7vWNraBhdWVxmtfG
         1/NE2/4ckXTvJameb1RVWEprzrFiTDLIkfYv4HRcna+ZiUhO++Oz8EiHElxvkyMdNwuK
         ++Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWi4u2IUERznAKPwrtH00lrIl1djSUH0VRF1OXn23SEOWoleahKfVujv80GFj6PdPL7WewLd3HaEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUR1e6UwfNbmYRfJMeBeb9kUORP1CeA0kx4IBpYjLWRbFBYCPB
	KGr+kqQ8rypBiufrDfMQd7LyIPM4NE/JKWJ6y8Pqfp+2eb3BgA2spesdOTs17an5yA3gQ/3XxuR
	8saM=
X-Gm-Gg: ASbGncucBu6qOcDglEJk110siXqp6SKx13HXiu9gv27yJlh5e4CrOa3onpFPlFiuii1
	BUNag4+sGQ79i1WJpEQLv/uOEWaHiPYCDR079Q5E+GsY5OTOZhl4D2U0XgwdEQug0jPt5mm6xzs
	J/COZGpPL5uSgzLdeUP72OWKoEi2h9Wk//i2rFFMtKC1OuCtUGgElNwaxVw2xs+C31ZrjG8e7mM
	T2RUyETMz8eS4x7gWpvJ303p7v9Y8E3Kc08ojJKTK9gyxIHJaw30VfYHCQ0psZzUDeH+s9T4a2g
	I6y0lALQZ4lJUdqjW6PnvUNbHr5iMf4VpFUNPEJdVV8nP8zywZ6SzlZopNgCEwvtKMrzbld3BqS
	uzRcyvw==
X-Google-Smtp-Source: AGHT+IEJPKvWe72TF7EByB4gPExTJZy2vEZ4XGn1I+zI8Qjp4rqHO9xavu6r1HaPWrHK/wY0PTR48Q==
X-Received: by 2002:a05:6000:240a:b0:39c:30fc:20 with SMTP id ffacd0b85a97d-3a349922795mr6543267f8f.37.1747314991164;
        Thu, 15 May 2025 06:16:31 -0700 (PDT)
Received: from localhost (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35c12d134sm403876f8f.47.2025.05.15.06.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 06:16:30 -0700 (PDT)
Date: Thu, 15 May 2025 16:16:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: long.yunjian@zte.com.cn
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, peng.fan@nxp.com,
	justin.chen@broadcom.com, florian.fainelli@broadcom.com,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, fang.yumeng@zte.com.cn,
	mou.yi@zte.com.cn, ouyang.maochun@zte.com.cn, xu.lifeng1@zte.com.cn
Subject: Re: [PATCH] firmware: arm_scmi: Use dev_err_probe() simplify the code
Message-ID: <21435bc6-d4d7-4576-8ff6-266ce9507799@suswa.mountain>
References: <20250515203855146Sn9x-Uw9Teur35mOjn41C@zte.com.cn>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515203855146Sn9x-Uw9Teur35mOjn41C@zte.com.cn>

On Thu, May 15, 2025 at 08:38:55PM +0800, long.yunjian@zte.com.cn wrote:
> From: Yumeng Fang <fang.yumeng@zte.com.cn>
> 
> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs.
> 
> Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>

When you're resending someone else's patch you need to add your own
Signed-off-by: line to the end of the list.

Please, could you resend a v2 patch with your signature?

> ---
>  drivers/firmware/arm_scmi/transports/mailbox.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
> index bd041c99b92b..816e79537935 100644
> --- a/drivers/firmware/arm_scmi/transports/mailbox.c
> +++ b/drivers/firmware/arm_scmi/transports/mailbox.c
> @@ -13,6 +13,7 @@
>  #include <linux/of_address.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> +#include <linux/dev_printk.h>
> 
>  #include "../common.h"
> 
> @@ -215,10 +216,8 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
>  	smbox->chan = mbox_request_channel(cl, tx ? 0 : p2a_chan);
>  	if (IS_ERR(smbox->chan)) {
>  		ret = PTR_ERR(smbox->chan);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(cdev,
> -				"failed to request SCMI %s mailbox\n", desc);
> -		return ret;
> +		return dev_err_probe(cdev, ret,

It's probably better to get rid of the "ret = PTR_ERR(smbox->chan);"
assignment as well.  Then it's a one liner:

  	if (IS_ERR(smbox->chan))
		return dev_err_probe(cdev, PTR_ERR(smbox->chan),
				     "failed to request SCMI %s mailbox\n", desc);

Same for the others as well.

regards,
dan carpenter


