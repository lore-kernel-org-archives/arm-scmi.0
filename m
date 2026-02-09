Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 460B91E9B3A;
	Mon,  9 Feb 2026 16:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770655541; cv=none; b=OGbwSNg/xBuEfHgrnfEn/iLw3vORcoEaD9a+A07LJIaBRHYDnOLV/FDeeIAelqa2lbHMmleC1y3Js/DlneBqLmhl20qDzLBVIH2V595VOgoIbivEjsIvLDrv6IG7zy0qMQVcSMZ9JFG+XS9AcyvJ35NpMGRHzp0OtT96oUYN61I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770655541; c=relaxed/simple;
	bh=OVxJhfA9gvOsce5Q5fuDmP9OAvrQRRhDTX+r/Qa5KNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=llSMAKYnRs2f+u5i/uEq4uqNhX4Ld6tvde6X0yN4eQ7n4Dqowqjg26bZHlIdbo2Nj5/WdT20Pa9412mQrm7RqS7dapw/XwgOwS7dT49Q7FaQ1+OJYIgq2S1Pox5/mirnhWuZTtiHzWdT3xFj6i9Ks5ZWTgSpYVzA/DZTZE+pVjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A92C2339;
	Mon,  9 Feb 2026 08:45:33 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 542823F63F;
	Mon,  9 Feb 2026 08:45:38 -0800 (PST)
Date: Mon, 9 Feb 2026 16:45:35 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Douglas Anderson <dianders@chromium.org>
Cc: jassisinghbrar@gmail.com, arm-scmi@vger.kernel.org,
	cristian.marussi@arm.com, krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	sudeep.holla@kernel.org
Subject: Re: [PATCH v2 03/15] firmware: arm_scmi: Use mbox_ring_doorbell()
 instead of NULL message
Message-ID: <aYoPLzOjPvJbu0Kb@pluto>
References: <20260208040240.1971442-1-dianders@chromium.org>
 <20260207200128.v2.3.I4a01e1fa771c0b1ea7e35882784e4b7f8f33f65b@changeid>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260207200128.v2.3.I4a01e1fa771c0b1ea7e35882784e4b7f8f33f65b@changeid>

On Sat, Feb 07, 2026 at 08:01:25PM -0800, Douglas Anderson wrote:
> As per the patch ("mailbox: Deprecate NULL mbox messages; Introduce
> mbox_ring_doorbell()"), we want to switch all users of NULL mailbox
> messages to use mbox_ring_doorbell().

Hi,

> 
> The mbox_ring_doorbell() explicitly documents not to call
> mbox_client_txdone() for doorbells, so remove the call.
> 
> NOTE: this mailbox client appears to send doorbells and regular
> messages on the same mailbox channel (smbox->chan), so it needs some
> extra attention. Specifically, the new API behaves differently if you
> ring a doorbell while a non-doorbell message is in progress. I don't
> believe that this is something we have to worry about with this
> mailbox client, though, because the code was calling
> mbox_client_txdone() after sending the NULL message. Had a non-mailbox
> message been in progress, that would have marked the in-progress
> message as done instead of marking the NULL message as done.
> 

Yes indeed in the SCMI stack on Linux we use both regular non-doorbell
messaging for cmd/reply exchanges and 'pure' doorbell messaging, where
these latter usually are meant to to signal completion and they are
issued on a distinct channel where NO non-doorbell message is sent
ever: IOW doorbell and non-doorbell do NOT get mixed up in the same
channel...so it should safe...

...having said that, just in case, I tested this series on a JUNO
board using ARM MHU (bidirectional) mailboxes and I have NOT seen any
anomaly.

Tested-by: Cristian Marussi <cristian.marussi@arm.com>

Anyway...Sudeep, who was already in CC, has a couple of mailbox/pcc
related series in flight on the list, so he may want to chime in on
those.

Btw, Thanks for this cleanup !
Now the intent is certainly more explicit and less ambiguous than using
a dummy NULL message to trigger a doorbell.

Thanks,
Cristian
