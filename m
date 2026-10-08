Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979A1348C63
	for <arm-scmi@vger.kernel.org>; Thu,  8 Oct 2026 19:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791486996; cv=none; b=Tp3j9QBy9uNU4OHZ02ZXy/KJ4GsxLl1g6K/uOxBEUmEwu2V3OOFtt+YMBBeh8SphGNKubFfV+wYkXOCMS2al7gybUbDcVczGdZ0GQtHgizGIIo4rISIUZvYg3NuQFEW1JUdNScpQXL7f0IPshu5Kgsm6bxkF7KnHN2q88km7pRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791486996; c=relaxed/simple;
	bh=+WHSoamXRbDoq/YDAuIq9G+oYpPUujkFGo80JKBKrF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G/8csT0urEC7Dqm/4KFg3A54uzT8hQpAgOBEbE92cj7b9LGpVZSUyE8oEIHOkp0PWhJNPyLExpjDdGQSzw8IygL3lHoHbGbUQcrNL3GWQvSBwTJspIKdoAEyNpANDGOwPBk2NCRMPue2r3nbU0pw4W7qzhU7ZavQu21qFIQsdvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=Ruu1qSLb; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="Ruu1qSLb"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3518cbe59b0so678337eec.0
        for <arm-scmi@vger.kernel.org>; Thu, 08 Oct 2026 12:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1791486994; x=1792091794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eRGzTN0NleWaTALyndg5Ju+cl2dvjR4CoVoX+HqyLZw=;
        b=Ruu1qSLb0J+8XEboTZsXiSF+kdBYtjRA1xfKZk5ksid33giDTAlIXqYXjJ/btJZAZ+
         G2qQ0bPZ2N3AYw+RLRRnk/Lva3IwktDefP7nNFYWBgGBiMHVBjD4VzEW/QgUEIyD8Qhj
         f6q+9c6QyK1uuYVg35vZQiAe8UVYRaW/H96f3a09P78s/5fs6XC2b6urRy5aqeVPm6VW
         +lebSuF8BYj0883KnSIolX/4d0eKNiUOp61TUtR9PI6IJ4ZobWVWJcDP60GDuGr9YXrk
         ibiwGpHkg8A4MFrJMWjlb80MBKyov7wcKSDfLVQM0fO6Fni+rh5wdwpxso3444mCB9vF
         HdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791486994; x=1792091794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eRGzTN0NleWaTALyndg5Ju+cl2dvjR4CoVoX+HqyLZw=;
        b=cHTWlPdWx73uBCbMWyiX3OaI3uAdjeFfh8jqzLLWh04/6xtN+SJWZ2gS07S4eYI5ps
         nX4kL+QI2p9bibBS0Hs5WvbGQj0zzwHcnCOZkXhXNl4Pwax4nv/9/sKgrEwtZeGgEszh
         R6oYsNLUyOFpmSy+Q/NPQDfugPySucy46lyjp1n8IyGZ5iaPvj5K7gzhsMp7ByX9RLOL
         H4WkMVT58Wr6jPtl4nUj1X5HkCqYNhSQvB3IOxKkEI90JVGbWFJ83+rUDzXBRs/kOj1B
         6QZE5bmZddPgvJm6kCkZo1tBKiEfTZtX9aUWTk0+xulrJLQaQvASqwpv6WxyjQwhuaYf
         W2Sg==
X-Forwarded-Encrypted: i=1; AKwUvBw9/IwM6lGdKcEocsnAdq9WVR/NQF8C2Fg6naXyVggGBe+gf/QAPShWIgHQab76QmFko2eJvBtUGw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLyLGqUu1otRcWQzCbHu2srbzGo7Ry3kWmSMgzk4v3J2fHABchf
	vufDYsJx4vgU8GhRZ5wWLmk0GbiFK2JuPJ4G9hm7DYRHVYB8ZwlllUljFYYidYVToK8=
