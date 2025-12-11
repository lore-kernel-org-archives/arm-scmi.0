Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630922F658D
	for <arm-scmi@vger.kernel.org>; Thu, 11 Dec 2025 12:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765457625; cv=none; b=GVJfOhjArwH2vH/DOLDJLRTleMWCOTpYR+5b2imhjrhymHNoS4Xk6A2FwAymbKISGBdYwygM0nATqXLTh3hPUiA1gL88E93osjWH/s/AvgP8S69ip2VeLWord61dOikxy7ipdVoyMBnfA3nJjx8ztftLuSWYyvXAgndZw396PM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765457625; c=relaxed/simple;
	bh=n2xUkz89XMM3xlIgPB+t+SS6/86asDXLwJu7ox6G8Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e3ZC5+Dajt2jrC//Mk/xtd6AwuQSMscF9o3JHSDx8fptXkMDvSp8MV0aZi3p612SW/0RYumUVkG/ZV4B9r5onOOHeoH339jGKrn4QhjlKify39/w02/X7aIeVUyRjBUVDxeYjrWl65czewphrDcUW02uEKXLy4kMtL0rBTg417U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QwESaomq; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QwESaomq"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47790b080e4so301455e9.3
        for <arm-scmi@vger.kernel.org>; Thu, 11 Dec 2025 04:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765457622; x=1766062422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k3Ut+7j4nioPFl4+9nePNIPo/sat8VtxqcRfNj6kw6M=;
        b=QwESaomq+Z4D0lxeKdVHm3q3ymAVDFxsn76neRHp8DneDNqTkv96c0gXvkxU4E0g7W
         RG9MQZdR+UNccCPvvSUaX7/H6+bAlc9UKphSGELg9ksTvDElhs5rzn5tDc6b16b9j4Eu
         k1oAgGDI65bg3hx+kZ+QQoMV27dJvRmabzo+9WucCMEFiaE9KbopIsYgC4QUxYusgxq0
         RL3WBVEUis9397AfDI9nFvIze00nV95jqIPrt2/G8GnnM0brhp8AwrsmtKpM6Y8OWBT7
         Hm/TTVBJC2qheRlhyAa4vyELpCSyFLjzrZ9UzHeZo20j1WexvQ5Ahj7tOywqsZCXqvpa
         BiUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765457622; x=1766062422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k3Ut+7j4nioPFl4+9nePNIPo/sat8VtxqcRfNj6kw6M=;
        b=G+FTmwqu3l/vh7+Js/9iH1LMNwS7pqIKMKAcTlcCBhcfmPKNXEn5ClvidEe6pIFdii
         Pdv+SfoWpFznymjz37t7bO52xN/dw2PtWqzibnz+xkI0n188A224xELZHSSDiEeLSmua
         a/w6BH1Dl/CJSqIdNFUZ31+ebtCL2mrYiWhWNQ28yBfDYIjVJYQBHU+aVF5kcTHGFbP2
         iVTdRy9/IYnoUh5sX5JkO7fBeusQ46yDdTcLM38XTHEzkJ7Uv4m93ZJTnsVxrEzlsAkw
         YfaYV8ZjTwcU/aExDPzVvpLfhuHviui38v+fmTrpRRJW+b5nKbx+ne88oI+ozXTT2cZc
         lldA==
X-Forwarded-Encrypted: i=1; AJvYcCXeDGBbCLBS++i/F6vrZDOpRJN+9uH/69v7npt6uwOBG+lozDoB19lg61nlBbS9tvlkPwUQZ0y9mA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+vVrDsuu2rNfbtpL6lGbDozHX6KF5GYc6RscTd20RYpecR9Ue
	TzYeoIlWVT3PkUL1okuwu+5fdlQ/Suv5yxK6qfUFUS0iOzph6aj2kSw7z9ZUI9mOw+0=
