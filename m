Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3CA28725A
	for <arm-scmi@vger.kernel.org>; Tue, 21 Oct 2025 09:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761037409; cv=none; b=L0JYxZQKCMdbPUA3Gx5byFtMHqcu895hIoAoFgp43Rd1CAR+e4G8y6ztSffck6Dj2IlbFHNIXAg5FtOl6Moe6bUWhpTbcDNGJREuKtAMDapzFFwqDRdkQ1yhcp1bjCoE5TbR3V+5uXjenPZTEZ2qeR5ImUWYcXAZliDlJTWpMFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761037409; c=relaxed/simple;
	bh=Y3KlJLl6MconIY5oesF2C/BdkoCbkCyCDLK3z1HwyTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b77OAuYb6YME2nfmO4xbjbINiTqHbqQW0cKhpm82ZTXEqcZ9aMqFPOY/ZOd29NArlphOOwjS4nnXOioHODRdqZ39qBNfG9sJWX9Ub4oo9S+ka57Kb/VwoLlU7apZUPKX0DWqtP6hkwVDSmqRyZrkWq7p0CTbtTgJ50VywbOEJyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDC911063;
	Tue, 21 Oct 2025 02:03:18 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CAD483F66E;
	Tue, 21 Oct 2025 02:03:25 -0700 (PDT)
Date: Tue, 21 Oct 2025 10:03:22 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, <arm-scmi@vger.kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/8] firmware: arm_scmi: Set fwnode for the genrated SCMI
 platform device
Message-ID: <20251021-tireless-urchin-of-ampleness-cbfbd7@sudeepholla>
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
 <20251017-acpi_scmi_pcc-v1-1-0adbab7709d9@arm.com>
 <20251020180702.00005106@huawei.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251020180702.00005106@huawei.com>

On Mon, Oct 20, 2025 at 06:07:02PM +0100, Jonathan Cameron wrote:
> On Fri, 17 Oct 2025 14:23:44 +0100
> Sudeep Holla <sudeep.holla@arm.com> wrote:
> 
> generated (in patch title).
> 
> > Add a call to device_set_node() in the SCMI probe helper to associate
> > generated SCMI platform device with the firmware node of its supplier
> > transport device.
> > 
> > This complements device_set_of_node_from_dev() and ensures that
> > firmware node information is propagated correctly for both Device Tree
> > and non-DT (e.g. ACPI) based systems.
> > 
> > Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> > ---
> >  drivers/firmware/arm_scmi/common.h | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
> > index 07b9e629276d..911941e6885d 100644
> > --- a/drivers/firmware/arm_scmi/common.h
> > +++ b/drivers/firmware/arm_scmi/common.h
> > @@ -473,6 +473,7 @@ static int __tag##_probe(struct platform_device *pdev)			       \
> >  		return -ENOMEM;						       \
> >  									       \
> >  	device_set_of_node_from_dev(&spdev->dev, dev);			       \
> > +	device_set_node(&spdev->dev, dev_fwnode(dev));			       \
> 
> device_set_node() is supposed to handle both dt and ACPI. So this surprised me
> and I went digging.
> 
> dev_fnode for acpi is dev->fwnode, for of it is of_fwnode_handle(dev->of_node)
> Which is dev->of_node->fwnode
> 
> So for acpi this is
> 	device_set_node(&spdev->dev, dev->fwnode);
> which is:
> 	spdev->dev->fwnode = fwnode;
> 	spdev->dev->of_node = NULL; 
> 
> For dt
> 	device_set_node(&spdev->dev, dev->of_node->fwnode);
> which is
> 	spdev->dev->fwnode = dev->of_node->fwnode;
> 	spdev->dev->opf-node = dev->of_node; (via some container of magic)
> 
> 
> The device_set_of_node_from_dev(&spdev->dev, dev)
> is same as:
> 	of_node_put(spdev->dev->of_node);
> 	spdev->dev->of_node = of_node_get(dev->of_node);
> 	spdev->dev->of_node_reused = true;
> 
> So subject to some reference counting that I don't think you need as the
> spdev->dev parent is the dev here, the first call does nothing extra.
> 
> Maybe I missed something?
> 

No, you didn’t miss anything. You’ve articulated my analysis well - the same
points I had intended to include in my commit messages but had forgotten those
details of at the time of writing the commit message.

I retained the call to device_set_of_node_from_dev() primarily because it sets
dev->of_node_reused = true.

I’m not entirely certain about the implications of not setting this flag, and
it wouldn’t be set if we used only device_set_node().

Thank you for noticing this and bringing it up for discussion. I had planned
to raise this when I first observed it and made the change, but unfortunately
didn’t document it properly - that would have saved you from having to
rediscover the details yourself.

I’m fine with whichever solution we agree on. I retained both calls
intentionally to prompt exactly this kind of discussion.

-- 
Regards,
Sudeep
