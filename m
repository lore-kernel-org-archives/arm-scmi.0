Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097524;
	b=FmTGUy4NapmJ2rMbDp0FkFwqXVQu6BMELsMTRf8Q/G4vwj61QMa8DSxOGeYWq2VEClJO
	 m0c0CY7AJYj0yIsx4EpaWNbUDCWAHSYgabrvoVI+FWVUYFvtWFPW6FfiQIqxLLEMTVNCm
	 r2+1Fk4zImj/E2qWIHRztKa6QFSQMyHg+LrxnDK7TuevT9IzJpeSz+gWp02oHYaOENkmv
	 WlvhHxwpyfaVIVAOwO4f/NPA07JTjQth/KSJ/hU5TT9CEW0GfWp2JihpL+mLn3YScE0/C
	 vI15tWMsI0+rrML04G9w/bLTrN9zk5vH2dITZFH1iG/NVV5Uf4+dNJE/uTfKfGfNTmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097524;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=MQHaZcy4M7TRk7qJIlWd7f9aC4WemgzRf7tlGpH6x0U=;
	b=ARWZ0trnyDOzUL2nUmKUziVlogqvZBupPTxJDBueb7Mg4H2r5cjaUA/++1YqPsCEHuPa
	 AJvyz/mUySBLm3HViY2/TEg9Yu2kR+f3TSOsP1pAQ7Fjr051nHxIrBNTIf3iv1ShXk0jU
	 hm3cmc+dWI7oAm+ahDW51s1JKIN3NNCOAaQosXb4dIpjrWcSxD6Hi2R3omMhGkJ77n4Sk
	 r9WNf6+9frtHJSX1HJwN+V3p3w0TNIzFWnUp1rjRYoo6neWUEg2YrxwkPyYb+XfaXCRhk
	 pzTdFfMS4kNcoQrB7dvXFRhZrSjnA5IV3HCc9ditgzYygD5ONKeKrD1tGUopVw9+w8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IBoa3wxX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1975A606A320;
	Thu, 19 Nov 2026 14:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IBoa3wxX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD46D1F000C5;
	Thu, 19 Nov 2026 14:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795097523;
	bh=MQHaZcy4M7TRk7qJIlWd7f9aC4WemgzRf7tlGpH6x0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IBoa3wxXSK0Ta5z1RdbHfJCc8veGjb+c4BUaoFtdufyEGBvyfAr0Yx+KMAxn8/c4Z
	 zoOPzDnd3Ndoao0autV1KP/X3D109mWUmofKL12xO+tLGUMalkOtc2tWrmmOyHHaVy
	 b74wpbn1ow0ykFP7iSA2dctJJ4mUiH2dvz79OwOOy3SJ0EwygzB644M8akqM/FMyb3
	 6x4iug558KyZFlTdlQst8I/gOHxeWarFEk6QKU0h8IF0LYrRRloCNaF4UZo6ioBvA3
	 KeecST4Ps/bS/rLT/FbyNserwyhl91gNR0PGKDizBfsyP96gs1Yt5Ptf2RmwuH7VAk
	 zAuY1h1ye5L7Q==
Date: Thu, 19 Nov 2026 14:11:57 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, d-gole@ti.com,
	elif.topuz@arm.com, lukasz.luba@arm.com, philip.radford@arm.com,
	david@kernel.org, souvik.chakravarty@arm.com, leitao@kernel.org,
	kas@kernel.org, puranjay@kernel.org, usama.arif@linux.dev,
	kernel-team@meta.com
Subject: Re: [PATCH v15 00/35] Introduce SCMI Telemetry support
Message-ID: <20261119-gleaming-tuscan-avocet-ed68ed@sudeepholla>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
 <20261117170709.00002088@oss.qualcomm.com>
 <20261118-poetic-robust-raptor-bcff2b@sudeepholla>
 <20261118093203.000069f1@oss.qualcomm.com>
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261118093203.000069f1@oss.qualcomm.com>

On Wed, Nov 18, 2026 at 09:32:03AM -0800, Jonathan Cameron wrote:
> On Wed, 18 Nov 2026 09:33:44 +0000
> Sudeep Holla <sudeep.holla@kernel.org> wrote:
> 
> > On Tue, Nov 17, 2026 at 05:07:09PM -0800, Jonathan Cameron wrote:
> > > On Mon,  9 Nov 2026 09:11:46 +0000
> > > Cristian Marussi <cristian.marussi@arm.com> wrote:
> > >   
> > > > Hi all,
> > > > 
> > > > [TLDR Summary]
> > > >  [V15 highlights]
> > > >  - general cleanup and hardening driven by reviews
> > > >  - improved TDCF access routines to minimize lost samples under load
> > > >  - completed ABI docs
> > > > 
> > > >  [V16 TODO]
> > > >   - address any remaining V15 outstanding Sashiko/reviewers issues
> > > > 
> > > > The upcoming SCMI v4.0 specification [0] introduces a new SCMI protocol
> > > > dedicated to System Telemetry.  
> > > 
> > > This is one from the family of issues you find when reviewing ones own
> > > (well LLM generated) emulation, realizing it doesn't match the spec,
> > > and yet works.
> > > 
> > > This works fine without the required SCMI protocol property in ACPI.
> > > 2.2.2 of ACPI for System Control and Management Interface 1.0
> > > Platform Design Document. 111115A 1.0
> > > 
> > > Now, in here is an informative statement...
> > > 
> > > Protocols not listed using a property may not be enumerate by the operating system.
> > > 
> > > But they are... 
> > >  
> > 
> > Correct, I intentionally left that out. I do have a patch that restricts it
> > strictly to the listed property. However, I held off on pushing it because of
> > an issue we saw on an internal test platform.
> > 
> > On that platform, the firmware advertised the protocol to the OSPM via the
> > base protocol, even though it wasn't functional at all. Once they realized
> > this, they simply dropped the entry from the ACPI SCMI device as a workaround
> > instead of properly fixing the base protocol discovery. While understandable,
> > relying on that workaround delays proper firmware fixes.
> > 
> > That is why I went with the non-mandatory "may not be" wording. I am happy to
> > merge that restriction patch if a real production platform actually needs it,
> > but until then, leaving it open helps catch and fix broken firmware
> > implementations 😄.
> 
> You can't merge it safely as at a later date because chances are high
> someone is relying on the current behavior and not presenting that
> (currently pointless) package in ACPI for some protocol or other.
> 

I agree, you have made a strong point.

> I'm fine with a permanent decision not to check this but I don't see it
> as a thing that can ever change (except maybe now whilst there are not
> that many platforms out there using it!)
> 

Indeed, I will push the change so that we can avoid any quirks we may need
otherwise in the future.

-- 
Regards,
Sudeep
