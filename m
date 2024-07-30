Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4EB818990C;
	Tue, 30 Jul 2024 16:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722357436; cv=none; b=fTm5D3xV/nSY2UVQWuGaNGQaX0KY1N0tA3pxqEhSfDkdqvQjf1gKM+7w6kvu6/0dRVkTXuZ74Ey+BmSNvZC95I61Aa9xnVaq2M0WNZ+uy+mRfZ7fGAfwnFpS9sfbgx60/nNEBY9S8eXV9o59ncvaAlNIoiPaDw+gMphPHazRI4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722357436; c=relaxed/simple;
	bh=wTphMzmUblkTwc2aZhMEXaKe57a3bkZCi1hqSZrrrRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=js7gpta2voj3xTvF0vOL/geK5wN6GzWqu+m/ijFq+xsVJUY5clecRStkRR6NFO0pFK9VoMwG2a5lBJ5Z7EtCGDXViGQm4BYJ2HBwEvGZRcMgd2BW1wwq/yMzPb2R8oqt0oVG3JE9D820sosnw+asUZU+rUe048mOPRJssZ6kMd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE8191007;
	Tue, 30 Jul 2024 09:37:39 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F05653F5A1;
	Tue, 30 Jul 2024 09:37:12 -0700 (PDT)
Date: Tue, 30 Jul 2024 17:37:10 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Luke Parkin <luke.parkin@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	cristian.marussi@arm.com
Subject: Re: [PATCH v4 5/5] firmware: arm_scmi: Reset counters
Message-ID: <ZqkWthQKF2X4Famt@pluto>
References: <20240730093342.3558162-1-luke.parkin@arm.com>
 <20240730093342.3558162-6-luke.parkin@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730093342.3558162-6-luke.parkin@arm.com>

On Tue, Jul 30, 2024 at 10:33:42AM +0100, Luke Parkin wrote:
> Allow writing to atomics to reset
> Create reset_all counters debugfs file to reset all counters
> 

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian
