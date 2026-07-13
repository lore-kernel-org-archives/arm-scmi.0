Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6833E2746;
	Mon, 13 Jul 2026 10:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939953; cv=none; b=SFLaVtVdhVRIQPlN0D89hPnDpeNNg6hC/NicrKsikzwWcm2CZA13L+LaATBxVak/FNPeAxSgdCGn9Tj2XJt2/atER+BRWAfj2ThwpcNU7/33EEoYGNjxwXMpv3GNxugttnuM2oQZ/Lm7Uwd0jz0HwLuGpqNXF+ILSVNdHxmwWoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939953; c=relaxed/simple;
	bh=nA2Sj6jcKJ/e7W1Yk2hCKGP07YzjbWWGU/skDTF6xww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tzmPmJr6t4U0vndOVpDCWiV4PLltu2veMNI79h2c2shalPLW4IHNCZ+dhZGU/0U1pmZQR5/rQ2AoBYJoNgg1vR6sV6Bim5c1BKY7lJrz+kE+aGmz48JD/Grj8BMFepM0L/u3/F8iAWMr+VV2DFn/O/ag6SxjNqJlldBUfV2pky0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CMOjAr00; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CMOjAr00"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A13E31F000E9;
	Mon, 13 Jul 2026 10:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783939951;
	bh=E0bZgMafaspD5auo++lHPXkR534u0X7v7qtoj593mww=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CMOjAr00a2IhCNs1x1rxiVyP8eQ0zW7JX/KBNzRuIpDVmmO/Ij4sqgqV2okBurHjN
	 LKCuWvQUbs+sS2stZwKMa8eYeDKDMsvBhWFN4NkZCi8Xj84TCMtu1c0M9Jf4l3ECbN
	 309UXAuskPeqqYNHLaDNPgFt5JdRW8Wx1rf95d39tff8adBIHW20/jm5Vuk1qvkddK
	 6+5ONkqgv/pp/1IH/OnPjqJ6NYe6KeV5zJZT3MRzjAbYsTNyXDG+FtTtZkYHlasfOS
	 J9tuXTPj34s4HunRd/AfvksABr+5H16NPdPJBrmzFCeY72jEJjYX0qYAL2b0QWyBZn
	 PlzuDt/w6kK6g==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Pushpendra Singh <pushpendra.singh@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	cristian.marussi@arm.com,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: rate-limit queue-full warnings in IRQ context
Date: Mon, 13 Jul 2026 11:52:27 +0100
Message-ID: <178393984320.1815229.18150523678943559735.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708072339.3021140-1-pushpendra.singh@oss.qualcomm.com>
References: <20260708072339.3021140-1-pushpendra.singh@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 08 Jul 2026 12:53:39 +0530, Pushpendra Singh wrote:
> The scmi_notify() function is called from interrupt context
> to queue received notification events onto a per-protocol
> kfifo. When the kfifo is full, it logs a warning via dev_warn()
> for every dropped event.
> 
> Under conditions where the platform sends a burst of SCMI
> notifications faster than the deferred worker can drain the
> queue, this results in a flood of dev_warn() calls from
> IRQ context. Each call acquires the console lock and may
> execute blocking console writes, causing the CPU to be held
> in interrupt context for an extended period and leading to
> observable system stalls.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/1] firmware: arm_scmi: rate-limit queue-full warnings in IRQ context
      https://git.kernel.org/sudeep.holla/c/a4447c069383
-- 
Regards,
Sudeep

