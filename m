Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36F9191F91
	for <arm-scmi@vger.kernel.org>; Wed,  2 Sep 2026 08:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788336187; cv=none; b=Pp1DEQXplmbSLq0UwDQbHOUEpdDfJ97LZ8z9rU9NrNVfgGjAUirPWuMbGHmFFOT/Par0WIqn4ifsHmxa5gGn371oGtsTx3fiuXubExmwAqDoO16inQ1DjpKWojoSrRYPnyFaoZbnYjrHUs+i+LShH1MI+MBCPl1p+gQ6ufezmmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788336187; c=relaxed/simple;
	bh=8S0RXUoHnKXT30mfLXkcfrZDB5DichyaooLcE7tZI9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X7d+Z3g0PDNf/POWdVuO8mrJxnvnkTiHxELVRVkbgvt6FyVbXSCKODsOjLq6/qXd1+I7iVsNjdTak75esayvQHAA62iVzaRshVhM9v2bsKRDfjuPqU8H9e5cu8us7Dn6H5we0N5B2qTRhUjGUIhVdLIOMRb45WQLH/2Nk4Hq9rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gNMkaqyx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gNMkaqyx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD031F000E9;
	Wed,  2 Sep 2026 08:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788336185;
	bh=pamP/RQHHZhjTKS40y208EFfP9hjWZ8VtdPcrPv0lnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gNMkaqyxBiamm9v5mWLZHNDS/r+s5OQ8SykbhnZGxOsc76gOg0jy/eSTWAV6DZ9Yi
	 tSb8dvuVjUISrvalXK8DyNmiTsKSSyBQ5LhrQ39yEv/54G6KLAOB2bHrCstngyCZjK
	 hjmJbANAdrMQI1aMnYsimpCDwOEMeUuFblsfzLQd/1SOdiwvyXkDoGcdfeGBAlHX3h
	 MyyoTCyudZiW5z9hUBQbaVVWUkxkFcTLaNZEzIFR9AgritA/9o+CyiE2ybzFM4yUKI
	 Wj/k11rjSTtsoAlpJCvwhLzE9e7G47iSmmslCMTgj7uOOvyRn63oIRJW/G0FZ65K2S
	 3agUAcG7mgr8A==
Date: Wed, 2 Sep 2026 09:03:02 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
	Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 4/9] firmware: arm_scmi: Fall back to ACPI HID when
 "compatible" is absent
Message-ID: <20260902-able-collie-of-purring-87badd@sudeepholla>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
 <20260813-acpi_scmi_pcc-v3-4-cb6b88b4ebb3@kernel.org>
 <20260824104337.00002275@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824104337.00002275@oss.qualcomm.com>

On Mon, Aug 24, 2026 at 10:43:37AM -0700, Jonathan Cameron wrote:
> On Thu, 13 Aug 2026 12:32:59 +0100
> Sudeep Holla <sudeep.holla@kernel.org> wrote:
> 
> > scmi_debugfs_common_setup() uses the "compatible" property to
> > populate the debugfs transport type string. ACPI-described SCMI
> > devices do not provide that DT property, so the string remains
> > NULL and debugfs setup falls through the allocation failure path.
> > 
> > Check the property lookup result and use the ACPI HID as the
> > fallback transport type when an ACPI companion is present.
> > 
> > All supported DT SCMI platforms are expected to provide "compatible",
> > so the non-ACPI fallback is not needed for normal DT operation. Keep
> > the explicit "unknown" fallback anyway to avoid passing NULL to
> > kstrdup() if that assumption is ever violated.
> > 
> > Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> Can drop some complexity in here and rely on the stubs in acpi.h a little more.
> 
> > ---
> >  drivers/firmware/arm_scmi/driver.c | 16 ++++++++++++++--
> >  1 file changed, 14 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> > index 9014723e0f7f..9ad827c6a9ab 100644
> > --- a/drivers/firmware/arm_scmi/driver.c
> > +++ b/drivers/firmware/arm_scmi/driver.c
> > @@ -16,6 +16,7 @@
> >  
> >  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> >  
> > +#include <linux/acpi.h>
> >  #include <linux/bitmap.h>
> >  #include <linux/cleanup.h>
> >  #include <linux/debugfs.h>
> > @@ -3063,6 +3064,15 @@ static void scmi_debugfs_common_cleanup(void *d)
> >  	kfree(dbg->type);
> >  }
> >  
> > +static const char *scmi_acpi_device_hid(struct acpi_device *adev)
> > +{
> > +#ifdef CONFIG_ACPI
> 
> Hmm. Ugly that acpi_device_id returns an empty string.
> 
> However given when !CONFIG_ACPI the stub for ACPI_COMPANION(dev) is
> NULL.  You don't need this dance anyway.
> 

That was exactly my thoughts initially until builder bots complained.
But acpi_device_hid() is defined only for CONFIG_ACPI, though I can
handle it runtime, I need to define acpi_device_hid() as NULL for
!CONFIG_ACPI as alternative.

-- 
Regards,
Sudeep
