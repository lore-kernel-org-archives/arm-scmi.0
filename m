Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA3A2D7DC3
	for <arm-scmi@vger.kernel.org>; Wed, 10 Dec 2025 13:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765374414; cv=none; b=P70MUJUbrNP+0gkQ0pxsOvBhYAvDlI/oZrmFBn7NuY20ClBm6KlpfTWlnyrkcRUCi9vhwzlxX/makoz2Px/zU7zDI7n/zmVGY4DRzjJtd2RhC+dMozGY1aLDAYPnlFXVMYTy7ct2anUMdTg0AdOel/hFGPqnUtkdsT1LHrnvEUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765374414; c=relaxed/simple;
	bh=elYiynqcQP/dmchPOEVSjylRupr6oiXV1hSeg6yp+W8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mb110XR8EKCBMvphaG6T982hnAllKlQYU4nfnYZbx3oHuMjXx54vAUEfhlnVykIDC45InH8NVqbzw+TNDgiVqj953moE9K1srIvqib3JSn6KKMa/mrptfEWnliQUexKxJz6QcXIfykXhcSMhO30fq4aZEq4V1pf6VjPYdRGA15g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zwUo6AWT; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zwUo6AWT"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so69917895e9.1
        for <arm-scmi@vger.kernel.org>; Wed, 10 Dec 2025 05:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765374410; x=1765979210; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E/W0S0mrDxgRyL2UHWvxnols1Agha6SLdh7xTwckY2g=;
        b=zwUo6AWT3wg6FtcRbjNu9YecfFP/lSwXucINsKVmiF9epDt3nitGK/7JNxk+d6OA+k
         S1CNrU9KtRB2PeLu8bokCA9tx7KM5h8GPIFMwZLHX1A+yJgzjjLApkOZInYNK/hNJY3E
         NdnNuFOirxPSR3Jhv6QEolhdxdjdAVyolTeCBldAvjkxte8kqvLla6CHoR5awV0uS/I0
         duCl5U49CWwVMGC4tjlnJDdj9w5y/K6+0bvZH5banmgtsMplitpWJ57y4bdf4bmHAMp6
         yESj+6TrUxh3lbhyqwUvcopyxBN7E+NqACZ3NjkcD+6feaAEODatK4qAPJ3dkQVT1qXq
         EO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765374410; x=1765979210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/W0S0mrDxgRyL2UHWvxnols1Agha6SLdh7xTwckY2g=;
        b=uBr0V+Nn5K/MkXCfAYpQj27sgiMP0uW6E0jYtOflEIRupxYqcTKHf+2wMCs7BQLZ2N
         He7SDr9BAaATrniT4XGSH8nRI0I8Widdaddx7neYZ8/+Ex7WW2xuafWLqaku5pIy94Mo
         uz2WTZRvMTsxfvE0js34iiJVfJoR93rouEgsfaPEXk6rKc5VUg0UOf2FDplFYauEAUvv
         oev5hjlCUaieNCmG2Xb4mWV0tanMNNVSlgpuD2MsKwkcdgst9yDAQwps53zp20JjByBo
         yMbzu1dcg6ystwNg4u9Rc2+sE7iIZR1ROhMNQN0MN4Bse2892jlwLiEE5frN0OpSw8K8
         qj5A==
X-Gm-Message-State: AOJu0YzGUgblyw61h9p6SPrDfOO/Y62jufzdpxF/GbA8sxziPcbSGKOT
	PkTzVA3tuGRpfkBHAoilw4axB9kQtwCelNaMwfXFa5A15fJis1bjn/djAQ8AabClHnM=
X-Gm-Gg: ASbGncsB+hv1oWaKbBQrQm3+Zv2hWfc1l1qKcSWxk3aNuwL9CrcBUeT+PF2Nnk8YamW
	Xa/1KcTLJTOjTHq8NBOLNKQ+xXMZdDpSf1ndRtx2rs5iAQuy3OGmq/K7g0wFeq/CKF8Z8rmHq4L
	fg59mFo475j+6B+FHEWCgwt5V9TK3WCSw+nK6ibmCIv5T9nktJ8aO3J28RIoXDighLg/flPfI42
	E3ZFhQ25DNQ04QNK5076IHEvm0lFOLFAtPGdAFnnk1lLrQdjvIxg/3lG8yXq409e5lr6NjgnPKP
	9U27t4o9rc+tV3DVWdXqEzZYPfpuGJIWI+x1NCMTrb9aOf56fCZkwvbQF2WLswMX6/ce1XeiNN/
	5RR6XHeaT1m0taqBahpt011T5RunnVtExa32rTW57f2G3vsqDYazUF8t9dl44iNv/dKTVBVLi2h
	4X/HdozNRg1FEfd8TY
