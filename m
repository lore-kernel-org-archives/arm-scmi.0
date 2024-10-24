Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D73C169AE4
	for <arm-scmi@vger.kernel.org>; Thu, 24 Oct 2024 19:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729799216; cv=none; b=Xd2NYJ10IkcrdJg+U1SNogeOyJxdDisUPEffPKbuuevuhtDQKYIqZ21NMTal1lGpRXi0C2U0ORJTcyBUfatdJ1HtWQZjbytOg6SHiI//T+4EoR39pnhwTSJybdH0BhTJxjKtfnHzjxfq4gBr57X+8S17dngPSjaV1ITLICIfcow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729799216; c=relaxed/simple;
	bh=+xhS0Xv1G/J6e7Ktie/2UvMbOotjS6zFaMns8T9MYS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GqKvf2/zkDlwg8K76hPvBgTWwuj+mWZ6ZujRJVtuaXtgw+ecTCXYMutkY41fH+Emtrgmhf2OH6RZg8KBzEDv9mGjE5PJMF3WFlgvR9tg7rUehKtM4kPu+nGbBR14FeOco9LfTPf7aFUb67YFzBrMV/UtrVx9joppHSEYNDePvUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tm6bl7ev; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tm6bl7ev"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so1722165e87.0
        for <arm-scmi@vger.kernel.org>; Thu, 24 Oct 2024 12:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729799212; x=1730404012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PI3SXZp7iH9LDmA0MnQOo/8B2Evm9XupATLCcVNXC40=;
        b=Tm6bl7ev4IwJjSCp2ygl4V8Zotp5Bs05ryL7FprVCWutNWWc8rQTCCI9mvf1z9WqCd
         TsyV9vA5qrNLmrOlOmyKKh56yS2PecmbgMJ3zOCqJXev9UTG3L//88WGJ2VYz2DmVtV2
         SaVktlU3WgluN68OL8y+G+fkxgT46UlzVrAwzXxSQOPgfifOFGYZ8eO7kQHAYNE1PKA3
         4/3Q++X2ph2ht92nR0VR0TphvwZLVfoYQZ32C4gt1Q68wtHC9008u4C1blrhj3YzzPnZ
         ytG/T7JRgbK3BhTvel5KOhvpIZVzsqt4Akv8qPjxoLH+rc8Fm/3lMINdz6T5JpIyGqgo
         JVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729799212; x=1730404012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PI3SXZp7iH9LDmA0MnQOo/8B2Evm9XupATLCcVNXC40=;
        b=EDXc/sMji3beBdw2DNe13le7CAX3hh5RwBaxqoK6m1nf5epcH3rQFjJSgMatAPAMXo
         UvhmJ2JsR/PvMo9zGPQpAH+Ridd/0+yBIQ8wLkRaskSoZM8U0OZLVH4q4ejFULud2Zt7
         VCVnAY5/uOC4zlC9vDSY1x/6odv5QSvGmWzFWc8K394zFzfn9SoyNbOs6m0x4PU6AEm6
         jNM9QMo+luk87q2jAXxq3qV785IMnxl+fN7eCNQfBeKyAsKubqb2kEQRiZGmIDrNcD/7
         xRRYqOMVFfAYYO4nrMRQJw169RZrofH75U6jU3ZiXRU0zLRn5gKhxr/BchjqqZ1mdwvE
         YX/w==
X-Forwarded-Encrypted: i=1; AJvYcCXWBpiKzzA94PTwtq2bSrwcxTpcDXVoodzD/NoqmNT6paSOjCc8KC9gsC9BNzWJCN98iIK9B2oibQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0H7g7+3jrJyRKIpYXgBkV+A5C3zmF53qE3ToNQVTmADfR0sJn
	YP5o+KsAMAcbuSPHZcPS5ZajsJBrWRRpxlUZ7S0It9wqP5gnzI+D1P7cDuYb+ro=
X-Google-Smtp-Source: AGHT+IETETXmy3bVlftYj31VETRjI/RZSZyaUXBUvtgU+pcTALquMjFnjAZo0xxjEwQVBqO3LLhmzw==
X-Received: by 2002:a05:6512:b99:b0:539:f37f:bef2 with SMTP id 2adb3069b0e04-53b1a31f29dmr4081545e87.17.1729799212192;
        Thu, 24 Oct 2024 12:46:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a224319b3sm1453550e87.210.2024.10.24.12.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 12:46:50 -0700 (PDT)
Date: Thu, 24 Oct 2024 22:46:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com, 
	cristian.marussi@arm.com, andersson@kernel.org, konrad.dybcio@linaro.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com, conor+dt@kernel.org, 
	arm-scmi@vger.kernel.org
Subject: Re: [PATCH V4 1/5] dt-bindings: firmware: Document bindings for QCOM
 SCMI Generic Extension
Message-ID: <hc66u4jtl3ncjssmfmkzzxel4bkf74s5srml4ovrm3lrds2mvx@zsb4rfd637dp>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <20241007061023.1978380-2-quic_sibis@quicinc.com>
 <q2vuiru7sqetwqyitg7azgqg7kge622i2zgq52b55zivwtbev4@4qgzb54xjioq>
 <hxfg6ztpqy7qdsgzhvvapeyh2f55mj7hhuqqkz7si6g5i7nsng@xoyfwztk66aj>
 <3765cf3d-8477-45a7-af0e-b0c78f41eaad@kernel.org>
 <0b297305-0141-208a-e414-fb7dc98317b9@quicinc.com>
 <170597c7-b8aa-4744-a44d-db5585545704@kernel.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170597c7-b8aa-4744-a44d-db5585545704@kernel.org>

On Thu, Oct 24, 2024 at 03:29:05PM +0200, Krzysztof Kozlowski wrote:
> On 22/10/2024 09:25, Sibi Sankar wrote:
> > 
> > 
> > On 10/8/24 17:41, Krzysztof Kozlowski wrote:
> >> On 08/10/2024 14:10, Dmitry Baryshkov wrote:
> >>> On Tue, Oct 08, 2024 at 08:49:27AM GMT, Krzysztof Kozlowski wrote:
> >>>> On Mon, Oct 07, 2024 at 11:40:19AM +0530, Sibi Sankar wrote:
> >>>>> +/*
> >>>>> + * QCOM_MEM_TYPE_DDR_QOS supports the following states.
> >>>>> + *
> >>>>> + * %QCOM_DDR_LEVEL_AUTO:	DDR operates with LPM enabled
> >>>>> + * %QCOM_DDR_LEVEL_PERF:	DDR operates with LPM disabled
> >>>>> + */
> >>>>> +#define QCOM_DDR_LEVEL_AUTO	0x0
> >>>>> +#define QCOM_DDR_LEVEL_PERF	0x1
> >>>>
> >>>> I could not find any driver using these. Can you point me to usage in
> >>>> the drivers?
> >>>
> >>> It's well hidden. These are the raw values used for DDR_QOS memory.
> >>
> >> So not a binding? Then these should be dropped.
> > 
> > I am not sure why the term "well hidden" was even considered :(
> > The driver just reads them from dt and passes them along. If you
> > want the dt to list magic numbers 0/1 instead I can do that as well.
> > 
> 
> If these are used by FW, then it's fine, although please document it
> clearly in comment.

If they are used by FW but they are common between all platforms, it
should go to the driver instead of being stuffed into DT.


-- 
With best wishes
Dmitry
