Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158F13B14BD;
	Tue, 15 Sep 2026 14:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789482102; cv=none; b=UaAUl5YIMsgD4LcMYATDiRYvtBFWRXx6I/+AJKPazBvNQjCGIb4HFH8HexFj7U0IzQ03CFIo0+Ft6/S7JW4+InobO34RM8/MPSsAm2B/TEOUMwWbi6nuS4oD2vlDJu9dS6fBEVAuzlFBPnTazGXk2dQDzImXgjUDk4Xjb3O0bYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789482102; c=relaxed/simple;
	bh=SjBVg0UIo5VYVk7KVnIqdsoieGnzW1/3QiREcG+Wbdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fNSNvlIeGtqsmMscK9m3QmZznWKaGPz3o1YzFwVx75lUex7SLeB6c9hfqt6XKPq5U2UYNLTCO9osdzqp6F+SuDsvLVPY2mxViL4WW+gl0cihAE9+oubvSE+q+2X4ZS1F88hJczxKXXC4MPux0Bi/uL31nWLMkHyrjd0qMz5gtVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kmSFdEPA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kmSFdEPA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 021D81F00893;
	Tue, 15 Sep 2026 14:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789482101;
	bh=R8EnJl10YJOY5Nkon1MY2df+AJVu+cW/izK3OP3v3UQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kmSFdEPAWUSs3E9BrHKMAj8s3+D1dsrTeO+rJFSK/jatNYydFei8hG/r3hMOZvu4h
	 vjY7XF8zHnBo7U12S0muktc47OhTdKfLUcprwcN46Pn0kZzHs6/NP9nT1/aa0v00Tl
	 /B6u7Ah591zmziN8xsmp9Se0YbAmjh0NPTtQ+utxB4QO9BZjPcmsyVISXCnnV4X2uL
	 v8arA9xBKOMln8jQZwNncUYMVKQJ0wpqPs+DUc2uZ4s/mAlTa7ycH5UztCzQSB5Ykz
	 fj4ePGM7RuSOeXoNgaDsDKm1GtpK6XnidPnIc7c8Qxhpv3LA9GynYe+QRjHXGM0xIo
	 9XiZUUF9+terw==
Date: Tue, 15 Sep 2026 15:21:36 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/4] firmware: arm_scmi: Fix
 scmi_protocol_device_unrequest() race
Message-ID: <20260915-messy-imposing-frog-ea9338@sudeepholla>
References: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
 <20260911152329.5822-4-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911152329.5822-4-johannes.goede@oss.qualcomm.com>

On Fri, Sep 11, 2026 at 05:23:28PM +0200, Hans de Goede wrote:
> scmi_protocol_device_unrequest() unlocks scmi_requested_devices_mtx during
> the notifier call. During this window phead might have been deleted by
> another racing scmi_protocol_device_unrequest().
> 
> Re-acquire phead before cleaning it up to avoid this potential double
> free problem.
>

Does the below address this issue already ?
Commit 2c4097e6c4ae ("firmware: arm_scmi: Fix requested device removal race")

-- 
Regards,
Sudeep