X-Gm-Gg: AYBFou07vIqW69kVMdfjY7kqlR8jcLonCT0OfLpO/8jIqzw+Xv91KhSOekcRm0ykMSC
	jVj8Ou2k7PZ4Flt9GaEvYYoSaphqZsz/JvmCdwcp9gFg7f4uyD2Kg/iEZYodIvXAg1XhZFsGUnc
	XhkyIRDgvXVUG6oHwr15cBnWfLyAP5vlR6svke4FRkp0LbHkJRHGOFPem3zdeVrIvfOCx/BKS7m
	ouW6eQEynIxdW0dpsE12mrlOj1mV3RlRx3MWJdw8hdvxDI+yFLazqvM1iD04T2kBCXaSVtLI81L
	KrnQLLsWuI1uQdaNFztyV0N9I5eohDrtY1/7IeixXEM6//WnXJsqOJmi4PW3vDDAXpwLex1bPzB
	6ysVHZ8nrQjxOmhvv4fl86nQyX4ek0ZittFglsS9AlQVO+RJXm1P4rAacq6iS7+51RKejwKyQJ+
	Ij9QwWtRU4Z+GxicFMZ/RG732OsjNh1Ii+xUZzXsIWH4SLMgR6aTdL8wxHSXfynhcpPi9xzy7vc
	wBaipjosqJ+OaLc0bVf9i33t9M5p53ISfYVHOdxY/ggvkbxeWOOm3kuXTgKxkpbiveJzW5IU8tH
	LdWHwA==
X-Received: by 2002:a05:693c:87cd:20b0:353:5d7a:cabe with SMTP id 5a478bee46e88-3536c53930dmr345111eec.13.1791486993426;
        Thu, 08 Oct 2026 12:16:33 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:bc88:5ec1:4f8a:5b23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb5e9sm54053eec.20.2026.10.08.12.16.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 12:16:32 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Sashiko <sashiko-bot@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	viresh.kumar@linaro.org
Subject: [PATCH 6.6.y 1/2] firmware: arm_scmi: Publish channel state before callbacks
Date: Thu,  8 Oct 2026 15:16:20 -0400
Message-ID: <20261008191624.98532-2-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261008191624.98532-1-artem@trailofbits.com>
References: <20261008191624.98532-1-artem@trailofbits.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sudeep Holla <sudeep.holla@kernel.org>

[ Upstream commit 0314900dcdde044af0208fed212035dbfaa55843 ]

Transport setup can enable callbacks before the setup routine returns.
mailbox_chan_setup() registers the mailbox client with
mbox_request_channel(), and the mailbox controller startup path can enable
interrupt delivery before SCMI mailbox channel state has been published.
Similarly, smc_chan_setup() requests the optional A2P completion IRQ before
the SMC transport has made its cinfo pointer visible.

If a pending or spurious callback fires in those windows, the transport RX
callback can dereference a NULL transport cinfo pointer. Publishing only
the transport-private pointer is not sufficient either: an early callback
can enter the SCMI core before scmi_chan_setup() has assigned
cinfo->handle.
The core derives scmi_info from cinfo->handle in the RX path, so a NULL
handle can still fault even when the transport-private cinfo is valid.

Assign cinfo->handle before invoking the transport setup callback. Publish
the mailbox and SMC transport-private channel state before requesting the
mailbox channels or IRQ, and clear the early-published pointers again on
setup failure. Also unwind mailbox setup devres resources on failure so an
optional RX setup error that is ignored by the core does not leave stale
transport state behind.

[ Backport to 6.6.y: use the pre-transport-split file layout, omit newer
  SMC fields absent from this tree, and publish/clear the older mailbox
  and SMC channel state around callback registration. ]

Fixes: 5c8a47a5a91d ("firmware: arm_scmi: Make scmi core independent of the transport type")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://patch.msgid.link/20260714-scmi_core_fixes-v6-1-3afe499d46e3@kernel.org
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
This is patch 1 of 2 in the ordered 6.6.y backport series.
This change addresses CVE-2026-93093. Both SCMI setup paths can make
callbacks reachable before channel state is published; release/acquire
publication ordering prevents observers from seeing an incompletely
initialized channel.
This needed a target-specific adjustment; I called it out in the bracketed
backport note above.

