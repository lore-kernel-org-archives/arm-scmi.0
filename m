Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4522481242
	for <arm-scmi@vger.kernel.org>; Wed, 21 Jan 2026 13:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769000910; cv=none; b=kp/19fBGCHnJY046P4AwuAiRvAxQxOaO9W5oLeoTnayYUnv29mviSapusMTBmjKuQu2Wi7QrPFh5FhqKrPQ7WWV6RDxQMar5eb0F8Uyf2BMD4QQXwbp1xD9WdyIDTjTC33dyBvnSlFXevRuWIRakVpZ3riiQk+k2I2jjzGPhiXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769000910; c=relaxed/simple;
	bh=WrpyBYrLRPsDYxS10ClCNybzyU3ZizE078W5ZmsR7jg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=K7PHSbfH3TMys/FCJUIFI5Y4VeVHjn8YaaFYlaiHZ7j0xlnRrPIuiNmwE+BUCQ/f6ZJWjbyF6QQw3uh9ud5hWAfTxmdkUvZ698RpSrytTPDzqjTRwYGCgHCXrPYJFgjOjb05aXhgYid4UDHViDiEH0pgDwYykkYt5BgMOB2FTrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P1RFNSfH; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P1RFNSfH"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-81f4c0e2b42so3424052b3a.1
        for <arm-scmi@vger.kernel.org>; Wed, 21 Jan 2026 05:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769000908; x=1769605708; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NMHqsnCQRyn8ggYcyKGe99xv1siVufF+RsMTHXZ7p+M=;
        b=P1RFNSfHQBv6LSvfnCxyYe88AbXk42OAYDt7zR51oiHvL9Now60Tb+Hv3c4P920/0H
         Q96ngRE6Uu5eo4hlndPfoMcSJvm3tGvqq5U9EO0v7w7CPLGPeXqCb79vEC9VCuzZXq/u
         P/ymei2g4ErroD9Woq5HyyM29PFSBbFX82P6awOcZlfXQ/uH3zss20yZA7JfPyp3h/MJ
         7fQpIIkrAIWgIcAv3DYlungmj5Bl9vYo2Hse2y4bW1syasCAR5E8TebUd+scOjbu4tOd
         qho02W2qrfCNX/W20AHEGqMHfPG8t3urNvJVp1yh0mx2tOPseWhC1aPshFWlUvOztr/U
         CiRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769000908; x=1769605708;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMHqsnCQRyn8ggYcyKGe99xv1siVufF+RsMTHXZ7p+M=;
        b=NCveDkUxD3xadibv592N8uktsZZclI5TOqVvV6/Fb1atjrLu9N0w2lve0aXtYOoSmQ
         8Bci8kwNgHCGCya3brqdmI9HtxkJJ5EO/5ikPwledb8ymeu+10KETQIZ1yIeDSGSu4jt
         ZOYzz0JqZvRkxrI5AXRfd7Ol0o17bpt1EJDTXfrYJqbHTOrHR02XjLf8bfUlZ7JbXjrE
         ALR4X4IpOjgWNtdWe8fPlDBzQYGox/b06Jcej7Z3kFufTZCMVMVgXb3wBmkWa6Uy00fO
         Rmfh40oXcnuyFATQA1bTfBwWV3OSOQXrQ/DBK+1dyhXtR298BGWgVcGlfmwEWWw86ikX
         OKIQ==
X-Gm-Message-State: AOJu0YyqgOf5lrgnrscHb3dC+YsCJDnPssoErQM3UTUsU7wZ67L47koj
	0KjWJsu77G/TIBhJnSxKdAYbEc8vdQxzFTSHRnK2pn5F0U0o81pVS/Cj
X-Gm-Gg: AZuq6aK8YCMTH2VLkC3A6rIUriKEUuhKeTFX+qe7+PYuq8OS93+kh5ORDerIbstgUAu
	y9EFLPYeiioLRKHUEofHR0cw/ic8+/81YWCxE2268WoNm55DM1qCHBsYMgdVskchFp0wNkkH9zI
	O5vga7NHR5r6Kk5JyXaurGWrMtlTyJhmmfd1RNfGDk4wJPre/t2TdR3kx+fpcs1NmJ1HIFI+QZS
	Em9Hd6eRigOtUl2zg8T3WBr0A2KZ/zvjc7GFz2/+LaDrP0ixsaMUxFDW2YZNq5JpKhZCmI9bRTn
	Ywc2CaH1vt9P64IRD57B34klQsdBYYh/KIwd3tFueAk3TQd/6AKLd5ozQ7Fb2qjvFj92I/UUfnq
	3roXneJYJ45Ou4vKfmZl+FwYgbtAvOVGdykT4sePl29iN7A7ZNJhsethwU/Cw4RrIbCjyQV31HI
	ADEbNGNBGds916fHMBl4OSXaDg
X-Received: by 2002:a05:6a00:1388:b0:81f:45ff:48b0 with SMTP id d2e1a72fcca58-81fe87db4d4mr4982900b3a.13.1769000907655;
        Wed, 21 Jan 2026 05:08:27 -0800 (PST)
Received: from junjungu-PC.localdomain ([188.253.124.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-821812a12aesm379876b3a.43.2026.01.21.05.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 05:08:27 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Wed, 21 Jan 2026 21:08:19 +0800
Subject: [PATCH v2] firmware: arm_scpi: Fix device_node reference leak in
 scpi_probe()
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-arm_scpi_2-v2-1-702d7fa84acb@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMLPcGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDQyND3cSi3Pji5ILMeCNdE5NUA4MkA+M0E1MzJaCGgqLUtMwKsGHRsbW
 1AKQF5cJcAAAA
X-Change-ID: 20260121-arm_scpi_2-44e00b03f456
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769000903; l=1791;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=WrpyBYrLRPsDYxS10ClCNybzyU3ZizE078W5ZmsR7jg=;
 b=Wuqb9gFAWeVQpz2me9m/Lf1notADMj2TBwywBe9OwE7Ku2k6ISfu734YtWAiG6v8tzEzBCnWd
 icQ+770y/XaB3ON8aHW9aomXLWuM1MOTxCfeV74szl+qFe/yw2Cu942
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

In scpi_probe(), if of_match_node() fails and the function returns
early, the shmem reference is not released.
Use __free(device_node) scope-based cleanup to automatically release
the reference when the variable goes out of scope.

Fixes: ed7ecb883901 ("firmware: arm_scpi: Add compatibility checks for shmem node")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v2:
- Fixed build failure reported by kernel test robot.
- Link to v1: https://lore.kernel.org/arm-scmi/tencent_845B889AF1A932F1347EE0C09F350E491009@qq.com/
---
 drivers/firmware/arm_scpi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scpi.c b/drivers/firmware/arm_scpi.c
index 87c323de17b9..398642cc25d9 100644
--- a/drivers/firmware/arm_scpi.c
+++ b/drivers/firmware/arm_scpi.c
@@ -18,6 +18,7 @@
 
 #include <linux/bitmap.h>
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
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
base-commit: 053966c344dbd346e71305f530e91ea77916189f
change-id: 20260121-arm_scpi_2-44e00b03f456

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>

