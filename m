Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC9A1DDA18;
	Mon, 10 Aug 2026 13:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786368952; cv=none; b=e0viV5vijY+lGyFKVHNopJHgjEbJMYAJ5yyZLdC40Gghx2s0VPan281kpf9OGX1SumYkpjeyODV2ChuHsvP9HglrKhRAVicoVYp154uk0Oc4SYJgUNH6ZZlfSvyees0+6uFLO7ucKZ0v76ui05ITFNoNC6Zq8d4SLo1ZntyR054=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786368952; c=relaxed/simple;
	bh=991HfjnG6QbqkXDaoqknVpf0eV83dcGtzfTkULWDnW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g0Mt6OSEVyv1DhFKXLxb3WnMYae5nTco8XaRSi4ofAElej1ZGmNC5NVTwSieFo0UlOulh/iMKXP7PNz4X5weaK/VSHD2Zjqfcq46X7igteTD6kEQYrTxYxop8V+sIYCfNjfN+mpLB/gFZWMoZ/js5lCl7PWjz7KszpnCJVzmEC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fzZ91UK5; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fzZ91UK5"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3B6C1477;
	Mon, 10 Aug 2026 06:35:45 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B55813F632;
	Mon, 10 Aug 2026 06:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786368949; bh=991HfjnG6QbqkXDaoqknVpf0eV83dcGtzfTkULWDnW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fzZ91UK57kTdR2Ef94w96o0QEjTTIdkLtR5TrjLYYUymDnuoep0zcxLwSPCZqBq2v
	 /WhhmO/bx1xbKgv53Kzk6Wio2s2PHD6HdMQ0O+39vsRa0XTg5jqHFctPtBJYMzwnix
	 jbqKDeH739XPRiYNzgMx3dVujXp0ygb21wLMQ3gQ=
Date: Mon, 10 Aug 2026 14:35:38 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Fayssal Benmlih <Fayssal.Benmlih@arm.com>
Cc: Cristian Marussi <Cristian.Marussi@arm.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"d-gole@ti.com" <d-gole@ti.com>,
	"david@kernel.org" <david@kernel.org>,
	Elif Topuz <Elif.Topuz@arm.com>,
	"etienne.carriere@st.com" <etienne.carriere@st.com>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>,
	"james.quinlan@broadcom.com" <james.quinlan@broadcom.com>,
	"jic23@kernel.org" <jic23@kernel.org>,
	"kas@kernel.org" <kas@kernel.org>,
	"kernel-team@meta.com" <kernel-team@meta.com>,
	"leitao@kernel.org" <leitao@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Lukasz Luba <Lukasz.Luba@arm.com>,
	"michal.simek@amd.com" <michal.simek@amd.com>,
	"peng.fan@oss.nxp.com" <peng.fan@oss.nxp.com>,
	Philip Radford <Philip.Radford@arm.com>,
	"puranjay@kernel.org" <puranjay@kernel.org>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	"sudeep.holla@kernel.org" <sudeep.holla@kernel.org>,
	"usama.arif@linux.dev" <usama.arif@linux.dev>,
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>
Subject: Re: [PATCH v7 03/23] firmware: arm_scmi: Introduce protocol instance
 notifiers
Message-ID: <annTqkEfL2hqcKFw@pluto>
References: <20260802145618.1952804-4-cristian.marussi@arm.com>
 <B5F86BAB-83E2-4C54-BEC9-7714C865CB7D@contoso.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <B5F86BAB-83E2-4C54-BEC9-7714C865CB7D@contoso.com>

On Mon, Aug 03, 2026 at 11:52:05PM +0100, Fayssal Benmlih wrote:
> Hi Cristian,
> 

Hi,

> A couple of notifier lifetime issues inline.
> 
> > 	scoped_guard(mutex, &info->protocols_mtx) {
> > 		pi = idr_find(&info->protocols, protocol_id);
> > 		if (WARN_ON(!pi))
> > 			return;
> >
> > 		proto_notifier_nb = pi->pno.nb;
> > 		/* Ensure NULL is visible */
> > 		smp_store_mb(pi->pno.nb, NULL);
> > 	}
> >
> > 	if (proto_notifier_nb) {
> > 		int ret;
> >
> > 		ret = scmi_protocol_notifier_unregister(pi->handle,
> > 							&pi->pno);
> > 		if (ret)
> > 			dev_err(handle->dev,
> > 				"Failed to release protocol notifier\n");
> > 	}
> >
> > 	guard(mutex)(&info->protocols_mtx);
> > 	if (refcount_dec_and_test(&pi->users)) {
> 
> The notifier is cleared and unregistered before decrementing the protocol
> users refcount. If the protocol instance has multiple users, the first
> user that releases it removes the protocol implementation's notifier even
> though the instance remains active for the remaining users.
> 

> Should notifier removal happen only when the final protocol reference is
> released?
> 

Yes, but it is not so easy to do given the current notification handlers
design (that I did :P) since notifier were not supposed to be used from
within a protocol, till Telemetry...so the attempt is to fit (cleanly)
this new use-case into the existing SCMI Notification framework..since
99% of the related handling is the same....I have reviewed this logic
in V8, improved I think, but still Sashiko has some complaints...

> The ordering may need to be reworked so the final-reference decision and
> clearing of pno are made under protocols_mtx, while the potentially
> blocking notifier unregister operation is performed without freeing the
> protocol instance underneath it.
> 

Cannot be done holding the mutex with the current design...

> > 	if (proto_notifier_nb) {
> > 		int ret;
> >
> > 		ret = scmi_protocol_notifier_register(pi->handle, &pi->pno);
> > 		if (ret)
> > 			dev_warn(handle->dev,
> > 				 "Failed to register protocol notifier\n");
> > 	}
> 
> If registration fails, pi->pno.nb remains populated. Future acquisitions
> of the existing protocol instance do not retry registration, while release
> later attempts to unregister the notifier even though registration never
> succeeded.
> 
> Please either clear the stored notifier on registration failure or track
> registration state separately and provide a defined retry/error path.
> 
Reviewed all of this in V8.

Thanks,
Cristian
> 
