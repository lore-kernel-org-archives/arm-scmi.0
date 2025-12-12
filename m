Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EDC43C38;
	Fri, 12 Dec 2025 12:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765542827; cv=none; b=Oy4Ix8+ugcdQLlSrJ+QpTrxekgPPPshbDbYb4d63bDXyWRXGkeP7TdXvkeBp9aIXYtHBdyM7Wwb4iXzSgN+1+9lvVDNRcsX73X8CuuxbqvVKQPsoPKk3pW0qnwNP1nFi46PZlZs16gV/t88a1CsgIkoj5RFowONd0kBj1ggBNW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765542827; c=relaxed/simple;
	bh=oDQWnsBThnOKROXXFIfKEPlaBOe+7rkU8utW2skCp0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r21g3VEO2B564a99Fz/dRTnv2urrA/BsRyjQnIL6Ah4RMSlchIQFkv/aOpVlzHja+ZkdSErm/A4/gnwslvFn0U7V/7j90dbcuEDuKiF2z3gDH0kKVljQoU+tU/nX3W2HAv/3BnCraoKuSYkOrzSnGyI6BqLWA/X9fwnZtUIK96s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35F391063;
	Fri, 12 Dec 2025 04:33:38 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE4D23F762;
	Fri, 12 Dec 2025 04:33:43 -0800 (PST)
Date: Fri, 12 Dec 2025 12:33:40 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 10/17] firmware: arm_scmi: optee: Make use of
 module_tee_client_driver()
Message-ID: <20251212-rapid-vengeful-lionfish-85aef4@sudeepholla>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
 <537c48e3db243b5c68c3192179a948efb3a180c7.1765472125.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <537c48e3db243b5c68c3192179a948efb3a180c7.1765472125.git.u.kleine-koenig@baylibre.com>

On Thu, Dec 11, 2025 at 06:15:04PM +0100, Uwe Kleine-König wrote:
> Reduce boilerplate by using the newly introduced module_tee_client_driver().
> That takes care of assigning the driver's bus, so the explicit assigning
> in this driver can be dropped.
> 

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep
