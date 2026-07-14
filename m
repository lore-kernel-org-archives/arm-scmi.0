Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBBE4483BA
	for <arm-scmi@vger.kernel.org>; Tue, 14 Jul 2026 12:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784033923; cv=none; b=URMV/KZ59Sfo9JQFPYUP6p/50LAm+PYjEBzjuoQzZuNtGmo7Ymo51Pk2JPR4ItFtah9AbBqK0I1tfOuWhlH0VbzN3TOV+oIYCBm5Dl2UbxHAlk801aXUmTAkn9wafdcjEfRvLotKsnu6DyE89ASVyncxYv53hi7FPGf8Sb7WKp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784033923; c=relaxed/simple;
	bh=Hs34ImQAwZEixzGHA0gI3X7shyBT+FsrnOrw7ggt7aI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uEr+9vOuKNeoL7qyQ3SsWeEfUoO5qQ38/0fgfKEIoAI0VqEfi0zdSTImT3Kx6wyYs/xZx7+irdNwnLHYfTpPA7WtDUwWXft7nfkdpXJoOEkJo8IW7sh7p2eacuF8IUM9wzlkwFgu4rS1VUpG4Y7/0OuBd5CqHIy/81Xdmxc2Qwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KuNZuvQs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KuNZuvQs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3116D1F00A3F;
	Tue, 14 Jul 2026 12:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784033922;
	bh=14nUfVk7WpJs/hCvB3XZsd3QLEa/91x42irJlD7Ode8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KuNZuvQslRF0GNpVdkbzXFSKbAgsntsUx50AO1b/vjR2WOMm3nKxh5h3NvSNcGKCh
	 Lg83fEWfmyQaOUEKZytSQmGbcVWb6sCPC/ca/acPuxChOjT2mfmeeY53HJzBoduYBg
	 Wj3EF1uBjv6xnnxTl6yyk3s2pnDC/m0suf0c8Xtqi/mvh1opDu/FHb2QFzRgbYZDqk
	 W8BGTAH/f7yBhv7xgc/Zc3EfzFcs+B09hzUvhnZZ8oo1e4zdOzpwmwPNNGESQa8Bki
	 d1ZFtgj67ryGRkdLnVPcgolp7rwaEiviRxONby+d2vvQ6uEGQB/8yhy9SB++gxcj/Q
	 OZI1BdjiAZyBg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 14 Jul 2026 13:56:24 +0100
Subject: [PATCH v6 05/16] firmware: arm_scmi: Free transport channel on IDR
 failure
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-scmi_core_fixes-v6-5-3afe499d46e3@kernel.org>
References: <20260714-scmi_core_fixes-v6-0-3afe499d46e3@kernel.org>
In-Reply-To: <20260714-scmi_core_fixes-v6-0-3afe499d46e3@kernel.org>
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
index d2af47d03b4b..6ee2152f6b01 100644
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

