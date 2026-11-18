Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027168;
	b=qGIMtbgO/3iOSW5hTH77EVLyqS536epL9X3bQsbWfEORqHAxsAj7uZ3yEwG6cj+M2Y5a
	 hiIPP0I9vUc1/jhIeXhKEzpgMEyravD0IeXXZtntKAZVUIoRtqTI35PL+BEKaAlMLuwg2
	 6xgLqI16k/7/8vf3GIrPGmsIjS4vcIDKgh8u9JzyhaMb+qqZL7Vc2QweqJRLTjS80ffVm
	 xmUYp7jBOb6SqVLOJ+RAIZlxKDvde3h6Wst3+FNnYB7Yhs8k1PKhWomn/e1gnQ8IR+2gG
	 mFVN/Ot+jDrlCKeHHf1qEePR8y0Ig17mKwcxj/Z22Yx7Gpe90mTRR0ORLIIV630PTSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027168;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=D44eleHLuJyjN6DHxxZnS6xNAMu1xhOqNbQfUqInx60=;
	b=NF75JfVVNppQYCiEyZ3lP2KrS4oTu0o8OKI0beRCnPGWVF4Jg4rQ/TeihoEPbN1lR5fz
	 IIEC1JncqEBy7tJ58BLo2I2TKTE3modlkeNWceD4mo6UYjqyDNKgDL3LF4N284r2CpHHe
	 Q8meoJk5l9SqCw6lakzNBThjaf7Rxwrl/m3fs2v3jWXdIHQ2hKw45SdbdKdZ+Guj6mMRP
	 raS9YwktyFbgkxw3ISJltxenc5QDN2CdXtp9urreh62mTaaUpiQFH80Kw5D6WwRZaqkQJ
	 yvgTWRjaD4eGJtdxNffbfpGBpgq/CX4cAfJ2+SbVeioW8FlzSemLAViv970AOlTg5Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FRR3vDb3;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C42C1606A31C;
	Wed, 18 Nov 2026 18:39:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C42C1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FRR3vDb3
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB3F71477;
	Wed, 18 Nov 2026 10:39:23 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6921E3F673;
	Wed, 18 Nov 2026 10:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795027166; bh=b9vWe5L5qO916p8NmyWR01efXGtOjiyiUcgpP0QJEtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FRR3vDb3GSkepgLG3AAzkS+1kPr35nFe6nJJyxRkX0CieGAiPFkYLX0xc2n1x5EXT
	 67TN8mLY2T6a9mGS1e+KmBwuUossBj1AwcJtiOD0F2OhSWg3KWPZBLdNB6+DwbVp93
	 ok8WUT0svLaRvyAblfG5JWaSDM6iB8HFzT7B7n5c=
Date: Wed, 18 Nov 2026 18:39:16 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
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
Message-ID: <av3w1CbwYxFRPStZ@pluto>
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
> I'm fine with a permanent decision not to check this but I don't see it
> as a thing that can ever change (except maybe now whilst there are not
> that many platforms out there using it!)
> 

Even though the change would be at the transport layer, given that it is
NOT impacting the Base protocol, cant we anyway quirk it later on based on FW
vendor/version as an extrema ratio so as to support anyway older FW
leveraging the current behaviour ? (not ideal I agree...and I have to
double check what changes could be needed in the quirk framework..)

Thanks,
Cristian
