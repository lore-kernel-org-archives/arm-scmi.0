Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD65E284884;
	Tue, 17 Mar 2026 13:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773754624; cv=none; b=PObeQbcUxAp9S+HbD9JfnnDIjdZrs6S+wRDFhg3KgeZCBb2jfGCrtAXmvqHNJG2zKtCNYf2D7NfDRfVGI3zy67Xt2qrmXnOh5/qRsnq7bZUJs0WN7CnGP82EeAvZrNlq3yNeRi52iVwb+YNrAPfuiY77tClyL0axE/EtzvoGO5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773754624; c=relaxed/simple;
	bh=zb+0/FpWFSBGeehYQnYgKbMASYQhs0tC6XBZQs83Cu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZjXVMGwZxMcAMIqhqnkQ5Feh7f8zFIc6zmrgEqfhbk+1SmNDlwve4W8nAD5BK5XaLIByxwfmIwIMsuBp6PztIfo7tz4WD2sMNDnI4MNLc0yMAef1JGnpuMx+gvuUeJ7yLXRQepdZtBRXdWFb9q7MsKQJY2CGvvMKDvSw3LMs2OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=azsZU0Ht; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="azsZU0Ht"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 924A4C19425;
	Tue, 17 Mar 2026 13:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773754624;
	bh=zb+0/FpWFSBGeehYQnYgKbMASYQhs0tC6XBZQs83Cu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=azsZU0HtzNfnw7wxjErPMaACGtdOh4r0Qf0Q4shvlX8XswFL44FCQ9c+ZVPhU2C0O
	 +cu9oDgM3eRmBhi8LWaOUekJajlm+hxAvsWTmbkNzDL07Xx7wSol35e77uViJSSgwE
	 jK5mdFlZQIzcubzEA6MI3yX7saHlItX74fVVMcS9C/lmSMHpFjlNCcQjwYIIIevBnf
	 o/Q1HZmWxRuE4wMeoMjAVs4nZR6A/0lCMoHBkG5+SJJnwq0vP5UkUYcBWLGaX6qNkT
	 AR2Szk/aSG8FreCT98qeFkct8OOSUlhVOf5ivIm62BbpUZsIcaNdbYBdZCSW5IeqtS
	 kruBu8qiV8/pw==
Date: Tue, 17 Mar 2026 13:37:00 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Artem Shimko <a.shimko.dev@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: extract domain ID validation helpers
Message-ID: <20260317-innocent-prawn-of-acumen-68c2ca@sudeepholla>
References: <20260122161728.1225583-1-a.shimko.dev@gmail.com>
 <CAOPX745OsSOuZirpvW5nXDEbjpZXbmXtgQ6zB=dMX2tP+jhgaw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOPX745OsSOuZirpvW5nXDEbjpZXbmXtgQ6zB=dMX2tP+jhgaw@mail.gmail.com>

On Tue, Mar 17, 2026 at 03:05:59PM +0300, Artem Shimko wrote:
> On Thu, Jan 22, 2026 at 7:17 PM Artem Shimko <a.shimko.dev@gmail.com> wrote:
> >
> > Refactor the voltage protocol implementation by moving repeated domain
> > ID boundary checks into dedicated inline functions. This reduces code
> > duplication and improves maintainability.
> >
> > The new helpers are scmi_voltage_domain_validate_id() which validates
> > a domain ID and returns an error code, and scmi_voltage_domain_lookup()
> > which returns a pointer to the domain structure or an error pointer.
> > These are used consistently across the voltage operations.
> > No functional changes are introduced - the validation logic remains
> > identical to the original inline checks.
> >
> 
> Hello maintainers,
> 
> Just a gentle ping.
> 
> Do you have any thoughts or feedback on this approach, or are these
> changes even irrelevant?
> 

I applied and then realised it is not necessary to churn so much to just
unify the domain ID validation. So I dropped it.

-- 
Regards,
Sudeep