X-Google-Smtp-Source: AGHT+IFshwn0cz6DW0SM9qdWSf57ERqPeUTTDgSX7qHl73DBW1mdckBsT1QFuEyknfZ+JuOp2Fn48g==
X-Received: by 2002:a05:600c:154d:b0:46e:4a30:2b0f with SMTP id 5b1f17b1804b1-47a8384dd86mr24682605e9.29.1765374410063;
        Wed, 10 Dec 2025 05:46:50 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a82d12257sm44597775e9.1.2025.12.10.05.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 05:46:49 -0800 (PST)
Date: Wed, 10 Dec 2025 16:46:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Amitai Gottlieb <amitaig@hailo.ai>
Cc: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>
Subject: Re: Bug in arm_scmi driver before v6.10
Message-ID: <aTl5xZ9lm35YuE83@stanley.mountain>
References: <DB9P194MB135668B1AD35E56B0BCBA578C1A0A@DB9P194MB1356.EURP194.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB9P194MB135668B1AD35E56B0BCBA578C1A0A@DB9P194MB1356.EURP194.PROD.OUTLOOK.COM>

On Wed, Dec 10, 2025 at 11:45:06AM +0000, Amitai Gottlieb wrote:
> 
> BUG DESCRIPTION:
> Function scmi_devm_notifier_unregister<https://elixir.bootlin.com/linux/v5.15/source/drivers/firmware/arm_scmi/notify.c#L1531> always fails with -ENOENT.
> 
> AFFECTED VERSIONS:
> All versions before v6.10

Not really all versions...  The supported versions from kernel.org are
5.15, 6.1 and 6.6.

> 
> ROOT CAUSE:
> Function scmi_devm_notifier_unregister in drivers/firmware/arm_scmi/notify.c ignores the notifier_block parameter. As a consequence,  scmi_devm_notifier_match<https://elixir.bootlin.com/linux/v5.15/source/drivers/firmware/arm_scmi/notify.c#L1498> always fails to match. I've attached a diff file for v5.15 for clarity.
> 
> CONSEQUENCES
> In my use-case, I cannot safely rmmod/insmod  my driver as rmmod fails unregister the SCMI notifier meaning the next insmod causes a double-register which sometimes leads to kernel panic.
> 
> I already reached out to Cristian Marussi (Cristian.Marussi@arm.com) who asked me to report this bug on the mailing list. He also said that it may not be critical enough to fix retroactively. It's also worth noting that in v6.10 Cristian did a small refactor of this code that fixed the aforementioned bug.
> 
> If this bug is critical enough to be patched, I would be happy to take the time to help.
> 
> Thanks,
> Amitai

> diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
> index 0efd20cd9d69..4782b115e6ec 100644
> --- a/drivers/firmware/arm_scmi/notify.c
> +++ b/drivers/firmware/arm_scmi/notify.c
> @@ -1539,6 +1539,7 @@ static int scmi_devm_notifier_unregister(struct scmi_device *sdev,
>  	dres.handle = sdev->handle;
>  	dres.proto_id = proto_id;
>  	dres.evt_id = evt_id;
> +	dres.nb = nb;
>  	if (src_id) {
>  		dres.__src_id = *src_id;
>  		dres.src_id = &dres.__src_id;

This seems like a reasonable enough patch.  It needs a proper commit
message and a Signed-off-by.  The Fixes tag would be:
Fixes: 5ad3d1cf7d34 ("firmware: arm_scmi: Introduce new devres notification ops")

Then get some Acks from the list here, and then send it to
stable@vger.kernel.org.  With a note in the metadata section under the
--- cut off that "This is not needed upstream becaues the bug was fixed
in a refactor by commit 264a2c520628 ("firmware: arm_scmi: Simplify
scmi_devm_notifier_unregister").  It is needed for the 5.15, 6.1 and
6.6 kernels.

regards,
dan carpenter