X-Gm-Gg: AY/fxX5N2pNHjBlDzvd7WuAKhD/Svr22y+HfTIhVezhvrHNRyDxHysUB0iIVDVnCDL2
	aYDwi6IQ3bAzhMSOe3V3MSFv1Un4SSXTQTJULY8bnptmdn3KXFzk+WmvNUVghK0T5vlQlQOlCkm
	z0/Qo6epKSWeEXh7xy4cdJijiNZqEz4CNZxtxpkMg/l9X9jJh/9Uj2WHrb0yObHIvGTcLPBef97
	KQtFVkDOPZsspoXyrs2aLJJCHxkTvxh/4+SlonFB1yDhRBFT2KIKMF/BQWp7thVj6Ez+IFd0uMU
	OpfxpeZeChZvG7O9tnHb1nzgyz973lacdWGfG2nMYJGO7ybkhbrijsvDPfUDhNRfUaq8b75YRvi
	Gk5FV7H6YPLpm7m4uW31Z8zeSlRaxtRpvuTcdoTyxSHKIFTupKRf7yA/IXeTm+27nagfWQzEMdz
	z2iaGRRX6ekPLK/Awx
X-Google-Smtp-Source: AGHT+IEDfBKh1Dqy32uXCdMjIo7frwJccefDBzPljwy17nuTEljjFPKnZ9laIvw6YLboCUxl3ehMnw==
X-Received: by 2002:a7b:c006:0:b0:477:bcb:24cd with SMTP id 5b1f17b1804b1-47a83c62a9fmr38434725e9.22.1765457621600;
        Thu, 11 Dec 2025 04:53:41 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a89f8c145sm32962385e9.14.2025.12.11.04.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 04:53:41 -0800 (PST)
Date: Thu, 11 Dec 2025 15:53:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Amitai Gottlieb <amitaig@hailo.ai>, arm-scmi@vger.kernel.org,
	sudeep.holla@arm.com
Subject: Re: [PATCH] firmware: arm_scmi: Fix unused notifier-block in
 unregister
Message-ID: <aTq-0QAUONrNERGA@stanley.mountain>
References: <20251211114926.709004-1-amitaig@hailo.ai>
 <aTq2IA6V1nTE-XSC@pluto>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTq2IA6V1nTE-XSC@pluto>

On Thu, Dec 11, 2025 at 12:17:01PM +0000, Cristian Marussi wrote:
> On Thu, Dec 11, 2025 at 01:49:27PM +0200, Amitai Gottlieb wrote:
> > In function `scmi_devm_notifier_unregister` the notifier-block parameter
> > was unused and therefore never passed to `devres_release`. This causes
> > the function to always return -ENOENT and fail to unregister the
> > notifier.
> 
> [ CC-ing also Sudeep ]
> 
> Hi,
> 
> thanks for this.
> 
> LGTM.
> 
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> > 
> > In drivers that rely on this function for cleanup this causes
> > unexpected failures including kernel-panic.
> > 
> > Fixes: 5ad3d1cf7d34 ("firmware: arm_scmi: Introduce new devres
> > notification ops")

This Fixes tag needs to be all on one line.
Fixes: 5ad3d1cf7d34 ("firmware: arm_scmi: Introduce new devres notification ops")

> > Signed-off-by: Amitai Gottlieb <amitaig@hailo.ai>
> > ---
> > 
> > This is not needed upstream becaues the bug was fixed
> > in a refactor by commit 264a2c520628 ("firmware: arm_scmi: Simplify
> > scmi_devm_notifier_unregister").  It is needed for the 5.15, 6.1 and
> > 6.6 kernels.
> 
> I think there is some sort of syntax to refer to the applicable Kernel
> versions in the tag line....not sure it can be easily followed here...so
> maybe the above comment is enough...
> 
> More details here...
> 
> https://docs.kernel.org/process/stable-kernel-rules.html

I'm pretty sure those little comments aren't parsed automatically...
It feels duplicative.  I don't love those little notes because it feels
like the Fixes tag should normally be sufficient otherwise I want a full
explanation.  There was an embarrassing bug where the notes were wrong
and the patch was missing a Fixes tag so it wasn't backported far enough
in distro kernels.

It can't hurt to add them to the tag section, I suppose.

Cc: <stable@vger.kernel.org> # 5.15.x, 6.1.x, and 6.6.x

Leaving them out is also fine, really.

We definitely still need the note.  I said before that note about
"This is not needed upstream becaues the bug was fixed
in a refactor by commit 264a2c520628 ("firmware: arm_scmi: Simplify
scmi_devm_notifier_unregister")" should go under the --- cut off line,
but actually I think now that it should go into the actual commit
message itself.  Otherwise people who work on distro kernels, for
example, will wonder why the commit doesn't have an upstream hash.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

Wait until Sudeep has responded, and then resend the patch to
stable@vger.kernel.org with all the Reviewed-by tags.

regards,
dan carpenter

