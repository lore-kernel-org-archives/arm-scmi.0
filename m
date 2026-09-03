Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0BE4B0480
	for <arm-scmi@vger.kernel.org>; Thu,  3 Sep 2026 13:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788443040; cv=none; b=ps8XJaa3rDHFIoN/XI+YsfQJVJz8ZrO3EWmkhSQemVNkrCtE30EFNilPIDvSA490o2WZsrhk9RiyE7sir8VN6ciZ58gwP+KvM7cVzVFMAU77uVKQvkQrh9B+Rs7EwRlsWYmhScaskWLfMkAdHSo9tbLZY5X7OI62Vq02IijW8gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788443040; c=relaxed/simple;
	bh=/IUav4oI1etzk/vZksbr14HCufkAB2aQ/Ct0FQocDQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sU9SWeoRlv9nmaKI7mG26juRAb8Uuz1ePqEsqq5DVPbMp/H/bi3STjS0wif78eknyX0/0mNtg31m4N33gyf1Fdv2AKucKLouqIXJ0n6IX/NFoce3wMsAbImheOsCt01gQXZxI5EitA/CHFgMXg0lPxD+GR83cfl63YjDOMeZrqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n2qho6lR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n2qho6lR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B82161F000E9;
	Thu,  3 Sep 2026 13:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788443030;
	bh=IGDirhKHdHCR34OVq4FZGxleB+ZNO+CkzijlksSRSas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n2qho6lRQbEXGxiqQhil6jU/R8uxfZrLra4274kToRHY/TRnIJuISRdBEobrDFAC5
	 H4+3wKMkA0Gu0xjZ6vvgauYk1m7sFEGHrqSLJnxDwNLXBJtdYQQK/A4sFdj42rljAp
	 RcPXi4P0vTB2KFM+GRwy8lbR9+1f6hvJG9tergYjnNhj1SGiQ69mJMBG2na/+tzAMw
	 tivytXsAEHL1W8k/33AphmmM95eNnqvGFVviydpv1dF1R99llop6bMK7gD3fJrmiH9
	 X5aiQ/Ql8JbEl0NJyhweMoikFEPspBYGsZYKNjN/FHA7Zm2FGK9gnFn2PlOShcW9br
	 pzuXUBzr8eYUQ==
Date: Thu, 3 Sep 2026 14:43:46 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 7/9] firmware: arm_scmi: Add ACPI PCC transport
Message-ID: <20260903-hairy-hospitable-sambar-7a3ea0@sudeepholla>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
 <20260813-acpi_scmi_pcc-v3-7-cb6b88b4ebb3@kernel.org>
 <20260824131709.00006712@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260824131709.00006712@oss.qualcomm.com>

On Mon, Aug 24, 2026 at 01:17:09PM -0700, Jonathan Cameron wrote:
> On Thu, 13 Aug 2026 12:33:02 +0100
> Sudeep Holla <sudeep.holla@kernel.org> wrote:
> 
> > Introduce a new SCMI transport that uses ACPI PCCT (PCC) subspaces via
> > the Linux PCC mailbox layer. Parse ACPI _DSD data to map protocol
> > associations to PCC transport UIDs. Support common and
> > protocol-exclusive A2P channels, plus optional common or
> > protocol-exclusive P2A channels for notifications.
> > 
> > Key points:
> > - new CONFIG_ARM_SCMI_TRANSPORT_PCC option
> > - integration with SCMI core via scmi_desc and transport ops
> > - response and notification fetch from PCC shared memory
> > - ACPI device matching and registration via the ACPI transport macro
> > 
> > This enables SCMI to be exercised over PCC on ACPI platforms.
> > 
> > Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> Hi Sudeep
> 
> This is quite dense and ACPI parsing code is always 'interesting'
> Anyhow some comments inline
> 

Indeed quite dense to even parse the comments. It could be my brain which
is still recovering from the flu, but I can't respond to them inline. I
think I have taken most of the suggestions(saying most as I might have
missed unintentionally). I might have gone overboard with some macros to
eliminate random magic offsets. I will post v4 soon.

Thanks again for all the review comments. I am still debating if I need
to break this into 2 patches(technically yes, motivationally not yet 😄)

-- 
Regards,
Sudeep
