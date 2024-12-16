Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E7313B2AF
	for <arm-scmi@vger.kernel.org>; Mon, 16 Dec 2024 16:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734365314; cv=none; b=Jg6dt6Zj2pd64g2nuVuXkI7A/km5XfCxi/akaAvtYCtyxBA1sl2nH8ZRev8SzmJB+cuqAp2eYaGgdPC5D4vTdQ7yfNzvYltKUN+eB6zhmxY3QKhfVzSHDd8+BP9tnh7DSebPTU40YpetuboUjQ9j1JFu8dAJt4R3x/ikU8CqYzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734365314; c=relaxed/simple;
	bh=yI7iW30AqVrHaGxPE6r46lg4z+J0o6GrvVKoEGUss3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ieNKK4I3sOA+RLL6ZRIU70AN+ftDTSijazQrGgqAqe0iurqZCX9XW/HBjjMroa+twVT2mf8h67rw9QCOog/0bRR1Z+1mNKWTEREfHGJO8KLBSmEp8h4xXXQod58USHZSqGlWYpUxSBnFEDpZSVOI4KYn+99Fz1Vhz60JPgrBIF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8367E1063;
	Mon, 16 Dec 2024 08:08:58 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64C623F58B;
	Mon, 16 Dec 2024 08:08:29 -0800 (PST)
Date: Mon, 16 Dec 2024 16:08:27 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: gchen chen <gchen.guomin@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, guomin_chen@sina.com,
	Sudeep Holla <sudeep.holla@arm.com>,
	Xinqi Zhang <quic_xinqzhan@quicinc.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, dan.carpenter@linaro.org
Subject: Re: [PATCH v2] firmware: arm_scmi: Delete the meaningless
 scmi_bus_id.
Message-ID: <Z2BQe3-zl2IN_Cjj@bogus>
References: <20241216073745.2973317-1-guomin_chen@sina.com>
 <Z1_p0nU93PHJ4Sg_@pluto>
 <Z1_2rxJ7TOEIOMp7@pluto>
 <CAEEwsfRhe4-YAwe027huSXwFfkV-O-8w1GDNf=URa9efRsXiKA@mail.gmail.com>
 <Z2AEzHc5f6TjxErs@bogus>
 <CAEEwsfRKVBVR+DxhkYA5atxU7+6nsaL9X8-Yoa_DqB0YKEV1zg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEEwsfRKVBVR+DxhkYA5atxU7+6nsaL9X8-Yoa_DqB0YKEV1zg@mail.gmail.com>

On Mon, Dec 16, 2024 at 10:10:40PM +0800, gchen chen wrote:
> Sudeep Holla <sudeep.holla@arm.com> 于2024年12月16日周一 18:45写道：

[...]

> >
> > I would like to understand the motivation behind this change. What is the
> > goal ? Do you prefer to fetch the name and protocol id from the device
> > name itself ? Is that your requirement.
> >
> hi Sudeep
>     Okay, the reason I want to change names like 'scmi_dev.3' to
> 'scmi_dev.firmware:scmi.perf.19' is because when I was migrating the
> SOC's kernel from v6.1 to v6.6, I found that the context for creating
> SCMI devices had changed (commit d3cd7c525fd2: firmware: arm_scmi:
> Refactor protocol device creation).

Correct. That's the beauty of Linux we can adjust the internals to enhance
the features without breaking the user-space.

> This change meant that device creation shifted from being directly
> created through scmi_protocol_device_request during SCMI driver
> registration to being created via scmi_device_request_notifier.
> This shift results in changes to the order in which devices are created,
> causing the ID in scmi_dev.id to drift.
>

What issue does this drift cause exactly ? I mean the order in which
the devices are created should not impact on anything if the dependency
on the order was not created. What was that dependency ?

> Additionally, I encountered some cpufreq errors here—because both
> scmi_cpufreq_drv and scmi_perf_domain_driver use the same
> SCMI_PROTOCOL_PERF, this results in two SCMI devices corresponding to
> the same device node. However, device_node.fwnode.dev only points to
> the first registered scmi_device, causing other consumer devices to
> find the wrong scmi device as the supplier. So I would find a
> multitude of other consumer devices waiting for meaningless device
> names like "scmi_dev.4" instead of meaningful names such as
> "scmi_dev.firmware:scmi.perf.19" or
> "scmi_dev.firmware:scmi.cpufreq.19".
>

Yes this was reported. I think most of the std protocol may not use that
node and need not be assigned. But I think vendor extensions are adding
info to the DT that may need this.

> Although I could further determine which specific driver it was by
> looking at the driver links under the scmi_protocol bus directory, I
> thought that if the logs directly displayed device names like
> 'scmi_dev.firmware:scmi.perf.19' instead of meaningless progressive
> IDs, it would be more convenient and logical, and thus more
> meaningful.
>

If the issue you encountered render your platform into boot issues ?
If so I would like to know what exactly happened. If not, I can think of
alternate solution if possible.

> > From the commit log, I get a sense that you looked at the code and thought
> > of possible improvement but when we mentioned the limitation you just
> > improvised by adding parent name. Do you expect any userspace to parse
> > the name as that will end up being ABI and we can't break it. I need
> > real motive to be explained here in detail.
> >
> I did not use userspace tools to parse this SCMI device name; I simply
> wanted the name to reflect the possible logic of the device.
> I did not remove scmi_dev.id (This scmi_device structure has not
> changed.）; I just no longer assign values to it using scmi_bus_id, so
> it should not affect the kernel ABI (kABI).

I understand the change, just not the possible impact w.r.t user-space.

-- 
Regards,
Sudeep
