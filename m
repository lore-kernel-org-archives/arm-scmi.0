Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795109564;
	b=pdjUJXnlbxVOO0/1AwpJp/PB3wzc2pjWMVPUKf0F5+RBcJ9ivTLHYSwyx7ngzDeVkcVK
	 kAYMeKBhrzRgClAOAhOsyp3WKZR73sGh2f/QV7A3FkJ0eKIieco+njWfpPJ8COVny0KYU
	 jNn2lMwcc2keekqzbAuxF+BN+9XCis13Z7mRUBgO9SsnUT6Wug2VNr0RzNWYh/JgfvRNY
	 3z3IOIwUy8gw8a9dyLnHsxNhTaBKL1dmDSks0tCeRpTkrgO6oTfXILZDnbkVHjiiczQKh
	 VEdv0ArKoZQ3QWGVEfIUZIIsBonbD4EggaLLaHsGJk94aYrnSpy/dWLOygDa8IEaRoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109564;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1iTSNsb6pi3O4RPYJT8NASGVQuCcaiYNusa8aOsZz3c=;
	b=QS66QPQP0Du7MWCLVApTZ09CiBR/Gmb0nTtMEaytqSTo2YhgkCDA4bQuLoXRXVwY2V97
	 OJ7UsSh9yCl6GiVZCam+PrKV21v+RYlPufAw8/Gv9aKc4ZQ5XZAvY94pWBHzzjL3nmwkd
	 46EQ2JnUybmyXn3OPxgxfgjqNEc1tAVGmPHWUC7Ih+dDiGlOulxYeKNynzRAVxTIG7Ovw
	 H4PM066KHjDRgdtchazlOv283Mqeh6au0Sk/Zx3PqRxrKH5EqNh0l3C4pXryliCLUFAMi
	 S6w0Z1UgoCNpqkmFVFLM6wnD4GyqkvB0OwWcxtszl03UGmY58qsLwGjuFDPcBAVAqnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ndbrk++G;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E7E606A324;
	Thu, 19 Nov 2026 17:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ndbrk++G
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB2F1F000C4;
	Thu, 19 Nov 2026 17:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795109563;
	bh=1iTSNsb6pi3O4RPYJT8NASGVQuCcaiYNusa8aOsZz3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ndbrk++GXoulLE7zpYXF8pPKDW0a7Thvr3J0fsaiYJP6QbPzd++wN/SgNi2/dX12M
	 Jr/SbvjtI1TvUEzf5bXTwwfU+YfCWig9Uhmvf1x2xUk8CSNIgUD1H7id7eMYUMrjjX
	 bpIfiztE3wWOp1XR8gqSfYbI8swJ0AJoWKQpa6By1Z2T5b2yuVL4rwj5a9ValrxYkk
	 EgcHkSaxpqVkQxDqlmSXyscd9S98HkzQPOri3szH8+t+25ZUynn02uOfFXeMh0z6SK
	 oydes9x8aDI+3+HC7FJ2lVOtLj+6y3cnxzd00mun7gHU7OnglV67ObfdMYbAPcrwIr
	 hceIfZ8mmxZ+A==
Date: Thu, 19 Nov 2026 17:32:39 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Paul Cercueil <paul.cercueil@bootlin.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	George Cherian <gcherian@marvell.com>,
	Sujeet Baranwal <sbaranwal@marvell.com>
Subject: Re: [PATCH 3/3] scmi: driver: Increase timeout for rx response
Message-ID: <20261119-crouching-mongoose-of-luck-fe1d74@sudeepholla>
References: <20261119152944.276763-1-paul.cercueil@bootlin.com>
 <20261119152944.276763-4-paul.cercueil@bootlin.com>
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119152944.276763-4-paul.cercueil@bootlin.com>

On Thu, Nov 19, 2026 at 04:29:44PM +0100, Paul Cercueil wrote:
> From: George Cherian <gcherian@marvell.com>
> 
> The timeout is way off on the Marvell CN10K SoC, where the firmware
> processor can take more than 200ms to answer.
> 

NACK, why can't you just use arm,max-rx-timeout-ms in your DT ?

-- 
Regards,
Sudeep
