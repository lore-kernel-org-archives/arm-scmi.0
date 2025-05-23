Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BB522256E
	for <arm-scmi@vger.kernel.org>; Fri, 23 May 2025 16:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748017868; cv=none; b=HthF8os92yPcIMSrt2FIxmVjYTgKlN1dbb+siplEqV0DNxPAt6ixsAE9+asXz055TaM4yQa2l2w0sBP9+lfXRkAzjr7LwPYbMHsn+H6pe6vv3McmlG1YMrvfEr5zQLLa+UGJTuMORLiJXj5yw9qRgdUUrLe6ilt0sSd/GWkI9Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748017868; c=relaxed/simple;
	bh=Gnya4kZJNaiLXSzvh+buuhUU5zQHKYGxGFiSUVggn2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lHIraK90mHBXI6iCpYAZ/BHuUwBeuYHBB7Vj2QDby6BIjk/a3b1Y82FlB1Zw6RgqAlxCIC8RhmLgWby/ASQAq+MbeD9TRYR3YPfjUGyAvtdkgnRo4AMnhWAQaHpPfq+ozM7XcGq5qkXiV2hfbzkbgOE3yZatDuUoPurVC6c+uEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EzTYcsH+; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EzTYcsH+"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4c9df6f92so55622f8f.0
        for <arm-scmi@vger.kernel.org>; Fri, 23 May 2025 09:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748017863; x=1748622663; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=igC70o8ybU294XiVgv2dCfqybHERyfthoQG4v5gTf+k=;
        b=EzTYcsH+ieJ5fX2NllerQTXMyQxKFnWPU+3zbOOEnfQRiaq/jJXyscLGoeTWraIOC4
         QkLYHyUABa1nYZdp8fpa5m1pa6qmn0aD7NZz/x2egfiXx+MY757sj23oAJfqVR8ly0dW
         iY5Pntf2btt5gHlj91fM5gALOTBgrT969EUKzobzzflnRwpvjjLnvInc0rkXeOwoo8ug
         iDNuInh8VmHqnATrgiOxdSbWT2xwLbOsvNh26Lp6KKmdrL9ZRocxF1EP4yZmjb7hhM6A
         hIythVqCjncip4OfeWhRSYAl/xFrdzW9QCla7qUrMoD9owVgwrHnPzFSwRptVKKrlBcl
         aR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748017863; x=1748622663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=igC70o8ybU294XiVgv2dCfqybHERyfthoQG4v5gTf+k=;
        b=YZBSef9AdiEEqJ5ocZk8oOeGvGWtMbP9VftVcv2Y9cd97Mb9Y5LFK6Nn/2rJH1rMT8
         sWZ+BH2kOGFS7GbImGR0ZTNJfaROLwlg2LFjDodBxvwkzPy34EcEm+lsizaSw6E7DA/8
         Oba4mPW/lGnj8kU5gB4jTft7wGFR+J4+HNKHE+fwAquBOJ4ZUFwngliUXniww+0Kw09U
         TJIbr7QtfpI/hj/PjdoaDaMHYJnP5PfYVUz8l66ZSxt3nTLqobgysDyb9oKWC9h4JgLS
         e+h2u+G3hqfjsHe6Ylz6Cq0RrDdM5oGjYw7oA7F62YYfrrbgnyqa+K5+XHeZZTKwwJ6f
         0+kA==
X-Forwarded-Encrypted: i=1; AJvYcCWHbyqSSOVdvG31swHbzbSffyrtBXs0wG3NlpSLz+3hp/vxxCf3UFyjtgek8wy46YzZFgfaWWdUfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwX3NZxN9UIlfjIzDJdvMbnqLOB3ddjEwhwyCUSPu41yNOLmbTA
	8RK6AqVDt8NwRx2UE9HLrDG27mf2p+BD4qhsJegyFuX8ws+IJqsTMUsS0i8Cbt7HTlk=
