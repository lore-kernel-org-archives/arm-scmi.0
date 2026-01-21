Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCBD410D08
	for <arm-scmi@vger.kernel.org>; Wed, 21 Jan 2026 15:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769009539; cv=none; b=O/78MiEBdBPnSEtJ+xJjue9Yy1qHXYkmpGojFOynci0hrMDG9P51R4VYWIBUG2Rj7vbLapUxzkOh+8OOfWlH0Xk+cFrKT2KsgxuF0vSF+FBaeybBvYPQQ+XJo4rOlvsJAphuc/JJYuLTyaPf/xFu9KqDollgQrtzW7jKWYyRW2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769009539; c=relaxed/simple;
	bh=m5l9glzlQdkTaKfNaDnN8sFdatZLvmq6941LcITDeuc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=f0UMS3VD+/UG+kN8pROEGkWA2oVog6FRk+hJtJXFT4joIxuGGUsgRO8DxSjjqNxyIRANkbWmhu8vdUrNcqlFfEUKjChRF4mTHVFldnhG5wxkWfBsVMWSZ2/pM09BmDS+Bkghja5jb33ROskoQkso5y9kkiccRDYpjnOKOJIdty4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LAOvyqbt; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LAOvyqbt"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so7049315ad.2
        for <arm-scmi@vger.kernel.org>; Wed, 21 Jan 2026 07:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769009536; x=1769614336; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4W0ec4fQDJd2xOwnuzTfcy8ZaXM1RW26O37NMjr14ds=;
        b=LAOvyqbt8v7ivDE+p33TZrgRbwTEbuv36g+KhzmWrnLEfrTqxqkpCWgOaIH8x8hPD8
         qzwt2VxzGSJRalMLRfaMgMyXOnu7tKYfvVMeC5ySWzzeoDKvZIL8Q9g6WN4yQz9L6Oo/
         W/ejAPvCHq8o5RLTdFAqpjce+WlXSZArCHTUX48JcY1rJj25HoKhaiZwGWOyX+VGTI6U
         LEFcIdi3mX5osnQAqPdIR+S63tFeYWu9sGnazNcw2zPl9sOyZ3zi0XpxBxgpkCJRER7b
         7B0yHy8ccD4RC7LODBLweWL7zhBsq8fX2PugfqmcMuV0s0FZz7J1bQP260d9RdpxiwRT
         8KMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769009536; x=1769614336;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4W0ec4fQDJd2xOwnuzTfcy8ZaXM1RW26O37NMjr14ds=;
        b=GHm2CdZigb/kYQLsNcQbVZcQBJddHh55F+02xoiO1H0tr2E35miObrBXMVc6N1Crnq
         bfwioDET4e49N8ec0N/g/sK4E57EICFglNp7oVbqLib4DrdfTmQJ034tf4TZwbgx2KCx
         F/XLPryJWxbIJ1uBJQbQiyv9LT5/YsnAeUwrDxv5Z+FG0cHbx7N5Ibn/Xh79R5NdixST
         TrEwOSsboR8sazhYAEllxKZGWQA+jUDA5iqkEzzT/7/W0TMup799ODpKqjmtgBiOjjUB
         wpRvgzJrZWN22CPEHftfG9C8LcHbbFyS4LYXR2lqy/oOhDg+2T3UNW8EQgNLnDJQ7Il4
         Sqrw==
X-Gm-Message-State: AOJu0YxS+38v1eS7xNbckkUiMlRBCxhhqaHrlVihrKTcst0lG6gAkBAU
	DzukUYNelS22SykII5ZCCdUzzIzsUUh4hN1FxgzywWnXd0+I6FeojikS
X-Gm-Gg: AZuq6aJB3bW23i/PDHo0VGGg4dvTtWfyqMTrzXc4/PSHNHLkgSodXagKVswwegGMTDc
	gSbhEOGZ5S9Ig64wkeifhlw4hbgNc4XYjH9yFnIwGsDkJ/GUxUTce9BkT2P3hiPf/pieYoqbfNn
	Sbr+90VneZG99hp7OHYKKB/byq2TJ14u5U084VlkUdD69EGL8vL+I2LVQ4IKfx5Hr6r71y0Q7bR
	JahyTf25L/b+b0SzTGhoeVZj2UEX3Yxt2tikgCNPcBY5iHGmXkNhnI9A7ath88210K4DoVqC3Lp
	17LK3IG4x+2Qz4cEMhYgeWuVPskuWbpcrN//qTnjPharvQkFx7Z2UAwSrxYZAapOt5kayL53/BE
	Zpk2ks9P5FmC+vdpfTuGJuNz1wEnsNDXriJkm1YVyHOnLyd+jbn4C0J7qaST+ST2YeSfVVoxSTP
	jrfQ8k2ByC2skgYcvkL8f3zPZ+1hmf4Enl6mw=
X-Received: by 2002:a17:902:ce0c:b0:290:c516:8c53 with SMTP id d9443c01a7336-2a76b053c28mr47806965ad.40.1769009535555;
        Wed, 21 Jan 2026 07:32:15 -0800 (PST)
Received: from junjungu-PC.localdomain ([188.253.124.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193dd19asm159153125ad.59.2026.01.21.07.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 07:32:15 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Wed, 21 Jan 2026 23:32:06 +0800
Subject: [PATCH] cpufreq: scmi: Fix device_node reference leak in
 scmi_cpu_domain_id()
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-b4-scmi-cpufreq-v1-1-b0547210feac@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHXxcGkC/x3MQQqAIBBA0avErBtQE4WuEi3SpppFZkoRhHdPW
 r7F/y9kSkwZ+uaFRDdnPkKFbBvw2xRWQp6rQQllhFQSncbsd0YfryXRiUp3kzXWkNMeahUTLfz
 8x2Es5QPsgKfkYQAAAA==
X-Change-ID: 20260121-b4-scmi-cpufreq-243a7676eb4c
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769009530; l=941;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=m5l9glzlQdkTaKfNaDnN8sFdatZLvmq6941LcITDeuc=;
 b=cfXD1Y1geysfvUU65r8/VTNhJv8/QJBeT0RrlIICW84nj+GcFWUl8FvfztZPFGogJbIRG+qKI
 umusYR73874BWDNCOBLN0hBKLb15zKgVsa0K/kK8Qc8b5s84NGUZ2RF
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

When calling of_parse_phandle_with_args(), the caller is responsible
to call of_node_put() to release the reference of device node.
In scmi_cpu_domain_id(), it does not release the reference.

Fixes: e336baa4193e ("cpufreq: scmi: Prepare to move OF parsing of domain-id to cpufreq")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/cpufreq/scmi-cpufreq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
index e0e1756180b0..c7a3b038385b 100644
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -101,6 +101,7 @@ static int scmi_cpu_domain_id(struct device *cpu_dev)
 			return -EINVAL;
 	}
 
+	of_node_put(domain_id.np);
 	return domain_id.args[0];
 }
 

---
base-commit: 053966c344dbd346e71305f530e91ea77916189f
change-id: 20260121-b4-scmi-cpufreq-243a7676eb4c

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>

