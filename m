Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2FC3BE16E
	for <arm-scmi@vger.kernel.org>; Wed, 25 Mar 2026 16:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774454470; cv=none; b=CaIyyC1xkpIqCNGz+XZ0Uv/c68AzFQVoJHmANOUKYVdBIU6vJL6e0exS2dW5mnwUXEy9SSquU6R+MQlm0Og0ydMO3bjYU6Q/NF3DzMY9vZpg/dd2YpjiGP+rGZJV83sOptRJCBCCvdO0whNlrHgeFvinBH71XlNuyzpHi3ImioM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774454470; c=relaxed/simple;
	bh=LfNoREmWlpHbohY+uXMlBTfKpK6tUoS4osyTxIVRhZU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SvCKqhK4ui1BUyV0MTCfU9pZwnynoW/n0eeraCGKRzEYvzfL8ifC/iZAzDCxUj45O+NGFHl89lfWz+UqsioxXm2Y90tj4nOr3etUEAIczUb4ngOLTSQ2WEyF6cXqRJ9qAXTAG3HH7a8YmmBwPk0AGuhKEIo4nDlYD7NMGqi+g0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FzOcXT//; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FzOcXT//"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5172EC4CEF7;
	Wed, 25 Mar 2026 16:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774454470;
	bh=LfNoREmWlpHbohY+uXMlBTfKpK6tUoS4osyTxIVRhZU=;
	h=From:To:Cc:Subject:Date:From;
	b=FzOcXT//TcFlpcMcwGwiJFGiAKq1a0YsBuXWf+H+6CzThS74lyDtFUoE1ICWLlxnl
	 8ltN9R0MkgKpCndZBQdCFnv0A+4UoyQWJk9JfPeukdrPKHqmlgrhfyrXQd8NWw+Nq+
	 jR5C6tIzFAWmaVphs+KE4XwV9Tl00jnXZzkQ8eTXj83oCpsNys40je8z+ol3WLmPWV
	 eMmOCQ6GCRQsMAty+8sX3LnD28Wardv79/5gJjD3OgrVW5/En13bciL2xz7qy4fmP5
	 rDJN+uv/RjjqEgmBxicZAK9ckdMPd/hVcA0J9Vzk81kt9C/Fhdat1V8vHtCS7+PTyU
	 zyG9hN8o+6deQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	arm-scmi@vger.kernel.org,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v7.1
Date: Wed, 25 Mar 2026 16:00:59 +0000
Message-ID: <20260325160104.4115956-1-sudeep.holla@kernel.org>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-7.1

for you to fetch changes up to 0a7ec808abecaf0d5c3ecc0d1b87d58f29c85604:

  firmware: arm_scmi: Support loop control in quirk code snippets (2026-03-17 07:30:22 +0000)

----------------------------------------------------------------
Arm SCMI updates for v7.1

This batch mainly improves SCMI robustness on systems where the SCP does
not generate completion interrupts, and includes two small follow-up
cleanups in the SCMI core.

The main functional change adds support for the new DT property
'arm,no-completion-irq'. When present for mailbox/shared-memory based
SCMI implementations, the driver forces SCMI operations into polling
mode so affected platforms can continue to operate even with broken
firmware interrupt behavior.

In addition, it
 - replaces open-coded size rounding in the base protocol path with
   round_up() for clarity, with no functional change
 - updates the SCMI quirk snippet macro implementation so quirk handlers
  can use break and continue directly when invoked inside loop contexts

----------------------------------------------------------------
Geert Uytterhoeven (1):
      firmware: arm_scmi: Support loop control in quirk code snippets

Marek Vasut (2):
      dt-bindings: firmware: arm,scmi: Document arm,no-completion-irq property
      firmware: arm_scmi: Implement arm,no-completion-irq property

Peng Fan (1):
      firmware: arm_scmi: Use round_up() for base protocol list size calculation

 Documentation/devicetree/bindings/firmware/arm,scmi.yaml | 10 ++++++++++
 drivers/firmware/arm_scmi/base.c                         |  4 ++--
 drivers/firmware/arm_scmi/common.h                       |  4 ++++
 drivers/firmware/arm_scmi/driver.c                       |  4 ++++
 drivers/firmware/arm_scmi/quirks.h                       |  8 ++++----
 5 files changed, 24 insertions(+), 6 deletions(-)
