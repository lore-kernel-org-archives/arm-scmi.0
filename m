Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD6A459AF8;
	Tue, 28 Jul 2026 20:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785269419; cv=none; b=q8dt3EPcW+ZXGeVoe4IzjQh4P9LnjoTrQQ6jndVx2IqLjtUyE4XJ9sf5I3Iys3y9pcH21IAXFuRLxMLmfp2OvNn5R5CF669+9xnRLx8Bs0YwWPjfaozqlyc4d5aevE71KaONGnVxHXvAd7U5u3OUyBW389mgfdsGBsj/kryekzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785269419; c=relaxed/simple;
	bh=+hzYN6U/DDjWP1t/fkxNIiI9tI1fdbqQeWWI1VhFLUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQvv/vQk23XeZE/fkA7j8sI1kvinN2WbRtauZvpF3XT+3uWijMIf3VYRJIDbqJjuRmftLMq8gDOdw487GLcIOiQ2R8rvvUIuc4QigtLKVIOdwNc+ijo7Aw2MwREl/wIv4hifK4OBdTs9Ipd6vVkgZ8HZNPWcI6qGGxmnpiMoSVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tgn+9zWO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tgn+9zWO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76A741F000E9;
	Tue, 28 Jul 2026 20:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785269418;
	bh=2xHhYo5KKHxXcnzN39OsgiinB99Luf2W9ev0p+2tF5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Tgn+9zWOLBKKS03qpqJXgs0aGDwGXCZkdCaoet9xDP04z848WMzL3Lyst0Sj+VHG0
	 A+sAr4h6RC74ln764acUsKV+2mGOC8s0ilFdIUZ/efAgWqw8HDv0pIibkrN4l5ZxtM
	 9N4zMo26j1Ed7A6iTzrlBzBSvJiBvzj0dmBmI9kN55gRAmBmMR692IsRPj3uv7OlHv
	 eMi6YNcXEWY1lvr3Z/oevF4QsrxciEs8d7vG9pEH+OS2GJOYuuKcqJyZHmbaxqqmhb
	 n/LZDsHt1UjlG+VQSY+fsIFqwTKhOmbN02vLjVOfmfNbVIgxpTTGL5CHhuFTKDLJ3D
	 jjy9EMBcYNrkQ==
Date: Tue, 28 Jul 2026 21:10:13 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Laszlo Ersek <laszlo.ersek@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>, devicetree@vger.kernel.org
Subject: Re: #thermal-sensor-cells under protocol@15
Message-ID: <20260728-venomous-saffron-capuchin-23d4cc@sudeepholla>
References: <32d8c83d-7e70-4b1c-8d6d-12920f6c67ce@arm.com>
 <20260728-natural-successful-pudu-fcb71d@sudeepholla>
 <d61cf184-20a4-4e8f-8da0-c0ac39e200a8@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d61cf184-20a4-4e8f-8da0-c0ac39e200a8@arm.com>

On Tue, Jul 28, 2026 at 04:33:59PM +0200, Laszlo Ersek wrote:
> On 7/28/26 12:23, Sudeep Holla wrote:
> > On Tue, Jul 28, 2026 at 11:53:41AM +0200, Laszlo Ersek wrote:
> 
> > > And so describing protocol@15 in the Device Tree, without a
> > > #thermal-sensor-cells property, looks like a valid use case.
> > > 
> > 
> > No, unless you go back in time and find a replacement for
> > #thermal-sensor-cells and replace it w/o breaking any compatibility.
> > 
> > > Am I wrong?
> > > 
> > 
> > We need some property cell to be set to 1 to read the SCMI IDs. For
> > backward compatibility reasons, it will remain #thermal-sensor-cells.

My bad, I didn't remember all the context correct earlier today. The
cells property is not for the SCMI sensor itself, it is for the
consumer of this node which currently is only thermal subsystem.

> 
> (1) Are you saying that the property "#thermal-sensor-cells", under
> protocol@15, is actually a *misnomer* today, and it is in fact a
> *generic* specification of the Sensor ID width -- regardless of any
> referring stanzas elsewhere in the Device Tree (of which there may be
> none, or some may be thermal-UNrelated)?
> 

Not really, see my update above.

> (2) If so, would you accept a patch for
> "Documentation/devicetree/bindings/firmware/arm,scmi.yaml" that points
> out the above fact in a "description" yaml key?
> 

Not required for above mentioned reason.

> | diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> | index d06cca9273c4..78cc26ce0458 100644
> | --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> | +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> | @@ -223,20 +223,25 @@ properties:
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
> | +        description:
> | +          The width of SCMI Sensor IDs, expressed as a number of 32-bit cells.
> | +          (The property name is an historical artifact, and counts nowadays as
> | +          a misnomer. The property is no longer specific to anything
> | +          "thermal".)
> |
> |      required:
> |        - '#thermal-sensor-cells'
> |
> |    protocol@16:
> |      $ref: '#/$defs/protocol-node'
> |      unevaluatedProperties: false
> |
> |      properties:
> |        reg:
> 
> (3) Where exactly does the kernel consume "#thermal-sensor-cells" in the
> proposed (general) sense?
> 

No where, I got confused earlier as mentioned above. It is not needed
unless you have use case. Please present if you have one.

> I can only find matches for the property name in
> "drivers/thermal/thermal_of.c" and
> "drivers/thermal/ti-soc-thermal/ti-thermal-common.c", but those appear
> like thermal drivers, not general SCMI stuff. AIUI,
> of_thermal_zone_find() in the former consults "#thermal-sensor-cells" in
> the "provider" (such as SCMI protocol@15) to figure out the expected
> argument cell count in the "thermal-sensors" list.
> 

Indeed, this made me recall all the details. Sorry I hadn't looked at
or touch this code in ages.

> But that implies that, if there ever was another (non-thermal) driver
> that wanted to reference SCMI sensor identifiers similarly, it would
> also have to consult "#thermal-sensor-cells", for the argument cell
> count. Which seems to support the idea that "#thermal-sensor-cells"
> counts as a misnomer today. Is that right?
> 

We could add new property if needed though we can specify it would be
mutually exclusive on systems that use #thermal-sensor-cells as it is
simply useless duplication of same information as it has to be 1.

> > > IMPORTANT NOTICE: [...]
> > 
> > Deleted now, please fix it for next time.
> 
> My bad, should be fixed now. (I've tested it with another external
> addressee.)
> 

Thanks.

-- 
Regards,
Sudeep
