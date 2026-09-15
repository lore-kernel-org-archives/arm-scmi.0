Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD384B540C
	for <arm-scmi@vger.kernel.org>; Tue, 15 Sep 2026 17:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494251; cv=none; b=gCl5bpegjc97LNgptZOz20wIZIzyRiz+dLS1iWMt4+GrDPoilMsh/avcPeuSGaLKmKOVi1AZZ1DIINg5wag0Mf5FkDdS9BkW7lv/lF0REf6DouB/Ng9viFt512dPrSSIF6R+d7o3Ar98wknBDgb4GWj4erZqKb9qe3rYrbIyd6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494251; c=relaxed/simple;
	bh=lQknvjmC6n4KXzJyKTxc/FFXdneRicd7yLBc7svzJ8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQMoLYcaVNYRFEHSFT2ssGHDlAoALL/4eSk+9u/co4jzsCbIWzslZaTSXrn7GnHXyVljgJwAHBu7nm1xkFym6vfGlzPGsR3fX+ugy86/5SUwSJTe81OZhOhVX6plnbFE+0+mWzfEKidMS84BWYq0PsBy5ejU4j5SwUtyQ5Rj9Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NsX7glzd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NsX7glzd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A67B11F000FF;
	Tue, 15 Sep 2026 17:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789494244;
	bh=O4vL4g4D4xkYUtuTnZrWxwAn75paIp9ZlEmZKpxq+4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NsX7glzdGfpZEE+6WWH90AJUd7B1Z9i+nb36BbLufx78K77aPi++0e7cLEv02pMRO
	 79v9J8dn9czWZeKsecddjXmXt1uTKwwqSu2aLNTTjET4zPV8zo0YA+fIytxUA0FCJC
	 nV5q/dvI0LO03PqGBIWIndsGuI/RRIgbxqEbmN/YLKf/ST60fDO1rpY1NKEeI1g3Dc
	 tqSfBiGz6wfdyiQYrT1qqxFj3x6d5Klx/ro3w2UZSjL11InDroA+PZIyLCONejUG0y
	 bTu8AVRddf0bVjDrXKgfuySuEbhnhV2A/2b4qQw9HDfiyVpaQbe5H87vmkGZepuzed
	 61Dj0wh5+jv+Q==
Date: Tue, 15 Sep 2026 18:44:01 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel-team@meta.com, sashiko-bot@kernel.org
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Breno Leitao <leitao@debian.org>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: Re: [PATCH v5 7/9] firmware: arm_scmi: Add ACPI PCC transport
Message-ID: <20260915-tidy-glaring-wasp-5b8d0f@sudeepholla>
References: <20260915-acpi_scmi_pcc-v5-0-298579e9f359@kernel.org>
 <20260915-acpi_scmi_pcc-v5-7-298579e9f359@kernel.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-acpi_scmi_pcc-v5-7-298579e9f359@kernel.org>

>On Tue, Sep 15, 2026 at 06:03:41PM +0100, Sudeep Holla wrote:
>> Add an SCMI transport for ACPI-described systems using PCCT PCC
>> subspaces through the Linux PCC mailbox layer.
>> 
>> Parse the SCMI Device Properties _DSD packages defined by Arm document
>> 111115A v1.0, sections 2.2.1.1, 2.2.2.1 and 2.2.3. Map transport
>> UIDs to PCC subspaces for common and protocol-exclusive A2P and P2A
>> channels, validate the mappings, and cache them for channel setup.
>> 
>> Support the Powercap and System Telemetry protocol properties and add
>> the System Telemetry protocol ID. Implement PCC channel management,
>> message framing, shared-memory bounds validation, and response and
>> notification delivery.
>> 
>> Add the corresponding Kconfig, module and ARML0001 ACPI matching
>> plumbing.
>> 
>> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
>> ---
>>  drivers/firmware/arm_scmi/common.h            |  11 +
>>  drivers/firmware/arm_scmi/transports/Kconfig  |  12 +
>>  drivers/firmware/arm_scmi/transports/Makefile |   2 +
>>  drivers/firmware/arm_scmi/transports/pcc.c    | 867 ++++++++++++++++++++++++++
>>  include/linux/scmi_protocol.h                 |   1 +
>>  5 files changed, 893 insertions(+)
>> 
>> diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
>> index 7fc9560dc4ea..ef5e19ecfe20 100644
>> --- a/drivers/firmware/arm_scmi/common.h
>> +++ b/drivers/firmware/arm_scmi/common.h
>> @@ -468,6 +468,17 @@ struct scmi_transport_core_operations {
>>  	const struct scmi_message_operations *msg;
>>  };
>>  
>> +struct scmi_dsd_info {
>> +	u32 protocol_id;
>> +	const char *const property_name;
>> +};
>> +
>> +static const struct scmi_dsd_info scmi_dsd_info_list[] __maybe_unused = {
>> +	{ SCMI_PROTOCOL_BASE, "arm-arml0001-transport-pcc" },
>> +	{ SCMI_PROTOCOL_POWERCAP, "arm-arml0001-protocol-pcap" },
>> +	{ SCMI_PROTOCOL_TELEMETRY, "arm-arml0001-protocol-telemetry" },
>> +};
>> +

> [Below is copied from sashiko-bot@kernel.org review comments Severity: High]
>
> Since scmi_dsd_info_list is defined as a static const array in a header file,
> won't this cause the array to be duplicated in the .rodata section of every
> translation unit that includes common.h?

> Could this array be defined in a .c file and exported via extern to prevent
> unnecessary binary bloat?

Although the header gives each translation unit its own definition, unused
instances are discarded by the compiler. The table is referenced only by
the SCMI core and PCC transport, which are separate modules. Moving it to a
C file would require exporting the table and its size between those modules.
Given that each emitted table is only 48 bytes, I prefer to avoid that
additional interface and keep the local copies.

-- 
Regards,
Sudeep
