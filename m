Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794513508;
	b=NsAlVUHJSnbP0dDsbgY5cKcb5IFmVyUFRJRsKtz6Ks96pIKdoPxlRnA1Ys3s4NjElJ67
	 qWtbUb//5HqGPhSd0+qw6m68kb71AU3IgIRmT8AU1Fm/7zN6iuilynYrPowHI0ZbmeETB
	 Q0M8Ps8/t9xz3rmWnmVqfp5FE+e5RJhbBFnyPv1NgNT6JPj4Fz88p8yGe1xxl40Dq6x5/
	 dtMa9VukO4wZh7Cz1JK/8NeTXHsxz037AwawvTZprOPcnFkpORBq93NU9e5upRATf8qee
	 fPrzb6cFX9Ku3LFuEzwU4mzjfiW2gXf0mT77m7cdR6LY7c+wYcdHvgmpSf0yEN+xBKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794513508;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=4t911jJJvWhrsjDIpyGagM9cDytMeOWYFI8KdrirlU4=;
	b=FvbNCW57Qan6d8npFXfSj2oCxKLGGFHxzss38xIJdJVGim4XgX+WleCxu/HpliQ54ZCF
	 f6a7p8YpZQmJJm6dO8mr3Q/+v8iVjH6YeVqgGBTCR2MoRUijd1ndhTVfRbvY26a4QxlDK
	 MGM8aljvXjODfPVKIr127Rp0or8tHuukkOO/2oCW8Lh+DSilf78eR1ZSiy9oBAYj9slsj
	 ET91dAgE4jWc6/obDgInRXTnkblSd8Yqz/cb1W2IhSRpjBA1qhCaGOkqZ7Bcv7DfnPOiu
	 kx+CKneqUur9ylSUq7Q3pDdufelPpNT8k7x1P4ZM+XiBCduUquZz3W7I8wlLD/BLX0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=gSf8YyXR;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC505606A31C;
	Thu, 12 Nov 2026 19:58:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC505606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=gSf8YyXR
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B576143D;
	Thu, 12 Nov 2026 11:58:24 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A1693F632;
	Thu, 12 Nov 2026 11:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794513507; bh=zTQZ0wPiRPzG5KvnZwBepqQecfUeLrclLLCkbgmimQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gSf8YyXRyxaFwVgdpDZwuColKREm5V05Ulxib8DUmO/o1HBzDKhSD8qqkXorYpMtM
	 83Nvy3ozALwBRBpVnHL+bGyhIVTaYEMxDcpt4PcMET7HXb4NWbAbps2AAnK4xSkvxQ
	 idRUfvikMMm++jb5gBZhtIYZEdfHV0Lofau4ftcM=
Date: Thu, 12 Nov 2026 19:58:21 +0000
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
Subject: Re: [PATCH v15 22/35] firmware: arm-scmi: Add Telemetry generic
 event support
Message-ID: <avYaXeQqGOLLAxKm@pluto>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
 <20261109091221.2532706-23-cristian.marussi@arm.com>
 <20261110143356.0000451a@oss.qualcomm.com>
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
In-Reply-To: <20261110143356.0000451a@oss.qualcomm.com>

On Tue, Nov 10, 2026 at 02:33:56PM -0800, Jonathan Cameron wrote:
> On Mon,  9 Nov 2026 09:12:08 +0000
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Add support to allow SCMI driver users to subscribe/unsubscribe to specific
> > Telemetry  abstract (non protocol) events.
> 
> Bonus space before abstract.
> 
> > 
> > This enables SCMI drivers to subscribe to available events by registering
> > an eventfd context that the core SCMI stack will use as a signalling
> > mechanisms. Still no real subscribable events introduced at this point.
> 
> Adding a fake event isn't that helpful. Just combine with the next patch.

Ok, it is just that this was supposed to be a generic framework for more
events to come beside the generation counter, so this patch added the
basic common mechanism.

I'm anyway removing this from the live series being unused for now...

Thanks,
Cristian
