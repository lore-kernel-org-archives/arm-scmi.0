Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36BCE154C0F
	for <arm-scmi@vger.kernel.org>; Mon, 14 Oct 2024 09:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728899719; cv=none; b=RvIhfStjEVhXkrFRTNYt04tea7jsU/Ulwi0OfVQOyKDtoVoIa7h3Kjk/d3foUzmFfReInCV0BprzdVmd40HwYKtSZ3vhBEt3Yyqy2PcdXQPeDwzzOGy3ZlBdXXxhh++5+xN4BVyB+B3XaZZT0tRq1F94yRYdUZ0mrnBOxS8cbzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728899719; c=relaxed/simple;
	bh=V8frF//3OOWrnj2aCZ3lvs1iNZL6ewPlt/OZW8eTwJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LzyUCHMb/6B3LeOr7HgSImbGqkRjN6OHxsyvS6OWqX8etp7Z9JCmQiY7LE1HoxlD7ze5iI3VMlhTLRx+7+pVKpjxY+xIs0F91VkdU0FeETbseA4Me8D095YdgM8GCpeNMioJNp5GZlcEULpovzwWOvbuZCZ2i0i8qpKu1L0lVYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48E5C1007;
	Mon, 14 Oct 2024 02:55:47 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B49B13F51B;
	Mon, 14 Oct 2024 02:55:16 -0700 (PDT)
Date: Mon, 14 Oct 2024 10:55:14 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Justin Chen <justin.chen@broadcom.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com,
	bcm-kernel-feedback-list@broadcom.com,
	florian.fainelli@broadcom.com
Subject: Re: [PATCH v2] firmware: arm_scmi: Queue in scmi layer for mailbox
 implementation
Message-ID: <ZwzqguhMBkW1_x2I@bogus>
References: <20241009192637.1090238-1-justin.chen@broadcom.com>
 <ZwkrVQOVJpUvhW4g@pluto>
 <50f4d2d6-dead-4053-834f-134d2df0d6bd@broadcom.com>
 <ZwuSTVFYAhwD2KYf@pluto>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZwuSTVFYAhwD2KYf@pluto>

On Sun, Oct 13, 2024 at 10:26:49AM +0100, Cristian Marussi wrote:
> On Fri, Oct 11, 2024 at 12:15:07PM -0700, Justin Chen wrote:
> > 
> > Yes, I see the implementation. Looks like it returns the position in the
> > ring buffer. I also confirmed with CONFIG_DEBUG_MUTEXES which triggers a
> > warning.
> > 
> > What about this?
> > if (ret >= 0)
> > 	ret = 0
> > else
> > 	mutex_unlock(&smbox->chan_lock);
> > 
> > A bit easier to read IMO.
> 
> Oh yes much better definitely...or, maybe, even more simply to read:
> 
>  ...
> 
>   mutex_lock(&smbox->chan_lock);
>   ret = mbox_send_message(smbox->chan, xfer);
>   if (ret < 0) {
>  	mutex_unlock(&smbox->chan_lock);
>         return ret;
>   }
> 
>   return 0;
> }
> 
> .... up to You...not sure what Sudeep prefers...
>

I like this better. Also I was hoping Justin would send v3 soonish, I want
to send PR for fixes soon. So I have gone ahead and fixed all your comments
myself. I had seen the doxygen one from builder already and had fixed it up
last week when I added this to -next.

-- 
Regards,
Sudeep
