Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9C61C4EDF
	for <arm-scmi@vger.kernel.org>; Tue, 27 Aug 2024 14:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724769525; cv=none; b=pAYpP8aGLHvy7KO4kJk4cjn8VYPPnY61zqtobH6vJFTnLoMRYAs421jI/WKnDU0EC+7CovqZYhet/brPJBQgR0nM04T9JN2x8st1iGi8yv9lwX7j+r0CbzcSiNZq2nkAVRNZD7TD0n7iqhFu7aBER/+oCbl5JMgJzrEqR9hTBjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724769525; c=relaxed/simple;
	bh=c4shmB+RijZY6/LKnHin9jnzSBRUzZGmvE0MmLpvP58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lADZQGE6m+5Y74yiPFgdsms3if8dU+bDLnZdYGS8Z1AAsK0yDQlpl1TZXDFvjZcysUCz63GLqQUYy/Y0Zriy3jfq+0XTwYBTn6k5XwQeKc1/382L6YtA9VOg+owFm3RE8BnPsfRWJLjqThTXzgjbgaSCURftQ5F++W9QsAbgrps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 581301424;
	Tue, 27 Aug 2024 07:39:09 -0700 (PDT)
Received: from usa.arm.com (e107155-lin.cambridge.arm.com [10.1.198.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8A6773F66E;
	Tue, 27 Aug 2024 07:38:42 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: arm-scmi@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 3/3] firmware: arm_scmi: Replace comma with the semicolon
Date: Tue, 27 Aug 2024 15:38:38 +0100
Message-ID: <20240827143838.1465913-4-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240827143838.1465913-1-sudeep.holla@arm.com>
References: <20240827143838.1465913-1-sudeep.holla@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the typo comma with the semicolon. No functional change.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_scmi/base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/base.c b/drivers/firmware/arm_scmi/base.c
index d52873523cd2..86b376c50a13 100644
--- a/drivers/firmware/arm_scmi/base.c
+++ b/drivers/firmware/arm_scmi/base.c
@@ -384,7 +384,7 @@ static int scmi_base_protocol_init(const struct scmi_protocol_handle *ph)
 	if (ret)
 		return ret;
 
-	rev->major_ver = PROTOCOL_REV_MAJOR(version),
+	rev->major_ver = PROTOCOL_REV_MAJOR(version);
 	rev->minor_ver = PROTOCOL_REV_MINOR(version);
 	ph->set_priv(ph, rev, version);
 
-- 
2.46.0

