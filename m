Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49CD418A6AD;
	Mon,  7 Oct 2024 11:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728301970; cv=none; b=ajPZYmupGyNvaH4CyJsJNysF4Qz4cRmo6afKK/G33YnDQdUDBZFtBnYsm0EDV3DuceLHRwbBEnv7WAWX1wzKC44y0imG86pAb1+TzngFh7yLsYVj7KDtzqf/wt4u5XtEcUgbJgG/p3ACE+TT8kPGf2437zh2shCIizhNAOW8Ij4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728301970; c=relaxed/simple;
	bh=AAXY8T10Y18po9ZtgYdQspsWDx7aM51t75JyZ9VnPfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mpm+nTld6JT4llKDuoMzr0lxplXzbjBTCAFDKP6hyC2CRyk3a2DbQfUvm+ObDFO7msQLJfa/Hnp/K01QupnZgi0eInQVTymeVaoQJS+AhuE4QqJJcp5IJtosj/sDqTsEpkSqQLMwlNlVdJBTMGvPvtYeBpbireX9LsB6PBcx0NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7F0EFEC;
	Mon,  7 Oct 2024 04:53:16 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B2C43F640;
	Mon,  7 Oct 2024 04:52:45 -0700 (PDT)
Date: Mon, 7 Oct 2024 12:52:33 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-arm-kernel@lists.infread.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:SYSTEM CONTROL & POWER/MANAGEMENT INTERFACE" <arm-scmi@vger.kernel.org>,
	"moderated list:SYSTEM CONTROL & POWER/MANAGEMENT INTERFACE" <linux-arm-kernel@lists.infradead.org>,
	justin.chen@broadcom.com, opendmb@gmail.com,
	kapil.hali@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] firmware: arm_scmi: Give SMC transport precedence over
 mailbox
Message-ID: <ZwPLgcGeUcFPvjcz@pluto>
References: <20241006043317.3867421-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241006043317.3867421-1-florian.fainelli@broadcom.com>

On Sat, Oct 05, 2024 at 09:33:17PM -0700, Florian Fainelli wrote:
> Broadcom STB platforms have for historical reasons included both
> "arm,scmi-smc" and "arm,scmi" in their SCMI Device Tree node compatible
> string.

Hi Florian,

did not know this..

> 
> After the commit cited in the Fixes tag and with a kernel
> configuration that enables both the SCMI and the Mailbox transports, we
> would probe the mailbox transport, but fail to complete since we would
> not have a mailbox driver available.
>
Not sure to have understood this...

...you mean you DO have the SMC/Mailbox SCMI transport drivers compiled
into the Kconfig AND you have BOTH the SMC AND Mailbox compatibles in
DT, BUT your platform does NOT physically have a mbox/shmem transport
and as a consequence, when MBOX probes (at first), you see an error from
the core like:

    "arm-scmi: unable to communicate with SCMI"

since it gets no reply from the SCMI server (being not connnected via
mbox) and it bails out .... am I right ?

If this is the case, without this patch, after this error and the mbox probe
failing, the SMC transport, instead, DO probe successfully at the end, right ?

IOW, what is the impact without this patch, an error and a delay in the
probe sequence till it gets to the SMC transport probe 9as second
attempt) or worse ? (trying to understand here...)

Thanks,
Cristian
