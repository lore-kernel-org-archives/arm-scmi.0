Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65DE1FF7B3
	for <arm-scmi@vger.kernel.org>; Tue, 17 Mar 2026 10:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773742324; cv=none; b=Bipyh0OXw+21XlbLOCoGzc1HestyyPVKqJ0nZOETlM8bbc1sDHFUaMWrghzEdOo/hvDkZGVSYjR6PLJebcZlbqPn1NHWfVX5O+AZOux90e3wNOsypAALdEN8sPsUJCXahtm83Ae/x3AjnDpjCrMz85VMqbL9VFtHnd9tnEAcWXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773742324; c=relaxed/simple;
	bh=KvGCpcTjWQCs0s2dSC7IrzOWH5KgMs4DoVxV2p4XZqw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WLtoqGskTl77uaQ5E1+2fXyVGVsC2yOuHDYkMiUDu0+EMlxWjdPPjDz4bdN2hM0rc/5K0w/NgaXbySdx2qDJdmhjaTI5YaqMwDorETdI3728mGv1gb8pufu6M8oYcwhz9LzJsuXGlvM5e0hcpoq6q3HsTnwzBms6plRK3uxJxaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=miANjL6o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="miANjL6o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03D72C4CEF7;
	Tue, 17 Mar 2026 10:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773742324;
	bh=KvGCpcTjWQCs0s2dSC7IrzOWH5KgMs4DoVxV2p4XZqw=;
	h=From:To:Cc:Subject:Date:From;
	b=miANjL6odISaX11fd8SWg7tQzlD2eUmNoCrSMfbL1nGAiXODi7kJMPb5Gih1/5F4A
	 nbD4XQN8lni2/eEHGJP9Q06MkCLpDesb9G6tV4btJYYexqXtDa0vlA7Ra1k9fa9d+p
	 pTd7msewTXiJjnrKrAqUAh8Ad7JWZWMoWtMQvluUmvvp3417gObU+O+FjFqSbdtHwh
	 Jt27DFH2GgGH+9UnW8/VBjc0zdhles8/OunQ4IOYzzn487ZXLTotAhjkBha/2g3ao7
	 V9lngFJwrSOnBnxuteo7tFaQglyjlaMsQF4RaxD2fUfvabYYwSDlakdYrAygcEYLmt
	 Hf01tP4cr3NPQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	arm-scmi@vger.kernel.org,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [GIT PULL] firmware: arm_scmi: Fixes for v7.0
Date: Tue, 17 Mar 2026 10:11:52 +0000
Message-ID: <20260317101155.3873122-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fixes-7.0

for you to fetch changes up to 4e701b47c3ba8f4eaf51d676732b11204bc75b35:

  firmware: arm_scmi: Spelling s/mulit/multi/, s/currenly/currently/ (2026-03-08 13:00:15 +0000)

----------------------------------------------------------------
Arm SCMI fixes for v7.0

Few fixes to:
1. Address a NULL dereference in the SCMI notify error path by ensurin
   __scmi_event_handler_get_ops() consistently returns an ERR_PTR on
   failure, as expected by callers.
2. Fix a device_node reference leak in the SCPI probe path by introducing
   scope-based cleanup for acquired DT nodes.
3. Correct minor spelling errors.

----------------------------------------------------------------
Cristian Marussi (1):
      firmware: arm_scmi: Fix NULL dereference on notify error path

Felix Gu (1):
      firmware: arm_scpi: Fix device_node reference leak in probe path

Geert Uytterhoeven (1):
      firmware: arm_scmi: Spelling s/mulit/multi/, s/currenly/currently/

 drivers/firmware/arm_scmi/notify.c    | 4 ++--
 drivers/firmware/arm_scmi/protocols.h | 4 ++--
 drivers/firmware/arm_scpi.c           | 5 +++--
 3 files changed, 7 insertions(+), 6 deletions(-)
