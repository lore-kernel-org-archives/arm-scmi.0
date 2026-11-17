Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794934011;
	b=z+JZ5yaRurW0y1iB3qR5GkZbPFPuVkB53qpk0lvmopWrQXPdCMorK09dTTwm6ZJixWnl
	 pY2X8u1NjHHuHVuXOvURiNKlYO4iMiGGIV6eGKpP1jmPzpXE6xrEbpA25lx3ruohsES0o
	 BA55xplISBDOHjNMUcsF7MbW0sYDEFRKxR81D1qOCpkMJ8lIpysuJzmCnoy2X664bU3HS
	 zkiF2bcd9vos9C8VW76cbdb1VctCR6y72n1tY8xzje31ZpN+TWpYBqQ7NhkaeVuHFl/yX
	 eXCUzwds9UjvQ6iIzpswZvRI4tz0O5w2BN+iYxfnQ220gLwuxWFuWBjonGAd1UzQCnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934011;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=YElegpypmtifE9xOIzrUAsvZkT6fVaEpsIG/rSTa8SU=;
	b=ESB3H1ffIeULlcVKYGvy/EVTJ9+5fGhxNXGV7jq9UluVEdTKsJVaRzM+KpVr8It7Smv6
	 L+Msug+X8K1hHiXu00euIjIj4GUTn6fnbIc7xCio6RatnFZvp1OWA1GsVDootV7TPN2m7
	 U9OZhVOqxXM0X0L/sBHSmqd/97TrGjWZLtcXi3Nfo3nSRMwLoKrWgd+J+qZ+KjO2wGz5r
	 1ha7I6m+JOgO6KAsCxZugIykBjz2SyANOoua3bJJ7+YWeejVpC5OXCzq+YB4wcXq943VW
	 DeijNk8HKX8JH3R6L+Rphl8htgEHI0GuqZl2XNFAlGB33PcxiifYrpFh1XgNAiT4Eqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="XS7Sg/+4";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D69FE606A33E;
	Tue, 17 Nov 2026 16:46:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D69FE606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XS7Sg/+4
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC63D1A00;
	Tue, 17 Nov 2026 08:46:41 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 21ECC3F632;
	Tue, 17 Nov 2026 08:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794934004; bh=1oP+vDnZ3thnOYP7H8TUZmE+L78re0i2FzpsXoSUbsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XS7Sg/+4NjU8evTHYQKKaUgTIz/5+QS8k/ozGpjJgPo92BIp88BfPKMV08ES9N++1
	 jGl3Y1I1Z4z8fll59P6r0yfUmdK+1TLv5xOc3CtWPZvbCySxL0h3gEhyc51DnMYMTZ
	 6Si5BkXtRwfzcPqj8AFgdlP4s7/SM2Mdww/huG54=
Date: Tue, 17 Nov 2026 16:46:35 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Breno Leitao <leitao@debian.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Edward Adam Davis <eadavis@sina.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kees Cook <kees+treewide@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Simek <michal.simek@amd.com>,
	Oleg Nesterov <oleg@redhat.com>, Pan Chuang <panchuang@vivo.com>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	Petr Mladek <pmladek@suse.com>, Petr Pavlu <petr.pavlu@suse.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Sudeep Holla <sudeep.holla@kernel.org>, arm-scmi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	systemd-devel@lists.freedesktop.org
Subject: Re: [PATCH] [RFC] kernel/reboot: Add orderly_suspend() via
 /sbin/suspend user mode helper
Message-ID: <avyE65k1dRbELB93@pluto>
References: <20261117084523.50711-1-marek.vasut+renesas@mailbox.org>
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
In-Reply-To: <20261117084523.50711-1-marek.vasut+renesas@mailbox.org>

On Tue, Nov 17, 2026 at 09:44:19AM +0100, Marek Vasut wrote:
> Currently, Linux responds to firmware-issued poweroff and reboot requests
> by invoking user mode helpers /sbin/poweroff and /sbin/reboot, which give
> userspace the ability to perform orderly poweroff and reboot according to
> policy set by userspace.

Hi Marek,

> 
> This is not the case for firmware-issued suspend request, which directly
> invokes pm_suspend(PM_SUSPEND_MEM), without giving userspace any way to
> determine the suspend policy. This is problematic, because the userspace
> might not be quite ready to suspend right the instant when the suspend
> request from firmware arrives, e.g. because the user is interacting with
> the device and the userspace knows that interaction will end in the near
> future, at which point the system can be suspended perfectly well.
> 
> Introduce a user mode helper, /sbin/suspend, which acts the same way as
> the other user mode helpers, and which is invoked when firmware-issued
> suspend request arrives. Userspace can use the helper to apply suspend
> policy, most likely by invoking init system suspend target. In case the
> helper is not present, retain current behavior and suspend immediately.
> 
> Note that /sbin/suspend is non-standard. I also considered registering
> an input device and sending KEY_SUSPEND via such a device, but that does
> not seems nice. I also had a look at wake locks, but I don't think this
> is the right tool either. I am sending this as an RFC, because I would
> like to get input on this. I am including change for two platforms, SCMI
> and ZynqMP, which could benefit from this. Thank you for your input !
>

I'll let happily someone decide if this it is worth merging upstream
or not :P....but I would just say that this indeed felt exactly like the
missing bit in the shutdown/reboot kernel framework when I added the
basic reboot/shutdown functionalities to the SCMI Power Control.

If it is really needed to touch base with PID 1 before going suspending
I dont know, but at least this opens the opprtunity for a driver to
choose if userspace has to be involved or not like it is for reboot.

Thanks,
Cristian
