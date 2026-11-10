Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324797;
	b=ZL3RXZJXGPnFooyh7VVCYt7UOKY17+HBGNOVE5I9cWgXUrn6p6wjg2hXkp6wRwXVttkT
	 SRBxc8h7QVgfUpy4L7EWfnQhGVvnDkYbxi14tiEvcuIqpK2vYGa6XmlM9lBxNrYAFj/z1
	 gZm3iEqc2Va6Z+SwtquTWp+QnCtXs+B0nNWG46PHrAXK/10gr/m6htVWF5kDt5p/GTvIj
	 4dyaYgDFAfeqlkstsOgnb82QVdSF1uK7ze6FbJGKUkUqVZa9ImwmCBpkuhsPxKqYG9G0b
	 8V1q/iTchH6EQwCSG8sueZ/p1q0jvsHzm6HvqVuAqVw/g3Gt/CIFu14HEfkFc5qnyow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324797;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=y036tnkZvOptnlPqeztBIgk/DHIDknwaKKSH2dCYLg8=;
	b=KpjbFv0HjWkumA0iR4Fn6m1GEVjenqcUMp+NzB8wrOtw9qoF5dmiL/t2n/Fm58Msr23c
	 +BS1pJxj9vJsaik6lV4DnO2+NRfvHgWFZLZ8R1XpUf45ECz4Naqcjsh/0e5qQ+YzQQRbS
	 BNyPzMbrCjt/JYzMn6G9hlfvITqh9GkoWxr0BKROQ+U8aFB2yJDiD9A/ehlXafxb8/O0a
	 Qv48+8j7+hdJao7S+v7FUC0BPy25Zy9mbmEVP3BVL+F1brszwN2dOwDCs49D101myd5d5
	 yZCbcTedxpkMuCsyb8sdX6zVIZ431UgzM+D1mwytJZThuU5FYlq2eYiEGY0uHZagaSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=HxUdNS7v;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6C0606A338;
	Tue, 10 Nov 2026 15:33:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C6C0606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=HxUdNS7v
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CEA914BF;
	Tue, 10 Nov 2026 07:33:12 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 90BAB3F85F;
	Tue, 10 Nov 2026 07:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794324795; bh=nBUxhmvA0ecyPPwlBOt9fU9SaSIGMd2Zc1jhwGnIkjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HxUdNS7vTci/GNxuiU+PL6sIw8vYWgYQQ2j9oD3St9Q/dGQHoIwmUTRpuTsyb0nEz
	 dkDtQ71ZVpWmbsEXtAXUCzdNc9kVvrJHxFiSGuzPDYc8SYBopwf/yUn2UA5itaFKBa
	 mXuD+KbpVmW4I7LeD8HyNfqqXDYFp5svFesO5ZCI=
Date: Tue, 10 Nov 2026 15:33:10 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
	sudeep.holla@kernel.org, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
	philip.radford@arm.com, david@kernel.org,
	souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
	puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 10/35] firmware: arm_scmi: Add Telemetry resources
 enumeration
Message-ID: <avM5No4YdYbQ968p@pluto>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
 <20261109091221.2532706-11-cristian.marussi@arm.com>
 <20261109173641.00005289@oss.qualcomm.com>
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109173641.00005289@oss.qualcomm.com>

On Mon, Nov 09, 2026 at 05:36:41PM -0800, Jonathan Cameron wrote:
> On Mon,  9 Nov 2026 09:11:56 +0000
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 

Just one eply down below, I will address and reply more in depth next
days while addressing the usual zillion Sashiko issues (tiny now at
least)

> > Add basic Telemetry allocation and initialization routines, introducing and
> > wiring-up the logic needed to enumerate all the SCMI Telemetry resources
> > optionally using a lazy on-demand scheme: this approach factors in the
> > flexibility needed to minimize the amount of initialization work based on
> > the effective access pattern used by the upper layer ABI.
> > 

[snip]

 
> > +
> > +/**
> > + * scmi_telemetry_resources_enumerate  - Enumeration helper
> > + * @ti: A reference to the telemetry info descriptor for this instance
> > + *
> > + * This helper is configured to be called once on the first enumeration
> > + * attempt, when triggered by invoking ti->res_get() from somewhere else.
> > + *
> > + * Once run it substitues itself in ti->res_get() with the simple accessor
> > + * __scmi_telemetry_resources_get, which returns a descriptor to the resources
> > + * that were possibly discovered.
> > + *
> > + * Note that, while it attempts to fully enumerate Data Events and Groups, it
> > + * does NOT fail when such enumerations fail, instead it simply gives up with
> > + * the end result that only a partially populated, but consistent, resources
> > + * descriptor will be returned; in such a case the incomplete descriptor will
> > + * be marked as NOT fully_enumerated: this design enables the kernel to deal
> > + * with badly implemented out-of-spec firmware support while keep on providing
> > + * a minimal sane, albeit possibly incomplete, set of telemetry respources.
> 
> I'm curious about this. What's the motivation for being nice to people who
> write buggy firmware?  I'd kind of prefer an opt in quirk for any that show
> up where a fix is impractical rather than a paper over the bad from the start.
>

Trust me it was never about being nice to FW guys :P

The reasoning, which I am indeed myself questioning these days, was to
be able to carry on and boot a minimal Telemetry working system even
without all of the detailed description retrieved by this command
enumeration process since all of that data descriptors are NOT strictly
needed, unless yout system defines groups or FastChannels.

Because on one side it is true thet DE_DESCRIPTION is a mandatory
command BUT on the other side it is also true that the spec does really
delegate any further detailed description of the Telemetry data to some
external JSON-like file: so you can really carry on without all of this
informational and topological data.

As an example if userspace does not want to use kernel mediated access
to the Telemetry data (most of the IOCTL ABI later on) but instead it
decides to grab and parse directly the RAW mmaped data from the SHMTI/TDCF,
in that case you just need the fds to the areas to mmap and its fully
comprehensive (hopefully) JSON file.

Another possible scenario is bring-up with a limited features FW.

This is also the reasoning behind having the lazy resource enumeration:
you can boot, get the SHMTIs fds and mmap those areas and that's it:
you're good to go without doing any enumeration at all.

There were more FW issues indeed that I used to 'survive' early in this
series that I stop being graceful about it, and even in this case, despite
surviving in a degraded state I printout a FW_BUG.

Now the bad side of the story is that keeping half-initialized stuff
in a degraded system lead to an increasing number of possible issues
flagged by Sashiko, mostly rare errors on path conditions to fix, but
I am starting to wonder if all of this is worth...

Thanks,
Cristian
