Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD0752BEC44;
	Fri, 12 Dec 2025 12:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765542862; cv=none; b=kJds/wiY1Ivw2c9munqklvYOCBLI3nU9oJuonseP73JViP0l1WodH7r6rNEP3uy0u76iRK0E5IKn4CPK0PaV1G5c8e9/oQhBvbYq/TZPSavUHWhnfIJHjXCWXxVaaDdl99oJTfApMg8ZO8y1CdcMLRGUI4sd5jnszOeY1T3mcrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765542862; c=relaxed/simple;
	bh=wRSC1J1Fy3dsdKt2YbvO82cGYCqZFqMYAZYMsG6WKGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WO8ahHYZFNWo24tZC73AWfbR5PEXiVjGAPkrZssC2Gs+NnyJTygXgigl4hk2vl4657dZsd6+3YiKlBdTu+x9B8Sz9vOnv18mk7vIUNnNAcXASwMwyxXYL18yXsGVBT0N6YepZCbfYZ8EUgBxtt2Ue5CuoSeXLGlnAdXNb6uLN1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDC9C1063;
	Fri, 12 Dec 2025 04:34:12 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8467C3F762;
	Fri, 12 Dec 2025 04:34:18 -0800 (PST)
Date: Fri, 12 Dec 2025 12:34:15 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 11/17] firmware: arm_scmi: Make use of tee bus methods
Message-ID: <20251212-cuddly-viridian-armadillo-be28fe@sudeepholla>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
 <46dae3cada663b3a5ae1989881d9e74ef40acce5.1765472125.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46dae3cada663b3a5ae1989881d9e74ef40acce5.1765472125.git.u.kleine-koenig@baylibre.com>

On Thu, Dec 11, 2025 at 06:15:05PM +0100, Uwe Kleine-König wrote:
> The tee bus got dedicated callbacks for probe and remove.
> Make use of these. This fixes a runtime warning about the driver needing
> to be converted to the bus methods. Note that the return value of .remove()
> was already ignored before, so there is no problem introduced by dropping
> the error returns.
> 

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep
