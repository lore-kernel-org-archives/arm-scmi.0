Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C23E932BF58
	for <arm-scmi@vger.kernel.org>; Mon, 15 Dec 2025 15:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765811630; cv=none; b=Kzu4kWYPUsvcnfMtYcJtPZtj52uktIDj0ogNigPmyqgcaTQiIpwMejDxRdM70goinoLtOWojF02b27YZDsKhB7zABDg7NNlrgfSBAfZ3qsNP0cRW/ZPUhrMOWxMlX3lKe65iVJcLSuSS2WGGRxfVwkX8WsSHRvUx9o/pUz3wMig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765811630; c=relaxed/simple;
	bh=dalv8twLU46lORKO+QbJ7vdvafuPbyme8aFDXXj3tes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=duMOQ2EXb7MFpFpghyiVMpVAWR4u+bgh7iUHiw1i9z5fW1rh3rxZOMC/ryANyGm3OitMYuN/LpsiReaUc5KwzOYJeRiZPeWHEmdZxSg6geWDvcBDSbJWn54ZOXTHB2dTVsqAf+EgITqTo6pRcJ6V/RpguDh8y1Lzuh2AYtsJDzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 178CF497;
	Mon, 15 Dec 2025 07:13:41 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 629343F73B;
	Mon, 15 Dec 2025 07:13:47 -0800 (PST)
Date: Mon, 15 Dec 2025 15:13:44 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: "amitaigottlieb@gmail.com" <amitaigottlieb@gmail.com>
Cc: arm-scmi@vger.kernel.org, amitaig@hailo.ai,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: Fw: [PATCH] firmware: arm_scmi: Fix unused notifier-block in
 unregister
Message-ID: <20251215-arrogant-hippo-of-painting-e39ceb@sudeepholla>
References: <20251211114926.709004-1-amitaig@hailo.ai>
 <aTq2IA6V1nTE-XSC@pluto>
 <aTq-0QAUONrNERGA@stanley.mountain>
 <DB9P194MB13560B1BBAD2A8A8E6260719C1ADA@DB9P194MB1356.EURP194.PROD.OUTLOOK.COM>
 <20251215121929.uaauv3ikjgv6zuit@hlil-521-lap.qb.hailotech>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215121929.uaauv3ikjgv6zuit@hlil-521-lap.qb.hailotech>

On Mon, Dec 15, 2025 at 02:19:29PM +0200, amitaigottlieb@gmail.com wrote:
> On 25/12/15 11:27AM, Amitai Gottlieb wrote:
> > 
> > ________________________________
> > From: Dan Carpenter <dan.carpenter@linaro.org>
> > Sent: Thursday, December 11, 2025 14:53
> > To: Cristian Marussi <cristian.marussi@arm.com>
> > Cc: Amitai Gottlieb <amitaig@hailo.ai>; arm-scmi@vger.kernel.org <arm-scmi@vger.kernel.org>; sudeep.holla@arm.com <sudeep.holla@arm.com>
> > Subject: Re: [PATCH] firmware: arm_scmi: Fix unused notifier-block in unregister
> > 
> > On Thu, Dec 11, 2025 at 12:17:01PM +0000, Cristian Marussi wrote:
> > > On Thu, Dec 11, 2025 at 01:49:27PM +0200, Amitai Gottlieb wrote:
> > > > In function `scmi_devm_notifier_unregister` the notifier-block parameter
> > > > was unused and therefore never passed to `devres_release`. This causes
> > > > the function to always return -ENOENT and fail to unregister the
> > > > notifier.
> > >
> > > [ CC-ing also Sudeep ]
> > >
> > > Hi,
> > >
> > > thanks for this.
> > >
> > > LGTM.
> > >
> > > Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> > >
> > > >
> > > > In drivers that rely on this function for cleanup this causes
> > > > unexpected failures including kernel-panic.
> > > >
> > > > Fixes: 5ad3d1cf7d34 ("firmware: arm_scmi: Introduce new devres
> > > > notification ops")
> > 
> > This Fixes tag needs to be all on one line.
> > Fixes: 5ad3d1cf7d34 ("firmware: arm_scmi: Introduce new devres notification ops")
> > 
> > > > Signed-off-by: Amitai Gottlieb <amitaig@hailo.ai>
> > > > ---
> > > >
> > > > This is not needed upstream becaues the bug was fixed
> > > > in a refactor by commit 264a2c520628 ("firmware: arm_scmi: Simplify
> > > > scmi_devm_notifier_unregister").  It is needed for the 5.15, 6.1 and
> > > > 6.6 kernels.
> > >
> > > I think there is some sort of syntax to refer to the applicable Kernel
> > > versions in the tag line....not sure it can be easily followed here...so
> > > maybe the above comment is enough...
> > >
> > > More details here...
> > >
> > > https://docs.kernel.org/process/stable-kernel-rules.html<https://docs.kernel.org/process/stable-kernel-rules.html>
> > 
> > I'm pretty sure those little comments aren't parsed automatically...
> > It feels duplicative.  I don't love those little notes because it feels
> > like the Fixes tag should normally be sufficient otherwise I want a full
> > explanation.  There was an embarrassing bug where the notes were wrong
> > and the patch was missing a Fixes tag so it wasn't backported far enough
> > in distro kernels.
> > 
> > It can't hurt to add them to the tag section, I suppose.
> > 
> > Cc: <stable@vger.kernel.org> # 5.15.x, 6.1.x, and 6.6.x
> > 
> > Leaving them out is also fine, really.
> > 
> > We definitely still need the note.  I said before that note about
> > "This is not needed upstream becaues the bug was fixed
> > in a refactor by commit 264a2c520628 ("firmware: arm_scmi: Simplify
> > scmi_devm_notifier_unregister")" should go under the --- cut off line,
> > but actually I think now that it should go into the actual commit
> > message itself.  Otherwise people who work on distro kernels, for
> > example, will wonder why the commit doesn't have an upstream hash.
> > 
> > Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
> > 
> > Wait until Sudeep has responded, and then resend the patch to
> > stable@vger.kernel.org with all the Reviewed-by tags.
> > 
> > regards,
> > dan carpenter
> 
> I switched to my personal mail as my work was making my life difficult
> while using an external mail client.
> 
> I've waited a few days and Sudeep hasn't responded, is it fine with you
> if I send it off as is?
> 

Sorry, I am fine with the change and was thinking of acking it when you
posted version for stable kernel following the rules. Or did I miss that ?
Please point me with a link to the posting if already done.

-- 
Regards,
Sudeep
