Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6D314F117
	for <arm-scmi@vger.kernel.org>; Tue, 17 Dec 2024 05:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734414716; cv=none; b=HaOyY/U/xOaFiXgcvyw35Dlht+cF1eoRqBpVj2zg7fhiGSHFDxiCjJJGFGbLQq9LSZy0/Ybyw10ugGtNoPgkbANt8ovBrR6/LDxqo4FklMIpT4zcumGNp2H6PAq+TBR24QSoq0py4/CLy4BlfJm8z4D1/dVjjlax/ObF1R1JxN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734414716; c=relaxed/simple;
	bh=Iod7SOkLycEX/ne8mUKbgVf8RqIdPwuAu64pSK2I0/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P9LT9EZaGGGf6LT5+UGGJqbi2+NHbdyeI5C8uEXV19VySWUU8m+TXY9e73risRKxPrlktQalgXHc4lHvBPCzsBSj4tkNjzfsqKk7ZsCR+Mwf8TjF5dGQWFjrgKwmgLC/lPUsW1wiaWOpWIoAkdUbunLi3ywjXUhstPXVL4wd0lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T0FivseS; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T0FivseS"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa679ad4265so1097257666b.0
        for <arm-scmi@vger.kernel.org>; Mon, 16 Dec 2024 21:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734414713; x=1735019513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QFf0X/Byt/6qpUoLsTa6eO+Wq9Q9qJMQficV3UswUFA=;
        b=T0FivseSAN7kVH+HFDG/l+8SaBRSfhjB2cQhtmMQHeywmBNYtVkF7aqtoFiVN1z6Ii
         kl9hmmwQHh4cMhWjAQovcGH+srBEaKKMNFH7ax/RSMgqY5XR7Gh5Fv/iELJbuEUOk1tk
         EUMFm8TVEwFkzH9Qr0LBHto6Em4kqNsL5wV1k/4ZAF0cvzg7ZAuWpRHiSz7RJI78U3Lz
         G8wgnYHUcXNTdlrZaZiK/9mjpaLpXBF0DIkd3dYAwmGz5KUboAVbZQjmIDbf6KMBVbMI
         /CF2/48kCW/f/sYntCUSEP+fJ3VOUBchHyZhH87TY3/aOAXm1jpcufttWzjLxcASoQXk
         KwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734414713; x=1735019513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QFf0X/Byt/6qpUoLsTa6eO+Wq9Q9qJMQficV3UswUFA=;
        b=bF5lY+dc3vyzPUjH/6w4mC0Nyc5I3PzjpZ/B60fs/+NFJL1cUKYLgh2qrNKKLB3P/4
         iFVC2yB041WSzoy7dyGLXvg1DeU5FSNBcPQeH5mVkAX0N35vyPh8R0741hdsmeXuw+Uc
         +sFmgPXca2UkZpd2bJ0pG3+sIHoRa1Tp6pD+GeOHRIjZF/xExzCGUCKZTJO2bbQCQ1ij
         ORmXkhkUA9jLQEswVzCIIRdHqwLFeFmptLzQrYzJx9iD059u9cJIt7UPhgWKhhuXL3SN
         JdA1xRYcGC2ouYdt61yIFL5XNXBF6u4+ABLAmjCphzHu3JPReGjbNlaIAJ+uJ71/9gM1
         ctww==
X-Forwarded-Encrypted: i=1; AJvYcCX7/DDqOdd0s0my2BcKFA1HFu8T0vnWEKKYg3r0jTUehDI+RVrNRr3Egh0kzFqTRff4jJE1XKpFhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXHvowMf2QeFqMtNjjLT0AbxU4vK5qGx3tuSnuUeV3+uW7xRAN
	kZlLbBo1m6XgiuZu/fVOYrTKXaYfatGbQ6+km22hREyZoG6OQ3sSFCUrhBcRLtM=
X-Gm-Gg: ASbGncs50MpYr5YGYkMoKNmnYf6qOgGz6VNO32bmQK3Li3s6TZoRaDF315dCIlqFF1/
	gX0NAbwPavwny+be10EMapP4Ms9J6wPCSUEulaxJ5Q4pSTahQ7gdXkET5P3Y6jp4zMaptiW8S1j
	yzQNllKxHbmK4foACeQiu7XploExG0XrgLUdlXOyCk7ZS8QNHkyvdGDBrtK2osF400mt9/1Johp
	GlkDk2OVCcUTdAqnRoVEIv+18ONzgbFnnK0wAprF7ZZb7c7DhFk/O9gxozyvA==
X-Google-Smtp-Source: AGHT+IHJ8MUWwIzuECZISpBpW9hFjRzFi4gxg8Ui1DCfsI0rExMAH9ctQ+yTGfdMXMrcnPqfiGbnCQ==
X-Received: by 2002:a17:907:5cd:b0:aab:daed:9ee9 with SMTP id a640c23a62f3a-aabdc834149mr171666066b.6.1734414712760;
        Mon, 16 Dec 2024 21:51:52 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab9638ac9asm405354566b.141.2024.12.16.21.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 21:51:52 -0800 (PST)
Date: Tue, 17 Dec 2024 08:51:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com,
	arm-scmi@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: fix an OF node reference leak in
 scmi_txrx_setup()
Message-ID: <77ed017b-c5c9-4a41-aaf5-e0447c102260@stanley.mountain>
References: <20241217023122.3927401-1-joe@pf.is.s.u-tokyo.ac.jp>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217023122.3927401-1-joe@pf.is.s.u-tokyo.ac.jp>

