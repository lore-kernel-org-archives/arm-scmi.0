Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F321CD1E4
	for <arm-scmi@vger.kernel.org>; Fri, 24 Jul 2026 09:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784885558; cv=none; b=cdDgs4YThCgdwRxqSpiIAPs4o3HTPRv3S173ElUexqDe0FVy/Nn24Hipr+hx6uuODv0HeHVFf0/Nd+gFGnqvJKTPgmdBHQQ7vZo7cKyhgdl52CkXxb/y5cMByWCMTgepZlFGm85bWFRFMjUItO/XkIOfV1sLP/dohmB6COz3MgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784885558; c=relaxed/simple;
	bh=HAp+fLuWgkfJbmIStEorpwoZMu10Sl6TBnQXzaxUkI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JqrWNwzgDPipCLTrGIJfeZgoKeFplH95NsJLH/AOVe2+Jznf2DIkugoFkm4ArZA4nU5xSYL7i3TVMWDS8RkbGevEZXJAOOabjDiVqcJHqf5KfEMbqQkvPCy/iCYVUx53ymdCyPKXAo+UoW3v+gOTsdLUjYUVQy5gmgSi7LwbJP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vw6ax7tp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vw6ax7tp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F01211F000E9;
	Fri, 24 Jul 2026 09:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784885556;
	bh=auSLqFK4DeDtNP7SJuyUdFWdh7u/goMr6LMYKY0lWmk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Vw6ax7tpkZIfp20pClx13puLmVLbQ5aozAHceUjyU8Q4/I1JqJYDdV3K3hwt0poPF
	 LpAY3GNAqCflbHANOU65D4ViRyiVk7m3Kix443GtDA7VENtICGRJLrJ1fBnyOEghgX
	 BIee8I56GCBObGM428b+wsm88CqR2OaIHWmRwPotKPxbfMly7riziH0TsVUjbfDe78
	 bxvPpemUBIfHke80PTqVSMNmvP0MlHKTyimvMcun1ciCxoMpio09B5u7eghFoi5i4X
	 61z4ctbfr/PNpmBkpJZtXtCaGa0cfqbVnzxQAYa/qvmreOFxtCE/N1P9E+pVDg6KFx
	 z8E8m6bQHkhDQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>
Subject: Re: [PATCH] firmware: arm_scmi: Fix requested device removal race
Date: Fri, 24 Jul 2026 10:32:31 +0100
Message-ID: <178488551620.2847386.190019543861220832.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722095250.2011630-1-sudeep.holla@kernel.org>
References: <20260722095250.2011630-1-sudeep.holla@kernel.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 22 Jul 2026 10:52:50 +0100, Sudeep Holla wrote:
> scmi_protocol_device_unrequest() drops scmi_requested_devices_mtx while
> notifying listeners but continues to retain the per-protocol list head.
> When two SCMI drivers for the same protocol unregister concurrently, one
> thread can remove the final request and free the list head while the other
> is running its notifier. The latter then dereferences the freed list head
> after reacquiring the mutex and can free it a second time.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: Fix requested device removal race
      https://git.kernel.org/sudeep.holla/c/2c4097e6c4ae
-- 
Regards,
Sudeep