X-Gm-Gg: ASbGnctYpAX8IHawj3PmrlA1acUqxnuek/PpNcY8Ty0vaFqscmDB3zA0uK/QF7+oGgz
	8tNrSAkPcwHwjriYhbkkVnehjtAuTGcLheI2+A5cOulwtCA7AMOEVdX7rLqNcI+nI0QCXIvmFQB
	Mj/mcfXO8zv+hk7YliLAzEeeQHAziZVHq45QfhhZz1EcWVYq0YPP3iEkAJ9tjOl5r1sctyWs5f1
	CmnyjuKILLKitqK/omLyiFDkwMPpIifkHkTlHzBKtAwRhl2K59i4FP8vo3y6cFOFd+CVehOnIm3
	V/tYLmsJm38MOkNcAO11r6VdSY22qcYgLRHkHh+0IkNrYEFD9qwKn7W7
X-Google-Smtp-Source: AGHT+IGGTvjpF7sv2w5zjZ0EW0X+dRfZsZNJ1QvwQmRtd2GPgdBA3IhgoeMEt8+gF3DgVzVaSIQ1fw==
X-Received: by 2002:a05:6000:4202:b0:3a3:61b8:a637 with SMTP id ffacd0b85a97d-3a4c20f8dedmr3518632f8f.22.1748017862887;
        Fri, 23 May 2025 09:31:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-44804e89c42sm153252035e9.21.2025.05.23.09.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 09:31:02 -0700 (PDT)
Date: Fri, 23 May 2025 19:30:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: long.yunjian@zte.com.cn
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, peng.fan@nxp.com,
	florian.fainelli@broadcom.com, fang.yumeng@zte.com.cn,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, christophe.jaillet@wanadoo.fr,
	mou.yi@zte.com.cn, ouyang.maochun@zte.com.cn, xu.lifeng1@zte.com.cn
Subject: Re: [PATCH v2] firmware: arm_scmi: Use dev_err_probe() simplify the
 code
Message-ID: <aDCiwqwez8nzk5F8@stanley.mountain>
References: <20250521161449954uFxEsoI6Zg_7wDu6IAfWk@zte.com.cn>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521161449954uFxEsoI6Zg_7wDu6IAfWk@zte.com.cn>

On Wed, May 21, 2025 at 04:14:49PM +0800, long.yunjian@zte.com.cn wrote:
> From: Yumeng Fang <fang.yumeng@zte.com.cn>
> 
> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs.
> 
> Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
> ---
> v1 -> v2
> (1) Order the includes alphabetically.
> (2) Delete "ret = PTR_ERR(*)", and then replace ret in dev_err_probe with "PTR_ERR(*)".
> 
>  .../firmware/arm_scmi/transports/mailbox.c    | 20 +++++++------------
>  1 file changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
> index bd041c99b92b..764cbeac2492 100644
> --- a/drivers/firmware/arm_scmi/transports/mailbox.c
> +++ b/drivers/firmware/arm_scmi/transports/mailbox.c
> @@ -8,6 +8,7 @@
> 
>  #include <linux/err.h>
>  #include <linux/device.h>
> +#include <linux/dev_printk.h>
>  #include <linux/mailbox_client.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> @@ -214,31 +215,24 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
> 
>  	smbox->chan = mbox_request_channel(cl, tx ? 0 : p2a_chan);
>  	if (IS_ERR(smbox->chan)) {
> -		ret = PTR_ERR(smbox->chan);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(cdev,
> -				"failed to request SCMI %s mailbox\n", desc);
> -		return ret;
> +		return dev_err_probe(cdev, PTR_ERR(smbox->chan),
> +				     "failed to request SCMI %s mailbox\n", desc);
>  	}

Remove the { } braces as well.  They will cause a checkpatch problem if
you re-run checkpatch.pl --strict on the resulting file.  Same for the
other two as well.

regards,
dan carpenter

