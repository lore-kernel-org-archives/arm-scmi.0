Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171F4362149
	for <arm-scmi@vger.kernel.org>; Thu,  3 Sep 2026 09:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427007; cv=none; b=QHBZ6/k7fAMPdvrLMen8INFl2vsEEyNYpqIcxWQ/WE+JSKcWF9Xdzu2+i2Vu1vk9s0YYYZAiF88G2oTrbhob0WoTb05oFqDNki7xOyUfTStnnuEdVCfJzWpTky1dqoiy9IVUvFRRQNSNU3gwfzFdqYydt3ijpPXPEOUowGbeADQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427007; c=relaxed/simple;
	bh=D3iVn5gTaMEay256xAtnGpev25repefslT3gHDSJ6BM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gZwDSjapMzraJUx2XMBrUXReI9FX08+hE233Y5zdyd8n1EkOy6CO1u6qT5bRJ5yzUmcxlgAVad23YFUMSbqY+ciDGfo3ZYzdi5yetLk/e0ff1Hj7gg7b90+gAvqnIwgm/xiElvzBlzrai9WYypPMdpb72InKo4gI6HSX/aBLcKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZI561hLA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZI561hLA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B063D1F00A3A
	for <arm-scmi@vger.kernel.org>; Thu,  3 Sep 2026 09:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788427005;
	bh=rH6JM28W2HcqC5yVdmwj3iVAQeOpLq92KlaDNOyUtDE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=ZI561hLAsKeZjb8PwSTQvhj81RvIClKwgG26jzHzWhxR+U+9qhAqSPugwM3OqDhEd
	 zJp+dyFosP7c0PLCtcjj9IB/xcKH/UMfy+BPNNPhLDopy1zIa1BdaT08CwDBAbk4FT
	 BE614Pwfom/CZhtPRr3a1uR4+ZuHDr4BWJE99H0CgmR+N6LyqWVvi4PkL0OZkHwjUC
	 WS0rTk+o+2kUONumd6rUpC4hvOtVl34O3lZTvywQgiiM1j4CTH3uKF5n4ZC/jJ3oft
	 M806RJ/ABNYn8YFdGYCOdFvr4mXFf/FSMB+JYjapt587r1N2dmNnZ7JWpYOPcrXJcC
	 ekHqH0Wg/j1sw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b28c91fba5so1122192e87.1
        for <arm-scmi@vger.kernel.org>; Thu, 03 Sep 2026 02:16:45 -0700 (PDT)
X-Gm-Message-State: AFuF++mYihuT9WU0Yp5fTfFP63MZyndz5EiP0ooN7e/0R9ELsdJxh2zZ
	Dab08qYFwW2slE1tVBzP0CUvElUw51lplruaa3bbhESdjRD2/z/coSJ1gib1LgEp1c8KjFy3t0y
	oSRxIMhvpFQdCht4NFkON1o5teXJY13Z6tvZcDJCgjw==
X-Received: by 2002:a05:6512:68e:b0:5b6:10bc:b867 with SMTP id
 2adb3069b0e04-5b610c4a488mr479716e87.21.1788427004407; Thu, 03 Sep 2026
 02:16:44 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Sep 2026 02:16:42 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Sep 2026 02:16:42 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260902162642.000008d9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
 <20260813-acpi_scmi_pcc-v3-1-cb6b88b4ebb3@kernel.org> <20260824095121.00001b9c@oss.qualcomm.com>
 <20260902-tireless-steadfast-mongoose-cccac7@sudeepholla> <20260902162642.000008d9@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 02:16:42 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdsNTnZr7wdif_u2Pc_cBaU+qNO=sb-PgNO7brX4cfs_A@mail.gmail.com>
X-Gm-Features: AcwNN1XJDmdY61Sl0xKdzpCkqFP9MoYPrwivu2XvBWuGWUsj1mtmR24GRCfT5fE
Message-ID: <CAMRc=MdsNTnZr7wdif_u2Pc_cBaU+qNO=sb-PgNO7brX4cfs_A@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] firmware: arm_scmi: Set fwnode for the generated
 SCMI platform device
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>, 
	Breno Leitao <leitao@debian.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?4oCcUmFmYWVsIEouIFd5c29ja2nigJ0=?= <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sep 2026 01:26:42 +0200, Jonathan Cameron
<jonathan.cameron@oss.qualcomm.com> said:
>>
>> How about something like this instead of above 2 lines:
>>
>> if (is_of_node(dev_fwnode(dev)))
>> 	platform_device_set_of_node_from_dev(spdev, dev);
>> else
>> 	platform_device_set_fwnode(spdev, dev_fwnode(dev));
>>
>
> To me, if the reference counting is useful (and I'm a bit doubtful about that)
> platform_device_set_fwnode() should be doing it. +CC those who might have
> more insight on this.
>

I should have that insight. platform_device_set_fwnode() *does* the reference
counting but it should be used for platform devices created with
platform_device_alloc().

Bart
