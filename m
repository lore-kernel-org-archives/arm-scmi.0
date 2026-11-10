Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794299008;
	b=g3yjm6Swdq9iJL/y7nMRKmJywheDi0o6OQMl3Cf75D3hnagC8Pw2P15S8qcHXr6sgJbr
	 pHy28Nn9gsf+x4N7sQF7Hkhi8DhQRVjNfbc5x8ezSsiYI+TxwlezEMCn5rbQZK5S2ZJHo
	 QDW6P9J1uwgIIZQheMGQK7+B99Xj2D+VYRnDiJ+h39IO3XIaldTNYKfXpOXMkBfqqup/g
	 9+zGoX9JTOGA1Qy2W8QzSJpZPK1Vy8m9ytxmTz/d5aTxIOHnJbZ9YOr+Y099YOH4Wty7F
	 g/1n+yT9vR9vftrzGInVBjtFYvpYWlCEC6zsvrFE+0vpGZoCDy0Ah9CLMEZn2xBaQOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299008;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=4CxrLZlhsnLdjHdcH6odGSKbaksvNehmIBPyUx6+8A8=;
	b=JlZ/LUdICAlEdf95b3ByNdFWD9V5VhzFZcbgCeLP9OLMzFvag6PIxQxKjyCTwtqXByhH
	 /cf783jlbXLQKc0dtCTqlOVHAORmmOHbjFlnZd0TVwBTRJoKkzNveiCfag9tJmHA7wta9
	 paRzcjjamrujYXByC29napaGmH87lha0JnC36snkSnseCU3HTD6OoF5xezQ10SfTO/6Fa
	 2IYboUvYu6cj2fwsSQxZnByFetio8A5KD6zHXOe6rxVkQbVlTFDu9najyVIY1gTKEtnM+
	 9qjfJFGv+kjJoOi6WV8+nH3BORWTNwtOP6x86CmBf9KXhVX4iuRvrB/rqu+/CQ+eJ5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=lSWsvL34;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CCEC606A325;
	Tue, 10 Nov 2026 08:23:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CCEC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=lSWsvL34
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3BD4F1516;
	Tue, 10 Nov 2026 00:23:23 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B9863F85F;
	Tue, 10 Nov 2026 00:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794299006; bh=Fl19Ryaf0hHQ4aMbgjvRFTo4nuE32BVuV0ZlxaZOhio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lSWsvL34M78tV3BIMDLbw/jmNXTj+YeoDW2V2Ihv1AgrovPFzPDVM1wdRqM/mh92x
	 AfsnD3BwMbT7jxmBEfpYCeiHcxa1DpCoh2FgBk/pU8N+Hhyuab5ONtzv0s3YtXESzT
	 C289T8bTqip/4SqJVn3ZaHVbG9bupQiiMPFRIXZU=
Date: Tue, 10 Nov 2026 08:23:20 +0000
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
Subject: Re: [PATCH v15 03/35] firmware: arm_scmi: Introduce a dedicated SCMI
 Errors header
Message-ID: <avLUeIlY89i5Mahs@pluto>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
 <20261109091221.2532706-4-cristian.marussi@arm.com>
 <20261109140129.00004b4f@oss.qualcomm.com>
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
In-Reply-To: <20261109140129.00004b4f@oss.qualcomm.com>

On Mon, Nov 09, 2026 at 02:01:29PM -0800, Jonathan Cameron wrote:
> On Mon,  9 Nov 2026 09:11:49 +0000
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Add a new dedicated header and move all of the errors definitions and
> > mapping helpers into it and out of common.h so that SCMI errors definitions
> > alone can be easily included in protocol files without all of the unrelated
> > additional stuff contained in common.h
> 
> In ideal world I'd move first and add the new codes later.
> (so swap this and previous patch).
> 

Ok but logically the new separated header is needed by the fact that the
new added error codes has to be checked in-protocol and including
common.h in protocol unit bring in a lot of unneeded stuff.

> Trivial thing but reduce the patch size a tiny bit!
> 
> Other than that, seems like there are enough of these
> for a separate header to perhaps make sense.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

Thanks,
Cristian
