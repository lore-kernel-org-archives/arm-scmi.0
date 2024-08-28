Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E291662E7
	for <arm-scmi@vger.kernel.org>; Wed, 28 Aug 2024 09:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724838063; cv=none; b=HwpJFMEMRvTPRGpGsZMmW0+7IpXYGNi/EEnD8rdog4Y+4Z+yx1jGPeBQZpy/yExdgJId9GzMxmkUstY8iHvtCZYFheWZ7o3EJ/jsMJa+0R8oQNY5aVC7RLNDhq56GroBkt0Cf1DEGsytJI2GWdMExLnqBc7PKN3ZtkAwFRNISGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724838063; c=relaxed/simple;
	bh=4OXWh1Ud+eIoFJqviq168iE7XqwcBd8PV7r8VZ+N5qY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RwBkF+E01t2l47FNdahH9PN2LMHb2ljIxvpMuV2yZJuX7YGxpugvvEul5wA5tj1wydv+v3mgW2bwP+TdqH60GuALxV69TpqmxmqVltnQsT8enac7xo7fadK7U42ygd3f9NkLr1X7FiFgzmh0X8yg7hczPyWvpxAIPFeAZYJ2LaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5A45DA7;
	Wed, 28 Aug 2024 02:41:25 -0700 (PDT)
Received: from bogus (e107155-lin.cambridge.arm.com [10.1.198.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B09003F73B;
	Wed, 28 Aug 2024 02:40:58 -0700 (PDT)
Date: Wed, 28 Aug 2024 10:40:56 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Dhruva Gole <d-gole@ti.com>
Cc: <arm-scmi@vger.kernel.org>, Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 3/3] firmware: arm_scmi: Replace comma with the semicolon
Message-ID: <Zs7wqC66tNBXo2p_@bogus>
References: <20240827143838.1465913-1-sudeep.holla@arm.com>
 <20240827143838.1465913-4-sudeep.holla@arm.com>
 <20240828044443.6lyd6way3jcmyjn7@lcpd911>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828044443.6lyd6way3jcmyjn7@lcpd911>

On Wed, Aug 28, 2024 at 10:14:43AM +0530, Dhruva Gole wrote:
> Hi Sudeep,
> 
> On Aug 27, 2024 at 15:38:38 +0100, Sudeep Holla wrote:
> > Replace the typo comma with the semicolon. No functional change.
> > 
> > Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> > ---
> >  drivers/firmware/arm_scmi/base.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/firmware/arm_scmi/base.c b/drivers/firmware/arm_scmi/base.c
> > index d52873523cd2..86b376c50a13 100644
> > --- a/drivers/firmware/arm_scmi/base.c
> > +++ b/drivers/firmware/arm_scmi/base.c
> > @@ -384,7 +384,7 @@ static int scmi_base_protocol_init(const struct scmi_protocol_handle *ph)
> >  	if (ret)
> >  		return ret;
> >  
> > -	rev->major_ver = PROTOCOL_REV_MAJOR(version),
> > +	rev->major_ver = PROTOCOL_REV_MAJOR(version);
> 
> Wouldn't this have caused a compile error?? /me-is-confused/
>

Technically you can have this and compiler won't give any error. Just
changed it as it wasn't intentional here so that no wrong inference is
made based on that.

> Maybe we should use Fixes: b6f20ff8bd94a .... anyway?
>

Not sure if it can be considered as fix as it is not really broken as is.

-- 
Regards,
Sudeep
