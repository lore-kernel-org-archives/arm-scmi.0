Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793903298;
	b=qvIIFCvSoTaCrzF3lXfyNFdduxuL1W4JBYcQf0qeEjmiOwtPi7dVHSTJtwdMaSnOpHE+
	 HhHjmpSCF+Nti/uiBrKJ5hCQ5xBSucPX9kROiFaHxGcqsfIv2OlYrh86p7tdGswPYGLBH
	 NdSkY7Dx1erDvnBrNl6VO5D3u7q8iAJvUBExCW5rXOw0s55rjWboG2YPQ0sruNWL80Bvn
	 Q7oz0I2Lj/iNZ57howjilebKpaHmYfUt94Dy8emBxq3mwP7IrwcVk5hsFz8JoeE5ojuD+
	 IoOiylbRx2xt2yUHKpRdlxaBEqhOW/kmGp7qej0o25+dV+t1SvczLpN3aAGE5SOYnyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793903298;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=gT9TJ0AroGbdxZ4bmFkZaRdEQ2S7wKcPpVq8sxpoWPo=;
	b=JVzZlXyIKwQh3POJamr6gmnqKQ4cMNF60Ec0V1pODm13oTMX6rcTnAorN/NSSSJgIpag
	 x2nIEF3f6LBKQJz0esbTKkomY9RN9NqcEUSJh9TJCJ5yxAgaGQkvNdQ9Vg+BryXLgec3k
	 qa5nMDe0ile7yEEgOjH7h+h1+Bn7vR+pk5QQ0LkwTnpHiyELXxQVMCHaioHRDWcfCfw6i
	 ZqQHvmIUIRpSya7FKJTVmG4tudePIFbdD7kr4Z9VM3zIukdvO2LXmUGYP6gNos48qudJT
	 qvDKp4T4QFlkVoeb00EPCQErmKBBo3yeWucKC3hkVPxP+V8ypniCSxyZAT9QsE7A9Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="IX9/1ZIJ";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E5CB606A32F;
	Thu,  5 Nov 2026 18:28:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E5CB606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=IX9/1ZIJ
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C1CB168F;
	Thu,  5 Nov 2026 10:28:12 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F15963F632;
	Thu,  5 Nov 2026 10:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793903295; bh=Rrkg8DlYAdb9o/4arm7DveLAh4LnWcq3U2R3LPjPA54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IX9/1ZIJKn3cK3ohxV9U4xGE9+NOHDnlMbuM9Y2d3akzE15HCuiAghZqr0swE2jJy
	 JZTdCiRq5woVotgOX1SiqumUsf4iSf9fMPgbKSEysjCUh2Uz7o/Bo8sR5ATlElg+xM
	 QLDcSX+88bMCUYEUS9W230Ely0gArIrFVhW8Q8/g=
Date: Thu, 5 Nov 2026 18:28:07 +0000
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
Subject: Re: [PATCH v14 01/32] firmware: arm_scmi: Add new SCMIv4.0 error
 codes definitions
Message-ID: <auzKt0tDdn2Kt-vb@pluto>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
 <20261016185553.2794459-2-cristian.marussi@arm.com>
 <20261019133436.000035ae@oss.qualcomm.com>
 <auy0ar-fio9m7EbV@pluto>
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
In-Reply-To: <auy0ar-fio9m7EbV@pluto>

On Thu, Nov 05, 2026 at 04:52:58PM +0000, Cristian Marussi wrote:
> On Mon, Oct 19, 2026 at 01:34:36PM -0700, Jonathan Cameron wrote:
> > On Fri, 16 Oct 2026 19:55:22 +0100
> > Cristian Marussi <cristian.marussi@arm.com> wrote:
> > 
> 
> Hi,
> 
> thanks for your feedback, sorry for my generally delayed replies but I
> am drowning in Sashiko reports :P
> 
> > > SCMIv4.0 introduces a couple of new possible protocol error codes: add the
> > > needed definitions and mappings to Linux error values.
> > > 
> > > Note that SCMI_PARTIAL_ERROR has to be handled specially, so it needs to be
> > > distinguishable.
> > > 
> > > Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > 
> > > ---
> > > v12 --> v13
> > >  - use EBADMSG to map SCMI_PARTIAL_ERROR
> > That's a stretch given definition but I looked back at: 
> > 
> > https://lore.kernel.org/all/arK7kLlrg491EsMf@pluto/
> > and appreciate the problem of running out of error codes..
> > 
> 
> Yes indeed it is not ideal BUT I crawled back and forth through errno.h
> and I could not find anything better.
> 
> > Guess it is the best we can do,
> > Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> > 
> > If you do a v15, maybe capture some reasoning in the change
> > log or the patch description itself.
> 
> Yes I will...soon there will be a v15.

...btw...forgot to say that all the SCMI errors definitions and machinery
above will be split next into a dedicated internal header in the next v15
because needs to be accessible by protocols and common.h is huge..

Thanks,
Cristian
