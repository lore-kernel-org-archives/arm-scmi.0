Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B341130F7EA;
	Wed, 29 Jul 2026 09:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785316864; cv=none; b=jpcL69lup/N6HEjuuKOznuYylOb0MJWXp+kgK2K7Wzygc5yjTMGZlrR6+2fpArcQCaLkyaKXitcfwqEjaqHPL23rHaF/tmRpudNT/5m9T7pJzI82wlJ1Qiw5tyCkK0TGWxgUsMz+F7yKe2HLqj63LUzcNWuVNbjAc8EWhA+5yes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785316864; c=relaxed/simple;
	bh=hAe31ekm/AuRTtVuRoVLQpbSewrP0CiZu1x3Cq3VzBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gVBh/F8D/1L3dPmWW5Rl9TaGqWF1ci5MODSVVkL7/t/GKdi6IBUjKvGCDXkBlv6lfMDTyZzv4XyMxhjc7THW81+6t4u+KNHVilvpTX/B/MtJzaEY+nb6bi0Yc1cQms6pVbHL8GgJVr23SD7b8DBO01vwCZz6pWjvgAzIo4vw0xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=M/Jc5bdX; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="M/Jc5bdX"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE33F152B;
	Wed, 29 Jul 2026 02:20:57 -0700 (PDT)
Received: from [10.57.43.134] (unknown [10.57.43.134])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3691F3F86F;
	Wed, 29 Jul 2026 02:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785316862; bh=hAe31ekm/AuRTtVuRoVLQpbSewrP0CiZu1x3Cq3VzBo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M/Jc5bdXDqM3ycqUUEx0nqcU4hFSLrRcR6xg8ZBuUJxMedPrSZKS7Tzt3P9dcqvNv
	 ISr6E459KVL2ol6fjLUHGO93hBQkcLGwT/AkOjQAu0HokpiqEGJKtmZ/gUYf9oDyf3
	 vGQLHrW0ZtTpuM7UTb389OSpmRekfpw/GuHDk0Q0=
Message-ID: <e47f075a-884c-4117-b4ab-3550a2693a83@arm.com>
Date: Wed, 29 Jul 2026 11:20:54 +0200
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: #thermal-sensor-cells under protocol@15
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
 devicetree@vger.kernel.org
References: <32d8c83d-7e70-4b1c-8d6d-12920f6c67ce@arm.com>
 <20260728-natural-successful-pudu-fcb71d@sudeepholla>
 <d61cf184-20a4-4e8f-8da0-c0ac39e200a8@arm.com>
 <20260728-venomous-saffron-capuchin-23d4cc@sudeepholla>
Content-Language: en-US
From: Laszlo Ersek <laszlo.ersek@arm.com>
In-Reply-To: <20260728-venomous-saffron-capuchin-23d4cc@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/28/26 22:10, Sudeep Holla wrote:

> The cells property is not for the SCMI sensor itself, it is for the
> consumer of this node which currently is only thermal subsystem.

> On Tue, Jul 28, 2026 at 04:33:59PM +0200, Laszlo Ersek wrote:
>> (3) Where exactly does the kernel consume "#thermal-sensor-cells" in
>> the proposed (general) sense?
>>
>
> No where, I got confused earlier as mentioned above. It is not needed
> unless you have use case. Please present if you have one.

Thanks for the clarification.

IIUC, this means my original point stands: the #thermal-sensor-cells
property is optional, and only needed if SCMI sensors (the "provider")
are referenced by a consumer, such as "thermal-sensors".

What about the following update then:

| diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
| index d06cca9273c4..fde9d06342f6 100644
| --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
| +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
| @@ -223,23 +223,26 @@ properties:
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
| -
| -    required:
| -      - '#thermal-sensor-cells'
| +        description:
| +          If other nodes (such as a list property like "thermal-sensors")
| +          reference SCMI sensors from the "protocol@15" node, then the
| +          "#thermal-sensor-cells" property is required; otherwise, it is
| +          unneeded. "#thermal-sensor-cells" specifies the width of SCMI Sensor
| +          IDs for referrers, expressed as a number of 32-bit cells.
|
|    protocol@16:
|      $ref: '#/$defs/protocol-node'
|      unevaluatedProperties: false
|
|      properties:
|        reg:
|          const: 0x16
|
|        '#reset-cells':

If you think this is unnecessary complication or verbosity, I can drop
it; it's just that I'd like to construct a minimal "protocol@15" node
for my use case (a particular DTS I'm extending), and be able to justify
every little part of that addition. Presently I can't justify
"#thermal-sensor-cells", so I'd like to leave it out -- but currently
that would conflict with the documentation (even though it wouldn't
cause a problem for any of the drivers included / activated).

Thanks!
Laszlo
