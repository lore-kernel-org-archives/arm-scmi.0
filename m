Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F0C4495516;
	Wed, 29 Jul 2026 13:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785332100; cv=none; b=QZfwMMMXI8d0P1xgqVKlev6C8gSAgWJyw/ZXYvi9i2jGa+2006H9OiErVudKcImQ7KDK4Xt+lFmu6GhQMS5t2vey9RQ1jliat3VEWfe0hTv5MlfP5TnVdjRzfIzUE0f7KQ7l1IokAIpmJdeL2pbnU7WQthAcR3FpNjsmPuogVxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785332100; c=relaxed/simple;
	bh=mdalOXVjdQYXG/BFqQO2F54PBg2O+O3RnRQxGWhtMxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TubauPIM3vcs6+PPMKImWKBJiqJ7RRsheyS5X3G8FU52E18PtPfgnkCPg0L6lUFr/9IhsMgvomavOEcns4yvpgNqvXeLxI57oZw72CrmunjzRT/ANzMB9LrU3CFAm7CHswPXBvIwu2XDnutVT1yd5FDW3N1tU3xvvcD9H1HNPbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=WbOW8vHV; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="WbOW8vHV"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E71EF1595;
	Wed, 29 Jul 2026 06:34:49 -0700 (PDT)
Received: from [10.57.43.134] (unknown [10.57.43.134])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 51A023F86F;
	Wed, 29 Jul 2026 06:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785332094; bh=mdalOXVjdQYXG/BFqQO2F54PBg2O+O3RnRQxGWhtMxc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WbOW8vHVRV1aGk10GAIqjJG8/bLgAHq43E84mkrLtcrnpOG64J7fk1OIA2OqwoRTd
	 JTZECEgj7xsBnz+0Bgb2ZjS7fW6YoYXRcuPgriNYxf1XrvzcapEOPs+m+jo6dqtFBS
	 k3rMcjBc6pF4iHb70x4xbDCIf3u2lZdiipjziMuM=
Message-ID: <ab205b00-51ad-4fb7-8adc-652117e444e9@arm.com>
Date: Wed, 29 Jul 2026 15:34:51 +0200
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
 <d61cf184-20a4-4e8f-8da0-c0ac39e200a8@arm.com>
 <20260728-venomous-saffron-capuchin-23d4cc@sudeepholla>
 <e47f075a-884c-4117-b4ab-3550a2693a83@arm.com>
 <20260729-idealistic-oriole-of-fruition-ecd1d1@sudeepholla>
From: Laszlo Ersek <laszlo.ersek@arm.com>
In-Reply-To: <20260729-idealistic-oriole-of-fruition-ecd1d1@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/29/26 15:30, Sudeep Holla wrote:
> On Wed, Jul 29, 2026 at 11:20:54AM +0200, Laszlo Ersek wrote:
>> On 7/28/26 22:10, Sudeep Holla wrote:
>>
>>> The cells property is not for the SCMI sensor itself, it is for the
>>> consumer of this node which currently is only thermal subsystem.
>>
>>> On Tue, Jul 28, 2026 at 04:33:59PM +0200, Laszlo Ersek wrote:
>>>> (3) Where exactly does the kernel consume "#thermal-sensor-cells" in
>>>> the proposed (general) sense?
>>>>
>>>
>>> No where, I got confused earlier as mentioned above. It is not needed
>>> unless you have use case. Please present if you have one.
>>
>> Thanks for the clarification.
>>
>> IIUC, this means my original point stands: the #thermal-sensor-cells
>> property is optional, and only needed if SCMI sensors (the "provider")
>> are referenced by a consumer, such as "thermal-sensors".
>>
> 
> Agreed, but looking at that angle all #*-cells properties are optional
> if there are no phandles referring back to the nodes.

Right, I had only glanced at those superficially, but I figured as much.

> Not sure if that
> is represented somehow in DT schemas. I am currently unaware of that and
> happy to know if that exists.
> 
>> What about the following update then:
>>
>> | diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
>> | index d06cca9273c4..fde9d06342f6 100644
>> | --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
>> | +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
>> | @@ -223,23 +223,26 @@ properties:
>> |    protocol@15:
>> |      $ref: '#/$defs/protocol-node'
>> |      unevaluatedProperties: false
>> |
>> |      properties:
>> |        reg:
>> |          const: 0x15
>> |
>> |        '#thermal-sensor-cells':
>> |          const: 1
>> | -
>> | -    required:
>> | -      - '#thermal-sensor-cells'
>> | +        description:
>> | +          If other nodes (such as a list property like "thermal-sensors")
>> | +          reference SCMI sensors from the "protocol@15" node, then the
>> | +          "#thermal-sensor-cells" property is required; otherwise, it is
>> | +          unneeded. "#thermal-sensor-cells" specifies the width of SCMI Sensor
>> | +          IDs for referrers, expressed as a number of 32-bit cells.
>> |
>> |    protocol@16:
>> |      $ref: '#/$defs/protocol-node'
>> |      unevaluatedProperties: false
>> |
>> |      properties:
>> |        reg:
>> |          const: 0x16
>> |
>> |        '#reset-cells':
>>
>> If you think this is unnecessary complication or verbosity, I can drop
>> it; it's just that I'd like to construct a minimal "protocol@15" node
>> for my use case (a particular DTS I'm extending), and be able to justify
>> every little part of that addition. Presently I can't justify
>> "#thermal-sensor-cells", so I'd like to leave it out -- but currently
>> that would conflict with the documentation (even though it wouldn't
>> cause a problem for any of the drivers included / activated).
>>
> 
> See above, it extends to all #*-cells properties IMO, again happy to get
> corrected if I am missing something.

... OK, I'll leave it as it is, then. "Required but unused" is what I'll 
say when asked.

Thanks for thinking this through with me!
Laszlo
