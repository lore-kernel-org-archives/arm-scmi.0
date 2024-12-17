Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9B818035
	for <arm-scmi@vger.kernel.org>; Tue, 17 Dec 2024 02:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734402691; cv=none; b=DZWVuxC9RtEFYgbw8mxkhUciW5zkJUNrB1LGDxBiP4/Ope8DQ4qSSo6ts7lblJM6TYxwEZ5Zn61obdMwu9iE9c3T1HoMnaKnGS3iZI945oBOozMBO/7muOWs0fD3Pi/fCZ7BUEUoTjB1r3dE3Eo091+mItPIGVegIeqGhi/oTVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734402691; c=relaxed/simple;
	bh=qwyookh0BU9GcNGzlgLJnvTp/xwxtwdzDCpadFRYUTk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZgZ2NoD7Xo1XKhNw30gPrnMMglRh1N1BoOBaxYuPqLYsNLgiyrwcKzSmmzstsbVopEZB4yUxLw4Vpjgu4w5LZcqUzA/C9wpVuINul+8zB2yFoI/2ZFmHMg8wWeg379632ibc0Zb4WyU7dAFSEjH0tmKzGDh/q/aYc2qWWeqPgW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=kqRmxd6S; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="kqRmxd6S"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2166022c5caso37473685ad.2
        for <arm-scmi@vger.kernel.org>; Mon, 16 Dec 2024 18:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1734402689; x=1735007489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bNCDP1e4WclbM1wJ769hYfuCxyfyGdZAG0VazgbZDSE=;
        b=kqRmxd6SeW6SUyKJJjI2aCs0Fl5W6t2hFFz1Y8YarQAS4zpm64bymFA/5nl2/tI7Mx
         cK4EndI1kXfPMUL971H2qM2a/xdMv/eqxiB9u4dGqJd2WVdHI/8ge6VjBXiOd1emcpBO
         x92+SHLPEVYB+64bfsc0jl/QOr9TVZGIp2j5PVRah6tBxPatvGRlQJzPOe5JZpVpbTK7
         32RvcLJD2WRcRTy6Q/c9FIp4jmE2Ilqi62MbVjORP2m5/nKgIpR0OFXYC9PNutKNg7Hn
         iALgP1EZ0pNEWdr5/bqkhir0E2+VA4x2YHWvbgTVWcD9p+unlqyUj62wr3SqDhOCPUVw
         pjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734402689; x=1735007489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bNCDP1e4WclbM1wJ769hYfuCxyfyGdZAG0VazgbZDSE=;
        b=E9K4In6Co5kWg/cDvCOpTIW6CYUgPBkC0sutnd96WH3ss8x3u4+HjHgFxVVF6tRxdQ
         tqnb8F53fyQ+3xFmEfcguxbvzSYJtpIR9igds2I4V1NrmeMkxCwKwbU6GQf1eGErpJhc
         MJtfNgljlTGBreFRWGFw7YFmWbvSCIeLpQ/P5IqwIG+AsPWkIVzpRzhbqOoP4ZSEFNc2
         5tum0pTF1nrTqe4LH3KxvxCbjXurZXHa4xPU5HBI0pAqVdFnhb1cNp2jSxmrbYxfx/Tl
         C+sS0/muUzXBnH5xZrdufI4LgJ0/zM/abv/1rtNTRIxTjxvkM0TgQGUCqkIQWMVGhFuq
         P7zg==
X-Gm-Message-State: AOJu0YwG5pLgXN1AiSAFOy/0QyH7k06jbyakdhfS8OnBzcla2X+isEl4
	Bew/Mvn2U0VMzq2Nh/hV8qdI7YseMnBCuSzTkCFtHHv90duXjjoz9NKQ2eZptjk=
X-Gm-Gg: ASbGncsdWn5f+dn/ezu56HIkADiQYzS62YnknG8a9yLP2T43yMUc0Guo8xjKbcw1btE
	KQPpG3FYWkagjcp/S2TS0GLpffBd2SC27QV7pi5X3eKctDDfPs8TeWa40zDyCpNkHsPn9p4Fejm
	yX6VpIo4Pd6gaO+mJX1IytXd8WEPfml2FnrNLz314ECXiWXg7ocIfYFOUbU0icA9kx1ghoouY2m
	YhmZelRW24XOfe90jWsIskwUKALCuKcsN16BDv/7J9tyLQATn/tO0aaZG02rceEw4P8mHhhuLMs
	Oy1E
X-Google-Smtp-Source: AGHT+IEm245nhvyaf5SjknhTo8Pi5hecbs50p2ulkBjB6Loo3wampo5G9NOf9g4Gaz1dZPoG5MzE5w==
X-Received: by 2002:a17:902:f648:b0:216:554a:2127 with SMTP id d9443c01a7336-21892a5871emr219365535ad.41.1734402688856;
        Mon, 16 Dec 2024 18:31:28 -0800 (PST)
Received: from localhost.localdomain ([2001:f70:39c0:3a00:fdbb:f275:7572:b1a3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e54062sm47927555ad.124.2024.12.16.18.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 18:31:28 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: sudeep.holla@arm.com,
	cristian.marussi@arm.com
Cc: arm-scmi@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] firmware: arm_scmi: fix an OF node reference leak in scmi_txrx_setup()
Date: Tue, 17 Dec 2024 11:31:22 +0900
Message-Id: <20241217023122.3927401-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

scmi_txrx_setup() calls scmi_chan_setup(), which increments the refcount
of the given OF node. When the Rx channel setup fails with ENOMEM,
scmi_chan_setup() returns the error, but does not release the OF node
obtained in the Tx channel setup. Thus, add an of_node_put() call when
the Rx setup fails with ENOMEM.

This bug was found by an experimental static analysis tool that I am
developing.

Fixes: be9ba1f7f9e0 ("firmware: arm_scmi: Make Rx chan_setup fail on memory errors")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/firmware/arm_scmi/driver.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 1b5fb2c4ce86..5d8f877d75f3 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2700,7 +2700,9 @@ scmi_txrx_setup(struct scmi_info *info, struct device_node *of_node,
 	if (!ret) {
 		/* Rx is optional, report only memory errors */
 		ret = scmi_chan_setup(info, of_node, prot_id, false);
-		if (ret && ret != -ENOMEM)
+		if (ret == -ENOMEM)
+			of_node_put(of_node);
+		else if (ret)
 			ret = 0;
 	}
 
-- 
2.34.1

