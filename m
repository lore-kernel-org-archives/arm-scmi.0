Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D704E1547D4
	for <arm-scmi@vger.kernel.org>; Mon,  7 Oct 2024 13:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728306257; cv=none; b=gVkXrIZsnx30GLIplesz4qQFrhoGZBA/UqWrbwwqaA7kCVojQnpnuXb28I1kNaOOJU4KKLU5LwCnAydjiISAhhz+gQ89lYNCLutO7+SbMascl3hcsSgXgMsGFTYmCDhZDv6rHH3m+1b/QvGt2IK0OvdtPn0i98P+0kpVHC3v7f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728306257; c=relaxed/simple;
	bh=PdwqZr+4mfdUzMmI4YcFeyhbauOc4sAG0T865/oQKEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YTZcPrM28YoIFWJ2rJJ16G00Cft52xRVNDO3cNOCNE/ZzfKWnlL3e81yb9vDG3NWkiQSKJpBFLp+LckW3G3FRufug3gLh2EtWJn2p1twrEFrTES18GG/5cbYGAF+y2rrSflFukJSKurxxHWIH29VeyZaloUzLt0dR/rJhDqnXE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8472DA7;
	Mon,  7 Oct 2024 06:04:44 -0700 (PDT)
Received: from bogus (unknown [10.1.196.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C513B3F640;
	Mon,  7 Oct 2024 06:04:13 -0700 (PDT)
Date: Mon, 7 Oct 2024 14:04:10 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Justin Chen <justin.chen@broadcom.com>
Cc: arm-scmi@vger.kernel.org, cristian.marussi@arm.com,
	linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com,
	Sudeep Holla <sudeep.holla@arm.com>,
	bcm-kernel-feedback-list@broadcom.com,
	florian.fainelli@broadcom.com
Subject: Re: [PATCH] firmware: arm_scmi: Queue in scmi layer for mailbox
 implementation
Message-ID: <ZwPcSmRpTGrCdt6I@bogus>
References: <20241004221257.2888603-1-justin.chen@broadcom.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004221257.2888603-1-justin.chen@broadcom.com>

On Fri, Oct 04, 2024 at 03:12:57PM -0700, Justin Chen wrote:
> The mailbox layer has its own queue. However this confuses the per
> message timeouts since the clock starts ticking the moment the messages
> get queued up. So all messages in the queue have there timeout clocks
> ticking instead of only the message inflight. To fix this, lets move the
> queue back into the SCMI layer.
>

I think this has come up in the past. We have avoided adding addition
locking here as the mailbox layer takes care of it. Has anything changed
recently ?

--
Regards,
Sudeep
