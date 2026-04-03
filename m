Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD351D6DB5;
	Fri,  3 Apr 2026 08:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205697; cv=none; b=pN3H73jYza0VWDmIRu48KzzrXc2DkRJZlUn1nsiuHD/E15mI4c8vb8f0uvicYlUfuy6KLUCbglztdSCrn0foxv/rXwc+TR2pTAYUHlESHXIJuUbxG2ur8/VKUPayTVDEWesMacCzFTCI962x3vOMO0nvxNk3EPpp3FgRwe9x1MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205697; c=relaxed/simple;
	bh=YvYSbzhapvm9Z3Hb9a2PvQkeGkuTyz6vA0vZs5GdtQI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EfdHmfyHsdNot2b6SzShZrVY8g8SutayDtGYzZlkBT5zTGBAQyVFmKMoV08hvrTwAWZKZfVIr5dyEtyIjWA6f6juGV+JjozgSdejzLpPyuojFamQIDXfdzmHgJVyNAkSG15Z9aPmYHkN/3KVNAVSeKBp4uS8zGzz/pKmOUoHAVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBDD9C4CEF7;
	Fri,  3 Apr 2026 08:41:35 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marek Vasut <marek.vasut@mailbox.org>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] firmware: arm_scmi: Miscellaneous improvements
Date: Fri,  3 Apr 2026 10:41:28 +0200
Message-ID: <cover.1775205358.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series contains miscellaneous improvements for SCMI quirk
handling and SCMI instance iteration.

Thanks for your comments!

Geert Uytterhoeven (3):
  firmware: arm_scmi: quirk: Improve quirk range parsing
  firmware: arm_scmi: quirk: Simplify quirk table iteration
  firmware: arm_scmi: Convert to list_for_each_entry()

 drivers/firmware/arm_scmi/driver.c |  4 +---
 drivers/firmware/arm_scmi/quirks.c | 15 ++++++---------
 2 files changed, 7 insertions(+), 12 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
