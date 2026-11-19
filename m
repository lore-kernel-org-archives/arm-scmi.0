Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097725;
	b=rQAJHvg0g6QcfiU6+b/1xVICcewT+rhCbAuRauShXMPjxrIYaMZSNgwdvy8btMZd9/yg
	 Mik/zM/iHA5eWNA42vcdQr/By4e4d4KIKNzHOt9zYTJ4hdxnHLar/Ud10Tz7bJKjDwp9r
	 3VzjcgouBSQPzLeIM1ag0V9/vN0RjA4S7M4E4uRTw20rdkRoYUSb/hTvzEJCIS9AWFzX3
	 TDIhv7hnnapYIf7B20JaJFuROcl84I4CDVrKcQgpM8/ZLvke7G5pYloifazU/IPt9PZRM
	 0ghKCKZtbwcMWxBSs+y3fTDjg9XMLpsgCJuj89J5bBphR77a5jjCihfqZvHG6320rTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097725;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=FSijPhhRa1sylue+Xngi69obQ3Cz7DJerakSbhJI/xQ=;
	b=henIsZAYwd95jxCdMu/AQL1XxkpX17MOyzs8Im12LokRK0dBXx7+kOFSDgk0F0/h5jJw
	 3kHmCLaHCyw6lctWfWlqNiou6ssiwEjnUpDWcuqGGrDJGAZQjIJ0eiLmNz1kDhhyuDOmf
	 MXOyU5pUaaBToSoetNVJp8AdqmuZOA1rmL1zmlFbiklcxfsAs6OcxUhfC37egiwb+P0P1
	 /XFxD00y3eQe8XUySGUP6su1FYnwAkcx0eJlsFAO6oxJEW+MT4EzGJI+5C8AbxiqEe8l5
	 oA4W37WPXHzq27NwPmUxwaqTqAi1Mwn21WCwuJAmvEfXp/MrguXV62rrfmydZ8zjuUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=All8TMmr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C748E606A320;
	Thu, 19 Nov 2026 14:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=All8TMmr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A869A1F000C6;
	Thu, 19 Nov 2026 14:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795097725;
	bh=FSijPhhRa1sylue+Xngi69obQ3Cz7DJerakSbhJI/xQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=All8TMmr/Keh3K1xwi5Ldk1VYiZvjF+dSBPD0KJ9At1KNNTcbCCkj48CoYsBri23r
	 KjvbopJhKPAsqf5U/86rrOMEbem/XRpW5ezqU/R25L1udyNlJrhorZEs8RCpN9+9BV
	 wD+ZBBj5LWo5RqiTm1X8ly5n6QP1shllNCf9Rb44oJFGsp2dpp/x2Kx/thi6s3+kGV
	 Z0b6Xj1z1ts7jo7Fr0aXQJNvAGRezLhukj64iCoYcb9BsY9RXGx4Dow+uwpcfHzv0I
	 hq5PXnHUs+TO6gzYyNVzPkhk+2j/TDvLPTo7aZXggiPSn78Xp0KgT/DOUqUgHsgCaW
	 Tu31Dqhd9an5Q==
Date: Thu, 19 Nov 2026 14:15:19 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
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
Message-ID: <20261119-ruddy-honorable-bustard-ac2b4c@sudeepholla>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
 <20261117170709.00002088@oss.qualcomm.com>
 <20261118-poetic-robust-raptor-bcff2b@sudeepholla>
 <20261118093203.000069f1@oss.qualcomm.com>
 <av3w1CbwYxFRPStZ@pluto>
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
In-Reply-To: <av3w1CbwYxFRPStZ@pluto>

On Wed, Nov 18, 2026 at 06:39:16PM +0000, Cristian Marussi wrote:
> On Wed, Nov 18, 2026 at 09:32:03AM -0800, Jonathan Cameron wrote:
> > On Wed, 18 Nov 2026 09:33:44 +0000
> > Sudeep Holla <sudeep.holla@kernel.org> wrote:
> > 
> > > On Tue, Nov 17, 2026 at 05:07:09PM -0800, Jonathan Cameron wrote:
> > > > On Mon,  9 Nov 2026 09:11:46 +0000
> > > > Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > >   
> > > > > Hi all,
> > > > > 
> > > > > [TLDR Summary]
> > > > >  [V15 highlights]
> > > > >  - general cleanup and hardening driven by reviews
> > > > >  - improved TDCF access routines to minimize lost samples under load
> > > > >  - completed ABI docs
> > > > > 
> > > > >  [V16 TODO]
> > > > >   - address any remaining V15 outstanding Sashiko/reviewers issues
> > > > > 
> > > > > The upcoming SCMI v4.0 specification [0] introduces a new SCMI protocol
> > > > > dedicated to System Telemetry.  
> > > > 
> > > > This is one from the family of issues you find when reviewing ones own
> > > > (well LLM generated) emulation, realizing it doesn't match the spec,
> > > > and yet works.
> > > > 
> > > > This works fine without the required SCMI protocol property in ACPI.
> > > > 2.2.2 of ACPI for System Control and Management Interface 1.0
> > > > Platform Design Document. 111115A 1.0
> > > > 
> > > > Now, in here is an informative statement...
> > > > 
> > > > Protocols not listed using a property may not be enumerate by the operating system.
> > > > 
> > > > But they are... 
> > > >  
> > > 
> > > Correct, I intentionally left that out. I do have a patch that restricts it
> > > strictly to the listed property. However, I held off on pushing it because of
> > > an issue we saw on an internal test platform.
> > > 
> > > On that platform, the firmware advertised the protocol to the OSPM via the
> > > base protocol, even though it wasn't functional at all. Once they realized
> > > this, they simply dropped the entry from the ACPI SCMI device as a workaround
> > > instead of properly fixing the base protocol discovery. While understandable,
> > > relying on that workaround delays proper firmware fixes.
> > > 
> > > That is why I went with the non-mandatory "may not be" wording. I am happy to
> > > merge that restriction patch if a real production platform actually needs it,
> > > but until then, leaving it open helps catch and fix broken firmware
> > > implementations 😄.
> > 
> > You can't merge it safely as at a later date because chances are high
> > someone is relying on the current behavior and not presenting that
> > (currently pointless) package in ACPI for some protocol or other.
> > 
> > I'm fine with a permanent decision not to check this but I don't see it
> > as a thing that can ever change (except maybe now whilst there are not
> > that many platforms out there using it!)
> > 
> 
> Even though the change would be at the transport layer, given that it is
> NOT impacting the Base protocol, cant we anyway quirk it later on based on FW
> vendor/version as an extrema ratio so as to support anyway older FW
> leveraging the current behaviour ? (not ideal I agree...and I have to
> double check what changes could be needed in the quirk framework..)
> 

Equally good point. I am worried as Jonathan say what we many platforms
start to depend on current logic and end up skipping the ACPI property
in the firmware which can be problematic to address in the future.

Let me think about it so that we can address possible f/w bug issue as
well.

-- 
Regards,
Sudeep
