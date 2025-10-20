Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159832E9ECE
	for <arm-scmi@vger.kernel.org>; Mon, 20 Oct 2025 08:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760950071; cv=none; b=LN7cUQEjJn0kReioV/DiAgVpT/a6c+V7HaSk0Js4HJ8UqNv0sHF29FlqrMuIHIwjZBeBW6C8XfzIrmRs7GFZ9HccVGRUqe3pOVIHemVL4gJyKRo8FvRCTZK2v1McuJxQT+nIdfeLTLJ6KauEzoQGvftYKk04N6Nd0sEy1Yo7qQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760950071; c=relaxed/simple;
	bh=59yUh/JN5RpNcI5i3KUqVCIAKemBVMbf0Yi7HfXS6Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cM5AQwc7N42DLtLihdvn1UkvyD5RtgYfdFK7iqCy0XHex32sfeH1BgfoZGLFRrGIVqeLKcpmLWuTaIeYM3FrHaaDKvnnhSP8jtNgl+hK8Zvh65QXaT4PtxRXH2hEGP1Z8qkZuCEwNnfU7hmxzlDdZxHTqtcaHBTUP+FUInNERBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C5031F91;
	Mon, 20 Oct 2025 01:47:41 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 61F4A3F63F;
	Mon, 20 Oct 2025 01:47:48 -0700 (PDT)
Date: Mon, 20 Oct 2025 09:47:45 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 7/8] firmware: arm_scmi: transport: Add ACPI PCC transport
Message-ID: <aPX3MQwjB2PchQqT@bogus>
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
 <20251017-acpi_scmi_pcc-v1-7-0adbab7709d9@arm.com>
 <aPXwuEebbjEJHmc5@stanley.mountain>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPXwuEebbjEJHmc5@stanley.mountain>

On Mon, Oct 20, 2025 at 11:20:08AM +0300, Dan Carpenter wrote:
> On Fri, Oct 17, 2025 at 02:23:50PM +0100, Sudeep Holla wrote:
> > +static int pcc_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
> > +			  bool tx)
> > +{
> > +	const char *desc = tx ? "Tx" : "Rx";
> > +	struct device *cdev = cinfo->dev;
> > +	struct scmi_pcc *smbox;
> > +	int ret, ss_id;
> > +	struct mbox_client *cl;
> > +
> > +	smbox = devm_kzalloc(dev, sizeof(*smbox), GFP_KERNEL);
> > +	if (!smbox)
> > +		return -ENOMEM;
> > +
> > +	cl = &smbox->cl;
> > +	cl->dev = cdev;
> > +	cl->tx_prepare = tx ? tx_prepare : NULL;
> > +	cl->rx_callback = rx_callback;
> > +	cl->tx_block = false;
> > +
> > +	ss_id = pcc_get_ss_id(cinfo->id, tx);
> > +	if (ss_id < 0)
> > +		return ss_id;
> > +
> > +	smbox->pchan = pcc_mbox_request_channel(cl, ss_id);
> > +	if (IS_ERR(smbox->pchan)) {
> > +		ret = PTR_ERR(smbox->pchan);
> > +		if (ret != -EPROBE_DEFER)
> > +			dev_err(cdev,
> > +				"failed to request SCMI %s mailbox\n", desc);
> > +		return ret;
> > +	}
> 
> Use the dev_err_probe() function for this:
> 
> 	smbox->pchan = pcc_mbox_request_channel(cl, ss_id);
> 	if (IS_ERR(smbox->pchan)
> 		return dev_err_probe(cdev, PTR_ERR(smbox->pchan),
> 				     "failed to request SCMI %s mailbox\n",
> 				     desc);
> 

Good point, every time when review I think of it but apparently not when
writing code myself 😁, will fix it. Thanks!

-- 
Regards,
Sudeep
