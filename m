Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014B73AFD07;
	Fri, 25 Sep 2026 09:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790329055; cv=none; b=VGzD7gAEgPao5hTD0Mcnl0iKMZBHceWuPo6LAvyjW9thieJm4Rt39jV9vIZnBVugl8JsZeV1tIDcohJIjrGs/7FHF1OoR01yFL26lhCKzw88MHF6rOp9unVPmtHFHq9hiTPNCh/SrmSNVry0eWxXKIOBwPfN6AwslneJ29HStO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790329055; c=relaxed/simple;
	bh=AiPeJaCw/oKB/0faifguNooWgbZkiYIxdVZ8UOUDVUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VUWv9nliywzzh2rlbrOUWgTTr3LCwbJG3/L5PHrptGycjEbWufTBvLiL2zwADniys/k7U7vzQivAqE0W184XufwDjJQBDFSuFwNUfaCEx8Swa67Xt4g6RLA9Jt39gBw3iZCv4jFkfuy9RSY0WBjtBfFdlq3gfx2F5LQzuctNozY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CVRtW7Fv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CVRtW7Fv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AE971F000FF;
	Fri, 25 Sep 2026 09:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790329053;
	bh=S8rbBY7tOZS1I6xbunY/ZVWqlDUxt7wQouXNVOazbTE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CVRtW7FvQnz7sJUapIeWFHWtBZxeNPl06POWsm3SXZLQ7JECJhstj6KdcqV2+f1QZ
	 /rstgiDLOxl3XA6skseO//CDvsWpCbbftmBGo12Q3AtMvv4enKR7vEHrB+C9904Ryu
	 fe1BKW6hMtPKxkihTRYeiHeULSe6N2JPKOeBx+MESgwnX7NQwE8w426Z4AmdMy6vLQ
	 +Gbxe5UcX/JlWt/5UcldQKFv518kXmXlv1NTV1u5q+Zw2lqbLc2fzTjY13atj32s5N
	 +PclzoZvBEICCrq+GXb5loNgNgLVUAt1TST32633kOb/kmJ1uT5GNySwcDWYYY/OIC
	 vJvFo81AzG21Q==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Frank.Li@kernel.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/2] firmware: arm_scmi: fix module auto-loading
Date: Fri, 25 Sep 2026 10:37:26 +0100
Message-ID: <179032900575.1420945.238832920241309403.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 18 Sep 2026 11:29:49 +0200, Hans de Goede wrote:
> Here is v7 of the patch series fixing arm_scmi module autoloading this
> combines:
> 
> 1. Patch 1/2 from Bjorn to add support for scmi bus modaliases to modpost:
> https://lore.kernel.org/all/20260618-scmi-modalias-v2-1-8c7547c1be21@oss.qualcomm.com/
> 
> 2. A new patch 2/2 to always create devices for standard protocols,
> replacing Cristian's patch to pre-register the standard protocol device-ids
> from v4.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/2] module: add SCMI device table alias support
      https://git.kernel.org/sudeep.holla/c/d59717cfbe1e
[2/2] firmware: arm_scmi: Always create devices for standard protocols
      https://git.kernel.org/sudeep.holla/c/aac4e67d6eb9
-- 
Regards,
Sudeep

