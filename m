Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108D54266BF;
	Tue, 20 Jan 2026 12:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768911310; cv=none; b=MZNJEzPjMpO2mzYjL8U3MS5x9ZDmaHOLbdhH1GDf+XhH3tNT9m59CfhXxDGcK4c/nnemzla2bp2ULKsFjR35pRMNVtI32NgD8T0dDMDMBX76uPN0yqZsTPODEPRrY7dA7Seucq08iZRLsW3p0zch9VWZW8XEqz+mpAj/HS6O+6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768911310; c=relaxed/simple;
	bh=ZmBDPdflrwlSIeYk3/Ms4Wt4lAKU0iixasdKi/524SU=;
	h=Message-ID:From:Date:Subject:MIME-Version:Content-Type:To:Cc; b=DMe62Xo638eCVkeU13Q/e43mmSgy0wKa04+u9SmrjdTkdcAT/VWgIK5ZF2auKlUdsjI1hjF0SSU8+HRXxnTK+F1t4ob9NfpnR/5DgiezGxzNhi1H9vZ2Bw1NOopzDBXPFSfBch+4zfzej1Ag5ILYAtIr9iIdojb9Nw+xawK1vsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=GXDjm9Bk; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="GXDjm9Bk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1768911297; bh=4kKJyyNGMP+zZQgr44uk/UpbP1kT96tBOF82npRgiOE=;
	h=From:Date:Subject:To:Cc;
	b=GXDjm9BkkqwZdC1/vOVGeIa7UWWD3xKGolAt3sG0ilq/CaCobG6j0wJFUnkZritPo
	 YW6QM38wCCQbheNHlRQGWvPprYTj2j0LDOAoo8pmiRyrazbe8i9m6gw/TAaNuim+/1
	 1GgXetMBTqoRe7TQFIk/9+tLRTUCFykA2EJsoAqo=
Received: from junjungu-PC.localdomain ([223.166.246.160])
	by newxmesmtplogicsvrszc41-0.qq.com (NewEsmtp) with SMTP
	id 3B790A03; Tue, 20 Jan 2026 20:14:55 +0800
X-QQ-mid: xmsmtpt1768911295tl1p7gjwg
Message-ID: <tencent_845B889AF1A932F1347EE0C09F350E491009@qq.com>
X-QQ-XMAILINFO: MokxBf7CFy2KAZPKfaaGhz/6Xh0dnUhP3Nyksr8QXxFWkw7mWbmbeeWX1DjU5n
	 6u6m3cH3zf+WM3wDSkRpo0MO5m4ERgUG5z9YbS+8o6cH19oMV+e2KmS6kPhQvktv5lcBV4jAQyoO
	 ZzH8ABOn4Bcn0gB376orX84cmJnv4XsxmChNiOoMMwnG2g887Y4pbhtK0vOiudmwBpN/cS+jMCEB
	 b6bkMiEc1gnbODfTv3FQXRE/KmhQksqXAzeZqDys7rJlvR1kBU13buYfYmZTNpvu3UGFqsTG7SFq
	 MB3NR2qoC91LvZ+yPfvgIe1fycnqNySfRDRtodHAFZ3R2a3TAlHCKWmNKQYobndILPVxst5aFAeh
	 TZZ0a4gIyO5JRQ/iOd8e8J5j9oLdCf4jXtqEu0Gp2zwOx5QcSUnT9ovoWafwoEIG86MiXKjkKyFN
	 SV7o6jmQuQPVFrZSm8rdCyr6t8t9FvQ+3gwOKZLbMwwjATOnDmhdPwkO+hBJXn8veB2F5B3C//lX
	 TZ6JerwxoymRK7WwPnz7EUNLq8zxDsqc/evo/D6vK/GRcOEtZerr3UsnUkXUuH40DQKk8KqQ5SKZ
	 ch4YMDtIvXLxORa8P0wf3xI1UrnFEL6Px58N7wY9u0vgsKMeOP5s3bHkQdDFTp5cZ6iTmOr0a/tU
	 RB0W8xIA9EOEXqcRmKPlkixK32eXBbPRH4y3Ymtlt0591RYIhAFKVClkaCIoDrOsgv3OmjgdiSlf
	 Z8L5j803aGJ7FJCEDdSegrvI99YFkWt7drjJJyPkiV3qHCtPhsZV2XIPbyAyGLw6siRAlwl6YE0U
	 GfXTKGyVjW9Xhulbc4Mp9YQsziNXq5QGWDgpKxS7pOvvIB3vvQawXKWfY3z1tpSUiQGHQ0MUzmn+
	 K58+uAx4E7snUI53bwwJYys1csHZLuwZbktAHyfTJ7PVzLb5aBeAOEQovXOjv4uJKhZEfj72j7I2
	 aq3sY/pFaHwub5PIn1S6gsJhV0NM7Ni5Ooh2SsO0TGuK7ZN/ejO3rPM+mz7a28NdXP3Zv1zKASuc
	 hgu1S8qszFqTST4dQvjMqNxvX/VFMuKYsEyHanMwSDNFo/D3+t5S/0ifE+7qBG7b6bNIsPCzq8pE
	 j1mQY2OwLQmH869PbNMVbUyDDLz0bhf3DhPgGZJ0V6wQRbFpE41c7AVrDSTXi04lchoNbTToSIaj
	 QlgU/ZKzCA2+yCAozAE+zN24nI
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Felix Gu <gu_0233@qq.com>
Date: Tue, 20 Jan 2026 20:14:55 +0800
Subject: [PATCH] firmware: arm_scpi: Fix device_node reference leak in
 scpi_probe()
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <20260120-arm_scpi_of_node-v1-1-0e4273d026a8@qq.com>
X-B4-Tracking: v=1; b=H4sIAL5xb2kC/x3MQQqAIBBA0avErBPMRWZXiRAbx5pFGgoRSHdPW
 r7F/xUKZaYCc1ch082FU2wY+g7wcHEnwb4ZlFSjHJQULp+24MU2BRuTJ4HO6G2cvMZgoGVXpsD
 Pv1zW9/0AlW5F+GIAAAA=
