Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C942627732;
	Wed, 29 Jul 2026 13:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785331809; cv=none; b=WS6CoHGF8UD1tDEp5WeA15g6QAbXWw0ujReQGvsWIP+8WaMCrWmQlXHCAgsIc0KIT20IifLyyNjY8dD4/dkqVj94KI3suiqH2CrcIF2vjRjICZKvftz9Xu0kEagXa+TOTHtH9L5vvMgnbbVuO0TUjk4C33Rylt3dWxgiaSXf9MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785331809; c=relaxed/simple;
	bh=NayyimcExEtKZRDRWbVkTg1mASNWiGEMxq5kdkWXQb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oIgAHJeQajjxpfeAo1XPIXbkFWCOlbheVVkUZC4etMlkIcKBKPP+jyQMHTDcMLMwNbhHcXYulAcAyBBhy18MUCEgV2eoeQsvJYtcl1ZVhaHTaktcKwpMNZBVg4i7ydLHNnXYwdRCFDZq7wMtWyS2h/DcLzLLQzVhUKoKqb2dMvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dsTaDlt7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dsTaDlt7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 246871F000E9;
	Wed, 29 Jul 2026 13:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785331807;
	bh=/KeXI7gv11YodYK8xiAH2S5b3BAWjpM4DoS0T81yivk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dsTaDlt7BQJrAGd+3Ks8qdRXHPfCmBi63L37gI5DYViJ+l41ofOvL6GHHhM0N9mUg
	 Hnk2P7OZW3g7VXM/S+7Q8zTftIBrUXpURVMNhJTSxNtl35cv6Tou1jPTkrDza9qXJi
	 WnCse7zEktqhW1mEVOT+fAqOAor/XrfKV54ZZkSRcaAtKO3g07JLYcT5Ml4HEiJKEB
	 5SgSNIpu/fpvncvU3yJ1fxLZQ1i0mRXernbHAkUHs1WUioUrtZI7SUZckQ4Ti0a/0u
	 +vIg3TteR2s0elxrwCuOZ8QToRRpm5h7o1uV9IxOi4BzpAwqoavomovi1zpqU5Q/Al
	 kZ1IUEWRwyJlg==
Date: Wed, 29 Jul 2026 14:30:03 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Laszlo Ersek <laszlo.ersek@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>, devicetree@vger.kernel.org
Subject: Re: #thermal-sensor-cells under protocol@15
Message-ID: <20260729-idealistic-oriole-of-fruition-ecd1d1@sudeepholla>
References: <32d8c83d-7e70-4b1c-8d6d-12920f6c67ce@arm.com>
 <20260728-natural-successful-pudu-fcb71d@sudeepholla>
 <d61cf184-20a4-4e8f-8da0-c0ac39e200a8@arm.com>
 <20260728-venomous-saffron-capuchin-23d4cc@sudeepholla>
 <e47f075a-884c-4117-b4ab-3550a2693a83@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e47f075a-884c-4117-b4ab-3550a2693a83@arm.com>

On Wed, Jul 29, 2026 at 11:20:54AM +0200, Laszlo Ersek wrote:
> On 7/28/26 22:10, Sudeep Holla wrote:
> 
> > The cells property is not for the SCMI sensor itself, it is for the
> > consumer of this node which currently is only thermal subsystem.
> 
> > On Tue, Jul 28, 2026 at 04:33:59PM +0200, Laszlo Ersek wrote:
> > > (3) Where exactly does the kernel consume "#thermal-sensor-cells" in
> > > the proposed (general) sense?
> > > 
> > 
> > No where, I got confused earlier as mentioned above. It is not needed
> > unless you have use case. Please present if you have one.
> 
> Thanks for the clarification.
> 
> IIUC, this means my original point stands: the #thermal-sensor-cells
> property is optional, and only needed if SCMI sensors (the "provider")
> are referenced by a consumer, such as "thermal-sensors".
> 

Agreed, but looking at that angle all #*-cells properties are optional
if there are no phandles referring back to the nodes. Not sure if that
is represented somehow in DT schemas. I am currently unaware of that and
happy to know if that exists.

> What about the following update then:
> 
> | diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> | index d06cca9273c4..fde9d06342f6 100644
> | --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> | +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> | @@ -223,23 +223,26 @@ properties:
> |    protocol@15:
> |      $ref: '#/$defs/protocol-node'
> |      unevaluatedProperties: false
> |
> |      properties:
> |        reg:
> |          const: 0x15
> |
> |        '#thermal-sensor-cells':
> |          const: 1
> | -
> | -    required:
> | -      - '#thermal-sensor-cells'
> | +        description:
> | +          If other nodes (such as a list property like "thermal-sensors")
> | +          reference SCMI sensors from the "protocol@15" node, then the
> | +          "#thermal-sensor-cells" property is required; otherwise, it is
> | +          unneeded. "#thermal-sensor-cells" specifies the width of SCMI Sensor
> | +          IDs for referrers, expressed as a number of 32-bit cells.
> |
> |    protocol@16:
> |      $ref: '#/$defs/protocol-node'
> |      unevaluatedProperties: false
> |
> |      properties:
> |        reg:
> |          const: 0x16
> |
> |        '#reset-cells':
> 
> If you think this is unnecessary complication or verbosity, I can drop
> it; it's just that I'd like to construct a minimal "protocol@15" node
> for my use case (a particular DTS I'm extending), and be able to justify
> every little part of that addition. Presently I can't justify
> "#thermal-sensor-cells", so I'd like to leave it out -- but currently
> that would conflict with the documentation (even though it wouldn't
> cause a problem for any of the drivers included / activated).
> 

See above, it extends to all #*-cells properties IMO, again happy to get
corrected if I am missing something.

-- 
Regards,
Sudeep
