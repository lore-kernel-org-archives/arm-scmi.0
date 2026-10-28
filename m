Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793192708;
	b=S9sW6a9fbVw2g1fU7z/2CirJPJe1snSSBNfAED2+HpnxES6SnvtVA5L5fsBpgOUYTFHn
	 e8cKU8PCB5ZgDiPluzkU1IMButCUNJQEvSnKM0c6p7RyJN0RgMq8vuh54CN3zMPzxw6a9
	 UUKNrHeNAevG0hqDG4O2LhaYUDsxVUKpLHmHs70wurzRs3xVXECcBSJOCOC+yJhDQq/mJ
	 +CKZmVZ0YCHU1E81dvgZx5XaoBLPeOH1GWqZBaRo9aW5xulHVOkmgrgg8l+MvzAI50cI/
	 74mHqzPLeRAOlstJqADoWSYYQWyn6Q09CtyfI73d/zAOpFEXMHGjgum4ycYNbMAWVvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793192708;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=466VYmHKB4yRhX0BdQY8Bw/8WoRDHBthhMiUqk6SuvQ=;
	b=L63rbDmO9vVIGveUDgoOXghfZnYOyWlXWxzLT6XpVhKcSdpusjDb5EctmbXr2PHZlNfU
	 db3QOlfaYrKFgXbyUN5SuzNHl/wweG4kpJO/JQAZSRzbeZZKM21/eyOz/Pk9PW5lrDBdH
	 p+5XQVZ+tmWYDjtjW03Jkv+lt/6j8GFDUzXIXV63V+gPc1hdzMUf0P5BacxZX7YH8HgB/
	 vUUw6eW3OGejJlIS8eilP19OKQwE07YDnv5cyjwOAMJl9nDEnIEkFHxyj5/ycF/R09kUv
	 ozF938HBdleRoH/Hn3VowEvDByO5kxLSsLufVo+KEsDXcYSq+oUehZKjuwTMLT3WVwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hv47h6cS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BB1606A31A
	for <arm-scmi@vger.kernel.org>; Wed, 28 Oct 2026 13:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hv47h6cS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D54BD1F01825;
	Wed, 28 Oct 2026 13:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793192708;
	bh=466VYmHKB4yRhX0BdQY8Bw/8WoRDHBthhMiUqk6SuvQ=;
	h=From:To:Cc:Subject:Date;
	b=Hv47h6cSFoOFTKVNUfvyXo6OoMM4x+ou39H0yS6bPHu8oFzUTkmoqlYGayQ/SsYD0
	 W1DCe+GXn55oVnejZqqWynjdjs/FJT/6CBFkSJRuWQuFq/YNHKM8ht2A4Smuab9HZn
	 WNNCPyP6rkbpTMVMuP/g7asOT9If7q41Xlh0m+9LmxkzPB9dFodMBq663rR/7y9LUr
	 J/KHKqKY9eJqObJlPTAhWzfIuSFVYnmt6XfDMJXoag3aOuCl1xaqrlg7kBGzqTMt/l
	 JyQ0LxNKH7OS/aL1Cao8y25JjvJGOE9lEgjG0qQK44uLKFUnHTF8KX+2h7dRoyfLrz
	 pH3zieOgsCcXw==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Peng Fan <peng.fan@nxp.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH 1/3] firmware: arm_scmi: imx: Track copied syslog words
Date: Wed, 28 Oct 2026 13:05:00 +0000
Message-ID: <20261028130502.2999676-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
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

The MISC syslog iterator records the number of returned words plus
firmware-reported remaining words in the caller's size output.

The debugfs consumer uses that value to dump its fixed-size buffer. A
malformed or inconsistent response can therefore make it read beyond
the copied data and allocation.

Return the accumulated number of words copied into the caller's buffer
instead. The generic iterator bounds this count to the initial buffer
capacity before processing each response.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-c3c9437c-ba1a-4db6-837f-cb0950d89018
Fixes: 4fa62e80c7db ("firmware: arm_scmi: imx: Support getting syslog of MISC protocol")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
index 637973fb45e6..0c708b2dd496 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
@@ -438,7 +438,7 @@ static int iter_misc_syslog_update_state(struct scmi_iterator_state *st,
 
 	st->num_returned = RETURNED(r->numlogflags);
 	st->num_remaining = REMAINING(r->numlogflags);
-	*p->size = st->num_returned + st->num_remaining;
+	*p->size = st->desc_index + st->num_returned;
 
 	return 0;
 }
-- 
2.43.0

