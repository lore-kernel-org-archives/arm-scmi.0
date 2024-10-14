Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 539D9231C94
	for <arm-scmi@vger.kernel.org>; Mon, 14 Oct 2024 20:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728937758; cv=none; b=kc2GiYWDrmD5wI+Q3CaSKS4ypqG+dekExsDav+iFqo1/b2iCeWsrjs9j5/hPMFSJhAj8FdNMP0WKfmISkm3gjaOInGqTFxH37v9Jt63Se/hioH5Q8fo/JTy3GBfsywRmK0ttc0/nb9BMXpRkmHoOsTNAChTCjGgjglR0gyIe25I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728937758; c=relaxed/simple;
	bh=6uA7eahD2YmmZUHjbDm8bv4GO0oumHXBS5MIebCONrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fvj6nn4wgRBS8O4zJm6FHJcmPKyV1BKO1ePHs5MUCdsCzQ58DvEfNJxcGPDxCakznpRd4tcpYeO7ZbbF8D4yW9khIsP7yDF+N6xVUgPsIaPHxQBia35uUdzM+tlMKqT9MFCzJzq7KIQtbOQtLAu7kjP+4KYw8S97Vo1gklsf1OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 004C31007;
	Mon, 14 Oct 2024 13:29:44 -0700 (PDT)
Received: from bogus (unknown [10.57.53.168])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F02F63F71E;
	Mon, 14 Oct 2024 13:29:12 -0700 (PDT)
Date: Mon, 14 Oct 2024 21:29:07 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Justin Chen <justin.chen@broadcom.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com,
	bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH v2] firmware: arm_scmi: Queue in scmi layer for mailbox
 implementation
Message-ID: <20241014202907.cvxzj7ijmpziqfpd@bogus>
References: <20241009192637.1090238-1-justin.chen@broadcom.com>
 <ZwkrVQOVJpUvhW4g@pluto>
 <50f4d2d6-dead-4053-834f-134d2df0d6bd@broadcom.com>
 <ZwuSTVFYAhwD2KYf@pluto>
 <ZwzqguhMBkW1_x2I@bogus>
 <58725446-d069-40a2-859f-0dd9ec6c3c98@broadcom.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <58725446-d069-40a2-859f-0dd9ec6c3c98@broadcom.com>

On Mon, Oct 14, 2024 at 10:21:28AM -0700, Florian Fainelli wrote:
> On 10/14/24 02:55, Sudeep Holla wrote:
> > On Sun, Oct 13, 2024 at 10:26:49AM +0100, Cristian Marussi wrote:
> > > On Fri, Oct 11, 2024 at 12:15:07PM -0700, Justin Chen wrote:
> > > > 
> > > > Yes, I see the implementation. Looks like it returns the position in the
> > > > ring buffer. I also confirmed with CONFIG_DEBUG_MUTEXES which triggers a
> > > > warning.
> > > > 
> > > > What about this?
> > > > if (ret >= 0)
> > > > 	ret = 0
> > > > else
> > > > 	mutex_unlock(&smbox->chan_lock);
> > > > 
> > > > A bit easier to read IMO.
> > > 
> > > Oh yes much better definitely...or, maybe, even more simply to read:
> > > 
> > >   ...
> > > 
> > >    mutex_lock(&smbox->chan_lock);
> > >    ret = mbox_send_message(smbox->chan, xfer);
> > >    if (ret < 0) {
> > >   	mutex_unlock(&smbox->chan_lock);
> > >          return ret;
> > >    }
> > > 
> > >    return 0;
> > > }
> > > 
> > > .... up to You...not sure what Sudeep prefers...
> > > 
> > 
> > I like this better. Also I was hoping Justin would send v3 soonish, I want
> > to send PR for fixes soon. So I have gone ahead and fixed all your comments
> > myself. I had seen the doxygen one from builder already and had fixed it up
> > last week when I added this to -next.
> > 
> 
> Here's his v3:
> 
> https://lore.kernel.org/all/20241014160717.1678953-1-justin.chen@broadcom.com/
> 
> we are on the other side of the pond ;)

I do understand 😉, it was my own rush and hence I did the changes myself.
But since I haven't tagged, I will pull it instead. BTW looks like the
arm-scmi list was dropped in v3 or my filters are misbehaving. Thanks for the
link.

-- 
Regards,
Sudeep
