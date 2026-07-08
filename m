Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EE13E63A4
	for <arm-scmi@vger.kernel.org>; Wed,  8 Jul 2026 09:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783501232; cv=none; b=cRKB2RJpv2c1FyWGoh3PUB1R2QeF3Y4KYGvkJuzIhlZ0mDmQzMn0MnMZQwmujtOMbrCBJcQCbk+OpzXeIHx5f7ayxP7ceQRfcynTCQqg1txegtOuMKV71du6eJAwky2MbQUbOYSpyeGLjZIliGNAop96OBs9/wIRrB/dpcYbWsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783501232; c=relaxed/simple;
	bh=LcTmTuYXk7fm0nFHokjpyVhph0prdQQGKpukNsqzrgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WcxpCzOw3jJNwgBHj7I5J2oMvRnvfY5tFgxbchX10cpcRju1kOCKmXj2LOVjhajBrpZTgK7QPviy8VbpA7ACT/iZ6tsZJMORabQiT0zBKwcxYn+rRl9+WKSaj3pCbcWHdTDonPPt5Gp32tRqfPt6hl2by7ka8xvKYLQf0EF4FwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fbfI+/v8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fbfI+/v8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BCB11F00A3D;
	Wed,  8 Jul 2026 09:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783501231;
	bh=qfr7ZZKY7R0Q0fpXvMzQrwETE6t9nlZGm9NBFjMImJA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fbfI+/v8X0xielvI1RsXQ1n5XyY+6FHzeH85+L7HbQJqEtLURu8BrYFRmaTrcMcA9
	 c2bwM7L6mFunuay0XQRUg728UHhWb5bJ7bt9kx9amYn0zNsPVdWqVTLqsvD1xTIcJf
	 805VtogtJ862AoL/1hGAw6DrnuXlRM9Af8UsGe8hg8PupiTZBG/Yssx4iLy0+82xCH
	 ptXNkgKzzg3VptCYACv/NFvfBmpNX/sewiP+YaMHNhtUUjXjOJ9rTWyFw7Cp+g49Rw
	 tjLnLpDtvwCWh/HsUtn8kMRE5sNqdEIbuKvNf40j8+dydPsCiWZ0aOQD8TTO9yE8Fq
	 QrAx9COJvHIPg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 08 Jul 2026 10:00:03 +0100
Subject: [PATCH v4 07/16] firmware: arm_scmi: Use channel ID for transport
 teardown
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-scmi_core_fixes-v4-7-53142cd60b63@kernel.org>
References: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
In-Reply-To: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

SCMI protocols can share the BASE transport channel when firmware does
not describe a dedicated channel for the protocol. In that case multiple
IDR entries can point at the same scmi_chan_info, whose owning transport
device was created with cinfo->id.

scmi_chan_destroy() used the IDR iterator key when destroying the
transport device. If an alias entry is visited before the owning channel
entry, the lookup can miss the device because the iterator key does not
match the protocol ID used when the transport device was created. The
code then clears cinfo->dev, so the later owning entry skips teardown and
leaks the transport device.

Destroy the transport device using cinfo->id, which is the protocol ID
that owns the channel and was used when creating the transport device.

Fixes: 05a2801d8b90 ("firmware: arm_scmi: Use dedicated devices to initialize channels")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 8c4a3036ae43..41f1b2c49521 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2896,7 +2896,7 @@ static int scmi_chan_destroy(int id, void *p, void *data)
 		struct scmi_device *sdev = to_scmi_dev(cinfo->dev);
 
 		of_node_put(cinfo->dev->of_node);
-		scmi_device_destroy(info->dev, id, sdev->name);
+		scmi_device_destroy(info->dev, cinfo->id, sdev->name);
 		cinfo->dev = NULL;
 	}
 

-- 
2.43.0

