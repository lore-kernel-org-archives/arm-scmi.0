Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0735D3BED75;
	Mon, 23 Mar 2026 16:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774284978; cv=none; b=qoU+ysQxlxMUypLPtIRnsDnO1BIp7kQdnBc2Wd3hg4UX+uuBNSSRaXA44bCKL6Q1XqO51O1Lm3HzzqfvEvQtG2ZgmfyHdBT3uHM4NuJzcJdV0GIq/yoJvLmbk1IP0DZ2ahLKWY7nFapEhW1RwP3mBrKyFKbbycMyOjxV+pF6b8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774284978; c=relaxed/simple;
	bh=e2UjnGtFMjRgjyQgHeY9oyjta6raNvMZPtXngDEnpPs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f215c3cIYI7HEDqABn8nDGVdn3TvU7OsE7M6Ge0JvrN7TrQ++PgjPT9Uqp/Gdo6IzuhgQzUC7VwqqFHGp283ymlzVI7mMBmXSKn5uxO4ypMuNZ0VTKfHsC1i44dwxrmB36m1u8zRVP1bIm9YYOz3381B/4F52Gq5wVLESGkNS+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01279C4CEF7;
	Mon, 23 Mar 2026 16:56:15 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] firmware: arm_scmi: Lazy clock rates and bound iterator fixes
Date: Mon, 23 Mar 2026 17:56:09 +0100
Message-ID: <cover.1774283748.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series:
  - Fixes an out-of-bound access in lazy clock rate handling,
  - Synchronizes bound-iterator cleanup naming between documentation and
    code.

Note that the first two patches fix the same symptom; either or both can
be applied.

Thanks for your comments!

Geert Uytterhoeven (3):
  firmware: arm_scmi: Fix OOB in scmi_clock_describe_rates_get_lazy()
  firmware: arm_scmi: Fix bound iterators returning too many items
  firmware: arm_scmi: Use proper iter_response_bound_cleanup() name

 drivers/firmware/arm_scmi/clock.c     |  9 ++++++---
 drivers/firmware/arm_scmi/driver.c    | 15 ++++++++++-----
 drivers/firmware/arm_scmi/protocols.h |  2 +-
 3 files changed, 17 insertions(+), 9 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
