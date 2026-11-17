Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921983;
	b=mN+Fc6ixMUbvB7spGJera1FPjQksD6rkG4MgT4kdpvGGhf9dLw1uw5+xr275AJqm38tx
	 sdU6LbyHlqiQgqtLeQmCkjtXvvMQZdJ2ic5fXiE44ECMrS/hvACUwT+yV8eWIhXTkwu9J
	 Ap6LuBCMBiNB/lYLNNzgm/4csqqy3JmBO43Xf3TE4TaKTFApANbtrUQM+Eabt9VzebuU/
	 izNFA36/Kt0lJi9tSbwq0zKT9VBEbgIMMy0YxQy3siOvwcj5DlGSnPe7ykivTMjiBEBCe
	 NlSomFk40VgdSL0T82LOPYAUXDLfLAFfD6VSYJbDGuxC8WY/81wsQ8P3UbjH1I4BwMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921983;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=04dQZCj1BDrZAF+6UeXOlw0NGYqib0zOsImSzzHzEGo=;
	b=0sLz82Wei/A7HBMu2Qy+8DJpK3UhxsVejdy62flnX/5Z0RgXIGpbNmKLuXcWuR9hO6u2
	 sdApWgoB06AKUkPOxiJFtJ/wl5fvu2WfIubTjXTNAbZVyw1FaSA6JLI0MR1fTjELpW2+K
	 iiR4HQGRrUAY02ightlmGLGOAHKIgmNkjtu6xFOea89kawvfOT6C6egIS6VA9Vbb8aYS7
	 0q52Aqg/L4TChIlcz9i4BjHtSj3YxKpjV1CtbfwBzhvjuTx3IdzpZih9gphnUDjppV058
	 98UdJl9KXV+YpJsso9qLXHOndMk3sIjlh8YUbi+2+q6pp2ypnudxBWqKG5sbOrcu3rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MjkjWP4z;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2B96606A31C;
	Tue, 17 Nov 2026 13:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2B96606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MjkjWP4z
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF6471476;
	Tue, 17 Nov 2026 05:26:18 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA2003F632;
	Tue, 17 Nov 2026 05:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794921981; bh=nDbKgdf1MwSUZ2uyvB8m7xNJGz0aC8cVtUcYiJtf3mU=;
	h=From:To:Cc:Subject:Date:From;
	b=MjkjWP4zD8Q/046VEhZqkP6nC/uH0/aKAJ5mmVYR6Aq9sgmTCrTEINE4zbjjYOwdj
	 C6NA85khrR1nlCr2+9yqI/El2bEJbB0+1nP00OPx3bGlOxfE7a/HMNH2moiYkEPtf8
	 20FotckquhBc9a7yissgUzuN2Wfea6KmcHdQ/C5w=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	philip.radford@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v2 0/2] SCMI Power Control fixes
Date: Tue, 17 Nov 2026 13:23:09 +0000
Message-ID: <20261117132311.291199-1-cristian.marussi@arm.com>
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

Patch 1/2 is a fix to a possible deadlock already posted on the list,
BUT in v2 I dropped patch 1/2 from Chengyu Liu in favour of a new approach
that keeps the original locking sections.

Patch 2/2 is a rework aiming at fixing some unbind-time issues flagged by
Sashiko: it still has to solve one residual Sashiko flagged issues between
removal and reboot.

Based on v7.4-rc2.

Thanks,
Cristian

Cristian Marussi (2):
  firmware: arm_scmi: Fix deadlock between reboot notifier and forceful
    work
  firmware: arm_scmi: Fix SCMI Power Control driver removal

 .../firmware/arm_scmi/scmi_power_control.c    | 99 ++++++++++++++++---
 1 file changed, 88 insertions(+), 11 deletions(-)

-- 
2.54.0

