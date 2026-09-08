Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8448E5650E9;
	Tue,  8 Sep 2026 15:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882012; cv=none; b=BnanG2C7RLACLO1x5fpmVaJn+IzoXXi8bDUHwckfsVpz8S3na91rzkpfEahYOpSdPcWGdAoMDAGR9t8svY06b3tboMD6YmHHEkNAmE4DsW0lj0fYgInE3sOgWRwVv6/6avIWuRH1ldcmLLtj8PGYgM4fW87YKAqMy+V+wcTNRX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882012; c=relaxed/simple;
	bh=4E/QUa1lJLzFAlCV6vPDzrRQV3T6EKul1f35Q4OSPzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cPHL3JJUnPFvperNcwXdW9Qga1peYP37cUKEJQlqCAovMArjo++in54LtQ3R739H0d5/QTH7jrdSMvntLI/h/u048QXta6ee4Tzc+nsaRUrOUxmVk5dp028ZhfQGoOiWbNGnDhH1+3USJS/YHbmNCEr1puqmTGs4e1aqZ1Kgt2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ZA4cJHzC; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ZA4cJHzC"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C46411476;
	Tue,  8 Sep 2026 08:39:56 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E77E3F7B4;
	Tue,  8 Sep 2026 08:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788882000; bh=4E/QUa1lJLzFAlCV6vPDzrRQV3T6EKul1f35Q4OSPzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZA4cJHzCorXj5MAXtAIs8Y/Mjeznm2KVYPJT22y7BscOnKzAaiMvSSjCzPi8mudo6
	 YqCCG/El4TCTvkHtCH/UMNFji8/tQXhsO4eM/O+smMCE2zjxGPGKP7rYUHe4Ev4ovv
	 Ja7+JOpK1F6Rk8/ujCt64QN3el//HDA+d0RPkx54=
Date: Tue, 8 Sep 2026 16:39:51 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: rolanddreier@rivian.com
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Couple of SCMI race fixes
Message-ID: <aqAsR4tQrtsUZe66@pluto>
References: <20260814-scmi-async-done-race-v1-0-335b163d77ee@rivian.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814-scmi-async-done-race-v1-0-335b163d77ee@rivian.com>

On Fri, Aug 14, 2026 at 08:15:32PM +0000, Roland Dreier via B4 Relay wrote:
> Noticed a couple of races in SCMI code around delayed responses that
> time out. These are probably nearly impossible to hit in practice but
> the fixes are pretty straightforward and it seems worth having the
> code be sound.

Hi, 

apologies for the delay in this reviews...

Nice hardening work, Sashiko complains about a few unrelated things (of
course :P), there is only probably a good point around the update of
DEBUG_COUNTERS that you added


https://sashiko.dev/#/patchset/20260814-scmi-async-done-race-v1-0-335b163d77ee%40rivian.com

"Will this new counter actually increment for timed-out responses, or will it 
be blocked by earlier validation logic?"

I mean please consider if you can improve the patch only regarding the
DEBUG_COUNTER update (probably moving the update where async_done is now
set to NULL is enough...)

Beside this, look good to me and in my testing everything was fine.

Thanks
Cristian
