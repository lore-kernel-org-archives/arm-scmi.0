Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A98D341076;
	Tue,  3 Feb 2026 14:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770128702; cv=none; b=T/94ZD74Rbi0WGABxP80Zt64ncgMAqICCVr9QB6USPLtNgQlbIjlphTFjY0dBeBDlTgxXmqeRzIYcqJaoxTy1+uQDWLd/oPH7iTS7rVcGXRwMBKtxZBjHIg6cQJFOBA7KvoH1r9cjn3G/gVfnihM8Hpus66WcnDHOG9oxNLBB8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770128702; c=relaxed/simple;
	bh=6EMvZkgDU6raCiY0gogzPX8ZGTFcc/rYdyidvuM/lyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWJ26OrkIGT9HauINuEbgzEU1R/zKFFvLQbYn4+If0g+B2kqrzbTOqwLbtUM1yoTemlw3kZxOykUg1g1nkIVexneTQywpbCahHUUvy2Geg26CkgivfpET2bq60R/v2fIfYwUqwBIlR5sj39xSlNhUO7Sii/bbCYhXYN0xXOV7yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TofMpem5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TofMpem5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE64C16AAE;
	Tue,  3 Feb 2026 14:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770128702;
	bh=6EMvZkgDU6raCiY0gogzPX8ZGTFcc/rYdyidvuM/lyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TofMpem5AaQZDe2WDMwQ54H8KjbhW0m4WdSEu9JYFmTwJtNdq8uAzWC/VpQNI5u9o
	 5zBzeRquPor6Q/uh6QaDhGhb63OKgdTNorw8JPy3pnedoCsYb0GQ3llAK7qtFS8+YO
	 YmLzl7uTo1+0dlxxXs9awI4ZyG3Ads9/HDFc1U5GG+2XvV0GCcsruL9p4jUFTSs+2r
	 qmcrn8N91BbzUR9ljtIxf4gbC632irKAPm0JVBT7lHgz4g4gZuibt46wQ09bcWfzF9
	 bjL7hY1tYJ1Q8sNRP9mNj4jMfNwUklkx07R2EdShKJOE/s+X/8VmkMlfCTtsZqNO9K
	 6xYtpzXsTDW3A==
Date: Tue, 3 Feb 2026 14:24:57 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Artem Shimko <a.shimko.dev@gmail.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Add new sensor unit types
Message-ID: <20260203-gregarious-intelligent-crayfish-6bceec@sudeepholla>
References: <20251021165212.749372-1-a.shimko.dev@gmail.com>
 <20251022-rugged-archetypal-wallaby-ecbecf@sudeepholla>
 <CAOPX744bwwZHEODktumJbE1MUyfDgYj3vrexT7GRBZ6BTrECXw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOPX744bwwZHEODktumJbE1MUyfDgYj3vrexT7GRBZ6BTrECXw@mail.gmail.com>

On Tue, Feb 03, 2026 at 03:45:28PM +0300, Artem Shimko wrote:
> On Wed, Oct 22, 2025 at 12:22 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
> > It is still alpha, we don't add anything into the kernel unless it is
> > of beta quality.
> 
> Hi Sudeep,
> 
> Just a polite ping.
> 
> Is it still too early for 4.0 bet0?
> 

v4.0 beta is out but I would take this with telemetry support that may
start using this. Let me know if there are any users before that.

-- 
Regards,
Sudeep
