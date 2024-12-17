Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 587A51F4E23
	for <arm-scmi@vger.kernel.org>; Tue, 17 Dec 2024 14:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734445659; cv=none; b=JxK2BKmR55uXkfdCSo3nBpwe8glvoMyMQur0BCmaVYqpDSlKki2JYGY5VH96e5lYs9lKY2JeegT3jaXRzA5+dlR1dVu45yEBasq6RkZhO6HPNNG/eQb3kr6YpkiANWzTOWZd2E+zP2KnGq4/McM9Izwx3dn/x8yvXQBGPxigrvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734445659; c=relaxed/simple;
	bh=wNARQZaKL7tGB94gxTxtf7CIzbjcBY0VWsn0hQa99m4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jVzhjDxJDULFDWjxQ0LDmIPY1A17D4dDvOP9dpHBS+ewh1OMo0Q1+thWF5y00ev3bV08L6TR+JlFPc5JBkgV07lu8YChf1EJ2lp6pnvI2LtNBzyIATMDi8QXC4jXLKvqpAzSv5itrvi93bgCYjvFPqzyy/K8bFwPy8WPaPha9kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C965FEC;
	Tue, 17 Dec 2024 06:27:58 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 197ED3F58B;
	Tue, 17 Dec 2024 06:27:28 -0800 (PST)
Date: Tue, 17 Dec 2024 14:27:26 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, cristian.marussi@arm.com,
	arm-scmi@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: fix an OF node reference leak in
 scmi_txrx_setup()
Message-ID: <Z2GKTp3VE_uK1pQv@bogus>
References: <20241217023122.3927401-1-joe@pf.is.s.u-tokyo.ac.jp>
 <77ed017b-c5c9-4a41-aaf5-e0447c102260@stanley.mountain>
 <4c4d130b-3fd0-4339-a005-23472c82625a@kernel.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c4d130b-3fd0-4339-a005-23472c82625a@kernel.org>

On Tue, Dec 17, 2024 at 11:50:27AM +0100, Krzysztof Kozlowski wrote:
> On 17/12/2024 06:51, Dan Carpenter wrote:
> > On Tue, Dec 17, 2024 at 11:31:22AM +0900, Joe Hattori wrote:
> >> scmi_txrx_setup() calls scmi_chan_setup(), which increments the refcount
> >> of the given OF node. When the Rx channel setup fails with ENOMEM,
> >> scmi_chan_setup() returns the error, but does not release the OF node
> >> obtained in the Tx channel setup. Thus, add an of_node_put() call when
> >> the Rx setup fails with ENOMEM.
> >>
> >> This bug was found by an experimental static analysis tool that I am
> >> developing.
> >>
> > 
> > No, the patch is wrong.
> > 
> There are more patches like this without understanding the OF
> drop/retain reference behavior. I suggest careful review of all results
> of this "static analysis tool".
> 

Thanks Dan and Krzysztof for the quick heads up and suggestions. Much
appreciated.

--
Regards,
Sudeep
