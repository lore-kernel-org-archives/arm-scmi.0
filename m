Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D3E4071C1
	for <arm-scmi@vger.kernel.org>; Wed,  8 Jul 2026 09:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783501230; cv=none; b=XzdkZE5vQVoycSpVOKH7D/Sd11Xl41Et30OBk60dwgzvtoueMjHouaOzwj1c1cZ+RhzrBFoA4n0kvjE2auO19WCTGvxfohD5A9f/o21CqAq5rPnv7T3A11G5k9xd/Rwz7i+hnrQV0gG45ApYGr5zpJpXqucuohpNa9ITJlIEPJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783501230; c=relaxed/simple;
	bh=K6Oj4Aqzfi3NfF15USpblwgoREXy/WTglmQJ9eGSSAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NYD07no72wPOo8MKmWngDBQaqP2wRnWRMuuBjgcoM4ackbFv9KAvte1NW4eQzwLjzj+o+ey3qWLl0tbs24ts0phFBDDGw6i1JpNJhPSVM/dmyAwAr44ozxS8wYCvUYRjnx1AVfjs3KWOuOd0WLk4zRfznSV7ApViPgUOQxSJOZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DYO5PSoO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DYO5PSoO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 571AA1F00A3A;
	Wed,  8 Jul 2026 09:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783501228;
	bh=LaHq5X9Zzq1V8bTMYdngc/5HmEjTHXhZR+fLehkk3MI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DYO5PSoOmdlYhDfj9SlzlrtZsFMxeLXZRYLZD/kuVDK3wh7LEjhzJYJJL+hwK6y8e
	 9bsQtBgrgB+YVTgnmSEOuDGPLyDEesOglx6KdQX0kxJ3S6MijArN8Uy+kPaJqwmOwN
	 niRRbWInIv3u+KTTOk85mfVxWbQP3bBwSMWgaQ9k4n667HZY8Eq1XNi5J3+pHApvKq
	 K0YR4oYycyIcDn3+p1rTTE4JQIGjZWIPZtCgR/9J+QUZQy2mnyg7T02eODQTqXCBW+
	 DztFJ63FgBcCXOvrNGpeTlbHs5aACd4F1Ea4e3sQ7jYk2HJSkvqQPZZM+0UlXMJFhl
	 MYRlmqTuXu4+w==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 08 Jul 2026 10:00:00 +0100
Subject: [PATCH v4 04/16] firmware: arm_scmi: Free transport channel on IDR
 failure
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-scmi_core_fixes-v4-4-53142cd60b63@kernel.org>
References: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
In-Reply-To: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
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
index 0a8a1d9de008..9428c0777899 100644
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

