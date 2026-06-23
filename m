Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC8621A92F;
	Tue, 23 Jun 2026 09:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782205464; cv=none; b=gMlvWQZm0MO5X2eS+/I7SI1yWLZ/ouSR4YF47/2baUR48vQH0MWMFSYEHGS0+NXlh1aK1IYbr7MvKkk2+4zM5rPcqTQ663MwOfau3Pe91BbVJEE5ppoP3pjDE7LOe8EE6mq5Vmrf661kIp9/VeSE+2W8t2rwNnL43XzBedQG0dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782205464; c=relaxed/simple;
	bh=u6C/8K7rZ/PoiNE1yN7H8tPTOW/CIpsKKfVuwowo2lA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QskLA4S9aMksNFxiTUJAeoW6VoDCmGXOj+Yk0wbXuygvrxGJGrJWerV+HdhbS1MP5mtFvJLvXHtY7U5ph4yte88XwUUcVTcTAQe2iE8x68XhbvryOws7pqWj7VZLdkvXlLMti4UdKG6zq2OXBLyKLmP1B6KUpcE/LM9vkSSb8N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mHB5Ejg+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mHB5Ejg+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DE5C1F000E9;
	Tue, 23 Jun 2026 09:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782205463;
	bh=QASVcb39guPqWBVEepYuN9mgTvMydSxWLKCcERU+Jik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mHB5Ejg+Viii+8jUkefpm1WrbDEIcfchy/MGXIvp8GfK17z+iT/MEPTkYrsWE3aR0
	 ShVdeVy6eqe1cMK34KZOul7TVGZzM3B01gh2JyhSeB71fboUmYRft/h6p3M0iDPkQZ
	 uzwe5HQXTrtBSHAOziJIXgYNOQ2WKSkLbMU4SxugFOx9KbNJPJV0UWPYw27pYOLNdX
	 Z0d6Kw1cdmCZMwgb/hPgvMkQIYvSje1VnpSokGb+xc/gA/c4TNKd+evZitIdaBQE0q
	 PwP+ra+C9rna92YzrzgkGxT9QbgZccT6NHa63kYQtDf9NB1bNtI8xk7IXYnhhqDi+b
	 sz4hcTj2V9S7Q==
Date: Tue, 23 Jun 2026 10:04:20 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Grammar s/may needed/may be needed/
Message-ID: <20260623-bizarre-optimistic-jackrabbit-dac4a0@sudeepholla>
References: <5180d04abfb8e3074a321e2eb73bacfdd61c30c5.1780499850.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5180d04abfb8e3074a321e2eb73bacfdd61c30c5.1780499850.git.geert+renesas@glider.be>

On Wed, Jun 03, 2026 at 05:17:51PM +0200, Geert Uytterhoeven wrote:
> Fix grammar in the help text for the ARM_SCMI_POWER_CONTROL symbol.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/firmware/arm_scmi/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/arm_scmi/Kconfig
> index e3fb36825978ed6f..783c24a20e29190f 100644
> --- a/drivers/firmware/arm_scmi/Kconfig
> +++ b/drivers/firmware/arm_scmi/Kconfig
> @@ -96,7 +96,7 @@ config ARM_SCMI_POWER_CONTROL
>  	  firmware.
>  
>  	  This driver can also be built as a module.  If so, the module will be
> -	  called scmi_power_control. Note this may needed early in boot to catch
> -	  early shutdown/reboot SCMI requests.
> +	  called scmi_power_control. Note this may be needed early in boot to
> +	  catch early shutdown/reboot SCMI requests.
>  
>  endmenu
> -- 
> 2.43.0
> 

I will apply this at -rc1.

-- 
Regards,
Sudeep
