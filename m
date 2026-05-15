Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC6A3E559F;
	Fri, 15 May 2026 09:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778839168; cv=none; b=QAVHBtQJWnV9e7FPk67i3Gql7zDM9lTk4GgZ2dQvuiCyLmLgwS7Z/aAx0KB2e2ckKujI3ZX52QXHwjqD2a+K+IarvT2kz0bEkn3K5cxrwsKyKSiNLzjIpSk7t73dUb1UcEdTX7D+eZ7dr9Udzne82xehwsvJQvF901aTr/Wc1+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778839168; c=relaxed/simple;
	bh=RZKorVLA/RcnDxeFyrfedwlLrZI6v+vBwlowopAZQJs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hnwpLab30PqYnzzdcPRKPgrRCXUPdk7YkFYnsMZLAQvu9LWjvmZzS92CJklDeTBjxEVvTgJJ/zhvuiYc2SQddRGNpuFwbO46GYiuEG5s8zZRBDdIdDRSkwufHwwC24aIfrTcgndnV89QHWqPqq5Maxj4AaTcGbOjSE3vWxVMl8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF8E6C2BCB0;
	Fri, 15 May 2026 09:59:26 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] firmware: arm_scmi: Fix OOB in scmi_power_name_get()
Date: Fri, 15 May 2026 11:59:15 +0200
Message-ID: <75caae28bdffb55199a0bc6cac5df112a966c608.1778838987.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

scmi_power_name_get() does not validate the domain number passed by the
external caller, which may lead to an out-of-bounds access.

Fix this by returning "unknown" for invalid domains, like
scmi_reset_name_get() does.

Fixes: 76a6550990e296a7 ("firmware: arm_scmi: add initial support for power protocol")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/firmware/arm_scmi/power.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/power.c b/drivers/firmware/arm_scmi/power.c
index 3aa84ceb6d2bab68..4a7215e02dec035d 100644
--- a/drivers/firmware/arm_scmi/power.c
+++ b/drivers/firmware/arm_scmi/power.c
@@ -204,8 +204,12 @@ scmi_power_name_get(const struct scmi_protocol_handle *ph,
 		    u32 domain)
 {
 	struct scmi_power_info *pi = ph->get_priv(ph);
-	struct power_dom_info *dom = pi->dom_info + domain;
+	struct power_dom_info *dom;
+
+	if (domain >= pi->num_domains)
+		return "unknown";
 
+	dom = pi->dom_info + domain;
 	return dom->name;
 }
 
-- 
2.43.0

