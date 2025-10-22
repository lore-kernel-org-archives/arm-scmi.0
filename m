Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62241309EE4;
	Wed, 22 Oct 2025 08:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761121620; cv=none; b=RZmKFTbirkw5U7UbiDUvl3h9liExzsXxauYLzUTonTC4W7YiWWr4ZJaUhtMnj1jyyrQ21EPmUxGqp3AMoKcB6/3r2hJgWLkeSAXBwGvLMdNt1ghl9H23q0rL1bj6ynk17gXIrRwqJXA9UdKGJlJQIO2l8c/t8C858IdODsFmovE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761121620; c=relaxed/simple;
	bh=iCvKyemZ8x1hieS0M5OPqHGE4VeoCKFf2RVhXbji09k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=unj3tsXNCj7u1saM6QFmgm3n8o9r6u+DIOJNfODo5T+vAMuJaw0fGKw25sTUuhfLxjA3fJmOHobx8hEi9jSdTMqR0REshD+PGZpYoIk1dSRt4TjrJrJH2dbeZpjNH0n3MKZ+/TIdHLnq8HkFUadxiyiEO4jBlPm1e0wK5VqwtIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E40D51063;
	Wed, 22 Oct 2025 01:26:49 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 93E693F63F;
	Wed, 22 Oct 2025 01:26:56 -0700 (PDT)
Date: Wed, 22 Oct 2025 09:26:53 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Artem Shimko <a.shimko.dev@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Add new sensor unit types
Message-ID: <20251022-rugged-archetypal-wallaby-ecbecf@sudeepholla>
References: <20251021165212.749372-1-a.shimko.dev@gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021165212.749372-1-a.shimko.dev@gmail.com>

On Tue, Oct 21, 2025 at 07:52:11PM +0300, Artem Shimko wrote:
> Add support for two new sensor unit types introduced in Arm SCMI
> - STATE_BINARY (0x5E): Binary state (1: enabled/on, 0: disabled/off)
> - BYTES_SEC (0x5F): Bytes per second
> 
> These unit types are used for sensors that report binary state information
> and data transfer rate measurements respectively.
> 
> Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
> ---
> Hello,
> 
> This patch adds definitions for two new sensor unit types that were
> introduced in the Arm System Control and Management Interface (SCMI)
> Specification version 4.0:
>

It is still alpha, we don't add anything into the kernel unless it is
of beta quality. Do you have a use or you are just adding to match the
spec ?

-- 
Regards,
Sudeep
