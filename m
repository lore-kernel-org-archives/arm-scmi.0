Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794818680;
	b=urBs/UAZ1UW4Wf/vP0Y8DVh/Ls9/OnYIh0+O6lKvUt9DlDpYvADgJGKX6zjoNszXJ80I
	 xotoUTRHYGxziN/lxfm9WG6oHVPH/8YG/J4msPyG7J6wX5xlYLODEGpQ+jASPOUULajVp
	 3O4OXXl3n6C22cc6DzAyV1Owk7at4E26O38zCYVVllXV0Iuyq76sX5YEmswxuaAkMC2Xe
	 YU5QnB6sFGxGnkI0sNtLCIfzBaxZZKneUvbVYxdj+V6tpu2LghPnMaa46YC+05N2PIPm8
	 zPVsPe+4FrsKsmttE5mgkyeOjvEaXwmbG5oGUZx9cUNprvOSFLzwuTHp7MWinVYSOuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818680;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=rtFnDyl47tsTGuxK40gEh/K+aKI4GtpFKqvWpQwqqwQ=;
	b=ZmmLX58f6KY+racy8F+SEkKAaHzqGWk/rYoUtl3liCr7c6+d/dFoCBnfmz1w3+oxWjeQ
	 xbFrjYOuhlEbvZXiSAf3OGZqk+iPdhQLtzjfpGovkPt9C8GnZQO5sxNLUNTvy7YrOtuzh
	 YrsRfnLPD44til9kKpFsxl9j5KnkTu8Vb22tz8HTJqzcvZ0TmTlVl9Qk/EnFiXhQcMmzw
	 L+j8mgDwuJf2gXAnaIUGBJeFeLo7KvA2K+Mj9iYXWIhIaOBYgIQmeFhOnvCqwvNdlqoz7
	 VM69FwguunVM8pYoWWbWK8VdUeEbLsA7YraYq7g57ON6GtFTMEIufMjhd69erOH5V/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=cUGU25fK;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D378606A329;
	Mon, 16 Nov 2026 08:44:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D378606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=cUGU25fK
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F6B91476;
	Mon, 16 Nov 2026 00:44:35 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7AE4C3F673;
	Mon, 16 Nov 2026 00:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794818678; bh=NV4ryiahK74Sd/qVQCgOoI8Ogk6RRN3p9sla8O177pg=;
	h=From:To:Cc:Subject:Date:From;
	b=cUGU25fKj58px44C0ZYSxLTw6qwjJ6MulVGA4vFhSi1NyWt38ykS5l1v9kiWxN8+u
	 p49ziWScwTD7GKlFdlD+2krHBTcagLyOsSD4e0piEsbXIy46fWNasTm3o5eL5O/OGJ
	 g516rpXghT/27um4/Yh3bOuFk+4Rrb2LFUYNrM/w=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	philip.radford@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 0/2] SCMI Power Control fixes
Date: Mon, 16 Nov 2026 08:42:09 +0000
Message-ID: <20261116084211.3066460-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Patch 1/2 is a fix to a possible deadlock already posted on the list which
had still some residual issues as flagged by Sashiko: I addressed such
issues (hopefully) maintaining the original authorship and reposted within
this series to minimize conflicts.

Patch 2/2 is a rework aiming at fixing some unbind-time issues flagged by
Sashiko.

Based on v7.4-rc2.

Thanks,
Cristian

Chengyu Liu (1):
  firmware: arm_scmi: Fix deadlock between reboot notifier and forceful
    work

Cristian Marussi (1):
  firmware: arm_scmi: Fix SCMI Power Control driver removal

 .../firmware/arm_scmi/scmi_power_control.c    | 102 +++++++++++++++---
 1 file changed, 89 insertions(+), 13 deletions(-)

-- 
2.54.0