The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not in 6.6.y.
This fix also affects 6.1.y, which will need a separate backport; this
submission contains only the 6.6.y patch.

 drivers/firmware/arm_scmi/driver.c  |  2 +-
 drivers/firmware/arm_scmi/mailbox.c | 18 +++++++++++++-----
 drivers/firmware/arm_scmi/smc.c     | 13 ++++++++-----
 3 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index d253e9d41d84..f99cfc49dfcd 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2449,6 +2449,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 
 	cinfo->id = prot_id;
 	cinfo->dev = &tdev->dev;
+	cinfo->handle = &info->handle;
 	ret = info->desc->ops->chan_setup(cinfo, info->dev, tx);
 	if (ret) {
 		of_node_put(of_node);
@@ -2482,7 +2483,6 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 		return ret;
 	}
 
-	cinfo->handle = &info->handle;
 	return 0;
 }
 
diff --git a/drivers/firmware/arm_scmi/mailbox.c b/drivers/firmware/arm_scmi/mailbox.c
index f1d5e3fba35e..80b67f46a4d1 100644
--- a/drivers/firmware/arm_scmi/mailbox.c
+++ b/drivers/firmware/arm_scmi/mailbox.c
@@ -211,13 +211,18 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 	cl->tx_block = false;
 	cl->knows_txdone = tx;
 
+	cinfo->transport_info = smbox;
+	smbox->cinfo = cinfo;
+	mutex_init(&smbox->chan_lock);
+
 	smbox->chan = mbox_request_channel(cl, tx ? 0 : p2a_chan);
 	if (IS_ERR(smbox->chan)) {
 		ret = PTR_ERR(smbox->chan);
+		smbox->chan = NULL;
 		if (ret != -EPROBE_DEFER)
 			dev_err(cdev,
 				"failed to request SCMI %s mailbox\n", desc);
-		return ret;
+		goto err_clear_cinfo;
 	}
 
 	/* Additional unidirectional channel for TX if needed */
@@ -231,11 +236,14 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 		}
 	}
 
-	cinfo->transport_info = smbox;
-	smbox->cinfo = cinfo;
-	mutex_init(&smbox->chan_lock);
-
 	return 0;
+
+err_clear_cinfo:
+	cinfo->transport_info = NULL;
+	smbox->cinfo = NULL;
+	devm_iounmap(dev, smbox->shmem);
+	devm_kfree(dev, smbox);
+	return ret;
 }
 
 static int mailbox_chan_free(int id, void *p, void *data)
diff --git a/drivers/firmware/arm_scmi/smc.c b/drivers/firmware/arm_scmi/smc.c
index 771797b6e268..fada68b8e15f 100644
--- a/drivers/firmware/arm_scmi/smc.c
+++ b/drivers/firmware/arm_scmi/smc.c
@@ -166,6 +166,12 @@ static int smc_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 		scmi_info->param_page = SHMEM_PAGE(res.start);
 		scmi_info->param_offset = SHMEM_OFFSET(res.start);
 	}
+
+	scmi_info->func_id = func_id;
+	scmi_info->cinfo = cinfo;
+	smc_channel_lock_init(scmi_info);
+	cinfo->transport_info = scmi_info;
+
 	/*
 	 * If there is an interrupt named "a2p", then the service and
 	 * completion of a message is signaled by an interrupt rather than by
@@ -177,17 +183,14 @@ static int smc_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 				  IRQF_NO_SUSPEND, dev_name(dev), scmi_info);
 		if (ret) {
 			dev_err(dev, "failed to setup SCMI smc irq\n");
+			cinfo->transport_info = NULL;
+			scmi_info->cinfo = NULL;
 			return ret;
 		}
 	} else {
 		cinfo->no_completion_irq = true;
 	}
 
-	scmi_info->func_id = func_id;
-	scmi_info->cinfo = cinfo;
-	smc_channel_lock_init(scmi_info);
-	cinfo->transport_info = scmi_info;
-
 	return 0;
 }
 
-- 
2.39.5

