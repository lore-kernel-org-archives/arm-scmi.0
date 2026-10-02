Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8124AB1A9
	for <arm-scmi@vger.kernel.org>; Fri,  2 Oct 2026 13:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790947559; cv=none; b=L541BrxywZDMbUbnftmbvaPsVgBghTcKaa40kn6aVUDkNAzASlXY8010Az9o5pDxyGCexxUJ4g/+W8epnv3f9IqzPdclsWQMuRcaoxn+pXvMx04K2zqlqMA+iAPZhq/U0XLFjbgkWqVyG4siMwZ3pd8owWrsyus0BJIKjjngo5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790947559; c=relaxed/simple;
	bh=zv6Q8kr+93vuVh//SNfFfJlc5dKncqPBa/KwUqrnbLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I9vc8+yNp+II70yYS2ZOCapkun9pq2jy7Xg35zo6cX4Hor8xostqYmRvJzSSLFt6lR9OM99Pdxg7mYeTlUOHqLWfVREripug73lDiC3Tqik4HZGXRxY2XbLSQRo7IbVQDhFR9MYzauriMCjVUqj38Z0T++2MPeTjlh9uZv8YITU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZfAPlXfq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZfAPlXfq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A4D1F00898;
	Fri,  2 Oct 2026 13:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790947558;
	bh=cySCp0LGJp1jRyKDytxLugpUBTzPGAeg3fZ0Wf5W7cU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZfAPlXfqmaDO+H5cuZbaPNfGW2MqmXDxEg2BjfAKgvlabqLQkpLxBiKELQLARIWS/
	 Cu5Xr9Cfhp7pWsahMMWrw8AcArv0qSdfAVAqGIDc1kF4SQa+sVA6Yeuxa+Cdu71UJ8
	 nwZsaRLC0slTkDRIdnlGyow5aWzEfRB1c5OIoTh8rKSIK0o+s34JIqHM+YTlunCj5V
	 KPjo6zQve2MGy1gyMrRRFqckk+U5ve4GPU2+Onn6xZ3RLqUWTvHHm9Mxgf/SJoCRbb
	 NNI1eDzppe6tXRK3fbD+8LO8wvZ9GfzNetuEqsuUIWAAVTfCkny/cn38cf8bWQhSq/
	 r7AAg01Pmovlw==
Date: Fri, 2 Oct 2026 14:25:55 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: arm-scmi@vger.kernel.org, Peng Fan <peng.fan@oss.nxp.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH 2/4] firmware: arm_scmi: Skip requests for standard
 protocol devices
Message-ID: <20261002-dark-wondrous-whale-febb4a@sudeepholla>
References: <20261002-scmi_bus_fixes-v1-0-8695cbab3fe7@kernel.org>
 <20261002-scmi_bus_fixes-v1-2-8695cbab3fe7@kernel.org>
 <d1474169-bf2c-486c-91f1-3754638dbe0e@oss.qualcomm.com>
 <20261002-immortal-normal-nyala-a9b6ce@sudeepholla>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-immortal-normal-nyala-a9b6ce@sudeepholla>

On Fri, Oct 02, 2026 at 01:50:44PM +0100, Sudeep Holla wrote:
> On Fri, Oct 02, 2026 at 12:18:57PM +0200, Hans de Goede wrote:
> 

[...]

> > That downside is pretty much why aac4e67d6eb9 ("firmware: arm_scmi:
> > Always create devices for standard protocols") does things the way
> > it does.
> > 
> > If we want something like this patch, then my suggestion would be to
> > make scmi_protocol_device_unrequest() skip the
> > blocking_notifier_call_chain(SCMI_BUS_NOTIFY_DEVICE_UNREQUEST) call
> > for standard protocol devices, but otherwise keep them on the request
> > list to keep the detection of duplicate device-ids.
> > 
> 
> Ah, is this the same reference of duplicate-ids for std-proto devices
> made above ? If so, I understand what you mean now. I agree we need
> to fix that too. I simply don't like keeping 2 possible paths or
> device creation for std proto devices as I feel it will be troublesome
> in the future.
> 

No, I am actually lost. I am probably not able to understand the case
you are explaining, sorry.

-- 
Regards,
Sudeep
