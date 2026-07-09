Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78133407CD8
	for <arm-scmi@vger.kernel.org>; Thu,  9 Jul 2026 08:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587184; cv=none; b=Fbh4RRuoc0/1xKSl2yoPpq1PR0MelXLp4nZdPgqxKYRMyxS1C7RhZKJ0o0VXq2bVGxZibZBeXoSZr0xfMSICjaygh5eLjjchKh0FZIqDtLja66vYSPm0qHYTPXZM5MweeW9RlmFkCwW/LGD7VbIhXxy//kmew9cDbmnBjFBdDto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587184; c=relaxed/simple;
	bh=+PkPx7XpyQjAxrxcHWeYkt4SQ9G9LJivOD/qN9jkqdA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H5bioON6TeUuFjRg8Z7HHLgB1fN8JOrUr4YuAZyVcGVWV0KtMVxium2jxwlwK22iZa43YSK8j+lnclfCznLivM7eIfxT92uTfwaP04eZSH/JvCrhw7syD67SFjWyPfvt0CPIO65EOA6/Jd9a/+QZTOmuFaoIXmiCUHZJ/wyzFq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eXJP+kPI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eXJP+kPI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A6A21F00A3F;
	Thu,  9 Jul 2026 08:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587183;
	bh=mocmJXDJEKnfV7oFOGPo60ihQF2vJnZdfE+jaX3B1Hc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=eXJP+kPI4CtBJw/qTVOgUW5IvmoxqP4mJLKlN+E/plyEFVhwtoBYf6rrdZT2s1eOS
	 YMvF8cO3Br/fZWAFuvjOg65zfO3KvlyyLElV3rsmwzUV8UpfdKREhqsy8LZC/TJiiD
	 nDJUX8/zTVsy/S2yFVHb+znuvBXXVuIZtNQlTI9RQY3CLV0ruwPsHJye8DMoefK3Gj
	 VEFB0ujBlmJwz9p0fJc4GJrbg8YXkBytszKoeTNQbKVcQuNm9wvA+E4URSAWfgWkz1
	 5oDUzWMR9Pe9NekkQddigOYio5wAFP4I4xM1+zNbarHLXOdvBnWrAYAu+8jxsQLkLM
	 GT1s/GGgvQ+mQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 09 Jul 2026 09:52:28 +0100
Subject: [PATCH v5 04/16] firmware: arm_scmi: Free transport channel on IDR
 failure
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-scmi_core_fixes-v5-4-bea6a3024f05@kernel.org>
References: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
In-Reply-To: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

If transport channel setup succeeds but the following IDR insertion fails,
the error path destroys the transport device and frees the channel info
without invoking the transport cleanup callback.

Call chan_free() before destroying the device so transport specific
resources such as IRQs, mailbox channels and mapped shared memory are
released consistently with the normal teardown path.

Fixes: 05a2801d8b90 ("firmware: arm_scmi: Use dedicated devices to initialize channels")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index ef41b377d3de..29c89aa4710b 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2808,6 +2808,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 			"unable to allocate SCMI idr slot err %d\n", ret);
 		/* Destroy channel and device only if created by this call. */
 		if (tdev) {
+			info->desc->ops->chan_free(prot_id, cinfo, idr);
 			of_node_put(of_node);
 			scmi_device_destroy(info->dev, prot_id, name);
 			devm_kfree(info->dev, cinfo);

-- 
2.43.0