On Tue, Dec 17, 2024 at 11:31:22AM +0900, Joe Hattori wrote:
> scmi_txrx_setup() calls scmi_chan_setup(), which increments the refcount
> of the given OF node. When the Rx channel setup fails with ENOMEM,
> scmi_chan_setup() returns the error, but does not release the OF node
> obtained in the Tx channel setup. Thus, add an of_node_put() call when
> the Rx setup fails with ENOMEM.
> 
> This bug was found by an experimental static analysis tool that I am
> developing.
>

No, the patch is wrong.

Your static checker has missed the call to of_node_get(of_node).  Only
the success path takes a reference to the of_node.  To be honest, I
think the success path should drop the reference.  Generally with
firmware nodes, we hold the reference for very short time.

drivers/firmware/arm_scmi/driver.c
  2615  static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
  2616                             int prot_id, bool tx)
  2617  {
  2618          int ret, idx;
  2619          char name[32];
  2620          struct scmi_chan_info *cinfo;
  2621          struct idr *idr;
  2622          struct scmi_device *tdev = NULL;
  2623  
  2624          /* Transmit channel is first entry i.e. index 0 */
  2625          idx = tx ? 0 : 1;
  2626          idr = tx ? &info->tx_idr : &info->rx_idr;
  2627  
  2628          if (!info->desc->ops->chan_available(of_node, idx)) {
  2629                  cinfo = idr_find(idr, SCMI_PROTOCOL_BASE);
  2630                  if (unlikely(!cinfo)) /* Possible only if platform has no Rx */
  2631                          return -EINVAL;

Why does your checker not complain about any of these error paths?

  2632                  goto idr_alloc;

This goto is succes, but doesn't boost the refcount.  Which is correct.

  2633          }
  2634  
  2635          cinfo = devm_kzalloc(info->dev, sizeof(*cinfo), GFP_KERNEL);
  2636          if (!cinfo)
  2637                  return -ENOMEM;

I guess this is what your checker sees?

  2638  
  2639          cinfo->is_p2a = !tx;
  2640          cinfo->rx_timeout_ms = info->desc->max_rx_timeout_ms;
  2641          cinfo->max_msg_size = info->desc->max_msg_size;
  2642  
  2643          /* Create a unique name for this transport device */
  2644          snprintf(name, 32, "__scmi_transport_device_%s_%02X",
  2645                   idx ? "rx" : "tx", prot_id);
  2646          /* Create a uniquely named, dedicated transport device for this chan */
  2647          tdev = scmi_device_create(of_node, info->dev, prot_id, name);
  2648          if (!tdev) {
  2649                  dev_err(info->dev,
  2650                          "failed to create transport device (%s)\n", name);
  2651                  devm_kfree(info->dev, cinfo);
  2652                  return -EINVAL;
  2653          }
  2654          of_node_get(of_node);

Bump the refcount.

  2655  
  2656          cinfo->id = prot_id;
  2657          cinfo->dev = &tdev->dev;
  2658          ret = info->desc->ops->chan_setup(cinfo, info->dev, tx);
  2659          if (ret) {
  2660                  of_node_put(of_node);

Drop the refcount on failure

  2661                  scmi_device_destroy(info->dev, prot_id, name);
  2662                  devm_kfree(info->dev, cinfo);
  2663                  return ret;
  2664          }
  2665  
  2666          if (tx && is_polling_required(cinfo, info->desc)) {
  2667                  if (is_transport_polling_capable(info->desc))
  2668                          dev_info(&tdev->dev,
  2669                                   "Enabled polling mode TX channel - prot_id:%d\n",
  2670                                   prot_id);
  2671                  else
  2672                          dev_warn(&tdev->dev,
  2673                                   "Polling mode NOT supported by transport.\n");
  2674          }
  2675  
  2676  idr_alloc:
  2677          ret = idr_alloc(idr, cinfo, prot_id, prot_id + 1, GFP_KERNEL);
  2678          if (ret != prot_id) {
  2679                  dev_err(info->dev,
  2680                          "unable to allocate SCMI idr slot err %d\n", ret);
  2681                  /* Destroy channel and device only if created by this call. */
  2682                  if (tdev) {
  2683                          of_node_put(of_node);

Drop the refcount on failure

  2684                          scmi_device_destroy(info->dev, prot_id, name);
  2685                          devm_kfree(info->dev, cinfo);
  2686                  }
  2687                  return ret;
  2688          }
  2689  
  2690          cinfo->handle = &info->handle;
  2691          return 0;
  2692  }

Btw, have you looked at the refcount tracking in Smatch?  It's does
cross function analysis.  But scmi_chan_setup() the success path only
increments the refcount sometimes so it doesn't get recorded.  If I
comment out goto idr_alloc and the label then it works.

$ smdb return_states scmi_chan_setup | grep REFCOUNT
drivers/firmware/arm_scmi/driver.c | scmi_chan_setup | 730 |             0|    REFCOUNT_INC |  1 | $->kobj.kref.refcount.refs.counter |                      |
drivers/firmware/arm_scmi/driver.c | scmi_chan_setup | 731 |             0|    REFCOUNT_INC |  1 | $->kobj.kref.refcount.refs.counter |                      |

The last success path is split into multiple returns based on some
heuristics and two of them are success...  Need to investigate.  That
seems like a waste.

regards,
dan carpenter

