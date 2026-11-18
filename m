Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994431;
	b=cNTd5GnFqqnnGVFHmeAuQrgm6EuT9+MFGqsb+CoA66Eteqj9ioqtWZCiaqg1m0ikrbfU
	 SIupaZwMYwsa7e+cINI4hNuFQM8eCb/ipZEMHUGV9yCQQxYkK2WTr9rr1/9t/bNBYcJts
	 mWxI/svv9bTKv64OUxHKeofNWJOX/Ua97cqouwq3OSVeNbZa2AeKApkxt3VN+ZQ2BzLgl
	 yRA8lmFi2DNwL5SKWrpI3Zaj29BdfcPTW2W7yCjDWj80AtQPiNqzKiRrneUh+Y1JQIiTF
	 Ij6F/l+zbIhad7MOCiMaeib359wcuuxa+dhbP+bSnQiFqu2vKoUueCYUr/9vrCXTBFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994431;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=v4oyJAcjpJiwNXBHZwPl/3+4CGx9WMQZB2UQe5zRmoM=;
	b=MtmWMgYYLGkAhgbzQvpbvC+PoyTK9swlPLD1lz+Ftc6W0VwSp8v/YJhZnf4YYyVtFRdp
	 XmieQvXnhfHJo1NOeCKHs6uJO9juFkJJwa4MKziQs5MhL+AEhWGYaOzrKbKWukMMWB23S
	 COJTrtIyZA3bgRonvLXKYN/2IiTJO1QbxldTlgK5uoxfr9/Zw3e/1MQyM01+qmfXTxJNk
	 hj+1z4RN5tM9GP0PwuPGfiXir4Hn0Qtq6C4z3KdT9wZKrLRVqrvsOdVdL/zELQsnr5N+F
	 F8VTGMHrZ1I0TOSA/12+OOYK8eLn5IucAjOBFUwVqdPHTi46xIGwlcqwEJ7Cn/llcwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kFmp1jWz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD95606A31C;
	Wed, 18 Nov 2026 09:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kFmp1jWz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC201F000C4;
	Wed, 18 Nov 2026 09:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794994430;
	bh=v4oyJAcjpJiwNXBHZwPl/3+4CGx9WMQZB2UQe5zRmoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kFmp1jWz2Ee1E6p6UVNNWTIGWPPPLKx+sGTMxlE5eHQo5tOcIWf9ZtwjTQX0EtsCb
	 sAirKMKholPBHnbEb9EoUL8IlfxeTSkZljqzXOBYeeKZrUn/XeJRsxQUKK+Nhqm2TZ
	 nASdbr76yAgHux1xVZI5zjOSZEn1N5fioVBQTHawiAypd0UFWzR4497pavHMnJpMBt
	 4XMPhCvTNVqls+2btf8vsMVvnBveue2fuxcDNtI+08d/D5/jTCmxkRJGuSXev81rR7
	 4sx+VnMxDFkOAJjpl/2m/DA1cF7m+Jbv38m8J8MSnLsR0luFfHRplUznuNqOSXkqsE
	 QEw/IbDt/pxKg==
Date: Wed, 18 Nov 2026 09:33:44 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>, arm-scmi@vger.kernel.org,
	linux-doc@vger.kernel.org, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
	philip.radford@arm.com, david@kernel.org,
	souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
	puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 00/35] Introduce SCMI Telemetry support
Message-ID: <20261118-poetic-robust-raptor-bcff2b@sudeepholla>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
 <20261117170709.00002088@oss.qualcomm.com>
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
In-Reply-To: <20261117170709.00002088@oss.qualcomm.com>

On Tue, Nov 17, 2026 at 05:07:09PM -0800, Jonathan Cameron wrote:
> On Mon,  9 Nov 2026 09:11:46 +0000
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Hi all,
> > 
> > [TLDR Summary]
> >  [V15 highlights]
> >  - general cleanup and hardening driven by reviews
> >  - improved TDCF access routines to minimize lost samples under load
> >  - completed ABI docs
> > 
> >  [V16 TODO]
> >   - address any remaining V15 outstanding Sashiko/reviewers issues
> > 
> > The upcoming SCMI v4.0 specification [0] introduces a new SCMI protocol
> > dedicated to System Telemetry.
> 
> This is one from the family of issues you find when reviewing ones own
> (well LLM generated) emulation, realizing it doesn't match the spec,
> and yet works.
> 
> This works fine without the required SCMI protocol property in ACPI.
> 2.2.2 of ACPI for System Control and Management Interface 1.0
> Platform Design Document. 111115A 1.0
> 
> Now, in here is an informative statement...
> 
> Protocols not listed using a property may not be enumerate by the operating system.
> 
> But they are... 
>

Correct, I intentionally left that out. I do have a patch that restricts it
strictly to the listed property. However, I held off on pushing it because of
an issue we saw on an internal test platform.

On that platform, the firmware advertised the protocol to the OSPM via the
base protocol, even though it wasn't functional at all. Once they realized
this, they simply dropped the entry from the ACPI SCMI device as a workaround
instead of properly fixing the base protocol discovery. While understandable,
relying on that workaround delays proper firmware fixes.

That is why I went with the non-mandatory "may not be" wording. I am happy to
merge that restriction patch if a real production platform actually needs it,
but until then, leaving it open helps catch and fix broken firmware
implementations 😄.

> So, obviously we can ignore informative spec lines but that is a pretty strong
> sentence. I can't immediately think of what would go wrong if we ignored it
> - maybe we'd not pick an exclusive PCC and fallback to a common one the firmware
> doesn't want us to use?  But if it doesn't want us to use it why make Telemetry
> discoverable on it.
> 

Indeed, falling back to the common channel lets us uncover any underlying
issues in the firmware implementation. That is the exact scenario we hit on
the test platform, which convinced me to hold back the patch.

> Should that be wired through from the ACPI parsing code?
> 


As mentioned, we certainly can, though I'm not sure we should. The "may not
be" phrasing simply leaves the choice up to the OSPM rather than mandating a
strict restriction.

> Anyhow, not something I care that much about but thought I'd call it out
> as an oddity.
> 

Thanks and well spotted. Much appreciated as it brought the information out
which otherwise would have just got lost.

-- 
Regards,
Sudeep
