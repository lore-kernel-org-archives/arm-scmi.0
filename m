Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D80B32FA22;
	Wed,  3 Dec 2025 15:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764777123; cv=none; b=YCFiBrA4tzyiWp026xYbN7KPMOlM3cU42Vs0eKq444PvWlyUZG3VuSNaPUFY8tjyoPzaKxSmrYlzyIni6AEU+ziBZ0DnSXRqveyfvtkp1IPRawxl2Yl2IOsaxUDPG8RJ0+L0RNEtDN7AiASxB6xXdRdGCj2NmolzGOhjj2oh0b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764777123; c=relaxed/simple;
	bh=oK5837m684Ih45zREIkE/c04++VnA7YSPW8NdJbOHtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UvRYS3ZSCK1RFVzS+OuzWQEzoBUjoKFgixmJ9dVsRhLz1/C1qv03sdtJFagzAYtEZbJUE+VQl/lNHZtxrZ/+lFffK6na78hf8oetlD6NsKefnO3qlOXSbyPhK+QmliQfAKr8qRDfz/cDzvABSyJgT4qt2oKFjRJ6CNasl5+lj4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62862339;
	Wed,  3 Dec 2025 07:51:53 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70CF63F66E;
	Wed,  3 Dec 2025 07:51:59 -0800 (PST)
Date: Wed, 3 Dec 2025 15:51:56 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Ally Heev <allyheev@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v2] arm: fix uninitialized pointers with free attr
Message-ID: <20251203-angelic-enlightened-coyote-cde8ae@sudeepholla>
References: <20251203-aheev-uninitialized-free-attr-arm-v2-1-db52b2655ddf@gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203-aheev-uninitialized-free-attr-arm-v2-1-db52b2655ddf@gmail.com>

On Wed, Dec 03, 2025 at 08:52:34PM +0530, Ally Heev wrote:
> Uninitialized pointers with `__free` attribute can cause undefined
> behaviour as the memory assigned(randomly) to the pointer is freed
> automatically when the pointer goes out of scope
> 
> arm doesn't have any bugs related to this as of now, but
> it is better to initialize and assign pointers with `__free` attr
> in one statement to ensure proper scope-based cleanup
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/aPiG_F5EBQUjZqsl@stanley.mountain/
> Signed-off-by: Ally Heev <allyheev@gmail.com>
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> Changes in v2:
> - added Reviewed-by trailer

Ideally, there is no need to repost the same patch with just trailers added.
Sorry for no response, I plan to queue this at -rc1 as fix, so please give
me some time to officially apply at -rc1. I have put this a branch, so I won't
miss this but may need to rebase and hence silence.

-- 
Regards,
Sudeep
