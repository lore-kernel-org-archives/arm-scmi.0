Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192FA391E73;
	Wed,  9 Sep 2026 17:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788976751; cv=none; b=sxAGjm9Lk0TRdt3GdN1NKWHSM12vQPUA+h0VBtDaaxg57j0CB30bBtEeHzroA6WhM89shjamnDMx0TbRe+RmZvIFERvmkGad5TTcOQ/eZhidBEhwDsJcCSrzcc8pROASE6i5DRsGEH0TPHbvaFTEVco9vyph1S8RTfm9xQU2ma0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788976751; c=relaxed/simple;
	bh=4AM56rD9hN/SAlGLp7GCl7Y7VkmJRIVVTN9ljls5IRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DhQo2f4mpc/G0HzxshtvEfqxC9x8vWQEhYKjVTCG+XDMIDq2j+pY652rPvMSsC3UUMW29J5VQqv8DT2SfWJLUKQdOHLB0lYlqZ2d1t5GjK0Vk0+SLWXJxXOkPhOHBlR3mOBMcppWWPaYD4kE57UB2iZbFji1mrDt+gvE07FXCVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NSFs1sEU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NSFs1sEU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81E78C2BCB9;
	Wed,  9 Sep 2026 17:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788976750;
	bh=4AM56rD9hN/SAlGLp7GCl7Y7VkmJRIVVTN9ljls5IRQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=NSFs1sEUbO9vGsEbWNuEqlMwWS67qVkN55s+HN9wJpUFdecuWU78uSQerJRBzBQeV
	 SvVF/Y/jw4sp1Hmvwq7aeLXJrli+oQSFo0nfHaZtK6KmcimSWUIILIyVzLjsglqlz2
	 XcCAY4/jsTT7TRtiterd+RugtOJD1rPCbaWjQRwA2yHWsrVtR7+x0YjAaD0a0MdfSa
	 XILOI3JGBvNW8KctIn6DQh+W1K61GHDZJ94zJZv0ZQs2w7Xw4fx8MUNJyPQ4hyuZg2
	 uAobWzk/l8sOsFBdtk1d6jTtUSIgAfrqEsTO6ymh1xKYAVV7bZElSongADyklN0Rvk
	 3gLHiesl3oSMA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F13AC79FB7;
	Wed,  9 Sep 2026 17:59:10 +0000 (UTC)
From: Roland Dreier via B4 Relay <devnull+rolanddreier.rivian.com@kernel.org>
Date: Wed, 09 Sep 2026 17:58:59 +0000
Subject: [PATCH] firmware: arm_scmi: Fix error path leak in
 scmi_raw_message_send()
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-scmi-raw-v1-1-de3fa75d2c6f@rivian.com>
X-B4-Tracking: v=1; b=H4sIAGKeoWoC/yXM3QpAQBCG4VvRHNsahLgVOVhrllF+2vFXcu8Wh
 0+933eBkGMSKIMLHO0sPE8eURiA6fXUkeLWG2KMMyywUGJGVk4fCq1NLDWpxjwBny+OLJ/fVVX
 /lq0ZyKzvHu77AWfXCqhsAAAA
X-Change-ID: 20260909-scmi-raw-0ff3feb5a073
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Roland Dreier <rolanddreier@rivian.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788976750; l=1401;
 i=rolanddreier@rivian.com; s=20260814; h=from:subject:message-id;
 bh=ulhzZqaSwBOt3awtuXWQe6D8VST705i7vhwvE1JyWas=;
 b=JKBsDDq4LGcT0kglXB6DsxiCDeXT92Dxot3q04+qCvF0saYsODSHs0CU+wFYqxRjYsAICdNWr
 ICITTR1FohHBDKI+3eDcOAyowR2GrTj861j+uevgLJs0L0jabq16Qmt
X-Developer-Key: i=rolanddreier@rivian.com; a=ed25519;
 pk=C7SBXsDIlarq7BpINqyDL67XV/AGNqNt09NCCpFcExk=
X-Endpoint-Received: by B4 Relay for rolanddreier@rivian.com/20260814 with
 auth_id=952
X-Original-From: Roland Dreier <rolanddreier@rivian.com>
Reply-To: rolanddreier@rivian.com

From: Roland Dreier <rolanddreier@rivian.com>

When the is_transport_polling_capable() check fails in scmi_raw_message_send(),
it returns -EINVAL without doing scmi_xfer_raw_put(), which will leak a
struct scmi_xfer.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260909-scmi-async-done-race-v2-0-cc5dec25c6be%40rivian.com
Fixes: 07cb8c324b63 ("firmware: arm_scmi: Add polling support to raw mode")
Signed-off-by: Roland Dreier <rolanddreier@rivian.com>
---
Sashiko pointed out this pre-existing bug when reviewing my patchset:
https://sashiko.dev/#/patchset/20260909-scmi-async-done-race-v2-0-cc5dec25c6be%40rivian.com

Fix is trivial so sending it out.
---
 drivers/firmware/arm_scmi/raw_mode.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/arm_scmi/raw_mode.c b/drivers/firmware/arm_scmi/raw_mode.c
index 1f6e51670208..279fee7c6ce9 100644
--- a/drivers/firmware/arm_scmi/raw_mode.c
+++ b/drivers/firmware/arm_scmi/raw_mode.c
@@ -694,6 +694,7 @@ static int scmi_raw_message_send(struct scmi_raw_mode_info *raw,
 		} else {
 			dev_err(raw->handle->dev,
 				"Failed to send RAW message - Polling NOT supported\n");
+			scmi_xfer_raw_put(raw->handle, xfer);
 			return -EINVAL;
 		}
 	}

---
base-commit: 893e11787f78e43b534e252249ac3fff4d1333f8
change-id: 20260909-scmi-raw-0ff3feb5a073

Best regards,
--  
Roland Dreier <rolanddreier@rivian.com>


