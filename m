Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1F030F922;
	Wed, 25 Feb 2026 20:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772051886; cv=none; b=K9GweQ2Y6hbQiA/PU2HslFGqVMtp03WnHuv0DIAoHdsiTpSnZ3LeSWPXrEkyaOYiynf9oBGDjBY3O1ZbhW6tpM1nEm5jeUuENacZPTg0lo7fOAIJf9BdfgVP15YF77PNbRabO9A8Zz5odgsAjbpCPyIYB3jjo1Ml6QdJ3fAeILI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772051886; c=relaxed/simple;
	bh=9m7A5UwubYFImTEF+Xi41HtU6OKnxkJroHDvYZX8CAY=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=DtzszUeLmW4BNFLT+pDXHfCbLQROUUqEP+Ji2fMNCYGkNiqXmNJZ1tgr1FbuBpfzIh9EfMPNJYI8W3Vt4YfHuCtiErpWUlqpO8n3DDfJPOzMkLSDQMssbn2k1KmGxDb0KedD4rn91CM/HXd/u96GGDNtwnQskigQWJbleJL+RWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qfkIDXMB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qfkIDXMB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C90C4C19421;
	Wed, 25 Feb 2026 20:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772051885;
	bh=9m7A5UwubYFImTEF+Xi41HtU6OKnxkJroHDvYZX8CAY=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=qfkIDXMBaSuHnRDNCDzFtwnVbNj3JnQd2Hvb5CLD/rkpAYyZhHCYlOitHHflx/o+M
	 ZGfeFM/8ZEuwGh+awaDMi/MQiuevcTH2sydqgiyOe7sh3XEkXswtQkEhsXzbR1pRm7
	 JOQJwDlTgfvey/PBsaBv/ZJSoMIaNY+PTpCwE+9H7XbDCkIT1t1XiR8NaBEmJJlbC9
	 Ydps0llNbzdlhsaevJoVqEUZxT8Jg2iC1KPnfXDhXUU0WZHVA5HGahYduQ9/VdOCj2
	 UpRtxqqLFyCUi4/3F5vcAj8yKj6M9f+7fDlTLJno6lWm47UCb8zd33wJR5W/HLPNlm
	 CcWTCaxO+wsfw==
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Feb 2026 21:38:01 +0100
Message-Id: <DGOBYS4LNHWW.2JTHJHGQA37C@kernel.org>
To: "Cristian Marussi" <cristian.marussi@arm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5] driver core: enforce device_lock for
 driver_match_device()
Cc: "Gui-Dong Han" <hanguidong02@gmail.com>, <gregkh@linuxfoundation.org>,
 <rafael@kernel.org>, <linux-kernel@vger.kernel.org>,
 <baijiaju1990@gmail.com>, "Qiu-ji Chen" <chenqiuji666@gmail.com>,
 <gatien.chevallier@foss.st.com>, <sudeep.holla@kernel.org>,
 <arm-scmi@vger.kernel.org>
References: <20260113162843.12712-1-hanguidong02@gmail.com>
 <aZ9ZN7H1thCmkPEQ@pluto>
In-Reply-To: <aZ9ZN7H1thCmkPEQ@pluto>

On Wed Feb 25, 2026 at 9:19 PM CET, Cristian Marussi wrote:
> it has been reported by Gatien (in CC) that this break the SCMI OPTEE
> transport.
>
> Moreover I still have to verify, BUT I think this also breaks SCMI
> Virtio transport since both call platform_driver_register() during their
> probe, since a few years ago the SCMI transports have been reworked to be
> standalone full-fledged drivers.

I've had a quick look and I'm pretty sure that both transports/virtio.c and
transports/optee.c are broken.

Both cases look identical and I think the fix should be as trivial as movin=
g
platform_driver_register() into module_init().

> I'll have a look in the next days if we can cope with this.

I already fixed those three [1,2,3]. If you can provide a patch for both of
them, that'd be great. Otherwise, please let me know if you want me to send
something.

Thanks,
Danilo

[1] https://lore.kernel.org/driver-core/20260121141215.29658-1-dakr@kernel.=
org/
[2] https://lore.kernel.org/driver-core/20260123133614.72586-1-dakr@kernel.=
org/
[3] https://lore.kernel.org/driver-core/20260212235842.85934-1-dakr@kernel.=
org/
