Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09A34582D6;
	Fri,  2 Oct 2026 08:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.248.49.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790930513; cv=none; b=t9KNGvNtJA0DDssio2u3aYQDqcnvmHDA1/mabDVjB564SuFcOJAg3Mzj4OH97VukKbs9OzWcFyjJYpoTgU8mUGYGN3UGN90vqEbtUgJaCwbRUAZlUhA8Sz2FOCQ8l5IWyqtzlSrblfOz3HAb9JedgOXQCfFBZcFh4+5/aSxyWAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790930513; c=relaxed/simple;
	bh=sLxM+h7bov9cCihsDAWEHEmGAWGcxgPlwlThrTgDmBQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BphgfIAotiRXGmXUvnJYkvGpdXNucRIDW8jgOCmk5BwEhsJY0NBHnyB2EqJBc4q8ALAXBsvX/efbnGqXnDoTav8NfpmvBTKvA1nxJhzHO0WOgWLLxgBdO65jeKC6dAGgtnTTTK4spC7EO2P30KsjBpf743+sdKeKSGdIlErOouo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=socionext.com; spf=pass smtp.mailfrom=socionext.com; arc=none smtp.client-ip=202.248.49.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO iyokan3-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 02 Oct 2026 17:41:46 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
	by iyokan3-ex.css.socionext.com (Postfix) with ESMTP id C2BCB2091574;
	Fri,  2 Oct 2026 17:41:46 +0900 (JST)
Received: from kinkan3.css.socionext.com ([172.31.9.51]) by m-FILTER with ESMTP; Fri, 2 Oct 2026 17:41:46 +0900
Received: from plum.e01.socionext.com (unknown [10.212.245.39])
	by kinkan3.css.socionext.com (Postfix) with ESMTP id 13CE7175A;
	Fri,  2 Oct 2026 17:41:46 +0900 (JST)
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH] reset: scmi: Set the device for the reset controller
Date: Fri,  2 Oct 2026 17:41:42 +0900
Message-Id: <20261002084142.1570378-1-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SCMI reset driver does not set rcdev.dev when registering its reset
controller.

If rcdev.of_node is not available, the reset core tries to obtain
the firmware node from rcdev.dev. However, rcdev.dev is also NULL,
causing a NULL pointer dereference.

Set rcdev.dev to the SCMI device.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 drivers/reset/reset-scmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/reset/reset-scmi.c b/drivers/reset/reset-scmi.c
index 8be5743cc8fd..1523245f83ef 100644
--- a/drivers/reset/reset-scmi.c
+++ b/drivers/reset/reset-scmi.c
@@ -107,6 +107,7 @@ static int scmi_reset_probe(struct scmi_device *sdev)
 
 	data->rcdev.ops = &scmi_reset_ops;
 	data->rcdev.owner = THIS_MODULE;
+	data->rcdev.dev = dev;
 	data->rcdev.of_node = np;
 	data->rcdev.nr_resets = reset_ops->num_domains_get(ph);
 	data->ph = ph;
-- 
2.34.1

