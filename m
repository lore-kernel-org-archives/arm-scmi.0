Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035E041E6A6;
	Tue, 28 Jul 2026 10:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785234190; cv=none; b=dYByhGdrECLTuKA0vTHo5s1yjjFCIta5iUMqaV6fKkJmGeeEBZCwjJzwuxx45ybYlu8RYAGk8cW7AfbY5uDus0qR9d3jHnd6wKMMHs1ZWmxoMC+pJ49MmQq0G3X9RR/+nQ3YnjpplM5V0WBJexd2Pgx7NOKdhaEsrQK704yCxhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785234190; c=relaxed/simple;
	bh=xZOlzl02EkNm0NFNlzqxT98KWd7AvB2q7WhbePlKY+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cwxo9nFJ4EGcSR3J7KO9idchpxR7+q++CPWY0Z1lSQLtDw7qVyrGxlC5pZwx46gn40c/fdcNQta8M0SS+hpdCSMN6l+N5Wt77qhU4O1ndDlIXRO/uexgvPGuzlVLCWCoQMxOslGuwZ5TV0xjWrl3/MmINrvTHPAkHjb+gmCTAZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ReeAiHZB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ReeAiHZB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 845BF1F00A3A;
	Tue, 28 Jul 2026 10:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785234188;
	bh=zkYNMBMxRomB3X/KEDO6VkzZYD2WQ8O+R3tGMuTyTHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ReeAiHZBWjCIquxo99FgunF3eIym4Ve/vzgSW19ANUpITo8Jp+iUUE9uE6+fCsLTK
	 AM1cQr3V1iGZWYqWv/n2PMhTQaVmB1rbJ9d+yMXlJGg5a+z9wKluV3+fFgEk9TMQtq
	 9gKhPQrtwxIftbsL973kmj6uoiTTb7p4Wpeq5h2XQylZCWUmmesDPvkAgqmZsnUu+L
	 CSpOc5E6DV7+faqIrfPS9zobjVOkonSwRzi/GkpCaHerdqqNLkVQsgqUmFqD6SLwVN
	 sB1u2k1swP5MNabRn71Nd962gxYKI1g1t3N0JvItb8vMEznpxvXLATAYUKUkNMbmc3
	 3O0G3vHPzAKDA==
Date: Tue, 28 Jul 2026 11:23:05 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Laszlo Ersek <laszlo.ersek@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>, devicetree@vger.kernel.org
Subject: Re: #thermal-sensor-cells under protocol@15
Message-ID: <20260728-natural-successful-pudu-fcb71d@sudeepholla>
References: <32d8c83d-7e70-4b1c-8d6d-12920f6c67ce@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32d8c83d-7e70-4b1c-8d6d-12920f6c67ce@arm.com>

(Ignoring disclaimer assuming it was a mistake, get it fixed for the next time)

On Tue, Jul 28, 2026 at 11:53:41AM +0200, Laszlo Ersek wrote:
> Hello,
> 
> as of commit 62cc90241548 («Merge tag
> 'mm-hotfixes-stable-2026-07-27-14-18' of
> git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm», 2026-07-27):
> 
> "Documentation/devicetree/bindings/firmware/arm,scmi.yaml" specifies
> that for protocol@15 -- the SCMI Sensor management protocol --, property
> #thermal-sensor-cells is required (with value 1).
> 

Correct.

> I don't understand this requirement. According to now-historical commit
> fe7be8b297b2 («dt-bindings: arm: add support for ARM System Control and
> Management Interface(SCMI) protocol», 2018-02-28), #thermal-sensor-cells
> specifies the width of SCMI "Sensor ID"s used in sensor references made
> by "thermal-sensors".
> 

Indeed.

> But a platform's complete set of sensors may not contain a single
> thermal sensor (only other sensor types). In that case, the driver file
> 
>   drivers/thermal/thermal_of.c
> 
> has no business connecting to SCMI (= no business referring to Sensor
> IDs; consequently, the width of a Sensor ID is irrelevant), while the
> driver file
> 

Sure. I assume you don't have any "thermal-sensors" defined in the platform
device tree.

>   drivers/hwmon/scmi-hwmon.c
> 
> may still justifiedly want to consume protocol@15 (SCMI_PROTOCOL_SENSOR)
> from the device tree (i.e., to expose SCMI-provided sensors -- *not*
> thermal sensors -- via the hwmon interface, to usespace).
> 

OK, but I don't understand the exact problem you are facing.

> And so describing protocol@15 in the Device Tree, without a
> #thermal-sensor-cells property, looks like a valid use case.
> 

No, unless you go back in time and find a replacement for #thermal-sensor-cells
and replace it w/o breaking any compatibility.

> Am I wrong?
> 

We need some property cell to be set to 1 to read the SCMI IDs. For backward
compatibility reasons, it will remain #thermal-sensor-cells.

> Thanks!
> Laszlo
> IMPORTANT NOTICE: The contents of this email and any attachments are
> confidential and may also be privileged. If you are not the intended
> recipient, please notify the sender immediately and do not disclose the
> contents to any other person, use it for any purpose, or store or copy the
> information in any medium. Thank you.


Deleted now, please fix it for next time.

-- 
Regards,
Sudeep
