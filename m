Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC54235F161;
	Sun,  4 Oct 2026 08:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791102532; cv=none; b=Q4fHHROtUhkpkKrRmrvLw+xBQXVkJbPPCnQGz95YVIyVYLduVG0nq1t4rBJDpdEi/zIKVd6SfPJyqR7tV53xRrgAGh9M5SvsmDnNOc+KyRvWUxshJGuVPyRTAtDsk4ynUao4oWF4O0kuUf00kTN62dTOOfW0sfK6OMkKUO786lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791102532; c=relaxed/simple;
	bh=hj5R5jF5CRnw0juE1ALnPF3mWFQ78K4oiIdBkUbQCNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S7OwNoaSpzOsUM04d2qN+u1n0i9uLt7XzcxEpu4gpkjB04WYVQ4Zwp4ZfZOXo5vvRw9l+MMYY7BBh4QuNEjON9eNLm7PaN9Okelr8R1s84dMLXxQ39dNMutrN9Jnc8f8f3f0bFAooLgqxE/vEOtdWibPlBzVSzTyYdyS6aOjYuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gUN9v8np; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gUN9v8np"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB4351691;
	Sun,  4 Oct 2026 01:28:46 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 193E23F763;
	Sun,  4 Oct 2026 01:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791102530; bh=hj5R5jF5CRnw0juE1ALnPF3mWFQ78K4oiIdBkUbQCNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gUN9v8npEC8SGO/RxSEmPQC2sQGykfXJWkXlgSQ+H7NiZbD0DzaRZSWGXs/Kefaxw
	 MFOUX7n+Ch06tPJP7ok5LKxzwd10SDr574CtBNocbU0H2zPxgrfKe5t1Supdr64YTm
	 Fmzxqj8c40492Nh0Y9p1Oh57ilLUP1lFrjXm7Nj4=
Date: Sun, 4 Oct 2026 09:28:34 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
	sudeep.holla@kernel.org, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	d-gole@ti.com, jic23@kernel.org, elif.topuz@arm.com,
	lukasz.luba@arm.com, philip.radford@arm.com, david@kernel.org,
	souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
	puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v12 06/25] firmware: arm_scmi: Add basic Telemetry support
Message-ID: <asIOI0C2IrurrLlj@pluto>
References: <20260920091928.2014972-1-cristian.marussi@arm.com>
 <20260920091928.2014972-7-cristian.marussi@arm.com>
 <20260928130134.000019ff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928130134.000019ff@oss.qualcomm.com>

On Mon, Sep 28, 2026 at 01:01:34PM -0700, Jonathan Cameron wrote:
> On Sun, 20 Sep 2026 10:19:09 +0100
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Add SCMIv4.0 Telemetry basic support to enable initialization and resources
> > enumeration: add all the telemetry messages definitions and parsing logic
> > but only a few simple state gathering protocol operations.
> > 

Hi Jonathan, David

so I posted v13 which was under work since a while trying to address
more Sashiko issues and I included some of your feedback too, BUT still
I have NOT split this patch in smaller easier chunks to easy reviewing,
since I did not want to change too much the shape of the series for my
beloved non-human reviewer for this iteration :P

...but I will certainly split in v14 this patch and the next (both well
over 1k lines as of now) while addressing more of your feedback.

Thanks,
Cristian
