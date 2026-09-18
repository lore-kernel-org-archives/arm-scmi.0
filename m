Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02B23B47C6;
	Fri, 18 Sep 2026 13:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738731; cv=none; b=fbzzJ3w9grYKInrn+zXcpnnIBBBmDxUS+z4OMk8wrlTioa9NKDcxOTEir80dJyAZYutTN3VBMJxHy09W7lhmxQWGHldLLv3Bwi826T5rJCgWkOFoXqH+oQ4uz1XMtrv8U5jz5oLvOl+e4ieT9dA+lJKmSaMx9B+SuY5S7wLlZzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738731; c=relaxed/simple;
	bh=z46G0bqcIh2LGqc3firE0uMW8MWjL4tc5VkCRr67/GU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6RPjxTbEpbNfgiNNvr+IUNe1CrkKlH4Bsg1PaWEeLA49n81xcbsC5WhOKE0WBrvG3jquLuSLKtAi7KFn+/egind/8SRI3gGMN/MCBQLg7XJE5QjWvELgKAzT78Ix91l0gmr8CWDXcBQvn+VTwfG8GH74Ztx3EZLGAtvrI7eAiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cUuOkv/a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cUuOkv/a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D00971F000FF;
	Fri, 18 Sep 2026 13:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789738728;
	bh=UAOy211GQO8ZsvZCQNqPn3L4mKEDMAq855MNr2jtBdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cUuOkv/amenXWBkIAUlZv6naAxqa57uqW1Nr/SIhH4UTEbrBfRdhsCWGVKcmXFaO9
	 NDSaTvl61cFqHIwaNmtm+lnnz3eLP+GwmMIt5YkTHazLlHeRvr3F1DhFTaidMndNNi
	 t6SwL5GdkNekf5UgqMsc2X+XhPzoinekoy1e8+hNssrHN3jzQ9txE5Zxigkl78aLCM
	 Esxw+wLXPd6Ju5c87rfo6bHENHPnuGTUn8SpQGflEF47LkECRVKUVhdEZIQejh6trg
	 b2zyHj6fCzZqadjaquey1fpzB9PhUiz10ytvscm40H8SBoVnsMpM38H/wIHNsE0yX+
	 1UzdbW3bncyXg==
Date: Fri, 18 Sep 2026 14:38:44 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>, Frank.Li@kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
Message-ID: <20260918-roaring-bee-of-acceptance-50a8a9@sudeepholla>
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <2104f437-e960-4e55-b0e1-2b37126e8c2f@oss.qualcomm.com>
 <82a72918-7bc7-4e2c-892c-0dcdd6dd5548@oss.qualcomm.com>
 <3f51bf6c-5318-4e32-a1ca-3ce8cf8c4ceb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f51bf6c-5318-4e32-a1ca-3ce8cf8c4ceb@oss.qualcomm.com>

On Fri, Sep 18, 2026 at 12:13:10PM +0200, Daniel Lezcano wrote:
> On 9/18/26 12:02, Hans de Goede wrote:
> > Hi Daniel,
> > 
> > On 18-Sep-26 11:53, Daniel Lezcano wrote:
> > > 
> > > Hi Hans,
> > > 
> > > thanks for taking care of that
> > > 
> > > 
> > > On 9/18/26 11:29, Hans de Goede wrote:
> > > > From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > > 
> > > > SCMI client drivers already describe their bus match data with
> > > > MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
> > > > SCMI device tables. As a result, SCMI modules do not get generated module
> > > > aliases from their id tables.
> > > > 
> > > > Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
> > > > visible to modpost, add the corresponding generated offsets and teach
> > > > file2alias to emit scmi:<protocol>:<name> aliases.
> > > > 
> > > > Use the same stable alias format for SCMI device uevents and sysfs
> > > > modaliases. The previous string included the instance-specific device
> > > > name, which is not useful for matching modules.
> > > > 
> > > > Assisted-by: Codex:GPT-5.5
> > > > Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > > > Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > > Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > > > ---
> > > 
> 
> [ ... ]
> 
> > > >    #include <linux/bitfield.h>
> > > > +#include <linux/device-id/scmi.h>
> > > >    #include <linux/device.h>
> > > >    #include <linux/notifier.h>
> > > >    #include <linux/types.h>
> > > > @@ -951,11 +952,6 @@ struct scmi_device {
> > > >      #define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
> > > >    -struct scmi_device_id {
> > > > -    u8 protocol_id;
> > > > -    const char *name;
> > > > -};
> > > > -
> > > 
> > > What is the reason of converting the char * to a fixed array? That limits the name and may result in truncation and potentially name collision, no ?
> > 
> > Because of how modpost works to generate modaliases inside the .ko
> > any string buffers in device_id structs need to have a fixed length.
> > 
> > So the truncation / name collision issue pretty much applies to all
> > foo_device_id structs in the kernel. People should now to make sure
> > that any strings used will fit inside the fixed string. And I would
> > expect the compiler to warn for overly long strings.
> Ok, thanks for the clarification

Not related to above topic, but just wanted to check with Daniel if this
solves module auto-loading for you. Was there someone else who was testing
this series and was having issue with earlier versions or its you only
Hans de Goede and it was with v1/v2 when Bjorn posted them. I remember
something vaguely and couldn't trace back all the versions easily.

-- 
Regards,
Sudeep
