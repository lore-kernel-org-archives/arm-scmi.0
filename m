Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 497D2381AEA;
	Thu,  5 Mar 2026 13:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772716235; cv=none; b=nGSOZbqZn6VnhgzWJNAFOCHc44ZjVH9knCkNQ5Iu+u2cqq1OGCr9lfeAv8EWOp2kX1uNuv9VcIQlHJg9JuG60/hhR8IITakcMCnHGApdRJ7mqt00G1aA/zUXSEeoHPfWdOjR7UHaF2q78e6mAApQVLV4PG6ed7xT54bue08nVO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772716235; c=relaxed/simple;
	bh=zJODDf9o9RslR5ho8uE5KVqklUx8VG5jybKuhCDqIeI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UBaYfDyFU8yzgqIPFV87H0qz0jDNC+AQZUToINSofhL6Iw4ilS0bQxaPr8SdSdxLFzGUgEPNOUlDCQdx6sUXKWWAMksJw6POahEVD6K0De3Np20xD+Xbuh6Ohz6bA0ASYAMThYFDgxKXqfCIwlYq6MH6TE2Hk4wfmPfHPOqbK2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FFA8339;
	Thu,  5 Mar 2026 05:10:26 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 452B93F836;
	Thu,  5 Mar 2026 05:10:28 -0800 (PST)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	philip.radford@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH] firmware: arm_scmi: Fix NULL dereference on notify error path
Date: Thu,  5 Mar 2026 13:10:11 +0000
Message-ID: <20260305131011.541444-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit b5daf93b809d1 ("firmware: arm_scmi: Avoid notifier
registration for unsupported events") the call chains leading to the helper
__scmi_event_handler_get_ops expect an ERR_PTR to be returned on failure to
get an handler for the requested event key, while the current helper can
still return a NULL when no handler could be found or created.

Fix by forcing an ERR_PTR return value when the handler reference is NULL.

Fixes: b5daf93b809d1 ("firmware: arm_scmi: Avoid notifier registration for unsupported events")
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/notify.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
index 9168794adae4..40ec184eedae 100644
--- a/drivers/firmware/arm_scmi/notify.c
+++ b/drivers/firmware/arm_scmi/notify.c
@@ -1066,7 +1066,7 @@ static int scmi_register_event_handler(struct scmi_notify_instance *ni,
  * since at creation time we usually want to have all setup and ready before
  * events really start flowing.
  *
- * Return: A properly refcounted handler on Success, NULL on Failure
+ * Return: A properly refcounted handler on Success, ERR_PTR on Failure
  */
 static inline struct scmi_event_handler *
 __scmi_event_handler_get_ops(struct scmi_notify_instance *ni,
@@ -1113,7 +1113,7 @@ __scmi_event_handler_get_ops(struct scmi_notify_instance *ni,
 	}
 	mutex_unlock(&ni->pending_mtx);
 
-	return hndl;
+	return hndl ?: ERR_PTR(-ENODEV);
 }
 
 static struct scmi_event_handler *
-- 
2.53.0

