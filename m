Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89D7B3F65FF
	for <arm-scmi@vger.kernel.org>; Tue, 19 May 2026 09:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779181663; cv=none; b=BYFm0snvocuNXShwdNmH5hKrcZvLzcjshN1mjxCAxHCIFdkEdYwbd7u6WadzX/OcLnIwHu4YNQBl5WZ6Pm1prS2PldioDsvxjJRp6hjRakZ9mNTSVBG+akC5/kxyvWYpWds6XZ0oKwvhSpdcne25rNtTBgr7ZomwM+I3hL5cPFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779181663; c=relaxed/simple;
	bh=Sar9yflNHsabnNZU4AVYywfJtAantv6N01mvNjoHBi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pyl/jfMvpfV3fo7jramA/bu7m9y5fxsM6i4ApCD0UIe6/daq2YMykjotqt8IxE3LXZliknUpj+FRddX9gC9XSEkRJuXQkqxH63KxkhflLOwQ0ThVS1lkXiyy73WQ/l9WR0R1oycFoQNKpuj1fakfJYeIzpt4uHHeSusbTI/OdH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gLPCiFNH; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gLPCiFNH"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB8181692;
	Tue, 19 May 2026 02:07:35 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B78EA3F632;
	Tue, 19 May 2026 02:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779181660; bh=Sar9yflNHsabnNZU4AVYywfJtAantv6N01mvNjoHBi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gLPCiFNHNgV06N8T5NiyNw05iZn313C27CMy5S5PR0e3wmjcRYJHvY/TR361aIg8Z
	 LhWEYpWV5/XueeWa+Mtn2e9HOy2n9TOl2fNPb/bkRocpZJxyUS1yQlmX48SSoDVP92
	 6aYtMXbB1/ASlUFA5AyRq96+WAZcaFb5nmsf9Ebc=
Date: Tue, 19 May 2026 10:07:36 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] firmware: arm_scmi: Validate BASE_ERROR_EVENT
 payload size
Message-ID: <agwoWOQm_dPrQvwa@pluto>
References: <20260517-scmi_fixes-v1-0-d86daec4defd@kernel.org>
 <20260517-scmi_fixes-v1-2-d86daec4defd@kernel.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517-scmi_fixes-v1-2-d86daec4defd@kernel.org>

On Sun, May 17, 2026 at 08:02:41PM +0100, Sudeep Holla wrote:
> BASE_ERROR_EVENT carries a variable number of message reports,
> with the count encoded in error_status. The notification parser used
> that count without checking whether the received payload contained all
> reported entries.
> 
> Reject truncated payloads before copying the report array.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>


Not sure is the missing check was due to some sort of best effort
attempt to report whatever the platform was able to report or what...
...but it seems correct to check and discard corrupted replies.

LGTM.
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian
