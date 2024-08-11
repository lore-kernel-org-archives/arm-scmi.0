Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B90117BA4;
	Sun, 11 Aug 2024 05:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723354760; cv=none; b=lrx6vZd83L51jIbPNhInVJR0APwaS1CXH3p3x2vsRMcoCAa9Y/Sx4tULxrNcC2/+Y3HFx0NadTJYUVP5wtBEOtt1xnkkzWxSHynVt6BNJu/zZRfnn7NeOjSW2jidEHvXzipdbMJA7D6caFjRZWGVlaqqAsSVTutLX7LsAMWwwaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723354760; c=relaxed/simple;
	bh=V7Amw+D60OysfddARRaOZbkofMZC3QwhVj+kufl6gfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sY9y7VN7yLj+kLBSJlyW4K/1dx+dKOCFwcHZjaUQBs8HSkYefSdJKipupkaBPemIsqq2tZbqEf/9wn1Ew2kvIyFwFTtDocv0vChbJVmZrhhoGFG6HJuY21AvstYIFNApOfRhMkMmd0JTZpy/+TVOpHcj040B5RfwlgkPMcNH0vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=ODOek0XE; arc=none smtp.client-ip=80.12.242.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="ODOek0XE"
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id d1H9s0V3frWkDd1HAs4yYA; Sun, 11 Aug 2024 07:37:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1723354677;
	bh=DasTAahQ1TiVHk6FZ2mWUt4bFXPx2Sykk8S8qkLESaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=ODOek0XELBEfpR/g40nbqqn1W+nNO01n9Adfx5YSrY/lRbmJzfwvYQ6hR6FUudb+j
	 r9zwYEUrRiitG0jW1zXPkzQwj1G6TybaZmWV35kX7r5V26Ahm/R5vkXyjn7KMIbnCO
	 rV6EGoispj7mSlQ1WEXviMBhNq/Az4+3v88cHp5tuwMWhLLoMz436AyftqvjfNuyU8
	 fij9Av/u5fH69l3CHwjwSuopDJ/M5clWbFL/gXwo1QJc4/5JvA/MB/97ztmouT8hbJ
	 Ylc0/2PwV7/mrsQfGmOcDarM4WjWuyALHmeXafXXiOEYO4Kmc7EXxY0QE8IHgV/H8f
	 cQGxoov5OgRAA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sun, 11 Aug 2024 07:37:57 +0200
X-ME-IP: 90.11.132.44
Message-ID: <3b2dde8b-f35e-4c0b-84c6-750bb5dbcfcc@wanadoo.fr>
Date: Sun, 11 Aug 2024 07:37:55 +0200
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: sram: Document reg-io-width property
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: arm-scmi@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 conor+dt@kernel.org, cristian.marussi@arm.com, devicetree@vger.kernel.org,
 james.quinlan@broadcom.com, justin.chen@broadcom.com,
 kapil.hali@broadcom.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org, sudeep.holla@arm.com
References: <20240810214621.14417-1-florian.fainelli@broadcom.com>
 <20240810214621.14417-2-florian.fainelli@broadcom.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240810214621.14417-2-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 10/08/2024 à 23:46, Florian Fainelli a écrit :
> Some SRAMs need to be accessed with a specific access width, define
> the 'reg-io-width' property specifying such access sizes.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> ---
>   Documentation/devicetree/bindings/sram/sram.yaml | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
> index 0922d1f71ba8..18e42fb36846 100644
> --- a/Documentation/devicetree/bindings/sram/sram.yaml
> +++ b/Documentation/devicetree/bindings/sram/sram.yaml
> @@ -101,6 +101,12 @@ patternProperties:
>             IO mem address range, relative to the SRAM range.
>           maxItems: 1
>   
> +      reg-io-width:
> +        description:
> +          The size (in bytse) of the IO accesses that should be performed on the

Typo: in bytes

> +          SRAM.
> +        enum: [1, 2, 4, 8]
> +
>         pool:
>           description:
>             Indicates that the particular reserved SRAM area is addressable