X-Change-ID: 20260120-arm_scpi_of_node-ca97b68d7cf9
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Felix Gu <gu_0233@qq.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768911296; l=1613;
 i=gu_0233@qq.com; h=from:subject:message-id;
 bh=ZmBDPdflrwlSIeYk3/Ms4Wt4lAKU0iixasdKi/524SU=;
 b=iKlKg8ef//jKIjJiE6xYTajpj4O7LjcJYnGXxl1w86RqMJia3Lr6ck/fKPJhXkPiASR6OFmRV
 XxKfbG697eHC9hEr5igviaHJEgerLkKHyz/rWMvbIURlGwzdFwjvdhv
X-Developer-Key: i=gu_0233@qq.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

In scpi_probe(), if of_match_node() fails and the function returns
early, the shmem reference is not released.
Use __free(device_node) scope-based cleanup to automatically release
the reference when the variable goes out of scope.

Fixes: ed7ecb883901 ("firmware: arm_scpi: Add compatibility checks for shmem node")
Signed-off-by: Felix Gu <gu_0233@qq.com>
---
 drivers/firmware/arm_scpi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scpi.c b/drivers/firmware/arm_scpi.c
index 87c323de17b9..6bf999a6ccf5 100644
--- a/drivers/firmware/arm_scpi.c
+++ b/drivers/firmware/arm_scpi.c
@@ -18,6 +18,7 @@
 
 #include <linux/bitmap.h>
 #include <linux/bitfield.h>
+#include <linux/clean.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/export.h>
@@ -940,13 +941,13 @@ static int scpi_probe(struct platform_device *pdev)
 		int idx = scpi_drvinfo->num_chans;
 		struct scpi_chan *pchan = scpi_drvinfo->channels + idx;
 		struct mbox_client *cl = &pchan->cl;
-		struct device_node *shmem = of_parse_phandle(np, "shmem", idx);
+		struct device_node *shmem __free(device_node) =
+			of_parse_phandle(np, "shmem", idx);
 
 		if (!of_match_node(shmem_of_match, shmem))
 			return -ENXIO;
 
 		ret = of_address_to_resource(shmem, 0, &res);
-		of_node_put(shmem);
 		if (ret) {
 			dev_err(dev, "failed to get SCPI payload mem resource\n");
 			return ret;

---
base-commit: d08c85ac8894995d4b0d8fb48d2f6a3e53cd79ab
change-id: 20260120-arm_scpi_of_node-ca97b68d7cf9

Best regards,
-- 
Felix Gu <gu_0233@qq.com>

