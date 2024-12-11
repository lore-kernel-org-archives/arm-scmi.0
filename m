Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD4B8207A21
	for <arm-scmi@vger.kernel.org>; Wed, 11 Dec 2024 18:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733941739; cv=none; b=SScwk4JkfFdt6Pa7qquyCmJN6myhTIJ+T1KNIiivWSVOPkJ62KgOoTcDYBNpbFNFSScnZudgSJtMHGWxEK9i0oo91Ie5gugON5cYrXWdtzIADIN9hFDBm7bL5lqcE0O0Jx5vxztiAEiq69mW8syJiQy/tzFJl6J8fkvFRn9Edfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733941739; c=relaxed/simple;
	bh=ilTJeBbXPF4YOK6inFw4ci5EzQJUudKrPT8FQD32hMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZDcAsc3fvbCMV9k9+Gns8Ox8b0rEylUnIidkgS/hEA8dJIB+CuCqlIOqazXAVlcuLFRn5vID3jwOvFUXJBPHCXCosJ0u6eG3STDRoXTWB5hybMMOaQduXhv9SfzXLsHw4ud66295lzxNRtsCFjvDP1NXzQm5SAKMkO4i+570Ffk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 434391007;
	Wed, 11 Dec 2024 10:29:20 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1699D3F720;
	Wed, 11 Dec 2024 10:28:50 -0800 (PST)
Date: Wed, 11 Dec 2024 18:28:43 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: guomin_chen@sina.com
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Xinqi Zhang <quic_xinqzhan@quicinc.com>,
	guomin chen <gchen.guomin@gmail.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] firmware: arm_scmi: Delete the meaningless scmi_bus_id.
Message-ID: <Z1nZPmB7nW7HUdYL@pluto>
References: <20241211134505.2218386-1-guomin_chen@sina.com_quarantine>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211134505.2218386-1-guomin_chen@sina.com_quarantine>

On Wed, Dec 11, 2024 at 09:45:05PM +0800, guomin_chen@sina.com wrote:
> From: guomin chen <guomin_chen@sina.com>
> 
> Currently, scmi_bus_id is only used to set scmi_dev.id,
> which in turn sets the SCMI device name. After removing
> scmi_bus_id, it is clearer and more meaningful to directly
> use the input parameters name and protocol to set the SCMI
> device name.

Hi,

even though using progressive IDs in devices is less readable, I agree,
we need ID in the name to keep the device unique.

It is true that we can have only one protocol/name unique pair amongst
the *requested* devices BUT it is also true that the SCMI stack as it
stands can be instantiated multiple times if you define multiple DT SCMI
top-nodes: this is already used in the wild to sort of represent
multiple virtual/physical SCMI Server backend (all anyway identified by
ID-0 as from the spec...)

So if you have defind in the DT 2 SCMI instance with both a protocol@15/HWMON,
as an example, the arm_scmi/driver.c will probe twice and it will try to
create 2 instances of 'requested' devices for 15/hwmon and both of these
will be attached to the same *unique* SCMI bus...so we need the uniqe ID
to differentiate them....same for the transport devices.

Sorry but NACK for me: regarding the readability, I could agree, but you
can anyway easily understand which device is which by looking at the
drivers/ links generated in the scmi_protocol bus directory.

Thanks,
Cristian
