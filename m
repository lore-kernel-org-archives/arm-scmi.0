Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92734188013
	for <arm-scmi@vger.kernel.org>; Fri, 25 Oct 2024 14:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729868037; cv=none; b=uRM0sxiOCmpPy1ZQEl+kBq4zakMgH23+0Hkj6jTT1EZVVA7WLDmC/CicFe5N401G34Pc+6ydGhfaiuiTuvySf85j/S/h7xPJq+JHBEJT406UrzLNwzePTcQwQKB6O4U5cIaJVyRJ1v40mh05VGNBX8WLMTVvw3QNlVmyECJkjA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729868037; c=relaxed/simple;
	bh=G8i4kQ0rfmd7KF5DA0TjWqbaqFjSRhTcygQh8rLG2AM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lpmq3NOEPAaTvVOQKqphKynqhF5shc0nN8I4QEkhf+sUsWw8OuLG+j7YZgcVfQB7Vipb8S/ZgZg3uVgrpKOKqxXbeZ+C7PnzP+DspV92n8K+FYhmqxOv6rfASSgPsy0I69thbhxd0KErFC6UEvK+E/peggyVM+Mf0InkW0ieYko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xLB1glLv; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xLB1glLv"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43161e7bb25so20635145e9.2
        for <arm-scmi@vger.kernel.org>; Fri, 25 Oct 2024 07:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729868032; x=1730472832; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eAvBpyoA7p/WU9ezNY7dbESpw2rn52Cl0A6r6A2MshA=;
        b=xLB1glLvUTgsJY+xizbABya98dpG/Cs4BfnOT3corLo+WzV7IS0K5V0jVbL8bM7Y+z
         rZT0L0ORsk8ZbBsCB097TJcioLN1WmTh1204YpgcTZK6cFBcVM5JSgWhA6fnbSDtBK2v
         r1XPWCldaYhL4Qjg32Dor1e85ZRlhywRzBAZzjjj06OYvos3vlKJJn/F6b5CIVm1myx3
         m4lIUoR/PNJPD6eBruSOaxxqzplHntkqXDVVfxThYwneVQmRikMtvVFvnmOX3aikvIKi
         WM7k3im6BL23+UWmaAFS41kxy6RPuVPZdIgXEYyFt62dT7Dm2s9RxU4SkufVy4TsSM0P
         jPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729868032; x=1730472832;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eAvBpyoA7p/WU9ezNY7dbESpw2rn52Cl0A6r6A2MshA=;
        b=gs24OOzMMw3YKtH1Xeov8jxsRRw1V81GSNqAgZwWs5h5JxnEowMvhO4qtgwpPeO0pe
         urUG0LpTQeH5QKnArQbER6wLIL/vR2qWYS+O5DM02znG1hyCt7FN6Y+bb14lmDKG2viD
         jtTmBWBF5knpZe6RNwlmuhu6uiuyGKs/8/NZgspfC+YWt77skc8mytEcLPDXK/LnCCP2
         g7WF5/2UZO8Bwqn5gvmM55iWIqFS5itpklY7wwzb+TkZl1kmNij/rRvMFJ4ZZYlzQy1F
         PtdbbNUou7e/bUUlB1JVs77/4x77jxPSF34hCbx//Pspzmf9LT2fxryhe6a6WJiX6M8p
         jOmA==
X-Forwarded-Encrypted: i=1; AJvYcCWH3Su8RdlHRJjT62ETN7pg4dpWp9FPw8cq3PNGh+04FpmQbHM5yDZnhXVrVn1IxmMhYoUOcPhxgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgEZda7OThaafYQTKFXeOqXIsGvn2E3juImbDmdfSkemsF8qV3
	1lhn9nzjY27G7aduR6TIXWtNyErlLUGBNP6/vOqdN8rOfzxgJB7U/IketCP80Ys=
X-Google-Smtp-Source: AGHT+IHqqD58Q4h+Z1tHpG4mKzv+sCqcuzupgvdqH2pjc3In+xcJGw3ZFSuEWgJnBVI83yx2PFst/w==
X-Received: by 2002:a05:600c:4ecb:b0:42f:8287:c24d with SMTP id 5b1f17b1804b1-4318415cfccmr89969295e9.21.1729868031754;
        Fri, 25 Oct 2024 07:53:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b70e0fsm1717115f8f.73.2024.10.25.07.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 07:53:51 -0700 (PDT)
Date: Fri, 25 Oct 2024 17:53:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	quic_nkela@quicinc.com
Subject: Re: [PATCH 5/5] firmware: arm_scmi: Relocate atomic_threshold to
 scmi_desc
Message-ID: <5366e0d1-dedc-40a9-a1c5-edfed8f4d9d4@stanley.mountain>
References: <20241018080602.3952869-1-cristian.marussi@arm.com>
 <20241018080602.3952869-6-cristian.marussi@arm.com>
 <842a9844-ac89-4972-9024-72ed0e08c2d3@stanley.mountain>
 <ZxuszZFKdJoHwiSe@pluto>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZxuszZFKdJoHwiSe@pluto>

On Fri, Oct 25, 2024 at 03:35:57PM +0100, Cristian Marussi wrote:
> On Wed, Oct 23, 2024 at 04:20:53PM +0300, Dan Carpenter wrote:
> > On Fri, Oct 18, 2024 at 09:06:02AM +0100, Cristian Marussi wrote:
> 
> Hi Dan,
> 
> thanks for having a look.
> 
> > > @@ -2959,7 +2952,7 @@ static struct scmi_debug_info *scmi_debugfs_common_setup(struct scmi_info *info)
> > >  			   (char **)&dbg->name);
> > >  
> > >  	debugfs_create_u32("atomic_threshold_us", 0400, top_dentry,
> > > -			   &info->atomic_threshold);
> > > +			   (u32 *)&info->desc->atomic_threshold);
> > 
> > This cast is unnecessary.
> 
> I was indeed wondering why I added that....then I remember something
> about debugfs_create....without that (u32 *):
> 
> drivers/firmware/arm_scmi/driver.c: In function ‘scmi_debugfs_common_setup’:
> drivers/firmware/arm_scmi/driver.c:2988:28: warning: passing argument 4 of ‘debugfs_create_u32’ discards ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]
>                              &info->desc->atomic_threshold);
>                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> since the enclosing struct ->desc is const AND debugfs_create_u32 is NOT
> smart enough to expect a const when the property is R_ONLY...unless I am
> missing something.
> 

Ah, I missed the const.  Sorry about that.

regards,
dan carpenter

