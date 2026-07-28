Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749BF3446C5;
	Tue, 28 Jul 2026 14:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785249244; cv=none; b=tp8+qwtKN/FGCmi+NVDYhgG2xvkOeoYA+5U0Nf59LzUzWLFTP7K5vD+aumw9EViRJNyus5hq9vzOpE9E0+yGLYFH7yQcwiKgea3V9YCAx0fSGcGJw266sNccwHStArsOjELtM01nHbz4RsF4zzoRwQSNI/ktrUh3Q/8dZHHCb2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785249244; c=relaxed/simple;
	bh=3LW9mPIzGWHeO7ZFVky3G7SbwHoE8CKY/hj7ekw39VE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wa/3JUhhBnLJYcQViUCRDmHLRwI04VMdyGu6CgXio2PCLa3W8+YYzTPpA/lkA0JaboyGElXLaUSwBhs0NOXyPGbA1hdjDY1kR9vJWMB0HsSoGNYdvImy0zM8W+Zx7DbtaRu6g/g05B5kIgVbrFGlLtxSQIheVEGcN2jrhqkK5jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=oEfmbj4l; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="oEfmbj4l"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B07A169C;
	Tue, 28 Jul 2026 07:33:57 -0700 (PDT)
Received: from [10.42.52.198] (e131404.arm.com [10.42.52.198])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C75B73F66F;
	Tue, 28 Jul 2026 07:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785249241; bh=3LW9mPIzGWHeO7ZFVky3G7SbwHoE8CKY/hj7ekw39VE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oEfmbj4lY68qwPEoFkxetMt/hz+6+yqKZ7sOMQKhw7eb7Jl8djJ719JZOYy0KjySY
	 UupdUisSI73dHUcExJiU/g9pOTwweOWxKHsQXRR36FgBBemJSAa0dkGCGbdjfmYNhO
	 609CWy9yxDm797n6l9rbs5Wl5Na1XAjGikXK9RC0=
Message-ID: <d61cf184-20a4-4e8f-8da0-c0ac39e200a8@arm.com>
Date: Tue, 28 Jul 2026 16:33:59 +0200
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: #thermal-sensor-cells under protocol@15
Content-Language: en-US
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
 devicetree@vger.kernel.org
References: <32d8c83d-7e70-4b1c-8d6d-12920f6c67ce@arm.com>
 <20260728-natural-successful-pudu-fcb71d@sudeepholla>
From: Laszlo Ersek <laszlo.ersek@arm.com>
In-Reply-To: <20260728-natural-successful-pudu-fcb71d@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/28/26 12:23, Sudeep Holla wrote:
> On Tue, Jul 28, 2026 at 11:53:41AM +0200, Laszlo Ersek wrote:

>> And so describing protocol@15 in the Device Tree, without a
>> #thermal-sensor-cells property, looks like a valid use case.
>>
>
> No, unless you go back in time and find a replacement for
> #thermal-sensor-cells and replace it w/o breaking any compatibility.
>
>> Am I wrong?
>>
>
> We need some property cell to be set to 1 to read the SCMI IDs. For
> backward compatibility reasons, it will remain #thermal-sensor-cells.

(1) Are you saying that the property "#thermal-sensor-cells", under
protocol@15, is actually a *misnomer* today, and it is in fact a
*generic* specification of the Sensor ID width -- regardless of any
referring stanzas elsewhere in the Device Tree (of which there may be
none, or some may be thermal-UNrelated)?

(2) If so, would you accept a patch for
"Documentation/devicetree/bindings/firmware/arm,scmi.yaml" that points
out the above fact in a "description" yaml key?

| diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
| index d06cca9273c4..78cc26ce0458 100644
| --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
| +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
| @@ -223,20 +223,25 @@ properties:
|    protocol@15:
|      $ref: '#/$defs/protocol-node'
|      unevaluatedProperties: false
|
|      properties:
|        reg:
|          const: 0x15
|
|        '#thermal-sensor-cells':
|          const: 1
| +        description:
| +          The width of SCMI Sensor IDs, expressed as a number of 32-bit cells.
| +          (The property name is an historical artifact, and counts nowadays as
| +          a misnomer. The property is no longer specific to anything
| +          "thermal".)
|
|      required:
|        - '#thermal-sensor-cells'
|
|    protocol@16:
|      $ref: '#/$defs/protocol-node'
|      unevaluatedProperties: false
|
|      properties:
|        reg:

(3) Where exactly does the kernel consume "#thermal-sensor-cells" in the
proposed (general) sense?

I can only find matches for the property name in
"drivers/thermal/thermal_of.c" and
"drivers/thermal/ti-soc-thermal/ti-thermal-common.c", but those appear
like thermal drivers, not general SCMI stuff. AIUI,
of_thermal_zone_find() in the former consults "#thermal-sensor-cells" in
the "provider" (such as SCMI protocol@15) to figure out the expected
argument cell count in the "thermal-sensors" list.

But that implies that, if there ever was another (non-thermal) driver
that wanted to reference SCMI sensor identifiers similarly, it would
also have to consult "#thermal-sensor-cells", for the argument cell
count. Which seems to support the idea that "#thermal-sensor-cells"
counts as a misnomer today. Is that right?

>> IMPORTANT NOTICE: [...]
>
> Deleted now, please fix it for next time.

My bad, should be fixed now. (I've tested it with another external
addressee.)

Thank you,
Laszlo
