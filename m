Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313BA3C140D;
	Mon, 23 Mar 2026 16:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774284984; cv=none; b=r1l3SBEjvDSNLCKw5AV01MGZM6jufHrWJbak5WMJ0crVSygSZ8/PXxWX3ETqGKreg/9/Uh4zSUjTt7MHoqzYtpz4AKp8PxvMrLjkRMJKKL4tzU9Fcj8nUhW4U2bDzld1gw8GePR7wYGyDAhKSApIxxtZ2ihE0CBh53zceqxmLnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774284984; c=relaxed/simple;
	bh=DlrDh0sXfpGleGJNkZAVP/G29Qv4UHj2GZJhraYhhAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h1XkJ6UByA19cfSXOLmIBU/caHuLCueygOn+rloB+S8JhXC830pSmTthJ7ofDHxKxwir0IE33hAkWl/XnQk7fFPdCkfiW9wMNLztz3VDQVnS0Bpt4OVHdYLcNQwHz9JC7C4M0aSBHEscnDrb7IUql26cDQLuj0mMo0NZI38aSTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FFF9C2BC9E;
	Mon, 23 Mar 2026 16:56:22 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] firmware: arm_scmi: Use proper iter_response_bound_cleanup() name
Date: Mon, 23 Mar 2026 17:56:12 +0100
Message-ID: <fab03f9edfad16c8bba8072874055d1872919498.1774283748.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1774283748.git.geert+renesas@glider.be>
References: <cover.1774283748.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The documentation speaks of the "iter_response_bound_cleanup()" protocol
helper, while the actual helper is called "iter_response_cleanup()".
Settle on the former name, because the helper is only needed when using
bound-iterators.

Fixes: 13289addf5a52e1f ("firmware: arm_scmi: Add bound iterators support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/firmware/arm_scmi/clock.c     | 2 +-
 drivers/firmware/arm_scmi/driver.c    | 6 +++---
 drivers/firmware/arm_scmi/protocols.h | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index 623dbc2f1e09303d..0205b37d219a88ed 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -604,7 +604,7 @@ scmi_clock_describe_rates_get_lazy(const struct scmi_protocol_handle *ph,
 	}
 
 out:
-	ph->hops->iter_response_cleanup(iter);
+	ph->hops->iter_response_bound_cleanup(iter);
 
 	return ret;
 }
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 03fd7caa8b42a12c..bfcc3e3c931dc9cc 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1875,7 +1875,7 @@ static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *en
 	return 0;
 }
 
-static void scmi_iterator_cleanup(void *iter)
+static void scmi_iterator_bound_cleanup(void *iter)
 {
 	struct scmi_iterator *i = iter;
 
@@ -1888,7 +1888,7 @@ static int scmi_iterator_run(void *iter)
 	int ret;
 
 	ret = __scmi_iterator_run(iter, NULL, NULL);
-	scmi_iterator_cleanup(iter);
+	scmi_iterator_bound_cleanup(iter);
 
 	return ret;
 }
@@ -2078,7 +2078,7 @@ static const struct scmi_proto_helpers_ops helpers_ops = {
 	.iter_response_init = scmi_iterator_init,
 	.iter_response_run = scmi_iterator_run,
 	.iter_response_run_bound = scmi_iterator_run_bound,
-	.iter_response_cleanup = scmi_iterator_cleanup,
+	.iter_response_bound_cleanup = scmi_iterator_bound_cleanup,
 	.protocol_msg_check = scmi_protocol_msg_check,
 	.fastchannel_init = scmi_common_fastchannel_init,
 	.fastchannel_db_ring = scmi_common_fastchannel_db_ring,
diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
index e2ef604c16ef6771..15ad5162e37a90ec 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -286,7 +286,7 @@ struct scmi_proto_helpers_ops {
 	int (*iter_response_run)(void *iter);
 	int (*iter_response_run_bound)(void *iter,
 				       unsigned int *start, unsigned int *end);
-	void (*iter_response_cleanup)(void *iter);
+	void (*iter_response_bound_cleanup)(void *iter);
 	int (*protocol_msg_check)(const struct scmi_protocol_handle *ph,
 				  u32 message_id, u32 *attributes);
 	void (*fastchannel_init)(const struct scmi_protocol_handle *ph,
-- 
2.43.0

