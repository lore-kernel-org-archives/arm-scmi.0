Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781E8331A66
	for <arm-scmi@vger.kernel.org>; Fri, 20 Feb 2026 09:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771581323; cv=none; b=mvdIGwAJ+CsOxcn8QMuAM4UTY8fd+8th9dmODUaT20CNXp+B/8RycazHjc9/pqEtzjiKiwl6HGL0Ut+fwCbQiNzpcrZNL9WZOPHRvSiylBffXQ+uGGS9c+Bq2P8AYPZdyD6bKm2iS5+kdCd+8hMyim2wxU+z3s6R2/TigrjEBDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771581323; c=relaxed/simple;
	bh=bE3CXU5CT2TAjGkFruDLECyxzw1SWUQVgJIZhFl8h3g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hwXKdMJCgsnrGbTuopDURcTaCidQ/ieU1JjQ0/IlRfeB+4YcAR4c64b4LKNfdze3ByJi2ju+aa6ZGSmPY0z51MswU4vQAndTkASDMmp5jg5X6e6paI/ZhqYE9sPvHTURE47zXGLb2felLpxMaYNSuhSUYFkEhCOg3XIkLEGWXzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E202FC116C6;
	Fri, 20 Feb 2026 09:55:21 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] firmware: arm_scmi: Spelling s/mulit/multi/, s/currenly/currently/
Date: Fri, 20 Feb 2026 10:55:15 +0100
Message-ID: <6735401861e0c2f3e5e680533cd6f71c4d6fd5eb.1771581270.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix misspellings of "multi" and "currently".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/firmware/arm_scmi/protocols.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
index 4c75970326e655de..f51245aca2594c75 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -189,13 +189,13 @@ struct scmi_protocol_handle {
 
 /**
  * struct scmi_iterator_state  - Iterator current state descriptor
- * @desc_index: Starting index for the current mulit-part request.
+ * @desc_index: Starting index for the current multi-part request.
  * @num_returned: Number of returned items in the last multi-part reply.
  * @num_remaining: Number of remaining items in the multi-part message.
  * @max_resources: Maximum acceptable number of items, configured by the caller
  *		   depending on the underlying resources that it is querying.
  * @loop_idx: The iterator loop index in the current multi-part reply.
- * @rx_len: Size in bytes of the currenly processed message; it can be used by
+ * @rx_len: Size in bytes of the currently processed message; it can be used by
  *	    the user of the iterator to verify a reply size.
  * @priv: Optional pointer to some additional state-related private data setup
  *	  by the caller during the iterations.
-- 
2.43.0

