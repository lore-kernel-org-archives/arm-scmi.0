Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201528;
	b=4JH1UbkTNL4VYQyIvClXv98FB3aKyPHrglbXSAhTvESFjodnV/Kzwc8tcT6R74Bjoyxr
	 tr1e5Lr4fW4D0zn3FETroLyikdiyOtwgQbqB0f+rvvzuTKRlJzDVcCdJfW85/roXyH7cE
	 jGxGAliMnlNqEctmlWQYJAkOIrjCVUx39HN/3cPLTNeacLWy2GaB7yPgEW8SY0dYTldPr
	 Ykt1n2wLsQGbYjko2pBmLQjLDhCsl0d7OD/yo/2peFjtwCUFiWMoiHt9OZz11sZFnO1bm
	 vW4h+nareNsypKlgmFde28vba+UezuZbgoonGtEI9CAxNpVM6TCQlRNRq29cLwVZAag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201528;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zPK9LILFjexdlBU3mSIOr4yYqwU8LVdHM+h1yrkhU1c=;
	b=Z9CxrUx4hn9StGn1CnyEKvDvEMwvyTkVbF2ZgHNLO/mAQcdb8C0yL5pFmbmQkKM0sS5/
	 gtJZ3BgtRYQlzNkUFmcVn9ljlcmaOv8yQ9J8HIJID4ywloK8Tf3WApG2RZoi6lVtYuB7M
	 0YrjXQazXJgOoMqpCza6Vsp8dAIv/0oJKxwugDNYfl2bx3+ijYMQSf9yUHj0N52MNWPjT
	 n6QXgKL9y3EsnR3elBtN0TchXQxfxksTwUsgj/ICHnCamWRDLIVWIsfQY67Og8zrfjmKs
	 JxOuXOmCHzItsZbNbKxnQ/nNjX8NvwYz74LBVdRJjq3msc5Afqr7rmtXGK2dN6FDWqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ekheVcs7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BA0606A327
	for <arm-scmi@vger.kernel.org>; Wed, 28 Oct 2026 15:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ekheVcs7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 528F81F031E0;
	Wed, 28 Oct 2026 15:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793201527;
	bh=zPK9LILFjexdlBU3mSIOr4yYqwU8LVdHM+h1yrkhU1c=;
	h=From:To:Cc:Subject:Date;
	b=ekheVcs7bw78LgWdCQwxnl1nbpH7CZ5C7bAOCNHoIPezAN9z60XZ1U7IjtEGMYmn/
	 hHm5rnXk8GGrtwgqWZ8YpSgVKYwdjRpqY4nnzQ6As/GqiV1+vGANs5jlbMMf5z7kPt
	 jcJNeMYtOm6LlQCbu4fMBSA1Hemj8qe66Iw1Wm9z27xkJkLFTTeE9Npe1X0UvYaytn
	 fUDvQRqWAxSMZgjwcfHWCCnCxdVyTI3qIFrQpaBLN3OJ9MEUc3CwsIqoHClZFDdokF
	 7l5RdXIRdGodPvkACkqCRd2XSIjiWGHM9BtTsArBwf+A4OdxDyT/XHy982JjTNvtHx
	 gG28OkqBj6ZQg==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] firmware: arm_scmi: Free mailbox state on mapping failure
Date: Wed, 28 Oct 2026 15:32:03 +0000
Message-ID: <20261028153203.3305067-1-sudeep.holla@kernel.org>
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

mailbox_chan_setup() allocates its private state from the SCMI base
device before mapping the shared-memory area. If mapping fails while
setting up an optional RX channel, the core ignores the RX failure and
keeps the base device bound, retaining that devres allocation.

Release the private mailbox state before returning the mapping error.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-fda9bcb5-8255-4157-bbf7-d720bbd86605
Fixes: 1ebc28e9357c ("firmware: arm_scmi: Introduce setup_shmem_iomap")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/transports/mailbox.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index 56af2cb0f424..49c472e2ba27 100644
--- a/drivers/firmware/arm_scmi/transports/mailbox.c
+++ b/drivers/firmware/arm_scmi/transports/mailbox.c
@@ -206,8 +206,11 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 
 	smbox->shmem = core->shmem->setup_iomap(cinfo, dev, tx, NULL,
 						&smbox->io_ops);
-	if (IS_ERR(smbox->shmem))
-		return PTR_ERR(smbox->shmem);
+	if (IS_ERR(smbox->shmem)) {
+		ret = PTR_ERR(smbox->shmem);
+		devm_kfree(dev, smbox);
+		return ret;
+	}
 
 	cl = &smbox->cl;
 	cl->dev = cdev;
-- 
2.43.0

